package app.template.patches.letterboxd.ads

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.AccessFlags

private const val ADMOB_HELPER = "Lcom/letterboxd/letterboxd/helpers/AdmobHelper;"

/** `AdmobHelper.setShowAds(boolean)` — stores whether the AdMob banner should be shown. */
internal object AdmobSetShowAdsFingerprint : Fingerprint(
    definingClass = ADMOB_HELPER,
    name = "setShowAds",
    accessFlags = listOf(AccessFlags.PRIVATE, AccessFlags.FINAL),
    returnType = "V",
    parameters = listOf("Z"),
)

/** `AdmobHelper.shouldShowAds(MemberStatus)` — the gate every banner load runs through. */
internal object AdmobShouldShowAdsFingerprint : Fingerprint(
    definingClass = ADMOB_HELPER,
    name = "shouldShowAds",
    accessFlags = listOf(AccessFlags.PRIVATE, AccessFlags.FINAL),
    returnType = "Z",
    parameters = listOf("Lcom/letterboxd/api/model/MemberStatus;"),
)

/** `FilmFragment.showAds(ActivityFilmBinding, List)` — inflates the banner on a film page. */
internal object FilmFragmentShowAdsFingerprint : Fingerprint(
    definingClass = "Lcom/letterboxd/letterboxd/ui/fragments/film/FilmFragment;",
    name = "showAds",
    accessFlags = listOf(AccessFlags.PRIVATE, AccessFlags.FINAL),
    returnType = "V",
    parameters = listOf(
        "Lcom/letterboxd/letterboxd/databinding/ActivityFilmBinding;",
        "Ljava/util/List;",
    ),
)

/** `AMemberExtensionKt.showAds(Member)` — `true` unless the member has ads disabled. */
internal object MemberExtensionShowAdsFingerprint : Fingerprint(
    definingClass = "Lcom/letterboxd/letterboxd/util/AMemberExtensionKt;",
    name = "showAds",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC, AccessFlags.FINAL),
    returnType = "Z",
    parameters = listOf("Lcom/letterboxd/api/model/Member;"),
)
