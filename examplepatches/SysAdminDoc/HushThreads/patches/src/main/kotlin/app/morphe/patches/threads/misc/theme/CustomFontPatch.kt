/*
 * Copyright 2026 HushThreads contributors
 * https://github.com/SysAdminDoc/HushThreads
 *
 * Found by reading Threads 457's TypefaceRepository (2026-11-24).
 */
package app.morphe.patches.threads.misc.theme

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.string
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.patches.shared.misc.extension.EXTENSION_CLASS_DESCRIPTOR
import app.morphe.patches.threads.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.threads.misc.extension.THREADS_APPLICATION
import app.morphe.patches.threads.misc.extension.enableStatus
import app.morphe.patches.threads.misc.extension.invokeStaticAt
import app.morphe.patches.threads.misc.extension.requireStatusMethod
import app.morphe.patches.threads.misc.extension.threadsExtensionPatch
import app.morphe.patches.threads.misc.settings.EXTENSION_ROOT
import app.morphe.patches.threads.misc.settings.declaredInHierarchy
import app.morphe.patches.threads.misc.settings.settingsPatch
import app.morphe.util.ControlFlow
import app.morphe.util.getReference
import app.morphe.util.namedRegisters
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

internal const val CUSTOM_FONT_PATCH = "Custom font"
internal const val CUSTOM_FONT = "$EXTENSION_PACKAGE/theme/CustomFont;"
private const val TYPEFACE = "Landroid/graphics/Typeface;"
private const val STRING = "Ljava/lang/String;"

/** The trace section Threads' font repository opens around each font it loads. */
internal const val LOAD_TYPEFACE = "TypefaceRepository:load_typeface"

/** AndroidX ResourcesCompat's message for a font resource it can't load: the class that loads them holds it. */
internal const val FONT_RESOURCE = "Font resource ID #0x"

/** Threads' font repository's load: a Typeface from one font spec, inside the trace section. */
internal object TypefaceRepositoryFingerprint : Fingerprint(
    returnType = TYPEFACE, parameters = listOf("L"), filters = listOf(string(LOAD_TYPEFACE)),
)

/**
 * One of the repository's loads: the static [call], the register its typeface lands in ([result]),
 * the one still holding what it loaded by ([name]), and the extension method that sees it ([hook]).
 */
internal class FontLoad(val call: Int, val result: Int, val name: Int, val hook: String)

/**
 * Shows Threads' text in a font file the person picks (#28).
 *
 * Most of Threads' text never asks for a font itself: its theme names Android's sans-serif
 * families and the rest draws in Android's default. At the start of the application's onCreate,
 * right after the extension gets its context, the extension puts the picked font in Android's font
 * table and defaults by style for this process. Android won't let Typeface.DEFAULT, SANS_SERIF or
 * DEFAULT_BOLD change, so every read of them in Threads' code reads the extension's stand-in
 * instead, Android's own font until the extension puts the picked one there.
 *
 * Threads loads its own fonts through one repository method: by an asset file's name, an Android
 * family's name, or a font resource through AndroidX's ResourcesCompat. Right after each of those
 * three loads, the typeface goes to the extension with the name or resource it was loaded by, and
 * the extension's answer takes its place. The extension swaps text fonts only, and only while the
 * switch is on and a file is picked.
 *
 * Each load has to be the method's only one of its kind, keep its typeface, keep what it loaded by
 * in another register, and be something nothing jumps past, and onCreate has to set the context
 * once with nothing jumping past it. Anything else refuses before the first change.
 */
