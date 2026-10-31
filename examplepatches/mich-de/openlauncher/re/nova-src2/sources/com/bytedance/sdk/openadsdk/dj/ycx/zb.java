package com.bytedance.sdk.openadsdk.dj.ycx;

import android.content.Context;
import com.bytedance.sdk.component.lt.ycx.ycx;
import com.bytedance.sdk.component.utils.htf;
import com.bytedance.sdk.openadsdk.core.pmi;
import com.bytedance.sdk.openadsdk.core.ry;
import java.util.Iterator;
import java.util.List;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.concurrent.atomic.AtomicInteger;
import vh.a;

/* loaded from: classes2.dex */
public class zb {
    public static final AtomicBoolean ycx = new AtomicBoolean(false);

    /* renamed from: zb, reason: collision with root package name */
    public static final AtomicBoolean f26763zb = new AtomicBoolean(false);
    public static AtomicInteger sya = new AtomicInteger(0);

    public static void sya() {
        try {
            com.bytedance.sdk.component.lt.ycx.zb.dj();
            com.bytedance.sdk.component.lt.ycx.zb.lud();
        } catch (Throwable th2) {
            htf.sya("AdLogSwitchUtils", th2.getMessage());
        }
        a.f92766b = false;
    }

    public static void ycx(Context context) {
        try {
            if (ycx.compareAndSet(false, true)) {
                com.bytedance.sdk.component.lt.ycx.zb.ycx(new ycx.C0039ycx().ycx(new lt()).zb(com.bytedance.sdk.openadsdk.dj.ycx.ycx.fby.zb()).sya(com.bytedance.sdk.openadsdk.dj.ycx.ycx.fby.sya()).ycx(com.bytedance.sdk.openadsdk.dj.ycx.ycx.fby.ycx()).ycx(new ul()).ycx(dj.ycx).zb(pmi.dj().ry()).ycx(pmi.dj().xkz()).ycx(pmi.dj().tx()).ycx(), context);
                zb();
            }
        } catch (Throwable unused) {
            ycx.set(false);
        }
        if (!f26763zb.compareAndSet(false, true) || com.bytedance.sdk.openadsdk.dj.ycx.ycx.lt.ycx() == 1) {
            return;
        }
        try {
            com.bytedance.sdk.openadsdk.dj.ycx.ycx.ul.ycx(context);
        } catch (Throwable unused2) {
            f26763zb.set(false);
        }
    }

    public static void zb() {
        com.bytedance.sdk.component.lt.ycx.zb.sya();
        a.f92766b = true;
    }

    public static void ycx(com.bytedance.sdk.openadsdk.dj.ycx ycxVar) {
        com.bytedance.sdk.component.lt.ycx.dj.ycx.ycx ycxVar2 = new com.bytedance.sdk.component.lt.ycx.dj.ycx.ycx(ycxVar.ul(), ycxVar);
        ycxVar2.sya(ycxVar.fby() ? (byte) 1 : (byte) 2);
        ycxVar2.zb((byte) 0);
        if (com.bytedance.sdk.component.lt.ycx.zb.zb()) {
            ycx(pmi.ycx());
        }
        int iYcx = com.bytedance.sdk.openadsdk.dj.ycx.ycx.lt.ycx();
        if (iYcx == 2) {
            com.bytedance.sdk.openadsdk.dj.ycx.ycx.ul.ycx(ycxVar);
        } else if (iYcx != 3) {
            com.bytedance.sdk.component.lt.ycx.zb.ycx(ycxVar2);
        } else {
            com.bytedance.sdk.component.lt.ycx.zb.ycx(ycxVar2);
            com.bytedance.sdk.openadsdk.dj.ycx.ycx.ul.ycx(ycxVar);
        }
    }

    public static com.bytedance.sdk.openadsdk.dy.zb.sya ycx() {
        return fby.ycx;
    }

    public static void ycx(final List<String> list, final int i5, final String str) {
        if (list == null || list.isEmpty()) {
            return;
        }
        com.bytedance.sdk.openadsdk.dj.sya.ycx(new com.bytedance.sdk.component.fby.zb.sya("track") { // from class: com.bytedance.sdk.openadsdk.dj.ycx.zb.1
            @Override // java.lang.Runnable
            public void run() {
                if (com.bytedance.sdk.component.lt.ycx.zb.zb()) {
                    zb.ycx(pmi.ycx());
                }
                if (!com.bytedance.sdk.openadsdk.dj.ycx.ycx.ul.ycx() || !com.bytedance.sdk.openadsdk.dj.ycx.ycx.sya.ycx().sya().f26757dj) {
                    com.bytedance.sdk.component.lt.ycx.zb.ycx(ry.ycx(pmi.ycx()), list, true, i5, str);
                    return;
                }
                Iterator it = list.iterator();
                while (it.hasNext()) {
                    com.bytedance.sdk.openadsdk.dj.ycx.ycx.ry ryVarYcx = com.bytedance.sdk.openadsdk.dj.ycx.ycx.ry.ycx((String) it.next(), true, i5, str);
                    if (ryVarYcx != null) {
                        com.bytedance.sdk.openadsdk.dj.ycx.ycx.ul.ycx(ryVarYcx);
                    }
                }
            }
        });
    }

    public static void ycx(String str) {
        ycx(str, false);
    }

    public static void ycx(String str, boolean z11) {
        if (com.bytedance.sdk.component.lt.ycx.zb.zb()) {
            ycx(pmi.ycx());
        }
        com.bytedance.sdk.component.lt.ycx.zb.ycx(str, z11);
    }
}
