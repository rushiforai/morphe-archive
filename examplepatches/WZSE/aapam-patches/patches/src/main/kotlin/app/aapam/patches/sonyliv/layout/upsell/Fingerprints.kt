package app.aapam.patches.sonyliv.layout.upsell

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.AccessFlags

private const val CT_NATIVE_DISPLAY_REPO =
    "Lcom/sonyliv/data/clevertap/CtNativeDisplayRepositoryImpl;"

/**
 * 6.23.1: getCTListRowData(String): CTListRowModel
 */
internal object GetCTListRowDataFingerprint : Fingerprint(
    name = "getCTListRowData",
    accessFlags = listOf(AccessFlags.PUBLIC),
    returnType = "Lcom/sonyliv/domain/clevertap/model/CTListRowModel;",
    parameters = listOf("Ljava/lang/String;"),
    definingClass = CT_NATIVE_DISPLAY_REPO,
)

/**
 * 6.23.1: getCTRowData(String): CTBannerCardRowModel
 */
internal object GetCTBannerRowDataFingerprint : Fingerprint(
    name = "getCTRowData",
    accessFlags = listOf(AccessFlags.PUBLIC),
    returnType = "Lcom/sonyliv/domain/clevertap/model/CTBannerCardRowModel;",
    parameters = listOf("Ljava/lang/String;"),
    definingClass = CT_NATIVE_DISPLAY_REPO,
)

/**
 * 6.29.11+:
 * CleverTap banner card data provider: Lao/c;->F(String)Lew/a;
 * Fetches "img_url_tv" and "dplink" from CleverTapDisplayUnit.
 */
internal object GetCTBannerDataV2Fingerprint : Fingerprint(
    returnType = "Lew/a;",
    parameters = listOf("Ljava/lang/String;"),
    strings = listOf("img_url_tv", "dplink"),
)

/**
 * 6.29.11+:
 * CleverTap promo tray row presenter: Lo80/d;->f(Lew/c;Z)V
 * Handles populating CleverTap list row models into the home tray.
 */
internal object PopulateCTListTrayV2Fingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf("Lew/c;", "Z"),
)