@Suppress("unused")
val customFontPatch = bytecodePatch(
    name = CUSTOM_FONT_PATCH,
    description = "Shows Threads' text in a font file you pick, a .ttf or .otf. Icons keep their own font. " +
        "Starts off. Turn it on and pick the file in HushThreads settings > Appearance, then restart Threads.",
) {
    category("Interface")
    dependsOn(settingsPatch)
    dependsOn(threadsExtensionPatch)
    compatibleWith(*AppCompatibilities.threads())

    execute {
        requireStatusMethod("customFont")
        val repository = TypefaceRepositoryFingerprint.method
        // Everything is found and checked before the first change.
        val loads = fontLoads(repository)
        val start = fontStart()
        val defaults = defaultReads()
        // Each read is swapped one for one, so no index anywhere moves.
        defaults.forEach { reads ->
            val method = mutableClassDefBy(reads.method.definingClass).methods.single {
                it.name == reads.method.name && it.returnType == reads.method.returnType &&
                    it.parameterTypes.map(Any::toString) == reads.method.parameterTypes.map(Any::toString)
            }
            reads.at.forEach { read ->
                method.replaceInstruction(read.index, "sget-object v${read.register}, $CUSTOM_FONT->${read.field}:$TYPEFACE")
            }
        }
        start.method.addInstruction(
            start.at,
            "invoke-static/range { p0 .. p0 }, $CUSTOM_FONT->onThreadsStart(Landroid/content/Context;)V",
        )
        // From the last up, so each index still names its call.
        loads.sortedByDescending { it.call }.forEach { load ->
            val at = load.call + 2
            repository.addInstructions(
                at,
                repository.invokeStaticAt(CUSTOM_FONT_PATCH, at, "$CUSTOM_FONT->${load.hook}", listOf(load.result, load.name)) +
                    "\nmove-result-object v${load.result}",
            )
        }
        enableStatus("customFont")
    }
}

/** Where the extension hands the application its context; the font goes in right after. */
internal const val SET_CONTEXT = "$EXTENSION_CLASS_DESCRIPTOR->setContext(Landroid/content/Context;)V"

/** The application's onCreate and the index right after the extension gets its context there. */
internal class FontStart(val method: MutableMethod, val at: Int)

/**
 * Where Android's font table is set up for Threads: the application's onCreate, right after the
 * extension patch hands the extension its context and before Threads' own startup. Android fills
 * the table before onCreate, so what goes in there stays for the whole run.
 */
internal fun BytecodePatchContext.fontStart(): FontStart {
    val onCreate = declaredInHierarchy(THREADS_APPLICATION, "onCreate")
    val body = onCreate.implementation?.instructions?.toList().orEmpty()
    val signature = "${onCreate.definingClass}->onCreate"
    val calls = body.indices.filter { body[it].getReference<MethodReference>()?.toString() == SET_CONTEXT }
    val call = calls.singleOrNull()
        ?: throw PatchException("$CUSTOM_FONT_PATCH: $signature sets the extension's context ${calls.size} times, not once")
    val at = call + 1
    val flow = ControlFlow.of(onCreate)
    if (body.indices.any { it != call && at in flow.normal[it] }) {
        throw PatchException("$CUSTOM_FONT_PATCH: $signature jumps to just after the extension gets its context")
    }
    return FontStart(onCreate, at)
}

/** Android's default fonts by field name, and the extension's field each read of one goes to. */
internal val ANDROID_DEFAULTS = mapOf(
    "DEFAULT" to "androidDefault",
    "SANS_SERIF" to "androidSansSerif",
    "DEFAULT_BOLD" to "androidDefaultBold",
)

/** A read of one of Android's default fonts: the instruction's [index], its [register], and the extension's [field]. */
internal class DefaultRead(val index: Int, val register: Int, val field: String)

/** A method of Threads' and its reads of Android's default fonts. */
internal class DefaultReads(val method: Method, val at: List<DefaultRead>)

/**
 * Every read of Typeface.DEFAULT, SANS_SERIF and DEFAULT_BOLD in Threads' code. Compose's font
 * resolver hands out Typeface.DEFAULT for text with no font family of its own, and Android 16
 * refuses a write to those static final fields, so the reads themselves have to move. The
 * extension's own reads stay. Threads with none at all is refused.
 */
