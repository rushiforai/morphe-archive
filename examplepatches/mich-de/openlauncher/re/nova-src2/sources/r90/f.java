package r90;

import android.content.Context;
import android.content.Intent;
import android.content.pm.ApplicationInfo;
import android.content.pm.ResolveInfo;
import android.os.Trace;
import android.util.Log;
import h60.h;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.Collections;
import s90.e0;

/* loaded from: classes5.dex */
public abstract class f {

    /* renamed from: a, reason: collision with root package name */
    public static h f85748a;

    /* renamed from: b, reason: collision with root package name */
    public static String f85749b;

    /* renamed from: c, reason: collision with root package name */
    public static final Object f85750c = new Object();

    public static h a(Context context, String str, boolean z11, boolean z12) {
        synchronized (f85750c) {
            try {
                String str2 = f85749b;
                if (str2 != null && !str.equals(str2)) {
                    throw new IllegalStateException("getHttpFlags() called multiple times with different versions");
                }
                h hVar = f85748a;
                if (hVar != null) {
                    return hVar;
                }
                f85749b = str;
                p90.a.a("HttpFlagsLoader#getHttpFlags loading flags");
                try {
                    e eVarC = !e0.c(context).getBoolean("android.net.http.ReadHttpFlags", true) ? null : c(context);
                    if (eVarC == null) {
                        eVarC = (e) e.f().build();
                    }
                    h hVarE = h.e(eVarC, context.getPackageName(), str, z12);
                    f85748a = hVarE;
                    g gVar = (g) Collections.unmodifiableMap(hVarE.f59486a).get("Cronet_log_me");
                    if (gVar != null) {
                        String str3 = z11 ? "API" : "Impl";
                        gVar.b(4);
                        Log.i("HttpFlagsLoader", "HTTP flags log line (" + str3 + "): " + ((String) gVar.f85751a));
                    }
                    h hVar2 = f85748a;
                    Trace.endSection();
                    return hVar2;
                } finally {
                    try {
                        Trace.endSection();
                    } catch (Throwable th2) {
                        th.addSuppressed(th2);
                    }
                }
            } catch (Throwable th3) {
                throw th3;
            }
        }
    }

    public static ApplicationInfo b(Context context) {
        p90.a.a("HttpFlagsLoader#getProviderApplicationInfo");
        try {
            ResolveInfo resolveInfoResolveService = context.getPackageManager().resolveService(new Intent("android.net.http.FLAGS_FILE_PROVIDER"), 1048576);
            if (resolveInfoResolveService == null) {
                Log.i("HttpFlagsLoader", "Unable to resolve the HTTP flags file provider package. This is expected if the host system is not set up to provide HTTP flags.");
                Trace.endSection();
                return null;
            }
            ApplicationInfo applicationInfo = resolveInfoResolveService.serviceInfo.applicationInfo;
            Trace.endSection();
            return applicationInfo;
        } catch (Throwable th2) {
            try {
                Trace.endSection();
            } catch (Throwable th3) {
                th2.addSuppressed(th3);
            }
            throw th2;
        }
    }

    public static e c(Context context) {
        try {
            ApplicationInfo applicationInfoB = b(context);
            if (applicationInfoB != null) {
                File file = new File(new File(new File(applicationInfoB.deviceProtectedDataDir), "app_httpflags"), "flags.binarypb");
                file.getAbsolutePath();
                e eVarD = d(file);
                if (eVarD != null) {
                    eVarD.toString();
                    return eVarD;
                }
            }
            return null;
        } catch (RuntimeException e3) {
            Log.i("HttpFlagsLoader", "Unable to load HTTP flags file", e3);
            return null;
        }
    }

    public static e d(File file) {
        p90.a.a("HttpFlagsLoader#loadFlagsFile");
        try {
            try {
                FileInputStream fileInputStream = new FileInputStream(file);
                try {
                    e eVarG = e.g(fileInputStream);
                    fileInputStream.close();
                    Trace.endSection();
                    return eVarG;
                } catch (Throwable th2) {
                    try {
                        fileInputStream.close();
                    } catch (Throwable th3) {
                        th2.addSuppressed(th3);
                    }
                    throw th2;
                }
            } catch (Throwable th4) {
                try {
                    Trace.endSection();
                } catch (Throwable th5) {
                    th4.addSuppressed(th5);
                }
                throw th4;
            }
        } catch (FileNotFoundException unused) {
            Log.i("HttpFlagsLoader", "HTTP flags file `" + file.getPath() + "` is missing. This is expected if HTTP flags functionality is currently disabled in the host system.");
            Trace.endSection();
            return null;
        } catch (IOException e3) {
            throw new RuntimeException("Unable to read HTTP flags file", e3);
        }
    }
}
