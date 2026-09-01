package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class yw7 {
    public static final yw7 LIMITED;
    public static final yw7 UNLIMITED;
    public static final /* synthetic */ yw7[] a;
    public static final /* synthetic */ i04 b;

    static {
        yw7 yw7Var = new yw7("LIMITED", 0);
        LIMITED = yw7Var;
        yw7 yw7Var2 = new yw7("UNLIMITED", 1);
        UNLIMITED = yw7Var2;
        yw7[] yw7VarArr = {yw7Var, yw7Var2};
        a = yw7VarArr;
        b = new i04(yw7VarArr);
    }

    public static g04 getEntries() {
        return b;
    }

    public static yw7 valueOf(String str) {
        return (yw7) Enum.valueOf(yw7.class, str);
    }

    public static yw7[] values() {
        return (yw7[]) a.clone();
    }
}
