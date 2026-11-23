package dev.materialtidal.extension.tidal.linn;

import java.io.IOException;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Typed OpenHome SOAP client for Linn DS / DSM ({@code Product:1}, {@code Playlist:1},
 * {@code Volume:1}, and {@code Time:1}).
 */
public final class LinnOpenHomeClient {

    public static final String SERVICE_PRODUCT = "urn:av-openhome-org:service:Product:1";
    public static final String SERVICE_PLAYLIST = "urn:av-openhome-org:service:Playlist:1";
    public static final String SERVICE_VOLUME = "urn:av-openhome-org:service:Volume:1";
    public static final String SERVICE_TIME = "urn:av-openhome-org:service:Time:1";

    private static final Pattern SOURCE_BLOCK_PATTERN =
            Pattern.compile("<Source\\b[^>]*>(.*?)</Source>", Pattern.CASE_INSENSITIVE | Pattern.DOTALL);

    public static final class VolumeCharacteristics {
        public final int volumeMax;
        public final int volumeLimit;
        public final int effectiveMax;

        public VolumeCharacteristics(int volumeMax, int volumeLimit) {
            this.volumeMax = volumeMax > 0 ? volumeMax : 100;
            this.volumeLimit = volumeLimit;
            this.effectiveMax = (volumeLimit > 0 && volumeLimit < this.volumeMax) ? volumeLimit : this.volumeMax;
        }
    }

    public static final class TrackTime {
        public final int trackCount;
        public final int durationSec;
        public final int seconds;

        public TrackTime(int trackCount, int durationSec, int seconds) {
            this.trackCount = Math.max(0, trackCount);
            this.durationSec = Math.max(0, durationSec);
            this.seconds = Math.max(0, seconds);
        }
    }

    private LinnOpenHomeClient() {
    }

    // ---- Service type helpers ----

    private static String productService(LinnDevice dev) {
        return (dev != null && dev.productServiceType != null && !dev.productServiceType.isEmpty())
                ? dev.productServiceType : SERVICE_PRODUCT;
    }

    private static String playlistService(LinnDevice dev) {
        return (dev != null && dev.playlistServiceType != null && !dev.playlistServiceType.isEmpty())
                ? dev.playlistServiceType : SERVICE_PLAYLIST;
    }

    private static String volumeService(LinnDevice dev) {
        return (dev != null && dev.volumeServiceType != null && !dev.volumeServiceType.isEmpty())
                ? dev.volumeServiceType : SERVICE_VOLUME;
    }

    private static String timeService(LinnDevice dev) {
        return (dev != null && dev.timeServiceType != null && !dev.timeServiceType.isEmpty())
                ? dev.timeServiceType : SERVICE_TIME;
    }

    // ---- Product:1..4 ----

    public static String getRoomName(LinnDevice dev) {
        if (dev == null || !dev.supportsProduct()) {
            return null;
        }
        String svc = productService(dev);
        try {
            LinnRawHttpClient.HttpResponse prodResp = LinnRawHttpClient.soapPost(
                    dev.productControlUrl, svc, "Product", "");
            if (prodResp.isSuccessful()) {
                String room = LinnRawHttpClient.extractTagValue(prodResp.body, "Room");
                if (room != null && !room.isEmpty()) {
                    return room;
                }
            }
        } catch (IOException ignored) {
        }
        try {
            LinnRawHttpClient.HttpResponse r = LinnRawHttpClient.soapPost(
                    dev.productControlUrl, svc, "Room", "");
            if (r.isSuccessful()) {
                String value = LinnRawHttpClient.extractTagValue(r.body, "Value");
                if (value != null && !value.isEmpty()) {
                    return value;
                }
                return LinnRawHttpClient.extractTagValue(r.body, "aRoom");
            }
        } catch (IOException ignored) {
        }
        return null;
    }

