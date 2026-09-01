package defpackage;

import androidx.work.impl.yX.VrhD;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final class hw8 {
    public static final hw8 Horizontal;
    public static final hw8 Vertical;
    public static final /* synthetic */ hw8[] a;
    public static final /* synthetic */ i04 b;

    public static g04 getEntries() {
        return b;
    }

    public static hw8 valueOf(String str) {
        return (hw8) Enum.valueOf(hw8.class, str);
    }

    public static hw8[] values() {
        return (hw8[]) a.clone();
    }

    static {
        hw8 hw8Var = new hw8(VrhD.StsLsXTRB, 0);
        Vertical = hw8Var;
        hw8 hw8Var2 = new hw8("Horizontal", 1);
        Horizontal = hw8Var2;
        hw8[] hw8VarArr = {hw8Var, hw8Var2};
        a = hw8VarArr;
        b = new i04(hw8VarArr);
    }
}
