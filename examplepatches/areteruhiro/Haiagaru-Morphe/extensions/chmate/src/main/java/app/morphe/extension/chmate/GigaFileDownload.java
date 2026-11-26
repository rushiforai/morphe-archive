package app.morphe.extension.chmate;

import android.app.Activity;
import android.content.ContentValues;
import android.net.Uri;
import android.os.Build;
import android.os.Environment;
import android.provider.MediaStore;
import android.widget.Button;
import android.widget.EditText;
import android.widget.LinearLayout;
import android.widget.TextView;
import android.webkit.URLUtil;
import org.json.JSONObject;
import org.jsoup.Jsoup;

import java.io.*;
import java.net.HttpURLConnection;
import java.net.URI;
import java.net.URLDecoder;
import java.nio.charset.StandardCharsets;
import java.util.UUID;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

final class GigaFileDownload {
    private static final Pattern BUTTON = Pattern.compile("download\\(\\s*(?:\\d+\\s*,\\s*)?['\"]([A-Za-z0-9_-]+)['\"]\\s*,\\s*(true|false)(?:\\s*,\\s*(?:true|false)){0,2}\\s*\\)\\s*;?");
    private static final String UA = "Mozilla/5.0 (Linux; Android " + Build.VERSION.RELEASE
            + ") AppleWebKit/537.36 Chrome/125.0.0.0 Mobile Safari/537.36";

    private final Activity activity;
    private final Uri page;
    private final SiteSessionCookies cookies = new SiteSessionCookies();
    private final TextView status;
    private final Button browser;
    private volatile String originalFilename = "";

    GigaFileDownload(Activity activity, LinearLayout root, String address, Runnable openBrowser) {
        this.activity = activity;
        page = Uri.parse(address);
        status = new TextView(activity);
        status.setText("ギガファイル便の共有リンクを確認しています…");
        root.addView(status);
        browser = new Button(activity);
        browser.setText("アプリ内ブラウザで開く");
        browser.setVisibility(android.view.View.GONE);
        browser.setOnClickListener(v -> openBrowser.run());
        root.addView(browser);
        new Thread(this::resolve, "Haiagaru-GigaFile-resolve").start();
    }

    static Boolean protectedFile(String html, String token) {
        for (org.jsoup.nodes.Element button : Jsoup.parse(html).select("button[onclick]")) {
            Matcher action = BUTTON.matcher(button.attr("onclick"));
            if (action.matches() && token.equals(action.group(1))) return Boolean.valueOf(action.group(2));
        }
        return null;
    }

    static String firstFileToken(String html) {
        for (org.jsoup.nodes.Element button : Jsoup.parse(html).select("button[onclick]")) {
            Matcher action = BUTTON.matcher(button.attr("onclick"));
            if (action.matches()) return action.group(1);
        }
        return "";
    }

    private void resolve() {
        try {
            String shareToken = page.getPathSegments().get(0);
            String html = text(page,1024*1024);
            org.jsoup.nodes.Element filename = Jsoup.parse(html).selectFirst("#dl");
            if (filename != null) originalFilename = filename.text().trim();
            String parsedToken = firstFileToken(html);
            final String token = parsedToken.isEmpty() ? shareToken : parsedToken;
            String resolvedName = fetchFilename(page.toString(),token);
            if (!resolvedName.isEmpty()) originalFilename = resolvedName;
            Boolean locked = protectedFile(html,token);
            if (locked == null) throw new IOException("Unsupported download page");
            if (locked) show(() -> askPassword(token));
            else save(token,"");
        } catch (Exception failure) {
            failed("直接取得できませんでした。アプリ内ブラウザで開いてください。");
        }
    }

