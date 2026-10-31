package app.fblite.extension.video;

import android.app.Activity;
import android.app.DownloadManager;
import android.content.ContentResolver;
import android.content.ContentValues;
import android.content.Context;
import android.media.MediaCodec;
import android.media.MediaExtractor;
import android.media.MediaFormat;
import android.media.MediaMuxer;
import android.media.MediaScannerConnection;
import android.net.Uri;
import android.os.Build;
import android.os.Environment;
import android.provider.MediaStore;
import android.widget.Toast;

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
import java.util.concurrent.atomic.AtomicBoolean;

import app.fblite.extension.settings.MorpheLog;
import app.fblite.extension.settings.MorpheSettings;

/**
 * Saves a video. The progressive MP4 Facebook Lite hands the player is the SD file. Every video also carries
 * a DASH manifest with all qualities, each as a separate picture file and sound file, so for HD the two
 * tracks of the chosen quality are fetched and joined into one MP4 with MediaMuxer (no re-encoding).
 *
 * The manifest is found by its content (it is the text holding "&lt;MPD"), not by a field name, so this does
 * not depend on obfuscated names. Any failure of the HD path falls back to the SD file.
 *
 * Joining approach adapted from Hushfacebook's DashSave (GPL-3.0).
 */
final class VideoDownloader {
    /** What the button found for one video. */
    static final class Source {
        final String sdUrl;
        final String id;
        final Object[] roots;
        /** Owner-Type-date for the saved file, or null to name it by video id. */
        String baseName;
        /** Who posted it and what it is (Reel, Story, Video), for the quality sheet. */
        String owner;
        String type;

        Source(String sdUrl, String id, Object... roots) {
            this.sdUrl = sdUrl;
            this.id = id;
            this.roots = roots;
        }
    }

    private static final class Option {
        final String label;
        final String detail;
        final String suffix;
        final DashManifest.Track video;
        final DashManifest.Track audio;
        /** A whole-file MP4 address (the SD file, or another progressive file Facebook gave), when video is null. */
        final String fileUrl;

        Option(String label, String detail, String suffix, DashManifest.Track video, DashManifest.Track audio, String fileUrl) {
            this.label = label;
            this.detail = detail;
            this.suffix = suffix;
            this.video = video;
            this.audio = audio;
            this.fileUrl = fileUrl;
        }

        boolean isFile() {
            return video == null;
        }
    }

    private static final int MAX_NODES = 512;
    private static final int MAX_DEPTH = 3;
    private static final long MAX_TRACK_BYTES = 600L * 1024 * 1024;
    private static final int MAX_SAMPLE = 16 * 1024 * 1024;
    private static final String FOLDER = "Facebook Lite";
    private static final AtomicBoolean BUSY = new AtomicBoolean();

    private VideoDownloader() {
    }

