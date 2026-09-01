package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class l16 implements upc {
    public Number a;
    public Number b;
    public final hud c;
    public final k49 d;
    public sfd e;
    public boolean f;
    public boolean g;
    public long h;
    public final /* synthetic */ n16 i;

    public l16(n16 n16Var, Number number, Number number2, hud hudVar, k16 k16Var) {
        this.i = n16Var;
        this.a = number;
        this.b = number2;
        this.c = hudVar;
        this.d = qo7.u(number);
        this.e = new sfd(k16Var, hudVar, this.a, this.b, null);
    }

    @Override // defpackage.upc
    public final Object getValue() {
        return this.d.getValue();
    }
}
