package app.template.extension.zalo.media;

import android.annotation.SuppressLint;
import android.media.MediaCodec;
import android.media.MediaExtractor;
import android.media.MediaFormat;
import android.media.MediaMuxer;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

import javax.crypto.Cipher;
import javax.crypto.CipherInputStream;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;

import app.template.extension.zalo.buglog.NezumiLog;
import app.template.extension.zalo.buglog.Patch;

/**
 * Minimal HLS (VOD) to mp4: picks the highest-bandwidth variant, downloads every segment (MPEG-TS or fMP4,
 * optionally AES-128) into one cache file per rendition, then remuxes with Android's MediaExtractor/MediaMuxer.
 * No transcoding, no third-party libraries. SAMPLE-AES / DRM streams are rejected.
 */
final class HlsDownloader {
    private HlsDownloader() { }

    private static final String TAG = "HlsDownloader";
    private static final int MAX_PLAYLIST_BYTES = 2 * 1024 * 1024;

    /** Downloads the HLS stream at {@code playlistUrl} and writes a playable mp4 to {@code out}. */
    static void download(String playlistUrl, File cacheDir, OutputStream out) throws IOException {
        File work = new File(cacheDir, "nezumi-hls-" + System.nanoTime());
        if (!work.mkdirs()) throw new IOException("mkdirs " + work);
        try {
            String mediaUrl = playlistUrl;
            String audioUrl = null;
            String text = fetchText(playlistUrl);
            if (text.contains("#EXT-X-STREAM-INF")) {
                Variant best = bestVariant(text, playlistUrl);
                if (best == null) throw new IOException("master playlist without variants");
                mediaUrl = best.url;
                audioUrl = best.audioUrl;
                NezumiLog.w(Patch.SAVE_MEDIA, TAG, "hls: master -> variant bandwidth=" + best.bandwidth
                    + (audioUrl != null ? ", separate audio" : ""));
                text = fetchText(mediaUrl);
            }

            File video = new File(work, "video");
            String videoKind = downloadMedia(text, mediaUrl, video);
            File audio = null;
            if (audioUrl != null) {
                audio = new File(work, "audio");
                downloadMedia(fetchText(audioUrl), audioUrl, audio);
            }
            NezumiLog.w(Patch.SAVE_MEDIA, TAG, "hls: downloaded " + videoKind + " " + video.length() + " bytes"
                + (audio != null ? " + audio " + audio.length() + " bytes" : ""));

            File muxed = new File(work, "out.mp4");
            remux(video, audio, muxed);
            try (InputStream in = new FileInputStream(muxed)) {
                copy(in, out);
            }
        } finally {
            deleteTree(work);
        }
    }

    // ---- playlists ----

    private static final class Variant {
        long bandwidth = -1;
        String url;
        String audioUrl;
    }

    private static Variant bestVariant(String master, String base) throws IOException {
        List<String[]> audioGroups = new ArrayList<>(); // {groupId, uri, isDefault}
        Variant best = null;
        String pendingAttrs = null;
        for (String raw : master.split("\n")) {
            String line = raw.trim();
            if (line.isEmpty()) continue;
            if (line.startsWith("#EXT-X-MEDIA:")) {
                String attrs = line.substring("#EXT-X-MEDIA:".length());
                if ("AUDIO".equals(attr(attrs, "TYPE")) && attr(attrs, "URI") != null) {
                    audioGroups.add(new String[] {
                        attr(attrs, "GROUP-ID"), resolve(base, attr(attrs, "URI")), attr(attrs, "DEFAULT")
                    });
                }
            } else if (line.startsWith("#EXT-X-STREAM-INF:")) {
                pendingAttrs = line.substring("#EXT-X-STREAM-INF:".length());
            } else if (!line.startsWith("#") && pendingAttrs != null) {
                Variant variant = new Variant();
                variant.url = resolve(base, line);
                String bandwidth = attr(pendingAttrs, "BANDWIDTH");
                try {
                    variant.bandwidth = bandwidth == null ? 0 : Long.parseLong(bandwidth);
                } catch (NumberFormatException failure) {
                    NezumiLog.swallowedOnce(Patch.SAVE_MEDIA, TAG, "HLS variant BANDWIDTH not a number, treating as 0", failure);
                    variant.bandwidth = 0;
                }
                String group = attr(pendingAttrs, "AUDIO");
                if (group != null) variant.audioUrl = pickAudio(audioGroups, group);
                if (best == null || variant.bandwidth > best.bandwidth) best = variant;
                pendingAttrs = null;
            }
        }
        return best;
    }

