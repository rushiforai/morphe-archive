package app.morphe.extension.chmate;

import android.content.Context;
import android.content.SharedPreferences;
import android.os.Looper;
import android.webkit.CookieManager;
import org.json.JSONObject;
import org.json.JSONArray;
import java.io.*;
import java.lang.reflect.*;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.util.UUID;

/** Uses only the session established in the visible Imgur WebView, never browser cookie extraction. */
public final class ImgurWebUpload {
    private static volatile Context context;
    private static String cachedClientId;
    private static long cachedAt;
    private ImgurWebUpload() {}

    static void init(Context value) {
        context = value.getApplicationContext();
        ImgurUploadHistory.init(context);
    }
    static SharedPreferences prefs(Context c) {
        return c.getSharedPreferences("haiagaru_imgur_web", Context.MODE_PRIVATE);
    }
    static boolean supported(Context c) {
        try {
            // A saved login/preference must not activate the experimental path
            // when the opt-in patch was omitted on a later install.
            try (InputStream marker = c.getAssets().open("haiagaru/imgur-web/installed")) {
                if (marker.read() != '1') return false;
            }
            String version = c.getPackageManager().getPackageInfo(c.getPackageName(), 0).versionName;
            return "0.8.10.191 dev".equals(version) || "0.8.10.226 dev".equals(version)
                    || "0.8.10.241".equals(version) || "0.8.10.242 dev".equals(version);
        } catch (Exception ignored) { return false; }
    }
    public static boolean enabled() {
        Context c = context;
        return c != null && supported(c) && prefs(c).getBoolean("enabled", false);
    }

    /** 241/242 entry; disabled mode executes the original invocation unchanged. */
    public static Object invoke241(Method method, Object receiver, Object[] arguments) throws Throwable {
        return invoke(method, receiver, arguments, "o.defaultzzb");
    }
    public static Object invoke242(Method method, Object receiver, Object[] arguments) throws Throwable {
        return invoke(method, receiver, arguments, "o.zzbtj");
    }
    private static Object invoke(Method method, Object receiver, Object[] arguments, String type) throws Throwable {
        if (MediaUploadHosts.handles(arguments)) return MediaUploadHosts.upload(arguments,
                Class.forName(type, true, ImgurWebUpload.class.getClassLoader()));
        if (enabled()) return upload(arguments, Class.forName(type, true, ImgurWebUpload.class.getClassLoader()));
        try { return method.invoke(receiver, arguments); }
        catch (InvocationTargetException e) { throw e.getCause() == null ? e : e.getCause(); }
    }

