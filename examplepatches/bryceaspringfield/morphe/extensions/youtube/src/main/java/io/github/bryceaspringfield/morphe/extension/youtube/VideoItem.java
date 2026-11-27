package io.github.bryceaspringfield.morphe.extension.youtube;

import java.nio.charset.StandardCharsets;
import java.util.Locale;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import app.morphe.extension.shared.patches.components.BufferPhraseFilter;

final class VideoItem {

    private static final Pattern CHANNEL_ID = Pattern.compile("(?<![\\w-])(UC[\\w-]{22})(?![\\w-])");
    private static final Pattern HANDLE = Pattern.compile("/@([\\w.\\-]{3,30}?)(?=[^\\w.\\-]|.?https?://|$)");
    static final Pattern PAST_STREAM = Pattern.compile("(?:^|[\\s•·])(?:streamed|emitido|transmitido|se emitió|se transmitió)"
            + "\\s+(?:\\d|hace|live|en directo|en vivo|el\\s)");
    private static final Pattern LIVE_ICON = Pattern.compile("yt_(?:outline|fill)_[a-z_]*?live_(?:black|white)_\\d+");
    private static final Pattern FEEDBACK_TOKEN = Pattern.compile("AB9zfp[A-Za-z0-9_-]{60,}");
    private static final Pattern DURATION = Pattern.compile("(?<![\\d:])(?:(\\d{1,2}):)?(\\d{1,2}):(\\d{2})(?![\\d:])");
    private static final String[] GO_TO_CHANNEL = {"Go to channel ", "Ir al canal ", "Aller sur la chaîne ",
            "Zum Kanal ", "Vai al canale ", "Ir para o canal "};

    final String videoId;
    final String feedbackToken;
    final String channelId;
    final String handle;
    final String channelName;
    final int seconds;
    final String root;
    final boolean live;
    final boolean playlist;
    final boolean mix;
    final boolean shorts;
    private static final Pattern PLAYLIST_ID = Pattern.compile(
            "(?<![A-Za-z0-9_-])VL(?!RD)[A-Za-z0-9_-]{12,}|[?&]list=(?!RD)[A-Za-z0-9_-]{12,}");
    final String text;

    private VideoItem(String videoId, String feedbackToken, String channelId, String handle,
                      String channelName, int seconds, String root, boolean live, boolean playlist, boolean mix,
                      boolean shorts, String text) {
        this.videoId = videoId;
        this.feedbackToken = feedbackToken;
        this.channelId = channelId;
        this.handle = handle;
        this.channelName = channelName;
        this.seconds = seconds;
        this.root = root;
        this.live = live;
        this.playlist = playlist;
        this.mix = mix;
        this.shorts = shorts;
        this.text = text;
    }

    static float progress(byte[] buffer) {
        if (buffer == null) return -1;
        for (int i = 0; i + 8 < buffer.length; i++) {
            if (buffer[i] == (byte) 0xB2 && buffer[i + 1] == 0x4C && (buffer[i + 2] & 0xFF) >= 5 && (buffer[i + 2] & 0xFF) <= 12
                    && buffer[i + 3] == 0x0D) {
                int bits = (buffer[i + 4] & 0xFF) | (buffer[i + 5] & 0xFF) << 8 | (buffer[i + 6] & 0xFF) << 16
                        | (buffer[i + 7] & 0xFF) << 24;
                float f = Float.intBitsToFloat(bits);
                if (f >= 0f && f <= 1.0001f) return f;
            }
        }
        return -1;
    }

    private static final Pattern VIEWS_PART = Pattern.compile("(?i)^[\\d.,]+\\s*\\S*\\s*(views|view|visualizaciones|vistas|reproducciones)\\b.*");

    static String cleanName(String name) {
        if (name == null || !name.contains(" - ")) return name;
        String[] parts = name.split(" - ");
        for (int i = 1; i < parts.length; i++) {
            if (VIEWS_PART.matcher(parts[i].trim()).matches()) return parts[i - 1].trim();
        }
        return name;
    }

