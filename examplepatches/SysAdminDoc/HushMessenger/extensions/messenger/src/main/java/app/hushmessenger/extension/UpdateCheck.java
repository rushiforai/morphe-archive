package app.hushmessenger.extension;

import android.content.SharedPreferences;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.LinearLayout;
import android.widget.TextView;

/**
 * The App tab's update check: the latest GitHub release, compared with this build and shown under About while Check for
 * updates is on. One per settings page, kept across a rebuild of the App tab so a rebuild still cancels the check before it.
 */
final class UpdateCheck {
    /** Where the update check asks, and how long it waits. Tests point these at a local server. */
    static String releasesUrl = "https://api.github.com/repos/SysAdminDoc/HushMessenger/releases/latest";
    static int updateTimeoutMillis = 5000;
    static java.util.function.LongSupplier updateClock = System::currentTimeMillis;
    private static final Object UPDATE_CACHE_LOCK = new Object();

    private final SettingsActivity page;
    private TextView updateStatus;
    private Button updateCheckNow, updateRelease;
    private volatile long updateGeneration;
    private java.net.HttpURLConnection updateConnection;

    UpdateCheck(SettingsActivity page) {
        this.page = page;
    }

    /**
     * Compares release numbers part by part as integers, so 0.10.0 is newer than 0.9.0. A leading "v"
     * is ignored and a missing or non-numeric part counts as 0. Build metadata is ignored. Numeric
     * pre-release identifiers sort numerically and before text; a release sorts after its pre-releases.
     */
    static int compareVersions(String a, String b) {
        String[] left = a.trim().replaceFirst("^v", "").split("\\+", 2)[0].split("-", 2);
        String[] right = b.trim().replaceFirst("^v", "").split("\\+", 2)[0].split("-", 2);
        String[] x = left[0].split("\\."), y = right[0].split("\\.");
        for (int i = 0; i < Math.max(x.length, y.length); i++) {
            int diff = versionPart(x, i).compareTo(versionPart(y, i));
            if (diff != 0) return diff;
        }
        if (left.length != right.length) return left.length > right.length ? -1 : 1;
        if (left.length == 1) return 0;
        x = left[1].split("\\."); y = right[1].split("\\.");
        for (int i = 0; i < Math.min(x.length, y.length); i++) {
            boolean numericX = x[i].matches("[0-9]+"), numericY = y[i].matches("[0-9]+");
            int diff = numericX && numericY ? versionPart(x, i).compareTo(versionPart(y, i))
                : numericX != numericY ? (numericX ? -1 : 1) : x[i].compareTo(y[i]);
            if (diff != 0) return diff;
        }
        return Integer.compare(x.length, y.length);
    }

    private static java.math.BigInteger versionPart(String[] parts, int index) {
        return index < parts.length && parts[index].matches("[0-9]+") ? new java.math.BigInteger(parts[index]) : java.math.BigInteger.ZERO;
    }

    /** The release page to offer, or "" when the response points anywhere but this project's releases. */
    static String releasePage(String htmlUrl) {
        // A plain tag page only, so "../" or an encoded path can't walk out of this project.
        return htmlUrl.matches("https://github\\.com/SysAdminDoc/HushMessenger/releases/tag/[0-9A-Za-z._+-]+")
            && !htmlUrl.contains("..") ? htmlUrl : "";
    }

    static String releasePage(String htmlUrl, String tag) {
        return ReleaseCheck.validTag(tag) && !releasePage(htmlUrl).isEmpty()
            && htmlUrl.equals("https://github.com/SysAdminDoc/HushMessenger/releases/tag/" + tag) ? htmlUrl : "";
    }

    /** The status line and Check now button under the Check for updates switch, built again with the App tab. */
    void addTo(LinearLayout about) {
        updateStatus = page.ui.text("", 13, page.ui.muted, false);
        updateStatus.setTag("update_status");
        updateStatus.setAccessibilityLiveRegion(View.ACCESSIBILITY_LIVE_REGION_POLITE);
        updateStatus.setVisibility(View.GONE);
        page.ui.add(about, updateStatus, 8);
        updateCheckNow = page.ui.button(page.text.get("check_now"));
        updateCheckNow.setTag("check_now");
        updateCheckNow.setOnClickListener(view -> checkForUpdates());
        page.ui.add(about, updateCheckNow, 8);
    }

