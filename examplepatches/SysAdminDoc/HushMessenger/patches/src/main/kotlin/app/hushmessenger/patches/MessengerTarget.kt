package app.hushmessenger.patches

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.SupportedAbi

/**
 * The stock Messenger builds the patches were checked against. APKMirror lists eight arm64 builds of 586 (one per
 * screen density, nodpi among them) and one armv7. Three of the arm64 ones (347215273, 347215275, 347215277) were
 * optimized differently, so strings and calls several finders anchor on sit in other methods, and they aren't here yet.
 *
 * A version name alone is insufficient: Meta publishes several DEX variants with that name. Each
 * build is recorded in scripts/profiles by CompatReport; the APKs themselves are local research
 * input, never part of this repository.
 */
internal object MessengerTarget {
    const val PACKAGE = "com.facebook.orca"
    const val MIN_SDK = 28

    /** Each supported version name and the version codes of its checked builds. */
    val VERSIONS: Map<String, List<Int>> = mapOf(
        "586.0.0.55.92" to listOf(347215257, 347215330, 347215341, 347215343, 347215344, 347215348),
    )
    val VERSION_CODES = VERSIONS.values.flatten()

    /** The ABI each checked build is for, as its record's APK ships native code for. */
    val ABIS: Map<Int, SupportedAbi> = mapOf(
        347215257 to SupportedAbi.ARM64_V8A,
        347215330 to SupportedAbi.ARM64_V8A,
        347215341 to SupportedAbi.ARMEABI_V7A,
        347215343 to SupportedAbi.ARM64_V8A,
        347215344 to SupportedAbi.ARM64_V8A,
        347215348 to SupportedAbi.ARM64_V8A,
    )

    /**
     * The build codes Manager is told for one version name: one per ABI, which it hands its APK download helper and
     * checks a picked APK against (#138: without them it linked an unsupported build of the same version). Null when
     * a build's ABI isn't recorded or an ABI has more than one build, since the map holds one code per ABI and a
     * missing ABI means any build. 586's several arm64 builds land here (#145), so Manager takes any 586 APK and the
     * patch-time check refuses one that isn't recorded.
     */
    fun exactCodes(codes: List<Int>, abis: Map<Int, SupportedAbi> = ABIS): Map<SupportedAbi, Int>? {
        val byAbi = codes.groupBy { abis[it] ?: return null }
        if (byAbi.values.any { it.size != 1 }) return null
        return byAbi.mapValues { it.value.single() }
    }

    private const val FACEBOOK_SIGNER =
        "e3f9e1e0cf99d0e56a055ba65e241b3399f7cea524326b0cdd6ec1327ed0fdc1"
    private const val META_SIGNER =
        "911d604446084ca7f4760b775bfc160fa8702441240a7258645d7a72c4312d27"

    /** "586.0.0.55.92 APK (version code 347215348)", joined with " or " across version names. */
    fun supportedApks(versions: Map<String, List<Int>> = VERSIONS): String =
        versions.entries.joinToString(" or ") { (name, codes) -> "$name APK (version code ${codes.joinToString(" or ")})" }

    fun compatibility(versions: Map<String, List<Int>>, abis: Map<Int, SupportedAbi> = ABIS) = Compatibility(
        name = "Messenger",
        packageName = PACKAGE,
        apkFileType = ApkFileType.APK,
        appIconColor = 0x0084FF,
        signatures = setOf(FACEBOOK_SIGNER, META_SIGNER),
        targets = versions.map { (name, codes) ->
            val builds = if (codes.size == 1) "build ${codes.single()}"
                else "builds ${codes.dropLast(1).joinToString(", ")} and ${codes.last()}"
            AppTarget(
                version = name,
                versionCodes = exactCodes(codes, abis),
                minSdk = MIN_SDK,
                description = "Stock $builds; checked again during patching",
            )
        },
    )

    val COMPATIBILITY = compatibility(VERSIONS)
}