    static void start(Activity activity, Source source) {
        List<Option> options = new ArrayList<>();
        ObjectScan scan = ObjectScan.run(source.roots);
        MorpheLog.log("video", "Download asked: id=" + source.id + " sd=" + MorpheLog.url(source.sdUrl) + " scanned " + scan.nodes
                + " objects, " + scan.manifests.size() + " manifests, " + scan.urls.size() + " addresses");
        boolean manifestFound = false;
        try {
            String xml = scan.manifest();
            if (xml == null) {
                VideoFeatures.log("No DASH manifest found, " + (source.sdUrl == null ? "no SD file either" : "using the SD file"), null);
            } else {
                manifestFound = true;
                DashManifest manifest = DashManifest.parse(xml);
                DashManifest.Track audio = manifest.audio();
                // Never save a silent file when the video has sound that cannot be joined.
                boolean joinable = audio != null || !manifest.hasAnyAudio();
                List<DashManifest.Track> videos = standardQualities(manifest.videoChoices());
                VideoFeatures.log("Manifest at " + scan.manifests.get(0).path + ": " + manifest.tracks.size() + " tracks, "
                        + videos.size() + " video choices, audio " + audio + ", joinable " + joinable, null);
                if (joinable) {
                    for (DashManifest.Track video : videos) {
                        long bytes = (long) ((video.bandwidth + (audio == null ? 0 : audio.bandwidth)) / 8.0 * manifest.durationSeconds);
                        String codec = video.codecName();
                        String detail = (codec.isEmpty() ? "" : codec + " · ") + (bytes > 0 ? "~" + size(bytes) : "");
                        options.add(new Option(video.quality() + "p", detail, video.quality() + "p", video, audio, null));
                    }
                }
            }
        } catch (Throwable t) {
            VideoFeatures.log("Reading the manifest failed", t);
            options.clear();
        }
        addProgressive(options, scan, source.sdUrl);
        if (source.sdUrl != null) {
            options.add(new Option("SD", vi() ? "tệp gốc, nhanh" : "original file, fast", "SD", null, null, source.sdUrl));
        }
        if (options.isEmpty()) {
            toast(activity, vi() ? "Không lấy được link video này" : "This video has no downloadable link");
            return;
        }
        StringBuilder listed = new StringBuilder();
        for (Option o : options) listed.append(o.label).append(' ');
        MorpheLog.log("video", "Options: " + listed.toString().trim() + " (manifest " + (manifestFound ? "found" : "not found") + ")");
        if (options.size() == 1 && options.get(0).isFile() && !manifestFound) {
            toast(activity, vi() ? "Chỉ có bản SD cho video này" : "Only the SD file is available for this video");
        }
        if (options.size() == 1 || !MorpheSettings.isEnabled(activity, MorpheSettings.ASK_DOWNLOAD_QUALITY)) {
            run(activity, source, options.get(0));
            return;
        }
        String[] labels = new String[options.size()];
        String[] details = new String[options.size()];
        for (int i = 0; i < labels.length; i++) {
            labels[i] = options.get(i).label;
            details[i] = options.get(i).detail;
        }
        try {
            String who = (source.owner == null || source.owner.isEmpty() ? "" : source.owner)
                    + (source.type == null ? "" : (source.owner == null || source.owner.isEmpty() ? "" : " · ") + source.type);
            QualitySheet.show(activity, vi() ? "Chất lượng tải xuống" : "Download quality", who, labels, details,
                    which -> run(activity, source, options.get(which)));
        } catch (Throwable t) {
            VideoFeatures.log("Quality sheet failed, saving the best quality", t);
            run(activity, source, options.get(0));
        }
    }

    /**
     * Facebook offers many steps (240, 270, 360, 480, 540, 640, 720, 1080). The list keeps the usual ones, and the
     * best step when that is not a usual one, so the picker stays short.
     */
    private static List<DashManifest.Track> standardQualities(List<DashManifest.Track> all) {
        List<DashManifest.Track> kept = new ArrayList<>();
        for (DashManifest.Track t : all) {
            int q = t.quality();
            if (q == 1080 || q == 720 || q == 480 || q == 360 || q == 240) kept.add(t);
        }
        if (kept.isEmpty()) return all;
        if (!all.isEmpty() && !kept.contains(all.get(0))) kept.add(0, all.get(0));
        return kept;
    }

    /**
     * Other whole-file MP4 addresses the video's objects hold (an HD file next to the SD one). Only addresses
     * Facebook tags as progressive count: DASH tracks hold only picture or only sound.
     */
    private static void addProgressive(List<Option> options, ObjectScan scan, String sdUrl) {
        List<Option> found = new ArrayList<>();
        for (ObjectScan.Hit hit : scan.urls) {
            if (hit.text.equals(sdUrl) || sameFile(hit.text, sdUrl)) continue;
            String tag = MorpheLog.encodeTag(hit.text);
            if (tag == null || !tag.toLowerCase(Locale.US).contains("progressive")) continue;
            int quality = qualityOf(tag);
            String label = quality > 0 ? quality + "p" : "HD";
            boolean duplicate = false;
            for (Option o : found) duplicate |= o.label.equals(label);
            if (duplicate) continue;
            MorpheLog.log("video", "Progressive file at " + hit.path + " tag=" + tag);
            found.add(new Option(label, vi() ? "tệp gốc" : "original file", label, null, null, hit.text));
        }
        found.sort((a, b) -> Integer.compare(qualityOf(b.suffix), qualityOf(a.suffix)));
        // Joined DASH tracks come first when they exist, but a progressive file beats SD.
        options.addAll(found);
    }