internal fun BytecodePatchContext.defaultReads(): List<DefaultReads> {
    val own = classDefByOrNull(CUSTOM_FONT)?.fields?.toList().orEmpty()
    for (name in ANDROID_DEFAULTS.values) {
        if (own.none { it.name == name && it.type == TYPEFACE && AccessFlags.PUBLIC.isSet(it.accessFlags) && AccessFlags.STATIC.isSet(it.accessFlags) }) {
            throw PatchException("$CUSTOM_FONT_PATCH: the extension has no field $name to read in place of Android's default font")
        }
    }
    val fields = ANDROID_DEFAULTS.mapKeys { (name, _) -> "$TYPEFACE->$name:$TYPEFACE" }
    val found = mutableListOf<DefaultReads>()
    classDefForEach { classDef ->
        if (classDef.type.startsWith(EXTENSION_ROOT)) return@classDefForEach
        for (method in classDef.methods) {
            val body = method.implementation?.instructions ?: continue
            val reads = body.withIndex().mapNotNull { (index, instruction) ->
                if (instruction.opcode != Opcode.SGET_OBJECT) return@mapNotNull null
                val field = fields[instruction.getReference<FieldReference>()?.toString()] ?: return@mapNotNull null
                DefaultRead(index, (instruction as OneRegisterInstruction).registerA, field)
            }
            if (reads.isNotEmpty()) found += DefaultReads(method, reads)
        }
    }
    if (found.isEmpty()) throw PatchException("$CUSTOM_FONT_PATCH: Threads never reads Android's default font")
    return found
}

/** The repository's asset, Android family and resource loads, in that order. */
internal fun BytecodePatchContext.fontLoads(repository: Method): List<FontLoad> {
    val body = repository.implementation?.instructions?.toList().orEmpty()
    val signature = "${repository.definingClass}->${repository.name}"
    fun refuse(what: String): Nothing = throw PatchException("$CUSTOM_FONT_PATCH: $signature $what")
    val flow = ControlFlow.of(repository)

    fun load(what: String, hook: String, nameAt: Int, matches: (MethodReference) -> Boolean): FontLoad {
        val calls = body.indices.filter { index ->
            (body[index].opcode == Opcode.INVOKE_STATIC || body[index].opcode == Opcode.INVOKE_STATIC_RANGE) &&
                body[index].getReference<MethodReference>()?.let(matches) == true
        }
        val call = calls.singleOrNull() ?: refuse("loads ${calls.size} $what fonts, not 1")
        val move = body.getOrNull(call + 1)
        if (move?.opcode != Opcode.MOVE_RESULT_OBJECT) refuse("doesn't keep the $what font it loads")
        val result = (move as OneRegisterInstruction).registerA
        val name = body[call].namedRegisters().getOrNull(nameAt) ?: refuse("loads the $what font from nothing")
        if (name == result) refuse("loads the $what font over what it loaded it by")
        // The resource is an int, which the call's copy into a low register can't move.
        if (what == "resource" && name > 15) refuse("keeps the $what font's id above v15")
        val at = call + 2
        if (body.indices.any { it != call + 1 && at in flow.normal[it] }) refuse("jumps to just after the $what font it loads")
        return FontLoad(call, result, name, hook)
    }

    return listOf(
        load("asset", "assetFont($TYPEFACE$STRING)$TYPEFACE", 1) {
            it.toString() == "$TYPEFACE->createFromAsset(Landroid/content/res/AssetManager;$STRING)$TYPEFACE"
        },
        load("Android family", "systemFont($TYPEFACE$STRING)$TYPEFACE", 0) {
            it.toString() == "$TYPEFACE->create(${STRING}I)$TYPEFACE"
        },
        load("resource", "resourceFont(${TYPEFACE}I)$TYPEFACE", 1) { call ->
            call.returnType == TYPEFACE && call.definingClass != TYPEFACE &&
                call.parameterTypes.map(CharSequence::toString) == listOf("Landroid/content/Context;", "I") &&
                loadsFontResources(call.definingClass)
        },
    )
}

/** Whether [type] is AndroidX's ResourcesCompat by its message for a font resource it can't load. */
private fun BytecodePatchContext.loadsFontResources(type: String): Boolean =
    classDefByOrNull(type)?.methods?.any { method ->
        method.implementation?.instructions?.any { it.getReference<StringReference>()?.string?.startsWith(FONT_RESOURCE) == true } == true
    } == true
