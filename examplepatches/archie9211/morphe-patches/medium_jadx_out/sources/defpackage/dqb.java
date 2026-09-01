package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class dqb {
    public static final dqb FILL;
    public static final dqb FIT;
    public static final /* synthetic */ dqb[] a;
    public static final /* synthetic */ i04 b;

    static {
        dqb dqbVar = new dqb("FILL", 0);
        FILL = dqbVar;
        dqb dqbVar2 = new dqb("FIT", 1);
        FIT = dqbVar2;
        dqb[] dqbVarArr = {dqbVar, dqbVar2};
        a = dqbVarArr;
        b = new i04(dqbVarArr);
    }

    public static g04 getEntries() {
        return b;
    }

    public static dqb valueOf(String str) {
        return (dqb) Enum.valueOf(dqb.class, str);
    }

    public static dqb[] values() {
        return (dqb[]) a.clone();
    }
}