    public static boolean isStandby(LinnDevice dev) throws IOException {
        LinnRawHttpClient.HttpResponse r = LinnRawHttpClient.soapPost(
                dev.productControlUrl, productService(dev), "Standby", "");
        ensureOk(r, "Product.Standby");
        String val = LinnRawHttpClient.extractTagValue(r.body, "Value");
        return "1".equals(val) || "true".equalsIgnoreCase(val);
    }

    public static void setStandby(LinnDevice dev, boolean standby) throws IOException {
        String body = "<Value>" + (standby ? "1" : "0") + "</Value>";
        LinnRawHttpClient.HttpResponse r = LinnRawHttpClient.soapPost(
                dev.productControlUrl, productService(dev), "SetStandby", body);
        ensureOk(r, "Product.SetStandby");
    }

    public static int getSourceIndex(LinnDevice dev) throws IOException {
        LinnRawHttpClient.HttpResponse r = LinnRawHttpClient.soapPost(
                dev.productControlUrl, productService(dev), "SourceIndex", "");
        ensureOk(r, "Product.SourceIndex");
        return parseIntSafe(LinnRawHttpClient.extractTagValue(r.body, "Value"), -1);
    }

    public static void setSourceIndex(LinnDevice dev, int index) throws IOException {
        String body = "<Value>" + index + "</Value>";
        LinnRawHttpClient.HttpResponse r = LinnRawHttpClient.soapPost(
                dev.productControlUrl, productService(dev), "SetSourceIndex", body);
        ensureOk(r, "Product.SetSourceIndex");
    }

    public static String getSourceXml(LinnDevice dev) throws IOException {
        LinnRawHttpClient.HttpResponse r = LinnRawHttpClient.soapPost(
                dev.productControlUrl, productService(dev), "SourceXml", "");
        ensureOk(r, "Product.SourceXml");
        return LinnRawHttpClient.extractTagValue(r.body, "Value");
    }

    public static int findPlaylistSourceIndex(String sourceListXml) {
        if (sourceListXml == null || sourceListXml.isEmpty()) {
            return -1;
        }
        Matcher m = SOURCE_BLOCK_PATTERN.matcher(sourceListXml);
        int idx = 0;
        int nameFallback = -1;
        while (m.find()) {
            String block = m.group(1);
            String type = LinnRawHttpClient.extractTagValue(block, "Type");
            String name = LinnRawHttpClient.extractTagValue(block, "Name");
            if ("Playlist".equalsIgnoreCase(type)) {
                return idx;
            }
            if (nameFallback < 0 && "Playlist".equalsIgnoreCase(name)) {
                nameFallback = idx;
            }
            idx++;
        }
        return nameFallback;
    }

    /**
     * Wakes the Linn DSM if in standby and selects its OpenHome Playlist source.
     *
     * @return resolved Playlist source index, or {@code -1} if unknown.
     */
    public static int ensureAwakeAndPlaylistSource(LinnDevice dev) throws IOException {
        if (dev == null || !dev.supportsProduct()) {
            return -1;
        }
        String svc = productService(dev);
        if (isStandby(dev)) {
            setStandby(dev, false);
            for (int attempt = 0; attempt < 10; attempt++) {
                sleepQuietly(250);
                try {
                    if (!isStandby(dev)) {
                        break;
                    }
                } catch (IOException ignored) {
                }
            }
        }
        String srcXml = getSourceXml(dev);
        int playlistIdx = findPlaylistSourceIndex(srcXml);
        if (playlistIdx >= 0) {
            int curIdx = getSourceIndex(dev);
            if (curIdx != playlistIdx) {
                setSourceIndex(dev, playlistIdx);
                sleepQuietly(300);
            }
        } else {
            LinnRawHttpClient.HttpResponse fallback = LinnRawHttpClient.soapPost(
                    dev.productControlUrl, svc, "SetSourceIndexByName", "<Value>Playlist</Value>");
            if (fallback.isSuccessful()) {
                sleepQuietly(300);
                playlistIdx = getSourceIndex(dev);
            }
        }
        return playlistIdx;
    }