    static Object upload(Object[] arguments, Class<?> responseType) throws Exception {
        if (Looper.myLooper() == Looper.getMainLooper()) throw new IOException("Imgurの送信はバックグラウンドで実行してください");
        File file = null;
        if (arguments != null) for (Object argument : arguments) if (argument instanceof File) {
            if (file != null) throw new IOException("Imgurの送信ファイルを特定できません");
            file = (File) argument;
        }
        if (file == null || !file.isFile() || file.length() == 0) throw new IOException("Imgurの送信ファイルがありません");
        // Validate the native response shape before sending any media.
        nativeResponse(responseType, new JSONObject().put("id", "Test")
                .put("deletehash", "TestDeleteHash").put("link", "https://i.imgur.com/Test.png"));
        Session session = session();
        JSONObject account = account(session);
        long accountId = account.optLong("id", 0);
        String accountName = account.optString("url", "");
        if (accountId <= 0 || accountName.isEmpty()) throw loginRequired();

        String mime;
        try (BufferedInputStream input = new BufferedInputStream(new FileInputStream(file))) {
            mime = java.net.URLConnection.guessContentTypeFromStream(input);
            if (mime == null) {
                byte[] header = new byte[12]; int length = input.read(header);
                if (length >= 8 && new String(header, 4, 4, StandardCharsets.US_ASCII).equals("ftyp")) mime = "video/mp4";
                else if (length >= 12 && new String(header, 8, 4, StandardCharsets.US_ASCII).equals("WEBP")) mime = "image/webp";
            }
        }
        if (mime == null || !(mime.startsWith("image/") || mime.equals("video/mp4")))
            throw new IOException("このファイル形式はImgur Web送信に対応していません");
        String extension = mime.equals("video/mp4") ? "mp4" : mime.substring(mime.indexOf('/') + 1);
        String boundary = "Haiagaru" + UUID.randomUUID().toString().replace("-", "");
        byte[] prefix = ("--" + boundary + "\r\nContent-Disposition: form-data; name=\""
                + (mime.startsWith("video/") ? "video" : "image") + "\"; filename=\"upload." + extension
                + "\"\r\nContent-Type: " + mime + "\r\n\r\n").getBytes(StandardCharsets.US_ASCII);
        byte[] suffix = ("\r\n--" + boundary + "--\r\n").getBytes(StandardCharsets.US_ASCII);
        HttpURLConnection connection = open("https://api.imgur.com/3/upload?client_id=" + session.clientId, session);
        connection.setRequestMethod("POST");
        connection.setDoOutput(true);
        connection.setRequestProperty("Content-Type", "multipart/form-data; boundary=" + boundary);
        connection.setFixedLengthStreamingMode(prefix.length + file.length() + suffix.length);
        JSONObject data;
        try {
            // No automatic retries: the server may have accepted a request even after a timeout.
            try (OutputStream output = connection.getOutputStream(); InputStream input = new FileInputStream(file)) {
                output.write(prefix);
                byte[] buffer = new byte[32 * 1024]; int count;
                while ((count = input.read(buffer)) != -1) output.write(buffer, 0, count);
                output.write(suffix);
            }
            data = json(connection).optJSONObject("data");
        } finally { connection.disconnect(); }
        if (data == null) throw new IOException("Imgurの投稿を確認できません。再送せず投稿一覧を確認してください");
        final JSONObject original = data;
        final String imageId = data.optString("id", "");
        if (hasOwner(data)
                && !ImgurWebPolicy.ownedBy(accountId, accountName, data.optLong("account_id", 0), data.optString("account_url", "")))
            throw new IOException("送信結果のアカウントが一致しません。再送せず投稿一覧を確認してください");
        if (!ready(data) && ImgurWebPolicy.imageId(imageId)) {
            data = ImgurProcessingWait.await(data, processingWaitSeconds(), new ImgurProcessingWait.Source<JSONObject>() {
                public boolean ready(JSONObject value) { return ImgurWebUpload.ready(value); }
                public JSONObject fetch(int remainingMillis) throws Exception {
                    HttpURLConnection poll = open("https://api.imgur.com/3/image/" + imageId
                            + "?client_id=" + session.clientId, session);
                    long started = android.os.SystemClock.elapsedRealtime();
                    poll.setConnectTimeout(Math.min(30_000, remainingMillis));
                    poll.setReadTimeout(Math.min(30_000, remainingMillis));
                    try {
                        poll.connect();
                        long left = remainingMillis - (android.os.SystemClock.elapsedRealtime() - started);
                        if (left <= 0) throw new IOException("Imgurの処理待ち時間を超えました。再送せず投稿一覧を確認してください");
                        poll.setReadTimeout((int) Math.min(30_000, left));
                        JSONObject update = json(poll).optJSONObject("data");
                        if (update == null || !imageId.equals(update.optString("id", "")))
                            throw new IOException("Imgurの処理状況を確認できません。再送せず投稿一覧を確認してください");
                        if (hasOwner(update)
                                && !ImgurWebPolicy.ownedBy(accountId, accountName, update.optLong("account_id", 0), update.optString("account_url", "")))
                            throw new IOException("Imgurの処理結果のアカウントが一致しません。再送せず投稿一覧を確認してください");
                        // Keep upload-only deletion metadata, but never keep an outdated processing flag/link.
                        JSONObject merged = new JSONObject(original.toString());
                        merged.remove("processing"); merged.remove("link");
                        java.util.Iterator<String> keys = update.keys();
                        while (keys.hasNext()) {
                            String key = keys.next();
                            if (key.equals("account_id") && update.optLong(key, 0) <= 0) continue;
                            if (key.equals("account_url") && (update.isNull(key) || update.optString(key, "").isEmpty())) continue;
                            if (key.equals("deletehash") && update.isNull(key)) continue;
                            merged.put(key, update.get(key));
                        }
                        return merged;
                    } finally { poll.disconnect(); }
                }
            }, new ImgurProcessingWait.Clock() {
                public long millis() { return android.os.SystemClock.elapsedRealtime(); }
                public void sleep(long millis) throws InterruptedException { Thread.sleep(millis); }
            });
        }
        if (!ImgurWebPolicy.ownedBy(accountId, accountName,
                data.optLong("account_id", 0), data.optString("account_url", "")))
            throw new IOException("送信結果のアカウントを確認できません。再送せずImgurの投稿一覧を確認してください");
        if (!ready(data))
            throw new IOException("Imgurで処理中、またはリンクを取得できません。再送せず投稿一覧を確認してください");
        Object response = nativeResponse(responseType, data);
        ImgurUploadHistory.uploaded(data.getString("link"), accountId);
        return response;
    }

