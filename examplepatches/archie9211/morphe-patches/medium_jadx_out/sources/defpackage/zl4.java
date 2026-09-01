package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class zl4 {
    public final /* synthetic */ int a;
    public final int b;
    public final int c;

    /* JADX WARN: 'this' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ zl4(int i, int i2, int i3) {
        this((i3 & 1) != 0 ? 0 : i, (i3 & 2) != 0 ? 0 : i2, 1, (byte) 0);
        this.a = 1;
    }

    public static xl4 a(zl4 zl4Var) {
        byte b = 0;
        return new xl4(zl4Var.b + zl4Var.c, 1, b, b);
    }

    public static xl4 b() {
        return new xl4(0, 1, 0, (byte) 0);
    }

    public abstract void c(ym0 ym0Var, x60 x60Var, igc igcVar, l3b l3bVar, kv8 kv8Var);

    public abstract Object d(int i);

    public k65 e(ym0 ym0Var) {
        return null;
    }

    public String toString() {
        switch (this.a) {
            case 1:
                String strJ = n1b.a.b(getClass()).j();
                return strJ == null ? "" : strJ;
            default:
                return super.toString();
        }
    }

    public /* synthetic */ zl4(int i, int i2, int i3, byte b) {
        this.a = i3;
        this.b = i;
        this.c = i2;
    }
}
