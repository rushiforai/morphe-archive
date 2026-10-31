package com.bytedance.sdk.component.ycx;

/* loaded from: classes2.dex */
public abstract class sya<P, R> extends com.bytedance.sdk.component.ycx.zb<P, R> {
    private lud sya;
    private boolean ycx = true;

    /* renamed from: zb, reason: collision with root package name */
    private ycx f24138zb;

    public interface ycx {
        void ycx(Object obj);

        void ycx(Throwable th2);
    }

    public interface zb {
        sya ycx();
    }

    private boolean lt() {
        if (this.ycx) {
            return true;
        }
        fby.ycx(new IllegalStateException("Jsb async call already finished: " + ycx() + ", hashcode: " + hashCode()));
        return false;
    }

    public void dj() {
        this.ycx = false;
        this.sya = null;
    }

    public void lud() {
        dj();
    }

    public final void sya() {
        ycx((Throwable) null);
    }

    @Override // com.bytedance.sdk.component.ycx.zb
    public /* bridge */ /* synthetic */ String ycx() {
        return super.ycx();
    }

    public abstract void ycx(P p11, lud ludVar) throws Exception;

    public final void ycx(R r11) {
        if (lt()) {
            this.f24138zb.ycx(r11);
            dj();
        }
    }

    public final void ycx(Throwable th2) {
        if (lt()) {
            this.f24138zb.ycx(th2);
            dj();
        }
    }

    public void ycx(P p11, lud ludVar, ycx ycxVar) throws Exception {
        this.sya = ludVar;
        this.f24138zb = ycxVar;
        ycx(p11, ludVar);
    }
}