    static String fetchFilename(String pageUrl,String token) throws IOException {
        if (!MediaUploadWebPolicy.gigaShare(pageUrl) || token == null
                || !token.matches("[A-Za-z0-9_-]{1,120}")) return "";
        Uri page = Uri.parse(pageUrl);
        Uri endpoint = new Uri.Builder().scheme("https").authority(page.getHost())
                .appendPath("get_uploaded_file_name_jx.php").appendQueryParameter("file",token).build();
        HttpURLConnection connection = (HttpURLConnection) URI.create(endpoint.toString()).toURL().openConnection();
        connection.setInstanceFollowRedirects(false);
        connection.setConnectTimeout(10000);
        connection.setReadTimeout(10000);
        connection.setRequestProperty("User-Agent",UA);
        connection.setRequestProperty("Referer",pageUrl);
        connection.setRequestProperty("X-Requested-With","XMLHttpRequest");
        try {
            if (connection.getResponseCode() != 200) return "";
            try (InputStream in = connection.getInputStream(); ByteArrayOutputStream out = new ByteArrayOutputStream()) {
                byte[] bytes = new byte[4096];
                for (int n; (n=in.read(bytes)) != -1;) {
                    if (out.size()+n > 65536) throw new IOException("Filename response exceeds limit");
                    out.write(bytes,0,n);
                }
                return safeFilename(new JSONObject(out.toString(StandardCharsets.UTF_8.name())).optString("filename",""));
            } catch (org.json.JSONException malformed) { return ""; }
        } finally { connection.disconnect(); }
    }

    private void askPassword(String token) {
        EditText input = new EditText(activity);
        input.setSingleLine(true);
        input.setInputType(android.text.InputType.TYPE_CLASS_TEXT | android.text.InputType.TYPE_TEXT_VARIATION_PASSWORD);
        input.setFilters(new android.text.InputFilter[]{new android.text.InputFilter.LengthFilter(4)});
        new HaiagaruDialog.Builder(activity).setTitle("ダウンロードキー")
                .setMessage("ギガファイル便で設定されたキーを入力してください。")
                .setView(input)
                .setNegativeButton("キャンセル",(dialog,which) -> failed("ダウンロードを取り消しました。"))
                .setPositiveButton("ダウンロード",(dialog,which) -> {
                    String key = input.getText().toString();
                    if (!key.matches("[A-Za-z0-9]{1,4}")) {
                        failed("ダウンロードキーを確認してください。");
                        return;
                    }
                    status.setText("ダウンロードキーを確認しています…");
                    new Thread(() -> {
                        try {
                            JSONObject answer = new JSONObject(text(action("check_dlkey.php", token, key)
                                    .buildUpon().appendQueryParameter("is_zip","0").build(),65536));
                            if (answer.optInt("status",-1) == 0) save(token,key);
                            else if (answer.optInt("status",-1) == 1) show(() -> {
                                status.setText("ダウンロードキーが異なります。");
                                browser.setVisibility(android.view.View.VISIBLE);
                                askPassword(token);
                            });
                            else failed("ダウンロードキーを確認できませんでした。");
                        } catch (Exception error) { failed("ダウンロードキーを確認できませんでした。"); }
                    }, "Haiagaru-GigaFile-password").start();
                }).show();
    }

    static Uri directUrl(String page, String key) {
        if (!MediaUploadWebPolicy.gigaShare(page) || !key.matches("[A-Za-z0-9]{0,4}")) return null;
        Uri share = Uri.parse(page);
        return action(share,"download.php",share.getPathSegments().get(0),key);
    }

    private Uri action(String endpoint,String token,String key) {
        return action(page,endpoint,token,key);
    }

    private static Uri action(Uri page,String endpoint,String token,String key) {
        Uri.Builder uri = new Uri.Builder().scheme("https").authority(page.getHost()).appendPath(endpoint)
                .appendQueryParameter("file",token);
        if (!key.isEmpty()) uri.appendQueryParameter("dlkey",key);
        return uri.build();
    }

