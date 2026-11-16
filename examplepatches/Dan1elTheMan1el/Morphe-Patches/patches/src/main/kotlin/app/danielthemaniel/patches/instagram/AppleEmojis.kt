package app.danielthemaniel.patches.instagram

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patches.instagram.shared.INSTAGRAM_COMPATIBILITY
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import java.util.logging.Logger

/*
 * How this patch stays version-independent
 * -----------------------------------------
 * Instagram renames its obfuscated classes (X.4ij, X.1mO, ...) on every release, so nothing here
 * matches by obfuscated name. Each hook point is found by something that has survived releases:
 * log/error strings, Android or Compose framework calls, unobfuscated classes
 * (InstagramAppShell, Emoji, FontFamilyResolverImpl) and method shapes.
 *
 * No register is hard-coded either. Hooks either swap the target of an existing call (same
 * arguments, same registers), or take their registers from the instructions they hook, using
 * invoke-static/range, which can address any register.
 *
 * Only the start-up hook is required. Any other hook that cannot be found is skipped with a
 * warning in the patch log, so a future Instagram build degrades to "fewer surfaces use Apple
 * emoji" instead of failing to patch. Checked against 447.0.0.55.81 and 452.1.0.53.64.
 */

/** Runtime half of this patch, dexed into extensions/instagram.dex by the dexExtensions task in patches/build.gradle.kts. */
private const val EXT = "Lapp/danielthemaniel/patches/instagram/extension/AppleEmoji;"
private const val EXTENSION_FILE = "extensions/instagram.dex"

private const val CTX = "Landroid/content/Context;"
private const val TYPEFACE = "Landroid/graphics/Typeface;"
private const val STRING = "Ljava/lang/String;"
private const val CHAR_SEQUENCE = "Ljava/lang/CharSequence;"
private const val SIMPLE_IMAGE_URL = "Lcom/instagram/common/typedurl/SimpleImageUrl;"
private const val ASSET_MANAGER = "Landroid/content/res/AssetManager;"

/** Typeface factory calls inside Instagram's font loader, and the extension method that replaces each. */
private val TYPEFACE_FACTORY_REPLACEMENTS = mapOf(
    "$TYPEFACE->createFromFile($STRING)$TYPEFACE" to "$EXT->createFromFile($STRING)$TYPEFACE",
    "$TYPEFACE->createFromFile(Ljava/io/File;)$TYPEFACE" to "$EXT->createFromFile(Ljava/io/File;)$TYPEFACE",
    "$TYPEFACE->createFromAsset($ASSET_MANAGER$STRING)$TYPEFACE" to "$EXT->createFromAsset($ASSET_MANAGER$STRING)$TYPEFACE",
    "$TYPEFACE->create(${STRING}I)$TYPEFACE" to "$EXT->create(${STRING}I)$TYPEFACE",
)

private const val TYPEFACE_CREATE_WEIGHTED = "$TYPEFACE->create(${TYPEFACE}IZ)$TYPEFACE"
private const val TEXT_PAINT_INIT = "Landroid/text/TextPaint;-><init>(I)V"
private const val FONT_FAMILY_RESOLVER = "Landroidx/compose/ui/text/font/FontFamilyResolverImpl;"

private val logger = Logger.getLogger("AppleEmojiPatch")

// ---------------------------------------------------------------------------------------------
// Instruction helpers
// ---------------------------------------------------------------------------------------------

private val Instruction.methodReference: MethodReference?
    get() = (this as? ReferenceInstruction)?.reference as? MethodReference

private val Instruction.stringValue: String?
    get() = ((this as? ReferenceInstruction)?.reference as? StringReference)?.string

private val MethodReference.descriptor: String
    get() = "$definingClass->$name(${parameterTypes.joinToString("")})$returnType"

private fun Method.calls(descriptor: String) =
    implementation?.instructions?.any { it.methodReference?.descriptor == descriptor } == true

private fun Method.hasString(value: String) =
    implementation?.instructions?.any { it.stringValue?.contains(value) == true } == true

/** Registers passed to an invoke instruction, in argument order. */
private fun Instruction.argumentRegisters(): List<Int> = when (this) {
    is RegisterRangeInstruction -> List(registerCount) { startRegister + it }
    is FiveRegisterInstruction ->
        listOf(registerC, registerD, registerE, registerF, registerG).take(registerCount)
    else -> throw PatchException("Not an invoke instruction: $opcode")
}

