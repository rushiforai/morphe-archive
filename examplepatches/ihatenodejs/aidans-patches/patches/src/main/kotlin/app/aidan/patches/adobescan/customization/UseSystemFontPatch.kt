package app.aidan.patches.adobescan.customization

import app.aidan.patches.adobescan.shared.COMPATIBILITY_ADOBE_SCAN
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch

private const val RESOURCES_COMPAT = "Lp6/h;"
private const val COMPOSE_FONT = "Lod/e5;"
private const val CREATIVE_SDK_TEXT_VIEW =
    "Lcom/adobe/creativesdk/foundation/internal/utils/CreativeSDKTextView;"

@Suppress("unused")
val useSystemFontPatch = bytecodePatch(
    name = "Use System Font",
    description = "Overrides Adobe Clean fonts across XML layouts, dialogs, and Jetpack Compose screens with the device's system font.",
    default = false
) {
    compatibleWith(COMPATIBILITY_ADOBE_SCAN)
    extendWith("extensions/extension.mpe")

    execute {
        patchResourcesCompat()
        patchComposeFont()
        patchCreativeSdkTextView()
    }
}

private fun BytecodePatchContext.patchResourcesCompat() {
    val classDef = mutableClassDefByOrNull(RESOURCES_COMPAT)
        ?: throw PatchException("ResourcesCompat class $RESOURCES_COMPAT not found")
    val method = classDef.methods.firstOrNull {
        it.name == "b" &&
            it.parameterTypes.map(CharSequence::toString) == listOf(
                "Landroid/content/Context;",
                "I",
                "Landroid/util/TypedValue;",
                "I",
                "Lp6/h\$c;",
                "Z",
                "Z"
            ) &&
            it.returnType == "Landroid/graphics/Typeface;" &&
            it.implementation != null
    } ?: throw PatchException("ResourcesCompat font loader method not found")

    method.addInstructions(
        0,
        """
            move-object/from16 v0, p0
            move/from16 v1, p1
            move/from16 v2, p3
            move-object/from16 v3, p4
            invoke-static {v0, v1, v2, v3}, Lapp/aidan/extension/adobescan/SystemFontBridge;->getSystemTypeface(Landroid/content/Context;IILjava/lang/Object;)Landroid/graphics/Typeface;
            move-result-object v0
            return-object v0
        """.trimIndent()
    )
}

private fun BytecodePatchContext.patchComposeFont() {
    val classDef = mutableClassDefByOrNull(COMPOSE_FONT)
        ?: throw PatchException("ComposeFont class $COMPOSE_FONT not found")
    val method = classDef.methods.firstOrNull {
        it.name == "a" &&
            it.parameterTypes.isEmpty() &&
            it.returnType == "Li5/p;" &&
            it.implementation != null
    } ?: throw PatchException("ComposeFont default family accessor not found")

    method.addInstructions(
        0,
        """
            sget-object v0, Li5/p;->a:Li5/n;
            return-object v0
        """.trimIndent()
    )
}

private fun BytecodePatchContext.patchCreativeSdkTextView() {
    val classDef = mutableClassDefByOrNull(CREATIVE_SDK_TEXT_VIEW)
        ?: throw PatchException("CreativeSDKTextView class $CREATIVE_SDK_TEXT_VIEW not found")
    val method = classDef.methods.firstOrNull {
        it.name == "setTypeface" &&
            it.parameterTypes.map(CharSequence::toString) == listOf("Landroid/graphics/Typeface;") &&
            it.returnType == "V" &&
            it.implementation != null
    } ?: throw PatchException("CreativeSDKTextView.setTypeface(Typeface) not found")

    method.addInstructions(
        0,
        """
            invoke-super {p0, p1}, Landroidx/appcompat/widget/c0;->setTypeface(Landroid/graphics/Typeface;)V
            return-void
        """.trimIndent()
    )
}