    private static String pickAudio(List<String[]> groups, String groupId) {
        String fallback = null;
        for (String[] group : groups) {
            if (!groupId.equals(group[0])) continue;
            if ("YES".equals(group[2])) return group[1];
            if (fallback == null) fallback = group[1];
        }
        return fallback;
    }

    /** Downloads every segment of a media playlist into {@code target}; returns "ts" or "fmp4". */
    private static String downloadMedia(String playlist, String base, File target) throws IOException {
        if (playlist.contains("#EXT-X-STREAM-INF")) throw new IOException("nested master playlist");
        byte[] key = null;
        String keyUrl = null;
        byte[] explicitIv = null;
        long sequence = 0;
        boolean fmp4 = false;
        int segments = 0;
        try (OutputStream out = new FileOutputStream(target)) {
            for (String raw : playlist.split("\n")) {
                String line = raw.trim();
                if (line.isEmpty()) continue;
                if (line.startsWith("#EXT-X-MEDIA-SEQUENCE:")) {
                    try {
                        sequence = Long.parseLong(line.substring("#EXT-X-MEDIA-SEQUENCE:".length()).trim());
                    } catch (NumberFormatException failure) {
                        NezumiLog.swallowedOnce(Patch.SAVE_MEDIA, TAG, "HLS media sequence not a number, starting at 0", failure);
                        sequence = 0;
                    }
                } else if (line.startsWith("#EXT-X-KEY:")) {
                    String attrs = line.substring("#EXT-X-KEY:".length());
                    String method = attr(attrs, "METHOD");
                    if (method == null || "NONE".equals(method)) {
                        key = null;
                        keyUrl = null;
                    } else if ("AES-128".equals(method)) {
                        String uri = resolve(base, attr(attrs, "URI"));
                        if (!uri.equals(keyUrl)) {
                            key = fetchBytes(uri, 64);
                            keyUrl = uri;
                        }
                        if (key.length != 16) throw new IOException("bad AES key length " + key.length);
                        String iv = attr(attrs, "IV");
                        explicitIv = iv == null ? null : parseIv(iv);
                    } else {
                        throw new IOException("unsupported HLS encryption " + method);
                    }
                } else if (line.startsWith("#EXT-X-MAP:")) {
                    String attrs = line.substring("#EXT-X-MAP:".length());
                    if (attr(attrs, "BYTERANGE") != null) throw new IOException("byte-range init segment");
                    if (!fmp4) {
                        fmp4 = true;
                        writeSegment(resolve(base, attr(attrs, "URI")), null, null, out);
                    }
                } else if (line.startsWith("#EXT-X-BYTERANGE")) {
                    throw new IOException("byte-range segments not supported");
                } else if (!line.startsWith("#")) {
                    byte[] iv = key == null ? null : (explicitIv != null ? explicitIv : sequenceIv(sequence));
                    writeSegment(resolve(base, line), key, iv, out);
                    sequence++;
                    segments++;
                }
            }
        }
        if (segments == 0) throw new IOException("playlist has no segments");
        return fmp4 ? "fmp4" : "ts";
    }

    private static void writeSegment(String url, byte[] key, byte[] iv, OutputStream out) throws IOException {
        HttpURLConnection connection = open(url);
        try (InputStream body = connection.getInputStream()) {
            InputStream in = body;
            if (key != null) {
                try {
                    Cipher cipher = Cipher.getInstance("AES/CBC/PKCS5Padding");
                    cipher.init(Cipher.DECRYPT_MODE, new SecretKeySpec(key, "AES"), new IvParameterSpec(iv));
                    in = new CipherInputStream(body, cipher);
                } catch (java.security.GeneralSecurityException failure) {
                    throw new IOException("cipher init", failure);
                }
            }
            if (copy(in, out) == 0) throw new IOException("empty segment");
        } finally {
            connection.disconnect();
        }
    }

    private static byte[] sequenceIv(long sequence) {
        byte[] iv = new byte[16];
        for (int i = 15; i >= 8; i--) {
            iv[i] = (byte) (sequence & 0xff);
            sequence >>>= 8;
        }
        return iv;
    }

