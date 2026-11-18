package io.github.kirby1997.patches.meetup

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import io.github.kirby1997.patches.shared.Constants

// Two attendee-adjacent upsell panels non-subscribers see:
//   1. EventInsightsComponent — "Learn more about attendees / Unlock full details"
//      teaser on the event page (Log/f;->d).
//   2. AttendeeListMemberPlusUpsell — "Learn more about who will be there. Try for
//      free." banner on the Attendees list (Lcom/meetup/shared/attendees/q;->e).
// Returning at offset 0 skips startRestartGroup — Compose renders nothing.

object EventInsightsComponentFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC, AccessFlags.FINAL),
    returnType = "V",
    parameters = listOf(
        "Ljava/lang/String;",
        "I",
        "Lln/a;",
        "Lln/a;",
        "Llh/b;",
        "Log/h;",
        "Landroidx/compose/runtime/Composer;",
        "I",
    ),
    definingClass = "Log/f;",
    name = "d",
)

object AttendeeListUpsellFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC, AccessFlags.FINAL),
    returnType = "V",
    parameters = listOf(
        "Z",
        "Lln/k;",
        "Landroidx/compose/runtime/Composer;",
        "I",
    ),
    definingClass = "Lcom/meetup/shared/attendees/q;",
    name = "e",
)

@Suppress("unused")
val hideAttendeesPaywallPatch = bytecodePatch(
    name = "Hide attendees paywall panels",
    description = "Hides the 'Learn more about attendees / Unlock full details' teaser on event pages and the 'Learn more about who will be there. Try for free.' banner on the Attendees list.",
) {
    compatibleWith(Constants.MEETUP)

    execute {
        val returnVoid = """
            return-void
        """

        EventInsightsComponentFingerprint.method.addInstructions(0, returnVoid)
        AttendeeListUpsellFingerprint.method.addInstructions(0, returnVoid)
    }
}
