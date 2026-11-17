package app.zdrgon.patches.timemark.misc

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.zdrgon.patches.timemark.shared.Constants.COMPATIBILITY_TIMEMARK

/**
 * Timemark — Enable Plus.
 *
 * Timemark's Plus plan ($49.99/yr) is validated by the developer's
 * server (GET member/vip/info returns a VipInfo bean), but the bean
 * is cached into a purely local state holder and every feature gate
 * in the app reads that local state — nothing re-asks the server at
 * feature time. The state holder is Ldb0/n;:
 *
 *   - its refresh coroutine stores VipInfo.isVip() /
 *     getVipExpireTime() into statics and into persisted prefs
 *     ("key_is_vip", "key_vip_expire_time");
 *   - Ldb0/n;->d()Z answers "key_is_vip && expireTime > now"
 *     (15 caller classes, incl. the watermark-removal preview);
 *   - Ldb0/n;->e()Z answers "d() || business-plan flag" and is the
 *     dominant reader (~70 caller classes: custom file name,
 *     watermark size/color and styles, photo markup/annotations,
 *     settings, camera widgets, the paywall itself);
 *   - Ldb0/n;->g() returns the ACTIVE / NON_MEMBER / UNKNOWN
 *     membership enum the state UI renders;
 *   - Leb0/d;->a() derives the photo-save quota state
 *     (UNLIMITED / NON_MEMBER / QUOTA_AVAILABLE / QUOTA_EXHAUSTED)
 *     from d() and the server-issued WatermarkSaveQuota bean.
 *
 * This patch pins the whole chain at its sources and readers:
 *
 *   1. VipInfo.isVip() -> true and VipInfo.getVipExpireTime() ->
 *      2100-01-01, so the app's own refresh persists the Plus state
 *      (statics + prefs) exactly as it does for a real subscriber,
 *      and the ~100 direct readers of the in-memory mirror see it.
 *   2. Ldb0/n;->d()Z and Ldb0/n;->e()Z -> true, and
 *      Ldb0/n;->g() -> ACTIVE, so every gated feature reads the
 *      Plus state immediately and permanently, independent of
 *      refresh timing or of the server-pushed business flag.
 *   3. Leb0/d;->a() -> UNLIMITED, so the free-tier watermark
 *      photo-save quota can never exhaust: the stored quota bean
 *      stays the free one, and this reader is where its limit is
 *      enforced.
 *
 * What this covers (local gates, verified readers): edit/remove
 * watermarks and the developer logo, watermark size & color and
 * styles, custom file name, unlimited photo annotations, ultra
 * quality, second-accurate timestamp, keep-original-photo, the
 * OCR text-entry gate, personal Excel/PDF/Zip/KMZ export, and
 * unlimited saves. What it cannot cover, because the data lives on
 * the developer's servers: professional weather data (the gate is
 * local, the pro feed is served per-account). Cloud backup to the
 * user's own Google Drive / OneDrive is gated locally and
 * unlocked; the backup itself runs against the user's own cloud
 * account, as it does for a subscriber. The Business tier is a
 * separate patch ("Enable Business") that adds the local
 * business-plan state on top of this same pin set.
 *
 * No purchase is created and no receipt is forged; the patch only
 * changes the app's own answers about its own cached state.
 * Timemark v10.0.316 carries no PairIP and performs no signature
 * self-check (its SecNeo wrapper leaves the dexes readable and the
 * app launches re-signed), so no companion patch is needed.
 */

/**
 * Applies the Plus pin set to the already-resolved fingerprint
 * methods. Shared with the "Enable Business" patch, which is
 * self-contained (Business alone must work) and adds the
 * business-plan pins on top. The methods are resolved by each
 * patch inside its own execute block (fingerprint resolution
 * needs the patch context) and passed in. If both patches are
 * selected in one run, the pins are applied twice to the same
 * methods; the blocks are value-identical and stack harmlessly
 * at index 0, so the combined run is safe (verified on the
 * desktop test run).
 */
internal fun applyPlusPins(
    isVip: MutableMethod,
    expireTime: MutableMethod,
    readerD: MutableMethod,
    readerE: MutableMethod,
    state: MutableMethod,
    saveQuota: MutableMethod
) {
    // 1. The producer: the server bean now reports a Plus
    // subscription expiring 2100-01-01 (4102444800000 ms), so
    // the app's own refresh writes the Plus state into its
    // statics and persisted prefs.
    isVip.addInstructions(
        0,
        """
            const/4 v0, 0x1
            return v0
        """.trimIndent()
    )

    expireTime.addInstructions(
        0,
        """
            const-wide v0, 0x3bb2cc3d800L
            return-wide v0
        """.trimIndent()
    )

    // 2. The readers: every feature gate asks these.
    readerD.addInstructions(
        0,
        """
            const/4 v0, 0x1
            return v0
        """.trimIndent()
    )

    readerE.addInstructions(
        0,
        """
            const/4 v0, 0x1
            return v0
        """.trimIndent()
    )

    state.addInstructions(
        0,
        """
            sget-object v0, Lp50/e;->ACTIVE:Lp50/e;
            return-object v0
        """.trimIndent()
    )

    // 3. The photo-save quota reader: never exhausted.
    saveQuota.addInstructions(
        0,
        """
            sget-object v0, Leb0/a;->UNLIMITED:Leb0/a;
            return-object v0
        """.trimIndent()
    )
}

@Suppress("unused")
val enablePlusPatch = bytecodePatch(
    name = "Enable Plus",
    description = "Turns on the app's Plus premium state: edit and remove watermarks, ultra quality, custom file names, unlimited annotations and saves, exports and the other personal Plus features, as if the Plus plan were bought.",
    default = true
) {
    compatibleWith(COMPATIBILITY_TIMEMARK)

    execute {
        applyPlusPins(
            VipIsVipFingerprint.method,
            VipExpireTimeFingerprint.method,
            VipReaderDFingerprint.method,
            VipReaderEFingerprint.method,
            VipStateFingerprint.method,
            SaveQuotaFingerprint.method
        )
    }
}
