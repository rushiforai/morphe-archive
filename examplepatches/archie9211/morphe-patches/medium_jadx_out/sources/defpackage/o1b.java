package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class o1b {
    public static final o1b ALLOW;
    public static final o1b BLOCK_ALL;
    public static final o1b BLOCK_INACCESSIBLE;
    public static final o1b INDECISIVE;
    public static final /* synthetic */ o1b[] a;

    static {
        o1b o1bVar = new o1b("ALLOW", 0);
        ALLOW = o1bVar;
        o1b o1bVar2 = new o1b("INDECISIVE", 1);
        INDECISIVE = o1bVar2;
        o1b o1bVar3 = new o1b("BLOCK_INACCESSIBLE", 2);
        BLOCK_INACCESSIBLE = o1bVar3;
        o1b o1bVar4 = new o1b("BLOCK_ALL", 3);
        BLOCK_ALL = o1bVar4;
        a = new o1b[]{o1bVar, o1bVar2, o1bVar3, o1bVar4};
    }

    public static o1b valueOf(String str) {
        return (o1b) Enum.valueOf(o1b.class, str);
    }

    public static o1b[] values() {
        return (o1b[]) a.clone();
    }
}
