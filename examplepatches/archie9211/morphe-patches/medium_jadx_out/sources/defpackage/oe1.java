package defpackage;

import androidx.compose.runtime.tooling.Dp.CspinKvYN;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class oe1 {
    public static final oe1 M;
    public static final oe1 S;
    public static final /* synthetic */ oe1[] a;
    public static final /* synthetic */ i04 b;

    public static g04 getEntries() {
        return b;
    }

    public static oe1 valueOf(String str) {
        return (oe1) Enum.valueOf(oe1.class, str);
    }

    public static oe1[] values() {
        return (oe1[]) a.clone();
    }

    static {
        oe1 oe1Var = new oe1(CspinKvYN.rcCd, 0);
        S = oe1Var;
        oe1 oe1Var2 = new oe1("M", 1);
        M = oe1Var2;
        oe1[] oe1VarArr = {oe1Var, oe1Var2};
        a = oe1VarArr;
        b = new i04(oe1VarArr);
    }
}
