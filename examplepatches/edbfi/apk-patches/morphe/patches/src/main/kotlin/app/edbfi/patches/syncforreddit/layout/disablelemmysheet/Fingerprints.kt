// SPDX-License-Identifier: AGPL-3.0-or-later
// Named like every patch's fingerprint file, however many it holds.
@file:Suppress("ktlint:standard:filename")

package app.edbfi.patches.syncforreddit.layout.disablelemmysheet

import app.edbfi.patches.syncforreddit.declaredIn
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.InstructionFilter
import app.morphe.patcher.util.getReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference

private const val MAIN_ACTIVITY = "Lcom/laurencedawson/reddit_sync/ui/activities/MainActivity;"

/** The Sync for Lemmy sheet (`ClosingBottomSheetFragment`) returns its sign-up button label from this method. */
internal object LemmySheetButtonFingerprint : Fingerprint(
    returnType = "Ljava/lang/String;",
    parameters = listOf(),
    strings = listOf("Signup to Sync for Lemmy"),
    custom = declaredIn("ClosingBottomSheetFragment.java"),
)

/** `MainActivity.onCreate` names the sheet class, [sheet], to show it on a fresh start. */
internal class MainActivityOnCreateFingerprint(sheet: String) :
    Fingerprint(
        definingClass = MAIN_ACTIVITY,
        name = "onCreate",
        returnType = "V",
        parameters = listOf("Landroid/os/Bundle;"),
        filters = listOf(InstructionFilter { _, instruction -> instruction.getReference<TypeReference>()?.type == sheet }),
    )
