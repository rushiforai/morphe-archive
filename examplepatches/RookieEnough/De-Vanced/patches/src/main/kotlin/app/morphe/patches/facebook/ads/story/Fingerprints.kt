/*
 * Forked from:
 * https://gitlab.com/ReVanced/revanced-patches/-/blob/main/patches/src/main/kotlin/app/revanced/patches/facebook/ads/story/Fingerprints.kt
 */
package app.morphe.patches.facebook.ads.story

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.iface.value.StringEncodedValue

private fun runMethod(fieldValue: String) = Fingerprint(
    returnType = "V",
    parameters = listOf(),
    custom = { method, classDef ->
        method.name == "run" &&
            classDef.fields.any { field ->
                if (field.name != "__redex_internal_original_name") return@any false
                (field.initialValue as? StringEncodedValue)?.value == fieldValue
            }
    },
)

internal val AdsInsertionMethodFingerprint = runMethod("AdBucketDataSourceUtil\$attemptAdsInsertion\$1")

internal val FetchMoreAdsMethodFingerprint = runMethod("AdBucketDataSourceUtil\$attemptFetchMoreAds\$1")