/** Smali for the register list of [this] invoke, in the same encoding (range or not) as the original. */
private fun Instruction.registerListSmali(): String {
    val registers = argumentRegisters()
    return if (this is RegisterRangeInstruction) {
        if (registers.isEmpty()) "/range {}" else "/range {v${registers.first()} .. v${registers.last()}}"
    } else {
        " {${registers.joinToString { "v$it" }}}"
    }
}

/** Smali that calls a static method with [registers], or null if no invoke-static encoding fits. */
private fun invokeStatic(registers: List<Int>, target: String): String? = when {
    registers.size <= 5 && registers.all { it < 16 } ->
        "invoke-static {${registers.joinToString { "v$it" }}}, $target"
    registers.isNotEmpty() && registers.zipWithNext().all { (a, b) -> b == a + 1 } ->
        "invoke-static/range {v${registers.first()} .. v${registers.last()}}, $target"
    else -> null
}

/** After [index], pass the object in [register] through [target] (T -> T) and store the result back. */
private fun MutableMethod.filterRegister(index: Int, register: Int, target: String) {
    addInstructions(
        index + 1,
        """
            invoke-static/range {v$register .. v$register}, $target
            move-result-object v$register
        """,
    )
}

/**
 * Indexes of `invoke-*` instructions returning [returnType] that are directly followed by
 * move-result-object, paired with that result register. Highest index first, so callers can insert
 * code without shifting the indexes they have not processed yet.
 */
private fun MutableMethod.callResults(predicate: (MethodReference) -> Boolean): List<Pair<Int, Int>> {
    val instructions = implementation?.instructions ?: return emptyList()
    return instructions.indices.mapNotNull { i ->
        val reference = instructions[i].methodReference ?: return@mapNotNull null
        if (!predicate(reference)) return@mapNotNull null
        val next = instructions.getOrNull(i + 1) ?: return@mapNotNull null
        if (next.opcode != Opcode.MOVE_RESULT_OBJECT) return@mapNotNull null
        i to (next as OneRegisterInstruction).registerA
    }.reversed()
}

// ---------------------------------------------------------------------------------------------
// Fingerprints
// ---------------------------------------------------------------------------------------------

/** Application.attachBaseContext: start-up hook. The class name is not obfuscated. */
private val applicationAttachBaseContextFingerprint = Fingerprint(
    definingClass = "Lcom/instagram/app/InstagramAppShell;",
    name = "attachBaseContext",
    returnType = "V",
    parameters = listOf(CTX),
)

/** Instagram's TypefaceRepository: builds every app font (system name, file, asset, resource). */
private val typefaceRepositoryFingerprint = Fingerprint(
    returnType = TYPEFACE,
    strings = listOf("TypefaceRepository:load_typeface"),
)

/** androidx ResourcesCompat.getFont(Context, int): starts with `if (context.isRestricted()) return null`. */
private val resourcesGetFontFingerprint = Fingerprint(
    returnType = TYPEFACE,
    parameters = listOf(CTX, "I"),
    custom = { method, _ ->
        AccessFlags.STATIC.isSet(method.accessFlags) &&
            method.calls("$CTX->isRestricted()Z")
    },
)

/** Compose AndroidParagraphIntrinsics constructor: creates the TextPaint for text without a font. */
private val composeParagraphIntrinsicsFingerprint = Fingerprint(
    returnType = "V",
    strings = listOf("Invalid TextDirection."),
    custom = { method, _ ->
        method.name == "<init>" && method.calls(TEXT_PAINT_INIT)
    },
)

/** Emoji sprite-sheet renderer: draws `emoji:/` and sprite-sheet URLs into bitmaps (reaction tray, picker). */
private val emojiSpriteRendererFingerprint = Fingerprint(
    returnType = "V",
    strings = listOf("Malformed emoji sprite sheet URI: "),
)

/** Image pipeline task that renders single `emoji:/` URLs into bitmaps. */
private val emojiImageTaskFingerprint = Fingerprint(
    returnType = "V",
    strings = listOf("emoji:/", "Emoji image load failed"),
)

/** Pseudo-URL (and image cache key) for a multi-emoji sprite sheet. */
private val emojiSpriteSheetUrlFingerprint = Fingerprint(
    returnType = SIMPLE_IMAGE_URL,
    strings = listOf("emoji-sprite-sheet-api"),
)

/** Pseudo-URL (and image cache key) for a single emoji image. The Emoji class is not obfuscated. */
private val emojiUrlFingerprint = Fingerprint(
    definingClass = "Lcom/instagram/ui/emoji/Emoji;",
    returnType = SIMPLE_IMAGE_URL,
    parameters = listOf(STRING, STRING),
    strings = listOf("emoji:/"),
)