    private static byte[] parseIv(String hex) throws IOException {
        String digits = hex.startsWith("0x") || hex.startsWith("0X") ? hex.substring(2) : hex;
        if (digits.length() > 32) throw new IOException("bad IV");
        while (digits.length() < 32) digits = "0" + digits;
        byte[] iv = new byte[16];
        for (int i = 0; i < 16; i++) iv[i] = (byte) Integer.parseInt(digits.substring(i * 2, i * 2 + 2), 16);
        return iv;
    }

    /** Value of {@code NAME=value} or {@code NAME="value"} in an attribute list; null when absent. */
    private static String attr(String attrs, String name) {
        int i = 0;
        while (i < attrs.length()) {
            int eq = attrs.indexOf('=', i);
            if (eq < 0) return null;
            String key = attrs.substring(i, eq).trim();
            int start = eq + 1;
            int end;
            String value;
            if (start < attrs.length() && attrs.charAt(start) == '"') {
                end = attrs.indexOf('"', start + 1);
                if (end < 0) end = attrs.length();
                value = attrs.substring(start + 1, end);
                end = attrs.indexOf(',', end);
            } else {
                end = attrs.indexOf(',', start);
                value = attrs.substring(start, end < 0 ? attrs.length() : end).trim();
            }
            if (key.equalsIgnoreCase(name)) return value;
            if (end < 0) return null;
            i = end + 1;
        }
        return null;
    }

    private static String resolve(String base, String relative) throws IOException {
        if (relative == null) throw new IOException("missing URI");
        return new URL(new URL(base), relative).toString();
    }

    // ---- remux ----

    @SuppressLint("WrongConstant")
    private static void remux(File video, File audio, File output) throws IOException {
        List<MediaExtractor> extractors = new ArrayList<>();
        MediaMuxer muxer = null;
        boolean started = false;
        try {
            MediaExtractor main = new MediaExtractor();
            extractors.add(main);
            main.setDataSource(video.getAbsolutePath());
            MediaExtractor second = null;
            if (audio != null) {
                second = new MediaExtractor();
                extractors.add(second);
                second.setDataSource(audio.getAbsolutePath());
            }

            muxer = new MediaMuxer(output.getAbsolutePath(), MediaMuxer.OutputFormat.MUXER_OUTPUT_MPEG_4);
            List<int[]> tracks = new ArrayList<>(); // {extractorIndex, outTrack}
            boolean haveVideo = false;
            boolean haveAudio = false;
            int maxInput = 1024 * 1024;
            for (int e = 0; e < extractors.size(); e++) {
                MediaExtractor extractor = extractors.get(e);
                for (int t = 0; t < extractor.getTrackCount(); t++) {
                    MediaFormat format = extractor.getTrackFormat(t);
                    String mime = format.getString(MediaFormat.KEY_MIME);
                    if (mime == null) continue;
                    boolean isVideo = mime.startsWith("video/");
                    boolean isAudio = mime.startsWith("audio/");
                    // one video + one audio track; the separate audio rendition wins over muxed audio
                    if (isVideo && haveVideo || !isVideo && !isAudio) continue;
                    if (isAudio && (haveAudio || e == 0 && second != null && hasAudio(second))) continue;
                    extractor.selectTrack(t);
                    if (format.containsKey(MediaFormat.KEY_MAX_INPUT_SIZE)) {
                        maxInput = Math.max(maxInput, format.getInteger(MediaFormat.KEY_MAX_INPUT_SIZE));
                    }
                    tracks.add(new int[] { e, t, muxer.addTrack(format) });
                    NezumiLog.w(Patch.SAVE_MEDIA, TAG, "hls: remux track " + mime);
                    if (isVideo) haveVideo = true; else haveAudio = true;
                }
            }
            if (!haveVideo) throw new IOException("no video track in HLS stream");

            muxer.start();
            started = true;
            ByteBuffer buffer = ByteBuffer.allocate(maxInput);
            MediaCodec.BufferInfo info = new MediaCodec.BufferInfo();
            long[] firstTime = new long[extractors.size()];
            for (int i = 0; i < firstTime.length; i++) firstTime[i] = Long.MIN_VALUE;
            long base = Long.MAX_VALUE;
            for (MediaExtractor extractor : extractors) {
                long time = extractor.getSampleTime();
                if (time >= 0) base = Math.min(base, time);
            }
            if (base == Long.MAX_VALUE) base = 0;

            // interleave by timestamp across extractors
            while (true) {
                int pick = -1;
                long pickTime = Long.MAX_VALUE;
                for (int e = 0; e < extractors.size(); e++) {
                    long time = extractors.get(e).getSampleTime();
                    if (time >= 0 && time < pickTime) {
                        pick = e;
                        pickTime = time;
                    }
                }
                if (pick < 0) break;
                MediaExtractor extractor = extractors.get(pick);
                int outTrack = outTrackFor(tracks, pick, extractor.getSampleTrackIndex());
                buffer.clear();
                int size = extractor.readSampleData(buffer, 0);
                if (size > 0 && outTrack >= 0) {
                    info.offset = 0;
                    info.size = size;
                    info.presentationTimeUs = Math.max(0, pickTime - base);
                    info.flags = (extractor.getSampleFlags() & MediaExtractor.SAMPLE_FLAG_SYNC) != 0
                        ? MediaCodec.BUFFER_FLAG_KEY_FRAME : 0;
                    muxer.writeSampleData(outTrack, buffer, info);
                }
                extractor.advance(); // once drained, getSampleTime() returns -1
            }
        } finally {
            if (muxer != null) {
                try {
                    if (started) muxer.stop();
                } finally {
                    muxer.release();
                }
            }
            for (MediaExtractor extractor : extractors) extractor.release();
        }
    }

