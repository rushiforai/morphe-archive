package app.template.patches.scores365.spoiler

import app.template.patches.scores365.controls.Scores365ControlsCategory
import app.template.patches.shared.hevalcontrols.HevalFeature

/** The master switch: the marking toggles and every surface below depend on it. */
internal val SPOILER_FREE_MODE = HevalFeature(
    id = "scores365.spoiler_free",
    calm = true,
    name = "Spoiler-free mode",
    description = "Lets you hide scores and goal alerts for matches and competitions you mark.",
    category = Scores365ControlsCategory.SPOILER_FREE,
    icon = "eye_off",
)

private fun spoilerSurface(id: String, name: String, description: String) = HevalFeature(
    id = id,
    calm = true,
    name = name,
    description = description,
    category = Scores365ControlsCategory.SPOILER_FREE,
    icon = "eye_off",
    dependencies = listOf(SPOILER_FREE_MODE.id),
)

// One switch per surface, each on by default and each off while the master switch is off, so the
// user chooses what gets hidden. A hook checks its own surface (SpoilerFree.isSurfaceOn): the ids
// and the SURFACE_* order must match SpoilerFree.SURFACE_FEATURES in extensions/scores365.
internal val SPOILER_NOTIFICATIONS = spoilerSurface(
    "scores365.spoiler_notifications", "Hide goal alerts",
    "Drops goal, card and result alerts for marked matches and competitions.",
)
internal val SPOILER_LISTS = spoilerSurface(
    "scores365.spoiler_lists", "Hide scores in match lists",
    "Shows the kickoff time instead of the score in match lists for marked matches.",
)
internal val SPOILER_MATCH_HEADER = spoilerSurface(
    "scores365.spoiler_match_header", "Hide scores on the match page",
    "Shows the kickoff time instead of the score at the top of a marked match.",
)
internal val SPOILER_STATUS = spoilerSurface(
    "scores365.spoiler_status", "Hide match status",
    "Hides the minute and full-time label of marked matches in lists and on the match page.",
)
internal val SPOILER_WINNER = spoilerSurface(
    "scores365.spoiler_winner", "Hide the winner",
    "Hides the result line, qualify marks and winner highlights of marked matches.",
)

/** Every feature this patch registers, in registration order (the master first). */
internal val SPOILER_FEATURES = listOf(
    SPOILER_FREE_MODE, SPOILER_NOTIFICATIONS, SPOILER_LISTS, SPOILER_MATCH_HEADER, SPOILER_STATUS, SPOILER_WINNER,
)
