package com.apm.insight.l;

import android.content.Context;
import android.text.TextUtils;
import b.c0;
import java.io.File;

/* loaded from: classes.dex */
public final class j {

    /* renamed from: a, reason: collision with root package name */
    private static String f21767a;

    /* renamed from: b, reason: collision with root package name */
    private static File f21768b;

    /* renamed from: c, reason: collision with root package name */
    private static File f21769c;

    public static File a(Context context) {
        return new File(j(context), "apminsight/CrashLogJava");
    }

    public static File b(Context context) {
        return new File(j(context), "apminsight/CrashLogSimple");
    }

    public static File c(Context context) {
        return new File(j(context), "apminsight/RuntimeContext");
    }

    public static File d(Context context) {
        if (f21768b == null) {
            if (context == null) {
                context = com.apm.insight.e.g();
            }
            f21768b = new File(j(context), "apminsight/CrashLogNative");
        }
        return f21768b;
    }

    public static File e(Context context) {
        if (f21769c == null) {
            f21769c = new File(j(context) + "/apminsight/CrashCommonLog/" + com.apm.insight.e.f());
        }
        return f21769c;
    }

    public static File f(Context context) {
        return new File(j(context), "apminsight/CrashCommonLog");
    }

    public static File g(Context context) {
        return new File(j(context), "apminsight/issueCrashTimes");
    }

    public static File h(Context context) {
        return new File(j(context) + "/apminsight/issueCrashTimes/current.times");
    }

    public static File i(Context context) {
        return new File(j(context), "apminsight/alogCrash");
    }

    public static File j(File file) {
        return new File(a(com.apm.insight.e.g(), file.getName()), "threads.txt");
    }

    public static File k(File file) {
        return new File(a(com.apm.insight.e.g(), file.getName()), "meminfo.txt");
    }

    public static File l(File file) {
        return new File(a(com.apm.insight.e.g(), file.getName()), "pthreads.txt");
    }

    public static File m(File file) {
        return new File(a(com.apm.insight.e.g(), file.getName()), "rountines.txt");
    }

    public static File n(File file) {
        return new File(a(com.apm.insight.e.g(), file.getName()), "leakd_threads.txt");
    }

    public static File o(File file) {
        return new File(file, "abortmsg.txt");
    }

    public static File a() {
        File file = f21768b;
        return file == null ? d(com.apm.insight.e.g()) : file;
    }

    public static String b() {
        return "anr_" + com.apm.insight.e.e();
    }

    public static String c() {
        return c0.k("ensure_", com.apm.insight.e.e());
    }

    public static File f(File file) {
        return new File(file, "upload.json");
    }

    public static File g(File file) {
        return new File(file, "javastack.txt");
    }

    public static File h(File file) {
        return new File(a(com.apm.insight.e.g(), file.getName()), "logcat.txt");
    }

    public static File i(File file) {
        return new File(a(com.apm.insight.e.g(), file.getName()), "fds.txt");
    }

    public static String j(Context context) {
        if (TextUtils.isEmpty(f21767a)) {
            try {
                f21767a = context.getFilesDir().getAbsolutePath();
            } catch (Exception e3) {
                f21767a = "/sdcard/";
                e3.printStackTrace();
            }
        }
        return f21767a;
    }

    public static File b(File file) {
        return new File(file, "tombstone.txt");
    }

    public static File f(String str) {
        return new File(a(com.apm.insight.e.g(), str), "rountines.txt");
    }

    public static File g(String str) {
        return new File(a(com.apm.insight.e.g(), str), "leakd_threads.txt");
    }

    public static File a(Context context, String str) {
        return new File(j(context) + "/apminsight/CrashCommonLog/" + str);
    }

    public static File b(String str) {
        return new File(a(com.apm.insight.e.g(), str), "fds.txt");
    }

    public static File e(File file) {
        return new File(file, "callback.json");
    }

    public static String a(String str) {
        return "dart_".concat(String.valueOf(str));
    }

    public static File d(File file) {
        return new File(a(com.apm.insight.e.g(), file.getName()), "maps.txt");
    }

    public static File e(String str) {
        return new File(a(com.apm.insight.e.g(), str), "pthreads.txt");
    }

    public static File a(File file, String str) {
        return new File(file, file.getName() + str);
    }

    public static File d(String str) {
        return new File(a(com.apm.insight.e.g(), str), "meminfo.txt");
    }

    public static File a(File file) {
        return new File(file, "flog.txt");
    }

    public static File c(File file) {
        return new File(file, "header.bin");
    }

    public static File c(String str) {
        return new File(a(com.apm.insight.e.g(), str), "threads.txt");
    }
}
