package app.morphe.extension.youtube.bilibilidanmaku;

import android.util.Xml;


import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.xmlpull.v1.XmlPullParser;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.TreeMap;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/** Bilibili WBI requests, video/episode lookup and Bilibili protobuf/XML decoding. */
final class BilibiliDanmakuSource {
    private static final String API = "https://api.bilibili.com";
    private static final int MAX_RESPONSE_BYTES = 24 * 1024 * 1024;
    static final int MAX_XML_BYTES = 16 * 1024 * 1024;
    private static final int MAX_COMMENTS = 300_000;
    private static final int MAX_SEGMENTS = 720;
    private static final String UA = "Mozilla/5.0 (Linux; Android 14) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Mobile Safari/537.36";
    private static final Pattern BVID = Pattern.compile("(?i)BV[0-9a-z]{10}");
    private static final Pattern AVID = Pattern.compile("(?i)(?:^|/|\\b)av(\\d+)");
    private static final Pattern EPISODE = Pattern.compile("(?i)(?:^|/|\\b)ep(\\d+)");
    private static final Pattern SEASON = Pattern.compile("(?i)(?:^|/|\\b)ss(\\d+)");
    private static final Pattern PAGE = Pattern.compile("[?&]p=(\\d+)");

    /** Search results often use protocol-relative pictures. Never fetch arbitrary hosts. */
    static String normalizeCover(String value) {
        if (value == null || value.isEmpty()) return "";
        String url = value.startsWith("//") ? "https:" + value : value;
        if (url.regionMatches(true, 0, "http://", 0, 7)) url = "https://" + url.substring(7);
        try {
            java.net.URL parsed = new java.net.URL(url);
            String host = parsed.getHost().toLowerCase(Locale.ROOT);
            if ("https".equalsIgnoreCase(parsed.getProtocol())
                    && (host.equals("hdslb.com") || host.endsWith(".hdslb.com"))
                    && (parsed.getPort() == -1 || parsed.getPort() == 443)) return url;
        } catch (Exception ignored) { }
        return "";
    }

    /** Extracts the official link from the text copied with Bilibili's Share button. */
    static String extractReference(String sharedText) throws IOException {
        if (sharedText == null || sharedText.trim().isEmpty()) throw new IOException("B 站链接为空");
        String input = sharedText.trim();
        // Some sharing channels escape URL punctuation repeatedly (e.g. https\\\\://).
        // Limit the passes so malformed input cannot induce unbounded processing.
        for (int i = 0; i < 8; i++) {
            String decoded = input.replace("\\\\", "\\").replace("\\/", "/")
                    .replace("\\.", ".").replace("\\:", ":");
            if (decoded.equals(input)) break;
            input = decoded;
        }
        Matcher url = Pattern.compile("(?i)https?://[^\\s<>\\[\\]\\u300c\\u300d\\u3010\\u3011\\\"“”]+")
                .matcher(input);
        if (url.find()) {
            String extracted = url.group();
            while (!extracted.isEmpty() && ",.，。!！?？;；)）".indexOf(extracted.charAt(extracted.length() - 1)) >= 0) {
                extracted = extracted.substring(0, extracted.length() - 1);
            }
            ensureOfficialUrl(extracted);
            return extracted;
        }
        if (input.contains("://")) throw new IOException("无法识别 B 站官方链接");
        Matcher identifier = Pattern.compile("(?i)^(?:BV[0-9a-z]{10}|av\\d+|ep\\d+|ss\\d+)$")
                .matcher(input);
        if (identifier.matches()) return input;
        throw new IOException("请粘贴 B 站分享文本、官方链接或 BV/av/ep/ss 编号");
    }
    private static final int[] MIXIN_KEY_ENC_TAB = {
        46,47,18,2,53,8,23,32,15,50,10,31,58,3,45,35,27,43,5,49,33,9,42,19,29,28,14,39,
        12,38,41,13,37,48,7,16,24,55,40,61,26,17,0,1,60,51,30,4,22,25,54,21,56,59,6,63,
        57,62,11,36,20,34,44,52
    };

    interface Progress {
        void onProgress(int done, int total);
    }

    static final class VideoSource {
        final String title;
        final String reference;
        final long aid;
        final long cid;
        final int durationSeconds;
        final String cover;

