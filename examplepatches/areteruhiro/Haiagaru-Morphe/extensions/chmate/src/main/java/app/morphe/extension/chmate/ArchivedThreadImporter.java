package app.morphe.extension.chmate;

import android.app.Activity;
import android.content.Intent;
import android.net.Uri;
import android.text.Html;
import android.util.Log;
import android.widget.Toast;

import org.json.JSONArray;
import org.json.JSONObject;

import java.io.BufferedInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.nio.charset.Charset;
import java.nio.charset.StandardCharsets;
import java.security.SecureRandom;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Locale;
import java.util.Set;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/** Imports an archived HTML thread into ChMate's own DAT cache. */
final class ArchivedThreadImporter {
    private static final String LOG_TAG = "HaiagaruArchive";
    private static final Charset MS932 = Charset.forName("MS932");
    private static final int MAX_RESPONSE_BYTES = 16 * 1024 * 1024;
    private static final Pattern THREAD_URL = Pattern.compile(
            "^https?://([a-z0-9_-]+)\\.([a-z0-9.-]+)/test/read\\.(?:cgi|php)/"
                    + "([a-zA-Z0-9_-]+)/(\\d{9,10})(?:/.*)?$",
            Pattern.CASE_INSENSITIVE
    );
    private static final Pattern TALK_THREAD_URL = Pattern.compile(
            "^https?://(?:www\\.)?talk\\.jp/boards/"
                    + "([a-zA-Z0-9_-]+)/(\\d{9,10})(?:/.*)?$",
            Pattern.CASE_INSENSITIVE
    );
    private static final Pattern TITLE = Pattern.compile(
            "<h1[^>]*id=[\"']threadtitle[\"'][^>]*>(.*?)</h1>",
            Pattern.CASE_INSENSITIVE | Pattern.DOTALL
    );
    private static final Pattern POST = Pattern.compile(
            "<div[^>]*id=[\"'](\\d+)[\"'][^>]*class=[\"'][^\"']*\\bpost\\b[^\"']*[\"'][^>]*>"
                    + ".*?<span[^>]*class=[\"']postusername[\"'][^>]*><b>"
                    + "(.*?)</b>.*?<span[^>]*class=[\"']date[\"'][^>]*>(.*?)</span>"
                    + "(?:<span[^>]*class=[\"']uid[\"'][^>]*>(.*?)</span>)?.*?"
                    + "</details>\\s*<section[^>]*class=[\"']post-content[\"'][^>]*>"
                    + "(.*?)</section>\\s*</div>",
            Pattern.CASE_INSENSITIVE | Pattern.DOTALL
    );
    private static final Pattern TAG = Pattern.compile("<[^>]+>", Pattern.DOTALL);
    private static final Pattern BREAK = Pattern.compile("(?i)<br\\b[^>]*>");
    private static final Pattern BLOCK_BREAK = Pattern.compile(
            "(?i)</?(?:p|div|li|blockquote|pre|section|article|h[1-6])\\b[^>]*>"
    );
    /* A private-use marker survives Html.fromHtml whitespace normalization. */
    private static final String LINE_BREAK_MARKER = "\uE000";
    private static final Pattern IMAGE = Pattern.compile(
            "(?i)<img[^>]+src=[\"'](?:https?:)?//([^\"']+)[\"'][^>]*>"
    );
    private static final Pattern SCRIPT = Pattern.compile(
            "(?is)<(?:script|style)[^>]*>.*?</(?:script|style)>"
    );
    private static final Set<String> IN_FLIGHT =
            Collections.synchronizedSet(new HashSet<>());
    private static final SecureRandom RANDOM = new SecureRandom();

    private ArchivedThreadImporter() {
    }

