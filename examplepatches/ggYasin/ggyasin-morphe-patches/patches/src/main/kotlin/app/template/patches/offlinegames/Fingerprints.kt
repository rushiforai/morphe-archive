package app.template.patches.offlinegames

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.SupportedAbi
import app.morphe.patcher.patch.ResourcePatchContext
import java.io.File
import java.security.MessageDigest
import java.util.logging.Logger

internal val OFFLINE_GAMES_COMPATIBILITY = Compatibility(
    name = "Offline Games",
    packageName = "com.JindoBlu.OfflineGames",
    apkFileType = ApkFileType.XAPK_REQUIRED,
    appIconColor = 0x263238,
    targets = listOf(
        AppTarget(version = "3.15.3", versionCodes = mapOf(SupportedAbi.ARM64_V8A to 3327)),
        AppTarget(version = "3.14.1", versionCodes = mapOf(SupportedAbi.ARMEABI_V7A to 3204)),
    ),
)

/** Offsets are file offsets, resolved independently using IL2CPP method-token RIDs. */
internal class NativeEdit(val name: String, val offset: Int, original: String, replacement: String) {
    val original = hex(original)
    val replacement = hex(replacement)
    init {
        require(this.original.size == this.replacement.size)
    }
}

// In ShowRewardedAd, the closure and its callback are already initialized. Route both
// ready/not-ready results to the existing showHouseAd closure (0x17efa6c), via 0x16f4924.
internal val rewardedAdFallback = NativeEdit(
    "GameViewExt.ShowRewardedAd -> showHouseAd", 0x16F47E8,
    "06 00 00 0a", "4d 00 00 ea",
)
// Dedicated rewarded adapter; banners/interstitial adapters use other implementations.
internal val rewardedAdDownload = NativeEdit(
    "ApplovinRewardedAd.LoadMaxSdkAd", 0x12A22F8,
    "30 48 2d e9", "1e ff 2f e1",
)

// HouseAdPopupView.Open: SetActive(counter > 0) on secondsTextWrapper (+0x38).
internal val houseAdHideCounter = NativeEdit(
    "HouseAdPopupView.Open hide seconds wrapper", 0x15B6EB0,
    "01 10 00 c3", "00 10 a0 e3",
)
// HouseAdPopupView.Open: SetActive(counter == 0) on closeButton (+0x40).
internal val houseAdShowClose = NativeEdit(
    "HouseAdPopupView.Open show closeButton", 0x15B6EDC,
    "a0 12 a0 e1", "01 10 a0 e3",
)
// <>c__DisplayClass15_0.<Open>b__0 copies duration into counter (+0x4c).
// Zeroing only that argument preserves the completion callback and product selection.
internal val houseAdCounter = NativeEdit(
    "HouseAdPopupView.Open initialize counter", 0x15B78AC,
    "08 60 90 e5", "00 60 a0 e3",
)
// Token 0x060008bf: the real click handler. ClosePressed (0x15b7750) is preserved.
internal val houseAdStoreRedirect = NativeEdit(
    "HouseAdPopupView.OpenStorePage", 0x15B77AC,
    "30 48 2d e9", "1e ff 2f e1",
)

// InitializeFirebaseCo has already started Firebase and registered its completion
// callback. Use the existing timeout continuation instead of yielding another frame
// while Remote Config is pending. This is the 35% -> 40% loading-screen stage.
internal val startupFirebaseWait = NativeEdit(
    "LoaderView.InitializeFirebaseCo stop waiting", 0x128526C,
    "06 00 00 aa", "06 00 00 ea",
)

// DetectCountryCode runs separately. Continue through the existing missing-country
// path instead of blocking startup up to ten seconds for its callback.
internal val startupCountryWait = NativeEdit(
    "LoaderView.LoadCo stop waiting for country", 0x12859DC,
    "f3 00 00 0a", "f3 00 00 ea",
)

// Preserve the enumerator and call the existing StartCoroutine parallel branch.
// Consent/ad-permission checks still precede this point.
internal val startupParallelAds = NativeEdit(
    "LoaderView.LoadCo initialize ads in parallel", 0x1286A24,
    "6c 00 00 0a", "00 f0 20 e3",
)

internal val startupEdits = listOf(startupFirebaseWait, startupCountryWait, startupParallelAds)

private val armv7Edits = listOf(
    rewardedAdFallback, rewardedAdDownload, houseAdHideCounter,
    houseAdShowClose, houseAdCounter, houseAdStoreRedirect,
) + startupEdits

// Restore obsolete changes when upgrading an output from 1.2.x–1.4.1. In particular,
// 0x15b7aa4 is IEnumerator.Reset (not OpenStorePage), and 0x17efe70 belongs to the
// house-ad completion callback (not the rewarded request decision).
private val retiredEdits = listOf(
    NativeEdit("legacy completion callback", 0x17EFE70, "12 00 00 0a", "12 00 00 ea"),
    NativeEdit("legacy debug duration", 0x17EFD0C, "03 10 a0 e3", "01 10 a0 e3"),
    NativeEdit("legacy normal duration", 0x17EFD18, "0f 10 00 03", "01 10 00 03"),
    NativeEdit("legacy subtraction", 0x15B7998, "01 00 40 e2", "0f 00 40 e2"),
    NativeEdit("legacy coroutine branch", 0x15B79C4, "05 00 00 ca", "17 00 00 ea"),
    NativeEdit("legacy tick", 0x15B79F0, "fe 15 a0 e3", "3b 14 a0 e3"),
    NativeEdit("legacy IEnumerator.Reset", 0x15B7AA4, "10 40 2d e9", "1e ff 2f e1"),
)

