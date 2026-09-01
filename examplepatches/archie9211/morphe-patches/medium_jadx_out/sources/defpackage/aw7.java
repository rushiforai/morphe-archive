package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class aw7 {
    public static final aw7 YELLOW;
    public static final /* synthetic */ aw7[] a;
    public static final /* synthetic */ i04 b;

    static {
        aw7 aw7Var = new aw7("YELLOW", 0);
        YELLOW = aw7Var;
        aw7[] aw7VarArr = {aw7Var};
        a = aw7VarArr;
        b = new i04(aw7VarArr);
    }

    public static g04 getEntries() {
        return b;
    }

    public static aw7 valueOf(String str) {
        return (aw7) Enum.valueOf(aw7.class, str);
    }

    public static aw7[] values() {
        return (aw7[]) a.clone();
    }
}
