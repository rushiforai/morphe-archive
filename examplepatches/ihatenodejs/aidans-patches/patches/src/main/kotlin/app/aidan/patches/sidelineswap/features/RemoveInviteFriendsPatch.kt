package app.aidan.patches.sidelineswap.features

import app.aidan.patches.sidelineswap.shared.COMPATIBILITY_SIDELINESWAP
import app.aidan.patches.sidelineswap.shared.requireSidelineSwapCompose
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.formats.Instruction11x
import com.android.tools.smali.dexlib2.iface.instruction.formats.Instruction21c
import com.android.tools.smali.dexlib2.iface.reference.FieldReference

private const val ACCOUNT_CONTENT_CLASS = "Lw5;"
private const val ACCOUNT_STATE_FIELD = "Lu6;->d:Lai6;"
private const val NAV_CALLBACK_CLASS = "Lh5;"
private const val INVITE_ROUTE_INSTANCE = "Liy3;->INSTANCE:Liy3;"
private const val URL_PARSER_CLASS = "Liz;"
private const val INVITE_PATH_ROUTE = "Laz;->a:Laz;"

/**
 * 2.3.2 renders the account page in Compose. The referral/invite entry is one row built in
 * `Lw5`, pushed through navigation callback `Lh5` case 8, and reachable from deep links
 * through the URL parser `Liz`.
 */
@Suppress("unused")
val removeInviteFriendsPatch = bytecodePatch(
    name = "Remove Invite Friends",
    description = "Removes the Invite Friends entry from the Account screen and blocks direct and deep-link navigation to the referral screen.",
    default = true
) {
    category("Interface")
    compatibleWith(COMPATIBILITY_SIDELINESWAP)

    execute {
        packageMetadata.requireSidelineSwapCompose()
        hideReferralRow()
        blockInviteRoutePush()
        blockInviteDeepLink()
    }
}

/**
 * The account page renders its referral/invite row only when the referral earning state is
 * absent. The guard is neutralized so neither branch renders the row, while every other
 * account row keeps its own rendering block.
 */
private fun BytecodePatchContext.hideReferralRow() {
    val classDef = mutableClassDefByOrNull(ACCOUNT_CONTENT_CLASS)
        ?: throw PatchException("Required policy failed: missing $ACCOUNT_CONTENT_CLASS")

    var matches = 0
    for (method in classDef.methods) {
        val impl = method.implementation ?: continue
        val instructions = impl.instructions.toList()
        for ((index, instruction) in instructions.withIndex()) {
            if (instruction.opcode != Opcode.IGET_OBJECT) continue
            val field = (instruction as? ReferenceInstruction)?.reference as? FieldReference ?: continue
            if (field.definingClass + "->" + field.name + ":" + field.type != ACCOUNT_STATE_FIELD) continue

            val guardIndex = index + 1
            if (guardIndex >= instructions.size) continue
            val guard = instructions[guardIndex]
            if (guard.opcode != Opcode.IF_NEZ) continue

            method.replaceInstruction(guardIndex, "nop")
            matches++
        }
    }

    if (matches != 1) {
        throw PatchException(
            "Required policy failed: expected 1 referral-row guard in $ACCOUNT_CONTENT_CLASS, matched $matches"
        )
    }
}

/**
 * The account page pushes InviteFriendsRoute directly from one navigation callback. The
 * callback body returns Unit early instead of pushing the route.
 */
private fun BytecodePatchContext.blockInviteRoutePush() {
    val classDef = mutableClassDefByOrNull(NAV_CALLBACK_CLASS)
        ?: throw PatchException("Required policy failed: missing $NAV_CALLBACK_CLASS")

    var matches = 0
    for (method in classDef.methods) {
        val impl = method.implementation ?: continue
        val instructions = impl.instructions.toList()

        val inviteIndex = instructions.indexOfFirst { instruction ->
            if (instruction.opcode != Opcode.SGET_OBJECT) return@indexOfFirst false
            val field = (instruction as? ReferenceInstruction)?.reference as? FieldReference
            field != null && field.definingClass + "->" + field.name + ":" + field.type == INVITE_ROUTE_INSTANCE
        }
        if (inviteIndex < 0) continue

        val unitRegisters = instructions
            .filter { it.opcode == Opcode.RETURN_OBJECT }
            .map { (it as Instruction11x).registerA }
            .distinct()
        if (unitRegisters.size != 1) {
            throw PatchException(
                "Required policy failed: expected a single Unit return register in " +
                    "$NAV_CALLBACK_CLASS->${method.name}, found $unitRegisters"
            )
        }

        method.addInstructions(inviteIndex, "return-object v${unitRegisters.first()}")
        matches++
    }

    if (matches != 1) {
        throw PatchException(
            "Required policy failed: expected 1 InviteFriendsRoute push in $NAV_CALLBACK_CLASS, matched $matches"
        )
    }
}

/**
 * Deep links resolve `invite` to a dedicated business action. Returning the parser's
 * unmatched-path result (null) blocks external invite links while every other deep link
 * keeps resolving.
 */
private fun BytecodePatchContext.blockInviteDeepLink() {
    val classDef = mutableClassDefByOrNull(URL_PARSER_CLASS)
        ?: throw PatchException("Required policy failed: missing $URL_PARSER_CLASS")

    var matches = 0
    for (method in classDef.methods) {
        val impl = method.implementation ?: continue
        val instructions = impl.instructions.toList()
        val index = instructions.indexOfFirst { instruction ->
            if (instruction.opcode != Opcode.SGET_OBJECT) return@indexOfFirst false
            val field = (instruction as? ReferenceInstruction)?.reference as? FieldReference
            field != null && field.definingClass + "->" + field.name + ":" + field.type == INVITE_PATH_ROUTE
        }
        if (index < 0) continue

        val register = (instructions[index] as Instruction21c).registerA
        if (register > 15) {
            throw PatchException(
                "Required policy failed: invite deep-link result uses wide register v$register in $URL_PARSER_CLASS"
            )
        }
        method.replaceInstruction(index, "const/4 v$register, 0x0")
        matches++
    }

    if (matches != 1) {
        throw PatchException(
            "Required policy failed: expected 1 invite deep-link mapping in $URL_PARSER_CLASS, matched $matches"
        )
    }
}