    static boolean importIfNeeded(Activity activity, String originalUrl, String browserFallback) {
        ThreadInfo info = ThreadInfo.parse(originalUrl);
        if (info == null) return false;

        File directory = activity.getExternalFilesDir("2chMate/dat");
        if (directory == null) return false;
        File datFile = new File(directory, info.cacheBoardId() + "_" + info.thread + ".dat");
        if (!info.talk && datFile.isFile() && datFile.length() > 0) {
            Log.i(LOG_TAG, "Using existing cached DAT " + datFile.getName()
                    + " (" + datFile.length() + " bytes)");
            // Let ChMate continue normally when the imported DAT is already
            // available. Returning false avoids restarting the Activity and
            // prevents a second retrieval attempt for .io URLs.
            return false;
        }

        String importKey = info.board + ":" + info.thread;
        if (!IN_FLIGHT.add(importKey)) return true;

        new Thread(() -> {
            try {
                if (info.talk) {
                    byte[] dat = fetchTalkDat(info);
                    if (dat == null) {
                        Log.i(LOG_TAG, "Talk thread is live; continuing with ChMate network handling: "
                                + importKey);
                        reopen(activity, originalUrl, null);
                        return;
                    }
                    publishDat(directory, datFile, info, dat);
                    Log.i(LOG_TAG, "Imported " + dat.length + " Talk DAT bytes for " + importKey);
                    reopen(activity, originalUrl, null);
                    return;
                }
                byte[] liveDat = fetchLiveDatIfAvailable(info);
                if (liveDat != null) {
                    Log.i(LOG_TAG, "Live DAT is available; continuing with ChMate network handling: "
                            + importKey);
                    reopen(activity, browserFallback, null);
                    return;
                }
                byte[] dat = fetchArchivedDat(activity, info);
                publishDat(directory, datFile, info, dat);
                Log.i(LOG_TAG, "Imported " + dat.length + " DAT bytes for " + importKey);
                reopen(activity, originalUrl, "過去ログを取得しました");
            } catch (Throwable error) {
                Log.e(LOG_TAG, "Unable to import archived thread " + importKey, error);
                reopen(activity, browserFallback, "過去ログを自動取得できませんでした");
            } finally {
                IN_FLIGHT.remove(importKey);
            }
        }, "Haiagaru-archive-import").start();
        return true;
    }

    static boolean isTalkThreadUrl(String url) {
        return TALK_THREAD_URL.matcher(url == null ? "" : url).matches();
    }

    /** Called by ChMate's background downloader while its native DAT lock is held. */
    static boolean loadLiveTalkDat(String url, File destination) throws IOException {
        if (!isTalkThreadUrl(url)) return false;
        ThreadInfo info = ThreadInfo.parse(url);
        if (info == null || destination == null || destination.getParentFile() == null) {
            throw new IOException("Unable to resolve Talk DAT destination");
        }
        try {
            byte[] dat = fetchTalkDat(info);
            publishDat(destination.getParentFile(), destination, info, dat);
            Log.i(LOG_TAG, "Loaded live Talk DAT: " + info.board + ":" + info.thread
                    + " (" + dat.length + " bytes)");
            return true;
        } catch (IOException error) {
            throw error;
        } catch (Exception error) {
            throw new IOException("Unable to load Talk thread", error);
        }
    }

    private static void publishDat(
            File directory,
            File datFile,
            ThreadInfo info,
            byte[] dat
    ) throws IOException {
        if (!directory.isDirectory() && !directory.mkdirs()) {
            throw new IOException("Unable to create ChMate DAT directory");
        }
        File temporary = new File(directory, datFile.getName() + ".haiagaru.tmp");
        try (FileOutputStream output = new FileOutputStream(temporary, false)) {
            output.write(dat);
            output.getFD().sync();
        }
        if (datFile.exists() && !datFile.delete()) {
            throw new IOException("Unable to replace existing ChMate DAT");
        }
        if (!temporary.renameTo(datFile)) {
            throw new IOException("Unable to publish imported ChMate DAT");
        }
        File index = new File(directory, info.cacheBoardId() + "_" + info.thread + ".idx");
        if (index.exists() && !index.delete()) {
            Log.w(LOG_TAG, "Unable to remove stale index " + index.getName());
        }
    }