    private static void sleepQuietly(long millis) {
        try {
            Thread.sleep(millis);
        } catch (InterruptedException ignored) {
            Thread.currentThread().interrupt();
        }
    }

    // ---- Playlist:1 ----

    public static void playlistDeleteAll(LinnDevice dev) throws IOException {
        LinnRawHttpClient.HttpResponse r = LinnRawHttpClient.soapPost(
                dev.playlistControlUrl, playlistService(dev), "DeleteAll", "");
        ensureOk(r, "Playlist.DeleteAll");
    }

    public static int playlistInsert(LinnDevice dev, int afterId, String uri, String didlMetadataXml)
            throws IOException {
        String body = "<AfterId>" + afterId + "</AfterId>"
                + "<Uri>" + LinnRawHttpClient.escapeXml(uri) + "</Uri>"
                + "<Metadata>" + LinnRawHttpClient.escapeXml(didlMetadataXml) + "</Metadata>";
        LinnRawHttpClient.HttpResponse r = LinnRawHttpClient.soapPost(
                dev.playlistControlUrl, playlistService(dev), "Insert", body);
        ensureOk(r, "Playlist.Insert");
        return parseIntSafe(LinnRawHttpClient.extractTagValue(r.body, "NewId"), 0);
    }

    public static void playlistDeleteId(LinnDevice dev, int id) throws IOException {
        if (id <= 0) {
            return;
        }
        LinnRawHttpClient.HttpResponse r = LinnRawHttpClient.soapPost(
                dev.playlistControlUrl, playlistService(dev), "DeleteId", "<Value>" + id + "</Value>");
        ensureOk(r, "Playlist.DeleteId");
    }

    public static void playlistSeekId(LinnDevice dev, int id) throws IOException {
        LinnRawHttpClient.HttpResponse r = LinnRawHttpClient.soapPost(
                dev.playlistControlUrl, playlistService(dev), "SeekId", "<Value>" + id + "</Value>");
        ensureOk(r, "Playlist.SeekId");
    }

    public static void playlistSeekSecondAbsolute(LinnDevice dev, int seconds) throws IOException {
        LinnRawHttpClient.HttpResponse r = LinnRawHttpClient.soapPost(
                dev.playlistControlUrl, playlistService(dev), "SeekSecondAbsolute",
                "<Value>" + Math.max(0, seconds) + "</Value>");
        ensureOk(r, "Playlist.SeekSecondAbsolute");
    }

    public static void playlistPlay(LinnDevice dev) throws IOException {
        ensureOk(LinnRawHttpClient.soapPost(dev.playlistControlUrl, playlistService(dev), "Play", ""),
                "Playlist.Play");
    }

    public static void playlistPause(LinnDevice dev) throws IOException {
        ensureOk(LinnRawHttpClient.soapPost(dev.playlistControlUrl, playlistService(dev), "Pause", ""),
                "Playlist.Pause");
    }

    public static void playlistPauseFast(LinnDevice dev) throws IOException {
        ensureOk(LinnRawHttpClient.soapPost(dev.playlistControlUrl, playlistService(dev), "Pause", "", 800, 1000),
                "Playlist.Pause");
    }

    public static void playlistStop(LinnDevice dev) throws IOException {
        ensureOk(LinnRawHttpClient.soapPost(dev.playlistControlUrl, playlistService(dev), "Stop", ""),
                "Playlist.Stop");
    }

    public static void playlistStopFast(LinnDevice dev) throws IOException {
        ensureOk(LinnRawHttpClient.soapPost(dev.playlistControlUrl, playlistService(dev), "Stop", "", 800, 1000),
                "Playlist.Stop");
    }

    public static String playlistTransportState(LinnDevice dev) throws IOException {
        LinnRawHttpClient.HttpResponse r = LinnRawHttpClient.soapPost(
                dev.playlistControlUrl, playlistService(dev), "TransportState", "");
        ensureOk(r, "Playlist.TransportState");
        String val = LinnRawHttpClient.extractTagValue(r.body, "Value");
        return val != null ? val.trim() : "Stopped";
    }

