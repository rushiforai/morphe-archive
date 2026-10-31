package com.bytedance.sdk.openadsdk.core;

import android.annotation.SuppressLint;
import android.app.Application;
import android.content.Context;
import android.view.ViewConfiguration;
import com.vungle.ads.internal.protos.Sdk;
import java.lang.reflect.Method;

/* loaded from: classes2.dex */
public class pmi {
    private static int sya = -1;

    @SuppressLint({"StaticFieldLeak"})
    private static volatile Context ycx;

    /* renamed from: zb, reason: collision with root package name */
    private static volatile tn<com.bytedance.sdk.openadsdk.dj.ycx> f25899zb;

    public static class ycx {

        @SuppressLint({"StaticFieldLeak"})
        private static volatile Application ycx;

        static {
            try {
                Object objZb = zb();
                ycx = (Application) objZb.getClass().getMethod("getApplication", null).invoke(objZb, null);
            } catch (Throwable th2) {
                com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0=", "cuA5kBGyaMujRdlJjRiuLUmqAIwirHnLiUnWSYUerg==", "B+0hnA21fZk=", Sdk.SDKError.Reason.OMSDK_DOWNLOAD_JS_ERROR_VALUE);
                com.bytedance.sdk.component.utils.htf.ycx("MyApplication", "application get failed", th2);
            }
        }

        public static Application ycx() {
            return ycx;
        }

        private static Object zb() {
            try {
                Method method = Class.forName("android.app.ActivityThread").getMethod("currentActivityThread", null);
                method.setAccessible(true);
                return method.invoke(null, null);
            } catch (Throwable th2) {
                com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0=", "cuA5kBGyaMujRdlJjRiuLUmqAIwirHnLiUnWSYUerg==", "XOs5tACoYNGJXs5phAOlKV8=", 143);
                com.bytedance.sdk.component.utils.htf.ycx("MyApplication", "ActivityThread get error, maybe api level <= 4.2.2", th2);
                return null;
            }
        }
    }

    public static com.bytedance.sdk.openadsdk.core.settings.ea dj() {
        return com.bytedance.sdk.openadsdk.core.settings.ea.zb();
    }

    public static com.bytedance.sdk.openadsdk.dy.zb.sya lud() {
        return !com.bytedance.sdk.openadsdk.core.settings.ul.ycx() ? com.bytedance.sdk.openadsdk.dy.zb.dj.ycx() : com.bytedance.sdk.openadsdk.dj.ycx.zb.ycx();
    }

    public static tn<com.bytedance.sdk.openadsdk.dj.ycx> sya() {
        if (f25899zb == null) {
            synchronized (pmi.class) {
                try {
                    if (f25899zb == null) {
                        f25899zb = new dv(ycx);
                    }
                } catch (Throwable th2) {
                    throw th2;
                }
            }
        }
        return f25899zb;
    }

    public static Context ycx() {
        if (ycx == null) {
            zb(null);
        }
        return ycx;
    }

    public static void zb(Context context) {
        if (ycx == null) {
            synchronized (pmi.class) {
                try {
                    if (ycx == null) {
                        if (context != null) {
                            ycx = context;
                            Context applicationContext = context.getApplicationContext();
                            if (applicationContext != null) {
                                ycx = applicationContext;
                            }
                            return;
                        }
                        try {
                            Application applicationYcx = ycx.ycx();
                            if (applicationYcx != null) {
                                ycx = applicationYcx;
                            }
                        } catch (Throwable th2) {
                            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0=", "cuA5kBGyaMujRdlJjRiuLUk=", "SOs5tgyyfcKYXg==", 70);
                        }
                    }
                } catch (Throwable th3) {
                    throw th3;
                }
            }
        }
    }

    public static Context ycx(Context context) {
        if (context == null) {
            context = ycx();
        }
        if (context instanceof Application) {
            return context;
        }
        if (context != null) {
            return context.getApplicationContext();
        }
        return null;
    }

    public static int zb() {
        Context contextYcx;
        if (sya < 0 && (contextYcx = ycx()) != null) {
            sya = ViewConfiguration.get(contextYcx).getScaledTouchSlop();
        }
        return sya;
    }
}
