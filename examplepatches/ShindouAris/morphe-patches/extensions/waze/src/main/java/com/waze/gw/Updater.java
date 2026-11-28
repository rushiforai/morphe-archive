package com.waze.gw;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.os.Build;
import android.util.Log;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.security.MessageDigest;

import org.json.JSONObject;

/**
 * OTA updater — checks the mod's distribution backend once per app open, and if a newer build exists
 * for THIS exact install (Android version × AA/NoAA × main/clone), prompts → downloads → one-tap installs.
 *
 * Self-contained like {@link HudLink} (own app context via reflection, own "waze_hud_gw" prefs).
 * Backend: {@code GET {base}/api/check?av&aa&clone} → the NEWEST stable build for this variant (with its
 * sha256); {@code GET {base}/api/download/{id}} 302-redirects to the APK. "Update available" = that build's
 * sha256 differs from the sha256 of our OWN installed APK. Install reuses Waze's {@code com.waze.provider}.
 *
 * Prefs: {@code ota_auto} (bool, default false), {@code ota_installer} (0 system / 1 KingInstaller / 2 AAEnabler),
 * {@code ota_base} (str override), {@code ota_skip_hash} (str),
 * {@code self_hash}/{@code self_hash_stamp} (cached own-APK digest).
 */
final class Updater {
    private static final String TAG = "WazeOTA";
    private static final String STORE_DISABLE_ASSET = "wz_ota_disabled";
    private static final String OTA_CHANNEL_PREF = "ota_channel";
    private static final String OTA_INSTALLER_PREF = "ota_installer";
    static final int INSTALLER_SYSTEM = 0;
    static final int INSTALLER_KING = 1;
    static final int INSTALLER_AA_ENABLER = 2;
    private static final String KING_INSTALLER_PACKAGE = "com.example.kinginstaller";
    private static final String AA_ENABLER_PACKAGE = "com.aaenabler.app";

    private static volatile boolean checkedThisProcess;

    /** Idempotent, once per app open (no time throttle) — called from Gateway.onSpeedo. Auto path: notify only. */
    static synchronized void ensureChecked() {
        if (!otaAvailable()) return;
        if (checkedThisProcess) return;
        if (!Gateway.trustedBuild()) return;
        if (!pref("ota_auto", false)) return;
        checkedThisProcess = true;
        Thread t = new Thread(new Runnable() { public void run() { runCheck(false, null); } }, "ota-check");
        t.setDaemon(true);
        t.start();
    }

    /** Manual "Kiểm tra cập nhật" — always runs, always shows UI on the given Activity. */
    static void checkNow(final Activity a) {
        if (!otaAvailable()) {
            toast(a, I18n.tr("settings.ota_is_not_available_for_the"));
            return;
        }
        if (!Gateway.trustedBuild(a)) {
            toast(a, I18n.tr("settings.this_installation_isnt_allowed_to_update"));
            return;
        }
        toast(a, I18n.tr("hud_link.checking_for_updates"));
        Thread t = new Thread(new Runnable() { public void run() { runCheck(true, a); } }, "ota-check");
        t.setDaemon(true);
        t.start();
    }

    private static boolean otaAvailable() {
        try {
            Context context = appCtx();
            if (context == null) return true;
            java.io.InputStream input = context.getAssets().open(STORE_DISABLE_ASSET);
            input.close();
            return false;
        } catch (Throwable ignored) {
            return true;
        }
    }

