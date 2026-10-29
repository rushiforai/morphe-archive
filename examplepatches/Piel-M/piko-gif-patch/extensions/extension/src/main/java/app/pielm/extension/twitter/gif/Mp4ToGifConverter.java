package app.pielm.extension.twitter.gif;

import android.graphics.Bitmap;
import android.media.MediaExtractor;
import android.media.MediaFormat;
import android.media.MediaMetadataRetriever;
import android.os.Build;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/**
 * Converts a Twitter/X MP4 animated GIF stream into a real looping GIF89a (.gif) file.
 */
public final class Mp4ToGifConverter {
    private static final int BATCH_SIZE = 8;
    private static final int MAX_OUTPUT_FRAMES = 150;
    private static final int DEFAULT_FRAME_DELAY_MS = 60;

    public interface ProgressListener {
        void onFrameProgress(int currentFrame, int totalFrames);
    }

    private Mp4ToGifConverter() {
    }

    public static void convert(File mp4File, File outputGifFile, ProgressListener listener) throws Exception {
        List<Long> ptsUsList = extractSortedVideoPtsUs(mp4File);

        MediaMetadataRetriever retriever = new MediaMetadataRetriever();
        try {
            retriever.setDataSource(mp4File.getAbsolutePath());

            String durationStr = retriever.extractMetadata(MediaMetadataRetriever.METADATA_KEY_DURATION);
            long durationMs = durationStr != null ? Long.parseLong(durationStr) : 2000L;

            String frameCountStr = null;
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.P) {
                frameCountStr = retriever.extractMetadata(MediaMetadataRetriever.METADATA_KEY_VIDEO_FRAME_COUNT);
            }

            int totalSourceFrames = ptsUsList.size();
            if (frameCountStr != null) {
                try {
                    int metaFrames = Integer.parseInt(frameCountStr);
                    if (metaFrames > 0) {
                        totalSourceFrames = metaFrames;
                    }
                } catch (NumberFormatException ignored) {
                }
            }
            if (totalSourceFrames <= 0) {
                totalSourceFrames = Math.max(1, (int) (durationMs / DEFAULT_FRAME_DELAY_MS));
            }

            // Cap total output frames if the clip is very long to keep conversion fast and file size reasonable
            int frameStep = Math.max(1, (totalSourceFrames + MAX_OUTPUT_FRAMES - 1) / MAX_OUTPUT_FRAMES);
            int targetOutputFrames = (totalSourceFrames + frameStep - 1) / frameStep;

            int avgDelayMs = Math.max(20, (int) (durationMs / Math.max(1, totalSourceFrames)));

            try (OutputStream out = new BufferedOutputStream(new FileOutputStream(outputGifFile), 65536)) {
                AnimatedGifEncoder encoder = new AnimatedGifEncoder();
                encoder.setRepeat(0);
                encoder.setQuality(15);
                if (!encoder.start(out)) {
                    throw new IOException("Failed to initialize GIF89a output stream");
                }

                int encodedFrames = 0;
                boolean batchSucceeded = false;

                if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.P) {
                    try {
                        for (int index = 0; index < totalSourceFrames; index += BATCH_SIZE) {
                            int count = Math.min(BATCH_SIZE, totalSourceFrames - index);
                            List<Bitmap> frames = retriever.getFramesAtIndex(index, count);
                            if (frames == null || frames.isEmpty()) {
                                break;
                            }
                            batchSucceeded = true;
                            for (int offset = 0; offset < frames.size(); offset++) {
                                int absoluteIndex = index + offset;
                                Bitmap frame = frames.get(offset);
                                if (frame == null) continue;
                                if (absoluteIndex % frameStep == 0) {
                                    int delayMs = computeFrameDelayMs(ptsUsList, absoluteIndex, frameStep, avgDelayMs);
                                    encoder.addFrame(frame, delayMs);
                                    encodedFrames++;
                                    if (listener != null) {
                                        listener.onFrameProgress(encodedFrames, targetOutputFrames);
                                    }
                                }
                                frame.recycle();
                            }
                        }
                    } catch (Throwable ignored) {
                        // Fallback to timestamp extraction if getFramesAtIndex is unsupported on device codec
                    }
                }

                if (!batchSucceeded || encodedFrames == 0) {
                    for (int index = 0; index < totalSourceFrames; index += frameStep) {
                        long timeUs;
                        if (index < ptsUsList.size()) {
                            timeUs = ptsUsList.get(index);
                        } else {
                            timeUs = (long) index * avgDelayMs * 1000L;
                        }
                        Bitmap frame = retriever.getFrameAtTime(timeUs, MediaMetadataRetriever.OPTION_CLOSEST);
                        if (frame != null) {
                            int delayMs = computeFrameDelayMs(ptsUsList, index, frameStep, avgDelayMs);
                            encoder.addFrame(frame, delayMs);
                            frame.recycle();
                            encodedFrames++;
                            if (listener != null) {
                                listener.onFrameProgress(encodedFrames, targetOutputFrames);
                            }
                        }
                    }
                }

                if (encodedFrames == 0) {
                    throw new IOException("No video frames could be decoded from MP4 stream");
                }

                encoder.finish();
            }
        } finally {
            try {
                retriever.release();
            } catch (Throwable ignored) {
            }
        }
    }

    private static int computeFrameDelayMs(List<Long> ptsUsList, int index, int step, int avgDelayMs) {
        int nextIndex = index + step;
        if (ptsUsList != null && index >= 0 && nextIndex < ptsUsList.size()) {
            long deltaUs = ptsUsList.get(nextIndex) - ptsUsList.get(index);
            if (deltaUs > 0) {
                return Math.max(20, Math.round(deltaUs / 1000.0f));
            }
        }
        return Math.max(20, avgDelayMs * step);
    }

    private static List<Long> extractSortedVideoPtsUs(File mp4File) {
        List<Long> ptsList = new ArrayList<>();
        MediaExtractor extractor = new MediaExtractor();
        try {
            extractor.setDataSource(mp4File.getAbsolutePath());
            int trackCount = extractor.getTrackCount();
            int videoTrack = -1;
            for (int i = 0; i < trackCount; i++) {
                MediaFormat format = extractor.getTrackFormat(i);
                String mime = format.getString(MediaFormat.KEY_MIME);
                if (mime != null && mime.startsWith("video/")) {
                    videoTrack = i;
                    break;
                }
            }
            if (videoTrack >= 0) {
                extractor.selectTrack(videoTrack);
                while (true) {
                    long sampleTime = extractor.getSampleTime();
                    if (sampleTime < 0) break;
                    ptsList.add(sampleTime);
                    if (!extractor.advance()) break;
                }
                Collections.sort(ptsList);
            }
        } catch (Throwable ignored) {
        } finally {
            try {
                extractor.release();
            } catch (Throwable ignored) {
            }
        }
        return ptsList;
    }
}
