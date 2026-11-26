package app.hushmessenger.patches

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.SupportedAbi

/**
 * The stock Messenger builds the patches were checked against. APKMirror lists sixteen arm64 builds of 588 (several
 * per screen density, nodpi among them) and four armv7 ones (347617497, 347617513, 347617566, 347617583), and every
 * one is here. The arm64 builds share one profile and the armv7 builds, which carry the same code under other Redex
 * names, share another.
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
        "588.1.0.66.98" to listOf(
            347617497, 347617499, 347617503, 347617513, 347617515, 347617516, 347617517, 347617519, 347617532, 347617533,
            347617535, 347617537, 347617566, 347617569, 347617572, 347617583, 347617586, 347617587, 347617588, 347617590,
        ),
    )
    val VERSION_CODES = VERSIONS.values.flatten()

    /** The ABI each checked build is for, as its record's APK ships native code for. */
    val ABIS: Map<Int, SupportedAbi> = mapOf(
        347617497 to SupportedAbi.ARMEABI_V7A,
        347617499 to SupportedAbi.ARM64_V8A,
        347617503 to SupportedAbi.ARM64_V8A,
        347617513 to SupportedAbi.ARMEABI_V7A,
        347617515 to SupportedAbi.ARM64_V8A,
        347617516 to SupportedAbi.ARM64_V8A,
        347617517 to SupportedAbi.ARM64_V8A,
        347617519 to SupportedAbi.ARM64_V8A,
        347617532 to SupportedAbi.ARM64_V8A,
        347617533 to SupportedAbi.ARM64_V8A,
        347617535 to SupportedAbi.ARM64_V8A,
        347617537 to SupportedAbi.ARM64_V8A,
        347617566 to SupportedAbi.ARMEABI_V7A,
        347617569 to SupportedAbi.ARM64_V8A,
        347617572 to SupportedAbi.ARM64_V8A,
        347617583 to SupportedAbi.ARMEABI_V7A,
        347617586 to SupportedAbi.ARM64_V8A,
        347617587 to SupportedAbi.ARM64_V8A,
        347617588 to SupportedAbi.ARM64_V8A,
        347617590 to SupportedAbi.ARM64_V8A,
    )

    /**
     * The build codes Manager is told for one version name: one per ABI, which it hands its APK download helper and
     * checks a picked APK against (#138: without them it linked an unsupported build of the same version). Null when
     * a build's ABI isn't recorded or an ABI has more than one build, since the map holds one code per ABI and a
     * missing ABI means any build. 588's several builds per ABI land here (#145), so Manager takes any 588 APK and the
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

    /** "588.1.0.66.98 APK (version code 347617503)", joined with " or " across version names. */
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
