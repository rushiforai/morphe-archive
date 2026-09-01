package defpackage;

import androidx.core.widget.nRCC.nGxjfIr;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final class ze5 {
    public static final ze5 LINEAR;
    public static final ze5 RADIAL;
    public static final /* synthetic */ ze5[] a;

    public static ze5 valueOf(String str) {
        return (ze5) Enum.valueOf(ze5.class, str);
    }

    public static ze5[] values() {
        return (ze5[]) a.clone();
    }

    static {
        ze5 ze5Var = new ze5("LINEAR", 0);
        LINEAR = ze5Var;
        ze5 ze5Var2 = new ze5(nGxjfIr.zdPcImOwx, 1);
        RADIAL = ze5Var2;
        a = new ze5[]{ze5Var, ze5Var2};
    }
}
