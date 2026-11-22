package duskdream

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.ResourcePatchContext
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction35c
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction3rc
import com.android.tools.smali.dexlib2.iface.instruction.formats.Instruction35c
import com.android.tools.smali.dexlib2.iface.instruction.formats.Instruction3rc
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableMethodReference
import java.io.RandomAccessFile

internal const val EXT = "Lio/github/daydreamfix/ext/"
internal const val EXTENSION = "extensions/duskdream.mpe"

/** Every method [name] of [type], optionally only the ones with these parameters. */
internal fun BytecodePatchContext.methods(type: String, name: String, params: List<String>? = null): List<MutableMethod> {
    val cls = mutableClassDefByOrNull(type) ?: throw PatchException("$type not found. Unsupported app version?")
    val found = cls.methods.filter { m ->
        m.name == name && (params == null || m.parameterTypes.map { it.toString() } == params)
    }
    if (found.isEmpty()) throw PatchException("$type.$name$params not found. Unsupported app version?")
    return found
}

internal fun BytecodePatchContext.method(type: String, name: String, params: List<String> = emptyList()) =
    methods(type, name, params).single()

internal fun MutableMethod.returnConstant(value: Boolean) = addInstructions(
    0,
    """
        const/4 v0, ${if (value) "0x1" else "0x0"}
        return v0
    """.trimIndent()
)

internal fun MutableMethod.returnNothing() = addInstruction(0, "return-void")

internal fun MutableMethod.returnNull() = addInstructions(
    0,
    """
        const/4 v0, 0x0
        return-object v0
    """.trimIndent()
)

private fun wide(type: String) = type == "J" || type == "D"

private fun MutableMethod.isStatic() = AccessFlags.STATIC.isSet(accessFlags)

private fun MutableMethod.signature(): String =
    parameterTypes.joinToString("", "(", ")") + returnType

/** What a hook's extension method receives: `this` as Object, then the original parameters. */
private fun MutableMethod.extParams(): String =
    (if (isStatic()) "" else "Ljava/lang/Object;") + parameterTypes.joinToString("") { p ->
        val type = p.toString()
        // App classes are obfuscated, so the extension takes them as Object.
        val element = type.trimStart('[')
        if (element.length > 1 && !element.startsWith("Landroid/") && !element.startsWith("Ljava/")) {
            "Ljava/lang/Object;"
        } else type
    }

/**
 * Moves the method to `name$orig` and gives [name] a new body, with [locals] free registers below
 * the parameters. [body] gets the invoke of the original and the invoke of the extension.
 */
private fun MutableMethod.wrap(cls: MutableClass, locals: Int, body: (callOrig: String, args: String) -> String) {
    val inputs = parameterTypes.sumOf { (if (wide(it.toString())) 2 else 1).toInt() } + if (isStatic()) 0 else 1
    val originalName = name
    val originalFlags = accessFlags
    val keep = AccessFlags.STATIC.value or AccessFlags.SYNCHRONIZED.value or AccessFlags.DECLARED_SYNCHRONIZED.value
    val newFlags = originalFlags and AccessFlags.SYNCHRONIZED.value.inv() and AccessFlags.DECLARED_SYNCHRONIZED.value.inv()

    // The wrapper takes the annotations: event buses find their subscribers by them.
    val originalAnnotations = annotations.toSet()
    annotations.clear()

    cls.methods.remove(this)
    setName("$originalName\$orig")
    setAccessFlags((originalFlags and keep) or AccessFlags.PRIVATE.value)
    cls.methods.add(this)

    val wrapper = ImmutableMethod(
        definingClass, originalName, parameters, returnType, newFlags, originalAnnotations, null,
        MutableMethodImplementation(locals + inputs)
    ).toMutable()
    cls.methods.add(wrapper)

    val first = locals
    val last = locals + inputs - 1
    val args = if (inputs == 0) "{}" else "{v$first .. v$last}"
    val kind = if (isStatic()) "invoke-static/range" else "invoke-direct/range"
    wrapper.addInstructionsWithLabels(0, body("$kind $args, $definingClass->$name${signature()}", args))
}

/** Runs `boolean ext(this, args)` first; it returns true to skip the original. Void methods only. */
internal fun BytecodePatchContext.hookBefore(method: MutableMethod, ext: String) {
    require(method.returnType == "V")
    method.wrap(mutableClassDefBy(method.definingClass), 1) { callOrig, args ->
        val extArgs = method.extParams()
        """
            invoke-static/range $args, $EXT$ext($extArgs)Z
            move-result v0
            if-nez v0, :skip
            $callOrig
            :skip
            return-void
        """.trimIndent()
    }
}

/** Runs `void ext(this, args)` after the original. Only `void ext` is called, so the result passes through. */
internal fun BytecodePatchContext.hookAfter(method: MutableMethod, ext: String) {
    val ret = method.returnType
    val isWide = wide(ret)
    method.wrap(mutableClassDefBy(method.definingClass), 2) { callOrig, args ->
        val extArgs = method.extParams()
        val (move, give) = when {
            ret == "V" -> "" to "return-void"
            isWide -> "move-result-wide v0" to "return-wide v0"
            ret.startsWith("L") || ret.startsWith("[") -> "move-result-object v0" to "return-object v0"
            else -> "move-result v0" to "return v0"
        }
        """
            $callOrig
            $move
            invoke-static/range $args, $EXT$ext($extArgs)V
            $give
        """.trimIndent()
    }
}

