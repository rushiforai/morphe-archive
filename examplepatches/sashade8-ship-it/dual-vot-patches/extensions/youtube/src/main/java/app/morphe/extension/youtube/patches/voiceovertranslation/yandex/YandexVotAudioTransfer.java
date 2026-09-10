/*
 * Copyright (C) 2026 Dual VoT contributors
 *
 * Licensed under the GNU General Public License v3.0.
 */

package app.morphe.extension.youtube.patches.voiceovertranslation.yandex;

import java.io.IOException;
import java.util.List;

/**
 * Bounded, ordered streaming of the complete original (compressed) audio track into the
 * Yandex upload protocol parts.
 *
 * <p>The core is deliberately transport-free: the byte source and the Yandex uploader are
 * injected, so every ordering, cancellation, deadline, cleanup and failure-classification
 * rule is unit-tested without a device or a network. Only one part (at most
 * {@link YandexVotAudioParts#PART_SIZE_BYTES} bytes) is ever held in memory, so long
 * multipart tracks never reside in RAM as a whole.
 */
final class YandexVotAudioTransfer {
    private YandexVotAudioTransfer() {
    }

    /** Cancellation hook. {@link #isCancelled()} is checked before and after every part. */
    interface Progress {
        boolean isCancelled();

        void onUploading(int part, int totalParts);
    }

    /** Overall acquisition + upload deadline, checked before and after every part. */
    interface Deadline {
        boolean isExpired();
    }

    /**
     * Combined cancellation + deadline signal that is passed into every part read, so an
     * active network read stops at the next bounded chunk instead of finishing first.
     */
    interface AbortSignal {
        boolean shouldAbort();
    }

    /** Source of the original compressed audio, read one bounded part at a time. */
    interface PartReader extends AutoCloseable {
        /**
         * Reads the closed byte range {@code [start, start + length)} and returns exactly
         * {@code length} bytes, or throws when the media host denied the range, the range
         * headers were missing/inconsistent, or the body was truncated/empty.
         *
         * <p>Implementations must poll {@code abort} while reading and stop promptly by
         * throwing {@link ReadAbortedException} when it fires. They must never buffer more
         * than one part.
         */
        byte[] read(long start, int length, AbortSignal abort)
                throws SourceDeniedException, SourceReadException, ReadAbortedException;

        /**
         * Releases any source resources. Called exactly once after every outcome.
         */
        @Override
        void close();
    }

    /** Uploader of one ordered part to Yandex. */
    interface PartUploader {
        /**
         * @param fileId the Yandex file id for the whole track
         * @param totalParts the total number of parts
         * @param partIndex zero-based part index
         * @param partData the part bytes, at most {@link YandexVotAudioParts#PART_SIZE_BYTES}
         * @return true when Yandex accepted the part
         */
        boolean uploadPart(String fileId, int totalParts, int partIndex, byte[] partData);
    }

    /** The media host rejected a requested range (for example HTTP 403 on later offsets). */
    static final class SourceDeniedException extends IOException {
        SourceDeniedException(String message) {
            super(message);
        }
    }

    /** A source response did not carry the requested part bytes (missing/invalid headers, truncation, empty body). */
    static final class SourceReadException extends IOException {
        SourceReadException(String message) {
            super(message);
        }
    }

    /** Thrown by a reader when cancellation or the deadline fired while a part was being read. */
    static final class ReadAbortedException extends IOException {
        ReadAbortedException() {
            super("Audio read aborted");
        }
    }

    /**
     * Streams the whole track from {@code reader} into Yandex parts in ascending order.
     *
     * <p>Cancellation and the deadline are enforced before every part, inside every part
     * read (via {@link AbortSignal}), immediately after every part read and before every
     * upload, and again before reporting {@link YandexVotAudioResult#SUCCESS}. A run that
     * was cancelled never reports success, even if the final upload completed first.
     *
     * @param fileSize total source size in bytes; zero or negative is an invalid/empty source
     * @param reader the injectable full-track source
     * @param fileId the Yandex file id for the whole track
     * @param uploader the injectable Yandex part uploader
     * @param progress cancellation and progress reporting
     * @param deadline overall deadline; may be null for no deadline
     */
    static YandexVotAudioResult run(
            long fileSize,
            PartReader reader,
            String fileId,
            PartUploader uploader,
            Progress progress,
            Deadline deadline
    ) {
        try {
            if (reader == null || uploader == null || progress == null) {
                return YandexVotAudioResult.SOURCE_UNAVAILABLE;
            }
            if (fileSize <= 0) {
                return YandexVotAudioResult.SOURCE_UNAVAILABLE;
            }
            List<YandexVotAudioParts.Part> parts = YandexVotAudioParts.parts(fileSize);
            int totalParts = parts.size();
            if (totalParts <= 0) {
                return YandexVotAudioResult.SOURCE_UNAVAILABLE;
            }
            if (progress.isCancelled()) {
                return YandexVotAudioResult.CANCELLED;
            }
            if (isExpired(deadline)) {
                return YandexVotAudioResult.DEADLINE_EXCEEDED;
            }

            for (int partIndex = 0; partIndex < totalParts; partIndex++) {
                if (progress.isCancelled()) {
                    return YandexVotAudioResult.CANCELLED;
                }
                if (isExpired(deadline)) {
                    return YandexVotAudioResult.DEADLINE_EXCEEDED;
                }
                progress.onUploading(partIndex + 1, totalParts);

                YandexVotAudioParts.Part part = parts.get(partIndex);
                AbortSignal abort = () -> progress.isCancelled() || isExpired(deadline);

                byte[] partData;
                try {
                    partData = reader.read(part.start(), part.length(), abort);
                } catch (SourceDeniedException ex) {
                    return YandexVotAudioResult.SOURCE_DENIED;
                } catch (SourceReadException ex) {
                    return YandexVotAudioResult.SOURCE_READ_FAILED;
                } catch (ReadAbortedException ex) {
                    return aborted(progress, deadline);
                }
                if (partData == null || partData.length != part.length()) {
                    // Never treat an empty or truncated part as a successful upload.
                    return YandexVotAudioResult.SOURCE_READ_FAILED;
                }
                // Re-check right before the upload: a read that completed just after the
                // abort fired must not upload its part.
                if (abort.shouldAbort()) {
                    return aborted(progress, deadline);
                }
                if (!uploader.uploadPart(fileId, totalParts, partIndex, partData)) {
                    return YandexVotAudioResult.UPLOAD_FAILED;
                }
            }

            // Never report success for a run that was cancelled or outlived its deadline.
            if (progress.isCancelled()) {
                return YandexVotAudioResult.CANCELLED;
            }
            if (isExpired(deadline)) {
                return YandexVotAudioResult.DEADLINE_EXCEEDED;
            }
            return YandexVotAudioResult.SUCCESS;
        } finally {
            try {
                if (reader != null) reader.close();
            } catch (Exception ignored) {
            }
        }
    }

    private static YandexVotAudioResult aborted(Progress progress, Deadline deadline) {
        return progress.isCancelled()
                ? YandexVotAudioResult.CANCELLED
                : YandexVotAudioResult.DEADLINE_EXCEEDED;
    }

    private static boolean isExpired(Deadline deadline) {
        return deadline != null && deadline.isExpired();
    }
}
