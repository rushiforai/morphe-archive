/*
 * Copyright 2026 Hushfeed contributors
 * https://github.com/SysAdminDoc/hushfeed
 */
package app.morphe.patches.pinedrama.interaction.favorites

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patches.pinedrama.misc.extension.sharedExtensionPatch
import app.morphe.patches.pinedrama.misc.settings.SettingsStatusLoadFingerprint
import app.morphe.patches.pinedrama.misc.settings.configurableBytecodePatch as bytecodePatch
import app.morphe.patches.pinedrama.misc.settings.settingsPatch
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.util.addInstruction
import app.morphe.util.addInstructions
import app.morphe.util.addInstructionsWithLabels
import app.morphe.util.getReference
import app.morphe.util.implementationOrPatchException
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.reference.FieldReference

private const val EXTENSION = "Lapp/morphe/extension/pinedrama/favorites/ListPosition;"
internal const val HISTORY_DRAMA_LIST_PAGE =
    "Lcom/ss/android/ugc/aweme/drama/profilehistory/subpage/drama/HistoryDramaListPage;"
private const val VIEW = "Landroid/view/View;"

/** The History page lets go of its refresh gate first thing here, which names the gate's class. */
internal object HistoryListPageDestroyFingerprint : Fingerprint(
    definingClass = HISTORY_DRAMA_LIST_PAGE,
    name = "onDestroy",
    returnType = "V",
    parameters = emptyList(),
)

/** The gate class has an obfuscated name, so its parts are found by what they are. */
internal fun Method.isRefreshGateWatch() =
    returnType == "V" && parameterTypes.map { it.toString() } == listOf(VIEW, "Z", "Z")

internal fun Method.isRefreshGateCheck() =
    returnType == "V" && name != "<init>" && name != "<clinit>" && parameterTypes.isEmpty()

/** The gate's only boolean: whether the next check should reload. */
internal fun ClassDef.refreshGateDirtyField() =
    fields.filter { it.type == "Z" && it.accessFlags and AccessFlags.STATIC.value == 0 }

val keepListPositionPatch = bytecodePatch(
    name = "Keep list position",
    description = "Stops the Profile's History and Favorites lists from jumping back to the top " +
        "when you switch tabs or come back from a video. A list you haven't scrolled still " +
        "updates. Starts on. Turn it off in HushPine settings.",
    default = true,
) {
    category("Settings")
    dependsOn(settingsPatch, sharedExtensionPatch)
    compatibleWith(*AppCompatibilities.pineDrama())

    execute {
        SettingsStatusLoadFingerprint.method.addInstruction(
            0,
            "invoke-static {}, Lapp/morphe/extension/pinedrama/settings/SettingsStatus;->enableKeepListPosition()V",
        )

        val destroy = HistoryListPageDestroyFingerprint.method
        val gateType = destroy.implementationOrPatchException("Keep list position").instructions
            .firstOrNull { it.opcode == Opcode.IGET_OBJECT }
            ?.getReference<FieldReference>()?.type
            ?: throw PatchException("Keep list position: the History page holds no refresh gate.")

        val gate = mutableClassDefBy(gateType)
        val watch = gate.methods.singleOrNull { it.isRefreshGateWatch() }
            ?: throw PatchException("Keep list position: $gateType has no single watch method.")
        val check = gate.methods.singleOrNull { it.isRefreshGateCheck() }
            ?: throw PatchException("Keep list position: $gateType has no single check method.")
        val dirty = gate.refreshGateDirtyField().singleOrNull()
            ?: throw PatchException("Keep list position: $gateType has no single dirty flag.")

        // The last argument says whether a return into view marks the gate dirty on its own.
        watch.addInstructions(
            0,
            """
                invoke-static {p0, p1, p3}, $EXTENSION->track(Ljava/lang/Object;${VIEW}Z)Z
                move-result p3
            """,
        )

        // The check starts by reading the flag, so v0 is free here and p0 is the highest register.
        val body = check.implementationOrPatchException("Keep list position")
        if (body.registerCount < 2) throw PatchException("Keep list position: no free register.")
        check.addInstructionsWithLabels(
            0,
            """
                invoke-static {p0}, $EXTENSION->wantsRefresh(Ljava/lang/Object;)Z
                move-result v0
                if-eqz v0, :morphe_keep_position
                const/4 v0, 0x1
                iput-boolean v0, p0, $gateType->${dirty.name}:Z
            """,
            ExternalLabel("morphe_keep_position", check.getInstruction(0)),
        )
    }
}
