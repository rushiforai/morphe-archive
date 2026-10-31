package com.bytedance.sdk.openadsdk.core.jw;

import android.os.Handler;
import android.os.Looper;
import com.bytedance.sdk.openadsdk.core.pmi;
import com.bytedance.sdk.openadsdk.core.settings.ea;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.Queue;

/* loaded from: classes2.dex */
public class ycx {
    private static volatile long sya;
    private static volatile ycx ycx;

    /* renamed from: zb, reason: collision with root package name */
    private static volatile boolean f25536zb;

    /* renamed from: dj, reason: collision with root package name */
    private final Queue<C0066ycx> f25537dj = new LinkedList();

    /* renamed from: lt, reason: collision with root package name */
    private final ea f25538lt = pmi.dj();
    private Handler lud;

    /* renamed from: com.bytedance.sdk.openadsdk.core.jw.ycx$ycx, reason: collision with other inner class name */
    public static class C0066ycx {
        private final long ycx;

        /* renamed from: zb, reason: collision with root package name */
        private final String f25539zb;

        private C0066ycx(long j11, String str) {
            this.ycx = j11;
            this.f25539zb = str;
        }
    }

    private ycx() {
    }

    private synchronized boolean zb(String str) {
        long jCurrentTimeMillis = System.currentTimeMillis();
        int iAeu = this.f25538lt.aeu();
        long jRmf = this.f25538lt.rmf();
        if (this.f25537dj.size() <= 0 || this.f25537dj.size() < iAeu) {
            this.f25537dj.offer(new C0066ycx(jCurrentTimeMillis, str));
        } else {
            long jAbs = Math.abs(jCurrentTimeMillis - this.f25537dj.peek().ycx);
            if (jAbs <= jRmf) {
                zb(jRmf - jAbs);
                return true;
            }
            this.f25537dj.poll();
            this.f25537dj.offer(new C0066ycx(jCurrentTimeMillis, str));
        }
        return false;
    }

    public synchronized String sya() {
        String str;
        try {
            HashMap map = new HashMap();
            for (C0066ycx c0066ycx : this.f25537dj) {
                if (map.containsKey(c0066ycx.f25539zb)) {
                    map.put(c0066ycx.f25539zb, Integer.valueOf(((Integer) map.get(c0066ycx.f25539zb)).intValue() + 1));
                } else {
                    map.put(c0066ycx.f25539zb, 1);
                }
            }
            str = b.f42142b;
            int i5 = Integer.MIN_VALUE;
            for (String str2 : map.keySet()) {
                int iIntValue = ((Integer) map.get(str2)).intValue();
                if (i5 < iIntValue) {
                    str = str2;
                    i5 = iIntValue;
                }
            }
        } catch (Throwable th2) {
            throw th2;
        }
        return str;
    }

    public static ycx ycx() {
        if (ycx == null) {
            synchronized (ycx.class) {
                try {
                    if (ycx == null) {
                        ycx = new ycx();
                    }
                } catch (Throwable th2) {
                    throw th2;
                }
            }
        }
        return ycx;
    }

    public synchronized boolean ycx(String str) {
        try {
            if (zb(str)) {
                ycx(true);
                ycx(sya);
            } else {
                ycx(false);
            }
        } catch (Throwable th2) {
            throw th2;
        }
        return f25536zb;
    }

    private synchronized void ycx(long j11) {
        try {
            if (this.lud == null) {
                this.lud = new Handler(Looper.getMainLooper());
            }
            this.lud.postDelayed(new Runnable() { // from class: com.bytedance.sdk.openadsdk.core.jw.ycx.1
                @Override // java.lang.Runnable
                public void run() {
                    ycx.this.ycx(false);
                }
            }, j11);
        } catch (Throwable th2) {
            throw th2;
        }
    }

    public synchronized boolean zb() {
        return f25536zb;
    }

    private synchronized void zb(long j11) {
        sya = j11;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public synchronized void ycx(boolean z11) {
        f25536zb = z11;
    }
}
