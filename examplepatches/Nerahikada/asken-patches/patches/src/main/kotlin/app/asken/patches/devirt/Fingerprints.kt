package app.asken.patches.devirt

import app.morphe.patcher.Fingerprint

object Vm0Fingerprint : Fingerprint(definingClass = "Landroidx/health/platform/client/impl/sdkservice/HealthDataSdkService;", name = "onBind", returnType = "Landroid/os/IBinder;", parameters = listOf("Landroid/content/Intent;"))
object Vm1Fingerprint : Fingerprint(definingClass = "Lcom/amazon/aps/ads/activity/ApsInterstitialActivity;", name = "onStart", returnType = "V", parameters = listOf())
object Vm2Fingerprint : Fingerprint(definingClass = "Lcom/amazon/aps/ads/activity/ApsInterstitialActivity;", name = "onStop", returnType = "V", parameters = listOf())
object Vm3Fingerprint : Fingerprint(definingClass = "Lcom/amazon/device/ads/DTBInterstitialActivity;", name = "onStart", returnType = "V", parameters = listOf())
object Vm4Fingerprint : Fingerprint(definingClass = "Lcom/amazon/device/ads/DTBInterstitialActivity;", name = "onStop", returnType = "V", parameters = listOf())
object Vm5Fingerprint : Fingerprint(definingClass = "Lcom/facebook/CustomTabActivity;", name = "onCreate", returnType = "V", parameters = listOf("Landroid/os/Bundle;"))
object Vm6Fingerprint : Fingerprint(definingClass = "Lcom/facebook/CustomTabActivity;", name = "onDestroy", returnType = "V", parameters = listOf())
object Vm7Fingerprint : Fingerprint(definingClass = "Lcom/facebook/CustomTabActivity;", name = "onStart", returnType = "V", parameters = listOf())
object Vm8Fingerprint : Fingerprint(definingClass = "Lcom/facebook/CustomTabActivity;", name = "onStop", returnType = "V", parameters = listOf())
object Vm9Fingerprint : Fingerprint(definingClass = "Lcom/facebook/FacebookContentProvider;", name = "delete", returnType = "I", parameters = listOf("Landroid/net/Uri;", "Ljava/lang/String;", "[Ljava/lang/String;"))
object Vm10Fingerprint : Fingerprint(definingClass = "Lcom/facebook/FacebookContentProvider;", name = "insert", returnType = "Landroid/net/Uri;", parameters = listOf("Landroid/net/Uri;", "Landroid/content/ContentValues;"))
object Vm11Fingerprint : Fingerprint(definingClass = "Lcom/facebook/FacebookContentProvider;", name = "onCreate", returnType = "Z", parameters = listOf())
object Vm12Fingerprint : Fingerprint(definingClass = "Lcom/facebook/FacebookContentProvider;", name = "query", returnType = "Landroid/database/Cursor;", parameters = listOf("Landroid/net/Uri;", "[Ljava/lang/String;", "Ljava/lang/String;", "[Ljava/lang/String;", "Ljava/lang/String;"))
object Vm13Fingerprint : Fingerprint(definingClass = "Lcom/facebook/FacebookContentProvider;", name = "update", returnType = "I", parameters = listOf("Landroid/net/Uri;", "Landroid/content/ContentValues;", "Ljava/lang/String;", "[Ljava/lang/String;"))
object Vm14Fingerprint : Fingerprint(definingClass = "Lcom/google/firebase/auth/internal/GenericIdpActivity;", name = "onStart", returnType = "V", parameters = listOf())
object Vm15Fingerprint : Fingerprint(definingClass = "Lcom/google/firebase/auth/internal/GenericIdpActivity;", name = "onStop", returnType = "V", parameters = listOf())
object Vm16Fingerprint : Fingerprint(definingClass = "Lcom/google/firebase/auth/internal/RecaptchaActivity;", name = "onStart", returnType = "V", parameters = listOf())
object Vm17Fingerprint : Fingerprint(definingClass = "Lcom/google/firebase/auth/internal/RecaptchaActivity;", name = "onStop", returnType = "V", parameters = listOf())
object Vm18Fingerprint : Fingerprint(definingClass = "Lio/repro/android/DeepLinkHandler;", name = "onStart", returnType = "V", parameters = listOf())
object Vm19Fingerprint : Fingerprint(definingClass = "Lio/repro/android/DeepLinkHandler;", name = "onStop", returnType = "V", parameters = listOf())
