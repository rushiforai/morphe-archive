package app.whatsapp.patches.archive

import app.morphe.patcher.Fingerprint

/**
 * Fingerprints for WhatsApp's main Conversation activity.
 *
 * Targets [com.whatsapp.Conversation] to provide a user-controlled
 * local archiving action for eligible messages and media currently
 * available to the user.
 *
 * Never hooks message deletion/revoke handlers or disappearing-message timers.
 */
object ConversationOnResumeFingerprint : Fingerprint(
    definingClass = "/Conversation;",
    name = "onResume",
    returnType = "V",
    parameters = emptyList(),
)

object ConversationOnCreateFingerprint : Fingerprint(
    definingClass = "/Conversation;",
    name = "onCreate",
    returnType = "V",
    parameters = listOf("Landroid/os/Bundle;"),
)
