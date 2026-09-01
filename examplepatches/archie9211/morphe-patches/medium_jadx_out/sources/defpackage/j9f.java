package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class j9f {
    public static final j9f ASCENDING;
    public static final j9f DESCENDING;
    public static final /* synthetic */ j9f[] a;

    static {
        j9f j9fVar = new j9f("ASCENDING", 0);
        ASCENDING = j9fVar;
        j9f j9fVar2 = new j9f("DESCENDING", 1);
        DESCENDING = j9fVar2;
        a = new j9f[]{j9fVar, j9fVar2};
    }

    public static j9f valueOf(String str) {
        return (j9f) Enum.valueOf(j9f.class, str);
    }

    public static j9f[] values() {
        return (j9f[]) a.clone();
    }
}
