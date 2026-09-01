package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public enum u2e {
    UBYTE(kng.y("kotlin/UByte", false)),
    USHORT(kng.y("kotlin/UShort", false)),
    UINT(kng.y("kotlin/UInt", false)),
    ULONG(kng.y("kotlin/ULong", false));

    public final mn1 a;
    public final n98 b;
    public final mn1 c;

    u2e(mn1 mn1Var) {
        this.a = mn1Var;
        n98 n98VarF = mn1Var.f();
        this.b = n98VarF;
        this.c = new mn1(mn1Var.a, n98.e(n98VarF.b() + "Array"));
    }

    public final mn1 getArrayClassId() {
        return this.c;
    }

    public final mn1 getClassId() {
        return this.a;
    }

    public final n98 getTypeName() {
        return this.b;
    }
}