    private static boolean sameFile(String a, String b) {
        if (a == null || b == null) return false;
        int qa = a.indexOf('?');
        int qb = b.indexOf('?');
        return (qa < 0 ? a : a.substring(0, qa)).equals(qb < 0 ? b : b.substring(0, qb));
    }

    /** 720 for a tag or label holding 720p, else 0. */
    private static int qualityOf(String text) {
        java.util.regex.Matcher m = java.util.regex.Pattern.compile("(\\d{3,4})p").matcher(text);
        return m.find() ? Integer.parseInt(m.group(1)) : 0;
    }

    private static void run(Activity activity, Source source, Option option) {
        String name = source.baseName != null ? source.baseName
                : (source.id != null ? source.id : String.valueOf(System.currentTimeMillis()));
        MorpheLog.log("video", "Saving " + option.label + " as " + name);
        if (option.isFile()) {
            DownloadProgress.begin(activity, name, vi() ? "Đang tải…" : "Downloading…");
            enqueueSd(activity, option.fileUrl, name + ".mp4");
            return;
        }
        if (!BUSY.compareAndSet(false, true)) {
            toast(activity, vi() ? "Đang tải một video khác" : "Another download is in progress");
            return;
        }
        final Context app = activity.getApplicationContext();
        final String sdUrl = source.sdUrl;
        final String fileName = name + ".mp4";
        DownloadProgress.begin(activity, name, vi() ? "Đang chuẩn bị…" : "Preparing…");
        DownloadButton.setBusy(true);
        new Thread(() -> {
            File dir = new File(app.getCacheDir(), "fblite-video");
            File videoFile = new File(dir, "video.mp4");
            File audioFile = new File(dir, "audio.mp4");
            File sdFile = new File(dir, "sd.mp4");
            File joined = new File(dir, "joined.mp4");
            try {
                clear(dir);
                if (!dir.isDirectory() && !dir.mkdirs()) throw new IOException("No work folder");
                // Progress: sound 0-12%, picture 12-82%, join 82-92%, save 92-100%.
                File audioSource = null;
                if (option.audio != null) {
                    audioSource = audioFile;
                    boolean xhe = option.audio.isXheAac();
                    if (xhe && sdUrl != null) {
                        // xHE-AAC (what Facebook pairs with AV1 and VP9) is not played by many players. The SD file carries
                        // the same sound as plain AAC, so that sound is used when it is AAC.
                        DownloadProgress.update(0f, vi() ? "Đang tải âm thanh…" : "Downloading sound…");
                        fetch(sdUrl, sdFile, (done, total) -> DownloadProgress.update(total > 0 ? 0.12f * done / total : 0.05f,
                                vi() ? "Đang tải âm thanh…" : "Downloading sound…"));
                        int type = Mp4Remux.audioObjectType(sdFile);
                        MorpheLog.log("video", "SD file sound has audio object type " + type + " (manifest sound " + option.audio.codecs + ")");
                        if (type == 2 || type == 5 || type == 29) audioSource = sdFile;
                    }
                    if (audioSource == audioFile) {
                        fetch(option.audio.url, audioFile, (done, total) -> DownloadProgress.update(total > 0 ? 0.12f * done / total : 0.05f,
                                vi() ? "Đang tải âm thanh…" : "Downloading sound…"));
                    }
                }
                final String sizeText = option.detail;
                fetch(option.video.url, videoFile, (done, total) -> DownloadProgress.update(
                        0.12f + (total > 0 ? 0.70f * done / total : 0.3f),
                        (vi() ? "Đang tải hình " : "Downloading video ") + (total > 0 ? (100 * done / total) + "%" : "")));
                DownloadProgress.update(0.84f, vi() ? "Đang ghép hình và tiếng…" : "Joining picture and sound…");
                join(videoFile, audioSource, joined, option);
                DownloadProgress.update(0.93f, vi() ? "Đang lưu…" : "Saving…");
                save(app, joined, fileName);
                VideoFeatures.log("Saved " + fileName, null);
                DownloadProgress.done(vi() ? "Đã lưu vào Movies/" + FOLDER : "Saved to Movies/" + FOLDER);
            } catch (Throwable t) {
                VideoFeatures.log("HD download failed", t);
                if (sdUrl != null) {
                    DownloadProgress.fail(vi() ? "Tải HD thất bại, đang tải bản SD" : "HD failed, saving the SD file");
                    VideoFeatures.MAIN.post(() -> enqueueSd(app, sdUrl, name + ".mp4"));
                } else {
                    DownloadProgress.fail(vi() ? "Tải video thất bại" : "Download failed");
                }
            } finally {
                clear(dir);
                BUSY.set(false);
                DownloadButton.setBusy(false);
            }
        }, "FbLiteVideoDownload").start();
    }

