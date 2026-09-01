package defpackage;

import androidx.core.widget.nRCC.nGxjfIr;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class aq3 {
    public static final aq3 EDITING;
    public static final aq3 LOADING;
    public static final /* synthetic */ aq3[] a;
    public static final /* synthetic */ i04 b;

    public static g04 getEntries() {
        return b;
    }

    public static aq3 valueOf(String str) {
        return (aq3) Enum.valueOf(aq3.class, str);
    }

    public static aq3[] values() {
        return (aq3[]) a.clone();
    }

    static {
        aq3 aq3Var = new aq3("EDITING", 0);
        EDITING = aq3Var;
        aq3 aq3Var2 = new aq3(nGxjfIr.cihNyJBpPbxiS, 1);
        LOADING = aq3Var2;
        aq3[] aq3VarArr = {aq3Var, aq3Var2};
        a = aq3VarArr;
        b = new i04(aq3VarArr);
    }
}
