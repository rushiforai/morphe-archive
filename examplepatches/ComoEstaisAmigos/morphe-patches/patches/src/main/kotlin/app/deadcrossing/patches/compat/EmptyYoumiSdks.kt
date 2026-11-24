package app.deadcrossing.patches.compat

import app.deadcrossing.patches.mono.ActivityOnCreateFingerprint
import app.deadcrossing.patches.mono.GetAndSpendYoumiPointsFingerprint
import app.deadcrossing.patches.mono.ShowYoumiFingerprint
import app.deadcrossing.patches.shared.Constants.COMPATIBILITY
import app.deadcrossing.patches.shared.Constants.ORIGINAL_APK
import app.deadcrossing.patches.shared.blankConstStrings
import app.adebisi.patches.shared.removeActivities
import app.adebisi.patches.shared.removeMetaData
import app.adebisi.patches.shared.PUBLIC
import app.adebisi.patches.shared.STATIC
import app.adebisi.patches.shared.addStub
import app.adebisi.patches.shared.emptySdkPrefixes
import app.adebisi.patches.shared.rewriteOriginalDexThroughDexPool
import app.adebisi.patches.shared.requireFeelingtouchSigner
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.document
import app.morphe.patcher.patch.mutableClassDefBy
import app.morphe.patcher.patch.patch
import app.morphe.patcher.util.returnEarly

internal const val YOUMI_PREFIX = "Lnet/youmi/"
internal const val YOUMI_CLASSES = 153
internal const val YOUMI_ACTIVITY = "net.youmi.android.appoffers.YoumiOffersActivity"

internal val YOUMI_META_KEYS = listOf(
    "YOUMI_APP_ID",
    "YOUMI_PASSWORD",
)

private const val YOUMI_OFFERS_MANAGER = "Lnet/youmi/android/appoffers/YoumiOffersManager;"
private const val YOUMI_POINTS_MANAGER = "Lnet/youmi/android/appoffers/YoumiPointsManager;"

/**
 * Youmi is not a player toggle: every visible Dead Crossing patch depends on this,
 * so the classes are gone whichever patch is selected. `onCreate` still names
 * `YoumiOffersManager.init`, so those entry points are stubbed after the empty.
 * The offer activity and YOUMI_* meta-data are dropped from the manifest.
 * [rewriteOriginalDexThroughDexPool] so emptied URL constants do not stay in the
 * original DEX string pool.
 */
internal val emptyYoumiSdksPatch = patch {
    compatibleWith(COMPATIBILITY)

    execute {
        requireFeelingtouchSigner(ORIGINAL_APK)
        ShowYoumiFingerprint.method.returnEarly()
        GetAndSpendYoumiPointsFingerprint.method.returnEarly()
        emptyYoumiSdks()
        val missingYoumiKeys = blankConstStrings(ActivityOnCreateFingerprint.method, YOUMI_META_KEYS)
        if (missingYoumiKeys.isNotEmpty()) {
            throw PatchException("onCreate missing Youmi const-string $missingYoumiKeys")
        }
        document("AndroidManifest.xml").use { document ->
            removeActivities(document, listOf(YOUMI_ACTIVITY))
            removeMetaData(document, YOUMI_META_KEYS)
        }
        rewriteOriginalDexThroughDexPool()
    }
}

internal fun emptyYoumiSdks() {
    emptySdkPrefixes(listOf(YOUMI_PREFIX to YOUMI_CLASSES))
    stubYoumiEntryPoints()
}

private fun stubYoumiEntryPoints() {
    val offers = mutableClassDefBy(YOUMI_OFFERS_MANAGER)
    offers.addStub(
        name = "init",
        parameters = listOf("Landroid/content/Context;", "Ljava/lang/String;", "Ljava/lang/String;"),
        access = PUBLIC or STATIC,
        registerCount = 3,
        smali = "return-void",
    )
    offers.addStub(
        name = "showOffers",
        parameters = listOf("Landroid/content/Context;", "I"),
        returnType = "Z",
        access = PUBLIC or STATIC,
        registerCount = 2,
        smali = """
            const/4 v0, 0x0
            return v0
        """,
    )
    val points = mutableClassDefBy(YOUMI_POINTS_MANAGER)
    points.addStub(
        name = "queryPoints",
        parameters = listOf("Landroid/content/Context;"),
        returnType = "I",
        access = PUBLIC or STATIC,
        registerCount = 1,
        smali = """
            const/4 v0, 0x0
            return v0
        """,
    )
    points.addStub(
        name = "spendPoints",
        parameters = listOf("Landroid/content/Context;", "I"),
        returnType = "Z",
        access = PUBLIC or STATIC,
        registerCount = 2,
        smali = """
            const/4 v0, 0x0
            return v0
        """,
    )
}
