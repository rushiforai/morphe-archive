package com.apm.insight.l;

import android.os.Build;
import android.text.TextUtils;
import java.io.BufferedReader;
import java.io.Closeable;
import java.io.File;
import java.io.FileInputStream;
import java.io.FilenameFilter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.Locale;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/* loaded from: classes2.dex */
public final class d {

    /* renamed from: a, reason: collision with root package name */
    private static boolean f21746a = false;

    /* renamed from: b, reason: collision with root package name */
    private static int f21747b = -1;

    /* renamed from: c, reason: collision with root package name */
    private static final Pattern f21748c = Pattern.compile("^0-([\\d]+)$");

    public static boolean a(String str) {
        if (TextUtils.isEmpty(str)) {
            str = b("ro.build.version.emui");
        }
        if (TextUtils.isEmpty(str) || !str.toLowerCase(Locale.getDefault()).startsWith("emotionui")) {
            return e();
        }
        return true;
    }

    private static String b(String str) {
        BufferedReader bufferedReader;
        String line = null;
        try {
            bufferedReader = new BufferedReader(new InputStreamReader(Runtime.getRuntime().exec("getprop ".concat(String.valueOf(str))).getInputStream()), 1024);
        } catch (Throwable unused) {
            bufferedReader = null;
        }
        try {
            line = bufferedReader.readLine();
            bufferedReader.close();
            com.apm.insight.a.a((Closeable) bufferedReader);
            return line;
        } catch (Throwable unused2) {
            com.apm.insight.a.a((Closeable) bufferedReader);
            return line;
        }
    }

    public static boolean c() {
        return Build.DISPLAY.contains("Flyme") || Build.USER.equals("flyme");
    }

    public static int d() throws IOException {
        int i5 = f21747b;
        if (i5 > 0) {
            return i5;
        }
        int iC = c("/sys/devices/system/cpu/possible");
        if (iC <= 0) {
            iC = c("/sys/devices/system/cpu/present");
        }
        if (iC <= 0) {
            iC = e("/sys/devices/system/cpu/");
        }
        if (iC <= 0) {
            iC = Runtime.getRuntime().availableProcessors();
        }
        if (iC <= 0) {
            iC = 1;
        }
        f21747b = iC;
        return iC;
    }

    private static boolean e() {
        try {
            String str = Build.BRAND;
            if (TextUtils.isEmpty(str) || !str.toLowerCase(Locale.getDefault()).startsWith("huawei")) {
                String str2 = Build.MANUFACTURER;
                if (TextUtils.isEmpty(str2)) {
                    return false;
                }
                if (!str2.toLowerCase(Locale.getDefault()).startsWith("huawei")) {
                    return false;
                }
            }
            return true;
        } catch (Throwable unused) {
            return false;
        }
    }

    private static int c(String str) throws IOException {
        BufferedReader bufferedReader;
        try {
            bufferedReader = new BufferedReader(new InputStreamReader(new FileInputStream(str)));
        } catch (Throwable unused) {
            bufferedReader = null;
        }
        try {
            String line = bufferedReader.readLine();
            if (line != null) {
                int iD = d(line);
                try {
                    bufferedReader.close();
                } catch (IOException unused2) {
                }
                return iD;
            }
        } catch (Throwable unused3) {
            if (bufferedReader == null) {
                return -1;
            }
            bufferedReader.close();
            return -1;
        }
        try {
            bufferedReader.close();
            return -1;
        } catch (IOException unused4) {
            return -1;
        }
    }

    private static int e(String str) {
        try {
            File[] fileArrListFiles = new File(str).listFiles(new FilenameFilter() { // from class: com.apm.insight.l.d.1

                /* renamed from: a, reason: collision with root package name */
                private final Pattern f21749a = Pattern.compile("^cpu[\\d]+$");

                @Override // java.io.FilenameFilter
                public final boolean accept(File file, String str2) {
                    return this.f21749a.matcher(str2).matches();
                }
            });
            if (fileArrListFiles == null || fileArrListFiles.length <= 0) {
                return -1;
            }
            return fileArrListFiles.length;
        } catch (Throwable unused) {
            return -1;
        }
    }

    public static String a() {
        return b("ro.build.version.emui");
    }

    public static boolean b() throws ClassNotFoundException {
        if (!f21746a) {
            try {
                Class.forName("miui.os.Build");
                com.apm.insight.k.e.f21700a = true;
                f21746a = true;
                return true;
            } catch (Exception unused) {
                f21746a = true;
            }
        }
        return com.apm.insight.k.e.f21700a;
    }

    private static int d(String str) {
        Matcher matcher = f21748c.matcher(str);
        if (!matcher.matches()) {
            return -1;
        }
        try {
            return Integer.parseInt(matcher.group(1)) + 1;
        } catch (NumberFormatException unused) {
            return -1;
        }
    }
}
