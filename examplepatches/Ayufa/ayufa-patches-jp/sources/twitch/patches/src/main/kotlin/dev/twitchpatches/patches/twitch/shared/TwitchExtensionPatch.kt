package dev.twitchpatches.patches.twitch.shared

import app.morphe.patcher.patch.bytecodePatch
import dev.twitchpatches.patches.twitch.notifications.notificationRegistrationPatch

internal val twitchExtensionPatch = bytecodePatch {
    dependsOn(notificationRegistrationPatch)
    extendWith("extensions/twitch.mpe")
}
