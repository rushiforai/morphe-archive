package app.zdrgon.patches.strava.misc

import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.bytecodePatch
import app.zdrgon.patches.strava.shared.Constants.COMPATIBILITY_STRAVA

/**
 * Hides clutter elements from the activity feed: who-to-follow
 * suggestions, suggested challenges, and (optionally) challenge and
 * club cards from people you follow, plus activity lookback cards.
 *
 * Uses the same modular-framework interception as the
 * "Hide subscription promotions" patch, which this patch depends on:
 * enabling this patch also enables that one (its own upsell and promo
 * toggles can still be turned off separately in its options).
 */
@Suppress("unused")
val hideFeedElementsPatch = bytecodePatch(
    name = "Hide feed elements",
    description = "Hides who-to-follow suggestions, suggested challenges and other clutter cards " +
        "from the activity feed. Requires the 'Hide subscription promotions' patch, which provides " +
        "the shared feed filtering.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_STRAVA)

    dependsOn(hideSubscriptionPromotionsPatch)

    extendWith(STRAVA_EXTENSION)

    val options = arrayOf(
        booleanOption(
            key = "followSuggestions",
            title = "Who to Follow",
            description = "Popular athletes, followers, people near you etc.",
            default = true,
            required = true,
        ),
        booleanOption(
            key = "challengeSuggestions",
            title = "Suggested Challenges",
            description = "Random challenges Strava wants you to join.",
            default = true,
            required = true,
        ),
        booleanOption(
            key = "joinChallenge",
            title = "Join Challenge",
            description = "Challenges your follows have joined.",
            default = false,
            required = true,
        ),
        booleanOption(
            key = "joinClub",
            title = "Joined a club",
            description = "Clubs your follows have joined.",
            default = false,
            required = true,
        ),
        booleanOption(
            key = "activityLookback",
            title = "Activity lookback",
            description = "Your activity from X years ago",
            default = false,
            required = true,
        ),
        booleanOption(
            key = "localEvents",
            title = "Local events",
            description = "The 'See what events are happening' local events carousel.",
            default = true,
            required = true,
        ),
    )

    execute {
        writeHideDistractionsOptions(options)
    }
}