        VideoSource(String title, String reference, long aid, long cid, int durationSeconds) {
            this(title, reference, aid, cid, durationSeconds, "");
        }

        VideoSource(String title, String reference, long aid, long cid, int durationSeconds, String cover) {
            this.title = title;
            this.reference = reference;
            this.aid = aid;
            this.cid = cid;
            this.durationSeconds = durationSeconds;
            this.cover = normalizeCover(cover);
        }
    }

    static final class Candidate {
        final String bvid;
        final String title;
        final int danmakuCount;
        final int durationSeconds;
        final String cover;

        Candidate(String bvid, String title, int danmakuCount, int durationSeconds) {
            this(bvid, title, danmakuCount, durationSeconds, "");
        }

        Candidate(String bvid, String title, int danmakuCount, int durationSeconds, String cover) {
            this.bvid = bvid;
            this.title = title;
            this.danmakuCount = danmakuCount;
            this.durationSeconds = durationSeconds;
            this.cover = normalizeCover(cover);
        }

        @Override public String toString() {
            return title + " · " + danmakuCount + " 弹幕 · " + formatDuration(durationSeconds) + "\n" + bvid;
        }
    }

    static final class Page {
        final int number;
        final String title;

        Page(int number, String title) {
            this.number = number;
            this.title = title;
        }

        @Override public String toString() { return "P" + number + " · " + title; }
    }

    static final class Episode {
        final long id;
        final String title;

        Episode(long id, String title) {
            this.id = id;
            this.title = title;
        }

        @Override public String toString() { return title; }
    }

    private String imageKey;
    private String subKey;
    private long keyExpiry;

    List<Candidate> search(String title) throws Exception {
        if (title == null || title.trim().isEmpty()) throw new IOException("搜索词为空");
        Map<String, String> query = new TreeMap<>();
        query.put("search_type", "video");
        query.put("keyword", title.trim());
        query.put("page", "1");
        query.put("web_location", "1430654");
        JSONObject data = json(API + "/x/web-interface/wbi/search/type?" + sign(query));
        JSONArray results = data.optJSONObject("data") == null ? null : data.getJSONObject("data").optJSONArray("result");
        List<Candidate> candidates = new ArrayList<>();
        if (results == null) return candidates;
        for (int i = 0; i < results.length() && candidates.size() < 25; i++) {
            JSONObject item = results.optJSONObject(i);
            if (item == null) continue;
            String bvid = item.optString("bvid", "");
            if (!BVID.matcher(bvid).matches()) continue;
            String rawTitle = item.optString("title", "");
            String cleaned = rawTitle.replaceAll("<[^>]+>", "").replace("&amp;", "&")
                    .replace("&lt;", "<").replace("&gt;", ">");
            candidates.add(new Candidate(bvid, cleaned, item.optInt("danmaku", 0),
                    parseDuration(item.optString("duration", "")), item.optString("pic", "")));
        }
        return candidates;
    }

    static int parseDuration(String value) {
        try {
            if (value == null || value.trim().isEmpty()) return 0;
            String[] parts = value.trim().split(":", -1);
            if (parts.length == 0 || parts.length > 3) return 0;
            long total = 0;
            for (int i = 0; i < parts.length; i++) {
                long number = Long.parseLong(parts[i]);
                // The leading component may be minutes (90:00) or hours (120:00:00).
                if (number < 0 || (i > 0 && number > 59)) return 0;
                total = total * 60 + number;
                if (total > Integer.MAX_VALUE) return 0;
            }
            return (int) total;
        } catch (NumberFormatException ignored) { return 0; }
    }

    private static String formatDuration(int seconds) {
        if (seconds <= 0) return "时长未知";
        if (seconds >= 3600) return String.format(Locale.ROOT, "%d:%02d:%02d", seconds / 3600,
                seconds / 60 % 60, seconds % 60);
        return String.format(Locale.ROOT, "%d:%02d", seconds / 60, seconds % 60);
    }