    void syncUpdateChoice(boolean check) {
        if (updateStatus == null) return;
        boolean enabled = Settings.preferences.getBoolean("check_updates", false);
        updateCheckNow.setVisibility(enabled ? View.VISIBLE : View.GONE);
        if (!enabled) {
            cancelUpdateCheck();
            updateStatus.setVisibility(View.GONE);
        } else if (check) checkForUpdates();
    }

    synchronized void cancelUpdateCheck() {
        updateGeneration++;
        if (updateConnection != null) {
            updateConnection.disconnect();
            updateConnection = null;
        }
        if (updateRelease != null) {
            ((ViewGroup) updateRelease.getParent()).removeView(updateRelease);
            updateRelease = null;
        }
    }

    private boolean currentUpdate(long generation) {
        return generation == updateGeneration && !page.isDestroyed() && Settings.preferences.getBoolean("check_updates", false);
    }

    private boolean saveUpdate(long generation, SharedPreferences.Editor editor, String error) {
        // Only workers take this lock. Serialize accepted writes so an older write cannot
        // finish after a newer one, without making cancellation wait for disk I/O.
        synchronized (UPDATE_CACHE_LOCK) {
            if (!currentUpdate(generation)) return false;
            if (!editor.commit()) android.util.Log.w("HushMessenger", error);
            return true;
        }
    }

    private void showRelease(long generation, ReleaseCheck release) {
        page.runOnUiThread(() -> {
            if (!currentUpdate(generation)) return;
            String latest = release.version();
            int comparison = compareVersions(latest, BuildConfig.VERSION_NAME);
            updateStatus.setTextColor(comparison > 0 ? page.ui.accent : page.ui.muted);
            if (comparison > 0) {
                updateStatus.setText(page.text.get("update_available", latest));
                Button view = page.ui.button(page.text.get("update_action"));
                view.setTag("update_release");
                updateRelease = view;
                view.setOnClickListener(v -> page.openPage(release.page));
                ViewGroup parent = (ViewGroup) updateStatus.getParent();
                LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(-1, -2);
                params.topMargin = page.ui.dp(8);
                parent.addView(view, parent.indexOfChild(updateStatus) + 1, params);
            } else updateStatus.setText(comparison == 0 ? page.text.get("up_to_date")
                : page.text.get("update_ahead", BuildConfig.VERSION_NAME, latest));
            updateStatus.setVisibility(View.VISIBLE);
        });
    }

    private void showRetry(long generation, long deadline) {
        page.runOnUiThread(() -> {
            if (!currentUpdate(generation)) return;
            String date = java.text.DateFormat.getDateTimeInstance(java.text.DateFormat.SHORT, java.text.DateFormat.MEDIUM,
                page.getResources().getConfiguration().getLocales().get(0)).format(new java.util.Date(deadline));
            updateStatus.setText(page.text.get("update_retry", date));
            updateStatus.setVisibility(View.VISIBLE);
        });
    }