    private static boolean hasAudio(MediaExtractor extractor) {
        for (int t = 0; t < extractor.getTrackCount(); t++) {
            String mime = extractor.getTrackFormat(t).getString(MediaFormat.KEY_MIME);
            if (mime != null && mime.startsWith("audio/")) return true;
        }
        return false;
    }

    private static int outTrackFor(List<int[]> tracks, int extractorIndex, int trackIndex) {
        for (int[] track : tracks) {
            if (track[0] == extractorIndex && track[1] == trackIndex) return track[2];
        }
        return -1;
    }

    // ---- io ----

    private static HttpURLConnection open(String address) throws IOException {
        String current = address;
        for (int hops = 0; hops < 6; hops++) {
            HttpURLConnection connection = (HttpURLConnection) new URL(current).openConnection();
            connection.setInstanceFollowRedirects(false);
            connection.setConnectTimeout(15000);
            connection.setReadTimeout(30000);
            int code = connection.getResponseCode();
            if (code == 301 || code == 302 || code == 303 || code == 307 || code == 308) {
                String location = connection.getHeaderField("Location");
                connection.disconnect();
                if (location == null) throw new IOException("redirect without location");
                current = new URL(new URL(current), location).toString();
                continue;
            }
            if (code != 200) {
                connection.disconnect();
                throw new IOException("HTTP " + code + " for " + host(current));
            }
            return connection;
        }
        throw new IOException("too many redirects");
    }

    private static String fetchText(String url) throws IOException {
        String text = new String(fetchBytes(url, MAX_PLAYLIST_BYTES), "UTF-8").replace("\r", "");
        if (!text.startsWith("#EXTM3U") && !text.startsWith("﻿#EXTM3U")) {
            throw new IOException("not an m3u8 playlist (" + host(url) + ")");
        }
        return text;
    }

    private static byte[] fetchBytes(String url, int limit) throws IOException {
        HttpURLConnection connection = open(url);
        try (InputStream in = connection.getInputStream()) {
            ByteArrayOutputStream out = new ByteArrayOutputStream();
            byte[] buffer = new byte[8192];
            int read;
            while ((read = in.read(buffer)) != -1) {
                out.write(buffer, 0, read);
                if (out.size() > limit) throw new IOException("response too large");
            }
            return out.toByteArray();
        } finally {
            connection.disconnect();
        }
    }

    private static long copy(InputStream in, OutputStream out) throws IOException {
        byte[] buffer = new byte[64 * 1024];
        long total = 0;
        int read;
        while ((read = in.read(buffer)) != -1) {
            out.write(buffer, 0, read);
            total += read;
        }
        return total;
    }

    private static String host(String url) {
        try {
            return new URL(url).getHost().toLowerCase(Locale.US);
        } catch (IOException failure) {
            NezumiLog.swallowedOnce(Patch.SAVE_MEDIA, TAG, "unparseable media URL host", failure);
            return "?";
        }
    }

    private static void deleteTree(File file) {
        File[] children = file.listFiles();
        if (children != null) for (File child : children) deleteTree(child);
        //noinspection ResultOfMethodCallIgnored
        file.delete();
    }
}
