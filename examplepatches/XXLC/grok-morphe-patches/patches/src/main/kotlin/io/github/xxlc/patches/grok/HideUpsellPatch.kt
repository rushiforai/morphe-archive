package io.github.xxlc.patches.grok

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.resource.ResourceType
import app.morphe.patcher.resourceLiteral
import com.android.tools.smali.dexlib2.Opcode

private object ImagineLimitBannerFingerprint : Fingerprint(
    definingClass = GrokNames.IMAGINE_CONTENT,
    name = "invoke",
    isStatic = false,
    returnType = "Ljava/lang/Object;",
    parameters = listOf("Ljava/lang/Object;", "Ljava/lang/Object;", "Ljava/lang/Object;"),
    filters = listOf(fieldAccess(
        definingClass = GrokNames.IMAGINE_STATE,
        name = GrokNames.IMAGINE_LIMIT_BANNER_NAME,
        type = GrokNames.LIMIT_BANNER_STATE,
        opcode = Opcode.IGET_OBJECT,
    )),
)

private object SettingsUpsellTitleFingerprint : Fingerprint(
    definingClass = GrokNames.SETTINGS_UI,
    name = GrokNames.SETTINGS_UPSELL_TITLE_METHOD,
    isStatic = true,
    returnType = "Ljava/lang/String;",
    parameters = listOf(GrokNames.COMPOSER),
    filters = listOf(resourceLiteral(ResourceType.STRING, "grok_settings_upsell_title")),
)

private object SettingsUpsellEligibilityFingerprint : Fingerprint(
    definingClass = GrokNames.SETTINGS_UI,
    name = GrokNames.SETTINGS_SUBSCRIPTION_METHOD,
    isStatic = true,
    returnType = "V",
    parameters = listOf(
        GrokNames.ACCOUNT_LAYOUT, GrokNames.SUBSCRIPTION_STATUS, "Z",
        GrokNames.USAGE_STATE, GrokNames.SETTINGS_HANDLER, GrokNames.COMPOSER, "I",
    ),
    filters = listOf(fieldAccess(
        definingClass = GrokNames.SUBSCRIPTION_STATUS,
        name = GrokNames.SETTINGS_UPGRADE_ELIGIBLE_NAME,
        type = "Z",
        opcode = Opcode.IGET_BOOLEAN,
    )),
)

@Suppress("unused")
val hideUpgradePromptsPatch = bytecodePatch(
    name = "Hide upgrade prompts",
    description = "Hide the Imagine limit banner and the upgrade card in Settings, keeping usage data and subscription management. Compose changes are not tested on a device.",
    default = false,
) {
    compatibleWith(grokCompatibility)

    val enabled by enabledOption(default = true)

    execute {
        if (enabled != true) return@execute

        ImagineLimitBannerFingerprint.method.apply {
            requireRegisterCount(49)
            val bannerIndex = indexOfReference(Opcode.IGET_OBJECT, GrokNames.IMAGINE_LIMIT_BANNER)
            requireRegisters(bannerIndex, 8, 11)
            // v8 only holds targetState; lambda returns Unit when state is null.
            // Insert immediately after read, preserving all labels and data in v11.
            addInstruction(bannerIndex + 1, "const/4 v8, 0x0")
        }
        SettingsUpsellTitleFingerprint.method.requireRegisterCount(7)
        SettingsUpsellEligibilityFingerprint.method.apply {
            requireRegisterCount(25)
            val eligibleIndex = indexOfReference(Opcode.IGET_BOOLEAN, GrokNames.SETTINGS_UPGRADE_ELIGIBLE)
            requireRegisters(eligibleIndex, 14, 2)
            check(implementation!!.instructions[eligibleIndex + 1].opcode == Opcode.IF_NE) {
                "Upsell conditional branch does not match original smali."
            }
            requireRegisters(eligibleIndex + 1, 14, 13)
            // v13 is 1; force v14 false so original branch selects v2 = 0 at :cond_f.
            // v10 (managed subscription name) and Usage branch are preserved.
            addInstruction(eligibleIndex + 1, "const/4 v14, 0x0")
        }
    }
}
