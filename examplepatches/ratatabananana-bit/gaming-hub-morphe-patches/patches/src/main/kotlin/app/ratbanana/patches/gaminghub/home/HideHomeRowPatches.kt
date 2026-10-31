package app.ratbanana.patches.gaminghub.home

@Suppress("unused")
val hideRecommendedForYouPatch = hideHomeRowPatch(
    name = "Hide Recommended for you",
    description = "Removes the \"Recommended for you\" row from the home screen.",
    defaultTitles = "Recommended for you",
)

@Suppress("unused")
val hideTopInstantPlaysPatch = hideHomeRowPatch(
    name = "Hide Top instant plays",
    description = "Removes the \"Top instant plays\" row from the home screen.",
    defaultTitles = "Top instant plays",
)