/** Runs `void ext(result, this, args)` after the original, for an object-returning method. */
internal fun BytecodePatchContext.hookResult(method: MutableMethod, ext: String) {
    require(method.returnType.startsWith("L") || method.returnType.startsWith("["))
    method.wrap(mutableClassDefBy(method.definingClass), 2) { callOrig, args ->
        val extArgs = "Ljava/lang/Object;" + method.extParams()
        """
            $callOrig
            move-result-object v1
            invoke-static/range ${args.replace("{v2", "{v1")}, $EXT$ext($extArgs)V
            return-object v1
        """.trimIndent()
    }
}

/** Runs `Result ext(this, args)` first; a non-null result replaces the original call. */
internal fun BytecodePatchContext.hookOverride(method: MutableMethod, ext: String) {
    val ret = method.returnType
    require(ret.startsWith("Landroid/") || ret.startsWith("Ljava/"))
    method.wrap(mutableClassDefBy(method.definingClass), 2) { callOrig, args ->
        val extArgs = method.extParams()
        """
            invoke-static/range $args, $EXT$ext($extArgs)$ret
            move-result-object v0
            if-eqz v0, :original
            return-object v0
            :original
            $callOrig
            move-result-object v0
            return-object v0
        """.trimIndent()
    }
}

/** Replaces the body with a call to `ext(this, args)`; the extension reaches the original through `name$orig`. */
internal fun BytecodePatchContext.hookReplace(method: MutableMethod, ext: String, returnType: String = method.returnType) {
    val ret = method.returnType
    method.wrap(mutableClassDefBy(method.definingClass), 2) { _, args ->
        val extArgs = method.extParams()
        val finish = when {
            ret == "V" -> "return-void"
            wide(ret) -> "move-result-wide v0\nreturn-wide v0"
            ret.startsWith("L") || ret.startsWith("[") -> "move-result-object v0\nreturn-object v0"
            else -> "move-result v0\nreturn v0"
        }
        """
            invoke-static/range $args, $EXT$ext($extArgs)$returnType
            $finish
        """.trimIndent()
    }
}

/** Applies a framework call redirect: one target method, replaced by a static with `this` first. */
internal class Redirect(
    val classes: Set<String>?,
    val name: String,
    val params: List<String>,
    val ext: String,
    val extThis: String,
)

/**
 * Turns matching invoke-virtual / invoke-interface instructions into invoke-static on the extension,
 * with the same registers. With [Redirect.classes] null any defining class matches, which also
 * catches calls made through an app subclass such as `SomeActivity.setVrModeEnabled`.
 */
internal fun BytecodePatchContext.redirectCalls(redirects: List<Redirect>): Map<String, Int> {
    val counts = HashMap<String, Int>()
    val byName = redirects.groupBy { it.name }

    fun match(ref: MethodReference): Redirect? = byName[ref.name]?.firstOrNull { r ->
        (r.classes == null || ref.definingClass in r.classes) && ref.parameterTypes.map { it.toString() } == r.params
    }

    val targets = ArrayList<com.android.tools.smali.dexlib2.iface.ClassDef>()
    classDefForEach { cls ->
        if (cls.type.startsWith(EXT)) return@classDefForEach
        val hit = cls.methods.any { m ->
            m.implementation?.instructions?.any { i ->
                (i.opcode == Opcode.INVOKE_VIRTUAL || i.opcode == Opcode.INVOKE_INTERFACE ||
                    i.opcode == Opcode.INVOKE_VIRTUAL_RANGE || i.opcode == Opcode.INVOKE_INTERFACE_RANGE) &&
                    ((i as com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction).reference as? MethodReference)?.let(::match) != null
            } == true
        }
        if (hit) targets.add(cls)
    }

    targets.forEach { def ->
        mutableClassDefBy(def).methods.forEach methods@{ m ->
            val impl = m.implementation ?: return@methods
            impl.instructions.toList().forEachIndexed { index, i ->
                val range = i.opcode == Opcode.INVOKE_VIRTUAL_RANGE || i.opcode == Opcode.INVOKE_INTERFACE_RANGE
                if (!range && i.opcode != Opcode.INVOKE_VIRTUAL && i.opcode != Opcode.INVOKE_INTERFACE) return@forEachIndexed
                val ref = (i as com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction).reference as? MethodReference
                    ?: return@forEachIndexed
                val r = match(ref) ?: return@forEachIndexed
                val target = ImmutableMethodReference(
                    EXT.dropLast(0) + "Daydream;", r.ext, listOf(r.extThis) + r.params, ref.returnType
                )
                val replacement = if (range) {
                    val x = i as Instruction3rc
                    BuilderInstruction3rc(Opcode.INVOKE_STATIC_RANGE, x.startRegister, x.registerCount, target)
                } else {
                    val x = i as Instruction35c
                    BuilderInstruction35c(
                        Opcode.INVOKE_STATIC, x.registerCount,
                        x.registerC, x.registerD, x.registerE, x.registerF, x.registerG, target
                    )
                }
                impl.replaceInstruction(index, replacement)
                counts.merge(r.ext, 1, Int::plus)
            }
        }
    }
    return counts
}

