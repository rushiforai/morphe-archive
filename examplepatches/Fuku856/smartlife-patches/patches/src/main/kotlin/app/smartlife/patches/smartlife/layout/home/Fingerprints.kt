package app.smartlife.patches.smartlife.layout.home

import app.morphe.patcher.Fingerprint

/**
 * FindMoreDataSource.buildAllPitList(HomeRecoSoltsCardInfo): builds the candidate cards for the
 * home screen "おすすめ" (Recommended / "find more") section from server data. It is the only
 * place the card list is built (called from setCurrentFindMoreData), so returning an empty list
 * leaves the section with no candidates ("no candidate card, skip").
 */
internal object BuildHomeRecommendationsFingerprint : Fingerprint(
    definingClass = "Lcom/thingclips/smart/home/adv/FindMoreDataSource;",
    name = "buildAllPitList",
    returnType = "Ljava/util/List;",
    parameters = listOf("Lcom/thingclips/smart/home/adv/api/bean/HomeRecoSoltsCardInfo;"),
)
