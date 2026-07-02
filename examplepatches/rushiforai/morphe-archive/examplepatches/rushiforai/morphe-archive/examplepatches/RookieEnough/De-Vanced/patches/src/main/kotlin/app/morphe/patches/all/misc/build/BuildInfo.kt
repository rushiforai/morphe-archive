/*
 * Forked from:
 * https://gitlab.com/ReVanced/revanced-patches/-/blob/main/patches/src/main/kotlin/app/revanced/patches/all/misc/build/BaseSpoofBuildInfoPatch.kt
 * (BuildInfo class in same file there)
 */

/*
 * Forked from:
 * https://gitlab.com/ReVanced/revanced-patches/-/blob/main/patches/src/main/kotlin/app/revanced/patches/all/misc/build/BuildInfo.kt
 */
package app.morphe.patches.all.misc.build

/**
 * Build properties to spoof. Used so the app (and Google servers) see a Pixel device
 * and grant unlimited storage. Only non-null fields are patched.
 */
data class BuildInfo(
    val board: String? = null,
    val bootloader: String? = null,
    val brand: String? = null,
    val cpuAbi: String? = null,
    val cpuAbi2: String? = null,
    val device: String? = null,
    val display: String? = null,
    val fingerprint: String? = null,
    val hardware: String? = null,
    val host: String? = null,
    val id: String? = null,
    val manufacturer: String? = null,
    val model: String? = null,
    val odmSku: String? = null,
    val product: String? = null,
    val radio: String? = null,
    val serial: String? = null,
    val sku: String? = null,
    val socManufacturer: String? = null,
    val socModel: String? = null,
    val tags: String? = null,
    val time: Long? = null,
    val type: String? = null,
    val user: String? = null,
)
