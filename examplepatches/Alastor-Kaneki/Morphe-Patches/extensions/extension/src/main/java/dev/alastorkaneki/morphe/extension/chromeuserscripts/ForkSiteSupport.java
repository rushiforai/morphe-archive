package dev.alastorkaneki.morphe.extension.chromeuserscripts;

import android.app.Activity;
import android.content.Intent;
import android.content.SharedPreferences;
import android.net.Uri;
import android.util.Base64;

import org.json.JSONObject;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.net.URI;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.util.Locale;
import java.util.Map;
import java.util.WeakHashMap;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/** Greasy Fork/Sleazy Fork browsing, installation, and publish-prefill support. */
final class ForkSiteSupport {
    static final String GREASY_HOST = "greasyfork.org";
    static final String SLEAZY_HOST = "sleazyfork.org";

    private static final String PENDING_HOST = "fork_publish_host";
    private static final String PENDING_PATH = "fork_publish_path";
    private static final String PENDING_NAME = "fork_publish_name";
    private static final String PENDING_FILE = "pending-fork-publish.user.js";

    private static final Pattern SCRIPT_ID = Pattern.compile("/scripts/(\\d+)(?:[-/]|$)");
    private static final Pattern HREF = Pattern.compile("(?is)href\\s*=\\s*([\"'])(.*?)\\1");
    private static final Map<Activity, String> LAST_INSTALL_PROMPT = new WeakHashMap<>();

    private ForkSiteSupport() { }

    static boolean isForkHost(String host) {
        return ViolentmonkeyCompat.isForkHost(host);
    }

    static boolean isDirectScript(String url) {
        return ViolentmonkeyCompat.isDirectUserscriptUrl(url);
    }

    static boolean isForkScriptPage(String url) {
        return ViolentmonkeyCompat.isForkScriptPage(url);
    }

    static boolean isInstallablePage(String url) {
        return isDirectScript(url) || isForkScriptPage(url) || hasInstallMarker(url);
    }

    static boolean hasInstallMarker(String url) {
        return ViolentmonkeyCompat.hasInstallMarker(url);
    }

    static String installUrlFromMarker(String url) {
        return ViolentmonkeyCompat.installUrlFromMarker(url);
    }

    static String resolveInstallUrl(String pageUrl) throws Exception {
        String marked = installUrlFromMarker(pageUrl);
        if (marked != null) return marked;
        if (isDirectScript(pageUrl)) return pageUrl;
        if (!isForkScriptPage(pageUrl)) throw new Exception("This page is not a userscript page");

        String apiUrl = apiUrl(pageUrl);
        if (apiUrl != null) {
            try {
                JSONObject object = new JSONObject(MonkeyStore.fetch(apiUrl));
                String codeUrl = object.optString("code_url", "").trim();
                if (isAllowedInstallUrl(codeUrl)) return codeUrl;
            } catch (Throwable ignored) { }
        }

        String html = MonkeyStore.fetch(pageUrl);
        Matcher matcher = HREF.matcher(html);
        while (matcher.find()) {
            String href = htmlDecode(matcher.group(2));
            String resolved;
            try {
                resolved = new URL(new URL(pageUrl), href).toString();
            } catch (Exception ignored) {
                continue;
            }
            if (isAllowedInstallUrl(resolved)) return resolved;
        }

        return ViolentmonkeyCompat.fallbackForkInstallUrl(pageUrl);
    }

    static void openSite(Activity activity, String host) {
        openUrl(activity, "https://" + ViolentmonkeyCompat.normalizeHost(host) + "/en/scripts");
    }

    static void openUrl(Activity activity, String url) {
        Intent intent = new Intent(Intent.ACTION_VIEW, Uri.parse(url));
        intent.setPackage(activity.getPackageName());
        intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
        activity.startActivity(intent);
    }

    static void openInstallPreview(Activity activity, String pageUrl) {
        activity.startActivity(new Intent(activity, UserscriptInstallActivity.class)
                .putExtra("script_page_url", pageUrl)
                .addFlags(Intent.FLAG_ACTIVITY_CLEAR_TOP));
    }

