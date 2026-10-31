// SPDX-FileCopyrightText: 2026 ReVanced contributors
// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

package io.github.joancomasfdz.extension.baconreader.savemedia;

import android.content.Context;
import android.media.MediaCodec;
import android.media.MediaExtractor;
import android.media.MediaFormat;
import android.media.MediaMuxer;
import android.net.Uri;
import android.util.Xml;

import org.xmlpull.v1.XmlPullParser;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.StringReader;
import java.lang.reflect.Field;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.List;

import app.morphe.extension.shared.Logger;
import io.github.joancomasfdz.extension.baconreader.errors.ErrorDialog;

/**
 * Reddit videos (v.redd.it) keep the picture and the sound in separate files, which players combine. "Save to
 * device" downloaded only the picture (fallback_url), so saved videos had no sound. After the download, the audio
 * track is downloaded too and both are combined into the saved file, without re-encoding.
 */
@SuppressWarnings("unused")
public final class VideoAudioPatch {
    /** Reddit's usual names of the audio file, when the DASH manifest cannot be read. Best quality first. */
    private static final String[] AUDIO_NAMES = {
            "CMAF_AUDIO_128.mp4", "CMAF_AUDIO_64.mp4", "DASH_AUDIO_128.mp4", "DASH_AUDIO_64.mp4", "DASH_audio.mp4",
    };
    private static final int BUFFER_SIZE = 4 * 1024 * 1024;

    private VideoAudioPatch() {
    }

    /**
     * Injected in SaveImageService.getSingleFile(url, folder, name) after each download into the file
     * (getSingleFile(url, file)), on the download thread.
     */
    public static void onDownloaded(Context service, boolean downloaded, Object file) {
        if (!downloaded || file == null) return;
        try {
            Object link = field(service, "link");
            if (!(Boolean) link.getClass().getMethod("isRedditVideo").invoke(link)) return;
            Object media = link.getClass().getMethod("media").invoke(link);
            Object video = media == null ? null : field(media, "redditVideo");
            if (video == null || Boolean.TRUE.equals(field(video, "isGif"))) return;
            Uri saved = (Uri) file.getClass().getMethod("getUri").invoke(file);

            String fallbackUrl = (String) field(video, "fallbackUrl");
            if (fallbackUrl == null || saved == null) return;
            String audioUrl = findAudio((String) field(video, "dashUrl"), fallbackUrl);
            if (audioUrl == null) {
                Logger.printInfo(() -> "No audio track: the video has no sound");
                return;
            }
            mux(service, saved, audioUrl);
        } catch (Exception ex) {
            ErrorDialog.printException(() -> "Could not add the sound to the saved video (it was saved without it)",
                    ex);
        }
    }

    // region Audio track

    /** The audio file of the video: from the DASH manifest, else Reddit's usual names that exist. */
    private static String findAudio(String dashUrl, String fallbackUrl) {
        String base = fallbackUrl.substring(0, fallbackUrl.lastIndexOf('/') + 1);
        if (dashUrl != null) {
            try {
                String manifest = new String(download(dashUrl.replace("&amp;", "&")), "UTF-8");
                String best = bestAudio(manifest);
                if (best == null) return null; // The video has no sound.
                return best.startsWith("http") ? best : base + best;
            } catch (Exception ex) {
                Logger.printInfo(() -> "Could not read the DASH manifest " + dashUrl, ex);
            }
        }
        for (String name : AUDIO_NAMES) {
            if (exists(base + name)) return base + name;
        }
        return null;
    }

    /** The file of the audio rendition with the highest bandwidth in the DASH manifest, or null without audio. */
    private static String bestAudio(String manifest) throws Exception {
        XmlPullParser parser = Xml.newPullParser();
        parser.setInput(new StringReader(manifest));
        String best = null;
        long bestBandwidth = -1;
        boolean audioSet = false;
        boolean audio = false;
        long bandwidth = -1;
        for (int event = parser.getEventType(); event != XmlPullParser.END_DOCUMENT; event = parser.next()) {
            if (event != XmlPullParser.START_TAG) continue;
            switch (parser.getName()) {
                case "AdaptationSet":
                    audioSet = isAudio(parser.getAttributeValue(null, "contentType"))
                            || isAudio(parser.getAttributeValue(null, "mimeType"));
                    break;
                case "Representation":
                    String mimeType = parser.getAttributeValue(null, "mimeType");
                    audio = mimeType == null ? audioSet : isAudio(mimeType);
                    String value = parser.getAttributeValue(null, "bandwidth");
                    bandwidth = value == null ? 0 : Long.parseLong(value);
                    break;
                case "BaseURL":
                    if (audio && bandwidth > bestBandwidth) {
                        best = parser.nextText().trim();
                        bestBandwidth = bandwidth;
                    }
                    break;
            }
        }
        return best;
    }

    /** "audio" (contentType) or "audio/mp4" (mimeType). */
    private static boolean isAudio(String type) {
        return type != null && type.startsWith("audio");
    }

    private static boolean exists(String url) {
        HttpURLConnection connection = null;
        try {
            connection = open(url);
            connection.setRequestMethod("HEAD");
            return connection.getResponseCode() == HttpURLConnection.HTTP_OK;
        } catch (IOException ex) {
            return false;
        } finally {
            if (connection != null) connection.disconnect();
        }
    }