    private void save(String token,String key) {
        HttpURLConnection connection = null;
        try {
            if (activity.isFinishing()) return;
            connection = open(action("download.php",token,key),true);
            String disposition = connection.getHeaderField("Content-Disposition");
            String mime = connection.getContentType();
            if (connection.getResponseCode() != 200 || disposition == null
                    || !disposition.regionMatches(true,0,"attachment",0,"attachment".length()))
                throw new IOException("Download response was not a file");
            String name = downloadName(disposition,mime,originalFilename,page.toString());
            show(() -> status.setText("ダウンロード中…"));
            try (InputStream in = connection.getInputStream()) { write(in,name,mime); }
            String result = name;
            show(() -> {
                status.setText("ダウンロードに保存しました\n"+result);
                browser.setVisibility(android.view.View.VISIBLE);
            });
        } catch (Exception failure) {
            failed("直接ダウンロードできませんでした。アプリ内ブラウザで開けます。");
        } finally { if (connection != null) connection.disconnect(); }
    }

    static String downloadName(String disposition,String mime,String pageName,String pageUrl) {
        String responseName = dispositionFilename(disposition);
        String visibleName = safeFilename(pageName);
        String name = responseName;
        boolean phpEndpointName = isPhpName(responseName);
        boolean usePageName = !visibleName.isEmpty() && (name.isEmpty()
                || (name.toLowerCase(java.util.Locale.ROOT).endsWith(".bin") && hasExtension(visibleName))
                || (phpEndpointName && !visibleName.equalsIgnoreCase(responseName)));
        if (usePageName) name = visibleName;
        boolean endpointResponseName = isDownloadEndpointName(name);
        if (endpointResponseName && visibleName.isEmpty()) name = "gigafile-download";
        boolean endpointUrlName = false;
        if (name.isEmpty()) {
            name = URLUtil.guessFileName(pageUrl,disposition,mime);
            if (isDownloadEndpointName(name)) {
                name = "gigafile-download";
                endpointUrlName = true;
            }
        }
        name = safeFilename(name);
        if (name.isEmpty()) name = "gigafile-download";
        if (!hasExtension(name) && !endpointUrlName && !endpointResponseName && !(usePageName && phpEndpointName)) {
            String type = mime == null ? "" : mime.split(";",2)[0].trim().toLowerCase(java.util.Locale.ROOT);
            String extension = android.webkit.MimeTypeMap.getSingleton().getExtensionFromMimeType(type);
            if (extension != null && !extension.isEmpty()) name += "." + extension;
        }
        return name.length() > 200 ? name.substring(0,200) : name;
    }

    private static boolean isPhpName(String name) {
        return name != null && name.toLowerCase(java.util.Locale.ROOT).endsWith(".php");
    }

    private static boolean isDownloadEndpointName(String name) {
        return name != null && name.equalsIgnoreCase("download.php");
    }

    private static String dispositionFilename(String disposition) {
        if (disposition == null) return "";
        Matcher encoded = Pattern.compile("(?i)(?:^|;)\\s*filename\\*\\s*=\\s*(?:UTF-8''|\\\"?)([^;\\\"]+)\\\"?")
                .matcher(disposition);
        if (encoded.find()) {
            try { return safeFilename(URLDecoder.decode(encoded.group(1).trim(),StandardCharsets.UTF_8.name())); }
            catch (Exception ignored) { }
        }
        Matcher plain = Pattern.compile("(?i)(?:^|;)\\s*filename\\s*=\\s*\\\"([^\\\"]*)\\\"").matcher(disposition);
        if (plain.find()) return safeFilename(plain.group(1).trim());
        plain = Pattern.compile("(?i)(?:^|;)\\s*filename\\s*=\\s*([^;\\s]+)").matcher(disposition);
        return plain.find() ? safeFilename(plain.group(1).trim()) : "";
    }

    private static String safeFilename(String value) {
        if (value == null) return "";
        String name = value.replace('\\','/');
        int slash = name.lastIndexOf('/');
        if (slash >= 0) name = name.substring(slash+1);
        name = name.replaceAll("[\\p{Cntrl}]", "_").trim();
        return name.equals(".") || name.equals("..") ? "" : name;
    }

    private static boolean hasExtension(String name) {
        int dot = name.lastIndexOf('.');
        return dot > 0 && dot < name.length()-1;
    }