    private static boolean ready(JSONObject data) {
        return !ImgurWebPolicy.processing(data.opt("processing"))
                && ImgurWebPolicy.mediaUrl(data.optString("link", ""));
    }
    private static boolean hasOwner(JSONObject data) {
        return data.optLong("account_id", 0) > 0
                || (!data.isNull("account_url") && !data.optString("account_url", "").isEmpty());
    }
    static int processingWaitSeconds() {
        return context == null ? ImgurProcessingWait.DEFAULT_SECONDS : ImgurProcessingWait.seconds(
                prefs(context).getInt("processingWaitSeconds", ImgurProcessingWait.DEFAULT_SECONDS));
    }

    private static final int POSTING_UPLOADS_MENU_ID = 0x48690041;
    static final String SHOW_UPLOADS_MENU = "showUploadsMenu";

    static boolean uploadsMenuVisible(Context context) {
        return prefs(context).getBoolean(SHOW_UPLOADS_MENU, true);
    }
    private static final java.util.WeakHashMap<android.view.MenuItem, java.lang.ref.WeakReference<android.app.Activity>> POSTING_MENU_ACTIVITIES = new java.util.WeakHashMap<>();

    private static android.app.Activity postingActivity(Object fragment) {
        if (fragment instanceof android.app.Activity) {
            for (Class<?> type = fragment.getClass(); type != null; type = type.getSuperclass()) {
                if ("jp.syoboi.a2chMate.activity.ResEditActivity".equals(type.getName()))
                    return (android.app.Activity) fragment;
            }
            return null;
        }
        try {
            Object activity = fragment.getClass().getMethod("getActivity").invoke(fragment);
            return activity instanceof android.app.Activity ? (android.app.Activity) activity : null;
        } catch (ReflectiveOperationException ignored) { return null; }
    }

    /** Adds to ChMate's existing posting overflow menu without wrapping the editor. */
    public static void addPostingMenu(Object fragment, android.view.Menu menu) {
        android.app.Activity activity = postingActivity(fragment);
        if (activity == null || !supported(activity) || menu == null) return;
        if (!uploadsMenuVisible(activity) || !Haiagaru.isPostingOverflowMenu(activity, menu)) {
            menu.removeItem(POSTING_UPLOADS_MENU_ID);
            return;
        }
        if (menu.findItem(POSTING_UPLOADS_MENU_ID) != null) return;
        android.view.MenuItem item = menu.add(android.view.Menu.NONE, POSTING_UPLOADS_MENU_ID,
                android.view.Menu.NONE, "Imgur投稿一覧");
        POSTING_MENU_ACTIVITIES.put(item, new java.lang.ref.WeakReference<>(activity));
        item.setShowAsAction(android.view.MenuItem.SHOW_AS_ACTION_NEVER);
        item.setOnMenuItemClickListener(selected -> handlePostingMenu(fragment, selected));
    }

    /** ChMate's custom overflow dispatch also calls this; other items remain native. */
    public static boolean handlePostingMenu(Object fragment, android.view.MenuItem item) {
        if (item == null || item.getItemId() != POSTING_UPLOADS_MENU_ID) return false;
        android.app.Activity activity = postingActivity(fragment);
        if (activity == null || activity.isFinishing() || !supported(activity) || !uploadsMenuVisible(activity)) return false;
        activity.startActivity(new android.content.Intent(activity, ImgurUploadsActivity.class));
        return true;
    }