    public static int playlistId(LinnDevice dev) throws IOException {
        LinnRawHttpClient.HttpResponse r = LinnRawHttpClient.soapPost(
                dev.playlistControlUrl, playlistService(dev), "Id", "");
        ensureOk(r, "Playlist.Id");
        return parseIntSafe(LinnRawHttpClient.extractTagValue(r.body, "Value"), 0);
    }

    // ---- Volume:1..4 ----

    public static VolumeCharacteristics getVolumeCharacteristics(LinnDevice dev) throws IOException {
        String svc = volumeService(dev);
        LinnRawHttpClient.HttpResponse r = LinnRawHttpClient.soapPost(
                dev.volumeControlUrl, svc, "Characteristics", "");
        ensureOk(r, "Volume.Characteristics");
        int max = parseIntSafe(LinnRawHttpClient.extractTagValue(r.body, "VolumeMax"), 100);
        String limitStr = LinnRawHttpClient.extractTagValue(r.body, "VolumeLimit");
        int limit = parseIntSafe(limitStr, -1);
        if (limitStr == null || limitStr.isEmpty() || limit <= 0) {
            try {
                LinnRawHttpClient.HttpResponse limResp = LinnRawHttpClient.soapPost(
                        dev.volumeControlUrl, svc, "VolumeLimit", "");
                if (limResp.isSuccessful()) {
                    int separateLimit = parseIntSafe(
                            LinnRawHttpClient.extractTagValue(limResp.body, "Value"), -1);
                    if (separateLimit > 0) {
                        limit = separateLimit;
                    }
                }
            } catch (IOException ignored) {
            }
        }
        return new VolumeCharacteristics(max, limit > 0 ? limit : max);
    }

    public static int getVolume(LinnDevice dev) throws IOException {
        LinnRawHttpClient.HttpResponse r = LinnRawHttpClient.soapPost(
                dev.volumeControlUrl, volumeService(dev), "Volume", "");
        ensureOk(r, "Volume.Volume");
        return parseIntSafe(LinnRawHttpClient.extractTagValue(r.body, "Value"), 0);
    }

    public static void setVolume(LinnDevice dev, int value) throws IOException {
        LinnRawHttpClient.HttpResponse r = LinnRawHttpClient.soapPost(
                dev.volumeControlUrl, volumeService(dev), "SetVolume", "<Value>" + Math.max(0, value) + "</Value>");
        ensureOk(r, "Volume.SetVolume");
    }

    // ---- Time:1 ----

    public static TrackTime getTime(LinnDevice dev) throws IOException {
        if (!dev.supportsTime()) {
            return new TrackTime(0, 0, 0);
        }
        LinnRawHttpClient.HttpResponse r = LinnRawHttpClient.soapPost(
                dev.timeControlUrl, timeService(dev), "Time", "");
        ensureOk(r, "Time.Time");
        int count = parseIntSafe(LinnRawHttpClient.extractTagValue(r.body, "TrackCount"), 0);
        int duration = parseIntSafe(LinnRawHttpClient.extractTagValue(r.body, "Duration"), 0);
        int seconds = parseIntSafe(LinnRawHttpClient.extractTagValue(r.body, "Seconds"), 0);
        return new TrackTime(count, duration, seconds);
    }

    private static void ensureOk(LinnRawHttpClient.HttpResponse r, String op) throws IOException {
        if (r == null || !r.isSuccessful()) {
            throw new IOException(op + " failed with HTTP " + (r != null ? r.statusCode : 0));
        }
    }

    private static int parseIntSafe(String text, int fallback) {
        if (text == null || text.isEmpty()) {
            return fallback;
        }
        try {
            return Integer.parseInt(text.trim());
        } catch (NumberFormatException e) {
            return fallback;
        }
    }
}