    private static void reopen(Activity activity, String url, String message) {
        activity.runOnUiThread(() -> {
            if (message != null && !message.isEmpty()) {
                Toast.makeText(activity, message, Toast.LENGTH_SHORT).show();
            }
            Intent retry = new Intent(activity.getIntent());
            retry.setData(Uri.parse(url));
            retry.putExtra("haiagaru.archive.retry", true);
            activity.startActivity(retry);
            activity.finish();
        });
    }

    /**
     * Current 5ch.io threads must follow ChMate's normal network path. The
     * archive importer is only needed after the live DAT endpoint has failed.
     */
    private static byte[] fetchLiveDatIfAvailable(ThreadInfo info) {
        try {
            String url = "https://" + info.server + ".5ch.io/"
                    + encode(info.board) + "/dat/" + encode(info.thread) + ".dat";
            byte[] response = requestBytes(url);
            return validateDat(response);
        } catch (Throwable ignored) {
            return null;
        }
    }

    private static byte[] fetchTalkDat(ThreadInfo info) throws Exception {
        String url = "https://talk.jp/api/boards/" + encode(info.board)
                + "/threads/" + encode(info.thread);
        String body = new String(requestBytes(url), StandardCharsets.UTF_8);
        return convertTalkJson(info, body);
    }

    private static byte[] fetchArchivedDat(Activity activity, ThreadInfo info) throws Exception {
        List<ArchiveRoute> routes = parseRoutes(Haiagaru.archiveRouteTemplates(activity));
        Throwable firstFailure = null;
        Throwable lastFailure = null;
        for (int index = 0; index < routes.size(); index++) {
            ArchiveRoute route = routes.get(index);
            String url = route.template;
            try {
                url = route.resolve(info);
                byte[] response = requestBytes(url);
                byte[] dat = convertRouteResponse(route.format, info, response);
                Log.i(LOG_TAG, "Archive route " + (index + 1) + " succeeded: " + url);
                return dat;
            } catch (Throwable error) {
                if (firstFailure == null) firstFailure = error;
                lastFailure = error;
                Log.w(LOG_TAG, "Archive route " + (index + 1) + " failed: " + url, error);
            }
        }

        if (lastFailure == null) {
            throw new IOException("No valid archive routes were configured");
        }
        if (firstFailure != null && firstFailure != lastFailure) {
            lastFailure.addSuppressed(firstFailure);
        }
        if (lastFailure instanceof Exception) throw (Exception) lastFailure;
        throw new IOException("All archive routes failed", lastFailure);
    }

    private static List<ArchiveRoute> parseRoutes(String configured) {
        List<ArchiveRoute> routes = parseRouteLines(configured);
        if (!routes.isEmpty()) return routes;
        Log.w(LOG_TAG, "Configured archive routes were invalid; using defaults");
        return parseRouteLines(Haiagaru.archiveRouteTemplates(null));
    }

    private static List<ArchiveRoute> parseRouteLines(String configured) {
        List<ArchiveRoute> routes = new ArrayList<>();
        if (configured == null) return routes;
        for (String rawLine : configured.replace('\r', '\n').split("\\n")) {
            String line = rawLine.trim();
            if (line.isEmpty() || line.startsWith("#")) continue;
            if (line.length() > 2_048 || routes.size() >= 32) {
                Log.w(LOG_TAG, "Skipping oversized or excess archive route");
                continue;
            }

            RouteFormat format = RouteFormat.AUTO;
            String template = line;
            int separator = line.indexOf('|');
            if (separator > 0) {
                RouteFormat parsed = RouteFormat.parse(line.substring(0, separator));
                if (parsed != null) {
                    format = parsed;
                    template = line.substring(separator + 1).trim();
                }
            }
            if (!template.startsWith("https://")
                    || !template.contains("{$bbs}")
                    || !template.contains("{$key}")) {
                Log.w(LOG_TAG, "Skipping invalid archive route template: " + line);
                continue;
            }
            routes.add(new ArchiveRoute(format, template));
        }
        return routes;
    }

