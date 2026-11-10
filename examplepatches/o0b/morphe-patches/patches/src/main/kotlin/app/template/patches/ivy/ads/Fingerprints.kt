// recon 2026-11-09
package app.template.patches.ivy.ads

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags

internal object MobileAdsInitProviderAttachInfoFingerprint : Fingerprint(
 name = "attachInfo",
 definingClass = "Lcom/google/android/gms/ads/MobileAdsInitProvider;",
 returnType = "V",
 accessFlags = listOf(AccessFlags.PUBLIC),
 parameters = listOf("Landroid/content/Context;", "Landroid/content/pm/ProviderInfo;"),
 filters = listOf(
  methodCall(definingClass = "Lcom/google/android/gms/internal/ads/zzabg;", name = "attachInfo"),
 ),
)

internal object MobileAdsInitProviderOnCreateFingerprint : Fingerprint(
 name = "onCreate",
 definingClass = "Lcom/google/android/gms/ads/MobileAdsInitProvider;",
 returnType = "Z",
 accessFlags = listOf(AccessFlags.PUBLIC),
 parameters = listOf(),
 filters = listOf(
  methodCall(definingClass = "Lcom/google/android/gms/internal/ads/zzabg;", name = "onCreate"),
 ),
)

internal object IvyApplicationOnCreateAdFingerprint : Fingerprint(
 name = "onCreate",
 definingClass = "Lcom/stinger/ivy/IvyApplication;",
 returnType = "V",
 accessFlags = listOf(AccessFlags.PUBLIC),
 parameters = listOf(),
 filters = listOf(
  string("ca-app-pub-3940256099942544~3347511713"),
 ),
)

internal object QuickPanelViewOnFinishInflateAdFingerprint : Fingerprint(
 name = "onFinishInflate",
 definingClass = "Lcom/stinger/ivy/quickpanel/QuickPanelView;",
 returnType = "V",
 accessFlags = listOf(AccessFlags.PROTECTED),
 parameters = listOf(),
 filters = listOf(
  methodCall(definingClass = "Lcom/google/android/gms/ads/AdRequest\$Builder;", name = "build"),
 ),
)