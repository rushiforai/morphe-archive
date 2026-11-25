package app.stayfree.patches.login

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.methodCall
import com.android.tools.smali.dexlib2.AccessFlags

private const val R_STRING = "Lcom/burockgames/R\$string;"

internal const val ONBOARDING_PAGE_TYPE = "Lcom/burockgames/timeclocker/common/enums/OnboardingPageType;"

/**
 * Onboarding ViewModel constructor (`Lcr7;-><init>(Lds0;)V` in 20.14.1). When no page list is
 * cached yet it builds
 * `mutableListOf(IntroPage, TermsPage, OnboardingGoogleAccountPage, PermissionUsagePage)` and
 * then appends device-specific pages after a xiaomi/redmi/poco manufacturer check — those three
 * strings together in a constructor are unique to it.
 */
object OnboardingPagesConstructorFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.CONSTRUCTOR),
    parameters = listOf("L"),
    strings = listOf("xiaomi", "redmi", "poco"),
    filters = listOf(
        fieldAccess(definingClass = ONBOARDING_PAGE_TYPE, name = "OnboardingGoogleAccountPage"),
        methodCall(name = "mutableListOf"),
    ),
)

/**
 * Settings "Paired Devices" section composable (`Lqs9;->c(Ly87;Lpz1;I)V` in 20.14.1). When
 * signed out it draws the `sign_in_with_google` button
 * (`Le60;->b(Lv17;Ljava/lang/String;Lid3;Lnva;ZLii4;Lpz1;II)V`) inside its own replace group,
 * followed by the "or Pair with code" row. The two string resources together are unique to it.
 */
object PairedDevicesSectionFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC, AccessFlags.FINAL),
    returnType = "V",
    parameters = listOf("L", "L", "I"),
    filters = listOf(
        fieldAccess(definingClass = R_STRING, name = "sign_in_with_google"),
        fieldAccess(definingClass = R_STRING, name = "pair_with_code"),
    ),
)

/**
 * Navigation drawer account footer composable (`Lez4;->d(Le02;I)V` in 20.16.1): a divider, then
 * a clickable row with the Google avatar and the display name/email, or "Sign into StayFree"
 * when signed out. The `sign_into_stayfree` string is only used here.
 */
object DrawerAccountFooterFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC, AccessFlags.FINAL),
    returnType = "V",
    parameters = listOf("L", "I"),
    filters = listOf(
        fieldAccess(definingClass = R_STRING, name = "sign_into_stayfree"),
    ),
)