    /**
     * Redirects a website install click straight into the exported native installer activity.
     * The old hash-only bridge could swallow Greasy Fork's click and then wait forever for Chrome
     * to report the changed hash. The explicit Android intent does not depend on that polling path.
     */
    static void injectInstallClickBridge(Activity activity, ChromeBridge.Page page) {
        if (activity == null || page == null || page.incognito || !isForkPage(page.url)) return;
        String packageName = activity.getPackageName();
        String payload = "(function(){"
                + "if(window.__MonkeyScriptInstallBridgeV2)return;"
                + "window.__MonkeyScriptInstallBridgeV2=true;"
                + "const pkg='" + packageName + "';"
                + "const direct=u=>/\\.user\\.(?:js|css)(?:[?#]|$)/i.test(u||'');"
                + "const resolve=a=>{let u='';try{u=new URL((a&&((a.href)||(a.dataset&&a.dataset.codeUrl)))||'',location.href).href}catch(e){}return u};"
                + "const launch=u=>{if(!direct(u))return false;"
                + "window.__MonkeyScriptInstallRequest=u;"
                + "const i='intent://install?url='+encodeURIComponent(u)+'#Intent;scheme=monkeyscript-install;package='+pkg+';end';"
                + "setTimeout(()=>{location.href=i},0);"
                + "setTimeout(()=>{if(document.visibilityState==='visible'){try{history.replaceState(history.state,'',location.pathname+location.search+'#monkeyscript-install='+encodeURIComponent(u))}catch(e){location.hash='monkeyscript-install='+encodeURIComponent(u)}}},900);"
                + "return true};"
                + "document.addEventListener('click',function(e){"
                + "const a=e.target&&e.target.closest?e.target.closest('a[href],button[data-code-url],[data-code-url]'):null;"
                + "if(!a)return;const u=resolve(a);if(!direct(u))return;"
                + "e.preventDefault();e.stopPropagation();e.stopImmediatePropagation();launch(u);"
                + "},true);"
                + "const tag=()=>document.querySelectorAll('a.install-link[href],a[href*=\".user.js\"],a[href*=\".user.css\"],[data-code-url]').forEach(a=>{a.dataset.monkeyscriptReady='true';a.title='Install with Userscripts'});"
                + "tag();new MutationObserver(tag).observe(document.documentElement,{childList:true,subtree:true});"
                + "})();";
        ChromeBridge.exec(page, payload);
    }

    static boolean consumeInstallMarker(Activity activity, ChromeBridge.Page page) {
        if (page == null || page.url == null) return false;
        String target = installUrlFromMarker(page.url);
        if (target == null) return false;
        synchronized (LAST_INSTALL_PROMPT) {
            if (target.equals(LAST_INSTALL_PROMPT.get(activity))) return false;
            LAST_INSTALL_PROMPT.put(activity, target);
        }
        ChromeBridge.exec(page,
                "try{history.replaceState(null,'',location.pathname+location.search)}catch(e){};");
        openInstallPreview(activity, target);
        return true;
    }

    static void maybePromptDirectInstall(Activity activity, String url) {
        if (!isDirectScript(url)) return;
        synchronized (LAST_INSTALL_PROMPT) {
            if (url.equals(LAST_INSTALL_PROMPT.get(activity))) return;
            LAST_INSTALL_PROMPT.put(activity, url);
        }
        openInstallPreview(activity, url);
    }

    static void queuePublish(Activity activity, Userscript script, String targetHost) throws Exception {
        String host = ViolentmonkeyCompat.normalizeHost(targetHost);
        if (!isForkHost(host)) throw new Exception("Unsupported publishing site");
        if (script == null || script.source == null || script.source.trim().isEmpty()) {
            throw new Exception("The script has no source code");
        }
        if (Userscript.KIND_CSS.equals(script.kind)) {
            throw new Exception("Fork publishing currently accepts JavaScript userscripts; export CSS userstyles as files");
        }

        File directory = new File(activity.getFilesDir(), "monkeyscript");
        if (!directory.exists() && !directory.mkdirs()) {
            throw new Exception("Cannot create publish staging directory");
        }
        File pending = new File(directory, PENDING_FILE);
        try (FileOutputStream output = new FileOutputStream(pending)) {
            output.write(script.source.getBytes(StandardCharsets.UTF_8));
        }

        String path = "/en/script_versions/prefill";
        String existingId = scriptIdForHost(script.installUrl, host);
        if (existingId != null) path = "/en/scripts/" + existingId + "/versions/prefill";

        MonkeyStore.prefs(activity).edit()
                .putString(PENDING_HOST, host)
                .putString(PENDING_PATH, path)
                .putString(PENDING_NAME, script.name)
                .apply();
        openUrl(activity, "https://" + host + "/en/");
    }