    // ---------------- check ----------------
    // Hash-based: ask the server for the NEWEST build matching THIS variant (Android × AA/NoAA × main/clone),
    // then compare that build's sha256 to the sha256 of OUR OWN installed APK. Different hash => a new build
    // exists. (SHA-256 answers "same vs different"; the server's ordering guarantees "newest" for the variant.)
    private static void runCheck(boolean manual, Activity host) {
        try {
            // The setting may be switched off after the hot callback queued this worker.
            if (!manual && !pref("ota_auto", false)) return;
            String path = "/api/check"
                    + "?av=" + deviceAndroidVer()
                    + "&aa=" + (thisAppHasAA() ? 1 : 0)
                    + "&clone=" + (isClone() ? 1 : 0)
                    + "&channel=" + updateChannel();
            GetResult response = httpGetWithFallback(path, 5);
            if (response == null) { if (manual) toast(host, I18n.tr("settings.couldnt_check_for_updates")); return; }
            JSONObject root = new JSONObject(response.body);

            JSONObject sel = root.optJSONObject("build");
            if (sel == null || !matches(sel)) { if (manual) toast(host, I18n.tr("settings.no_build_matches_this_device")); return; }
            sel.put("_wazemod_base", response.base);

            String changelog = "";
            JSONObject cl = root.optJSONObject("changelog");     // {id,versionId,content}
            changelog = cl != null ? cl.optString("content", "") : root.optString("changelog", "");

            String newHash = sel.optString("sha256", "");
            if (newHash.isEmpty()) {                              // admin hasn't filled the checksum -> can't compare
                Log.w(TAG, "latest build has no sha256; cannot detect update");
                if (manual) toast(host, I18n.tr("settings.youre_on_the_latest_version"));
                return;
            }
            String myHash = selfSha256();
            int installedBuildId = ModBuildInfo.otaBuildId(appCtx());
            int candidateBuildId = sel.optInt("otaBuildId", -1);
            if (installedBuildId > 0 && candidateBuildId > 0
                    && candidateBuildId <= installedBuildId) {
                if (manual) toast(host, I18n.tr("settings.youre_on_the_latest_version"));
                return;
            }
            if (myHash != null && newHash.equalsIgnoreCase(myHash)) {   // same bytes => already on this build
                if (manual) toast(host, I18n.tr("settings.youre_on_the_latest_version"));
                return;
            }
            if (!manual && newHash.equalsIgnoreCase(prefStr("ota_skip_hash", ""))) return;   // user dismissed this build

            final JSONObject fsel = sel;
            final String fcl = changelog;
            if (manual && host != null) {
                host.runOnUiThread(new Runnable() { public void run() { showUpdateDialog(host, fsel, fcl); } });
            } else if (pref("ota_auto", false)) {
                notifyUpdate(sel.optString("buildName", I18n.tr("settings.new_version")));   // auto path: non-blocking notification
            }
        } catch (Throwable t) {
            Log.w(TAG, "check", t);
            if (manual) toast(host, I18n.tr("settings.update_check_error"));
        }
    }

    private static String updateChannel() {
        android.content.SharedPreferences preferences = p();
        if (preferences != null && preferences.contains(OTA_CHANNEL_PREF)) {
            return preferences.getInt(OTA_CHANNEL_PREF, 0) == 1 ? "reimei" : "stable";
        }
        // Missing preference means Stable. Installed artifact channel is metadata, never a
        // reason to silently rewrite the user's update subscription.
        return "stable";
    }

    /** Which app receives the downloaded APK; anything unknown means the system installer. */
    private static int installerChoice() {
        android.content.SharedPreferences preferences = p();
        int value = preferences == null ? INSTALLER_SYSTEM
                : preferences.getInt(OTA_INSTALLER_PREF, INSTALLER_SYSTEM);
        return value == INSTALLER_KING || value == INSTALLER_AA_ENABLER ? value : INSTALLER_SYSTEM;
    }

    static String installedBuildChannel(Context context) {
        return ModBuildInfo.channel(context);
    }

    /** Called by Settings so disabling auto-check also removes a notification already posted. */
    static void onAutoSettingChanged(boolean enabled) {
        if (enabled) return; // automatic checking begins on the next normal app/speed startup path
        try {
            Context c = appCtx();
            if (c != null) {
                android.app.NotificationManager nm = (android.app.NotificationManager)
                        c.getSystemService(Context.NOTIFICATION_SERVICE);
                if (nm != null) nm.cancel(71);
            }
        } catch (Throwable t) { Log.w(TAG, "cancel auto notification", t); }
    }

