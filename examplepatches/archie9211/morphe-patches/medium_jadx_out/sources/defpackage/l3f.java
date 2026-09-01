package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class l3f {
    public static final l3f CENTER;
    public static final l3f END;
    public static final l3f NONE;
    public static final l3f START;
    public static final /* synthetic */ l3f[] a;

    static {
        l3f l3fVar = new l3f("NONE", 0);
        NONE = l3fVar;
        l3f l3fVar2 = new l3f("START", 1);
        START = l3fVar2;
        l3f l3fVar3 = new l3f("END", 2);
        END = l3fVar3;
        l3f l3fVar4 = new l3f("CENTER", 3);
        CENTER = l3fVar4;
        a = new l3f[]{l3fVar, l3fVar2, l3fVar3, l3fVar4};
    }

    public static l3f valueOf(String str) {
        return (l3f) Enum.valueOf(l3f.class, str);
    }

    public static l3f[] values() {
        return (l3f[]) a.clone();
    }
}