    static boolean injectPendingPublish(Activity activity, ChromeBridge.Page page) {
        if (page == null || page.incognito || page.url == null) return false;
        SharedPreferences preferences = MonkeyStore.prefs(activity);
        String host = preferences.getString(PENDING_HOST, "");
        if (host.isEmpty()) return false;
        try {
            URI current = new URI(page.url);
            if (!host.equals(ViolentmonkeyCompat.normalizeHost(current.getHost()))) return false;
            String path = preferences.getString(PENDING_PATH, "/en/script_versions/prefill");
            File pending = new File(new File(activity.getFilesDir(), "monkeyscript"), PENDING_FILE);
            if (!pending.isFile()) {
                clearPending(activity);
                return false;
            }
            String source;
            try (FileInputStream input = new FileInputStream(pending)) {
                source = MonkeyStore.read(input, 3 * 1024 * 1024);
            }
            String encoded = Base64.encodeToString(
                    source.getBytes(StandardCharsets.UTF_8), Base64.NO_WRAP);
            String action = "https://" + host + path;
            String payload = "(function(){if(window.__MonkeyForkPublish)return;"
                    + "window.__MonkeyForkPublish=true;const b='" + encoded + "';"
                    + "const x=Uint8Array.from(atob(b),c=>c.charCodeAt(0));"
                    + "const code=new TextDecoder().decode(x);"
                    + "const f=document.createElement('form');f.method='POST';"
                    + "f.enctype='multipart/form-data';f.action='" + action + "';"
                    + "const t=document.createElement('textarea');"
                    + "t.name='script_version[code]';t.value=code;f.appendChild(t);"
                    + "f.style.display='none';document.documentElement.appendChild(f);f.submit();})();";
            if (!ChromeBridge.exec(page, payload)) return false;
            clearPending(activity);
            return true;
        } catch (Throwable ignored) {
            return false;
        }
    }

    static String pendingPublishName(Activity activity) {
        return MonkeyStore.prefs(activity).getString(PENDING_NAME, "");
    }

    static void clearPending(Activity activity) {
        MonkeyStore.prefs(activity).edit()
                .remove(PENDING_HOST)
                .remove(PENDING_PATH)
                .remove(PENDING_NAME)
                .apply();
        File pending = new File(new File(activity.getFilesDir(), "monkeyscript"), PENDING_FILE);
        if (pending.isFile()) pending.delete();
    }

    private static String apiUrl(String pageUrl) {
        try {
            URI uri = new URI(pageUrl);
            String host = ViolentmonkeyCompat.normalizeHost(uri.getHost());
            Matcher matcher = SCRIPT_ID.matcher(uri.getPath() == null ? "" : uri.getPath());
            if (!matcher.find()) return null;
            String apiHost = GREASY_HOST.equals(host) ? "api.greasyfork.org" : host;
            return "https://" + apiHost + "/en/scripts/" + matcher.group(1) + ".json";
        } catch (Throwable ignored) {
            return null;
        }
    }

    private static boolean isForkPage(String url) {
        try {
            return isForkHost(new URI(url).getHost());
        } catch (Throwable ignored) {
            return false;
        }
    }

    private static boolean isAllowedInstallUrl(String url) {
        if (!isDirectScript(url)) return false;
        try {
            return isAllowedForkDownloadHost(
                    ViolentmonkeyCompat.normalizeHost(new URI(url).getHost()));
        } catch (Throwable ignored) {
            return false;
        }
    }

    private static String scriptIdForHost(String installUrl, String targetHost) {
        if (installUrl == null || installUrl.isEmpty()) return null;
        try {
            URI uri = new URI(installUrl);
            String host = ViolentmonkeyCompat.normalizeHost(uri.getHost());
            boolean matchingFamily = targetHost.equals(host)
                    || (GREASY_HOST.equals(targetHost) && "update.greasyfork.org".equals(host))
                    || (SLEAZY_HOST.equals(targetHost) && "update.sleazyfork.org".equals(host));
            if (!matchingFamily) return null;
            Matcher matcher = SCRIPT_ID.matcher(uri.getPath() == null ? "" : uri.getPath());
            return matcher.find() ? matcher.group(1) : null;
        } catch (Exception ignored) {
            return null;
        }
    }

    private static boolean isAllowedForkDownloadHost(String host) {
        return isForkHost(host)
                || "update.greasyfork.org".equals(host)
                || "update.sleazyfork.org".equals(host);
    }

    private static String htmlDecode(String value) {
        return value.replace("&amp;", "&")
                .replace("&#39;", "'")
                .replace("&#x27;", "'")
                .replace("&quot;", "\"")
                .replace("&lt;", "<")
                .replace("&gt;", ">");
    }
}
