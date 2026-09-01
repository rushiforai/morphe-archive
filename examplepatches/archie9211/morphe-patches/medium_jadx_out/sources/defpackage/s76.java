package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class s76 {
    public static final s76 DEFERRED;
    public static final s76 IGNORED;
    public static final s76 IMMINENT;
    public static final s76 SCHEDULED;
    public static final /* synthetic */ s76[] a;
    public static final /* synthetic */ i04 b;

    static {
        s76 s76Var = new s76("IGNORED", 0);
        IGNORED = s76Var;
        s76 s76Var2 = new s76("SCHEDULED", 1);
        SCHEDULED = s76Var2;
        s76 s76Var3 = new s76("DEFERRED", 2);
        DEFERRED = s76Var3;
        s76 s76Var4 = new s76("IMMINENT", 3);
        IMMINENT = s76Var4;
        s76[] s76VarArr = {s76Var, s76Var2, s76Var3, s76Var4};
        a = s76VarArr;
        b = new i04(s76VarArr);
    }

    public static g04 getEntries() {
        return b;
    }

    public static s76 valueOf(String str) {
        return (s76) Enum.valueOf(s76.class, str);
    }

    public static s76[] values() {
        return (s76[]) a.clone();
    }
}
