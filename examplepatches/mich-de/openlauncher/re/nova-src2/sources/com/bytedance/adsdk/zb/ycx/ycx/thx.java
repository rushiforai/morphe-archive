package com.bytedance.adsdk.zb.ycx.ycx;

import com.bytedance.adsdk.zb.sya.zb.uh;
import com.bytedance.adsdk.zb.ycx.zb.ycx;
import java.util.ArrayList;
import java.util.List;

/* loaded from: classes2.dex */
public class thx implements sya, ycx.InterfaceC0028ycx {

    /* renamed from: dj, reason: collision with root package name */
    private final uh.ycx f23203dj;

    /* renamed from: lt, reason: collision with root package name */
    private final com.bytedance.adsdk.zb.ycx.zb.ycx<?, Float> f23204lt;
    private final com.bytedance.adsdk.zb.ycx.zb.ycx<?, Float> lud;
    private final List<ycx.InterfaceC0028ycx> sya = new ArrayList();

    /* renamed from: ul, reason: collision with root package name */
    private final com.bytedance.adsdk.zb.ycx.zb.ycx<?, Float> f23205ul;
    private final String ycx;

    /* renamed from: zb, reason: collision with root package name */
    private final boolean f23206zb;

    public thx(com.bytedance.adsdk.zb.sya.sya.ycx ycxVar, com.bytedance.adsdk.zb.sya.zb.uh uhVar) {
        this.ycx = uhVar.ycx();
        this.f23206zb = uhVar.lt();
        this.f23203dj = uhVar.zb();
        com.bytedance.adsdk.zb.ycx.zb.ycx<Float, Float> ycxVarYcx = uhVar.dj().ycx();
        this.lud = ycxVarYcx;
        com.bytedance.adsdk.zb.ycx.zb.ycx<Float, Float> ycxVarYcx2 = uhVar.sya().ycx();
        this.f23204lt = ycxVarYcx2;
        com.bytedance.adsdk.zb.ycx.zb.ycx<Float, Float> ycxVarYcx3 = uhVar.lud().ycx();
        this.f23205ul = ycxVarYcx3;
        ycxVar.ycx(ycxVarYcx);
        ycxVar.ycx(ycxVarYcx2);
        ycxVar.ycx(ycxVarYcx3);
        ycxVarYcx.ycx(this);
        ycxVarYcx2.ycx(this);
        ycxVarYcx3.ycx(this);
    }

    public com.bytedance.adsdk.zb.ycx.zb.ycx<?, Float> dj() {
        return this.f23204lt;
    }

    public boolean lt() {
        return this.f23206zb;
    }

    public com.bytedance.adsdk.zb.ycx.zb.ycx<?, Float> lud() {
        return this.f23205ul;
    }

    public com.bytedance.adsdk.zb.ycx.zb.ycx<?, Float> sya() {
        return this.lud;
    }

    @Override // com.bytedance.adsdk.zb.ycx.ycx.sya
    public void ycx(List<sya> list, List<sya> list2) {
    }

    public uh.ycx zb() {
        return this.f23203dj;
    }

    @Override // com.bytedance.adsdk.zb.ycx.zb.ycx.InterfaceC0028ycx
    public void ycx() {
        for (int i5 = 0; i5 < this.sya.size(); i5++) {
            this.sya.get(i5).ycx();
        }
    }

    public void ycx(ycx.InterfaceC0028ycx interfaceC0028ycx) {
        this.sya.add(interfaceC0028ycx);
    }
}
