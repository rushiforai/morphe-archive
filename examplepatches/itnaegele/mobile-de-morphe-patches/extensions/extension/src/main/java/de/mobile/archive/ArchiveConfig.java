package de.mobile.archive;

import android.content.Context;
import android.content.SharedPreferences;
import java.security.SecureRandom;

public final class ArchiveConfig {
    private static final String PREFS_NAME = "mobile_de_archive_prefs";

    public static final String MODE_NONE = "none";
    public static final String MODE_APPS_SCRIPT = "apps_script";
    public static final String MODE_OAUTH = "oauth";

    private static final String KEY_ENABLED = "enabled";
    private static final String KEY_ARCHIVE_IMAGES = "archive_images";
    private static final String KEY_PREFETCH_PARKED = "prefetch_parked";
    private static final String KEY_MAX_IMAGES = "max_images";
    private static final String KEY_WIFI_ONLY_MEDIA = "wifi_only_media";
    private static final String KEY_MAX_CACHE_MB = "max_cache_mb";
    private static final String KEY_DRIVE_MODE = "drive_mode";
    private static final String KEY_SCRIPT_URL = "script_url";
    private static final String KEY_SCRIPT_SECRET = "script_secret";
    private static final String KEY_OAUTH_CLIENT_ID = "oauth_client_id";
    private static final String KEY_OAUTH_CLIENT_SECRET = "oauth_client_secret";
    private static final String KEY_OAUTH_REFRESH_TOKEN = "oauth_refresh_token";
    private static final String KEY_OAUTH_ACCESS_TOKEN = "oauth_access_token";
    private static final String KEY_OAUTH_EXPIRY = "oauth_expiry";
    private static final String KEY_DRIVE_FOLDER_NAME = "drive_folder_name";
    private static final String KEY_DRIVE_FOLDER_ID = "drive_folder_id";
    private static final String KEY_LAST_STATUS = "last_status";

    private final SharedPreferences prefs;

    public ArchiveConfig(Context context) {
        this.prefs = context.getApplicationContext().getSharedPreferences(PREFS_NAME, Context.MODE_PRIVATE);
        if (getScriptSecret().isEmpty()) {
            setScriptSecret(generateSecret());
        }
    }

    private static String generateSecret() {
        String chars = "ABCDEFGHJKLMNPQRSTUVWXYZabcdefghijkmnopqrstuvwxyz23456789";
        SecureRandom rng = new SecureRandom();
        StringBuilder sb = new StringBuilder(24);
        for (int i = 0; i < 24; i++) {
            sb.append(chars.charAt(rng.nextInt(chars.length())));
        }
        return sb.toString();
    }

    public boolean isEnabled() {
        return prefs.getBoolean(KEY_ENABLED, true);
    }

    public void setEnabled(boolean enabled) {
        prefs.edit().putBoolean(KEY_ENABLED, enabled).apply();
    }

    public boolean isArchiveImages() {
        return prefs.getBoolean(KEY_ARCHIVE_IMAGES, true);
    }

    public void setArchiveImages(boolean enabled) {
        prefs.edit().putBoolean(KEY_ARCHIVE_IMAGES, enabled).apply();
    }

    public boolean isPrefetchParked() {
        return prefs.getBoolean(KEY_PREFETCH_PARKED, true);
    }

    public void setPrefetchParked(boolean enabled) {
        prefs.edit().putBoolean(KEY_PREFETCH_PARKED, enabled).apply();
    }

    public int getMaxImagesPerListing() {
        return prefs.getInt(KEY_MAX_IMAGES, 20);
    }

    public void setMaxImagesPerListing(int max) {
        prefs.edit().putInt(KEY_MAX_IMAGES, Math.max(1, Math.min(max, 60))).apply();
    }

    public boolean isWifiOnlyMedia() {
        return prefs.getBoolean(KEY_WIFI_ONLY_MEDIA, false);
    }

    public void setWifiOnlyMedia(boolean wifiOnly) {
        prefs.edit().putBoolean(KEY_WIFI_ONLY_MEDIA, wifiOnly).apply();
    }