    private static byte[] convertRouteResponse(
            RouteFormat format,
            ThreadInfo info,
            byte[] response
    ) throws Exception {
        switch (format) {
            case DAT:
                return validateDat(response);
            case KAKO:
                return convertKakoHtml(info, new String(response, MS932));
            case ITEST:
                return convertItestJson(new String(response, StandardCharsets.UTF_8));
            case AUTO:
            default:
                String utf8 = new String(response, StandardCharsets.UTF_8).trim();
                if (utf8.startsWith("{") && utf8.contains("\"comments\"")) {
                    return convertItestJson(utf8);
                }
                String ms932 = new String(response, MS932);
                if (ms932.toLowerCase(Locale.ROOT).contains("threadtitle")
                        && ms932.toLowerCase(Locale.ROOT).contains("post-content")) {
                    return convertKakoHtml(info, ms932);
                }
                return validateDat(response);
        }
    }

    private static byte[] validateDat(byte[] response) throws IOException {
        if (response == null || response.length < 16) {
            throw new IOException("Archive route returned an empty DAT");
        }
        String sample = new String(
                response,
                0,
                Math.min(response.length, 8 * 1024),
                MS932
        );
        String normalized = sample.trim().toLowerCase(Locale.ROOT);
        if (!sample.contains("<>")
                || normalized.startsWith("<!doctype")
                || normalized.startsWith("<html")) {
            throw new IOException("Archive route did not return DAT content");
        }
        return response;
    }

    private static byte[] convertKakoHtml(ThreadInfo info, String html) throws IOException {
        Matcher titleMatcher = TITLE.matcher(html);
        if (!titleMatcher.find()) throw new IOException("Archive title was not found");
        String title = plainText(titleMatcher.group(1));

        StringBuilder dat = new StringBuilder(Math.max(16 * 1024, html.length() / 2));
        Matcher posts = POST.matcher(html);
        int count = 0;
        while (posts.find()) {
            String name = plainText(posts.group(2));
            String date = plainText(posts.group(3));
            String uid = plainText(posts.group(4));
            String message = datMessage(posts.group(5));
            dat.append(sanitizeField(name)).append("<>")
                    .append("<>")
                    .append(sanitizeField(date));
            if (!uid.isEmpty()) dat.append(' ').append(sanitizeField(uid));
            dat.append("<>").append(message).append("<>");
            if (count == 0) dat.append(sanitizeField(title));
            dat.append('\n');
            count++;
        }
        if (count == 0) throw new IOException("Archive posts were not found");
        Log.i(LOG_TAG, "Converted " + count + " posts from kako for "
                + info.board + ":" + info.thread);
        return dat.toString().getBytes(MS932);
    }

    private static byte[] convertItestJson(String body) throws Exception {
        if (body == null || body.trim().isEmpty()) {
            throw new IOException("itest returned an empty response");
        }
        JSONObject root = new JSONObject(body);
        JSONArray thread = root.getJSONArray("thread");
        JSONArray comments = root.getJSONArray("comments");
        String title = thread.optString(5, "");
        StringBuilder dat = new StringBuilder(comments.length() * 128);
        for (int index = 0; index < comments.length(); index++) {
            JSONArray comment = comments.getJSONArray(index);
            dat.append(sanitizeField(comment.optString(1, ""))).append("<>")
                    .append(sanitizeField(comment.optString(2, ""))).append("<>")
                    .append(sanitizeField(comment.optString(3, "")));
            String uid = comment.optString(4, "");
            if (!uid.isEmpty()) dat.append(uid.contains("ID:") ? " " : " ID:").append(uid);
            String be = comment.optString(5, "");
            if (!be.isEmpty()) dat.append(" BE:").append(be);
            dat.append("<>").append(datMessage(comment.optString(6, ""))).append("<>");
            if (index == 0) dat.append(sanitizeField(title));
            dat.append('\n');
        }
        if (comments.length() == 0) throw new IOException("itest returned no posts");
        return dat.toString().getBytes(MS932);
    }