    /** 191's activity-owned overflow consumes all clicks before MenuItem listeners. */
    public static boolean handlePostingActivityMenu(android.view.MenuItem item) {
        if (item == null || item.getItemId() != POSTING_UPLOADS_MENU_ID) return false;
        java.lang.ref.WeakReference<android.app.Activity> reference = POSTING_MENU_ACTIVITIES.get(item);
        android.app.Activity activity = reference == null ? null : reference.get();
        return activity != null && handlePostingMenu(activity, item);
    }

    /** Account-local uploads, including unlisted media. GET only; never uploads/deletes. */
    static JSONArray uploads(int page) throws Exception {
        return uploadPage(page).rows;
    }
    static final class UploadPage {
        final long accountId;
        final JSONArray rows;
        UploadPage(long accountId, JSONArray rows) { this.accountId = accountId; this.rows = rows; }
    }
    static UploadPage uploadPage(int page) throws Exception {
        if (page < 0 || page > 10000) throw new IOException("Imgurのページ番号が不正です");
        Session session = session();
        JSONObject me = account(session);
        long id = me.optLong("id", 0); String name = me.optString("url", "");
        if (id <= 0 || name.isEmpty()) throw loginRequired();
        HttpURLConnection connection = open("https://api.imgur.com/3/account/me/images/" + page
                + "?client_id=" + session.clientId, session);
        try {
            JSONArray rows = json(connection).optJSONArray("data");
            if (rows == null) throw new IOException("Imgurの投稿一覧を取得できません");
            JSONArray result = new JSONArray();
            for (int i = 0; i < rows.length(); i++) {
                JSONObject row = rows.optJSONObject(i);
                if (row == null) continue;
                // The authenticated /me endpoint establishes ownership even if a row omits account fields.
                if (hasOwner(row)
                        && !ImgurWebPolicy.ownedBy(id, name, row.optLong("account_id", 0), row.optString("account_url", ""))) continue;
                result.put(row);
            }
            return new UploadPage(id, result);
        } finally { connection.disconnect(); }
    }

    public interface DeleteCancellation { boolean cancelled(); }
    static final class DeleteResult {
        final int deleted, unconfirmed, notAttempted;
        DeleteResult(int deleted, int unconfirmed, int notAttempted) {
            this.deleted = deleted; this.unconfirmed = unconfirmed; this.notAttempted = notAttempted;
        }
    }

    /** Explicit confirmed selection only. Stop at the first unacknowledged DELETE; never retry. */
    static DeleteResult deleteUploads(UploadPage page, String[] selected, DeleteCancellation cancellation) throws Exception {
        if (Looper.myLooper() == Looper.getMainLooper()) throw new IOException("削除はバックグラウンドで実行してください");
        if (page == null || selected == null || selected.length == 0 || page.accountId <= 0)
            throw new IOException("削除する投稿を選択してください");
        java.util.HashSet<String> visible = new java.util.HashSet<>();
        for (int i = 0; i < page.rows.length(); i++) {
            JSONObject row = page.rows.optJSONObject(i);
            if (row != null && ImgurWebPolicy.imageId(row.optString("id", ""))) visible.add(row.optString("id"));
        }
        java.util.LinkedHashSet<String> ids = new java.util.LinkedHashSet<>();
        for (String id : selected) {
            if (!ImgurWebPolicy.imageId(id) || !visible.contains(id))
                throw new IOException("一覧にない投稿は削除できません。一覧を更新してください");
            ids.add(id);
        }
        if (cancellation.cancelled()) return new DeleteResult(0, 0, ids.size());
        Session session = session();
        if (account(session).optLong("id", 0) != page.accountId)
            throw new IOException("一覧表示時とアカウントが異なります。一覧を更新してください。削除は行っていません");
        int deleted = 0;
        for (String id : ids) {
            if (cancellation.cancelled()) return new DeleteResult(deleted, 0, ids.size() - deleted);
            HttpURLConnection connection = null;
            try {
                connection = open("https://api.imgur.com/3/image/" + id + "?client_id=" + session.clientId, session);
                connection.setConnectTimeout(10_000); connection.setReadTimeout(20_000);
                connection.setRequestMethod("DELETE");
                JSONObject response = json(connection);
                if (!response.optBoolean("success", false) || !Boolean.TRUE.equals(response.opt("data")))
                    throw new IOException("削除完了を確認できません");
                deleted++;
            } catch (Exception error) {
                // Even a timeout may mean the server deleted the item. Do not send it again.
                return new DeleteResult(deleted, 1, ids.size() - deleted - 1);
            } finally { if (connection != null) connection.disconnect(); }
        }
        return new DeleteResult(deleted, 0, 0);
    }

