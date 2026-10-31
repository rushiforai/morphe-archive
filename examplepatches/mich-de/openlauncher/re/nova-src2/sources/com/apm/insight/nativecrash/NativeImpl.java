package com.apm.insight.nativecrash;

import android.content.Context;
import android.os.Build;
import android.text.TextUtils;
import androidx.annotation.Keep;
import com.apm.insight.b.d;
import com.apm.insight.b.f;
import com.apm.insight.e;
import com.apm.insight.l.j;
import java.io.File;

/* loaded from: classes.dex */
public class NativeImpl {

    /* renamed from: a, reason: collision with root package name */
    private static volatile boolean f21779a = false;

    /* renamed from: b, reason: collision with root package name */
    private static volatile boolean f21780b = false;

    /* renamed from: c, reason: collision with root package name */
    private static boolean f21781c = true;

    public static boolean a() {
        if (f21780b) {
            return f21779a;
        }
        f21780b = true;
        if (!f21779a) {
            f21779a = com.apm.insight.a.b("apminsighta");
        }
        return f21779a;
    }

    public static int b() {
        if (f21779a) {
            return doCreateCallbackThread();
        }
        return -1;
    }

    public static void c() {
    }

    public static void d() {
    }

    @Keep
    private static native boolean doCheckNativeCrash();

    @Keep
    private static native void doCloseFile(int i5);

    @Keep
    private static native int doCreateCallbackThread();

    @Keep
    private static native void doDump(String str);

    @Keep
    private static native void doDumpFds(String str);

    @Keep
    private static native void doDumpHprof(String str);

    @Keep
    private static native void doDumpLogcat(String str, String str2, String str3);

    @Keep
    private static native void doDumpMaps(String str);

    @Keep
    private static native void doDumpMemInfo(String str);

    @Keep
    private static native void doDumpThreads(String str);

    @Keep
    private static native long doGetAppCpuTime();

    @Keep
    private static native long doGetChildCpuTime();

    @Keep
    private static native String doGetCrashHeader(String str);

    @Keep
    private static native long doGetDeviceCpuTime();

    @Keep
    private static native int doGetFDCount();

    @Keep
    private static native String[] doGetFdDump(int i5, int i11, int[] iArr, String[] strArr);

    @Keep
    private static native long doGetFreeMemory();

    @Keep
    private static native long doGetThreadCpuTime(int i5);

    @Keep
    private static native int doGetThreadsCount();

    @Keep
    private static native long doGetTotalMemory();

    @Keep
    private static native long doGetVMSize();

    @Keep
    private static native void doInitThreadDump();

    @Keep
    private static native int doLock(String str, int i5);

    @Keep
    private static native int doOpenFile(String str);

    @Keep
    private static native void doRebuildTombstone(String str, String str2, String str3);

    @Keep
    private static native void doSetAlogConfigPath(String str);

    @Keep
    private static native void doSetAlogFlushAddr(long j11);

    @Keep
    private static native void doSetAlogLogDirAddr(long j11);

    @Keep
    private static native void doSetResendSigQuit(int i5);

    @Keep
    private static native void doSetUploadEnd();

    @Keep
    private static native void doSignalMainThread();

    @Keep
    private static native int doStart(int i5, String str, String str2, String str3, int i11);

    @Keep
    private static native void doStartAnrMonitor(int i5);

    @Keep
    private static native void doWriteFile(int i5, String str, int i11);

    public static boolean e() {
        if (!f21779a) {
            return false;
        }
        try {
            return doCheckNativeCrash();
        } catch (Throwable unused) {
            return false;
        }
    }

    public static boolean f() {
        if (!f21779a) {
            return false;
        }
        try {
            return is64Bit();
        } catch (Throwable unused) {
            return false;
        }
    }

    public static void g() {
        new Thread(new Runnable() { // from class: com.apm.insight.nativecrash.NativeImpl.1
            @Override // java.lang.Runnable
            public final void run() {
                try {
                    NativeImpl.l();
                } catch (Throwable th2) {
                    try {
                        com.apm.insight.c.a(th2, "NPTH_ANR_MONITOR_ERROR");
                    } catch (Throwable unused) {
                    }
                }
            }
        }, "NPTH-AnrMonitor").start();
    }

