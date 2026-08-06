package spooky.morphe.patches.beeline.unlockplus

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags

object PremiumMapTypesFingerprint : Fingerprint(
    /**
     * Defining class type is matched using implicit comparison depending on how the type is declared.
     *
     * This can be a package without a class: ":com/some/app/ads/"
     * A class without a package: "/AdsLoader;"
     * Or a full class if the full class name is not obfuscated: "Lcom/some/app/ads/AdsLoader;"
     *
     * See [app.morphe.patcher.StringComparisonType] for more.
     */
    // definingClass = ":defpackage/",
    /**
     * Exact method name.
     */
    name = "isPlusStyle",
    /**
     * Exact access flags.
     */
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    /**
     * Return type. Partial matches are allowed and follows the same rules as [definingClass]
     * and [app.morphe.patcher.StringComparisonType].
     */
    returnType = "Z"
)

object MainViewModelisPlusActiveFingerprint : Fingerprint(
    definingClass = "/MainViewModel;",
    name = "isPlusActive",
    returnType = "Z"
)

object PlanRouteAutoRouteUiStateisBeelinePlusActiveFingerprint : Fingerprint(
    definingClass = "/PlanRouteAutoRouteUiState;",
    name = "isBeelinePlusActive",
    returnType = "Z"
)

object OptionsDialogUiStateisUserAnonymousFingerprint : Fingerprint(
    definingClass = "/OptionsDialogUiState;",
    name = "isUserAnonymous",
    returnType = "Z"
)

object OptionsDialogUiStateisPlusActiveFingerprint : Fingerprint(
    definingClass = "/OptionsDialogUiState;",
    name = "isPlusActive",
    returnType = "Z"
)

object OptionsDialogUiStateisPlusAvailableOrActiveFingerprint : Fingerprint(
    definingClass = "/OptionsDialogUiState;",
    name = "isPlusAvailableOrActive",
    returnType = "Z"
)

object SettingsViewModelgetShowPlusSignUpScreenFingerprint : Fingerprint(
    definingClass = "/SettingsViewModel;",
    name = "getShowPlusSignUpScreen",
    returnType = "Z"
)

object isPlusAvailableInLocaleFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    parameters = listOf(),
    returnType = "Z",
    filters = listOf(string("androidPlusCountries"))
)