    /** Defensive: confirm the server's build actually targets THIS install (variant × Android range, stable). */
    private static boolean matches(JSONObject b) {
        if (!"stable".equals(b.optString("status", "stable"))) return false;
        int dev = deviceAndroidVer();
        int min = b.optInt("minAndroid", 0);
        int max = b.isNull("maxAndroid") ? 99 : b.optInt("maxAndroid", 99);
        if (dev < min || dev > max) return false;
        if (b.optBoolean("androidAuto", false) != thisAppHasAA()) return false;
        String want = isClone() ? "dual" : "overwrite";
        return want.equals(b.optString("installType", "overwrite"));
    }

    /** SHA-256 of our OWN installed APK (base.apk). Cached by APK mtime to avoid re-hashing ~150 MB every open. */
    private static String selfSha256() {
        try {
            Context c = appCtx(); if (c == null) return null;
            File apk = new File(c.getApplicationInfo().sourceDir);
            long stamp = apk.lastModified();
            if (stamp == prefLong("self_hash_stamp", -1)) {
                String cached = prefStr("self_hash", "");
                if (!cached.isEmpty()) return cached;
            }
            MessageDigest md = MessageDigest.getInstance("SHA-256");
            java.io.FileInputStream in = new java.io.FileInputStream(apk);
            byte[] buf = new byte[65536]; int r;
            while ((r = in.read(buf)) > 0) md.update(buf, 0, r);
            in.close();
            String h = hex(md.digest());
            putLong("self_hash_stamp", stamp);
            putStr("self_hash", h);
            return h;
        } catch (Throwable t) { Log.w(TAG, "selfSha256", t); return null; }
    }

    // ---------------- variant / device detection ----------------
    private static int deviceAndroidVer() { return androidVerFor(Build.VERSION.SDK_INT); }
    private static int androidVerFor(int sdk) {
        switch (sdk) {
            case 23: return 6;  case 24: case 25: return 7;  case 26: case 27: return 8;
            case 28: return 9;  case 29: return 10; case 30: return 11; case 31: case 32: return 12;
            case 33: return 13; case 34: return 14; case 35: return 15;
            default: return sdk < 23 ? 5 : sdk - 19;   // best-effort forward map
        }
    }

    // AA vs NoAA: the NoAA build keeps the WazeCarAppService <service> declaration but STRIPS its
    // androidx.car.app.CarAppService intent-filter. So getServiceInfo() can't tell them apart — we must
    // probe the FILTER: queryIntentServices resolves the action only when the discovery filter is present.
    private static boolean thisAppHasAA() {
        try {
            Context c = appCtx();
            Intent i = new Intent("androidx.car.app.CarAppService");
            i.setPackage(c.getPackageName());
            java.util.List<android.content.pm.ResolveInfo> r = c.getPackageManager().queryIntentServices(i, 0);
            return r != null && !r.isEmpty();   // AA: filter present -> resolves; NoAA: filter stripped -> empty
        } catch (Throwable t) { return false; }
    }

    private static boolean isClone() {
        Context c = appCtx();
        return c != null && !"com.waze".equals(c.getPackageName());
    }

