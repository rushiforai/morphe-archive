// SPDX-License-Identifier: GPL-3.0-only
// Copyright (C) 2026 Kero309x

package app.keropatches.anghami.entitlement

import app.keropatches.anghami.AnghamiApp
import app.keropatches.core.PatchCategory
import app.keropatches.core.answerBooleanCallsWithTrue
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction

/** The field the profile header reads to decide whether to draw the badge. */
private const val PROFILE_PLUS_FIELD = "Lcom/anghami/ghost/pojo/Profile;->isPlus:Z"

/** The account's own answer, which the settings row copies into its model. */
private const val ACCOUNT_PLUS_CALL = "Lcom/anghami/ghost/local/Account;->isPlusUser()Z"

/**
 * The profile header bind, which draws the badge for the profile it was given.
 *
 * The badge has two shapes: a gold badge when the profile itself is gold, and a
 * plus badge when the profile's own flag is set. Both are read from the profile
 * object, which comes from the server and is not the signed-in account.
 */
private object ProfileHeaderFingerprint : Fingerprint(
    definingClass = "Lcom/anghami/model/adapter/headers/UserHeaderModel;",
    name = "_bind",
    isStatic = false,
    returnType = "V",
    parameters = listOf("Lcom/anghami/model/adapter/headers/UserHeaderViewHolder;"),
)

/**
 * The coroutine that builds the settings account row.
 *
 * It copies the account's plus answer into the row model, which the row then uses
 * to decide whether to draw the same badge.
 */
private object SettingsRowFingerprint : Fingerprint(
    definingClass = "Lcom/anghami/app/settings/view/ui/mainsettings/q;",
    name = "invokeSuspend",
    isStatic = false,
    returnType = "Ljava/lang/Object;",
    parameters = listOf("Ljava/lang/Object;"),
)

/**
 * Shows the subscription badge on the signed-in account's own profile and row.
 *
 * The profile header already computes whether the profile it is binding belongs
 * to the signed-in account, but it throws that answer away before it reaches the
 * badge: the badge branch only looks at the profile's own flag. The patch
 * replaces that one read with the existing ownership check, so the badge appears
 * on the account's own profile and keeps the stock behaviour everywhere else. A
 * profile that belongs to someone else is untouched, and a gold profile still
 * shows its gold badge through the branch above.
 *
 * The settings row does not read the profile at all; it copies the account's plus
 * answer into its model. Both constructors of that model are given true, so the
 * row matches the header.
 *
 * This is cosmetic on purpose. Neither change makes the account a subscriber:
 * `isPlusUser()`, the plan type and every entitlement answer stay as the server
 * left them.
 */
@Suppress("unused")
val showProfilePlusBadgePatch = bytecodePatch(
    name = "Show profile Plus badge",
    description = "Draws the subscription badge on your own profile and on the account row without changing what the account is entitled to.",
    default = true,
) {
    compatibleWith(AnghamiApp.compatibility)
    category(PatchCategory.ENTITLEMENT.label)

    execute {
        ProfileHeaderFingerprint.method.apply {
            val index = instructions.indexOfFirst { instruction ->
                instruction.opcode == Opcode.IGET_BOOLEAN &&
                    (instruction as? ReferenceInstruction)?.reference?.toString() == PROFILE_PLUS_FIELD
            }
            check(index >= 0) {
                "No read of $PROFILE_PLUS_FIELD in $definingClass->$name$returnType; the header changed."
            }

            val read = instructions[index] as TwoRegisterInstruction
            val badge = read.registerA
            val profile = read.registerB

            replaceInstruction(
                index,
                "iget-object v$badge, v$profile, Lcom/anghami/ghost/pojo/ModelWithId;->id:Ljava/lang/String;",
            )
            addInstructions(
                index + 1,
                """
                    invoke-static {v$badge}, Lcom/anghami/ghost/local/Account;->isMe(Ljava/lang/String;)Z
                    move-result v$badge
                """.trimIndent(),
            )
        }

        SettingsRowFingerprint.method.answerBooleanCallsWithTrue(ACCOUNT_PLUS_CALL)
    }
}
