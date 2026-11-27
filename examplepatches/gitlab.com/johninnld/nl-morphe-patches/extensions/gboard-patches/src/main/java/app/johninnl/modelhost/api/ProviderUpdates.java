package app.johninnl.modelhost.api;

import android.content.ComponentName;
import android.content.Context;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.net.Uri;
import android.os.Build;

import org.json.JSONObject;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URI;
import java.nio.charset.StandardCharsets;
import java.util.concurrent.TimeUnit;

/** Worker-thread helpers for an explicit update from the official Local Model Host release feed. */
public final class ProviderUpdates {
    public static final String OFFICIAL_SIGNER_SHA256 =
            "1c45e972f387160e6994391954d0f1ebd983a2b0ab506e444645f4ca9f47bdc4";
    public static final String LATEST_RELEASE_DESCRIPTOR =
            "https://gitlab.com/api/v4/projects/89371837/releases/permalink/latest/downloads/model-host-release.json";
    private static final int MAX_DESCRIPTOR_BYTES = 8192;

    private ProviderUpdates() {}

    /**
     * Returns an official install/update offer, or null when the caller's trusted installed
     * version and bundled minimum are at least as new. Caller controls network opt-in and cadence.
     */
    public static ProviderRelease check(Context context, long bundledMinimum, int requiredProtocolMinor)
            throws HostException {
        if (!ProviderDiscovery.isOfficialProviderSupported()) throw new HostException("UNSUPPORTED_DEVICE");
        long installed = installedVersion(context);
        try {
            ProviderRelease latest = readLatest(requiredProtocolMinor);
            return latest.minimumAndroidApi <= Build.VERSION.SDK_INT
                    && latest.versionCode > Math.max(installed, bundledMinimum) ? latest : null;
        } catch (Exception failure) {
            throw new HostException("UPDATE_CHECK_FAILED", failure);
        }
    }

    /** Returns 0 when absent. A package under the official name with a different signer is rejected. */
    public static long installedVersion(Context context) throws HostException {
        try {
            PackageInfo info = context.getPackageManager().getPackageInfo(ModelHostClient.DEFAULT_PACKAGE, 0);
            ProviderDiscovery.verifySigner(context,
                    new ComponentName(ModelHostClient.DEFAULT_PACKAGE, ModelHostClient.SERVICE_CLASS),
                    OFFICIAL_SIGNER_SHA256);
            return Build.VERSION.SDK_INT >= 28 ? info.getLongVersionCode() : info.versionCode;
        } catch (PackageManager.NameNotFoundException missing) {
            return 0;
        }
    }

    /** Download a newer verified install candidate. Launch ProviderInstallIntent only after user confirmation. */
    public static VerifiedApk download(Context context, ProviderRelease release, ProviderRelease.Progress progress)
            throws HostException {
        if (!ProviderDiscovery.isOfficialProviderSupported()) throw new HostException("UNSUPPORTED_DEVICE");
        if (release.minimumAndroidApi > Build.VERSION.SDK_INT) throw new HostException("UNSUPPORTED_DEVICE");
        if (release.versionCode <= installedVersion(context)) throw new HostException("UPDATE_NOT_NEWER");
        File copy = null;
        try {
            copy = File.createTempFile("model-host-update-", ".apk", context.getCacheDir());
            release.downloadTo(copy, progress);
            VerifiedApk verified = VerifiedApk.verify(context, Uri.fromFile(copy), release.packageName,
                    release.apkSha256, OFFICIAL_SIGNER_SHA256);
            boolean accepted = false;
            try {
                if (verified.versionCode != release.versionCode) throw new HostException("INVALID_APK_VERSION");
                if (verified.versionCode <= installedVersion(context)) throw new HostException("UPDATE_NOT_NEWER");
                accepted = true;
                return verified;
            } finally {
                if (!accepted) verified.file.delete();
            }
        } catch (HostException failure) {
            throw failure;
        } catch (Exception failure) {
            throw new HostException("UPDATE_DOWNLOAD_FAILED", failure);
        } finally {
            if (copy != null) copy.delete();
        }
    }

    static ProviderRelease parseLatest(JSONObject value, int requiredProtocolMinor) throws Exception {
        ProviderRelease release = new ProviderRelease(value);
        if (release.protocolMajor != 1 || requiredProtocolMinor < 0
                || release.protocolMinor < requiredProtocolMinor || release.apkBytes < 1 || release.download == null
                || release.minimumAndroidApi < ProviderDiscovery.MIN_OFFICIAL_PROVIDER_API
                || !release.download.getPath().startsWith("/api/v4/projects/89371837/packages/generic/local-model-host-review/")) {
            throw new IOException("Incompatible release descriptor");
        }
        return release;
    }

    private static ProviderRelease readLatest(int requiredProtocolMinor) throws Exception {
        URI uri = URI.create(LATEST_RELEASE_DESCRIPTOR);
        long deadline = System.nanoTime() + TimeUnit.SECONDS.toNanos(25);
        for (int redirects = 0; redirects <= 5; redirects++) {
            ProviderRelease.requireHttps(uri);
            HttpURLConnection connection = (HttpURLConnection) uri.toURL().openConnection();
            connection.setInstanceFollowRedirects(false);
            connection.setConnectTimeout(5000);
            connection.setReadTimeout(5000);
            connection.setRequestProperty("Accept", "application/json");
            try {
                int code = connection.getResponseCode();
                if (code == 301 || code == 302 || code == 303 || code == 307 || code == 308) {
                    String location = connection.getHeaderField("Location");
                    if (location == null || System.nanoTime() >= deadline) throw new IOException("Invalid release redirect");
                    uri = uri.resolve(location);
                    continue;
                }
                if (code != 200 || connection.getContentLengthLong() > MAX_DESCRIPTOR_BYTES) {
                    throw new IOException("Release descriptor unavailable");
                }
                try (InputStream input = connection.getInputStream(); ByteArrayOutputStream body = new ByteArrayOutputStream()) {
                    byte[] buffer = new byte[1024];
                    int size;
                    while ((size = input.read(buffer)) != -1) {
                        if (body.size() + size > MAX_DESCRIPTOR_BYTES || Thread.currentThread().isInterrupted()
                                || System.nanoTime() >= deadline) throw new IOException("Release descriptor exceeded limits");
                        body.write(buffer, 0, size);
                    }
                    return parseLatest(new JSONObject(new String(body.toByteArray(), StandardCharsets.UTF_8)), requiredProtocolMinor);
                }
            } finally {
                connection.disconnect();
            }
        }
        throw new IOException("Too many release redirects");
    }
}
