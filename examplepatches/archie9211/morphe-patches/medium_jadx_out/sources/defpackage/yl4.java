package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class yl4 extends zl4 {
    public final o56[] d;

    /* JADX WARN: Illegal instructions before constructor call */
    public yl4(int i, o56[] o56VarArr) {
        if (o56VarArr == null) {
            ay0.e("Argument for @NotNull parameter 'enumEntries' of kotlin/reflect/jvm/internal/impl/metadata/deserialization/Flags$EnumLiteFlagField.bitWidth must not be null");
            throw null;
        }
        int i2 = 1;
        int length = o56VarArr.length - 1;
        if (length != 0) {
            for (int i3 = 31; i3 >= 0; i3--) {
                if (((1 << i3) & length) != 0) {
                    i2 = 1 + i3;
                }
            }
            rd6.g("Empty enum: ", o56VarArr.getClass());
            throw null;
        }
        super(i, i2, 0, (byte) 0);
        this.d = o56VarArr;
    }

    @Override // defpackage.zl4
    public final Object d(int i) {
        int i2 = (1 << this.c) - 1;
        int i3 = this.b;
        int i4 = (i & (i2 << i3)) >> i3;
        for (o56 o56Var : this.d) {
            if (o56Var.getNumber() == i4) {
                return o56Var;
            }
        }
        return null;
    }
}