    /** Preserve native link insertion, deletion metadata and the existing selection/resizing UI. */
    static Object nativeResponse(Class<?> type, JSONObject data) throws Exception {
        Object response = type.getDeclaredConstructor().newInstance();
        boolean legacy = type.getName().equals("o.r0ExternalSyntheticLambda13");
        String dataField, successField, statusField;
        switch (type.getName()) {
            case "o.r0ExternalSyntheticLambda13": dataField = "d"; successField = "b"; statusField = "c"; break;
            case "o.Ad": dataField = "d"; successField = "c"; statusField = "b"; break;
            case "o.defaultzzb": dataField = "c"; successField = "e"; statusField = "d"; break;
            case "o.zzbtj": dataField = "a"; successField = "c"; statusField = "e"; break;
            default: throw new IOException("未対応のImgur応答形式です。送信は行いません");
        }
        Field field = type.getField(dataField);
        Class<?> dataType = field.getType();
        Object image;
        if (legacy) {
            image = dataType.getDeclaredConstructor().newInstance();
            dataType.getField("b").set(image, nullable(data, "deletehash"));
            dataType.getField("d").set(image, nullable(data, "link"));
        } else {
            Constructor<?> constructor = dataType.getDeclaredConstructor(String.class, String.class,
                    String.class, String.class, boolean.class, int.class, int.class, int.class,
                    int.class, int.class, String.class, boolean.class, String.class, String.class,
                    String.class, String.class, String.class);
            image = constructor.newInstance(nullable(data,"id"), nullable(data,"title"),
                    nullable(data,"description"), nullable(data,"type"), data.optBoolean("animated"),
                    data.optInt("width"), data.optInt("height"), data.optInt("size"), data.optInt("views"),
                    data.optInt("bandwidth"), nullable(data,"vote"), data.optBoolean("favorite"),
                    nullable(data,"account_url"), nullable(data,"deletehash"), nullable(data,"name"),
                    nullable(data,"link"), nullable(data,"error"));
        }
        field.set(response, image);
        type.getSuperclass().getField(successField).setBoolean(response, true);
        type.getSuperclass().getField(statusField).setInt(response, 200);
        return response;
    }
    private static String nullable(JSONObject object, String name) {
        return object.isNull(name) ? null : object.optString(name, null);
    }

