package org.chromium.net.httpflags;

import android.content.Context;
import android.content.Intent;
import android.content.pm.ApplicationInfo;
import android.content.pm.ResolveInfo;
import android.os.Build;
import android.os.Trace;
import android.util.Log;
import defpackage.grb;
import defpackage.vv2;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import org.chromium.net.httpflags.ResolvedFlags;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class HttpFlagsLoader {
    static final /* synthetic */ boolean $assertionsDisabled = false;
    static final String FLAGS_FILE_DIR_NAME = "app_httpflags";
    static final String FLAGS_FILE_NAME = "flags.binarypb";
    static final String FLAGS_FILE_PROVIDER_INTENT_ACTION = "android.net.http.FLAGS_FILE_PROVIDER";
    public static final String LOG_FLAG_NAME = "Cronet_log_me";
    public static final String TAG = "HttpFlagsLoader";
    private static ResolvedFlags sHttpFlags;
    private static final Object sLock = new Object();
    private static String sVersion;

    private HttpFlagsLoader() {
    }

    public static void flushHttpFlags() {
        sHttpFlags = null;
        sVersion = null;
    }

    private static File getFlagsFileFromProvider(ApplicationInfo applicationInfo) {
        return new File(new File(new File(Build.VERSION.SDK_INT >= 24 ? applicationInfo.deviceProtectedDataDir : applicationInfo.dataDir), FLAGS_FILE_DIR_NAME), FLAGS_FILE_NAME);
    }

    public static ResolvedFlags getHttpFlags(Context context, String str, boolean z, boolean z2) {
        Flags flagsLoad;
        synchronized (sLock) {
            try {
                String str2 = sVersion;
                if (str2 != null && !str.equals(str2)) {
                    throw new IllegalStateException("getHttpFlags() called multiple times with different versions");
                }
                ResolvedFlags resolvedFlags = sHttpFlags;
                if (resolvedFlags != null) {
                    return resolvedFlags;
                }
                sVersion = str;
                grb.f("HttpFlagsLoader#getHttpFlags loading flags");
                try {
                    if (vv2.J(context).getBoolean("android.net.http.ReadHttpFlags", true)) {
                        flagsLoad = load(context);
                    } else {
                        Log.d(TAG, "Not loading HTTP flags because they are disabled in the manifest");
                        flagsLoad = null;
                    }
                    if (flagsLoad == null) {
                        flagsLoad = (Flags) Flags.newBuilder().m106build();
                    }
                    ResolvedFlags resolvedFlagsResolve = ResolvedFlags.resolve(flagsLoad, context.getPackageName(), str, z2);
                    sHttpFlags = resolvedFlagsResolve;
                    ResolvedFlags.Value value = resolvedFlagsResolve.flags().get(LOG_FLAG_NAME);
                    if (value != null) {
                        String str3 = z ? "API" : "Impl";
                        Log.i(TAG, "HTTP flags log line (" + str3 + "): " + value.getStringValue());
                    }
                    ResolvedFlags resolvedFlags2 = sHttpFlags;
                    Trace.endSection();
                    return resolvedFlags2;
                } finally {
                    try {
                        Trace.endSection();
                    } catch (Throwable th) {
                        th.addSuppressed(th);
                    }
                }
            } catch (Throwable th2) {
                throw th2;
            }
        }
    }

    private static ApplicationInfo getProviderApplicationInfo(Context context) {
        grb.f("HttpFlagsLoader#getProviderApplicationInfo");
        try {
            ResolveInfo resolveInfoResolveService = context.getPackageManager().resolveService(new Intent(FLAGS_FILE_PROVIDER_INTENT_ACTION), 1048576);
            if (resolveInfoResolveService == null) {
                Log.i(TAG, "Unable to resolve the HTTP flags file provider package. This is expected if the host system is not set up to provide HTTP flags.");
                Trace.endSection();
                return null;
            }
            ApplicationInfo applicationInfo = resolveInfoResolveService.serviceInfo.applicationInfo;
            Trace.endSection();
            return applicationInfo;
        } catch (Throwable th) {
            try {
                Trace.endSection();
            } catch (Throwable th2) {
                th.addSuppressed(th2);
            }
            throw th;
        }
    }

    public static Flags load(Context context) {
        try {
            ApplicationInfo providerApplicationInfo = getProviderApplicationInfo(context);
            if (providerApplicationInfo == null) {
                return null;
            }
            Log.d(TAG, "Found application exporting HTTP flags: " + providerApplicationInfo.packageName);
            File flagsFileFromProvider = getFlagsFileFromProvider(providerApplicationInfo);
            Log.d(TAG, "HTTP flags file path: " + flagsFileFromProvider.getAbsolutePath());
            Flags flagsLoadFlagsFile = loadFlagsFile(flagsFileFromProvider);
            if (flagsLoadFlagsFile == null) {
                return null;
            }
            Log.d(TAG, "Successfully loaded HTTP flags: " + flagsLoadFlagsFile);
            return flagsLoadFlagsFile;
        } catch (RuntimeException e) {
            Log.i(TAG, "Unable to load HTTP flags file", e);
            return null;
        }
    }

    private static Flags loadFlagsFile(File file) {
        grb.f("HttpFlagsLoader#loadFlagsFile");
        try {
            try {
                FileInputStream fileInputStream = new FileInputStream(file);
                try {
                    Flags delimitedFrom = Flags.parseDelimitedFrom(fileInputStream);
                    fileInputStream.close();
                    Trace.endSection();
                    return delimitedFrom;
                } catch (Throwable th) {
                    try {
                        fileInputStream.close();
                    } catch (Throwable th2) {
                        th.addSuppressed(th2);
                    }
                    throw th;
                }
            } catch (Throwable th3) {
                try {
                    Trace.endSection();
                } catch (Throwable th4) {
                    th3.addSuppressed(th4);
                }
                throw th3;
            }
        } catch (FileNotFoundException unused) {
            Log.i(TAG, "HTTP flags file `" + file.getPath() + "` is missing. This is expected if HTTP flags functionality is currently disabled in the host system.");
            Trace.endSection();
            return null;
        } catch (IOException e) {
            throw new RuntimeException("Unable to read HTTP flags file", e);
        }
    }
}