    // ---------------- UI: notification + dialog ----------------
    private static void notifyUpdate(String buildName) {
        try {
            Context c = appCtx(); if (c == null) return;
            android.app.NotificationManager nm =
                    (android.app.NotificationManager) c.getSystemService(Context.NOTIFICATION_SERVICE);
            String ch = "wazemod_ota";
            if (Build.VERSION.SDK_INT >= 26) {
                android.app.NotificationChannel channel = new android.app.NotificationChannel(
                        ch, I18n.tr("settings.update_waze_mod"), android.app.NotificationManager.IMPORTANCE_DEFAULT);
                nm.createNotificationChannel(channel);
            }
            Intent open = new Intent();
            open.setClassName(c, "com.waze.gw.ModSettingsActivity");
            open.putExtra("ota_check", true);
            open.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
            int flags = android.app.PendingIntent.FLAG_UPDATE_CURRENT
                    | (Build.VERSION.SDK_INT >= 23 ? android.app.PendingIntent.FLAG_IMMUTABLE : 0);
            android.app.PendingIntent pi = android.app.PendingIntent.getActivity(c, 71, open, flags);
            android.app.Notification.Builder nb = Build.VERSION.SDK_INT >= 26
                    ? new android.app.Notification.Builder(c, ch) : new android.app.Notification.Builder(c);
            nb.setContentTitle(I18n.tr("settings.a_waze_mod_update_is_available"))
              .setContentText(I18n.f("settings.0_tap_to_update", buildName))
              .setSmallIcon(c.getApplicationInfo().icon)
              .setAutoCancel(true)
              .setContentIntent(pi);
            nm.notify(71, nb.build());
        } catch (Throwable t) { Log.w(TAG, "notify", t); }
    }

    private static void showUpdateDialog(final Activity a, final JSONObject sel, String changelog) {
        try {
            String size = formatSize(sel.optLong("apkSizeBytes", 0));
            android.app.AlertDialog.Builder builder = new android.app.AlertDialog.Builder(a);
            float density = a.getResources().getDisplayMetrics().density;
            android.util.TypedValue tv = new android.util.TypedValue();
            int textColor = 0xFFE6E6E6;
            int accent = AmbientTheme.color(a.getSharedPreferences("waze_hud_gw", Activity.MODE_PRIVATE));
            if (builder.getContext().getTheme().resolveAttribute(android.R.attr.textColorSecondary, tv, true)
                    && tv.type >= android.util.TypedValue.TYPE_FIRST_COLOR_INT
                    && tv.type <= android.util.TypedValue.TYPE_LAST_COLOR_INT) {
                textColor = tv.data;
            }
            android.text.SpannableStringBuilder msg = new android.text.SpannableStringBuilder();
            msg.append(sel.optString("buildName", "")).append(size.isEmpty() ? "" : ("\n" + size)).append("\n\n");
            if (changelog != null && !changelog.isEmpty()) msg.append(MiniMarkdown.render(changelog, density, accent));
            android.widget.TextView body = new android.widget.TextView(builder.getContext());
            body.setText(msg);
            body.setTextSize(14);
            body.setTextColor(textColor);
            body.setLineSpacing(0f, 1.12f);
            body.setMovementMethod(android.text.method.LinkMovementMethod.getInstance());
            int pad = (int) (22 * density);
            body.setPadding(pad, (int) (8 * density), pad, (int) (4 * density));
            android.widget.ScrollView scroll = new android.widget.ScrollView(builder.getContext());
            scroll.addView(body);
            builder
                .setTitle(I18n.tr("settings.a_new_update_is_available"))
                .setView(scroll)
                .setPositiveButton(I18n.tr("settings.updates"), new android.content.DialogInterface.OnClickListener() {
                    public void onClick(android.content.DialogInterface d, int w) { downloadAndInstall(a, sel); }
                })
                .setNegativeButton(I18n.tr("settings.later"), new android.content.DialogInterface.OnClickListener() {
                    public void onClick(android.content.DialogInterface d, int w) {
                        putStr("ota_skip_hash", sel.optString("sha256", ""));   // don't auto-nag this build again
                    }
                })
                .show();
        } catch (Throwable t) { Log.w(TAG, "dialog", t); }
    }

