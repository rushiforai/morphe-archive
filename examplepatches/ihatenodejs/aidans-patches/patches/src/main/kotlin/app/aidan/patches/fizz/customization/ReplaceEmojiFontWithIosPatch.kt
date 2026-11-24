package app.aidan.patches.fizz.customization

import app.aidan.patches.fizz.shared.COMPATIBILITY_FIZZ
import app.aidan.patches.fizz.shared.fizzTargets
import app.aidan.patches.shared.compositeFeaturePatch
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import com.android.tools.smali.dexlib2.Opcode

private const val EMOJI_COMPAT_INITIALIZER = "Landroidx/emoji2/text/EmojiCompatInitializer;"
private const val EMOJI_FONT_BRIDGE = "Lapp/aidan/extension/emoji/EmojiFontBridge;"
private object FontResourceHolder

/**
 * Compose font classes reached by the emoji font rewrite. Compose ships fully obfuscated, so
 * every supported build needs its own verified descriptors.
 *
 * [androidFontLoader] declares `[fontLoaderMethod]([resourceFontDescriptor])Landroid/graphics/Typeface;`
 * and [platformTypefaces] declares
 * `[platformTypefaceMethod](Ljava/lang/String;[fontWeightDescriptor]I)Landroid/graphics/Typeface;`.
 */
private data class FontTargets(
    val androidFontLoader: String,
    val fontLoaderMethod: String,
    val resourceFontDescriptor: String,
    val platformTypefaces: String,
    val platformTypefaceMethod: String,
    val fontWeightDescriptor: String,
)

private val FONT_TARGETS_1_54_0 = FontTargets(
    androidFontLoader = "Lhg/g;",
    fontLoaderMethod = "c",
    resourceFontDescriptor = "Ln4/v;",
    platformTypefaces = "Lwj/a;",
    platformTypefaceMethod = "t",
    fontWeightDescriptor = "Ln4/r;",
)

private val FONT_TARGETS_1_72_0 = FontTargets(
    androidFontLoader = "Ll4/a;",
    fontLoaderMethod = "b",
    resourceFontDescriptor = "Ll4/z;",
    platformTypefaces = "Lal/a;",
    platformTypefaceMethod = "a",
    fontWeightDescriptor = "Ll4/s;",
)

@Suppress("unused")
val replaceEmojiFontWithIosPatch = compositeFeaturePatch(
    name = "Replace Emoji Font with iOS",
    description = "Replaces Android system emoji with iOS Apple Color Emoji across Compose UI, posts, comments, and direct messages (effective on Android 10+ / API 29+).",
    default = true
) {
    category("Customization")
    compatibleWith(COMPATIBILITY_FIZZ)
    extendWith("extensions/extension.mpe")

    rawResources {
        val targetFile = get("assets/fonts/AppleColorEmoji.ttf")
        val fontStream = FontResourceHolder::class.java.classLoader.getResourceAsStream("fonts/AppleColorEmoji.ttf")
            ?: FontResourceHolder::class.java.getResourceAsStream("/fonts/AppleColorEmoji.ttf")
            ?: throw PatchException("Bundled AppleColorEmoji.ttf not found in patch resources")
        fontStream.use { input ->
            targetFile.outputStream().use { output ->
                input.copyTo(output)
            }
        }
    }

    bytecode {
        val targets = fizzTargets("1.54.0" to FONT_TARGETS_1_54_0, "1.72.0" to FONT_TARGETS_1_72_0)

        patchEmojiCompatInitializer()
        patchAndroidFontLoader(targets)
        patchPlatformTypefaces(targets)
    }
}

private fun BytecodePatchContext.patchEmojiCompatInitializer() {
    val initializerClass = mutableClassDefByOrNull(EMOJI_COMPAT_INITIALIZER)
        ?: throw PatchException("Class $EMOJI_COMPAT_INITIALIZER not found")
    val bMethod = initializerClass.methods.firstOrNull {
        it.name == "b" &&
            it.parameterTypes.map(CharSequence::toString) == listOf("Landroid/content/Context;") &&
            it.returnType == "Ljava/lang/Object;" &&
            it.implementation != null
    } ?: throw PatchException("Method $EMOJI_COMPAT_INITIALIZER->b not found")

    bMethod.addInstructions(
        0,
        """
        sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;
        return-object v0
        """.trimIndent()
    )
}

