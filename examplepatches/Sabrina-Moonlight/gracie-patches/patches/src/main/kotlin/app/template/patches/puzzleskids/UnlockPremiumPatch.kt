package app.template.patches.puzzleskids

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.rawResourcePatch
import app.morphe.patcher.util.returnEarly
import com.android.tools.smali.dexlib2.AccessFlags
import app.template.patches.shared.cert.extractApkCertificatePatch
import app.template.patches.shared.firebase.spoofFirebaseCertHashPatch
import app.template.patches.shared.installer.spoofInstallSourcePatch
import app.template.patches.shared.signature.spoofSignatureVerificationPatch
import java.io.RandomAccessFile
import java.util.logging.Logger

/**
 * Puzzles Kids — unlock levels + hide Rate Us / More Apps / in-house promo.
 *
 * Premium: force GameData.isFullVersion loads (LDRB W8,[X8,#0x16] -> MOV W8,#1)
 * in game code range so MenuLoad.RemoveLocks clears lock icons.
 *
 * Promo: RET on Rate Us, More Apps panel, in-house ad canvas, bottom strip spawners.
 */
private val PUZZLES_KIDS = Compatibility(
    name = "Puzzles Kids",
    packageName = "com.gamesforkids.animals.puzzles.jigsaw",
    apkFileType = ApkFileType.APKS_REQUIRED,
    appIconColor = 0x4CAF50,
    targets = listOf(AppTarget(version = null)),
)

private const val LIB = "lib/arm64-v8a/libil2cpp.so"
private const val HELPER =
    "Lapp/template/extension/shared/PuzzlesKidsUnlockHelper;"

private val RET = hexBytes("c0 03 5f d6")
private val RETURN_TRUE = hexBytes("20 00 80 52 c0 03 5f d6")
private val MOV_W8_1 = hexBytes("28 00 80 52")
private val LDRB_W8_X8_0x16 = hexBytes("08 59 40 39")

private data class Il2CppGate(
    val label: String,
    val offset: Long,
    val replacement: ByteArray,
)

private val IL2CPP_GATES = listOf(
    // --- Level locks ---
    Il2CppGate("CloudBurst.LockedClick", 0x10c4b5c, RET),
    Il2CppGate("TouchColorChange.LockedClick", 0x10f7d64, RET),
    Il2CppGate("TouchScript.LockedClick", 0x10f86b0, RET),
    Il2CppGate("TouchSound.LockedClick", 0x10f88fc, RET),
    Il2CppGate("TouchSoundAnimals.LockedClick", 0x10f8ba8, RET),
    // --- Ads (rewarded/banner from GameManager) ---
    Il2CppGate("GameManager.ShowInterstitial", 0x10c7808, RET),
    Il2CppGate("GameManager.ShowBanner", 0x10c8238, RET),
    Il2CppGate("GameManager.RequestInterstitial", 0x10c7944, RET),
    Il2CppGate("GameManager.ShowUnityBanner", 0x10d39a8, RET),
    Il2CppGate("GameManager.ShowUnityAd", 0x10d3a48, RET),
    // --- Rate Us ---
    Il2CppGate("RateAndReviewManager.ShowIngameReview", 0x10be8f4, RET),
    Il2CppGate("RateAndReviewManager.ShowIngameReviewPopup", 0x10bea48, RET),
    Il2CppGate("RateAndReviewManager.OnEnable", 0x10be950, RET),
    Il2CppGate("RateUsStarClick.Start", 0x10e340c, RET),
    Il2CppGate("RateUsStarClick.OnEnable", 0x10e3460, RET),
    Il2CppGate("RateUsStarClick.ShowStars", 0x10e351c, RET),
    Il2CppGate("SceneManagerHome.ShowRateButton", 0x10e5524, RET),
    Il2CppGate("SceneManagerHome.ShowRateUsCanvas", 0x10e55a8, RET),
    Il2CppGate("SettingPop.RateUs", 0x10e880c, RET),
    // --- More Apps / recommended strip / cross-promo ---
    Il2CppGate("SceneManagerHome.ShowMoreAppsPanel", 0x10e51b4, RET),
    Il2CppGate("SceneManagerHome.ShowMoreAppsCanvas", 0x10de254, RET),
    Il2CppGate("SceneManagerHome.MoreAppsButtonClick", 0x10e5858, RET),
    Il2CppGate("SceneManagerHome.ShowInhouseAds", 0x10e5a54, RET),
    Il2CppGate("SceneManagerHome.DownloadInhouseAd", 0x10e5c18, RET),
    Il2CppGate("MoreAppsCanvas.Start", 0x109ecd8, RET),
    Il2CppGate("MoreAppsController.Awake", 0x1106afc, RET),
    Il2CppGate("MoreAppsController.Start", 0x1106bf4, RET),
    Il2CppGate("MoreAppsController.EnableDisablePanel", 0x1106b78, RET),
    Il2CppGate("MoreAppsController.LoadData", 0x1106e10, RET),
    Il2CppGate("MoreAppsView.SpawnLogo", 0x11075b0, RET),
    Il2CppGate("MoreAppsView.EnableScrollView", 0x1107bcc, RET),
    // --- In-house "Try our new Game" ---
    Il2CppGate("AdInHouse.ShowInHouseAdCanvas", 0x10c0760, RET),
    Il2CppGate("AdInHouse.LoadAd", 0x10c0654, RET),
    Il2CppGate("AdInHouseCanvas.Start", 0x10c1090, RET),
    Il2CppGate("InHouseAdsManager.LoadInhouseAds", 0x1107ee4, RET),
    Il2CppGate("InHouseAdsManager.ShowInhouseAds", 0x110815c, RET),
    Il2CppGate("InHouseAdsManager.InstantiateAdsCanvas", 0x11082e8, RET),
    Il2CppGate("InHouseAdsUIController.Start", 0x1108a78, RET),
    Il2CppGate("InHouseAdsUIController.ShowData", 0x11084a0, RET),
    // --- IAP ownership helpers ---
    Il2CppGate("GooglePurchase.IsPurchased", 0x2159ee0, RETURN_TRUE),
    Il2CppGate("Product.get_hasReceipt", 0x2125194, RETURN_TRUE),
    Il2CppGate("PurchaserIAP.IsInitialized", 0x10df2ac, RETURN_TRUE),
)