    private void write(InputStream input,String name,String mime) throws IOException {
        if (Build.VERSION.SDK_INT >= 29) {
            ContentValues values = new ContentValues();
            values.put(MediaStore.MediaColumns.DISPLAY_NAME,name);
            values.put(MediaStore.MediaColumns.MIME_TYPE,mime == null ? "application/octet-stream" : mime.split(";",2)[0]);
            values.put(MediaStore.MediaColumns.RELATIVE_PATH,Environment.DIRECTORY_DOWNLOADS);
            values.put(MediaStore.MediaColumns.IS_PENDING,1);
            android.content.ContentResolver resolver = activity.getContentResolver();
            Uri output = resolver.insert(MediaStore.Downloads.EXTERNAL_CONTENT_URI,values);
            if (output == null) throw new IOException("No destination");
            boolean complete = false;
            try {
                try (OutputStream stream = resolver.openOutputStream(output)) { copy(input,stream); }
                ContentValues ready = new ContentValues();
                ready.put(MediaStore.MediaColumns.IS_PENDING,0);
                if (resolver.update(output,ready,null,null) == 0) throw new IOException("Download could not be published");
                complete = true;
            } finally { if (!complete) resolver.delete(output,null,null); }
            return;
        }
        File dir = Environment.getExternalStoragePublicDirectory(Environment.DIRECTORY_DOWNLOADS);
        if (!dir.isDirectory() && !dir.mkdirs()) throw new IOException("No download directory");
        File destination = new File(dir,name);
        while (!destination.createNewFile()) destination = new File(dir,UUID.randomUUID().toString().substring(0,8)+"-"+name);
        boolean complete = false;
        try {
            try (OutputStream out = new FileOutputStream(destination)) { copy(input,out); }
            complete = true;
        } finally { if (!complete) destination.delete(); }
        android.media.MediaScannerConnection.scanFile(activity,new String[]{destination.getAbsolutePath()},null,null);
    }

    private void copy(InputStream in,OutputStream out) throws IOException {
        if (out == null) throw new IOException("No download stream");
        byte[] bytes = new byte[65536];
        for (int n; (n=in.read(bytes)) != -1;) out.write(bytes,0,n);
    }

    private String text(Uri address,int limit) throws IOException {
        HttpURLConnection connection = open(address,false);
        try {
            if (connection.getResponseCode() != 200) throw new IOException("GigaFile page unavailable");
            cookies.receive(URI.create(address.toString()),connection.getHeaderFields());
            try (InputStream in = connection.getInputStream(); ByteArrayOutputStream out = new ByteArrayOutputStream()) {
                byte[] data = new byte[8192];
                for (int n; (n=in.read(data)) != -1;) {
                    if (out.size()+n > limit) throw new IOException("GigaFile response exceeds limit");
                    out.write(data,0,n);
                }
                return out.toString(StandardCharsets.UTF_8.name());
            }
        } finally { connection.disconnect(); }
    }

    private HttpURLConnection open(Uri address,boolean download) throws IOException {
        URI target = URI.create(address.toString());
        HttpURLConnection connection = (HttpURLConnection) target.toURL().openConnection();
        connection.setInstanceFollowRedirects(false);
        connection.setConnectTimeout(12000);
        connection.setReadTimeout(30000);
        connection.setRequestProperty("User-Agent",UA);
        connection.setRequestProperty("Referer",page.toString());
        String cookie = cookies.header(target);
        if (download) cookie = (cookie.isEmpty() ? "" : cookie+"; ")+"prog_key="+UUID.randomUUID().toString().substring(0,8);
        if (!cookie.isEmpty()) connection.setRequestProperty("Cookie",cookie);
        return connection;
    }

    private void failed(String message) {
        show(() -> {
            status.setText(message);
            browser.setVisibility(android.view.View.VISIBLE);
        });
    }

    private void show(Runnable work) {
        activity.runOnUiThread(() -> {
            if (!activity.isFinishing() && !activity.isDestroyed()) work.run();
        });
    }
}
