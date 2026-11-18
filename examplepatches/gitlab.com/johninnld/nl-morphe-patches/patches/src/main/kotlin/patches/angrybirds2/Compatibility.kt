package patches.angrybirds2

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.Compatibility

/**
 * Withdrawn from the published bundle: the patched game stalls on its loading screen because
 * its content is a Play-delivered asset pack (Play Core syncPacks fails with PACK_UNAVAILABLE),
 * and the Play Store only serves that pack to installations whose signing certificate matches
 * the Play listing. No patch-level or Play Integrity workaround applies.
 *
 * This declaration stays so the release-notes attribution of the withdrawn patch commits in this
 * release resolves; no patch of this folder is compiled into the published MPP.
 * Analysis and evidence: docs/research/2026-11-09-aa-parked-games-gate.md.
 */
internal val angryBirds2 = Compatibility(
    name = "Angry Birds 2", packageName = "com.rovio.baba",
    apkFileType = ApkFileType.APKM,
)