    private static byte[] convertTalkJson(ThreadInfo info, String body) throws Exception {
        if (body == null || body.trim().isEmpty()) {
            throw new IOException("Talk returned an empty response");
        }
        JSONObject root = new JSONObject(body);
        JSONObject data = root.optJSONObject("data");
        if (data == null) throw new IOException("Talk response did not contain thread data");
        JSONArray comments = data.optJSONArray("comments");
        if (comments == null || comments.length() == 0) {
            throw new IOException("Talk returned no posts");
        }

        String title = data.optString("title", "");
        SimpleDateFormat dateFormat = new SimpleDateFormat(
                "yyyy/MM/dd(E) HH:mm:ss.SSS",
                Locale.JAPAN
        );
        StringBuilder dat = new StringBuilder(comments.length() * 160);
        for (int index = 0; index < comments.length(); index++) {
            JSONObject comment = comments.getJSONObject(index);
            JSONObject writer = comment.optJSONObject("writer");
            String name = writer == null ? "" : writer.optString("name", "");
            if (name.isEmpty()) name = "名無しさん";
            String trip = writer == null ? "" : writer.optString("trip", "");
            if (!trip.isEmpty() && !"null".equalsIgnoreCase(trip)) {
                name += " ◆" + trip;
            }
            String slip = writer == null ? "" : writer.optString("slip", "");
            if (!slip.isEmpty() && !"null".equalsIgnoreCase(slip)) {
                name += " (" + slip + ")";
            }

            long timestamp = comment.optLong("timestamp", 0L);
            String date = timestamp > 0L
                    ? dateFormat.format(new Date(timestamp * 1_000L))
                    : "";
            String id = writer == null ? "" : writer.optString("id", "");
            if (!id.isEmpty() && !"null".equalsIgnoreCase(id)) {
                date += " ID:" + id;
            }

            dat.append(sanitizeField(name)).append("<>")
                    .append("<>")
                    .append(sanitizeField(date)).append("<>")
                    .append(datMessage(comment.optString("body", ""))).append("<>");
            if (index == 0) dat.append(sanitizeField(title));
            dat.append('\n');
        }
        Log.i(LOG_TAG, "Converted " + comments.length() + " Talk posts for "
                + info.board + ":" + info.thread);
        return dat.toString().getBytes(MS932);
    }

    private static String request(String url, Charset charset) throws IOException {
        return new String(requestBytes(url), charset);
    }

    private static byte[] requestBytes(String url) throws IOException {
        HttpURLConnection connection = (HttpURLConnection) new URL(url).openConnection();
        connection.setConnectTimeout(6_000);
        connection.setReadTimeout(15_000);
        connection.setInstanceFollowRedirects(true);
        connection.setRequestProperty("User-Agent", "Mozilla/5.0 Haiagaru");
        try {
            int code = connection.getResponseCode();
            if (code < 200 || code >= 300) {
                throw new IOException("HTTP " + code + " from " + url);
            }
            try (BufferedInputStream input = new BufferedInputStream(connection.getInputStream());
                 ByteArrayOutputStream output = new ByteArrayOutputStream()) {
                byte[] buffer = new byte[16 * 1024];
                int total = 0;
                int count;
                while ((count = input.read(buffer)) != -1) {
                    total += count;
                    if (total > MAX_RESPONSE_BYTES) {
                        throw new IOException("Archive response was too large");
                    }
                    output.write(buffer, 0, count);
                }
                return output.toByteArray();
            }
        } finally {
            connection.disconnect();
        }
    }

