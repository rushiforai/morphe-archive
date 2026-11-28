package app.template.patches.skillshare.premium

import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.SKILLSHARE_COMPATIBILITY
import app.template.patches.shared.returnEarly
import app.template.patches.skillshare.isLockedBoolean
import app.template.patches.skillshare.isMemberBoolean

/**
 * Removes Skillshare's client-side paywall gates.
 *
 * There is **no PairIP** in this build and no ad SDK to remove. The only
 * dex-patchable entitlement surface is the pair of predicates the app derives
 * from the API JSON model:
 *
 *  • [isMemberBoolean] `AppUser.isMember()Z` — `subscription != null`.
 *    16 call sites drive the paywall chrome: `CourseDetailsPresenter` /
 *    `CourseDetailsActivity.setupPremiumCta` / `LessonsPresenter` (+2 inner
 *    classes) / `DownloadsActivity` / `ProjectsFragment` /
 *    `SettingsPresenter` (×4) / `SplashActivity` / onboarding welcome /
 *    `FirebaseUserUpdater`. Forcing it true also makes the lesson tap
 *    (`!isLocked() → play`, `else !isMember() → checkout`, `else → play`)
 *    take the play branch for every lesson.
 *
 *  • [isLockedBoolean] `VideoMetadata.isLocked()Z` — `videoHashedID == null`.
 *    This is the per-lesson flag the lesson list and cast carousel render.
 *
 * Both bodies are 8 instructions over a single local register, so the
 * constant-return rewrite is verifier-safe (no try-blocks, no register growth,
 * no new locals) — the same idiom the Pdb/Strava premium patches use.
 *
 * HONEST LIMITATION: this removes the paywall UI and the client-side refusal to
 * request a lesson. It does **not** grant access to the media. Playback is
 * `GET /sessions/{session_id}/stream`, which returns the HLS/DASH URLs, and
 * downloads are `GET /sessions/{video_id}/download` — both go through the
 * app's authenticated backend (`Authorization` via the Auth0 interceptor), and
 * the server is the component that omits `video_hashed_id` for lessons the
 * account may not watch. Whether the backend serves a stream for a free
 * account is a server decision no client patch can make.
 */
@Suppress("unused")
val skillshareUnlockPremiumPatch = bytecodePatch(
    name = "Unlock premium (client-side)",
    description = "Forces the app's client-side entitlement flags (isMember → true, " +
        "isLocked → false) so premium badges, paywall CTAs and locked-lesson " +
        "chrome are gone and every lesson row is playable/downloadable in the UI. " +
        "Honestly: the video stream itself is served by Skillshare's backend, so " +
        "premium lessons may still fail to play — that is a server-side check.",
    default = true,
) {
    compatibleWith(SKILLSHARE_COMPATIBILITY)

    execute {
        // AppUser.isMember() → always true.
        isMemberBoolean.method.returnEarly(true)

        // VideoMetadata.isLocked() → always false.
        isLockedBoolean.method.returnEarly(false)
    }
}