    private static void enqueueSd(Context context, String url, String name) {
        try {
            DownloadManager.Request request = new DownloadManager.Request(Uri.parse(url))
                    .setTitle(name)
                    .setMimeType("video/mp4")
                    .setNotificationVisibility(DownloadManager.Request.VISIBILITY_VISIBLE_NOTIFY_COMPLETED)
                    .setDestinationInExternalPublicDir(Environment.DIRECTORY_MOVIES, FOLDER + "/" + name);
            DownloadManager manager = (DownloadManager) context.getSystemService(Context.DOWNLOAD_SERVICE);
            long id = manager.enqueue(request);
            watch(manager, id);
            VideoFeatures.log("Downloading " + name + " from " + url, null);
            toast(context, vi() ? "Đang tải video vào Movies/" + FOLDER : "Downloading to Movies/" + FOLDER);
        } catch (Throwable t) {
            VideoFeatures.log("SD download failed", t);
            toast(context, vi() ? "Tải video thất bại" : "Download failed");
        }
    }

    /** Follows a system download and mirrors it on the progress card. */
    private static void watch(final DownloadManager manager, final long id) {
        new Thread(() -> {
            try {
                for (int i = 0; i < 1200; i++) {
                    android.database.Cursor c = manager.query(new DownloadManager.Query().setFilterById(id));
                    try {
                        if (c == null || !c.moveToFirst()) return;
                        int status = c.getInt(c.getColumnIndexOrThrow(DownloadManager.COLUMN_STATUS));
                        long done = c.getLong(c.getColumnIndexOrThrow(DownloadManager.COLUMN_BYTES_DOWNLOADED_SO_FAR));
                        long total = c.getLong(c.getColumnIndexOrThrow(DownloadManager.COLUMN_TOTAL_SIZE_BYTES));
                        if (status == DownloadManager.STATUS_SUCCESSFUL) {
                            DownloadProgress.done(vi() ? "Đã lưu vào Movies/" + FOLDER : "Saved to Movies/" + FOLDER);
                            return;
                        }
                        if (status == DownloadManager.STATUS_FAILED) {
                            DownloadProgress.fail(vi() ? "Tải video thất bại" : "Download failed");
                            return;
                        }
                        DownloadProgress.update(total > 0 ? (float) done / total : 0f,
                                (vi() ? "Đang tải " : "Downloading ") + (total > 0 ? (100 * done / total) + "%" : ""));
                    } finally {
                        if (c != null) c.close();
                    }
                    Thread.sleep(500);
                }
            } catch (Throwable ignored) {
                // The system keeps downloading; only the card stops.
            }
        }, "FbLiteDownloadWatch").start();
    }

    // ------------------------------------------------------------------------------------ network and files

    private interface Progress {
        void on(long done, long total);
    }

    private static void fetch(String address, File to) throws IOException {
        fetch(address, to, null);
    }

    private static void fetch(String address, File to, Progress progress) throws IOException {
        HttpURLConnection connection = (HttpURLConnection) new URL(address).openConnection();
        connection.setConnectTimeout(15000);
        connection.setReadTimeout(30000);
        connection.setRequestProperty("Accept-Encoding", "identity");
        try {
            int code = connection.getResponseCode();
            if (code != 200) throw new IOException("HTTP " + code);
            long total = 0;
            long expected = connection.getContentLengthLong();
            try (InputStream in = connection.getInputStream(); OutputStream out = new FileOutputStream(to)) {
                byte[] buffer = new byte[64 * 1024];
                int n;
                while ((n = in.read(buffer)) > 0) {
                    total += n;
                    if (total > MAX_TRACK_BYTES) throw new IOException("Track too large");
                    out.write(buffer, 0, n);
                    if (progress != null) progress.on(total, expected);
                }
            }
            if (total == 0) throw new IOException("Empty track");
        } finally {
            connection.disconnect();
        }
    }

