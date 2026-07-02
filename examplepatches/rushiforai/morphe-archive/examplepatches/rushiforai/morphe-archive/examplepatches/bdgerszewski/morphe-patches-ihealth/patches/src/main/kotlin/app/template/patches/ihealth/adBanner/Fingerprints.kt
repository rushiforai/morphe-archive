package app.template.patches.ihealth.adBanner

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall

// Fingerprints the method in DevicesFragment that loads and displays the ad banner.
// In the decompiled source this is `d()`, but the name is obfuscated and may change.
// The method loads the first ad image via Glide and then sets bottomAdRel visibility.
object ShowAdBannerDevicesFingerprint : Fingerprint(
    returnType = "V",
    definingClass = "Lcom/ihealth/business/common/mydevices/DevicesFragment;",
    filters = listOf(
        methodCall(
            definingClass = "Lcom/bumptech/glide/RequestManager;",
            name = "asBitmap",
        ),
        methodCall(
            definingClass = "Lcom/bumptech/glide/request/BaseRequestOptions;",
            name = "skipMemoryCache",
        ),
    )
)

// Fingerprints the equivalent method in SettingsFragment (the Account tab).
// In the decompiled source this is `a()`, but the name may change.
object ShowAdBannerSettingsFingerprint : Fingerprint(
    returnType = "V",
    definingClass = "Lcom/ihealth/business/common/settings/SettingsFragment;",
    filters = listOf(
        methodCall(
            definingClass = "Lcom/bumptech/glide/RequestManager;",
            name = "asBitmap",
        ),
        methodCall(
            definingClass = "Lcom/bumptech/glide/request/BaseRequestOptions;",
            name = "skipMemoryCache",
        ),
    )
)
