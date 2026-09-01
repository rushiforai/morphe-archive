package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class mt1 {
    public static final mt1 FOLLOW;
    public static final mt1 MUTE;
    public static final /* synthetic */ mt1[] a;
    public static final /* synthetic */ i04 b;

    static {
        mt1 mt1Var = new mt1("FOLLOW", 0);
        FOLLOW = mt1Var;
        mt1 mt1Var2 = new mt1("MUTE", 1);
        MUTE = mt1Var2;
        mt1[] mt1VarArr = {mt1Var, mt1Var2};
        a = mt1VarArr;
        b = new i04(mt1VarArr);
    }

    public static g04 getEntries() {
        return b;
    }

    public static mt1 valueOf(String str) {
        return (mt1) Enum.valueOf(mt1.class, str);
    }

    public static mt1[] values() {
        return (mt1[]) a.clone();
    }
}