    static VideoItem parse(byte[] buffer, CharSequence path) {
        String text = new String(buffer, StandardCharsets.UTF_8);
        String videoId = null;
        try {
            videoId = BufferPhraseFilter.extractVideoIdFromBuffer(buffer);
        } catch (Throwable ignored) {
        }
        Matcher m = CHANNEL_ID.matcher(text);
        String channelId = m.find() ? m.group(1) : null;
        m = HANDLE.matcher(text);
        String handle = m.find() ? m.group(1).toLowerCase(Locale.ROOT) : null;
        String name = null;
        for (String prefix : GO_TO_CHANNEL) {
            int i = text.indexOf(prefix);
            if (i >= 0) {
                int start = i + prefix.length();
                int end = start;
                while (end < text.length() && text.charAt(end) >= ' ' && text.charAt(end) != '\uFFFD' && end - start < 100) end++;
                name = cleanName(text.substring(start, end).trim());
                break;
            }
        }
        int seconds = -1;
        m = DURATION.matcher(text);
        while (m.find()) {
            int h = m.group(1) == null ? 0 : Integer.parseInt(m.group(1));
            int min = Integer.parseInt(m.group(2));
            int s = Integer.parseInt(m.group(3));
            if (s < 60 && (h == 0 || min < 60)) {
                seconds = h * 3600 + min * 60 + s;
                break;
            }
        }
        String p = path.toString();
        boolean shorts = p.startsWith("shorts") || p.startsWith("inline_shorts") || p.contains("shorts_lockup");
        boolean live = LIVE_ICON.matcher(text).find() || text.contains("BADGE_STYLE_TYPE_LIVE_NOW");
        boolean playlist = text.contains("list=PL") || text.contains("VLPL") || text.contains("list=OLAK5uy")
                || text.contains("VLOLAK5uy") || Metadata.isCourse(text) || Metadata.isPlaylistLabel(text) || PLAYLIST_ID.matcher(text).find();
        boolean mix = !playlist && ((text.contains("youtube.com/playlist?list=RD") && !text.contains("youtube.com/watch?v="))
                || (p.startsWith("lockup.") && text.contains("VLRD")));
        if (live || playlist || mix) seconds = -1;
        Matcher fm = FEEDBACK_TOKEN.matcher(text);
        String token = null;
        if (fm.find()) {
            token = fm.group();
            token = token.substring(0, token.length() - token.length() % 4);
        }
        String[] parts = p.split("\\|");
        String root = parts.length > 1 ? parts[0] + "|" + parts[1] : p;
        return new VideoItem(videoId, token, channelId, handle, name, seconds, root, live, playlist, mix, shorts,
                withoutQuery(readable(text), text));
    }

    private static String withoutQuery(String readable, String text) {
        int at = text.indexOf("searchR");
        if (at < 0) return readable;
        int i = at + "searchR".length();
        while (i < text.length() && (text.charAt(i) < ' ' || text.charAt(i) == '\uFFFD')) i++;
        int end = i;
        while (end < text.length() && text.charAt(end) >= ' ' && text.charAt(end) != '\uFFFD') end++;
        String query = text.substring(i, end).trim().toLowerCase(Locale.ROOT);
        if (query.length() < 2) return readable;
        StringBuilder out = new StringBuilder();
        for (String line : readable.split("\n")) if (!line.equals(query)) out.append(line).append('\n');
        return out.toString();
    }

    private static String readable(String text) {
        StringBuilder out = new StringBuilder();
        forEachRun(text, run -> {
            String r = run.trim();
            if (r.indexOf(' ') > 0 && !r.contains("://") && !r.startsWith("yt_")) out.append(r.toLowerCase(Locale.ROOT)).append('\n');
        });
        return out.toString();
    }

    private static void forEachRun(String text, java.util.function.Consumer<String> each) {
        int start = 0;
        for (int i = 0; i <= text.length(); i++) {
            char ch = i < text.length() ? text.charAt(i) : '\u0000';
            if (ch < ' ' || ch == '\uFFFD') {
                if (i - start >= 4) each.accept(text.substring(start, i));
                start = i + 1;
            }
        }
    }

    boolean isChannel(ChannelRules.Channel c) {
        if (c.id != null && (c.id.equals(channelId) || (handle != null && handle.equals(Channels.handleOf(c.id))))) return true;
        if (c.handle != null && (c.handle.equals(handle) || (channelId != null && channelId.equals(Channels.idOf(c.handle))))) return true;
        if (c.name == null) return false;
        if (channelName != null && c.name.equalsIgnoreCase(channelName)) return true;
        return channelId != null && channelId.equals(Channels.idOfName(c.name));
    }

    @Override
    public String toString() {
        return "video=" + videoId + " channel=" + channelId + " @" + handle + " name=" + channelName
                + " seconds=" + seconds + (live ? " live" : "") + (playlist ? " playlist" : "")
                + (mix ? " mix" : "") + (shorts ? " shorts" : "");
    }

    static String runs(byte[] buffer, int max) {
        StringBuilder out = new StringBuilder();
        forEachRun(new String(buffer, StandardCharsets.UTF_8), run -> {
            if (out.length() < max) out.append(run).append(" | ");
        });
        return out.length() > max ? out.substring(0, max) : out.toString();
    }
}
