package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class i9f {
    public static final i9f ASCENDING;
    public static final i9f DESCENDING;
    public static final /* synthetic */ i9f[] a;

    static {
        i9f i9fVar = new i9f("ASCENDING", 0);
        ASCENDING = i9fVar;
        i9f i9fVar2 = new i9f("DESCENDING", 1);
        DESCENDING = i9fVar2;
        a = new i9f[]{i9fVar, i9fVar2};
    }

    public static i9f valueOf(String str) {
        return (i9f) Enum.valueOf(i9f.class, str);
    }

    public static i9f[] values() {
        return (i9f[]) a.clone();
    }
}