    /** Prefer a closely matching title and duration over the search API's popularity ordering. */
    static Candidate bestMatch(List<Candidate> candidates, String title, long durationMs) {
        Candidate best = null;
        double bestScore = 0;
        double runnerUpScore = 0;
        String target = normalizeTitle(title);
        for (Candidate candidate : candidates) {
            String source = normalizeTitle(candidate.title);
            if (source.isEmpty() || target.isEmpty()) continue;
            int overlap = commonSubsequence(target, source);
            double score = 2.0 * overlap / (target.length() + source.length());
            if (target.contains(source) || source.contains(target)) score = Math.max(score, .8);
            if (durationMs > 0 && candidate.durationSeconds > 0) {
                double difference = Math.abs(durationMs / 1000.0 - candidate.durationSeconds);
                double allowed = Math.max(25, durationMs / 1000.0 * .12);
                if (difference > allowed) score *= .58;
                else score += .1;
            }
            if (score > bestScore) {
                runnerUpScore = bestScore;
                best = candidate;
                bestScore = score;
            } else if (score > runnerUpScore) runnerUpScore = score;
        }
        // If two sources look equally likely, let the user pick instead of silently
        // attaching the wrong danmaku stream to this YouTube video.
        return bestScore >= .68 && bestScore - runnerUpScore >= .065 ? best : null;
    }

    private static String normalizeTitle(String title) {
        if (title == null) return "";
        return title.toLowerCase(Locale.ROOT).replaceAll("<[^>]*>", "")
                .replaceAll("[^\\p{IsHan}\\p{L}\\p{N}]", "");
    }

    private static int commonSubsequence(String a, String b) {
        if (a.length() > 180) a = a.substring(0, 180);
        if (b.length() > 180) b = b.substring(0, 180);
        int[] previous = new int[b.length() + 1];
        for (int i = 1; i <= a.length(); i++) {
            int diagonal = 0;
            for (int j = 1; j <= b.length(); j++) {
                int up = previous[j];
                previous[j] = a.charAt(i - 1) == b.charAt(j - 1)
                        ? diagonal + 1 : Math.max(previous[j - 1], up);
                diagonal = up;
            }
        }
        return previous[b.length()];
    }

    List<Page> pages(String reference) throws Exception {
        ensureOfficialUrl(reference);
        JSONArray parts = viewData(reference).optJSONArray("pages");
        List<Page> result = new ArrayList<>();
        if (parts == null) return result;
        for (int i = 0; i < parts.length(); i++) {
            JSONObject part = parts.optJSONObject(i);
            if (part != null) result.add(new Page(i + 1, part.optString("part", "第" + (i + 1) + "P")));
        }
        return result;
    }

    private static String videoKey(String input) throws IOException {
        if (input == null) throw new IOException("请输入 B 站视频链接");
        Matcher bv = BVID.matcher(input);
        if (bv.find()) return "bvid=" + bv.group();
        Matcher av = AVID.matcher(input);
        if (av.find()) return "aid=" + av.group(1);
        throw new IOException("无法识别 B 站视频地址");
    }

    /** A pasted URL must actually point to Bilibili; standalone BV/av/ep/ss IDs are also allowed. */
    static void ensureOfficialUrl(String reference) throws IOException {
        if (reference == null) throw new IOException("B 站链接为空");
        if (!reference.contains("://")) return;
        URL url = new URL(reference);
        String protocol = url.getProtocol();
        String host = url.getHost().toLowerCase(Locale.ROOT);
        if ((!"https".equalsIgnoreCase(protocol) && !"http".equalsIgnoreCase(protocol))
                || (!"bilibili.com".equals(host) && !host.endsWith(".bilibili.com") && !"b23.tv".equals(host))
                || (url.getPort() != -1 && url.getPort() != 443 && url.getPort() != 80)
                || url.getUserInfo() != null) {
            throw new IOException("链接不是 B 站官方域名，请粘贴 bilibili.com 地址或 BV/av/ep/ss 编号");
        }
    }

    static boolean isShortReference(String reference) throws IOException {
        if (reference == null || !reference.contains("://")) return false;
        ensureOfficialUrl(reference);
        return "b23.tv".equalsIgnoreCase(new URL(reference).getHost());
    }