/** Each architecture has independently verified instructions; offsets are not interchangeable. */
internal class NativeBuild(
    val version: String,
    val abi: String,
    val size: Int,
    val sha256: String,
    val edits: List<NativeEdit>,
    val retired: List<NativeEdit> = emptyList(),
) {
    val path = "lib/$abi/libil2cpp.so"
}

private val nativeBuilds = listOf(
    NativeBuild(
        "3.14.1", "armeabi-v7a", 73_310_748,
        "dd619f322538d339137e30a8c53e913ddecb59e78296ba86a79f058853ba0512",
        armv7Edits, retiredEdits,
    ),
    NativeBuild(
        "3.15.3", "arm64-v8a", 90_250_192,
        "80dbeb4bd8f5cd8e1f5c2590c410ac4a49defd56a5cd64a11dc455c18947d74e",
        listOf(
            NativeEdit(rewardedAdFallback.name, 0x2AA08A0, "e0 00 00 36", "3e 00 00 14"),
            NativeEdit(rewardedAdDownload.name, 0x258DDDC, "fe 57 be a9", "c0 03 5f d6"),
            NativeEdit(houseAdHideCounter.name, 0x28EC630, "e1 d7 9f 1a", "e1 03 1f 2a"),
            NativeEdit(houseAdShowClose.name, 0x28EC64C, "e1 17 9f 1a", "21 00 80 52"),
            NativeEdit(houseAdCounter.name, 0x28ECE4C, "08 10 40 b9", "e8 03 1f 2a"),
            NativeEdit(houseAdStoreRedirect.name, 0x28ECD60, "fe 0f 1e f8", "c0 03 5f d6"),
            NativeEdit(startupFirebaseWait.name, 0x257631C, "0a 01 00 54", "08 00 00 14"),
            NativeEdit(startupCountryWait.name, 0x2576C48, "c0 1a 00 36", "d6 00 00 14"),
            NativeEdit(startupParallelAds.name, 0x2577360, "95 0a 00 36", "1f 20 03 d5"),
        ),
    ),
)

internal fun ResourcePatchContext.offlineGamesBuild(): NativeBuild {
    val version = packageMetadata.versionName
    return nativeBuilds.singleOrNull { it.version == version && this[it.path].isFile }
        ?: throw PatchException("Unsupported Offline Games $version native build. Use 3.15.3 ARM64 or 3.14.1 ARMv7, with the complete APKS/XAPK.")
}

internal fun ResourcePatchContext.patchOfflineGamesLibrary(selected: List<NativeEdit>) {
    val build = offlineGamesBuild()
    val names = selected.map { it.name }.toSet()
    val edits = build.edits.filter { it.name in names }
    check(edits.size == names.size) { "Missing version-specific Offline Games edit" }
    patchIl2CppLibrary(this[build.path], build, edits)
}

/** Accept only the original binary plus precisely the edits this repository has shipped. */
private fun patchIl2CppLibrary(library: File, build: NativeBuild, selected: List<NativeEdit>) {
    val bytes = library.readBytes()
    if (bytes.size != build.size) throw PatchException("Unsupported ${build.version} ${build.abi} library size: ${bytes.size}.")
    val normalized = bytes.copyOf()
    (build.edits + build.retired).forEach { edit ->
        if (!bytes.matchesAt(edit.offset, edit.original) && !bytes.matchesAt(edit.offset, edit.replacement)) {
            throw PatchException("Unexpected bytes at ${edit.name} (0x${edit.offset.toString(16)}). Use the original ${build.version} ${build.abi} bundle.")
        }
        edit.original.copyInto(normalized, edit.offset)
    }
    if (normalized.sha256() != build.sha256) {
        throw PatchException("Unknown libil2cpp.so modifications outside supported edits. SHA-256: ${bytes.sha256()}")
    }
    build.retired.forEach { it.original.copyInto(bytes, it.offset) }
    selected.forEach { it.replacement.copyInto(bytes, it.offset) }
    library.writeBytes(bytes)
    check(library.readBytes().contentEquals(bytes)) { "Native library read-back failed" }
    Logger.getLogger("PatchLabOfflineGames").info("Verified ${build.version} ${build.abi} native output SHA-256: ${bytes.sha256()}")
}

private fun ByteArray.matchesAt(offset: Int, expected: ByteArray) =
    expected.indices.all { this[offset + it] == expected[it] }

private fun hex(text: String) = text.split(' ').map { it.toInt(16).toByte() }.toByteArray()

private fun ByteArray.sha256() = MessageDigest.getInstance("SHA-256").digest(this)
    .joinToString("") { "%02x".format(it.toInt() and 0xff) }
