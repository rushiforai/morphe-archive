package defpackage;

import com.medium.android.admin.admininternalstatus.jO.ziYqbdHrAXvj;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public abstract class e36 extends q28 implements ssd {
    public y3f o;
    public y3f p;

    public e36() {
        hl4 hl4Var = qb8.p;
        this.o = hl4Var;
        this.p = hl4Var;
    }

    @Override // defpackage.q28
    public void A0() {
        this.p = this.o;
        br7.B(this, "androidx.compose.foundation.layout.ConsumedInsetsProvider", new d36(this, 0));
    }

    @Override // defpackage.q28
    public final void C0() {
        this.o = qb8.p;
    }

    public abstract y3f I0(y3f y3fVar);

    public void J0() {
        this.p = I0(this.o);
        br7.B(this, "androidx.compose.foundation.layout.ConsumedInsetsProvider", new d36(this, 0));
    }

    @Override // defpackage.ssd
    public final Object m() {
        return "androidx.compose.foundation.layout.ConsumedInsetsProvider";
    }

    @Override // defpackage.q28
    public void y0() {
        br7.z(this, ziYqbdHrAXvj.gDLqvPOYseKVS, new d36(this, 1));
        J0();
    }
}