    /** Resolve the official shortener without forwarding account cookies or following foreign redirects. */
    static String expandShortReference(String reference) throws IOException {
        String current = reference;
        for (int i = 0; i < 5; i++) {
            ensureOfficialUrl(current);
            URL url = new URL(current);
            if (!isShortReference(current)) return current;
            // Never transmit a share URL over cleartext, including redirects.
            if (!"https".equalsIgnoreCase(url.getProtocol()) || (url.getPort() != -1 && url.getPort() != 443))
                throw new IOException("B 站短链接必须使用 HTTPS");
            HttpURLConnection connection = (HttpURLConnection) url.openConnection();
            try {
                connection.setConnectTimeout(10000);
                connection.setReadTimeout(10000);
                connection.setInstanceFollowRedirects(false);
                connection.setRequestProperty("User-Agent", UA);
                int status = connection.getResponseCode();
                if (status < 300 || status >= 400) throw new IOException("B 站短链接无法展开（HTTP " + status + "）");
                String location = connection.getHeaderField("Location");
                if (location == null || location.isEmpty()) throw new IOException("B 站短链接缺少跳转地址");
                current = new URL(url, location).toString();
                ensureOfficialUrl(current);
            } finally { connection.disconnect(); }
        }
        throw new IOException("B 站短链接跳转次数过多");
    }

    /** The signed view API avoids HTTP 412 reported by the old unsigned view endpoint. */
    private JSONObject viewData(String reference) throws Exception {
        String key = videoKey(reference);
        int delimiter = key.indexOf('=');
        Map<String, String> params = new TreeMap<>();
        params.put(key.substring(0, delimiter), key.substring(delimiter + 1));
        try {
            return json(API + "/x/web-interface/wbi/view?" + sign(params)).getJSONObject("data");
        } catch (IOException ex) {
            // The old endpoint can still be useful if a network rejects WBI requests.
            if (ex.getMessage() == null || !ex.getMessage().contains("HTTP 412")) throw ex;
            return json(API + "/x/web-interface/view?" + key).getJSONObject("data");
        }
    }

    VideoSource resolve(String reference) throws Exception {
        String input = extractReference(reference);
        if (input.isEmpty()) throw new IOException("请输入 BV、av、ep、ss 或 B 站链接");
        ensureOfficialUrl(input);
        Matcher ep = EPISODE.matcher(input);
        if (ep.find()) return resolveEpisode(Long.parseLong(ep.group(1)));
        if (SEASON.matcher(input).find()) throw new IOException("整季 ss 链接请先选择具体剧集");
        JSONObject data = viewData(input);
        long aid = data.optLong("aid");
        long cid = data.optLong("cid");
        int duration = data.optInt("duration", 0);
        Matcher page = PAGE.matcher(input);
        String title = data.optString("title", "");
        if (page.find()) {
            int p = Integer.parseInt(page.group(1));
            JSONArray pages = data.optJSONArray("pages");
            if (p < 1 || pages == null || p > pages.length()) throw new IOException("分 P 超出范围：" + p);
            JSONObject selected = pages.getJSONObject(p - 1);
            cid = selected.optLong("cid");
            duration = selected.optInt("duration", duration);
            title += " · " + selected.optString("part", "P" + p);
        }
        String cover = data.optString("pic", "");
        if (cover.isEmpty()) cover = data.optString("cover", "");
        return valid(new VideoSource(title, input, aid, cid, duration, cover));
    }

    List<Episode> episodes(String seasonReference) throws Exception {
        ensureOfficialUrl(seasonReference);
        Matcher matcher = SEASON.matcher(seasonReference == null ? "" : seasonReference);
        if (!matcher.find()) throw new IOException("请输入 ss 整季链接");
        JSONObject result = json(API + "/pgc/view/web/season?season_id=" + matcher.group(1)).getJSONObject("result");
        JSONArray eps = result.optJSONArray("episodes");
        if (eps == null || eps.length() == 0) throw new IOException("番剧没有返回剧集列表");
        List<Episode> list = new ArrayList<>();
        for (int i = 0; i < eps.length(); i++) {
            JSONObject ep = eps.optJSONObject(i);
            if (ep != null && ep.optLong("id") > 0) {
                list.add(new Episode(ep.optLong("id"), ep.optString("title", "第" + (i + 1) + "集")
                        + " " + ep.optString("long_title", "")));
            }
        }
        return list;
    }