    private static void clear(File dir) {
        File[] files = dir.listFiles();
        if (files != null) for (File f : files) f.delete();
        dir.delete();
    }

    /**
     * Joins picture and sound into one MP4 without decoding. H.264 and H.265 with AAC go through MediaMuxer, which
     * is the path that has been tried on devices. AV1, VP9 and xHE-AAC, which MediaMuxer cannot write before Android
     * 14, and anything MediaMuxer refuses, go through {@link Mp4Remux}.
     */
    private static void join(File videoFile, File audioFile, File out, Option option) throws IOException {
        boolean muxerOk = option.video.muxerCanWrite() && (option.audio == null || option.audio.audioRank() >= 2);
        if (muxerOk) {
            try {
                joinWithMuxer(videoFile, audioFile, out);
                MorpheLog.log("video", "Joined with MediaMuxer");
                return;
            } catch (Throwable t) {
                VideoFeatures.log("MediaMuxer join failed, joining by hand", t);
                out.delete();
            }
        }
        Mp4Remux.join(videoFile, audioFile, out);
        MorpheLog.log("video", "Joined with Mp4Remux (" + option.video.codecName() + (option.audio == null ? "" : ", audio " + option.audio.codecs) + "), "
                + out.length() + " bytes");
    }

    /** Copies the samples of both files into one MP4, interleaved by time. Nothing is decoded or encoded. */
    private static void joinWithMuxer(File videoFile, File audioFile, File out) throws IOException {
        MediaExtractor video = new MediaExtractor();
        MediaExtractor audio = null;
        MediaMuxer muxer = null;
        boolean started = false;
        try {
            video.setDataSource(videoFile.getAbsolutePath());
            int videoTrack = firstTrack(video, "video/");
            if (videoTrack < 0) throw new IOException("No video track");
            video.selectTrack(videoTrack);
            MediaFormat videoFormat = video.getTrackFormat(videoTrack);

            muxer = new MediaMuxer(out.getAbsolutePath(), MediaMuxer.OutputFormat.MUXER_OUTPUT_MPEG_4);
            int videoOut = muxer.addTrack(videoFormat);
            int audioOut = -1;
            if (videoFormat.containsKey(MediaFormat.KEY_ROTATION)) {
                int rotation = videoFormat.getInteger(MediaFormat.KEY_ROTATION);
                if (rotation == 90 || rotation == 180 || rotation == 270) muxer.setOrientationHint(rotation);
            }
            if (audioFile != null) {
                audio = new MediaExtractor();
                audio.setDataSource(audioFile.getAbsolutePath());
                int audioTrack = firstTrack(audio, "audio/");
                if (audioTrack < 0) throw new IOException("No audio track");
                audio.selectTrack(audioTrack);
                audioOut = muxer.addTrack(audio.getTrackFormat(audioTrack));
            }
            muxer.start();
            started = true;

            ByteBuffer buffer = ByteBuffer.allocate(2 * 1024 * 1024);
            MediaCodec.BufferInfo info = new MediaCodec.BufferInfo();
            boolean videoDone = false;
            boolean audioDone = audio == null;
            while (true) {
                long videoTime = Long.MAX_VALUE;
                if (!videoDone) {
                    videoTime = video.getSampleTime();
                    if (videoTime < 0) {
                        videoDone = true;
                        videoTime = Long.MAX_VALUE;
                    }
                }
                long audioTime = Long.MAX_VALUE;
                if (!audioDone) {
                    audioTime = audio.getSampleTime();
                    if (audioTime < 0) {
                        audioDone = true;
                        audioTime = Long.MAX_VALUE;
                    }
                }
                if (videoDone && audioDone) break;

                boolean useVideo = videoTime <= audioTime;
                MediaExtractor source = useVideo ? video : audio;
                long size = source.getSampleSize();
                if (size > buffer.capacity()) {
                    if (size > MAX_SAMPLE) throw new IOException("Sample too large");
                    buffer = ByteBuffer.allocate((int) size);
                }
                buffer.clear();
                int read = source.readSampleData(buffer, 0);
                if (read < 0) {
                    if (useVideo) videoDone = true;
                    else audioDone = true;
                    continue;
                }
                int flags = (source.getSampleFlags() & MediaExtractor.SAMPLE_FLAG_SYNC) != 0 ? MediaCodec.BUFFER_FLAG_KEY_FRAME : 0;
                info.set(0, read, source.getSampleTime(), flags);
                muxer.writeSampleData(useVideo ? videoOut : audioOut, buffer, info);
                source.advance();
            }
            muxer.stop();
            started = false;
        } finally {
            video.release();
            if (audio != null) audio.release();
            if (muxer != null) {
                try {
                    if (started) muxer.stop();
                } catch (Throwable ignored) {
                }
                muxer.release();
            }
        }
    }