    public static int h(String str) {
        if (!f21779a) {
            return -1;
        }
        try {
            return doOpenFile(str);
        } catch (Throwable unused) {
            return -1;
        }
    }

    @Keep
    private static void handleNativeCrash(String str) {
        NativeCrashCollector.onNativeCrash(str);
    }

    public static void i(String str) {
        if (f21779a) {
            doDump(str);
        }
    }

    @Keep
    private static native boolean is64Bit();

    public static void j() {
        if (f21779a) {
            doSetUploadEnd();
        }
    }

    public static void k() {
        if (f21779a) {
            doInitThreadDump();
        }
    }

    public static /* synthetic */ void l() {
        if (f21779a) {
            try {
                doStartAnrMonitor(Build.VERSION.SDK_INT);
            } catch (Throwable unused) {
            }
        }
    }

    @Keep
    private static void reportEventForAnrMonitor() {
        try {
            e.j();
            d.c();
            f.a(e.g()).a().e();
        } catch (Throwable unused) {
        }
    }

    public static int c(String str) {
        if (f21779a && !TextUtils.isEmpty(str)) {
            try {
                return doLock(str, -1);
            } catch (Throwable unused) {
            }
        }
        return -1;
    }

    public static void d(String str) {
        if (f21779a) {
            try {
                doDumpMemInfo(str);
            } catch (Throwable unused) {
            }
        }
    }

    public static void b(long j11) {
        if (f21779a) {
            try {
                doSetAlogLogDirAddr(j11);
            } catch (Throwable unused) {
            }
        }
    }

    public static void e(String str) {
        if (f21779a) {
            try {
                doDumpFds(str);
            } catch (Throwable unused) {
            }
        }
    }

    public static void f(String str) {
        if (f21779a) {
            try {
                doDumpMaps(str);
            } catch (Throwable unused) {
            }
        }
    }

    public static boolean h() {
        return f21781c;
    }

    public static void i() {
        if (f21779a) {
            doSignalMainThread();
        }
    }

    public static void g(String str) {
        if (f21779a) {
            try {
                doDumpThreads(str);
            } catch (Throwable unused) {
            }
        }
    }

    public static void b(String str) {
        if (f21779a) {
            doDumpHprof(str);
        }
    }

    public static boolean a(Context context) {
        String strA;
        boolean zA = a();
        if (zA) {
            String str = j.j(context) + "/apminsight";
            if (new File(context.getApplicationInfo().nativeLibraryDir, "libapminsightb.so").exists()) {
                strA = context.getApplicationInfo().nativeLibraryDir;
            } else {
                strA = com.apm.insight.h.b.a();
                com.apm.insight.h.b.b("apminsightb");
            }
            doStart(Build.VERSION.SDK_INT, strA, str, e.f(), e.m());
        }
        return zA;
    }

    public static void b(int i5) {
        if (f21779a) {
            try {
                doCloseFile(i5);
            } catch (Throwable unused) {
            }
        }
    }

    public static void a(long j11) {
        if (f21779a) {
            try {
                doSetAlogFlushAddr(j11);
            } catch (Throwable unused) {
            }
        }
    }

    public static String a(String str) {
        if (f21779a) {
            return doGetCrashHeader(str);
        }
        return null;
    }

    public static void a(File file) {
        if (f21779a) {
            doRebuildTombstone(j.c(file).getAbsolutePath(), j.b(file).getAbsolutePath(), j.d(file).getAbsolutePath());
        }
    }

    public static int a(int i5) {
        if (f21779a && i5 >= 0) {
            try {
                return doLock(com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, i5);
            } catch (Throwable unused) {
            }
        }
        return -1;
    }

    public static void a(String str, String str2, String str3) {
        if (f21779a) {
            try {
                doDumpLogcat(str, str2, str3);
            } catch (Throwable unused) {
            }
        }
    }

    public static void a(int i5, String str) {
        if (!f21779a || TextUtils.isEmpty(str)) {
            return;
        }
        try {
            doWriteFile(i5, str, str.length());
        } catch (Throwable unused) {
        }
    }

    public static void a(boolean z11) {
        f21781c = z11;
        if (f21779a) {
            doSetResendSigQuit(z11 ? 1 : 0);
        }
    }
}
