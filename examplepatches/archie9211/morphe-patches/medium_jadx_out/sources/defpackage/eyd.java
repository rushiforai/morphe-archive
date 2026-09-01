package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class eyd implements gyd, upc {
    public final x80 a;

    public eyd(x80 x80Var) {
        this.a = x80Var;
    }

    @Override // defpackage.gyd
    public final boolean a() {
        return this.a.e;
    }

    @Override // defpackage.upc
    public final Object getValue() {
        return this.a.d.getValue();
    }
}
