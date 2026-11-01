package semicoloncolonel.mobilestream.patches.foxnews.misc

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import semicoloncolonel.mobilestream.patches.foxnews.shared.Constants

// Fox News 5.49.2 ships its debug menu (feature flags, experiments, network
// debugging, TV-provider and token tools). It is already reachable in the
// release build, but only by holding the Fox attribution logo at the bottom of
// Settings for a full 10 seconds. This shortens that hold to half a second, so
// a normal long-press on the logo opens it. Nothing else changes: the gesture
// and its target were already wired in the shipped app.
internal object DebugLongPressDelayFingerprint : Fingerprint(
    definingClass = "Lcom/foxnews/settings/ui/adapter/CopyrightViewHolder;",
    custom = { method, _ ->
        method.implementation?.instructions?.any {
            it.opcode == Opcode.CONST_WIDE_16 && (it as WideLiteralInstruction).wideLiteral == 10000L
        } == true
    },
)

// The feature-flag toggles in the debug menu save through
// RemoteConfigManager.setBooleanOverride, which bails out unless the flag
// reports it is overridable, and in the release build most flags are not. The
// read path already applies any stored override, so making every flag report
// overridable lets the debug toggles actually stick and take effect (after the
// app is reopened). Only flags the user changes in the menu are affected.
internal object FlagIsOverridableFingerprint : Fingerprint(
    definingClass = "Lcom/foxnews/core/remoteconfig/RemoteConfigFlagKey\$BooleanFlag;",
    name = "isOverridable",
    parameters = listOf(),
    returnType = "Z",
)

@Suppress("unused")
val enableDeveloperMenuPatch = bytecodePatch(
    name = "Enable developer menu",
    description = "Makes the Fox News phone app's hidden debug menu open with a normal " +
        "long-press on the Fox logo at the bottom of Settings, instead of a 10-second hold, " +
        "and makes its feature-flag toggles actually take effect (reopen the app after " +
        "changing one). For advanced users.",
    default = false,
) {
    compatibleWith(Constants.COMPATIBILITY)

    execute {
        DebugLongPressDelayFingerprint.method.apply {
            val index = implementation!!.instructions.indexOfFirst {
                it.opcode == Opcode.CONST_WIDE_16 && (it as WideLiteralInstruction).wideLiteral == 10000L
            }
            if (index < 0) throw PatchException("Long-press delay literal not found")
            val register = (implementation!!.instructions.toList()[index] as OneRegisterInstruction).registerA
            replaceInstruction(index, "const-wide/16 v$register, 0x1f4")
        }

        FlagIsOverridableFingerprint.method.addInstructions(0, "const/4 v0, 0x1\nreturn v0")
    }
}
