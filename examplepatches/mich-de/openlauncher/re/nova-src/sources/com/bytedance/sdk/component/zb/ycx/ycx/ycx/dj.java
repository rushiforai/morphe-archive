package com.bytedance.sdk.component.zb.ycx.ycx.ycx;

import android.text.TextUtils;
import com.bytedance.sdk.component.zb.ycx.ea;
import com.bytedance.sdk.component.zb.ycx.ok;

/* loaded from: classes2.dex */
public class dj extends ea {

    /* renamed from: jc, reason: collision with root package name */
    public ycx f24207jc;

    /* renamed from: jw, reason: collision with root package name */
    public lt f24208jw;

    public dj(ea.ycx ycxVar) {
        super(ycxVar);
        lt ltVar = new lt();
        this.f24208jw = ltVar;
        this.f24207jc = new ycx(ltVar.zb());
    }

    @Override // com.bytedance.sdk.component.zb.ycx.ea
    public com.bytedance.sdk.component.zb.ycx.zb ycx(ok okVar) {
        okVar.ycx(this);
        if (okVar.dj() == null || okVar.dj().ycx() == null || TextUtils.isEmpty(okVar.dj().ycx().toString())) {
            return null;
        }
        if (ycx.ycx == null || !ycx.ycx.zb() || !this.f24207jc.lud() || "setting".equals(okVar.fby())) {
            zb zbVar = new zb(okVar, this.f24208jw);
            this.f24208jw.sya().add(zbVar);
            return zbVar;
        }
        zb zbVar2 = new zb(okVar, this.f24207jc);
        this.f24207jc.sya().add(zbVar2);
        return zbVar2;
    }

    @Override // com.bytedance.sdk.component.zb.ycx.ea
    public com.bytedance.sdk.component.zb.ycx.dj zb() {
        return this.f24208jw;
    }
}