    static String checkAccount() throws Exception {
        JSONObject data = account(session());
        if (data.optLong("id", 0) <= 0 || data.optString("url", "").isEmpty()) throw loginRequired();
        return data.getString("url");
    }
    private static JSONObject account(Session session) throws Exception {
        HttpURLConnection connection = open("https://api.imgur.com/3/account/me?client_id=" + session.clientId, session);
        connection.setConnectTimeout(10_000); connection.setReadTimeout(10_000);
        try {
            JSONObject data = json(connection).optJSONObject("data");
            if (data == null) throw loginRequired();
            return data;
        } finally { connection.disconnect(); }
    }
    private static Session session() throws Exception {
        if (context == null) throw loginRequired();
        String cookie = CookieManager.getInstance().getCookie("https://api.imgur.com/");
        if (cookie == null || cookie.isEmpty()) throw loginRequired();
        String agent = prefs(context).getString("userAgent", "");
        if (agent.isEmpty()) throw loginRequired();
        return new Session(clientId(agent), cookie, agent);
    }
    private static synchronized String clientId(String agent) throws Exception {
        if (cachedClientId != null && android.os.SystemClock.elapsedRealtime() - cachedAt < 3_600_000) return cachedClientId;
        String script = ImgurWebPolicy.scriptUrl(fetchPublic("https://imgur.com/upload", agent, 2 * 1024 * 1024));
        if (script == null) throw new IOException("Imgur Webの仕様変更を検出しました。匿名送信は行いません");
        String id = ImgurWebPolicy.webClientId(fetchPublic(script, agent, 16 * 1024 * 1024));
        if (id == null) throw new IOException("Imgur Webの送信設定を取得できません。匿名送信は行いません");
        cachedClientId = id; cachedAt = android.os.SystemClock.elapsedRealtime(); return id;
    }
    private static String fetchPublic(String url, String agent, int limit) throws Exception {
        HttpURLConnection connection = (HttpURLConnection) new URL(url).openConnection();
        connection.setInstanceFollowRedirects(false);
        connection.setConnectTimeout(20_000); connection.setReadTimeout(30_000);
        connection.setRequestProperty("User-Agent", agent);
        try {
            if (connection.getResponseCode() != 200) throw new IOException("Imgur Web設定の取得に失敗しました");
            return read(connection.getInputStream(), limit);
        } finally { connection.disconnect(); }
    }
    private static HttpURLConnection open(String url, Session session) throws Exception {
        HttpURLConnection connection = (HttpURLConnection) new URL(url).openConnection();
        // Cookie-bearing requests never follow redirects or leave api.imgur.com.
        if (!"api.imgur.com".equals(connection.getURL().getHost())) throw new IOException("Invalid Imgur host");
        connection.setInstanceFollowRedirects(false);
        connection.setConnectTimeout(30_000); connection.setReadTimeout(120_000);
        // Account checks/polling may rotate cookies. Never reuse the initial snapshot,
        // or resurrect a cleared login by falling back to that old value.
        String cookie = CookieManager.getInstance().getCookie(url);
        if (cookie == null || cookie.isEmpty()) throw loginRequired();
        connection.setRequestProperty("Cookie", cookie);
        connection.setRequestProperty("User-Agent", session.agent);
        connection.setRequestProperty("Origin", "https://imgur.com");
        connection.setRequestProperty("Referer", "https://imgur.com/");
        connection.setRequestProperty("Accept", "application/json");
        return connection;
    }
    private static JSONObject json(HttpURLConnection connection) throws Exception {
        int status = connection.getResponseCode();
        receiveSessionCookies(connection);
        if (status == 413) throw MediaUploadHosts.capacityError();
        if (status == 401) throw loginRequired();
        if (status == 403) throw new IOException("Imgurへのアクセスが拒否されました（HTTP 403）。"
                + "一時的なアクセス制限の場合もあり、ログアウトとは限りません。匿名送信は行いません");
        if (status < 200 || status >= 300) throw new IOException("Imgur Web送信エラー HTTP " + status
                + "（再送前に投稿一覧を確認してください）");
        try {
            JSONObject root = new JSONObject(read(connection.getInputStream(), 1024 * 1024));
            if (root.has("success") && !root.optBoolean("success")) throw new IOException("Imgurが処理を拒否しました");
            return root;
        } catch (org.json.JSONException e) { throw new IOException("Imgurの応答を解析できません（投稿一覧を確認してください）"); }
    }
    private static void receiveSessionCookies(HttpURLConnection connection) {
        final CookieManager manager = CookieManager.getInstance();
        ImgurWebPolicy.receiveCookies(connection.getURL().toString(), connection.getHeaderFields(),
                new ImgurWebPolicy.CookieSink() {
                    public void set(String url, String header) { manager.setCookie(url, header); }
                    public void flush() { manager.flush(); }
                });
    }
    private static String read(InputStream stream, int limit) throws IOException {
        try (InputStream input = stream; ByteArrayOutputStream output = new ByteArrayOutputStream()) {
            byte[] buffer = new byte[16 * 1024]; int count;
            while ((count = input.read(buffer)) != -1) {
                if (output.size() > limit - count) throw new IOException("Imgurの応答が大きすぎます");
                output.write(buffer, 0, count);
            }
            return new String(output.toByteArray(), StandardCharsets.UTF_8);
        }
    }
    private static IOException loginRequired() {
        return new IOException("「画像・動画のアップロード先」の「Imgurにログイン」で再認証してください。匿名送信は行いません");
    }
    private static final class Session {
        final String clientId, cookie, agent;
        Session(String id, String cookie, String agent) { this.clientId = id; this.cookie = cookie; this.agent = agent; }
    }
}
