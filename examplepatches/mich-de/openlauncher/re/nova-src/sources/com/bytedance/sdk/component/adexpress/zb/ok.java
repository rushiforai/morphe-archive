package com.bytedance.sdk.component.adexpress.zb;

import com.bytedance.sdk.component.adexpress.zb.jc;
import java.util.Iterator;
import java.util.List;
import java.util.concurrent.atomic.AtomicBoolean;

/* loaded from: classes2.dex */
public class ok implements jc.ycx {

    /* renamed from: dj, reason: collision with root package name */
    private AtomicBoolean f23693dj = new AtomicBoolean(false);
    private jw sya;
    syc ycx;

    /* renamed from: zb, reason: collision with root package name */
    private List<jc> f23694zb;

    public ok(List<jc> list, jw jwVar) {
        this.f23694zb = list;
        this.sya = jwVar;
    }

    @Override // com.bytedance.sdk.component.adexpress.zb.jc.ycx
    public boolean sya() {
        return this.f23693dj.get();
    }

    @Override // com.bytedance.sdk.component.adexpress.zb.jc.ycx
    public void ycx() {
        this.sya.dj();
        Iterator<jc> it = this.f23694zb.iterator();
        while (it.hasNext() && !it.next().ycx(this)) {
        }
    }

    @Override // com.bytedance.sdk.component.adexpress.zb.jc.ycx
    public boolean zb(jc jcVar) {
        int iIndexOf = this.f23694zb.indexOf(jcVar);
        return iIndexOf < this.f23694zb.size() - 1 && iIndexOf >= 0;
    }

    @Override // com.bytedance.sdk.component.adexpress.zb.jc.ycx
    public syc zb() {
        return this.ycx;
    }

    @Override // com.bytedance.sdk.component.adexpress.zb.jc.ycx
    public void ycx(jc jcVar) {
        int iIndexOf = this.f23694zb.indexOf(jcVar);
        if (iIndexOf < 0) {
            return;
        }
        do {
            iIndexOf++;
            if (iIndexOf >= this.f23694zb.size()) {
                return;
            }
        } while (!this.f23694zb.get(iIndexOf).ycx(this));
    }

    @Override // com.bytedance.sdk.component.adexpress.zb.jc.ycx
    public void ycx(syc sycVar) {
        this.ycx = sycVar;
    }

    @Override // com.bytedance.sdk.component.adexpress.zb.jc.ycx
    public void ycx(boolean z11) {
        this.f23693dj.getAndSet(z11);
    }
}