    private static String datMessage(String html) {
        String value = SCRIPT.matcher(html).replaceAll("");
        value = IMAGE.matcher(value).replaceAll("sssp://$1");
        value = BREAK.matcher(value).replaceAll(LINE_BREAK_MARKER);
        value = plainText(value);
        return value.replace("\r\n", "\n")
                .replace('\r', '\n')
                .replace("\n", "<br>")
                .trim();
    }

    @SuppressWarnings("deprecation")
    private static String plainText(String html) {
        if (html == null || html.isEmpty()) return "";
        String protectedHtml = html.replace("\r\n", "\n").replace('\r', '\n')
                .replace("\n", LINE_BREAK_MARKER);
        protectedHtml = BLOCK_BREAK.matcher(protectedHtml).replaceAll(LINE_BREAK_MARKER);
        protectedHtml = TAG.matcher(protectedHtml).replaceAll("");
        String value = Html.fromHtml(protectedHtml).toString()
                .replace(LINE_BREAK_MARKER, "\n");
        // HTML parsers may add a terminal line break for block elements. Keep
        // intentional interior breaks while removing only surrounding padding.
        return trimText(value);
    }

    private static String trimText(String value) {
        if (value == null || value.isEmpty()) return "";
        int start = 0;
        int end = value.length();
        while (start < end && Character.isWhitespace(value.charAt(start))) start++;
        while (end > start && Character.isWhitespace(value.charAt(end - 1))) end--;
        return value.substring(start, end);
    }

    private static String sanitizeField(String value) {
        return value == null ? "" : value.replace("<>", "＜＞")
                .replace('\r', ' ')
                .replace('\n', ' ')
                .trim();
    }

    private static String encode(String value) throws IOException {
        return URLEncoder.encode(value, "UTF-8");
    }

    private static String randomToken() {
        final char[] alphabet =
                "ABCDEFGHJKLMNPQRSTUVWXYZabcdefghijkmnopqrstuvwxyz0123456789".toCharArray();
        StringBuilder token = new StringBuilder(10);
        for (int index = 0; index < 10; index++) {
            token.append(alphabet[RANDOM.nextInt(alphabet.length)]);
        }
        return token.toString();
    }

    private enum RouteFormat {
        AUTO,
        DAT,
        KAKO,
        ITEST;

        static RouteFormat parse(String value) {
            if (value == null) return null;
            try {
                return valueOf(value.trim().toUpperCase(Locale.ROOT));
            } catch (IllegalArgumentException ignored) {
                return null;
            }
        }
    }

    private static final class ArchiveRoute {
        final RouteFormat format;
        final String template;

        ArchiveRoute(RouteFormat format, String template) {
            this.format = format;
            this.template = template;
        }

        String resolve(ThreadInfo info) throws IOException {
            return template
                    .replace("{$server}", encode(info.server))
                    .replace("{$bbs}", encode(info.board))
                    .replace("{$key}", encode(info.thread))
                    .replace("{$rand}", randomToken());
        }
    }

    private static final class ThreadInfo {
        final String server;
        final String board;
        final String thread;
        final boolean talk;

        ThreadInfo(String server, String board, String thread, boolean talk) {
            this.server = server;
            this.board = board;
            this.thread = thread;
            this.talk = talk;
        }

        static ThreadInfo parse(String url) {
            Matcher matcher = THREAD_URL.matcher(url == null ? "" : url);
            if (matcher.matches()) {
                return new ThreadInfo(matcher.group(1), matcher.group(3), matcher.group(4), false);
            }
            matcher = TALK_THREAD_URL.matcher(url == null ? "" : url);
            if (!matcher.matches()) return null;
            return new ThreadInfo("talk", matcher.group(1), matcher.group(2), true);
        }

        String cacheBoardId() {
            // BBSUrlInfo.BoardID.toString() percent-encodes the separator.
            // Talk threads therefore use "talk.jp%2F<board>" as the DAT stem.
            return talk ? "talk.jp%2F" + board : board;
        }
    }
}