private fun hexBytes(pattern: String): ByteArray =
    pattern.trim().split(Regex("\\s+")).filter { it.isNotEmpty() }
        .map { it.toInt(16).toByte() }.toByteArray()

private val unlockIl2CppNativeInternalPatch = rawResourcePatch {
    execute {
        val logger = Logger.getLogger("puzzleskids.il2cpp")
        val target = get(LIB, true)
        if (!target.exists()) {
            throw PatchException(
                "$LIB missing. Patch the full APKS (base + arm64), not base.apk alone.",
            )
        }
        RandomAccessFile(target, "rw").use { raf ->
            val needle = LDRB_W8_X8_0x16
            val repl = MOV_W8_1
            val start = 0x1000000L
            val end = 0x1200000L
            var pos = start
            var hits = 0
            val fileLen = raf.length()
            val bufSize = 0x10000
            val buf = ByteArray(bufSize + needle.size)
            while (pos < end && pos < fileLen) {
                raf.seek(pos)
                val read = raf.read(buf)
                if (read < needle.size) break
                var i = 0
                while (i <= read - needle.size) {
                    var match = true
                    for (k in needle.indices) {
                        if (buf[i + k] != needle[k]) {
                            match = false
                            break
                        }
                    }
                    if (match) {
                        val abs = pos + i
                        if (abs in start until end) {
                            raf.seek(abs)
                            raf.write(repl)
                            hits++
                        }
                        i += needle.size
                    } else {
                        i++
                    }
                }
                pos += (read - needle.size + 1).toLong()
            }
            logger.info("isFullVersion sites patched: $hits")
            if (hits < 1) {
                throw PatchException("No isFullVersion LDRB sites found")
            }

            for (gate in IL2CPP_GATES) {
                if (gate.offset + gate.replacement.size > raf.length()) {
                    throw PatchException("${gate.label}: offset past EOF")
                }
                raf.seek(gate.offset)
                raf.write(gate.replacement)
                logger.info("patched ${gate.label} @ 0x${gate.offset.toString(16)}")
            }
        }
    }
}

private object QueryPurchasesResponseFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC),
    returnType = "V",
    parameters = listOf("L", "Ljava/util/List;"),
    name = "onQueryPurchasesResponse",
)

private object PurchaseGetPurchaseStateFingerprint : Fingerprint(
    definingClass = "Lcom/android/billingclient/api/Purchase;",
    name = "getPurchaseState",
    returnType = "I",
    parameters = emptyList(),
    accessFlags = listOf(AccessFlags.PUBLIC),
)

private object PurchaseIsAcknowledgedFingerprint : Fingerprint(
    definingClass = "Lcom/android/billingclient/api/Purchase;",
    name = "isAcknowledged",
    returnType = "Z",
    parameters = emptyList(),
    accessFlags = listOf(AccessFlags.PUBLIC),
)

private object UnityPlayerActivityOnCreateFingerprint : Fingerprint(
    definingClass = "Lcom/unity3d/player/UnityPlayerActivity;",
    name = "onCreate",
    returnType = "V",
    parameters = listOf("Landroid/os/Bundle;"),
)

private object UnityPlayerActivityOnResumeFingerprint : Fingerprint(
    definingClass = "Lcom/unity3d/player/UnityPlayerActivity;",
    name = "onResume",
    returnType = "V",
    parameters = emptyList(),
)

@Suppress("unused")
val unlockPremiumPatch = bytecodePatch(
    name = "Unlock premium",
    description = "Unlocks levels, hides Rate Us / More Apps / in-house promos, no ads.",
    default = true,
) {
    compatibleWith(PUZZLES_KIDS)

    dependsOn(
        extractApkCertificatePatch,
        spoofFirebaseCertHashPatch,
        spoofInstallSourcePatch,
        spoofSignatureVerificationPatch,
        unlockIl2CppNativeInternalPatch,
    )

    extendWith("extensions/extension.mpe")

    execute {
        QueryPurchasesResponseFingerprint.method.addInstructions(
            0,
            """
                invoke-static { p2 }, $HELPER->withSyntheticPurchases(Ljava/util/List;)Ljava/util/List;
                move-result-object p2
            """.trimIndent(),
        )
        PurchaseGetPurchaseStateFingerprint.method.returnEarly(1)
        PurchaseIsAcknowledgedFingerprint.method.returnEarly(true)
        UnityPlayerActivityOnCreateFingerprint.method.addInstructions(
            0,
            """
                invoke-static { p0 }, $HELPER->activate(Landroid/content/Context;)V
            """.trimIndent(),
        )
        runCatching {
            UnityPlayerActivityOnResumeFingerprint.method.addInstructions(
                0,
                """
                    invoke-static { p0 }, $HELPER->activate(Landroid/content/Context;)V
                """.trimIndent(),
            )
        }
    }
}
