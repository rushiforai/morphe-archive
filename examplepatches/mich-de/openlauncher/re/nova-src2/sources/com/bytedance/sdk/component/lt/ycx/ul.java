package com.bytedance.sdk.component.lt.ycx;

import android.content.Context;
import java.util.List;
import java.util.Map;
import java.util.concurrent.atomic.AtomicBoolean;

/* loaded from: classes2.dex */
public class ul {

    /* renamed from: jw, reason: collision with root package name */
    private static volatile com.bytedance.sdk.component.lt.ycx.lud.ycx f23854jw;

    /* renamed from: ok, reason: collision with root package name */
    private static ul f23855ok;

    /* renamed from: dj, reason: collision with root package name */
    private volatile com.bytedance.sdk.component.lt.ycx.dj.zb.ycx f23856dj;

    /* renamed from: ea, reason: collision with root package name */
    private volatile Map<Integer, com.bytedance.sdk.component.lt.ycx.zb.sya> f23857ea;
    private volatile lud fby;

    /* renamed from: jc, reason: collision with root package name */
    private volatile com.bytedance.sdk.component.lt.ycx.zb.sya f23858jc;

    /* renamed from: lt, reason: collision with root package name */
    private volatile com.bytedance.sdk.component.lt.ycx.dj.zb.ycx f23859lt;
    private volatile com.bytedance.sdk.component.lt.ycx.dj.zb.ycx lud;

    /* renamed from: ry, reason: collision with root package name */
    private final AtomicBoolean f23860ry = new AtomicBoolean(false);
    private volatile com.bytedance.sdk.component.lt.ycx.dj.zb.ycx sya;

    /* renamed from: ul, reason: collision with root package name */
    private volatile com.bytedance.sdk.component.lt.ycx.ycx.lud f23861ul;
    private long xkz;
    private volatile Context ycx;

    /* renamed from: zb, reason: collision with root package name */
    private volatile com.bytedance.sdk.component.lt.ycx.dj.zb.ycx f23862zb;

    private ul() {
    }

    public static com.bytedance.sdk.component.lt.ycx.lud.ycx dj() {
        if (f23854jw == null) {
            synchronized (ul.class) {
                try {
                    if (f23854jw == null) {
                        f23854jw = new com.bytedance.sdk.component.lt.ycx.lud.zb();
                    }
                } catch (Throwable th2) {
                    throw th2;
                }
            }
        }
        return f23854jw;
    }

    public static synchronized ul lt() {
        try {
            if (f23855ok == null) {
                f23855ok = new ul();
            }
        } catch (Throwable th2) {
            throw th2;
        }
        return f23855ok;
    }

    public long dy() {
        return this.xkz * 86400000;
    }

    public com.bytedance.sdk.component.lt.ycx.dj.zb.ycx ea() {
        return this.f23862zb;
    }

    public void fby() {
        com.bytedance.sdk.component.lt.ycx.zb.dj.ycx.zb();
    }

    public void jc() {
        com.bytedance.sdk.component.lt.ycx.zb.dj.ycx.sya();
    }

    public com.bytedance.sdk.component.lt.ycx.dj.zb.ycx jw() {
        return this.f23859lt;
    }

    public Context lud() {
        return this.ycx;
    }

    public com.bytedance.sdk.component.lt.ycx.dj.zb.ycx ok() {
        return this.sya;
    }

    public com.bytedance.sdk.component.lt.ycx.dj.zb.ycx ry() {
        return this.f23856dj;
    }

    public com.bytedance.sdk.component.lt.ycx.ycx.lud sya() {
        return this.f23861ul;
    }

    public lud syc() {
        return this.fby;
    }

    public com.bytedance.sdk.component.lt.ycx.zb.sya ul() {
        return this.f23858jc;
    }

    public com.bytedance.sdk.component.lt.ycx.dj.zb.ycx xkz() {
        return this.lud;
    }

    public boolean ycx() {
        return this.f23860ry.get();
    }

    public Map<Integer, com.bytedance.sdk.component.lt.ycx.zb.sya> zb() {
        return this.f23857ea;
    }

    public void lud(com.bytedance.sdk.component.lt.ycx.dj.zb.ycx ycxVar) {
        this.lud = ycxVar;
    }

    public void sya(com.bytedance.sdk.component.lt.ycx.dj.zb.ycx ycxVar) {
        this.sya = ycxVar;
    }

    public void ycx(boolean z11) {
        this.f23860ry.set(z11);
    }

    public void zb(com.bytedance.sdk.component.lt.ycx.dj.zb.ycx ycxVar) {
        this.f23862zb = ycxVar;
    }

    public void ycx(com.bytedance.sdk.component.lt.ycx.ycx.lud ludVar) {
        this.f23861ul = ludVar;
    }

    public void ycx(Context context) {
        this.ycx = context;
    }

    public void ycx(com.bytedance.sdk.component.lt.ycx.zb.sya syaVar) {
        this.f23858jc = syaVar;
    }

    public void ycx(com.bytedance.sdk.component.lt.ycx.dj.zb.ycx ycxVar) {
        this.f23859lt = ycxVar;
    }

    public void dj(com.bytedance.sdk.component.lt.ycx.dj.zb.ycx ycxVar) {
        this.f23856dj = ycxVar;
    }

    public void ycx(com.bytedance.sdk.component.lt.ycx.dj.ycx ycxVar) {
        if (ycxVar == null) {
            return;
        }
        ycxVar.ycx(System.currentTimeMillis());
        com.bytedance.sdk.component.lt.ycx.zb.dj.ycx.ycx(ycxVar, ycxVar.dj());
    }

    public void ycx(String str, boolean z11) {
        com.bytedance.sdk.component.lt.ycx.lt.ycx.ycx().ycx(str, z11);
    }

    public void ycx(String str, List<String> list, boolean z11, Map<String, String> map, int i5, String str2) {
        com.bytedance.sdk.component.lt.ycx.lt.ycx.ycx().ycx(str, list, z11, map, i5, str2);
    }

    public void ycx(lud ludVar) {
        this.fby = ludVar;
    }

    public void ycx(long j11) {
        this.xkz = j11;
    }
}