    VideoSource resolveEpisode(long episodeId) throws Exception {
        JSONObject season = json(API + "/pgc/view/web/season?ep_id=" + episodeId).getJSONObject("result");
        JSONArray eps = season.optJSONArray("episodes");
        if (eps == null) throw new IOException("番剧没有返回剧集信息");
        for (int i = 0; i < eps.length(); i++) {
            JSONObject ep = eps.optJSONObject(i);
            if (ep != null && ep.optLong("id") == episodeId) {
                long durationMs = ep.optLong("duration");
                return valid(new VideoSource(season.optString("title") + " " + ep.optString("title") + " "
                        + ep.optString("long_title"), "ep" + episodeId,
                        ep.optLong("aid"), ep.optLong("cid"), (int) Math.ceil(durationMs / 1000.0),
                        firstCover(ep.optString("cover"), ep.optString("horizontal_cover"),
                                ep.optString("share_copy"), season.optString("cover"),
                                season.optString("horizontal_cover"), season.optString("square_cover"))));
            }
        }
        throw new IOException("未找到 ep" + episodeId + "，可能受地区或账号权限限制");
    }

    private static String firstCover(String... candidates) {
        for (String candidate : candidates) {
            String normalized = normalizeCover(candidate);
            if (!normalized.isEmpty()) return normalized;
        }
        return "";
    }

    static VideoSource valid(VideoSource source) throws IOException {
        if (source.aid <= 0 || source.cid <= 0 || source.durationSeconds <= 0) {
            throw new IOException("B 站未返回有效 AID、CID 或视频时长");
        }
        return source;
    }

    List<DanmakuComment> download(VideoSource source, Progress progress) throws Exception {
        int total = (source.durationSeconds + 359) / 360;
        if (total <= 0 || total > MAX_SEGMENTS) throw new IOException("视频弹幕分段数超出安全范围");
        List<DanmakuComment> result = new ArrayList<>();
        for (int i = 1; i <= total; i++) {
            if (Thread.currentThread().isInterrupted()) throw new InterruptedException("弹幕下载已取消");
            Map<String, String> params = new TreeMap<>();
            params.put("type", "1");
            params.put("oid", Long.toString(source.cid));
            params.put("segment_index", Integer.toString(i));
            params.put("pid", Long.toString(source.aid));
            params.put("web_location", "1315873");
            String url = API + "/x/v2/dm/wbi/web/seg.so?" + sign(params);
            IOException failure = null;
            byte[] bytes = null;
            for (int attempt = 0; attempt < 3; attempt++) {
                try {
                    bytes = fetch(url, MAX_RESPONSE_BYTES);
                    if (bytes.length > 0 && (bytes[0] == '{' || bytes[0] == '<')) {
                        String message = new String(bytes, StandardCharsets.UTF_8);
                        throw new IOException("B 站拒绝弹幕分段请求："
                                + message.substring(0, Math.min(160, message.length())));
                    }
                    break;
                } catch (IOException ex) {
                    failure = ex;
                    if (attempt == 2) break;
                    Thread.sleep(250L * (attempt + 1));
                }
            }
            if (bytes == null) throw new IOException("第 " + i + "/" + total + " 段失败：" + failure.getMessage(), failure);
            result.addAll(parseSegment(bytes));
            if (result.size() > MAX_COMMENTS) throw new IOException("弹幕数量超过安全上限");
            progress.onProgress(i, total);
            // Space requests to avoid triggering Bilibili's segment rate limits.
            if (i < total) Thread.sleep(300);
        }
        Collections.sort(result);
        return result;
    }