// ── Framework calls every app needs ────────────────────────────────────────

private const val ACTIVITY = "Landroid/app/Activity;"
private const val COMPONENT = "Landroid/content/ComponentName;"

internal val FEATURE_REDIRECTS = listOf(
    Redirect(null, "hasSystemFeature", listOf("Ljava/lang/String;"), "hasSystemFeature", "Landroid/content/pm/PackageManager;"),
    Redirect(null, "hasSystemFeature", listOf("Ljava/lang/String;", "I"), "hasSystemFeature", "Landroid/content/pm/PackageManager;"),
    Redirect(null, "setVrModeEnabled", listOf("Z", COMPONENT), "setVrModeEnabled", ACTIVITY),
    Redirect(setOf("Landroid/os/Parcel;"), "readException", emptyList(), "readException", "Landroid/os/Parcel;"),
)

internal val SESSION_QUERY_REDIRECTS = listOf(
    Redirect(
        setOf("Landroid/content/ContentResolver;"), "query",
        listOf("Landroid/net/Uri;", "[Ljava/lang/String;", "Ljava/lang/String;", "[Ljava/lang/String;", "Ljava/lang/String;"),
        "query", "Landroid/content/ContentResolver;"
    ),
    Redirect(
        setOf("Landroid/content/ContentResolver;"), "query",
        listOf("Landroid/net/Uri;", "[Ljava/lang/String;", "Landroid/os/Bundle;", "Landroid/os/CancellationSignal;"),
        "query", "Landroid/content/ContentResolver;"
    ),
)

/** Registers the activity tracking first thing when the app starts. */
/** No drawing on the displayed buffer, see VrCore.swapMode. */
internal fun BytecodePatchContext.queueFrames() {
    method("Lcom/google/vr/ndk/base/GvrSurfaceView;", "setSwapMode", listOf("I")).addInstructions(
        0,
        """
            invoke-static {p1}, ${EXT}VrCore;->swapMode(I)I
            move-result p1
        """.trimIndent()
    )
}

internal fun BytecodePatchContext.hookApplication(type: String) {
    method(type, "onCreate").addInstructions(0, "invoke-static/range {p0 .. p0}, ${EXT}Daydream;->onApplicationCreate(Landroid/app/Application;)V")
}

// ── Native libraries ───────────────────────────────────────────────────────

/** One byte range of a native library, by file offset. */
internal class ByteEdit(val offset: Long, expected: String, replacement: String) {
    val expected: ByteArray = hex(expected)
    val replacement: ByteArray = hex(replacement)
    private fun hex(s: String) = ByteArray(s.length / 2) { s.substring(it * 2, it * 2 + 2).toInt(16).toByte() }
}

/**
 * Edits are verified all at once before any is written, so an unexpected library fails the patch
 * instead of leaving a half patched one. Only arm64 is patched, so the 32 bit libraries are dropped:
 * otherwise a device could load the unpatched ones.
 */
internal fun ResourcePatchContext.patchLibrary(path: String, edits: List<ByteEdit>) {
    val library = get(path)
    if (!library.isFile) throw PatchException("$path not found. Patch the arm64-v8a build of the app.")
    RandomAccessFile(library, "rw").use { file ->
        fun read(edit: ByteEdit) = ByteArray(edit.expected.size).also { file.seek(edit.offset); file.readFully(it) }
        edits.forEach { edit ->
            val found = read(edit)
            if (!found.contentEquals(edit.expected) && !found.contentEquals(edit.replacement)) {
                throw PatchException("Unexpected bytes at 0x%x in %s. Unsupported app version?".format(edit.offset, path))
            }
        }
        edits.forEach { edit ->
            file.seek(edit.offset)
            file.write(edit.replacement)
        }
    }
    delete("lib/armeabi-v7a/")
}

/**
 * These shaders require an extension that OpenGL ES 3 already includes. Mali refuses that, so
 * whatever uses them isn't drawn, but other drivers compile them as ES 2, where the line is needed.
 * "enable" only warns when the extension is absent. The trailing space keeps the file's layout.
 */
internal fun ResourcePatchContext.fixShaders(vararg paths: String) {
    val required = "#extension GL_OES_standard_derivatives : require".toByteArray(Charsets.US_ASCII)
    val optional = "#extension GL_OES_standard_derivatives : enable ".toByteArray(Charsets.US_ASCII)
    paths.forEach { path ->
        val file = get(path)
        if (!file.isFile) throw PatchException("$path not found. Unsupported app version?")
        val data = file.readBytes()
        var start = 0
        var found = false
        while (start <= data.size - required.size) {
            if (required.indices.all { data[start + it] == required[it] }) {
                optional.copyInto(data, start)
                found = true
            }
            start++
        }
        if (found) file.writeBytes(data)
    }
}
