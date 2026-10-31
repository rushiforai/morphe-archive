package com.bytedance.sdk.openadsdk.uh;

import android.content.Context;
import android.os.Build;
import android.os.Process;
import android.text.TextUtils;
import android.util.Log;
import android.webkit.WebView;
import com.bytedance.sdk.component.utils.htf;
import com.bytedance.sdk.component.utils.thx;
import com.bytedance.sdk.openadsdk.dv.lud;
import com.bytedance.sdk.openadsdk.oty.sya;
import com.instabridge.ai.tools.perapp.PerAppFeatureCatalog;
import com.vungle.ads.internal.protos.Sdk;
import java.io.File;
import java.io.IOException;
import java.io.RandomAccessFile;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.nio.channels.FileChannel;
import java.nio.channels.FileLock;
import java.nio.channels.spi.AbstractInterruptibleChannel;
import java.util.concurrent.atomic.AtomicBoolean;

/* loaded from: classes2.dex */
public class ycx {
    private static boolean ycx = true;

    /* renamed from: zb, reason: collision with root package name */
    private static final AtomicBoolean f27094zb = new AtomicBoolean(false);

    public static void ycx(Context context) {
        if (context != null && ycx && f27094zb.compareAndSet(false, true)) {
            try {
                if (Build.VERSION.SDK_INT >= 28) {
                    if (thx.ycx(context)) {
                        if (lud.ycx("webview_defend", false)) {
                            zb(context);
                            return;
                        }
                        return;
                    }
                    String strZb = thx.zb(context);
                    try {
                        if (TextUtils.isEmpty(strZb)) {
                            strZb = context.getPackageName() + Process.myPid();
                        }
                        WebView.setDataDirectorySuffix(strZb);
                        htf.ycx("TTAD.TTMultiInitHelper", "init: WebView.setDataDirectorySuffix with ".concat(String.valueOf(strZb)));
                    } catch (IllegalStateException e3) {
                        sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4EErDxS/j+a", "b9oAgA+oYO6OQ8N1iR2wLUk=", "UuAkgQ==", 68);
                        htf.ycx("TTAD.TTMultiInitHelper", "init: ", e3);
                        ycx(strZb);
                    } catch (Exception e11) {
                        sya.ycx(e11, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4EErDxS/j+a", "b9oAgA+oYO6OQ8N1iR2wLUk=", "UuAkgQ==", 72);
                        htf.ycx("TTAD.TTMultiInitHelper", "init: ", e11);
                    }
                }
            } catch (Throwable th2) {
                sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4EErDxS/j+a", "b9oAgA+oYO6OQ8N1iR2wLUk=", "UuAkgQ==", 77);
                htf.ycx("TTAD.TTMultiInitHelper", "init: ", th2);
            }
        }
    }

    /* JADX WARN: Not initialized variable reg: 7, insn: 0x0050: MOVE (r5 I:??[OBJECT, ARRAY]) = (r7 I:??[OBJECT, ARRAY]), block:B:15:0x0050 */
    private static void zb(Context context) throws Throwable {
        RandomAccessFile randomAccessFile;
        FileChannel channel;
        Exception e3;
        AbstractInterruptibleChannel abstractInterruptibleChannel;
        String strZb = zb();
        File file = new File(context.getDir(TextUtils.isEmpty(strZb) ? "webview" : "webview_".concat(String.valueOf(strZb)), 0).getPath(), "webview_data.lock");
        file.getAbsolutePath();
        if (file.exists()) {
            AbstractInterruptibleChannel abstractInterruptibleChannel2 = null;
            FileLock fileLockTryLock = null;
            abstractInterruptibleChannel2 = null;
            try {
                try {
                    randomAccessFile = new RandomAccessFile(file, "rw");
                } catch (Throwable th2) {
                    th = th2;
                    abstractInterruptibleChannel2 = abstractInterruptibleChannel;
                }
            } catch (Exception e11) {
                channel = null;
                e3 = e11;
                randomAccessFile = null;
            } catch (Throwable th3) {
                th = th3;
                randomAccessFile = null;
            }
            try {
                channel = randomAccessFile.getChannel();
                if (channel != null) {
                    try {
                        fileLockTryLock = channel.tryLock();
                    } catch (Exception e12) {
                        e3 = e12;
                        sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4EErDxS/j+a", "b9oAgA+oYO6OQ8N1iR2wLUk=", "WOYolgiLbMW2Q9JKqBC0KXfhLp4=", PerAppFeatureCatalog.MAX_TOOLS);
                        ycx(file);
                        if (channel != null) {
                            try {
                                channel.close();
                            } catch (Throwable th4) {
                                sya.ycx(th4, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4EErDxS/j+a", "b9oAgA+oYO6OQ8N1iR2wLUk=", "WOYolgiLbMW2Q9JKqBC0KXfhLp4=", 157);
                                th4.getMessage();
                            }
                        }
                        if (randomAccessFile == null) {
                            return;
                        }
                        randomAccessFile.close();
                    }
                }
                if (fileLockTryLock != null) {
                    fileLockTryLock.close();
                } else {
                    ycx(file);
                }
                if (channel != null) {
                    try {
                        channel.close();
                    } catch (Throwable th5) {
                        sya.ycx(th5, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4EErDxS/j+a", "b9oAgA+oYO6OQ8N1iR2wLUk=", "WOYolgiLbMW2Q9JKqBC0KXfhLp4=", 157);
                        th5.getMessage();
                    }
                }
            } catch (Exception e13) {
                channel = null;
                e3 = e13;
            } catch (Throwable th6) {
                th = th6;
                if (abstractInterruptibleChannel2 != null) {
                    try {
                        abstractInterruptibleChannel2.close();
                    } catch (Throwable th7) {
                        sya.ycx(th7, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4EErDxS/j+a", "b9oAgA+oYO6OQ8N1iR2wLUk=", "WOYolgiLbMW2Q9JKqBC0KXfhLp4=", 157);
                        th7.getMessage();
                    }
                }
                if (randomAccessFile == null) {
                    throw th;
                }
                try {
                    randomAccessFile.close();
                    throw th;
                } catch (Throwable th8) {
                    sya.ycx(th8, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4EErDxS/j+a", "b9oAgA+oYO6OQ8N1iR2wLUk=", "WOYolgiLbMW2Q9JKqBC0KXfhLp4=", 164);
                    th8.getMessage();
                    throw th;
                }
            }
            try {
                randomAccessFile.close();
            } catch (Throwable th9) {
                sya.ycx(th9, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4EErDxS/j+a", "b9oAgA+oYO6OQ8N1iR2wLUk=", "WOYolgiLbMW2Q9JKqBC0KXfhLp4=", 164);
                th9.getMessage();
            }
        }
    }

    public static void ycx() {
        ycx = false;
    }

    private static void ycx(String str) {
        try {
            Method declaredMethod = Class.class.getDeclaredMethod("forName", String.class);
            Method declaredMethod2 = Class.class.getDeclaredMethod("getDeclaredField", String.class);
            declaredMethod2.setAccessible(true);
            Class cls = (Class) declaredMethod.invoke(null, "android.webkit.WebViewFactory");
            Field field = (Field) declaredMethod2.invoke(cls, "sDataDirectorySuffix");
            field.setAccessible(true);
            if (TextUtils.isEmpty((String) field.get(cls))) {
                field.set(cls, str);
            }
        } catch (Throwable th2) {
            sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4EErDxS/j+a", "b9oAgA+oYO6OQ8N1iR2wLUk=", "T/w0pgaoTcaUS/NUnhSjPFT8NKYWum/OmA==", 111);
            Log.e("TTAD.TTMultiInitHelper", "trySetDataDirectorySuffix: ", th2);
        }
    }

    private static String zb() {
        try {
            Method declaredMethod = Class.class.getDeclaredMethod("forName", String.class);
            Method declaredMethod2 = Class.class.getDeclaredMethod("getDeclaredField", String.class);
            declaredMethod2.setAccessible(true);
            Class cls = (Class) declaredMethod.invoke(null, "android.webkit.WebViewFactory");
            return (String) ((Field) declaredMethod2.invoke(cls, "sDataDirectorySuffix")).get(cls);
        } catch (Throwable th2) {
            sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4EErDxS/j+a", "b9oAgA+oYO6OQ8N1iR2wLUk=", "T/w0sgaoRMaJRPNUniK1Ll3nNQ==", Sdk.SDKError.Reason.PLACEMENT_AD_TYPE_MISMATCH_VALUE);
            return null;
        }
    }

    private static void ycx(File file) throws IOException {
        ycx(file, file.exists() ? file.delete() : false);
    }

    private static void ycx(File file, boolean z11) throws IOException {
        if (!z11 || file.exists()) {
            return;
        }
        try {
            file.createNewFile();
        } catch (IOException e3) {
            sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4EErDxS/j+a", "b9oAgA+oYO6OQ8N1iR2wLUk=", "T/w0thG5aNOFZthehzepJF4=", 188);
            htf.sya("TTAD.TTMultiInitHelper", e3.getMessage());
        }
    }
}