    static List<DanmakuComment> parseSegment(byte[] bytes) throws IOException {
        List<DanmakuComment> comments = new ArrayList<>();
        BilibiliProtoInput input = BilibiliProtoInput.newInstance(bytes);
        while (!input.isAtEnd()) {
            int tag = input.readTag();
            if (tag == 0) break;
            if ((tag >>> 3) == 1 && (tag & 7) == 2) {
                BilibiliProtoInput elem = BilibiliProtoInput.newInstance(input.readByteArray());
                long time = -1;
                int mode = 1, color = 0xffffff, fontsize = 25;
                String content = "";
                while (!elem.isAtEnd()) {
                    int fieldTag = elem.readTag();
                    if (fieldTag == 0) break;
                    switch ((fieldTag >>> 3)) {
                        case 2: time = elem.readInt64(); break;
                        case 3: mode = elem.readInt32(); break;
                        case 4: fontsize = elem.readInt32(); break;
                        case 5: color = elem.readInt32(); break;
                        case 7: content = elem.readStringRequireUtf8(); break;
                        default: if (!elem.skipField(fieldTag)) break;
                    }
                }
                if (time >= 0 && !content.trim().isEmpty() && content.length() <= 500) {
                    comments.add(new DanmakuComment(time, mode, color, fontsize, content));
                }
            } else if (!input.skipField(tag)) break;
        }
        return comments;
    }

    static List<DanmakuComment> parseXml(byte[] bytes) throws Exception {
        if (bytes.length > MAX_XML_BYTES) throw new IOException("XML 文件超过 16MB");
        // Do not rely on the device's XML parser to disable all external entities.
        String header = new String(bytes, 0, Math.min(bytes.length, 4096), StandardCharsets.UTF_8)
                .toUpperCase(Locale.ROOT);
        if (header.contains("<!DOCTYPE") || header.contains("<!ENTITY"))
            throw new IOException("不支持包含 DTD 或外部实体的 XML");
        XmlPullParser parser = Xml.newPullParser();
        try { parser.setFeature("http://xmlpull.org/v1/doc/features.html#process-docdecl", false); }
        catch (Exception ignored) { /* The Android parser disables external entities by default. */ }
        parser.setInput(new ByteArrayInputStream(bytes), "UTF-8");
        List<DanmakuComment> comments = new ArrayList<>();
        int event = parser.getEventType();
        while (event != XmlPullParser.END_DOCUMENT) {
            if (event == XmlPullParser.START_TAG && "d".equals(parser.getName())) {
                String attr = parser.getAttributeValue(null, "p");
                String body = parser.nextText();
                if (attr != null && body != null && !body.trim().isEmpty() && body.length() <= 500) {
                    try {
                        String[] properties = attr.split(",");
                        long timeMs = Math.round(Double.parseDouble(properties[0]) * 1000);
                        int mode = Integer.parseInt(properties[1]);
                        int size = Integer.parseInt(properties[2]);
                        int color = Integer.parseInt(properties[3]);
                        if (timeMs >= 0) comments.add(new DanmakuComment(timeMs, mode, color, size, body));
                    } catch (RuntimeException ignored) { /* Skip malformed individual comments. */ }
                }
                if (comments.size() > MAX_COMMENTS) throw new IOException("XML 弹幕数量超过安全上限");
            }
            event = parser.next();
        }
        Collections.sort(comments);
        return comments;
    }

    static byte[] readBounded(InputStream input, int limit) throws IOException {
        try (InputStream stream = input; ByteArrayOutputStream out = new ByteArrayOutputStream()) {
            byte[] buffer = new byte[8192];
            int n;
            while ((n = stream.read(buffer)) != -1) {
                if (out.size() + n > limit) throw new IOException("文件或响应超过大小限制");
                out.write(buffer, 0, n);
            }
            return out.toByteArray();
        }
    }

    private synchronized String sign(Map<String, String> params) throws Exception {
        if (System.currentTimeMillis() >= keyExpiry) {
            // The nav endpoint returns code -101 for visitors but still includes the WBI keys,
            // so signing (and therefore search / video / danmaku requests) never requires a login.
            JSONObject nav = new JSONObject(new String(fetch(API + "/x/web-interface/nav", 3 * 1024 * 1024),
                    StandardCharsets.UTF_8));
            JSONObject data = nav.optJSONObject("data");
            JSONObject image = data == null ? null : data.optJSONObject("wbi_img");
            if (image == null) throw new IOException("B 站接口错误 " + nav.optInt("code", -1) + "：无法获取签名密钥");
            imageKey = keyFromUrl(image.getString("img_url"));
            subKey = keyFromUrl(image.getString("sub_url"));
            keyExpiry = System.currentTimeMillis() + 4L * 60 * 60 * 1000;
        }
        return signParams(params, imageKey, subKey, System.currentTimeMillis() / 1000);
    }

