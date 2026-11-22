package app.template.extension.watch;

import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.PorterDuff;
import android.graphics.PorterDuffXfermode;
import android.graphics.Rect;
import android.net.Uri;
import android.net.Network;
import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;
import android.util.LruCache;
import android.widget.ImageView;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.function.Consumer;
import java.util.regex.Pattern;

import static app.template.extension.watch.WatchAvailability.*;

final class JustWatch implements WatchServicePicker.Catalog {
    private static final String HOST = "https://www.justwatch.com";
    private static final String ENDPOINT = "https://apis.justwatch.com/graphql";
    private static final Pattern TITLE_PATH = Pattern.compile("/[a-z]{2}/[\\p{L}\\p{N}%-]+/[\\p{L}\\p{M}\\p{N}%_~.-]+");
    private static final Pattern ICON = Pattern.compile("/icon/[0-9]+/s100/[a-zA-Z0-9._-]+[.]png");
    private static final String PACKAGE = "packageId clearName icon";
    private static final long OFFER_TTL = 15 * 60_000L;
    private static final long CATALOG_TTL = 60 * 60_000L;
    private static final ExecutorService NETWORK = Executors.newFixedThreadPool(3);
    private static final ExecutorService IMAGES = Executors.newFixedThreadPool(2);
    private static final Handler MAIN = new Handler(Looper.getMainLooper());
    private static final LruCache<String, Cached<Result>> OFFERS = new LruCache<>(48);
    private static final LruCache<String, Cached<List<Service>>> CATALOG = new LruCache<>(12);
    private static final LruCache<String, Bitmap> ICONS = new LruCache<>(100);
    private static Bitmap iconMask;

    private static final class Cached<T> {
        private final long time = SystemClock.elapsedRealtime();
        private final T value;

        Cached(T value) { this.value = value; }

        boolean fresh(long ttl) { return SystemClock.elapsedRealtime() - time < ttl; }
    }

    @Override
    public void load(String region, Consumer<List<Service>> success, Runnable failure) {
        loadCached(CATALOG, region, CATALOG_TTL, () -> catalog(region), success, failure);
    }

    void load(Film film, String region, Consumer<Result> success, Runnable failure) {
        loadCached(OFFERS, region + ":" + film.id(), OFFER_TTL, () -> availability(film, region, null), success, failure);
    }

    private interface Fetch<T> { T get() throws IOException, JSONException; }

    private static <T> void loadCached(LruCache<String, Cached<T>> cache, String key, long ttl,
                                       Fetch<T> fetch, Consumer<T> success, Runnable failure) {
        Cached<T> cached = cache.get(key);
        if (cached != null && cached.fresh(ttl)) {
            success.accept(cached.value);
            return;
        }
        NETWORK.execute(() -> {
            try {
                T value = fetch.get();
                cache.put(key, new Cached<>(value));
                MAIN.post(() -> success.accept(value));
            } catch (IOException | JSONException error) {
                MAIN.post(failure);
            }
        });
    }

    private static List<Service> catalog(String region) throws IOException, JSONException {
        String query = "{ packages(country:" + region + ",platform:WEB){" + PACKAGE + "} }";
        JSONArray packages = query(query, false, null).getJSONArray("packages");
        Map<Integer, Service> unique = new LinkedHashMap<>();
        for (int i = 0; i < packages.length(); i++) {
            Service service = service(packages.optJSONObject(i));
            if (service != null) unique.putIfAbsent(service.id(), service);
        }
        List<Service> services = new ArrayList<>(unique.values());
        services.sort(Comparator.comparing(Service::name, String.CASE_INSENSITIVE_ORDER));
        return services;
    }

    static Result availability(Film film, String region, Network network) throws IOException, JSONException {
        String path = sourcePath(film.justWatch());
        if (path != null) {
            JSONObject node = title(path, region, network);
            JSONObject content = node == null ? null : node.optJSONObject("content");
            if (content != null && match(film, content) > 0) return result(node, path);
        }

        String query = "{ popularTitles(country:" + region + ",first:12,filter:{searchQuery:"
                + JSONObject.quote(film.title()) + "}){edges{node{" + titleFields(region, false) + "}}} }";
        JSONArray edges = query(query, false, network).getJSONObject("popularTitles").getJSONArray("edges");
        String best = null;
        int rank = 0;
        boolean ambiguous = false;
        for (int i = 0; i < edges.length(); i++) {
            JSONObject edge = edges.optJSONObject(i);
            JSONObject node = edge == null ? null : edge.optJSONObject("node");
            JSONObject content = node == null ? null : node.optJSONObject("content");
            if (content == null) continue;
            int score = match(film, content);
            String candidate = titlePath(content.optString("fullPath"));
            if (candidate == null || score == 0) continue;
            if (score > rank) {
                best = candidate;
                rank = score;
                ambiguous = false;
            } else if (score == rank && !candidate.equals(best)) {
                ambiguous = true;
            }
        }
        if (best == null || ambiguous) return new Result(null, List.of());

        JSONObject node = title(best, region, network);
        return node == null ? new Result(null, List.of()) : result(node, best);
    }

