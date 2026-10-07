package app.anghami.patches.entitlement

import app.anghami.patches.core.AnghamiTarget
import app.anghami.patches.core.forceTrue
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstructions
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.opcode
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.formats.Instruction22c
import com.android.tools.smali.dexlib2.iface.reference.FieldReference

/**
 * Draws the Plus badge on the profile header and on the account settings row again.
 *
 * The header view model reads the `isPlus` flag of the account profile before it
 * decides whether the badge belongs next to the avatar. That single read is
 * replaced by a constant `true`, and the two account settings models are made to
 * answer `true` for their own `isPlus` accessors, so the badge survives the
 * server-side entitlement check that would otherwise hide it.
 */
@Suppress("unused")
val plusBadgeRestorePatch = bytecodePatch(
    name = "Show Profile Plus Badge",
    description = "Displays the official Plus badge on your profile header and account settings.",
    default = true,
) {
    compatibleWith(AnghamiTarget.COMPATIBILITY)

    execute {
        val method = UserHeaderModelBindSignature.method
        val instructions = method.implementation!!.instructions
        val targetIndices = instructions.mapIndexedNotNull { index, ins ->
            if (ins.opcode == Opcode.IGET_BOOLEAN && ins is Instruction22c &&
                (ins.reference as? FieldReference)?.let {
                    it.name == "isPlus" && it.definingClass == "Lcom/anghami/ghost/pojo/Profile;"
                } == true
            ) {
                index
            } else {
                null
            }
        }
        check(targetIndices.size == 1) {
            "Expected 1 isPlus check in UserHeaderModel._bind, found ${targetIndices.size}"
        }
        val ins = instructions[targetIndices[0]] as Instruction22c
        method.replaceInstructions(targetIndices[0], "const/4 v${ins.registerA}, 0x1")

        UserInfoIsPlusSignature.method.forceTrue()

        SettingsRowUserInfoIsPlusSignature.method.forceTrue()
    }
}

/** `UserHeaderModel._bind(UserHeaderViewHolder)` — fills the profile header view. */
object UserHeaderModelBindSignature : Fingerprint(
    definingClass = "Lcom/anghami/model/adapter/headers/UserHeaderModel;",
    name = "_bind",
    accessFlags = listOf(AccessFlags.PUBLIC),
    returnType = "V",
    parameters = listOf("Lcom/anghami/model/adapter/headers/UserHeaderViewHolder;"),
    filters = listOf(
        fieldAccess(
            opcode = Opcode.IGET_BOOLEAN,
            definingClass = "Lcom/anghami/ghost/pojo/Profile;",
            name = "isPlus",
            type = "Z",
        ),
    )
)

/** `UserInfo.isPlus()` — account model exposed to the profile screen. */
object UserInfoIsPlusSignature : Fingerprint(
    definingClass = "Lcom/anghami/model/pojo/settings/UserInfo;",
    name = "isPlus",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Z",
    parameters = listOf(),
)

/** `SettingsRow$UserInfo.isPlus()` — account model backing the settings list row. */
object SettingsRowUserInfoIsPlusSignature : Fingerprint(
    definingClass = "Lcom/anghami/model/pojo/settings/SettingsRow\$UserInfo;",
    name = "isPlus",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Z",
    parameters = listOf(),
)