    // ---------------- download + install ----------------
    private static void downloadAndInstall(final Activity a, final JSONObject sel) {
        if (!Gateway.trustedBuild(a)) {
            toast(a, I18n.tr("settings.this_installation_isnt_allowed_to_update"));
            return;
        }
        // Install permission pre-flight (Android 8+): route to settings, abort; user re-taps after granting.
        // Skipped for KingInstaller/AAEnabler: they install on their own, Waze only hands over the file.
        try {
            if (Build.VERSION.SDK_INT >= 26 && installerChoice() == INSTALLER_SYSTEM
                    && !a.getPackageManager().canRequestPackageInstalls()) {
                a.startActivity(new Intent(android.provider.Settings.ACTION_MANAGE_UNKNOWN_APP_SOURCES,
                        Uri.parse("package:" + a.getPackageName())));
                toast(a, I18n.tr("settings.turn_on_install_unknown_apps_then"));
                return;
            }
        } catch (Throwable t) { /* older devices: no such gate */ }

        final android.app.ProgressDialog pd = new android.app.ProgressDialog(a);
        pd.setTitle(I18n.tr("settings.downloading_the_update"));
        pd.setProgressStyle(android.app.ProgressDialog.STYLE_HORIZONTAL);
        pd.setCancelable(false);
        pd.setMax(100);
        pd.show();

        Thread t = new Thread(new Runnable() { public void run() {
            File dst = new File(a.getCacheDir(), "wazemod-update.apk");   // cache_internal (WazeFileProvider path)
            try {
                try { if (dst.exists()) dst.delete(); } catch (Throwable e) {}
                downloadWithFallback(sel, dst, new Progress() {
                    public void on(final int pct) { a.runOnUiThread(new Runnable() { public void run() { pd.setProgress(pct); } }); }
                });
                a.runOnUiThread(new Runnable() { public void run() { pd.dismiss(); install(a, dst); } });
            } catch (Throwable e) {
                Log.w(TAG, "download", e);
                a.runOnUiThread(new Runnable() { public void run() { pd.dismiss(); toast(a, I18n.tr("settings.update_download_failed")); } });
            }
        } }, "ota-dl");
        t.setDaemon(true);
        t.start();
    }

    private interface Progress { void on(int pct); }

    private static void downloadWithFallback(JSONObject selection, File destination,
                                             Progress progress) throws Exception {
        Throwable lastError = null;
        String preferred = selection.optString("_wazemod_base", "");
        for (String endpoint : orderedDownloadBases(preferred)) {
            try {
                if (destination.exists() && !destination.delete())
                    throw new Exception("cannot reset download file");
                MessageDigest digest = MessageDigest.getInstance("SHA-256");
                String url = endpoint + "/api/download/" + selection.optString("id");
                long total = downloadWithRedirects(url, destination, digest, progress);
                if (total <= 0) throw new Exception("empty download");
                String expected = selection.optString("sha256", "");
                if (!expected.isEmpty() && !hex(digest.digest()).equalsIgnoreCase(expected))
                    throw new Exception("SHA-256 mismatch");
                return;
            } catch (Throwable error) {
                lastError = error;
                try { if (destination.exists()) destination.delete(); } catch (Throwable ignored) { }
                Log.w(TAG, "download endpoint failed " + endpoint, error);
            }
        }
        if (lastError instanceof Exception) throw (Exception) lastError;
        throw new Exception("all download endpoints failed", lastError);
    }

    /** GET with a MANUAL redirect loop (HttpURLConnection won't follow http->https). Streams to dst + hashes. */
    private static long downloadWithRedirects(String url, File dst, MessageDigest md, Progress prog) throws Exception {
        for (int hop = 0; hop < 6; hop++) {
            HttpURLConnection c = (HttpURLConnection) new URL(url).openConnection();
            c.setInstanceFollowRedirects(false);
            c.setConnectTimeout(15000);
            c.setReadTimeout(30000);
            DiagnosticsLogger.networkStart("ota-download", c);
            int code = c.getResponseCode();
            if (code == 301 || code == 302 || code == 303 || code == 307 || code == 308) {
                DiagnosticsLogger.networkEnd("ota-download", c, code, 0L, null);
                String loc = c.getHeaderField("Location");
                c.disconnect();
                if (loc == null) throw new Exception("redirect without Location");
                url = loc;
                continue;
            }
            if (code != 200) {
                DiagnosticsLogger.networkEnd("ota-download", c, code, 0L, null);
                c.disconnect(); throw new Exception("http " + code);
            }
            long len = c.getContentLength();
            InputStream in = c.getInputStream();
            FileOutputStream out = new FileOutputStream(dst);
            byte[] buf = new byte[65536];
            long got = 0; int r; int lastPct = -1;
            while ((r = in.read(buf)) > 0) {
                out.write(buf, 0, r); md.update(buf, 0, r); got += r;
                if (len > 0) { int pct = (int) (got * 100 / len); if (pct != lastPct) { lastPct = pct; prog.on(pct); } }
            }
            out.flush(); out.close(); in.close();
            DiagnosticsLogger.networkEnd("ota-download", c, code, got, null);
            c.disconnect();
            return got;
        }
        throw new Exception("too many redirects");
    }

