package app.stayfree.patches.login

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.methodCall
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode

private const val R_STRING = "Lcom/burockgames/R\$string;"

/**
 * Onboarding page-list builder (`Lp07;->d(Z)Ljava/util/List;` in 20.18.1). 20.18 rewrote
 * onboarding: the `OnboardingPageType` enum is gone, replaced by an obfuscated enum (`Lqs7;`)
 * whose entry names survived. The builder returns
 * `listOf(Welcome, Terms, GoogleSignIn, UsagePermission, Reveal, GoalPicker, Accessibility[Autostart])`;
 * the `(Z)List` static shape plus the `GoogleSignIn` read is unique to it.
 */
object OnboardingPagesFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "Ljava/util/List;",
    parameters = listOf("Z"),
    filters = listOf(
        fieldAccess(name = "GoogleSignIn", opcode = Opcode.SGET_OBJECT),
        methodCall(name = "listOf"),
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