    private void checkForUpdates() {
        cancelUpdateCheck();
        if (!Settings.preferences.getBoolean("check_updates", false) || page.isDestroyed()) return;
        long generation = updateGeneration;
        String endpoint = releasesUrl;
        updateStatus.setText(page.text.get("update_loading"));
        updateStatus.setTextColor(page.ui.muted);
        updateStatus.setVisibility(View.VISIBLE);
        new Thread(() -> {
            java.net.HttpURLConnection conn = null;
            try {
                long now = updateClock.getAsLong();
                SharedPreferences prefs = Settings.preferences;
                long retry = ReleaseCheck.retryDeadline(prefs, endpoint, now);
                if (now < retry) { showRetry(generation, retry); return; }
                ReleaseCheck cached = ReleaseCheck.cached(prefs, endpoint, now);
                if (cached != null && cached.recent(now)) { showRelease(generation, cached); return; }
                conn = (java.net.HttpURLConnection) new java.net.URL(endpoint).openConnection();
                synchronized (this) {
                    if (!currentUpdate(generation)) return;
                    updateConnection = conn;
                }
                conn.setInstanceFollowRedirects(false);
                conn.setRequestProperty("Accept", "application/vnd.github.v3+json");
                if (cached != null && !cached.etag.isEmpty()) conn.setRequestProperty("If-None-Match", cached.etag);
                conn.setConnectTimeout(updateTimeoutMillis);
                conn.setReadTimeout(updateTimeoutMillis);
                int code = conn.getResponseCode();
                if (code == 403 || code == 429) {
                    int failures = ReleaseCheck.failures(prefs);
                    long deadline = ReleaseCheck.retryAt(conn, updateClock.getAsLong(), failures);
                    if (!saveUpdate(generation, prefs.edit().putLong(ReleaseCheck.RETRY_KEY, deadline)
                        .putString(ReleaseCheck.RETRY_ENDPOINT_KEY, endpoint).putInt(ReleaseCheck.FAILURES_KEY, Math.min(6, failures + 1)),
                        "Couldn't save update retry time")) return;
                    showRetry(generation, deadline);
                    return;
                }
                ReleaseCheck release;
                if (code == 304) {
                    if (cached == null || cached.etag.isEmpty()) throw new java.io.IOException("304 without a conditional release cache");
                    release = cached.revalidated(conn.getHeaderField("ETag"), updateClock.getAsLong());
                    if (release == null) {
                        // A changed ETag can't confirm the cached release. Drop it so the next check asks unconditionally.
                        if (!saveUpdate(generation, prefs.edit().remove(ReleaseCheck.CACHE_KEY), "Couldn't clear the cached release")) return;
                        throw new java.io.IOException("Changed ETag on 304");
                    }
                } else {
                    if (code != 200) throw new java.io.IOException("HTTP " + code);
                    java.io.ByteArrayOutputStream response = new java.io.ByteArrayOutputStream();
                    try (java.io.InputStream stream = conn.getInputStream()) {
                        byte[] bytes = new byte[4096];
                        int read;
                        while ((read = stream.read(bytes)) != -1) {
                            if (response.size() + read > 256 * 1024) throw new java.io.IOException("Release response exceeds 256 KiB");
                            response.write(bytes, 0, read);
                        }
                    }
                    String body = java.nio.charset.StandardCharsets.UTF_8.newDecoder()
                        .onMalformedInput(java.nio.charset.CodingErrorAction.REPORT).onUnmappableCharacter(java.nio.charset.CodingErrorAction.REPORT)
                        .decode(java.nio.ByteBuffer.wrap(response.toByteArray())).toString();
                    release = ReleaseCheck.parse(body, endpoint, conn.getHeaderField("ETag"), updateClock.getAsLong());
                }
                if (!saveUpdate(generation, prefs.edit().putString(ReleaseCheck.CACHE_KEY, release.encode()).remove(ReleaseCheck.RETRY_KEY)
                    .remove(ReleaseCheck.RETRY_ENDPOINT_KEY).remove(ReleaseCheck.FAILURES_KEY), "Couldn't save checked release")) return;
                showRelease(generation, release);
            } catch (java.io.IOException | IllegalArgumentException | IllegalStateException | SecurityException error) {
                if (generation == updateGeneration) android.util.Log.e("HushMessenger", "Update check failed", error);
                page.runOnUiThread(() -> {
                    if (!currentUpdate(generation)) return;
                    updateStatus.setText(page.text.get("update_error"));
                    updateStatus.setVisibility(View.VISIBLE);
                });
            } finally {
                if (conn != null) conn.disconnect();
                synchronized (this) { if (updateConnection == conn) updateConnection = null; }
            }
        }, "HushUpdateCheck").start();
    }
}