    private static int match(Film film, JSONObject content) {
        JSONObject ids = content.optJSONObject("externalIds");
        return film.match(content.optString("title"), content.optInt("originalReleaseYear"),
                id(ids, "imdbId"), id(ids, "tmdbId"));
    }

    private static String id(JSONObject ids, String key) {
        if (ids == null || ids.isNull(key)) return null;
        String value = ids.optString(key);
        return value.isEmpty() ? null : value;
    }

    private static JSONObject title(String path, String region, Network network) throws IOException, JSONException {
        String query = "{ url(fullPath:" + JSONObject.quote(path) + "){node{"
                + titleFields(region, true) + "}} }";
        JSONObject response = query(query, true, network);
        JSONObject url = response == null ? null : response.optJSONObject("url");
        return url == null ? null : url.optJSONObject("node");
    }

    private static String titleFields(String region, boolean offers) {
        String fields = "content(country:" + region + ",language:\"en\"){"
                + "title originalReleaseYear fullPath externalIds{tmdbId imdbId}}";
        if (offers) fields += " offers(country:" + region + ",platform:WEB){"
                + "standardWebURL monetizationType package{" + PACKAGE + "}}";
        return "... on Movie{" + fields + "} ... on Show{" + fields + "}";
    }

    private static Result result(JSONObject node, String path) throws JSONException {
        JSONArray items = node.getJSONArray("offers");
        List<Offer> offers = new ArrayList<>();
        for (int i = 0; i < items.length(); i++) {
            JSONObject item = items.optJSONObject(i);
            if (item == null) continue;
            Service service = service(item.optJSONObject("package"));
            Kind kind = switch (item.optString("monetizationType")) {
                case "FLATRATE" -> Kind.STREAM;
                case "ADS", "FREE" -> Kind.FREE;
                case "RENT" -> Kind.RENT;
                case "BUY" -> Kind.BUY;
                case "CINEMA" -> Kind.CINEMA;
                default -> null;
            };
            String url = item.optString("standardWebURL");
            if (service != null && kind != null && https(url)) offers.add(new Offer(service, kind, url));
        }
        JSONObject content = node.optJSONObject("content");
        String localized = content == null ? null : titlePath(content.optString("fullPath"));
        return new Result(HOST + (localized == null ? path : localized), offers);
    }

    private static Service service(JSONObject item) {
        if (item == null) return null;
        int id = item.optInt("packageId");
        String name = item.optString("clearName").trim();
        if (id <= 0 || name.isEmpty()) return null;
        String icon = item.optString("icon").replace("{profile}", "s100").replace("{format}", "png");
        return new Service(id, name, ICON.matcher(icon).matches() ? "https://images.justwatch.com" + icon : null);
    }

    static String providerTitleUrl(String url) {
        String path = sourcePath(url);
        return path == null ? null : HOST + path;
    }

    private static String sourcePath(String url) {
        if (url == null || !https(url)) return null;
        Uri parsed = Uri.parse(url);
        String host = parsed.getHost();
        if (!"www.justwatch.com".equalsIgnoreCase(host) && !"justwatch.com".equalsIgnoreCase(host)) return null;
        String path = parsed.getEncodedPath();
        if (path != null && path.endsWith("/")) path = path.substring(0, path.length() - 1);
        return titlePath(path);
    }

    private static String titlePath(String path) {
        if (path == null || !TITLE_PATH.matcher(path).matches()) return null;
        String decoded = Uri.decode(path);
        return TITLE_PATH.matcher(decoded).matches() && !decoded.contains("/..") && !decoded.contains("/./")
                && !decoded.endsWith("/.") ? path : null;
    }

