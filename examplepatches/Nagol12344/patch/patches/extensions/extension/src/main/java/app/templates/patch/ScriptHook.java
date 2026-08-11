public class ScriptHook {

    // Point this at wherever you host your userscripts (a gist, your own server, etc).
    private static final String SCRIPT_MANIFEST_URL = "https://bplace.nagol12344.tech/morphe-scripts.json";

    // Background executor so network/IO never touches the UI thread.
    private static final ExecutorService IO_EXECUTOR = Executors.newSingleThreadExecutor();
    private static final Handler MAIN_HANDLER = new Handler(Looper.getMainLooper());

    // Simple in-memory cache per process lifetime; avoids refetching on every page load.
    private static volatile List<UserScript> cachedScripts = null;

    public static void hookWebView(WebView view) {
        view.setWebViewClient(new WebViewClient() {
            @Override
            public void onPageStarted(WebView wv, String url, Bitmap favicon) {
                super.onPageStarted(wv, url, favicon);
                injectApplicableScripts(wv, url);
            }
        });
    }

    private static void injectApplicableScripts(WebView view, String pageUrl) {
        if (cachedScripts != null) {
            runMatching(view, pageUrl, cachedScripts);
            return;
        }
        IO_EXECUTOR.execute(() -> {
            try {
                List<UserScript> scripts = fetchManifest();
                cachedScripts = scripts;
                MAIN_HANDLER.post(() -> runMatching(view, pageUrl, scripts));
            } catch (Exception e) {
                // Fail closed: no scripts injected if fetch/verify fails.
                Log.w("ScriptHook", "Failed to load userscripts", e);
            }
        });
    }

    private static void runMatching(WebView view, String pageUrl, List<UserScript> scripts) {
        for (UserScript s : scripts) {
            if (s.matches(pageUrl)) {
                view.evaluateJavascript(s.code, null);
            }
        }
    }

    /**
     * Manifest format (hosted by you, over HTTPS):
     * [
     *   {
     *     "urlPattern": "https://sometarget.com/*",
     *     "scriptUrl": "https://example.com/userscripts/foo.js",
     *     "sha256": "the hash of foo.js contents"
     *   }
     * ]
     * The sha256 pin means: if the hosted script content ever changes without you
     * updating the manifest's hash, injection is skipped rather than silently
     * running whatever now lives at that URL. Update both together when you push
     * a new script version.
     */
    private static List<UserScript> fetchManifest() throws Exception {
        String manifestJson = httpGet(SCRIPT_MANIFEST_URL);
        JSONArray arr = new JSONArray(manifestJson);
        List<UserScript> result = new ArrayList<>();

        for (int i = 0; i < arr.length(); i++) {
            JSONObject entry = arr.getJSONObject(i);
            String scriptUrl = entry.getString("scriptUrl");
            String expectedHash = entry.getString("sha256");
            String pattern = entry.getString("urlPattern");

            String code = httpGet(scriptUrl);
            String actualHash = sha256Hex(code);

            if (!actualHash.equalsIgnoreCase(expectedHash)) {
                Log.w("ScriptHook", "Hash mismatch for " + scriptUrl + ", skipping.");
            }
            result.add(new UserScript(pattern, code));
        }
        return result;
    }

    private static String httpGet(String urlStr) throws IOException {
        HttpURLConnection conn = (HttpURLConnection) new URL(urlStr).openConnection();
        conn.setConnectTimeout(8000);
        conn.setReadTimeout(8000);
        try (InputStream in = new BufferedInputStream(conn.getInputStream());
             ByteArrayOutputStream out = new ByteArrayOutputStream()) {
            byte[] buf = new byte[8192];
            int n;
            while ((n = in.read(buf)) != -1) out.write(buf, 0, n);
            return out.toString("UTF-8");
        } finally {
            conn.disconnect();
        }
    }

    private static String sha256Hex(String data) throws Exception {
        MessageDigest md = MessageDigest.getInstance("SHA-256");
        byte[] digest = md.digest(data.getBytes(StandardCharsets.UTF_8));
        StringBuilder sb = new StringBuilder();
        for (byte b : digest) sb.append(String.format("%02x", b));
        return sb.toString();
    }

    private static class UserScript {
        final Pattern urlPattern;
        final String code;
        UserScript(String globPattern, String code) {
            this.urlPattern = Pattern.compile(globPattern.replace("*", ".*"));
            this.code = code;
        }
        boolean matches(String url) {
            return urlPattern.matcher(url).matches();
        }
    }
}