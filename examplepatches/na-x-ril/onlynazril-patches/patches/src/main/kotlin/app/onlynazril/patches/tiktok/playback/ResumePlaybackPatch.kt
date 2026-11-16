package app.onlynazril.patches.tiktok.playback

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.onlynazril.patches.shared.Constants.COMPATIBILITY_TIKTOK

private const val RESUME_PLAYBACK =
    "Lapp/onlynazril/extension/tiktok/playback/ResumePlayback;"

/**
 * Remembers where a video was left and seeks back to it on the next open.
 *
 * The hooks cover the position's whole life, not only the progress tick:
 *  1. `onPreparePlay`: the open boundary, so a pre-seek tick is not mistaken for a seek to zero;
 *  2. `onSeekStart` / `onSeekEnd` / `onRenderSeekComplete`: the explicit user seek, including a
 *     seek while the video is paused and a seek to the start;
 *  3. `onPlayProgressChange`: the fallback position while the video plays;
 *  4. both `onPausePlay` overloads: the exact playhead;
 *  5. `onPlayCompleted` / `onLoopPlay`: the video finished or restarted, so the old point goes;
 *  6. `onPlayRelease` / `onStopPlay`: the final save when no pause callback arrives;
 *  7. `onPlayFailed` / `onRetryOnError` / `onResolutionSwitchComplete`: the surface is recovering,
 *     do not let a temporary zero erase the point;
 *  8. `onRenderFirstFrame` and `onRenderFirstFrameFromResume`: the restore seek, once per open.
 *
 * All are entry hooks, so no register is invented: the progress callback already has the whole
 * argument list at its first instruction, and passing `p0..p5` forwards `this` plus the string and
 * both wide longs in one ranged call. Every other callback has `this` and the source id as its
 * first two parameters; the seek-end callbacks pass the success flag as the third.
 */
