package app.template.patches.redditsync.centerpostmedia.fingerprints

import app.morphe.patcher.fingerprint

/**
 * Matches Loc/c;->s(Ljava/lang/Object;III)V ("SpannableTextViewStringBuilder.java") — queues
 * one span object over a [start, end) range with the given flags, to be applied later by
 * Loc/c;->d(). Used only to reach Loc/c;'s classDef so CenterPostMediaPatch.kt can add a new
 * method to it that reuses this same queuing mechanism for media spans.
 */
val spannableBuilderAddSpanFingerprint = fingerprint {
    returns("V")
    parameters("Ljava/lang/Object;", "I", "I", "I")
    custom { method, classDef -> classDef.type == "Loc/c;" && method.name == "s" }
}