/** androidx EmojiCompat.process(CharSequence, int, int, int); the other process() overloads call it. */
private val emojiCompatProcessFingerprint = Fingerprint(
    returnType = CHAR_SEQUENCE,
    parameters = listOf(CHAR_SEQUENCE, "I", "I", "I"),
    strings = listOf("end cannot be negative"),
)

// ---------------------------------------------------------------------------------------------

@Suppress("unused")
val appleEmojiPatch = bytecodePatch(
    name = "Apple emojis everywhere",
    description = "Replaces Instagram's emoji with Apple-style emoji. The emoji font is downloaded " +
        "once, after asking, the first time the app is opened.",
    default = true,
) {
    compatibleWith(INSTAGRAM_COMPATIBILITY)
    extendWith(EXTENSION_FILE)

    execute {
        val applied = mutableListOf<String>()
        val skipped = mutableListOf<String>()
        fun hook(name: String, block: () -> Boolean) {
            val ok = try {
                block()
            } catch (e: Exception) {
                logger.warning("Apple emoji: $name: ${e.message}")
                false
            }
            if (ok) applied += name else skipped += name
        }

        // 1. Start-up (required): first-run download prompt and process-wide typeface replacement.
        //    invoke-static/range reaches p0/p1 whatever the method's register count.
        applicationAttachBaseContextFingerprint.method.addInstructions(
            0,
            """
                invoke-static {}, $EXT->enableProcessWide()V
                invoke-static/range {p0 .. p1}, $EXT->init(Landroid/app/Application;$CTX)V
            """,
        )

        // 2. TypefaceRepository: point its Typeface factory calls at drop-in extension methods with
        //    the same arguments. Covers every method of the class, including small helpers that
        //    newer builds split out (452 moved createFromFile(String) into its own method).
        hook("typeface repository") {
            val repository = typefaceRepositoryFingerprint.matchOrNull()?.classDef ?: return@hook false
            var count = 0
            repository.methods.forEach { method ->
                val instructions = method.implementation?.instructions ?: return@forEach
                instructions.indices.forEach { i ->
                    val instruction = instructions[i]
                    if (instruction.opcode != Opcode.INVOKE_STATIC && instruction.opcode != Opcode.INVOKE_STATIC_RANGE) {
                        return@forEach
                    }
                    val replacement = instruction.methodReference?.descriptor
                        ?.let { TYPEFACE_FACTORY_REPLACEMENTS[it] }
                        ?: return@forEach
                    method.replaceInstruction(i, "invoke-static${instruction.registerListSmali()}, $replacement")
                    count++
                }
            }
            count > 0
        }

        // 3. ResourcesCompat.getFont: wrap the typeface it loads. The context and font id are read
        //    from the arguments of the loader call itself, since getFont reuses its parameter registers.
        hook("ResourcesCompat.getFont") {
            val method = resourcesGetFontFingerprint.matchOrNull()?.method ?: return@hook false
            val instructions = method.implementation!!.instructions
            var count = 0
            method.callResults { it.returnType == TYPEFACE && it.name != "isRestricted" }.forEach { (index, result) ->
                val reference = instructions[index].methodReference!!
                val arguments = instructions[index].argumentRegisters()
                // Map each parameter to its first register (wide types take two).
                val registerOf = mutableListOf<Int>()
                var cursor = if (instructions[index].opcode in STATIC_INVOKES) 0 else 1
                reference.parameterTypes.forEach { type ->
                    registerOf += arguments[cursor]
                    cursor += if (type.toString() == "J" || type.toString() == "D") 2 else 1
                }
                val types = reference.parameterTypes.map { it.toString() }
                val context = registerOf.getOrNull(types.indexOf(CTX)) ?: return@forEach
                val id = registerOf.getOrNull(types.indexOf("I")) ?: return@forEach
                if (result == context || result == id) return@forEach
                val call = invokeStatic(listOf(context, result, id), "$EXT->res($CTX${TYPEFACE}I)$TYPEFACE")
                    ?: return@forEach
                method.addInstructions(index + 2, "$call\nmove-result-object v$result")
                count++
            }
            count > 0
        }

        // 4. Compose. The typeface result class is the one FontFamilyResolverImpl (not obfuscated)
        //    instantiates right after Typeface.create(Typeface, int, boolean).
        hook("Compose typeface result") {
            val resolver = classDefByOrNull(FONT_FAMILY_RESOLVER) ?: return@hook false
            val resultType = resolver.methods.firstNotNullOfOrNull { method ->
                val instructions = method.implementation?.instructions?.toList() ?: return@firstNotNullOfOrNull null
                val create = instructions.indexOfFirst { it.methodReference?.descriptor == TYPEFACE_CREATE_WEIGHTED }
                if (create < 0) return@firstNotNullOfOrNull null
                instructions.drop(create + 1).firstOrNull { it.opcode == Opcode.NEW_INSTANCE }
                    ?.let { ((it as ReferenceInstruction).reference as TypeReference).type }
            } ?: return@hook false
            val resultConstructor = mutableClassDefByOrNull(resultType)?.methods?.firstOrNull {
                it.name == "<init>" && it.parameterTypes.map { type -> type.toString() } == listOf("Ljava/lang/Object;")
            } ?: return@hook false
            val superCall = resultConstructor.implementation!!.instructions.indexOfFirst {
                it.opcode == Opcode.INVOKE_DIRECT && it.methodReference?.name == "<init>"
            }
            if (superCall < 0) return@hook false
            resultConstructor.addInstructions(
                superCall + 1,
                """
                    invoke-static/range {p1 .. p1}, $EXT->cw(Ljava/lang/Object;)Ljava/lang/Object;
                    move-result-object p1
                """,
            )
            true
        }

        hook("Compose paragraph paint") {
            val method = composeParagraphIntrinsicsFingerprint.matchOrNull()?.method ?: return@hook false
            val instructions = method.implementation!!.instructions
            val index = instructions.indexOfFirst { it.methodReference?.descriptor == TEXT_PAINT_INIT }
            if (index < 0) return@hook false
            val paint = instructions[index].argumentRegisters().first()
            method.addInstructions(
                index + 1,
                "invoke-static/range {v$paint .. v$paint}, $EXT->applyDefaultTypeface(Landroid/graphics/Paint;)V",
            )
            true
        }

        // 5. Emoji bitmap renderers: they ask a typeface provider for the emoji font by name; swap
        //    in the Apple-first typeface.
        fun wrapProvidedTypefaces(fingerprint: Fingerprint): Boolean {
            val method = fingerprint.matchOrNull()?.method ?: return false
            val results = method.callResults { it.returnType == TYPEFACE && it.definingClass != TYPEFACE }
            results.forEach { (index, register) ->
                method.filterRegister(index + 1, register, "$EXT->ec($TYPEFACE)$TYPEFACE")
            }
            return results.isNotEmpty()
        }
        hook("emoji sprite renderer") { wrapProvidedTypefaces(emojiSpriteRendererFingerprint) }
        hook("emoji image task") { wrapProvidedTypefaces(emojiImageTaskFingerprint) }

        // 6. Emoji image cache keys: salt the version segment of the pseudo-URL so stock bitmaps
        //    cached before the font was installed are never reused.
        fun saltString(fingerprint: Fingerprint, value: String): Boolean {
            val method = fingerprint.matchOrNull()?.method ?: return false
            val index = method.implementation!!.instructions.indexOfFirst { it.stringValue == value }
            if (index < 0) return false
            val register = method.getInstruction<OneRegisterInstruction>(index).registerA
            method.filterRegister(index, register, "$EXT->salt($STRING)$STRING")
            return true
        }
        hook("emoji sprite-sheet cache key") { saltString(emojiSpriteSheetUrlFingerprint, "emoji-sprite-sheet-api") }
        hook("emoji cache key") { saltString(emojiUrlFingerprint, "-api") }

        // 7. Neutralise EmojiCompat so it cannot substitute its own emoji images.
        hook("EmojiCompat") {
            val method = emojiCompatProcessFingerprint.matchOrNull()?.method ?: return@hook false
            method.addInstructions(0, "return-object p1")
            true
        }

        logger.info("Apple emoji: applied ${applied.joinToString()}")
        if (skipped.isNotEmpty()) {
            logger.warning(
                "Apple emoji: could not find ${skipped.joinToString()}. Those parts of Instagram keep " +
                    "their stock emoji; please report the Instagram version.",
            )
        }
        if ("typeface repository" !in applied && "Compose typeface result" !in applied) {
            throw PatchException(
                "Apple emoji: none of Instagram's font loaders were found, so this Instagram version " +
                    "is not supported.",
            )
        }
    }
}

private val STATIC_INVOKES = setOf(Opcode.INVOKE_STATIC, Opcode.INVOKE_STATIC_RANGE)