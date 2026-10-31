package com.bytedance.sdk.openadsdk.utils;

import android.text.TextUtils;
import com.vungle.ads.internal.protos.Sdk;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.FilenameFilter;
import java.io.IOException;
import java.util.regex.Pattern;

/* loaded from: classes2.dex */
public class jc {

    /* renamed from: com.bytedance.sdk.openadsdk.utils.jc$1, reason: invalid class name */
    public static class AnonymousClass1 implements FilenameFilter {
        private final Pattern ycx = Pattern.compile("^cpu[0-9]+$");

        @Override // java.io.FilenameFilter
        public boolean accept(File file, String str) {
            return this.ycx.matcher(str).matches();
        }
    }

    public static int dj() {
        return com.bytedance.sdk.openadsdk.core.sya.ycx().zb("cpu_min_frequency", 0);
    }

    public static int sya() {
        return com.bytedance.sdk.openadsdk.core.sya.ycx().zb("cpu_max_frequency", 0);
    }

    public static int ycx() {
        return Math.max(Runtime.getRuntime().availableProcessors(), 0);
    }

    public static int zb() {
        return com.bytedance.sdk.openadsdk.core.sya.ycx().zb("cpu_count", 0);
    }

    /* JADX WARN: Removed duplicated region for block: B:31:0x0073 A[Catch: Exception -> 0x006f, DONT_GENERATE, TRY_LEAVE, TryCatch #0 {Exception -> 0x006f, blocks: (B:27:0x006b, B:31:0x0073), top: B:46:0x006b }] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static int ycx(int i5) throws IOException {
        BufferedReader bufferedReader;
        Throwable th2;
        FileReader fileReader;
        BufferedReader bufferedReader2;
        int i11;
        int i12 = 0;
        FileReader fileReader2 = null;
        BufferedReader bufferedReader3 = null;
        while (true) {
            i5--;
            if (i5 < 0) {
                return i12;
            }
            try {
                fileReader = new FileReader("/sys/devices/system/cpu/cpu" + i5 + "/cpufreq/cpuinfo_max_freq");
                try {
                    bufferedReader2 = new BufferedReader(fileReader);
                } catch (Throwable th3) {
                    BufferedReader bufferedReader4 = bufferedReader3;
                    th2 = th3;
                    fileReader2 = fileReader;
                    bufferedReader = bufferedReader4;
                }
            } catch (Throwable th4) {
                bufferedReader = bufferedReader3;
                th2 = th4;
            }
            try {
                String line = bufferedReader2.readLine();
                if (!TextUtils.isEmpty(line) && (i11 = Integer.parseInt(line)) > i12) {
                    i12 = i11;
                }
                try {
                    bufferedReader2.close();
                    fileReader.close();
                } catch (Exception e3) {
                    com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE5kFqSRI", "eP44oBe1ZdQ=", "XOs5thOpRMaYbMVYnQ==", 101);
                }
                bufferedReader3 = bufferedReader2;
                fileReader2 = fileReader;
            } catch (Throwable th5) {
                th2 = th5;
                bufferedReader = bufferedReader2;
                fileReader2 = fileReader;
                try {
                    com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE5kFqSRI", "eP44oBe1ZdQ=", "XOs5thOpRMaYbMVYnQ==", 91);
                    com.bytedance.sdk.component.utils.htf.sya("CpuUtils", th2.getMessage());
                    if (bufferedReader != null) {
                        try {
                        } catch (Exception e11) {
                            bufferedReader3 = bufferedReader;
                        }
                        bufferedReader3 = bufferedReader;
                    } else {
                        bufferedReader3 = bufferedReader;
                    }
                } finally {
                    if (bufferedReader != null) {
                        try {
                            bufferedReader.close();
                        } catch (Exception e112) {
                            com.bytedance.sdk.openadsdk.oty.sya.ycx(e112, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE5kFqSRI", "eP44oBe1ZdQ=", "XOs5thOpRMaYbMVYnQ==", 101);
                        }
                    }
                    if (fileReader2 != null) {
                        fileReader2.close();
                    }
                }
            }
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:33:0x0076 A[Catch: Exception -> 0x0072, DONT_GENERATE, TRY_LEAVE, TryCatch #5 {Exception -> 0x0072, blocks: (B:29:0x006e, B:33:0x0076), top: B:58:0x006e }] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static int zb(int i5) throws IOException {
        BufferedReader bufferedReader;
        Throwable th2;
        int i11;
        int i12 = 0;
        FileReader fileReader = null;
        BufferedReader bufferedReader2 = null;
        while (true) {
            i5--;
            if (i5 < 0) {
                return i12;
            }
            try {
                FileReader fileReader2 = new FileReader("/sys/devices/system/cpu/cpu" + i5 + "/cpufreq/cpuinfo_min_freq");
                try {
                    BufferedReader bufferedReader3 = new BufferedReader(fileReader2);
                    try {
                        String line = bufferedReader3.readLine();
                        if (!TextUtils.isEmpty(line) && ((i11 = Integer.parseInt(line)) < i12 || i12 == 0)) {
                            i12 = i11;
                        }
                        try {
                            bufferedReader3.close();
                            fileReader2.close();
                        } catch (Exception e3) {
                            com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE5kFqSRI", "eP44oBe1ZdQ=", "XOs5thOpRM6ObMVYnQ==", 140);
                        }
                        bufferedReader2 = bufferedReader3;
                        fileReader = fileReader2;
                    } catch (Throwable th3) {
                        th2 = th3;
                        bufferedReader = bufferedReader3;
                        fileReader = fileReader2;
                        try {
                            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE5kFqSRI", "eP44oBe1ZdQ=", "XOs5thOpRM6ObMVYnQ==", Sdk.SDKError.Reason.MRAID_DOWNLOAD_JS_ERROR_VALUE);
                            com.bytedance.sdk.component.utils.htf.sya("CpuUtils", th2.getMessage());
                            if (bufferedReader != null) {
                                try {
                                } catch (Exception e11) {
                                    bufferedReader2 = bufferedReader;
                                }
                                bufferedReader2 = bufferedReader;
                            } else {
                                bufferedReader2 = bufferedReader;
                            }
                        } finally {
                            if (bufferedReader != null) {
                                try {
                                    bufferedReader.close();
                                } catch (Exception e112) {
                                    com.bytedance.sdk.openadsdk.oty.sya.ycx(e112, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE5kFqSRI", "eP44oBe1ZdQ=", "XOs5thOpRM6ObMVYnQ==", 140);
                                }
                            }
                            if (fileReader != null) {
                                fileReader.close();
                            }
                        }
                    }
                } catch (Throwable th4) {
                    BufferedReader bufferedReader4 = bufferedReader2;
                    th2 = th4;
                    fileReader = fileReader2;
                    bufferedReader = bufferedReader4;
                }
            } catch (Throwable th5) {
                bufferedReader = bufferedReader2;
                th2 = th5;
            }
        }
    }
}
