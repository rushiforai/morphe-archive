package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class lya {
    public static final lya REDUCED_MOTION;
    public static final lya STANDARD_MOTION;
    public static final /* synthetic */ lya[] a;

    static {
        lya lyaVar = new lya("STANDARD_MOTION", 0);
        STANDARD_MOTION = lyaVar;
        lya lyaVar2 = new lya("REDUCED_MOTION", 1);
        REDUCED_MOTION = lyaVar2;
        a = new lya[]{lyaVar, lyaVar2};
    }

    public static lya valueOf(String str) {
        return (lya) Enum.valueOf(lya.class, str);
    }

    public static lya[] values() {
        return (lya[]) a.clone();
    }
}