    // endregion

    // region Muxing

    /**
     * The saved video and the audio into one MP4, written over the saved file. Work files go to the cache, as the
     * muxer needs a real file.
     */
    private static void mux(Context context, Uri saved, String audioUrl) throws Exception {
        File directory = new File(context.getCacheDir(), "revanced_video_audio");
        if (!directory.isDirectory() && !directory.mkdirs()) throw new IOException("No cache folder");
        File video = new File(directory, "video.mp4");
        File audio = new File(directory, "audio.mp4");
        File output = new File(directory, "output.mp4");
        try {
            try (InputStream in = context.getContentResolver().openInputStream(saved);
                 OutputStream out = new FileOutputStream(video)) {
                if (in == null) throw new IOException("Cannot read the saved video " + saved);
                copy(in, out);
            }
            try (OutputStream out = new FileOutputStream(audio)) {
                out.write(download(audioUrl));
            }

            MediaMuxer muxer = new MediaMuxer(output.getPath(), MediaMuxer.OutputFormat.MUXER_OUTPUT_MPEG_4);
            List<MediaExtractor> extractors = new ArrayList<>();
            List<Integer> tracks = new ArrayList<>();
            try {
                for (Object[] source : new Object[][]{{video, "video/"}, {audio, "audio/"}}) {
                    MediaExtractor extractor = new MediaExtractor();
                    // Released in the finally block, also when it cannot read its file.
                    extractors.add(extractor);
                    extractor.setDataSource(((File) source[0]).getPath());
                    int track = selectTrack(extractor, (String) source[1]);
                    if (track < 0) throw new IOException("No " + source[1] + " track in " + source[0]);
                    MediaFormat format = extractor.getTrackFormat(track);
                    if (format.containsKey("rotation-degrees")) {
                        muxer.setOrientationHint(format.getInteger("rotation-degrees"));
                    }
                    tracks.add(muxer.addTrack(format));
                }
                muxer.start();
                ByteBuffer buffer = ByteBuffer.allocate(BUFFER_SIZE);
                MediaCodec.BufferInfo info = new MediaCodec.BufferInfo();
                for (int i = 0; i < extractors.size(); i++) {
                    MediaExtractor extractor = extractors.get(i);
                    while (true) {
                        int size = extractor.readSampleData(buffer, 0);
                        if (size < 0) break;
                        info.offset = 0;
                        info.size = size;
                        info.presentationTimeUs = extractor.getSampleTime();
                        info.flags = (extractor.getSampleFlags() & MediaExtractor.SAMPLE_FLAG_SYNC) != 0
                                ? MediaCodec.BUFFER_FLAG_KEY_FRAME : 0;
                        muxer.writeSampleData(tracks.get(i), buffer, info);
                        extractor.advance();
                    }
                }
                muxer.stop();
            } finally {
                for (MediaExtractor extractor : extractors) extractor.release();
                muxer.release();
            }

            // Over the saved file ("wt": replaced, not appended).
            try (InputStream in = new FileInputStream(output);
                 OutputStream out = context.getContentResolver().openOutputStream(saved, "wt")) {
                if (out == null) throw new IOException("Cannot write the saved video " + saved);
                copy(in, out);
            }
        } finally {
            //noinspection ResultOfMethodCallIgnored
            video.delete();
            //noinspection ResultOfMethodCallIgnored
            audio.delete();
            //noinspection ResultOfMethodCallIgnored
            output.delete();
        }
    }

    private static int selectTrack(MediaExtractor extractor, String mimePrefix) {
        for (int i = 0; i < extractor.getTrackCount(); i++) {
            String mime = extractor.getTrackFormat(i).getString(MediaFormat.KEY_MIME);
            if (mime != null && mime.startsWith(mimePrefix)) {
                extractor.selectTrack(i);
                return i;
            }
        }
        return -1;
    }

    // endregion

    // region Utilities

    private static HttpURLConnection open(String url) throws IOException {
        HttpURLConnection connection = (HttpURLConnection) new URL(url).openConnection();
        connection.setConnectTimeout(20000);
        connection.setReadTimeout(30000);
        connection.setRequestProperty("User-Agent", "android:com.onelouder.baconreader (Morphe)");
        return connection;
    }

    private static byte[] download(String url) throws IOException {
        HttpURLConnection connection = open(url);
        try {
            int code = connection.getResponseCode();
            if (code != HttpURLConnection.HTTP_OK) throw new IOException("HTTP " + code + " for " + url);
            try (InputStream in = connection.getInputStream()) {
                java.io.ByteArrayOutputStream out = new java.io.ByteArrayOutputStream();
                copy(in, out);
                return out.toByteArray();
            }
        } finally {
            connection.disconnect();
        }
    }

    private static void copy(InputStream in, OutputStream out) throws IOException {
        byte[] buffer = new byte[64 * 1024];
        int read;
        while ((read = in.read(buffer)) != -1) out.write(buffer, 0, read);
    }

    private static Object field(Object target, String name) throws Exception {
        for (Class<?> type = target.getClass(); type != null; type = type.getSuperclass()) {
            try {
                Field field = type.getDeclaredField(name);
                field.setAccessible(true);
                return field.get(target);
            } catch (NoSuchFieldException ignored) {
            }
        }
        throw new NoSuchFieldException(name);
    }

    // endregion
}
