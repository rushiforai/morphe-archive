package com.bytedance.sdk.component;

import android.os.Handler;
import android.os.HandlerThread;
import android.os.Looper;
import android.os.Message;
import com.bytedance.sdk.component.zb;
import com.instabridge.ai.tools.perapp.PerAppFeatureCatalog;
import java.util.Iterator;
import java.util.LinkedList;

/* loaded from: classes2.dex */
public class sya {

    /* renamed from: zb, reason: collision with root package name */
    private static volatile Handler f24057zb;
    private static final Object ycx = new Object();
    private static final LinkedList<Runnable> sya = new LinkedList<>();

    /* renamed from: dj, reason: collision with root package name */
    private static Object f24056dj = new Object();

    public static class ycx extends Handler {
        public ycx(Looper looper) {
            super(looper);
        }

        @Override // android.os.Handler
        public void handleMessage(Message message) {
            if (message.what == 1) {
                try {
                    sya.sya();
                } catch (OutOfMemoryError e3) {
                    com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTD", "b9ocgAapbMO3RcVWyCC1LU7rKaIMrmLvgUTTUYkD", "U+8jkQ+5RMKTWdZaiQ==", PerAppFeatureCatalog.MAX_TOOLS);
                }
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static void sya() {
        LinkedList linkedList;
        synchronized (f24056dj) {
            try {
                synchronized (ycx) {
                    LinkedList<Runnable> linkedList2 = sya;
                    linkedList = (LinkedList) linkedList2.clone();
                    linkedList2.clear();
                    zb().removeMessages(1);
                }
                if (linkedList.size() > 0) {
                    Iterator it = linkedList.iterator();
                    while (it.hasNext()) {
                        ((Runnable) it.next()).run();
                    }
                }
            } catch (Throwable th2) {
                throw th2;
            }
        }
    }

    private static Handler zb() {
        Handler handler;
        if (f24057zb != null) {
            return f24057zb;
        }
        synchronized (ycx) {
            try {
                if (f24057zb == null) {
                    zb.ycx ycxVar = zb.ycx;
                    HandlerThread handlerThreadYcx = ycxVar != null ? ycxVar.ycx("queued-work-looper", -2) : null;
                    if (handlerThreadYcx == null) {
                        handlerThreadYcx = new HandlerThread("queued-work-looper", -2);
                        handlerThreadYcx.start();
                    }
                    f24057zb = new ycx(handlerThreadYcx.getLooper());
                }
                handler = f24057zb;
            } catch (Throwable th2) {
                throw th2;
            }
        }
        return handler;
    }

    public static void ycx(Runnable runnable, boolean z11) {
        try {
            Handler handlerZb = zb();
            synchronized (ycx) {
                try {
                    sya.add(runnable);
                    if (z11) {
                        handlerZb.sendEmptyMessageDelayed(1, 100L);
                    } else {
                        handlerZb.sendEmptyMessage(1);
                    }
                } finally {
                }
            }
        } catch (OutOfMemoryError e3) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTD", "b9ocgAapbMO3RcVW", "SvsogAY=", 74);
        }
    }
}
