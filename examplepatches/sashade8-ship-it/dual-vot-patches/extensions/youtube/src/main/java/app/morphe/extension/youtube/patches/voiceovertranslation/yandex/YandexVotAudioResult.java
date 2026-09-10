/*
 * Copyright (C) 2026 Dual VoT contributors
 *
 * Licensed under the GNU General Public License v3.0.
 */

package app.morphe.extension.youtube.patches.voiceovertranslation.yandex;

/**
 * Outcome of acquiring the complete original audio track and uploading it to Yandex.
 *
 * <p>The callers use the outcome to keep the acquisition phase, the Yandex upload phase,
 * the Yandex status phase and final playback phase distinguishable, so a source problem is
 * never reported as a translation playback error and empty audio is never treated as a
 * successful upload.
 */
enum YandexVotAudioResult {
    /** Every part of the original audio was uploaded in order. */
    SUCCESS(FailureKind.NONE),
    /** The operation was cancelled (user stopped the translation or the video changed). */
    CANCELLED(FailureKind.ABORTED),
    /** The whole-track acquisition or upload did not finish inside its deadline. */
    DEADLINE_EXCEEDED(FailureKind.ABORTED),
    /** No full-track audio source could be resolved from the playing YouTube session. */
    SOURCE_UNAVAILABLE(FailureKind.SOURCE),
    /** The media server denied a requested byte range (for example HTTP 403 on later offsets). */
    SOURCE_DENIED(FailureKind.SOURCE),
    /** A source read was truncated, empty, or otherwise did not return the requested part. */
    SOURCE_READ_FAILED(FailureKind.SOURCE),
    /** A Yandex part upload was rejected. */
    UPLOAD_FAILED(FailureKind.UPLOAD);

    /** Coarse user-facing failure category, used to pick a distinct error message. */
    enum FailureKind {
        NONE,
        SOURCE,
        UPLOAD,
        ABORTED
    }

    private final FailureKind failureKind;

    YandexVotAudioResult(FailureKind failureKind) {
        this.failureKind = failureKind;
    }

    boolean isSuccess() {
        return this == SUCCESS;
    }

    boolean isSourceFailure() {
        return failureKind == FailureKind.SOURCE;
    }

    boolean isAborted() {
        return failureKind == FailureKind.ABORTED;
    }

    FailureKind failureKind() {
        return failureKind;
    }
}
