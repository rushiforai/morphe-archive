package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class s5d {
    public static final s5d FORCE_NONE;
    public static final s5d FORCE_RECTANGLE;
    public static final s5d FORCE_SQUARE;
    public static final /* synthetic */ s5d[] a;

    static {
        s5d s5dVar = new s5d("FORCE_NONE", 0);
        FORCE_NONE = s5dVar;
        s5d s5dVar2 = new s5d("FORCE_SQUARE", 1);
        FORCE_SQUARE = s5dVar2;
        s5d s5dVar3 = new s5d("FORCE_RECTANGLE", 2);
        FORCE_RECTANGLE = s5dVar3;
        a = new s5d[]{s5dVar, s5dVar2, s5dVar3};
    }

    public static s5d valueOf(String str) {
        return (s5d) Enum.valueOf(s5d.class, str);
    }

    public static s5d[] values() {
        return (s5d[]) a.clone();
    }
}
