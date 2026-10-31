package app.fblite.extension.video;

import android.view.View;

import java.util.HashSet;
import java.util.Set;

import app.fblite.extension.settings.MorpheLog;

/**
 * Debug only (Morphe settings, Debug logging): when a video starts playing, logs where Facebook keeps its
 * sources, to find out why a download is only the SD file. Each video is logged once.
 */
final class VideoProbe {
    private static final int REEL_DUMPS = 1;
    private static final int OTHER_DUMPS = 6;
    private static final int DOWNLOAD_DUMPS = 2;
    private static final int MAX_SEEN = 500;
    private static final Set<String> SEEN = new HashSet<>();
    private static int reelDumps;
    private static int otherDumps;
    private static int downloadDumps;

    private VideoProbe() {
    }

    static void onPlaying(View video) {
        if (!MorpheLog.enabled()) return;
        try {
            Object[] roots = DownloadButton.roots(video);
            Object props = roots[0];
            String id = null;
            if (props != null) {
                try {
                    id = (String) ObjectScan.field(props, "A0b");
                } catch (Throwable ignored) {
                }
            }
            String key = id != null ? id : "view" + System.identityHashCode(video);
            if (SEEN.size() > MAX_SEEN) SEEN.clear();
            if (!SEEN.add(key)) return;
            // Reels are understood by now; videos of any other shape (feed, Marketplace) get the full dump.
            boolean reel = video.getHeight() >= video.getWidth() * 1.5f;
            boolean full = reel ? reelDumps++ < REEL_DUMPS : otherDumps++ < OTHER_DUMPS;
            report("PLAYING", video, roots, id, full);
        } catch (Throwable t) {
            MorpheLog.log("probe", "Probe failed", t);
        }
    }

    /** Same report for the video a download was just asked for, always with the full dump. */
    static void onDownload(View video, Object[] roots, String id) {
        if (!MorpheLog.enabled()) return;
        try {
            report("DOWNLOAD", video, roots, id, downloadDumps++ < DOWNLOAD_DUMPS);
        } catch (Throwable t) {
            MorpheLog.log("probe", "Probe failed", t);
        }
    }

    private static void report(String what, View video, Object[] roots, String id, boolean full) {
        ObjectScan scan = ObjectScan.run(roots);
        StringBuilder sb = new StringBuilder(what).append(" id=").append(id)
                .append(" view=").append(video.getClass().getName())
                .append(' ').append(video.getWidth()).append('x').append(video.getHeight())
                .append(" nodes=").append(scan.nodes)
                .append(" manifests=").append(scan.manifests.size())
                .append(" urls=").append(scan.urls.size());
        MorpheLog.log("probe", sb.toString());
        for (ObjectScan.Hit hit : scan.urls) {
            // Pictures are most of the addresses and say nothing about the video.
            if (hit.text.contains(".mp4") || hit.text.contains(".m4s") || hit.text.contains("video") || MorpheLog.encodeTag(hit.text) != null) {
                MorpheLog.log("probe", "  URL " + hit.path + " " + MorpheLog.url(hit.text));
            }
        }
        for (ObjectScan.Hit hit : scan.manifests) {
            DashManifest manifest = DashManifest.parse(hit.text);
            if (manifest.tracks.isEmpty()) continue;
            MorpheLog.log("probe", "  MANIFEST " + hit.path + " len=" + hit.text.length() + " duration=" + manifest.durationSeconds
                    + "s tracks=" + manifest.tracks.size());
            for (DashManifest.Track track : manifest.tracks) MorpheLog.log("probe", "    " + track);
            MorpheLog.log("probe", "  manifest head: " + hit.text.substring(0, Math.min(hit.text.length(), 300)).replace('\n', ' '));
        }
        for (ObjectScan.Hit hit : scan.jsons) {
            // The keys of the video's settings JSON, to find where an HD file or a quality list is kept.
            java.util.LinkedHashSet<String> keys = new java.util.LinkedHashSet<>();
            java.util.regex.Matcher m = java.util.regex.Pattern.compile("\"([A-Za-z_][A-Za-z0-9_]{2,40})\"\\s*:").matcher(hit.text);
            while (m.find() && keys.size() < 90) keys.add(m.group(1));
            MorpheLog.log("probe", "  JSON " + hit.path + " len=" + hit.text.length() + " keys: " + keys);
            // Short values (flags, numbers, names), to read settings such as is_progressive_hd_url.
            StringBuilder values = new StringBuilder();
            java.util.regex.Matcher vm = java.util.regex.Pattern.compile("\"([A-Za-z_][A-Za-z0-9_]{2,40})\"\\s*:\\s*(true|false|-?\\d+(?:\\.\\d+)?|\"[^\"\\\\]{0,40}\")").matcher(hit.text);
            int shown = 0;
            while (vm.find() && shown++ < 70) values.append(vm.group(1)).append('=').append(vm.group(2)).append(' ');
            if (values.length() > 0) MorpheLog.log("probe", "    values: " + values);
        }
        if (scan.manifests.isEmpty()) MorpheLog.log("probe", "  no DASH manifest reachable from props, command, player or view");
        if (full) {
            for (int i = 0; i < roots.length && i < ObjectScan.ROOT_NAMES.length; i++) {
                if (i == 3) continue;
                ObjectScan.dump("probe", ObjectScan.ROOT_NAMES[i], roots[i], 3, 220);
            }
        }
    }
}
