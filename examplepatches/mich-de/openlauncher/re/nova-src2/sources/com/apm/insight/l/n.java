package com.apm.insight.l;

import android.os.Environment;
import android.os.StatFs;
import java.io.File;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public final class n {
    public static JSONObject a() {
        JSONObject jSONObject = new JSONObject();
        try {
            jSONObject.put("inner_free", b());
            jSONObject.put("inner_total", c());
            jSONObject.put("sdcard_free", f());
            jSONObject.put("sdcard_total", g());
            jSONObject.put("inner_free_real", d());
            jSONObject.put("inner_total_real", e());
        } catch (Throwable unused) {
        }
        return jSONObject;
    }

    private static long b() {
        try {
            return b(Environment.getRootDirectory());
        } catch (Throwable unused) {
            return 0L;
        }
    }

    private static long c() {
        try {
            return a(Environment.getRootDirectory());
        } catch (Throwable unused) {
            return 0L;
        }
    }

    private static long d() {
        try {
            return b(com.apm.insight.e.g().getFilesDir());
        } catch (Throwable unused) {
            return 0L;
        }
    }

    private static long e() {
        try {
            return a(com.apm.insight.e.g().getFilesDir());
        } catch (Throwable unused) {
            return 0L;
        }
    }

    private static long f() {
        try {
            if (h()) {
                return Environment.getExternalStorageDirectory().getFreeSpace();
            }
            return 0L;
        } catch (Throwable unused) {
            return 0L;
        }
    }

    private static long g() {
        try {
            if (h()) {
                return Environment.getExternalStorageDirectory().getTotalSpace();
            }
            return 0L;
        } catch (Throwable unused) {
            return 0L;
        }
    }

    private static boolean h() {
        return "mounted".equals(Environment.getExternalStorageState());
    }

    private static long b(File file) {
        try {
            return new StatFs(file.getPath()).getFreeBytes();
        } catch (Throwable unused) {
            return 0L;
        }
    }

    private static long a(File file) {
        try {
            return new StatFs(file.getPath()).getTotalBytes();
        } catch (Throwable unused) {
            return 0L;
        }
    }
}
