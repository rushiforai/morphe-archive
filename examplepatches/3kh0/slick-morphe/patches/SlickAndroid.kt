package slick.android

import app.morphe.patcher.patch.bytecodePatch

val slickAndroid =
    bytecodePatch(
        name = "Slick Android",
        description = "All Slick features, including telemetry blocking. Select this for the complete experience.",
        default = true,
    ) {
        compatibleWith(SLACK)
        dependsOn(
            silentTyping,
            customFont,
            appearance,
            pronouns,
            messageLogger,
            lastSeen,
            whoReacted,
            anonymousUploads,
            cacheCleaner,
            featureFlags,
            blankEmoji,
            blockTelemetry,
        )
    }
