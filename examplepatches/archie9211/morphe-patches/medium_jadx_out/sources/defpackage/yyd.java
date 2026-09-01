package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class yyd extends y46 {
    public final /* synthetic */ int b = 0;

    public yyd(byte b) {
        super(Byte.valueOf(b));
    }

    @Override // defpackage.f52
    public final mn6 a(b38 b38Var) {
        hec hecVarT;
        hec hecVarT2;
        hec hecVarT3;
        hec hecVarT4;
        int i = this.b;
        b38Var.getClass();
        switch (i) {
            case 0:
                y28 y28VarF = d46.F(b38Var, lnc.S);
                return (y28VarF == null || (hecVarT = y28VarF.T()) == null) ? l24.c(k24.NOT_FOUND_UNSIGNED_TYPE, "UByte") : hecVarT;
            case 1:
                y28 y28VarF2 = d46.F(b38Var, lnc.U);
                return (y28VarF2 == null || (hecVarT2 = y28VarF2.T()) == null) ? l24.c(k24.NOT_FOUND_UNSIGNED_TYPE, "UInt") : hecVarT2;
            case 2:
                y28 y28VarF3 = d46.F(b38Var, lnc.V);
                return (y28VarF3 == null || (hecVarT3 = y28VarF3.T()) == null) ? l24.c(k24.NOT_FOUND_UNSIGNED_TYPE, "ULong") : hecVarT3;
            default:
                y28 y28VarF4 = d46.F(b38Var, lnc.T);
                return (y28VarF4 == null || (hecVarT4 = y28VarF4.T()) == null) ? l24.c(k24.NOT_FOUND_UNSIGNED_TYPE, "UShort") : hecVarT4;
        }
    }

    @Override // defpackage.f52
    public final String toString() {
        int i = this.b;
        Object obj = this.a;
        switch (i) {
            case 0:
                return ((Number) obj).intValue() + ".toUByte()";
            case 1:
                return ((Number) obj).intValue() + ".toUInt()";
            case 2:
                return ((Number) obj).longValue() + ".toULong()";
            default:
                return ((Number) obj).intValue() + ".toUShort()";
        }
    }

    public yyd(short s) {
        super(Short.valueOf(s));
    }

    public yyd(int i) {
        super(Integer.valueOf(i));
    }

    public yyd(long j) {
        super(Long.valueOf(j));
    }
}
