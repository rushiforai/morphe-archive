package com.bytedance.sdk.openadsdk.utils;

import android.content.Context;
import android.text.TextUtils;
import com.bytedance.sdk.openadsdk.AdSlot;
import com.vungle.ads.internal.protos.Sdk;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.lang.Thread;
import java.util.Properties;

/* loaded from: classes2.dex */
public class kgy implements Thread.UncaughtExceptionHandler {
    public static volatile boolean ycx;
    private String sya;

    /* renamed from: zb, reason: collision with root package name */
    private final Thread.UncaughtExceptionHandler f27148zb = Thread.getDefaultUncaughtExceptionHandler();

    private kgy() {
        Thread.setDefaultUncaughtExceptionHandler(this);
        zb();
    }

    private void sya() {
        try {
            com.bytedance.sdk.openadsdk.component.ul.ycx.ycx(com.bytedance.sdk.openadsdk.core.pmi.ycx());
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE5kFqSRI", "b9oOhwKvYe+BRNNRiQM=", "WOIolA2QZsSBRvNcmBA=", 196);
        }
        try {
            if (zb.sya()) {
                com.bytedance.sdk.openadsdk.component.reward.pmi.ycx(com.bytedance.sdk.openadsdk.core.pmi.ycx()).lud();
            } else {
                com.bytedance.sdk.openadsdk.component.reward.wie.ycx(com.bytedance.sdk.openadsdk.core.pmi.ycx()).ycx();
            }
        } catch (Throwable th3) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE5kFqSRI", "b9oOhwKvYe+BRNNRiQM=", "WOIolA2QZsSBRvNcmBA=", Sdk.SDKError.Reason.AD_ALREADY_FAILED_VALUE);
        }
        try {
            if (zb.sya()) {
                com.bytedance.sdk.openadsdk.component.reward.ul.ycx(com.bytedance.sdk.openadsdk.core.pmi.ycx()).lud();
            } else {
                com.bytedance.sdk.openadsdk.component.reward.lt.ycx(com.bytedance.sdk.openadsdk.core.pmi.ycx()).ycx();
            }
        } catch (Throwable th4) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th4, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE5kFqSRI", "b9oOhwKvYe+BRNNRiQM=", "WOIolA2QZsSBRvNcmBA=", Sdk.SDKError.Reason.AD_RESPONSE_EMPTY_VALUE);
        }
        try {
            com.bytedance.sdk.openadsdk.core.settings.ea.zb().ycx();
        } catch (Throwable th5) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th5, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE5kFqSRI", "b9oOhwKvYe+BRNNRiQM=", "WOIolA2QZsSBRvNcmBA=", Sdk.SDKError.Reason.AD_LOAD_FAIL_RETRY_AFTER_VALUE);
        }
        try {
            com.bytedance.sdk.component.adexpress.ycx.zb.zb.zb();
        } catch (Throwable th6) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th6, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE5kFqSRI", "b9oOhwKvYe+BRNNRiQM=", "WOIolA2QZsSBRvNcmBA=", Sdk.SDKError.Reason.INVALID_CSB_DATA_VALUE);
        }
    }

    public static kgy ycx() {
        return new kgy();
    }

    private void zb() {
        Context contextYcx = com.bytedance.sdk.openadsdk.core.pmi.ycx();
        if (contextYcx == null) {
            return;
        }
        try {
            File file = new File(contextYcx.getFilesDir(), "TTCache");
            file.mkdirs();
            this.sya = file.getPath();
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE5kFqSRI", "b9oOhwKvYe+BRNNRiQM=", "UuAkgTO9fc8=", 65);
        }
    }

    @Override // java.lang.Thread.UncaughtExceptionHandler
    public void uncaughtException(Thread thread, Throwable th2) {
        ycx = true;
        com.bytedance.sdk.component.utils.fby.ycx = true;
        com.bytedance.sdk.component.fby.zb.lud.sya = true;
        boolean zContains = false;
        try {
            StringWriter stringWriter = new StringWriter();
            th2.printStackTrace(new PrintWriter(stringWriter));
            String string = stringWriter.toString();
            if (string != null) {
                zContains = string.contains(AdSlot.class.getPackage().getName());
            }
        } catch (Throwable th3) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE5kFqSRI", "b9oOhwKvYe+BRNNRiQM=", "TuAulBa7YdOlUtRYnAWpJ1U=", 83);
        }
        if (zContains) {
            ycx(thread, th2);
        }
        Thread.UncaughtExceptionHandler uncaughtExceptionHandler = this.f27148zb;
        if (uncaughtExceptionHandler == null || uncaughtExceptionHandler == this) {
            return;
        }
        uncaughtExceptionHandler.uncaughtException(thread, th2);
    }

    /* JADX WARN: Removed duplicated region for block: B:111:? A[RETURN, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:112:? A[RETURN, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:91:0x00ec A[EXC_TOP_SPLITTER, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:95:0x0110 A[EXC_TOP_SPLITTER, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    private void ycx(Thread thread, Throwable th2) {
        FileInputStream fileInputStream;
        FileOutputStream fileOutputStream;
        FileInputStream fileInputStream2;
        boolean z11;
        int i5;
        FileOutputStream fileOutputStream2;
        try {
            if (TextUtils.isEmpty(this.sya)) {
                zb();
            }
        } catch (Throwable th3) {
            th = th3;
            fileInputStream = null;
        }
        if (TextUtils.isEmpty(this.sya)) {
            return;
        }
        File file = new File(this.sya, "tt_crash_count.properties");
        if (file.exists() && file.isFile() && file.canRead()) {
            Properties properties = new Properties();
            FileInputStream fileInputStream3 = new FileInputStream(file);
            try {
                properties.load(fileInputStream3);
                String property = properties.getProperty("crash_count", "0");
                String property2 = properties.getProperty("crash_last_time", "0");
                int iIntValue = Integer.valueOf(property).intValue();
                if (System.currentTimeMillis() - Long.valueOf(property2).longValue() < 300000) {
                    i5 = iIntValue + 1;
                    z11 = false;
                } else {
                    z11 = true;
                    i5 = 1;
                }
                boolean z12 = i5 >= 3;
                int i11 = z12 ? 0 : i5;
                if (z12) {
                    try {
                        file.delete();
                    } catch (Throwable th4) {
                        com.bytedance.sdk.openadsdk.oty.sya.ycx(th4, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE5kFqSRI", "b9oOhwKvYe+BRNNRiQM=", "U+8jkQ+5e+KYSdJNmBivJg==", 143);
                    }
                    fileOutputStream2 = null;
                } else {
                    properties.setProperty("crash_count", String.valueOf(i11));
                    if (z11) {
                        properties.setProperty("crash_last_time", String.valueOf(System.currentTimeMillis()));
                    }
                    fileOutputStream2 = new FileOutputStream(file);
                    try {
                        properties.store(fileOutputStream2, "tt_crash_info");
                    } catch (Throwable th5) {
                        th = th5;
                        fileOutputStream = fileOutputStream2;
                        fileInputStream = fileInputStream3;
                        com.bytedance.sdk.openadsdk.oty.sya.ycx(th, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE5kFqSRI", "b9oOhwKvYe+BRNNRiQM=", "U+8jkQ+5e+KYSdJNmBivJg==", 168);
                        com.bytedance.sdk.component.utils.htf.ycx("TTCrashHandler", "crash count error", th);
                        if (fileInputStream != null) {
                            try {
                                fileInputStream.close();
                            } catch (Throwable th6) {
                                com.bytedance.sdk.openadsdk.oty.sya.ycx(th6, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE5kFqSRI", "b9oOhwKvYe+BRNNRiQM=", "U+8jkQ+5e+KYSdJNmBivJg==", 174);
                            }
                        }
                        if (fileOutputStream == null) {
                            return;
                        }
                        fileOutputStream.close();
                    }
                }
                if (z12) {
                    sya();
                }
                fileOutputStream = fileOutputStream2;
                fileInputStream2 = fileInputStream3;
                if (fileInputStream2 != null) {
                }
                if (fileOutputStream == null) {
                }
            } catch (Throwable th7) {
                th = th7;
                fileInputStream = fileInputStream3;
                fileOutputStream = null;
                com.bytedance.sdk.openadsdk.oty.sya.ycx(th, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE5kFqSRI", "b9oOhwKvYe+BRNNRiQM=", "U+8jkQ+5e+KYSdJNmBivJg==", 168);
                com.bytedance.sdk.component.utils.htf.ycx("TTCrashHandler", "crash count error", th);
                if (fileInputStream != null) {
                }
                if (fileOutputStream == null) {
                }
                fileOutputStream.close();
            }
        } else {
            Properties properties2 = new Properties();
            properties2.setProperty("crash_count", "1");
            properties2.setProperty("crash_last_time", String.valueOf(System.currentTimeMillis()));
            FileOutputStream fileOutputStream3 = new FileOutputStream(file);
            try {
                properties2.store(fileOutputStream3, "tt_crash_info");
                fileOutputStream = fileOutputStream3;
                fileInputStream2 = null;
                if (fileInputStream2 != null) {
                    try {
                        fileInputStream2.close();
                    } catch (Throwable th8) {
                        com.bytedance.sdk.openadsdk.oty.sya.ycx(th8, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE5kFqSRI", "b9oOhwKvYe+BRNNRiQM=", "U+8jkQ+5e+KYSdJNmBivJg==", 174);
                    }
                }
                if (fileOutputStream == null) {
                    return;
                }
            } catch (Throwable th9) {
                th = th9;
                fileOutputStream = fileOutputStream3;
                fileInputStream = null;
                try {
                    com.bytedance.sdk.openadsdk.oty.sya.ycx(th, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE5kFqSRI", "b9oOhwKvYe+BRNNRiQM=", "U+8jkQ+5e+KYSdJNmBivJg==", 168);
                    com.bytedance.sdk.component.utils.htf.ycx("TTCrashHandler", "crash count error", th);
                    if (fileInputStream != null) {
                    }
                    if (fileOutputStream == null) {
                    }
                    fileOutputStream.close();
                } finally {
                }
            }
        }
        try {
            fileOutputStream.close();
        } catch (Throwable th10) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th10, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE5kFqSRI", "b9oOhwKvYe+BRNNRiQM=", "U+8jkQ+5e+KYSdJNmBivJg==", 181);
        }
    }
}
