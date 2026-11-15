package spooky.morphe.patches.beeline.unlockplus

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference

// ─────────────────────────────────────────────────────────────────────────────
// Fingerprints for Beeline. Names found unobfuscated (main package) are matched
// by definingClass; the obfuscated utility classes are matched by content
// filters (strings / unique method signatures) instead, so they survive
// re-obfuscation between builds.
//
// Validated against 4.2.8704 and 4.2.9196 (xapk).
//
// 4.2.9196 obfuscated every co.beeline UI class 4.2.8704 still kept readable —
// MainViewModel, SettingsViewModel, PlanRouteAutoRouteUiState and
// OptionsDialogUiState lost their class names AND their named Kotlin getters
// (`isPlusActive()Z`, `getShowPlusSignUpScreen()Z`, …). The fingerprints below
// that match those named classes/methods therefore only ever match 4.2.8704 and
// are applied best-effort (methodOrNull) in UnlockBeelinePlusPatch.
//
// 4.2.9196 gates Plus through a single source of truth instead:
//   SubscriptionManager.a()Z   — read directly by 14 ViewModels/UI classes
//   PlusState (data class)     — isActive/wasActive/isAvailable/… snapshot,
//                                collected as a StateFlow by the Compose UI
// Both are matched content-wise (obfuscated jw9 → f2d, io7 → l0a).
//
// Mapping table of obfuscated classes (4.2.8704 → 4.2.9196):
//   MainViewModel              co.beeline.ui.main.MainViewModel → renamed (no dedicated gate method left)
//   PlanRouteAutoRouteUiState  co.beeline.ui.route.viewmodels.… → renamed (only the Kotlin
//                              toString() template "PlanRouteAutoRouteUiState(" survives)
//   OptionsDialogUiState       co.beeline.ui.common.dialogs.options.… → renamed (same)
//   SettingsViewModel          co.beeline.ui.settings.SettingsViewModel → renamed
//   isPlusStyle                e96 → u18 (MapType enum; method name kept by R8)
//   isPlusAvailableInLocale    kn7$b → iz9 (RemoteConfig "androidPlusCountries" check)
//   PlusSubscriptionState      jw9 → f2d (RevenueCat CustomerInfo handler)
//   PlusState                  io7 → l0a (toString() template "PlusState(isActive=")
// ─────────────────────────────────────────────────────────────────────────────

object PremiumMapTypesFingerprint : Fingerprint(
    name = "isPlusStyle",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
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

/**
 * The app's subscription state holder (single source of truth for "is Plus
 * active"). Several ViewModels read `a()Z` on this class DIRECTLY (Home /
 * PlanRoute / RouteMap / Destination / ride coordinator), bypassing the wrapper
 * getters, so we patch the source of truth itself.
 *
 * 4.2.8704 = jw9 (`a()Z`, `b(CustomerInfo)V`), 4.2.9196 = f2d (`a()Z`,
 * `b(CustomerInfo)Z`). The CustomerInfo handler is the only single-parameter
 * `CustomerInfo` method in the class in either build, so the matcher accepts any
 * return type for it and stays valid across re-obfuscation.
 *
 * Matcher: any parameterless `a()Z` in the class that also owns the
 * RevenueCat `CustomerInfo` handler — unique to the subscription manager.
 */
object PlusSubscriptionStateFingerprint : Fingerprint(
    name = "a",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    parameters = listOf(),
    returnType = "Z",
    custom = { _, classDef ->
        classDef.methods.any { m ->
            m.parameterTypes.singleOrNull() == "Lcom/revenuecat/purchases/CustomerInfo;"
        }
    }
)

/**
 * `PlusState` — the immutable subscription snapshot distributed as a StateFlow
 * (`isActive`, `wasActive`, `isAvailable`, `isTrial`, `isPromotion`,
 * `canBeManaged`, `expirationDate`). 4.2.8704 = io7, 4.2.9196 = l0a. Its field 1
 * (`isActive`) backs every Compose UI gate, so it is forced to `true` in the
 * constructor (see UnlockBeelinePlusPatch).
 *
 * The class name is obfuscated, but the Kotlin `toString()` template string
 * `"PlusState(isActive="` survives obfuscation in both builds — the class is the
 * only one carrying it. Match: the public constructor
 * `(Z×6, Long)V` inside that class.
 */
object PlusStateConstructorFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.CONSTRUCTOR),
    parameters = listOf("Z", "Z", "Z", "Z", "Z", "Z", "Ljava/lang/Long;"),
    returnType = "V",
    custom = { _, classDef ->
        classDef.methods.any { m ->
            m.name == "toString" && m.implementation?.instructions?.any { ins ->
                (ins as? ReferenceInstruction)?.reference is StringReference &&
                    ((ins as ReferenceInstruction).reference as StringReference)
                        .string == "PlusState(isActive="
            } == true
        }
    }
)