    public int getMaxImageCacheMb() {
        return prefs.getInt(KEY_MAX_CACHE_MB, 250);
    }

    public void setMaxImageCacheMb(int maxMb) {
        prefs.edit().putInt(KEY_MAX_CACHE_MB, Math.max(20, Math.min(maxMb, 2000))).apply();
    }

    public String getDriveMode() {
        return prefs.getString(KEY_DRIVE_MODE, MODE_APPS_SCRIPT);
    }

    public void setDriveMode(String mode) {
        prefs.edit().putString(KEY_DRIVE_MODE, mode == null ? MODE_NONE : mode).apply();
    }

    public boolean isDriveConfigured() {
        String mode = getDriveMode();
        if (MODE_APPS_SCRIPT.equals(mode)) {
            return !getScriptUrl().trim().isEmpty() && !getScriptSecret().trim().isEmpty();
        }
        if (MODE_OAUTH.equals(mode)) {
            return !getOAuthClientId().trim().isEmpty() && !getOAuthRefreshToken().trim().isEmpty();
        }
        return false;
    }

    public String getScriptUrl() {
        return prefs.getString(KEY_SCRIPT_URL, "");
    }

    public void setScriptUrl(String url) {
        prefs.edit().putString(KEY_SCRIPT_URL, url == null ? "" : url.trim()).apply();
    }

    public String getScriptSecret() {
        return prefs.getString(KEY_SCRIPT_SECRET, "");
    }

    public void setScriptSecret(String secret) {
        prefs.edit().putString(KEY_SCRIPT_SECRET, secret == null ? "" : secret.trim()).apply();
    }

    public String getOAuthClientId() {
        return prefs.getString(KEY_OAUTH_CLIENT_ID, "");
    }

    public void setOAuthClientId(String id) {
        prefs.edit().putString(KEY_OAUTH_CLIENT_ID, id == null ? "" : id.trim()).apply();
    }

    public String getOAuthClientSecret() {
        return prefs.getString(KEY_OAUTH_CLIENT_SECRET, "");
    }

    public void setOAuthClientSecret(String secret) {
        prefs.edit().putString(KEY_OAUTH_CLIENT_SECRET, secret == null ? "" : secret.trim()).apply();
    }

    public String getOAuthRefreshToken() {
        return prefs.getString(KEY_OAUTH_REFRESH_TOKEN, "");
    }

    public void setOAuthRefreshToken(String token) {
        prefs.edit().putString(KEY_OAUTH_REFRESH_TOKEN, token == null ? "" : token.trim()).apply();
    }

    public String getOAuthAccessToken() {
        return prefs.getString(KEY_OAUTH_ACCESS_TOKEN, "");
    }

    public long getOAuthAccessTokenExpiry() {
        return prefs.getLong(KEY_OAUTH_EXPIRY, 0L);
    }

    public void setOAuthAccessToken(String token, long expiryMillis) {
        prefs.edit()
                .putString(KEY_OAUTH_ACCESS_TOKEN, token == null ? "" : token)
                .putLong(KEY_OAUTH_EXPIRY, expiryMillis)
                .apply();
    }

    public String getDriveFolderName() {
        return prefs.getString(KEY_DRIVE_FOLDER_NAME, "mobile.de Archiv");
    }

    public void setDriveFolderName(String name) {
        String clean = (name == null || name.trim().isEmpty()) ? "mobile.de Archiv" : name.trim();
        prefs.edit().putString(KEY_DRIVE_FOLDER_NAME, clean).remove(KEY_DRIVE_FOLDER_ID).apply();
    }

    public String getDriveFolderId() {
        return prefs.getString(KEY_DRIVE_FOLDER_ID, "");
    }

    public void setDriveFolderId(String id) {
        prefs.edit().putString(KEY_DRIVE_FOLDER_ID, id == null ? "" : id).apply();
    }

    public String getLastStatus() {
        return prefs.getString(KEY_LAST_STATUS, "Noch nicht synchronisiert");
    }

    public void setLastStatus(String status) {
        prefs.edit().putString(KEY_LAST_STATUS, status == null ? "" : status).apply();
    }
}