    /**
     * Hand the downloaded APK to a third-party installer through its exported {@code ApkHandler}
     * alias (VIEW + APK MIME + content URI, read grant). Named explicitly so it works without a
     * package-visibility {@code <queries>} entry. Returns false when the app is not installed or
     * refuses the intent, so the caller can fall back to the system installer.
     */
    private static boolean installWithThirdParty(Activity a, Uri apkUri, String pkg, String label) {
        try {
            Intent i = new Intent(Intent.ACTION_VIEW);
            i.setDataAndType(apkUri, "application/vnd.android.package-archive");
            i.setComponent(new android.content.ComponentName(pkg, pkg + ".ApkHandler"));
            i.addFlags(Intent.FLAG_GRANT_READ_URI_PERMISSION | Intent.FLAG_ACTIVITY_NEW_TASK);
            a.startActivity(i);
            return true;
        } catch (android.content.ActivityNotFoundException e) {
            toast(a, I18n.f("settings.0_isnt_installed_use_the_system", label));
        } catch (Throwable t) {
            Log.w(TAG, "third-party installer " + pkg, t);
            toast(a, I18n.f("settings.couldnt_open_0_use_the_system", label));
        }
        return false;
    }

    private static void install(Activity a, File apk) {
        try {
            Uri u = Uri.parse("content://" + a.getPackageName() + ".provider/cache_internal/" + apk.getName());
            int installer = installerChoice();
            if (installer == INSTALLER_KING
                    && installWithThirdParty(a, u, KING_INSTALLER_PACKAGE, "KingInstaller")) return;
            if (installer == INSTALLER_AA_ENABLER
                    && installWithThirdParty(a, u, AA_ENABLER_PACKAGE, "AAEnabler")) return;
            Intent i = new Intent(Intent.ACTION_INSTALL_PACKAGE);
            i.putExtra(Intent.EXTRA_INSTALLER_PACKAGE_NAME, "com.android.vending");
            i.setDataAndType(u, "application/vnd.android.package-archive");
            i.addFlags(Intent.FLAG_GRANT_READ_URI_PERMISSION | Intent.FLAG_ACTIVITY_NEW_TASK);
            a.startActivity(i);   // system installer takes over; our process is likely killed on install
        } catch (Throwable t) { Log.w(TAG, "install", t); toast(a, I18n.tr("settings.couldnt_open_the_installer")); }
    }

    // ---------------- helpers ----------------
    private static String[] updateBases() {
        return WazeModEndpoints.forConfiguredBase(prefStr("ota_base", ""));
    }

    private static String[] orderedDownloadBases(String preferred) {
        java.util.LinkedHashSet<String> values = new java.util.LinkedHashSet<String>();
        String first = WazeModEndpoints.trim(preferred);
        if (first.length() > 0) values.add(first);
        for (String value : updateBases()) values.add(value);
        return values.toArray(new String[values.size()]);
    }

