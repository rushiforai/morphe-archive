package app.aidan.patches.fizz.customization

import app.aidan.patches.fizz.shared.COMPATIBILITY_FIZZ
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.rawResourcePatch
import com.android.tools.smali.dexlib2.Opcode

private const val EMOJI_COMPAT_INITIALIZER = "Landroidx/emoji2/text/EmojiCompatInitializer;"
private const val ANDROID_FONT_LOADER = "Lhg/g;"
private const val PLATFORM_TYPEFACES = "Lwj/a;"
private const val EMOJI_FONT_BRIDGE = "Lapp/aidan/extension/emoji/EmojiFontBridge;"
private object FontResourceHolder


@Suppress("unused")
val replaceEmojiFontWithIosResourcePatch = rawResourcePatch(
    name = "Replace Emoji Font with iOS Asset",
    description = "Copies the packaged Apple Color Emoji font into the target APK assets.",
    default = true
) {
    category("Customization")
    compatibleWith(COMPATIBILITY_FIZZ)

    execute {
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
}

@Suppress("unused")
val replaceEmojiFontWithIosPatch = bytecodePatch(
    name = "Replace Emoji Font with iOS",
    description = "Replaces Android system emoji with iOS Apple Color Emoji across Compose UI, posts, comments, and direct messages.",
    default = true
) {
    category("Customization")
    compatibleWith(COMPATIBILITY_FIZZ)
    dependsOn(replaceEmojiFontWithIosResourcePatch)
    extendWith("extensions/extension.mpe")

    execute {
        patchEmojiCompatInitializer()
        patchAndroidFontLoader()
        patchPlatformTypefaces()
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

private fun BytecodePatchContext.patchAndroidFontLoader() {
    val fontLoaderClass = mutableClassDefByOrNull(ANDROID_FONT_LOADER)
        ?: throw PatchException("Class $ANDROID_FONT_LOADER not found")
    val bMethod = fontLoaderClass.methods.firstOrNull {
        it.name == "c" &&
            it.parameterTypes.map(CharSequence::toString) == listOf("Ln4/v;") &&
            it.returnType == "Landroid/graphics/Typeface;" &&
            it.implementation != null
    } ?: throw PatchException("Method $ANDROID_FONT_LOADER->c(Ln4/v;) not found")

    val impl = bMethod.implementation
        ?: throw PatchException("Method $ANDROID_FONT_LOADER->b has no implementation")

    val instructions = impl.instructions.toList()
    val getFontIndex = instructions.indexOfFirst {
        it.opcode == Opcode.INVOKE_STATIC_RANGE || it.opcode == Opcode.INVOKE_STATIC
    }
    if (getFontIndex == -1) {
        throw PatchException("ResourcesCompat.getFont call not found in $ANDROID_FONT_LOADER->b")
    }

    val moveResultSubIndex = instructions.subList(getFontIndex, instructions.size).indexOfFirst {
        it.opcode == Opcode.MOVE_RESULT_OBJECT
    }
    if (moveResultSubIndex == -1) {
        throw PatchException("move-result-object instruction not found after getFont in $ANDROID_FONT_LOADER->b")
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

private fun BytecodePatchContext.patchPlatformTypefaces() {
    val platformTypefacesClass = mutableClassDefByOrNull(PLATFORM_TYPEFACES)
        ?: throw PatchException("Class $PLATFORM_TYPEFACES not found")
    val vMethod = platformTypefacesClass.methods.firstOrNull {
        it.name == "t" &&
            it.parameterTypes.map(CharSequence::toString) == listOf("Ljava/lang/String;", "Ln4/r;", "I") &&
            it.returnType == "Landroid/graphics/Typeface;" &&
            it.implementation != null
    } ?: throw PatchException("Method $PLATFORM_TYPEFACES->t not found")

    val impl = vMethod.implementation
        ?: throw PatchException("Method $PLATFORM_TYPEFACES->v has no implementation")

    val instructions = impl.instructions.toList()
    val returnIndices = instructions.mapIndexedNotNull { index, instruction ->
        if (instruction.opcode == Opcode.RETURN_OBJECT) index else null
    }

    if (returnIndices.size < 2) {
        throw PatchException("Expected at least 2 return-object instructions in $PLATFORM_TYPEFACES->v, found ${returnIndices.size}")
    }

    // Patch the second return-object (after j5.d.d typeface creation)
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
