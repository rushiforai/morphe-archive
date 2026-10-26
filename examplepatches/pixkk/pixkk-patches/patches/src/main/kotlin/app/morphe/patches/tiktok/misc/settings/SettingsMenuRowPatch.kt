package app.morphe.patches.tiktok.misc.settings

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.patches.tiktok.misc.extension.sharedExtensionPatch
import app.morphe.util.addInstructions
import app.morphe.util.getReference
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val WHAT = "Settings menu row"
private const val MENU_ROW = "Lapp/pixkk/extension/navigation/MenuRow;"
private const val CELL_COMPONENT =
    "Lcom/ss/android/ugc/profile/business/profile/menu/business/content/business/base/ContentCellNewBaseUIComponent;"
private const val PROTOCOL =
    "Lcom/ss/android/ugc/profile/platform/standard/protocol/ProfilePlatformProtocol;"
private const val CELL_PROTOCOL =
    "Lcom/ss/android/ugc/profile/platform/standard/protocol/component/ContentCellProtocol;"

/** Builds the view of one row of the profile's side menu. */
internal object MenuCellViewFingerprint : Fingerprint(
    definingClass = CELL_COMPONENT,
    returnType = "Landroid/view/View;",
    parameters = listOf("Lcom/ss/android/ugc/profile/platform/base/data/ProfileComponentUIConfig;"),
)

@Suppress("unused")
val settingsMenuRowPatch = bytecodePatch(
    name = WHAT,
    description = "Adds a Pixkk Patches row to the profile's side menu, right under Settings and privacy.",
) {
    category("Interface")
    compatibleWith(*AppCompatibilities.tiktok())
    dependsOn(sharedExtensionPatch)

    execute {
        val gear = settingsGearResourceId()
        MenuCellViewFingerprint.method.apply {
            val instructions = implementation!!.instructions.toList()
            val exit = instructions.indexOfLast { it.opcode == Opcode.RETURN_OBJECT }
            if (exit < 0) throw PatchException("$WHAT: the row builder no longer returns a view")
            // The component's getter for its protocol is renamed on every build. The builder
            // already calls it before it returns, so its name is read from that call.
            val protocolGetter = instructions.firstNotNullOfOrNull { instruction ->
                instruction.getReference<MethodReference>()?.takeIf {
                    instruction.opcode == Opcode.INVOKE_VIRTUAL && it.definingClass == CELL_COMPONENT &&
                        it.returnType == CELL_PROTOCOL && it.parameterTypes.isEmpty()
                }?.name
            } ?: throw PatchException("$WHAT: the row builder never asks for its protocol")
            // The method ends with the built row in v4 and `this` in v2, which TikTok's own code
            // keeps there to the end; v0 and v1 are free by then.
            addInstructions(
                exit,
                """
                    invoke-virtual { v2 }, $CELL_COMPONENT->$protocolGetter()$CELL_PROTOCOL
                    move-result-object v0
                    if-eqz v0, :pixkk_no_protocol
                    invoke-virtual { v0 }, $PROTOCOL->getName()Ljava/lang/String;
                    move-result-object v0
                    const v1, $gear
                    invoke-static { v4, v0, v1 }, $MENU_ROW->wrap(Landroid/view/View;Ljava/lang/String;I)Landroid/view/View;
                    move-result-object v4
                    :pixkk_no_protocol
                """,
            )
        }
    }
}
