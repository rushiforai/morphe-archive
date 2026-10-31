package com.bytedance.sdk.openadsdk.component.reward.ycx;

import com.bytedance.sdk.openadsdk.core.model.av;
import com.bytedance.sdk.openadsdk.core.model.tn;

/* loaded from: classes2.dex */
public class jw {
    public static int sya = 2;
    public static int ycx = 0;

    /* renamed from: zb, reason: collision with root package name */
    public static int f25088zb = 1;

    /* renamed from: dj, reason: collision with root package name */
    private final boolean f25089dj;
    private jc lud;

    public jw(zb zbVar, tn tnVar) {
        this.f25089dj = tnVar.qq();
        this.lud = av.lt(tnVar) ? new fby(zbVar) : new jc(zbVar);
    }

    public boolean dj() {
        jc jcVar = this.lud;
        if (jcVar != null) {
            return jcVar.jc();
        }
        return false;
    }

    public boolean ea() {
        jc jcVar = this.lud;
        if (jcVar != null) {
            return jcVar.syc();
        }
        return false;
    }

    public void fby() {
        jc jcVar = this.lud;
        if (jcVar != null) {
            jcVar.lud();
        }
    }

    public void jc() {
        jc jcVar = this.lud;
        if (jcVar != null) {
            jcVar.sya();
        }
    }

    public void jw() {
        jc jcVar = this.lud;
        if (jcVar != null) {
            jcVar.xkz();
        }
    }

    public void lt() {
        jc jcVar = this.lud;
        if (jcVar != null) {
            jcVar.jw();
        }
    }

    public void lud() {
        jc jcVar = this.lud;
        if (jcVar != null) {
            jcVar.dj();
        }
    }

    public com.bytedance.sdk.openadsdk.ry.lud sya() {
        return null;
    }

    public void ul() {
        jc jcVar = this.lud;
        if (jcVar != null) {
            jcVar.ycx();
        }
    }

    public com.bytedance.sdk.openadsdk.wwx.fby ycx() {
        return null;
    }

    public boolean zb() {
        return false;
    }

    public void sya(int i5) {
        jc jcVar;
        if (i5 == sya || (jcVar = this.lud) == null) {
            return;
        }
        jcVar.lt();
    }

    public void ycx(int i5) {
        jc jcVar = this.lud;
        if (jcVar != null) {
            jcVar.ycx(i5);
        }
    }

    public void zb(int i5) {
        jc jcVar = this.lud;
        if (jcVar != null) {
            jcVar.ycx(i5);
        }
    }

    public boolean dj(int i5) {
        jc jcVar;
        if (i5 != f25088zb || (jcVar = this.lud) == null) {
            return false;
        }
        return jcVar.ry();
    }

    public void ycx(com.bytedance.sdk.openadsdk.core.sya.lud ludVar) {
        jc jcVar = this.lud;
        if (jcVar != null) {
            jcVar.ycx(ludVar);
        }
    }

    public void zb(boolean z11) {
        jc jcVar = this.lud;
        if (jcVar != null) {
            jcVar.sya(z11);
        }
    }

    public void ycx(boolean z11) {
        jc jcVar = this.lud;
        if (jcVar != null) {
            jcVar.zb(z11);
        }
    }
}