@Suppress("unused")
val tiktokResumePlaybackPatch = bytecodePatch(
    name = "Resume playback",
    description = "Continues a video from where you stopped. The twelve most recently opened " +
        "videos are kept until the app closes; the first and last seconds, set in Tweaks, are " +
        "skipped.",
) {
    compatibleWith(COMPATIBILITY_TIKTOK)

    extendWith("extensions/tiktok.mpe")

    execute {
        val progress = FeedPlayProgressFingerprint.methodOrNull
            ?: throw PatchException(
                "Resume playback: the feed player's progress tick was not found.",
            )
        progress.addInstructions(
            0,
            "invoke-static/range {p0 .. p5}, $RESUME_PLAYBACK->onProgress(" +
                "Ljava/lang/Object;Ljava/lang/String;JJ)V",
        )

        val pause = FeedPauseFingerprint.methodOrNull
        val pauseEvent = FeedPauseEventFingerprint.methodOrNull
        if (pause == null && pauseEvent == null) {
            throw PatchException(
                "Resume playback: the feed player's pause callback was not found.",
            )
        }
        // The event overload runs first, while the playhead is still the pause point; the legacy
        // overload stays wired for a build whose dispatcher only calls that one.
        pauseEvent?.addInstructions(
            0,
            "invoke-static/range {p0 .. p1}, $RESUME_PLAYBACK->onPause(" +
                "Ljava/lang/Object;Ljava/lang/String;)V",
        )
        pause?.addInstructions(
            0,
            "invoke-static/range {p0 .. p1}, $RESUME_PLAYBACK->onPause(" +
                "Ljava/lang/Object;Ljava/lang/String;)V",
        )

        val firstFrame = FeedFirstFrameFingerprint.methodOrNull
            ?: throw PatchException(
                "Resume playback: the feed player's first-frame callback was not found.",
            )
        firstFrame.addInstructions(
            0,
            "invoke-static/range {p0 .. p1}, $RESUME_PLAYBACK->onFirstFrame(" +
                "Ljava/lang/Object;Ljava/lang/String;)V",
        )

        // The item is being prepared. This is the open boundary the extension needs: without it a
        // progress tick at 0:01 cannot be told apart from a real user seek to the start.
        val prepare = FeedPrepareEventFingerprint.methodOrNull
            ?: throw PatchException(
                "Resume playback: onPreparePlay(String, event) was not found.",
            )
        prepare.addInstructions(
            0,
            "invoke-static/range {p0 .. p1}, $RESUME_PLAYBACK->onOpen(" +
                "Ljava/lang/Object;Ljava/lang/String;)V",
        )
        FeedPrepareFingerprint.methodOrNull?.addInstructions(
            0,
            "invoke-static/range {p0 .. p1}, $RESUME_PLAYBACK->onOpen(" +
                "Ljava/lang/Object;Ljava/lang/String;)V",
        )

        // The explicit user seek. The progress tick alone cannot see a seek while paused, and a
        // seek to zero never produces a tick the old flow could use.
        val seekStart = FeedSeekStartFingerprint.methodOrNull
            ?: throw PatchException("Resume playback: onSeekStart was not found.")
        seekStart.addInstructions(
            0,
            "invoke-static/range {p0 .. p1}, $RESUME_PLAYBACK->onSeekStart(" +
                "Ljava/lang/Object;Ljava/lang/String;)V",
        )
        val seekEnd = FeedSeekEndFingerprint.methodOrNull
            ?: throw PatchException("Resume playback: onSeekEnd was not found.")
        seekEnd.addInstructions(
            0,
            "invoke-static/range {p0 .. p2}, $RESUME_PLAYBACK->onSeekFinished(" +
                "Ljava/lang/Object;Ljava/lang/String;Z)V",
        )
        FeedRenderSeekCompleteFingerprint.methodOrNull?.addInstructions(
            0,
            "invoke-static/range {p0 .. p2}, $RESUME_PLAYBACK->onSeekFinished(" +
                "Ljava/lang/Object;Ljava/lang/String;Z)V",
        )

        // A finished or looped video must not leave a point at its last second.
        val completed = FeedPlayCompletedFingerprint.methodOrNull
            ?: throw PatchException("Resume playback: onPlayCompleted was not found.")
        completed.addInstructions(
            0,
            "invoke-static/range {p0 .. p1}, $RESUME_PLAYBACK->onCompleted(" +
                "Ljava/lang/Object;Ljava/lang/String;)V",
        )
        FeedPlayCompletedCountFingerprint.methodOrNull?.addInstructions(
            0,
            "invoke-static/range {p0 .. p1}, $RESUME_PLAYBACK->onCompleted(" +
                "Ljava/lang/Object;Ljava/lang/String;)V",
        )
        val loop = FeedLoopPlayFingerprint.methodOrNull
            ?: throw PatchException("Resume playback: onLoopPlay was not found.")
        loop.addInstructions(
            0,
            "invoke-static/range {p0 .. p1}, $RESUME_PLAYBACK->onLoop(" +
                "Ljava/lang/Object;Ljava/lang/String;)V",
        )

        // The last save when the surface goes away without a pause callback. Release is the main
        // path; stop is the older one and is kept as a fallback.
        val release = FeedPlayReleaseFingerprint.methodOrNull
            ?: FeedStopPlayFingerprint.methodOrNull
            ?: throw PatchException("Resume playback: no release or stop callback was found.")
        release.addInstructions(
            0,
            "invoke-static/range {p0 .. p1}, $RESUME_PLAYBACK->onFinalSave(" +
                "Ljava/lang/Object;Ljava/lang/String;)V",
        )
        FeedPlayReleaseFingerprint.methodOrNull?.takeIf { it !== release }?.addInstructions(
            0,
            "invoke-static/range {p0 .. p1}, $RESUME_PLAYBACK->onFinalSave(" +
                "Ljava/lang/Object;Ljava/lang/String;)V",
        )
        FeedStopPlayFingerprint.methodOrNull?.takeIf { it !== release }?.addInstructions(
            0,
            "invoke-static/range {p0 .. p1}, $RESUME_PLAYBACK->onFinalSave(" +
                "Ljava/lang/Object;Ljava/lang/String;)V",
        )

        // A failure, retry or resolution switch can report a temporary zero. Mark the item suspect
        // so the next zero cannot clear a real resume point.
        val failed = FeedPlayFailedFingerprint.methodOrNull
        failed?.addInstructions(
            0,
            "invoke-static/range {p0 .. p1}, $RESUME_PLAYBACK->onSuspect(" +
                "Ljava/lang/Object;Ljava/lang/String;)V",
        )
        FeedPlayFailedShortFingerprint.methodOrNull?.addInstructions(
            0,
            "invoke-static/range {p0 .. p1}, $RESUME_PLAYBACK->onSuspect(" +
                "Ljava/lang/Object;Ljava/lang/String;)V",
        )
        FeedRetryFingerprint.methodOrNull?.addInstructions(
            0,
            "invoke-static/range {p0 .. p1}, $RESUME_PLAYBACK->onSuspect(" +
                "Ljava/lang/Object;Ljava/lang/String;)V",
        )
        FeedRetryShortFingerprint.methodOrNull?.addInstructions(
            0,
            "invoke-static/range {p0 .. p0}, $RESUME_PLAYBACK->onSuspect(Ljava/lang/Object;)V",
        )
        FeedResolutionSwitchFingerprint.methodOrNull?.addInstructions(
            0,
            "invoke-static/range {p0 .. p1}, $RESUME_PLAYBACK->onSuspect(" +
                "Ljava/lang/Object;Ljava/lang/String;)V",
        )

        // The app resumed from the background; this is the same restore point as the first frame.
        FeedFirstFrameFromResumeFingerprint.methodOrNull?.addInstructions(
            0,
            "invoke-static/range {p0 .. p1}, $RESUME_PLAYBACK->onFirstFrame(" +
                "Ljava/lang/Object;Ljava/lang/String;)V",
        )
    }
}
