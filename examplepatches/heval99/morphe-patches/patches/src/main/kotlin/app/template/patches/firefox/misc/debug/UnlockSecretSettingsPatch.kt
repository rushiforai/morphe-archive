package app.template.patches.firefox.misc.debug

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.util.returnEarly
import app.template.patches.firefox.shared.concreteMethod
import app.template.patches.firefox.shared.fieldRef
import app.template.patches.firefox.shared.insns
import app.template.patches.firefox.shared.registers
import app.template.patches.firefox.shared.settingsGetter
import app.template.patches.firefox.shared.smali
import app.template.patches.shared.Constants.COMPATIBILITY_FIREFOX
import app.template.patches.shared.addInstructionsChecked
import app.template.patches.shared.requireNoBranchTargetAt
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction

internal const val FEATURE_FLAGS = "Lorg/mozilla/fenix/FeatureFlags;"
internal const val CUSTOM_EXTENSION_COLLECTION = "$FEATURE_FLAGS->customExtensionCollectionFeature:Z"

@Suppress("unused")
val unlockSecretSettingsPatch = bytecodePatch(
    name = "Unlock secret settings",
    description = "Unlocks the hidden debug settings.",
) {
    compatibleWith(COMPATIBILITY_FIREFOX)

    execute {
        // ── 1. The debug menu reads as revealed in every session ────────────────────────────
        settingsGetter("getShowSecretDebugMenuThisSession").returnEarly(true)

        // ── 2. The custom add-on collection works on release ────────────────────────────────
        //  FeatureFlags.<clinit> stores "Nightly, Beta or debug" into customExtensionCollectionFeature;
        //  right after that store, true is stored over it. The store's register is reused, so
        //  no later instruction may name it (158.0: v1, unused after the store).
        val clinit = concreteMethod(FEATURE_FLAGS, "<clinit>", emptyList())
        val insns = clinit.insns()
        val stores = insns.indices.filter {
            insns[it].opcode == Opcode.SPUT_BOOLEAN && insns[it].fieldRef()?.smali() == CUSTOM_EXTENSION_COLLECTION
        }
        val store = stores.singleOrNull()
            ?: throw PatchException("$FEATURE_FLAGS.<clinit> stores customExtensionCollectionFeature ${stores.size} times, expected 1")
        val register = (insns[store] as OneRegisterInstruction).registerA
        if (insns.drop(store + 1).any { register in it.registers() }) {
            throw PatchException("$FEATURE_FLAGS.<clinit> uses v$register after the customExtensionCollectionFeature store")
        }
        clinit.requireNoBranchTargetAt(store + 1, "forcing customExtensionCollectionFeature")
        clinit.addInstructionsChecked(
            store + 1,
            """
                const/16 v$register, 0x1
                sput-boolean v$register, $CUSTOM_EXTENSION_COLLECTION
            """,
        )
    }
}