    static String signParams(Map<String, String> parameters, String imgKey, String subKey, long timestamp) throws Exception {
        String combined = imgKey + subKey;
        StringBuilder shuffled = new StringBuilder(64);
        for (int p : MIXIN_KEY_ENC_TAB) {
            if (p < combined.length()) shuffled.append(combined.charAt(p));
        }
        String mixinKey = shuffled.substring(0, Math.min(32, shuffled.length()));
        Map<String, String> params = new TreeMap<>(parameters);
        params.put("wts", Long.toString(timestamp));
        StringBuilder query = new StringBuilder();
        for (Map.Entry<String, String> e : params.entrySet()) {
            if (query.length() > 0) query.append('&');
            query.append(percentEncode(e.getKey())).append('=')
                    .append(percentEncode(e.getValue().replaceAll("[!'()*]", "")));
        }
        return query + "&w_rid=" + md5(query.toString() + mixinKey);
    }

    private static String percentEncode(String value) throws Exception {
        return URLEncoder.encode(value, "UTF-8").replace("+", "%20").replace("%7E", "~");
    }

    private static String keyFromUrl(String url) throws IOException {
        int start = url.lastIndexOf('/');
        int end = url.lastIndexOf('.');
        if (end <= start) throw new IOException("WBI 图片 URL 格式无效");
        return url.substring(start + 1, end);
    }

    private static String md5(String input) throws NoSuchAlgorithmException {
        byte[] bytes = MessageDigest.getInstance("MD5").digest(input.getBytes(StandardCharsets.UTF_8));
        StringBuilder hex = new StringBuilder(32);
        for (byte b : bytes) hex.append(String.format(Locale.ROOT, "%02x", b & 0xff));
        return hex.toString();
    }

    /** Thrown when Bilibili requires a (valid) login for the requested content. */
    static final class LoginRequiredException extends IOException {
        LoginRequiredException(String message) { super(message); }
    }

    private static JSONObject json(String url) throws Exception {
        return json(url, true);
    }

    private static JSONObject json(String url, boolean mayRenew) throws Exception {
        String body = new String(fetch(url, 3 * 1024 * 1024), StandardCharsets.UTF_8);
        JSONObject json = new JSONObject(body);
        if (json.optInt("code", -1) != 0) {
            int code = json.optInt("code", -1);
            if (code == -101) {
                boolean stored = BilibiliDanmakuSession.hasSession();
                // A QR login can renew itself; retry once with the rotated cookies.
                if (mayRenew && stored && BilibiliDanmakuAuth.recoverSignedOut()) return json(url, false);
                throw new LoginRequiredException(stored ? "B 站登录已失效，请重新登录" : "该内容需要登录 B 站账号");
            }
            throw new IOException("B 站接口错误 " + code + "：" + json.optString("message", "未知错误"));
        }
        return json;
    }

    private static byte[] fetch(String url, int sizeLimit) throws IOException {
        if (Thread.currentThread().isInterrupted()) throw new IOException("请求已取消");
        URL endpoint = new URL(url);
        if (!"https".equalsIgnoreCase(endpoint.getProtocol())
                || !"api.bilibili.com".equalsIgnoreCase(endpoint.getHost())) {
            throw new IOException("拒绝向非 B 站官方 HTTPS API 发送请求");
        }
        HttpURLConnection connection = (HttpURLConnection) endpoint.openConnection();
        connection.setConnectTimeout(10_000);
        connection.setReadTimeout(15_000);
        connection.setInstanceFollowRedirects(false);
        connection.setRequestProperty("User-Agent", UA);
        connection.setRequestProperty("Referer", "https://www.bilibili.com/");
        connection.setRequestProperty("Origin", "https://www.bilibili.com");
        connection.setRequestProperty("Accept", "*/*");
        String session = BilibiliDanmakuSession.getCookieHeader();
        if (!session.isEmpty()) connection.setRequestProperty("Cookie", session);
        try {
            int status = connection.getResponseCode();
            if (status != 200) throw new IOException("HTTP " + status + "，可能受到接口风控或地区限制");
            return readBounded(connection.getInputStream(), sizeLimit);
        } finally {
            connection.disconnect();
        }
    }
}
