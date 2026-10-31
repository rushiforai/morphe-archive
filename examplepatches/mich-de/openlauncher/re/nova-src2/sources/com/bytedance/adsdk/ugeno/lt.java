package com.bytedance.adsdk.ugeno;

import android.content.Context;
import com.bytedance.adsdk.ugeno.lud.fby;
import com.bytedance.adsdk.ugeno.lud.jc;
import java.util.ArrayList;
import java.util.List;

/* loaded from: classes2.dex */
public class lt {
    private static volatile lt ycx;

    /* renamed from: dj, reason: collision with root package name */
    private zb f22392dj;
    private com.bytedance.adsdk.ugeno.core.ycx.ycx fby;

    /* renamed from: lt, reason: collision with root package name */
    private com.bytedance.adsdk.ugeno.dj.ycx f22393lt;
    private ycx lud;
    private com.bytedance.adsdk.ugeno.core.sya sya;

    /* renamed from: ul, reason: collision with root package name */
    private com.bytedance.adsdk.ugeno.core.zb.dj f22394ul;

    /* renamed from: zb, reason: collision with root package name */
    private List<com.bytedance.adsdk.ugeno.core.zb> f22395zb;

    private lt() {
    }

    private void ul() {
        ArrayList arrayList = new ArrayList();
        this.f22395zb = arrayList;
        com.bytedance.adsdk.ugeno.core.sya syaVar = this.sya;
        if (syaVar != null) {
            arrayList.addAll(syaVar.ycx());
        }
        com.bytedance.adsdk.ugeno.core.dj.ycx(this.f22395zb);
    }

    public static lt ycx() {
        if (ycx == null) {
            synchronized (lt.class) {
                try {
                    if (ycx == null) {
                        ycx = new lt();
                    }
                } catch (Throwable th2) {
                    throw th2;
                }
            }
        }
        return ycx;
    }

    public ycx dj() {
        return this.lud;
    }

    public com.bytedance.adsdk.ugeno.core.ycx.ycx lt() {
        return this.fby;
    }

    public com.bytedance.adsdk.ugeno.core.zb.dj lud() {
        return this.f22394ul;
    }

    public com.bytedance.adsdk.ugeno.dj.ycx sya() {
        return this.f22393lt;
    }

    public zb zb() {
        return this.f22392dj;
    }

    public void ycx(Context context, com.bytedance.adsdk.ugeno.core.sya syaVar, zb zbVar) {
        this.sya = syaVar;
        this.f22392dj = zbVar;
        ul();
    }

    public void ycx(com.bytedance.adsdk.ugeno.dj.ycx ycxVar) {
        this.f22393lt = ycxVar;
    }

    public void ycx(fby fbyVar) {
        ArrayList arrayList = new ArrayList(new com.bytedance.adsdk.ugeno.lud.ycx().ycx());
        if (fbyVar != null) {
            arrayList.addAll(fbyVar.ycx());
        }
        jc.ycx(arrayList);
    }

    public void ycx(com.bytedance.adsdk.ugeno.lud.sya syaVar) {
        ArrayList arrayList = new ArrayList(new com.bytedance.adsdk.ugeno.lud.lud().ycx());
        if (syaVar != null) {
            arrayList.addAll(syaVar.ycx());
        }
        com.bytedance.adsdk.ugeno.lud.dj.ycx(arrayList);
    }

    public void ycx(ycx ycxVar) {
        this.lud = ycxVar;
    }
}
