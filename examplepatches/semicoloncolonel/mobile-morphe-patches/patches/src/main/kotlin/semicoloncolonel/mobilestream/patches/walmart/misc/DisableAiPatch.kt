package semicoloncolonel.mobilestream.patches.walmart.misc

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import semicoloncolonel.mobilestream.patches.shared.misc.AI_FILTER
import semicoloncolonel.mobilestream.patches.shared.misc.forEachMatchingMethod
import semicoloncolonel.mobilestream.patches.shared.misc.hasSignature
import semicoloncolonel.mobilestream.patches.shared.misc.prependGate
import semicoloncolonel.mobilestream.patches.walmart.shared.Constants

// ─────────────────────────────────────────────────────────────────────────────
// Disable AI (OPT-IN, default OFF).
//
// Walmart 26.38 switches its AI features with remote config keys:
// converse.sparkyAssistant.* (the Sparky assistant and its entry points),
// ads.sparky.* (sponsored prompts inside Sparky), feature.search.genAI.* (AI
// compare and category pages) and feature.search.aiWizard.* (the Sparky pill
// in search). Every key is read through one config API interface in
// glass.platform.config.api: getBoolean() for a value, and H6() for a flow
// that emits the value as it changes. Both are gated so AI keys read as off.
// AiFeatureFilter.isWalmartAiKey has the matching rule.
// ─────────────────────────────────────────────────────────────────────────────

private const val CONFIG_PACKAGE = "Lglass/platform/config/"

@Suppress("unused")
val disableAiPatch = bytecodePatch(
    name = "Disable AI",
    description = "Turns off Sparky, Walmart's AI assistant, and the AI features on item and search pages.",
    default = false,
) {
    category("Interface")
    compatibleWith(Constants.COMPATIBILITY)

    extendWith("extensions/extension.mpe")

    execute {
        // The config API interface: the one in glass.platform.config.api with getBoolean(String, Z).
        val interfaces = mutableSetOf<String>()
        classDefForEach { classDef ->
            if (classDef.type.startsWith("${CONFIG_PACKAGE}api/") &&
                AccessFlags.INTERFACE.isSet(classDef.accessFlags) &&
                classDef.methods.any { it.name == "getBoolean" && it.hasSignature("Z", "Ljava/lang/String;", "Z") }
            ) {
                interfaces += classDef.type
            }
        }
        if (interfaces.isEmpty()) throw PatchException("Walmart config API interface not found")

        val isImplementation = { classDef: com.android.tools.smali.dexlib2.iface.ClassDef ->
            classDef.type.startsWith(CONFIG_PACKAGE) &&
                !AccessFlags.INTERFACE.isSet(classDef.accessFlags) &&
                classDef.interfaces.any { it in interfaces }
        }

        // getBoolean(key, default): an AI key reads as false.
        val values = forEachMatchingMethod(
            isImplementation,
            { it.name == "getBoolean" && it.hasSignature("Z", "Ljava/lang/String;", "Z") },
        ) { method ->
            method.prependGate(
                """
                    invoke-static/range { p1 .. p1 }, $AI_FILTER->isWalmartAiKey(Ljava/lang/String;)Z
                    move-result v0
                    if-eqz v0, :msp_orig
                    const/4 v0, 0x0
                    return v0
                """.trimIndent(),
            )
        }
        if (values == 0) throw PatchException("Walmart config getBoolean not found")

        // The flow variant (String, Z) -> Flow: an AI key is swapped for a key that does not
        // exist, so the flow emits the default, which is set to false.
        forEachMatchingMethod(
            isImplementation,
            { method ->
                method.parameterTypes.map { it.toString() } == listOf("Ljava/lang/String;", "Z") &&
                    method.returnType.startsWith("Lkotlinx/coroutines/flow/")
            },
        ) { method ->
            method.prependGate(
                """
                    invoke-static/range { p1 .. p1 }, $AI_FILTER->isWalmartAiKey(Ljava/lang/String;)Z
                    move-result v0
                    if-eqz v0, :msp_orig
                    const-string p1, "msp.ai.disabled"
                    const/4 p2, 0x0
                """.trimIndent(),
            )
        }
    }
}
