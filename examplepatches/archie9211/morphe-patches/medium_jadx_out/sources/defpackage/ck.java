package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ck {
    public static final ck NONE;
    public static final ck SIMPLE;
    public static final /* synthetic */ ck[] a;
    public static final /* synthetic */ i04 b;

    static {
        ck ckVar = new ck("NONE", 0);
        NONE = ckVar;
        ck ckVar2 = new ck("SIMPLE", 1);
        SIMPLE = ckVar2;
        ck[] ckVarArr = {ckVar, ckVar2};
        a = ckVarArr;
        b = new i04(ckVarArr);
    }

    public static g04 getEntries() {
        return b;
    }

    public static ck valueOf(String str) {
        return (ck) Enum.valueOf(ck.class, str);
    }

    public static ck[] values() {
        return (ck[]) a.clone();
    }
}