    static boolean https(String url) {
        if (url == null) return false;
        Uri parsed = Uri.parse(url);
        return "https".equalsIgnoreCase(parsed.getScheme()) && parsed.getHost() != null
                && parsed.getUserInfo() == null && !parsed.getHost().isEmpty();
    }

    private static JSONObject query(String query, boolean acceptTitleNotFound, Network network)
            throws IOException, JSONException {
        HttpURLConnection connection = connection(ENDPOINT, network);
        try {
            connection.setRequestMethod("POST");
            connection.setDoOutput(true);
            connection.setRequestProperty("Content-Type", "application/json");
            byte[] body = new JSONObject().put("query", query).toString().getBytes(StandardCharsets.UTF_8);
            connection.setFixedLengthStreamingMode(body.length);
            try (var output = connection.getOutputStream()) { output.write(body); }
            try (InputStream input = connection.getInputStream()) {
                byte[] bytes = read(input, 2_000_000);
                JSONObject response = new JSONObject(new String(bytes, StandardCharsets.UTF_8));
                JSONArray errors = response.optJSONArray("errors");
                if (errors != null && errors.length() > 0) {
                    JSONObject error = errors.getJSONObject(0).optJSONObject("extensions");
                    if (acceptTitleNotFound && error != null && "NOT_FOUND".equals(error.optString("code"))) {
                        return null;
                    }
                    throw new IOException("JustWatch query failed");
                }
                return response.getJSONObject("data");
            }
        } finally {
            connection.disconnect();
        }
    }

    static void icon(ImageView view, String url) {
        icon(view, url, () -> {});
    }

    static void icon(ImageView view, String url, Runnable loaded) {
        Object request = new Object();
        view.setTag(request);
        view.setImageDrawable(null);
        if (url == null) return;
        Bitmap cached = ICONS.get(url);
        if (cached != null) {
            view.setImageBitmap(cached);
            loaded.run();
            return;
        }
        if (iconMask == null) {
            int id = WatchViews.resource(view.getContext(), "drawable", "mask_service");
            if (id != 0) iconMask = BitmapFactory.decodeResource(view.getResources(), id);
        }
        Bitmap mask = iconMask;
        IMAGES.execute(() -> {
            try {
                    if (view.getTag() != request) return;
                    HttpURLConnection connection = connection(url, null);
                try (InputStream input = connection.getInputStream()) {
                    byte[] bytes = read(input, 512_000);
                    Bitmap bitmap = masked(BitmapFactory.decodeByteArray(bytes, 0, bytes.length), mask);
                    if (bitmap == null) return;
                    ICONS.put(url, bitmap);
                    MAIN.post(() -> {
                        if (view.getTag() == request) {
                            view.setImageBitmap(bitmap);
                            loaded.run();
                        }
                    });
                } finally {
                    connection.disconnect();
                }
            } catch (IOException ignored) {
                // Provider names and links remain available when artwork fails.
            }
        });
    }

    private static Bitmap masked(Bitmap source, Bitmap mask) {
        if (source == null || mask == null) return source;
        Bitmap bitmap = Bitmap.createBitmap(source.getWidth(), source.getHeight(), Bitmap.Config.ARGB_8888);
        Canvas canvas = new Canvas(bitmap);
        Rect bounds = new Rect(0, 0, bitmap.getWidth(), bitmap.getHeight());
        Paint paint = new Paint(Paint.FILTER_BITMAP_FLAG);
        canvas.drawBitmap(source, null, bounds, paint);
        paint.setXfermode(new PorterDuffXfermode(PorterDuff.Mode.DST_IN));
        canvas.drawBitmap(mask, null, bounds, paint);
        return bitmap;
    }

    private static byte[] read(InputStream input, int limit) throws IOException {
        ByteArrayOutputStream bytes = new ByteArrayOutputStream();
        byte[] buffer = new byte[8192];
        int count;
        while ((count = input.read(buffer)) != -1) {
            if (bytes.size() + count > limit) throw new IOException("JustWatch response too large");
            bytes.write(buffer, 0, count);
        }
        return bytes.toByteArray();
    }

    private static HttpURLConnection connection(String url, Network network) throws IOException {
        URL address = new URL(url);
        HttpURLConnection connection = (HttpURLConnection) (network == null
                ? address.openConnection() : network.openConnection(address));
        connection.setInstanceFollowRedirects(false);
        connection.setConnectTimeout(6000);
        connection.setReadTimeout(8000);
        return connection;
    }
}
