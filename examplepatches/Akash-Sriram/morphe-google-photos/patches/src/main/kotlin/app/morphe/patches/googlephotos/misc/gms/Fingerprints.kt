/*
 * Forked from:
 * https://gitlab.com/ReVanced/revanced-patches/-/blob/main/patches/src/main/kotlin/app/revanced/patches/googlephotos/misc/gms/Fingerprints.kt
 */
package app.morphe.patches.googlephotos.misc.gms

import app.morphe.patcher.Fingerprint
import app.morphe.patches.googlephotos.misc.gms.Constants.PHOTOS_APPLICATION_CLASS_TYPE
import app.morphe.patches.googlephotos.misc.gms.Constants.PHOTOS_MAIN_ACTIVITY_CLASS_TYPE
import app.morphe.util.getReference
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

internal object PhotosApplicationOnCreateFingerprint : Fingerprint(
    definingClass = PHOTOS_APPLICATION_CLASS_TYPE,
    name = "onCreate",
    returnType = "V",
    parameters = listOf(),
)

internal object HomeActivityOnCreateFingerprint : Fingerprint(
    definingClass = PHOTOS_MAIN_ACTIVITY_CLASS_TYPE,
    name = "onCreate",
    returnType = "V",
    parameters = listOf("Landroid/os/Bundle;"),
)

/**
 * Matches GooglePlayServicesUtilLight.isGooglePlayServicesAvailable(Context, int).
 *
 * The bundled check rejects GmsCore's non-Google signature with SERVICE_INVALID even after
 * account authentication succeeds. Match the method using the stable availability-check anchor
 * also used by the upstream ReVanced fix instead of relying on any obfuscated method name.
 */
internal object IsGooglePlayServicesAvailableFingerprint : Fingerprint(
    returnType = "I",
    parameters = listOf("L", "I"),
    strings = listOf("Google Play Services not available"),
)

private fun Method.referencesString(value: String) =
    implementation?.instructions?.any {
        it.getReference<StringReference>()?.string == value
    } == true

private fun Method.referencesStringContaining(value: String) =
    implementation?.instructions?.any {
        it.getReference<StringReference>()?.string?.contains(value) == true
    } == true

private fun Method.referencesMethod(returnType: String, parameters: List<String>? = null) =
    implementation?.instructions?.any {
        it.getReference<MethodReference>()?.let { ref ->
            ref.returnType == returnType && (parameters == null || ref.parameterTypes.toList() == parameters)
        } == true
    } == true

private fun Method.referencesVoidMethodWithSingleObjectParameter() =
    implementation?.instructions?.any {
        it.getReference<MethodReference>()?.let { ref ->
            ref.returnType == "V" &&
                ref.parameterTypes.size == 1 &&
                ref.parameterTypes.first().startsWith("L")
        } == true
    } == true

private fun Method.referencesIntLiteral(value: Int) =
    implementation?.instructions?.any {
        it is NarrowLiteralInstruction && it.narrowLiteral == value
    } == true

private fun ClassDef.hasMethodReferencingString(value: String) =
    methods.any { it.referencesString(value) }

private fun ClassDef.hasMethodReferencingStringContaining(value: String) =
    methods.any { it.referencesStringContaining(value) }

/**
 * Matches `<clinit>` of AccountValidityMonitor.
 */
internal object AccountValidityMonitorFingerprint : Fingerprint(
    name = "<clinit>",
    strings = listOf("AccountValidityMonitor"),
)

/**
 * Matches method `c` in FrictionlessAccountHandler which contains "ProvideFrctAccountTask".
 */
internal object FrictionlessEligibilityTaskFingerprint : Fingerprint(
    name = "c",
    returnType = "V",
    parameters = listOf(),
    strings = listOf("ProvideFrctAccountTask"),
)

/**
 * Matches `CurrentLocationMixin.ar(View, Bundle)` — view initialization where map/FAB are set up.
 */
internal object CurrentLocationMixinOnViewCreatedFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf("Landroid/view/View;", "Landroid/os/Bundle;"),
    strings = listOf("state_my_location_enabled"),
)

/**
 * Matches the Google Photos IP protection compliance handler method which checks
 * `should_enforce_ip_protection` and launches UncertifiedDeviceActivity.
 */
internal object GmsDeviceComplianceCheckFingerprint : Fingerprint(
    returnType = "V",
    strings = listOf(
        "should_enforce_ip_protection",
        "Failed to get IP protection enforcement result",
    ),
)

/**
 * Matches `UncertifiedDeviceActivity.onCreate(Bundle)` in GMS compliance UI.
 */
internal object UncertifiedDeviceActivityOnCreateFingerprint : Fingerprint(
    definingClass = "Lcom/google/android/gms/gmscompliance/ui/UncertifiedDeviceActivity;",
    name = "onCreate",
    returnType = "V",
    parameters = listOf("Landroid/os/Bundle;"),
)

/**
 * Matches `ba()` in MapExploreFragment — the camera idle / bounds update method.
 */
internal object MapCameraIdleFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf(),
    strings = listOf("updateCurrentMediaForBounds: currentMedia location is missing"),
)

/**
 * Matches `bd()` in MapExploreFragment — the map view projection / bounds sync method.
 */
internal object MapViewBoundsSyncFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf(),
    strings = listOf("com.google.android.gms.dynamic.IObjectWrapper"),
    custom = { method, classDef ->
        method.referencesVoidMethodWithSingleObjectParameter() &&
            classDef.hasMethodReferencingString("updateCurrentMediaForBounds: currentMedia location is missing")
    },
)

/**
 * Matches Google Photos' internal permission coordinator requestPermissions method.
 *
 * This method checks if any existing requests are pending in its SparseArray and throws:
 * "Cannot request permissions $requestCode when already requested $pendingMap".
 * On Android 16/17 and fresh installs, concurrent permission prompts (e.g. POST_NOTIFICATIONS
 * and storage permissions) trigger this throw, causing a fatal launch crash (Issue #42).
 */
internal object PermissionCoordinatorRequestPermissionsFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf("L", "I", "Ljava/util/List;"),
    strings = listOf(
        "Cannot request permissions ",
        " when already requested ",
    ),
)

/**
 * Matches Places Map photo grid scroll jump method (Lazlv.o in 7.99, Lakia.c in 7.98).
 */
internal object PlacesMapScrollJumpFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf("L", "I", "I"),
    strings = listOf("Cannot scroll to position using layout manager "),
)

/**
 * Matches mapexplore.GetMediaCollectionDateRangeTask caller method (Lallu.h in 7.99, Lalgt.h in 7.98).
 */
internal object MapExploreDateRangeFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf("I", "L"),
    strings = listOf("mapexplore.GetMediaCollectionDateRangeTask"),
)

/**
 * Matches <clinit> of the class defining photos.killswitch_info_panel_map flag.
 */
internal object KillswitchInfoPanelMapFingerprint : Fingerprint(
    name = "<clinit>",
    strings = listOf("photos.killswitch_info_panel_map"),
)



