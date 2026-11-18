package app.afterglow.patches.interfaceui

import app.afterglow.patches.shared.Constants.COMPATIBILITY_YOUTUBE
import app.afterglow.patches.shared.Constants.EXTENSION_PACKAGE
import app.afterglow.patches.shared.afterglowExtensionPatch
import app.afterglow.patches.morphe.morpheSettingsBridgePatch
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.addInstructionsAtControlFlowLabel
import app.morphe.patches.youtube.misc.spoof.appversion.spoofAppVersionPatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction

private const val VERSION_POLICY = "Lapp/morphe/extension/shared/spoof/SpoofAppVersionPatch;"

/** Android adaptation: activate the imported version policy, retaining its selected target. */
internal val legacyInterfaceHookPatch = bytecodePatch {
    compatibleWith(COMPATIBILITY_YOUTUBE)
    dependsOn(afterglowExtensionPatch, morpheSettingsBridgePatch, spoofAppVersionPatch)
    execute {
        val initialize = Fingerprint(definingClass = VERSION_POLICY, name = "<clinit>",
            returnType = "V", parameters = emptyList(), filters = listOf(
                fieldAccess(smali = "Lapp/morphe/extension/shared/settings/SharedYouTubeSettings;->SPOOF_APP_VERSION:Lapp/morphe/extension/shared/settings/BooleanSetting;"),
                fieldAccess(smali = "$VERSION_POLICY->SPOOF_APP_VERSION_ENABLED:Z", opcode = Opcode.SPUT_BOOLEAN),
                fieldAccess(smali = "$VERSION_POLICY->SPOOF_APP_VERSION_TARGET:Ljava/lang/String;", opcode = Opcode.SPUT_OBJECT),
            )).match()
        val store = initialize.instructionMatches[1]
        val value = (store.instruction as OneRegisterInstruction).registerA
        initialize.method.addInstructionsAtControlFlowLabel(store.index, """
            invoke-static/range { v$value .. v$value }, $EXTENSION_PACKAGE/interfaceui/LegacyInterface;->enableVersionOverride(Z)Z
            move-result v$value
        """)
        // Both the universal version getter and the existing Shorts endpoint
        // safeguard read this same upstream policy. No target/version is copied.
        println("Afterglow older Android interface: upstream selected target and Shorts compatibility policy retained")
    }
}
