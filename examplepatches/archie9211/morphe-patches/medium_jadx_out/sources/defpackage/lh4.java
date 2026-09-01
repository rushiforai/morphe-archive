package defpackage;

import com.google.android.gms.internal.fido.Hg.kSWQKWZ;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class lh4 {
    public static final lh4 BOTTOM_UP;
    public static final lh4 TOP_DOWN;
    public static final /* synthetic */ lh4[] a;
    public static final /* synthetic */ i04 b;

    public static g04 getEntries() {
        return b;
    }

    public static lh4 valueOf(String str) {
        return (lh4) Enum.valueOf(lh4.class, str);
    }

    public static lh4[] values() {
        return (lh4[]) a.clone();
    }

    static {
        lh4 lh4Var = new lh4("TOP_DOWN", 0);
        TOP_DOWN = lh4Var;
        lh4 lh4Var2 = new lh4(kSWQKWZ.BAFkLhpgArG, 1);
        BOTTOM_UP = lh4Var2;
        lh4[] lh4VarArr = {lh4Var, lh4Var2};
        a = lh4VarArr;
        b = new i04(lh4VarArr);
    }
}