    private static GetResult httpGetWithFallback(String path, int maxRedirect) {
        for (String endpoint : updateBases()) {
            try {
                String body = httpGet(endpoint + path, maxRedirect);
                if (body != null) {
                    new JSONObject(body); // A 200 HTML/error page must also trigger the fallback.
                    return new GetResult(endpoint, body);
                }
                Log.w(TAG, "check endpoint returned no data: " + endpoint);
            } catch (Throwable error) {
                Log.w(TAG, "check endpoint failed " + endpoint, error);
            }
        }
        return null;
    }

    private static final class GetResult {
        final String base;
        final String body;
        GetResult(String base, String body) { this.base = base; this.body = body; }
    }

    private static String httpGet(String url, int maxRedirect) throws Exception {
        for (int hop = 0; hop < maxRedirect; hop++) {
            HttpURLConnection c = (HttpURLConnection) new URL(url).openConnection();
            c.setInstanceFollowRedirects(false);
            c.setConnectTimeout(12000);
            c.setReadTimeout(15000);
            c.setRequestProperty("Accept", "application/json");
            DiagnosticsLogger.networkStart("ota-manifest", c);
            int code = c.getResponseCode();
            if (code == 301 || code == 302 || code == 303 || code == 307 || code == 308) {
                DiagnosticsLogger.networkEnd("ota-manifest", c, code, 0L, null);
                String loc = c.getHeaderField("Location"); c.disconnect();
                if (loc == null) return null; url = loc; continue;
            }
            if (code != 200) {
                DiagnosticsLogger.networkEnd("ota-manifest", c, code, 0L, null);
                c.disconnect(); return null;
            }
            InputStream in = c.getInputStream();
            java.io.ByteArrayOutputStream bo = new java.io.ByteArrayOutputStream();
            byte[] buf = new byte[8192]; int r;
            while ((r = in.read(buf)) > 0) bo.write(buf, 0, r);
            in.close();
            byte[] body = bo.toByteArray();
            DiagnosticsLogger.networkEnd("ota-manifest", c, code, body.length, null);
            c.disconnect();
            return new String(body, "UTF-8");
        }
        return null;
    }

    private static String formatSize(long bytes) {
        if (bytes <= 0) return "";
        double mb = bytes / (1024.0 * 1024.0);
        return String.format(java.util.Locale.US, "%.0f MB", mb);
    }

    private static String hex(byte[] b) {
        StringBuilder s = new StringBuilder(b.length * 2);
        for (byte x : b) { s.append(Character.forDigit((x >> 4) & 0xF, 16)); s.append(Character.forDigit(x & 0xF, 16)); }
        return s.toString();
    }

    private static void toast(final Activity a, final String msg) {
        try {
            if (a != null) a.runOnUiThread(new Runnable() { public void run() { android.widget.Toast.makeText(a, msg, android.widget.Toast.LENGTH_SHORT).show(); } });
        } catch (Throwable t) { /* ignore */ }
    }

    // ---------------- context / prefs (self-contained, mirrors HudLink) ----------------
    private static Context appCtx() {
        try {
            return (Context) Class.forName("android.app.ActivityThread")
                    .getMethod("currentApplication").invoke((Object) null);
        } catch (Throwable t) { return null; }
    }
    private static android.content.SharedPreferences p() {
        Context c = appCtx();
        return c == null ? null : c.getSharedPreferences("waze_hud_gw", Context.MODE_PRIVATE);
    }
    private static boolean pref(String k, boolean d) { android.content.SharedPreferences p = p(); return p == null ? d : p.getBoolean(k, d); }
    private static String prefStr(String k, String d) { android.content.SharedPreferences p = p(); return p == null ? d : p.getString(k, d); }
    private static long prefLong(String k, long d) { android.content.SharedPreferences p = p(); return p == null ? d : p.getLong(k, d); }
    private static void putStr(String k, String v) { android.content.SharedPreferences p = p(); if (p != null) p.edit().putString(k, v).apply(); }
    private static void putLong(String k, long v) { android.content.SharedPreferences p = p(); if (p != null) p.edit().putLong(k, v).apply(); }
}