    private static int firstTrack(MediaExtractor extractor, String mimePrefix) {
        for (int i = 0; i < extractor.getTrackCount(); i++) {
            String mime = extractor.getTrackFormat(i).getString(MediaFormat.KEY_MIME);
            if (mime != null && mime.startsWith(mimePrefix)) return i;
        }
        return -1;
    }

    /** Puts the finished file into Movies/Facebook Lite. */
    private static void save(Context context, File file, String name) throws IOException {
        if (Build.VERSION.SDK_INT >= 29) {
            ContentResolver resolver = context.getContentResolver();
            ContentValues values = new ContentValues();
            values.put(MediaStore.Video.Media.DISPLAY_NAME, name);
            values.put(MediaStore.Video.Media.MIME_TYPE, "video/mp4");
            values.put(MediaStore.Video.Media.RELATIVE_PATH, Environment.DIRECTORY_MOVIES + "/" + FOLDER);
            values.put(MediaStore.Video.Media.IS_PENDING, 1);
            Uri uri = resolver.insert(MediaStore.Video.Media.EXTERNAL_CONTENT_URI, values);
            if (uri == null) throw new IOException("MediaStore refused the file");
            try (OutputStream out = resolver.openOutputStream(uri)) {
                if (out == null) throw new IOException("No output stream");
                copy(file, out);
            } catch (IOException | RuntimeException e) {
                resolver.delete(uri, null, null);
                throw e;
            }
            values.clear();
            values.put(MediaStore.Video.Media.IS_PENDING, 0);
            resolver.update(uri, values, null, null);
        } else {
            File dir = new File(Environment.getExternalStoragePublicDirectory(Environment.DIRECTORY_MOVIES), FOLDER);
            if (!dir.isDirectory() && !dir.mkdirs()) throw new IOException("Cannot create " + dir);
            File target = new File(dir, name);
            if (target.exists()) target = new File(dir, System.currentTimeMillis() + "_" + name);
            try (OutputStream out = new FileOutputStream(target)) {
                copy(file, out);
            }
            MediaScannerConnection.scanFile(context, new String[] {target.getAbsolutePath()}, new String[] {"video/mp4"}, null);
        }
    }

    private static void copy(File from, OutputStream to) throws IOException {
        try (InputStream in = new FileInputStream(from)) {
            byte[] buffer = new byte[64 * 1024];
            int n;
            while ((n = in.read(buffer)) > 0) to.write(buffer, 0, n);
        }
    }

    // ------------------------------------------------------------------------------------ small helpers

    private static String size(long bytes) {
        double mb = bytes / (1024.0 * 1024.0);
        return mb >= 10 ? String.format(Locale.US, "%.0f MB", mb) : String.format(Locale.US, "%.1f MB", mb);
    }

    private static boolean vi() {
        return "vi".equals(Locale.getDefault().getLanguage());
    }

    private static void toast(final Context context, final String text) {
        VideoFeatures.MAIN.post(() -> Toast.makeText(context, text, Toast.LENGTH_SHORT).show());
    }
}
