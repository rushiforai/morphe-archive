package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class st2 {
    public static final st2 DISK;
    public static final st2 MEMORY;
    public static final st2 MEMORY_CACHE;
    public static final st2 NETWORK;
    public static final /* synthetic */ st2[] a;
    public static final /* synthetic */ i04 b;

    static {
        st2 st2Var = new st2("MEMORY_CACHE", 0);
        MEMORY_CACHE = st2Var;
        st2 st2Var2 = new st2("MEMORY", 1);
        MEMORY = st2Var2;
        st2 st2Var3 = new st2("DISK", 2);
        DISK = st2Var3;
        st2 st2Var4 = new st2("NETWORK", 3);
        NETWORK = st2Var4;
        st2[] st2VarArr = {st2Var, st2Var2, st2Var3, st2Var4};
        a = st2VarArr;
        b = new i04(st2VarArr);
    }

    public static g04 getEntries() {
        return b;
    }

    public static st2 valueOf(String str) {
        return (st2) Enum.valueOf(st2.class, str);
    }

    public static st2[] values() {
        return (st2[]) a.clone();
    }
}