private fun BytecodePatchContext.patchAndroidFontLoader(targets: FontTargets) {
    val fontLoaderClass = mutableClassDefByOrNull(targets.androidFontLoader)
        ?: throw PatchException("Class ${targets.androidFontLoader} not found")
    val bMethod = fontLoaderClass.methods.firstOrNull {
        it.name == targets.fontLoaderMethod &&
            it.parameterTypes.map(CharSequence::toString) == listOf(targets.resourceFontDescriptor) &&
            it.returnType == "Landroid/graphics/Typeface;" &&
            it.implementation != null
    } ?: throw PatchException("Method ${targets.androidFontLoader}->${targets.fontLoaderMethod} not found")

    val impl = bMethod.implementation
        ?: throw PatchException("Method ${targets.androidFontLoader}->${targets.fontLoaderMethod} has no implementation")

    val instructions = impl.instructions.toList()
    val getFontIndex = instructions.indexOfFirst {
        it.opcode == Opcode.INVOKE_STATIC_RANGE || it.opcode == Opcode.INVOKE_STATIC
    }
    if (getFontIndex == -1) {
        throw PatchException("ResourcesCompat.getFont call not found in ${targets.androidFontLoader}->${targets.fontLoaderMethod}")
    }

    val moveResultSubIndex = instructions.subList(getFontIndex, instructions.size).indexOfFirst {
        it.opcode == Opcode.MOVE_RESULT_OBJECT
    }
    if (moveResultSubIndex == -1) {
        throw PatchException("move-result-object instruction not found after getFont in ${targets.androidFontLoader}->${targets.fontLoaderMethod}")
    }

    val moveResultIndex = getFontIndex + moveResultSubIndex

    bMethod.addInstructions(
        moveResultIndex + 1,
        """
        invoke-static {v2, v0}, $EMOJI_FONT_BRIDGE->wrapTypeface(Landroid/content/Context;Landroid/graphics/Typeface;)Landroid/graphics/Typeface;
        move-result-object v0
        """.trimIndent()
    )
}

private fun BytecodePatchContext.patchPlatformTypefaces(targets: FontTargets) {
    val platformTypefacesClass = mutableClassDefByOrNull(targets.platformTypefaces)
        ?: throw PatchException("Class ${targets.platformTypefaces} not found")
    val vMethod = platformTypefacesClass.methods.firstOrNull {
        it.name == targets.platformTypefaceMethod &&
            it.parameterTypes.map(CharSequence::toString) ==
            listOf("Ljava/lang/String;", targets.fontWeightDescriptor, "I") &&
            it.returnType == "Landroid/graphics/Typeface;" &&
            it.implementation != null
    } ?: throw PatchException("Method ${targets.platformTypefaces}->${targets.platformTypefaceMethod} not found")

    val impl = vMethod.implementation
        ?: throw PatchException("Method ${targets.platformTypefaces}->${targets.platformTypefaceMethod} has no implementation")

    val instructions = impl.instructions.toList()
    val returnIndices = instructions.mapIndexedNotNull { index, instruction ->
        if (instruction.opcode == Opcode.RETURN_OBJECT) index else null
    }

    if (returnIndices.size < 2) {
        throw PatchException(
            "Expected at least 2 return-object instructions in ${targets.platformTypefaces}->${targets.platformTypefaceMethod}, found ${returnIndices.size}"
        )
    }

    // Patch the second return-object (after the TypefaceCompat typeface creation)
    val secondReturnIndex = returnIndices[1]
    vMethod.addInstructions(
        secondReturnIndex,
        """
        invoke-static {p0, p1, v0}, $EMOJI_FONT_BRIDGE->wrapPlatformTypeface(Landroid/graphics/Typeface;IZ)Landroid/graphics/Typeface;
        move-result-object p0
        """.trimIndent()
    )

    // Patch the first return-object (default typeface branch)
    val firstReturnIndex = returnIndices[0]
    vMethod.addInstructions(
        firstReturnIndex,
        """
        invoke-static {p0}, $EMOJI_FONT_BRIDGE->wrapDefaultTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;
        move-result-object p0
        """.trimIndent()
    )
}
