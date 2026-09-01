package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ird {
    public static final ird DEFERRED;
    public static final ird EXCLUSIVE;
    public static final ird IMMEDIATE;
    public static final /* synthetic */ ird[] a;
    public static final /* synthetic */ i04 b;

    static {
        ird irdVar = new ird("DEFERRED", 0);
        DEFERRED = irdVar;
        ird irdVar2 = new ird("IMMEDIATE", 1);
        IMMEDIATE = irdVar2;
        ird irdVar3 = new ird("EXCLUSIVE", 2);
        EXCLUSIVE = irdVar3;
        ird[] irdVarArr = {irdVar, irdVar2, irdVar3};
        a = irdVarArr;
        b = new i04(irdVarArr);
    }

    public static g04 getEntries() {
        return b;
    }

    public static ird valueOf(String str) {
        return (ird) Enum.valueOf(ird.class, str);
    }

    public static ird[] values() {
        return (ird[]) a.clone();
    }
}
