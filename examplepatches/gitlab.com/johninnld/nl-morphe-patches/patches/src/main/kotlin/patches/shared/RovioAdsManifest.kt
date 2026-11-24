package patches.shared

import org.w3c.dom.Document

/** Disable advertising providers before Application/game startup; keep AndroidX lifecycle intact. */
internal fun disableRovioAdStartup(manifest: Document) {
    disableComponents(manifest,
        "com.applovin.sdk.AppLovinInitProvider",
        "com.google.android.gms.ads.MobileAdsInitProvider",
        "com.facebook.ads.AudienceNetworkContentProvider",
        "com.vungle.ads.VungleProvider",
        "com.mbridge.msdk.config.component.status.MBComponentLifecycleProvider",
        "com.ironsource.lifecycle.IronsourceLifecycleProvider",
        "com.ironsource.lifecycle.LevelPlayActivityLifecycleProvider",
    )
    // Remove only the advertising initializer, preserving lifecycle, WorkManager and profiles.
    removeMetaData(manifest, "com.unity3d.services.core.configuration.AdsSdkInitializer")
}
