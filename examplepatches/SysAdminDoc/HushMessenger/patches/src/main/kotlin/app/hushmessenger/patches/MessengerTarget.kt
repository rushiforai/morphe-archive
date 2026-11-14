package app.hushmessenger.patches

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.SupportedAbi

/**
 * The stock Messenger builds the patches were checked against. APKMirror lists sixteen arm64 builds of 587 (several
 * per screen density, nodpi among them) and three armv7 ones, and every one is here. Four of the arm64 ones
 * (347415280, 347415281, 347415284, 347415285) went through another Redex pass, so they keep pooled strings, merged
 * classes and inlined helpers of their own and share their own profile. Two more (347415302, 347415355) carry the
 * main build's code under other class names and share a profile of their own, and the three armv7 builds share one.
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
        "587.0.0.54.96" to listOf(
            347415262, 347415267, 347415268, 347415280, 347415281, 347415284, 347415285, 347415295, 347415299,
            347415301, 347415302, 347415333, 347415337, 347415348, 347415350, 347415351, 347415352, 347415354, 347415355,
        ),
    )
    val VERSION_CODES = VERSIONS.values.flatten()

    /** The ABI each checked build is for, as its record's APK ships native code for. */
    val ABIS: Map<Int, SupportedAbi> = mapOf(
        347415262 to SupportedAbi.ARMEABI_V7A,
        347415267 to SupportedAbi.ARM64_V8A,
        347415268 to SupportedAbi.ARM64_V8A,
        347415280 to SupportedAbi.ARM64_V8A,
        347415281 to SupportedAbi.ARM64_V8A,
        347415284 to SupportedAbi.ARM64_V8A,
        347415285 to SupportedAbi.ARM64_V8A,
        347415295 to SupportedAbi.ARMEABI_V7A,
        347415299 to SupportedAbi.ARM64_V8A,
        347415301 to SupportedAbi.ARM64_V8A,
        347415302 to SupportedAbi.ARM64_V8A,
        347415333 to SupportedAbi.ARM64_V8A,
        347415337 to SupportedAbi.ARM64_V8A,
        347415348 to SupportedAbi.ARMEABI_V7A,
        347415350 to SupportedAbi.ARM64_V8A,
        347415351 to SupportedAbi.ARM64_V8A,
        347415352 to SupportedAbi.ARM64_V8A,
        347415354 to SupportedAbi.ARM64_V8A,
        347415355 to SupportedAbi.ARM64_V8A,
    )

    /**
     * The build codes Manager is told for one version name: one per ABI, which it hands its APK download helper and
     * checks a picked APK against (#138: without them it linked an unsupported build of the same version). Null when
     * a build's ABI isn't recorded or an ABI has more than one build, since the map holds one code per ABI and a
     * missing ABI means any build. 587's several builds per ABI land here (#145), so Manager takes any 587 APK and the
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

    /** "587.0.0.54.96 APK (version code 347415354)", joined with " or " across version names. */
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
