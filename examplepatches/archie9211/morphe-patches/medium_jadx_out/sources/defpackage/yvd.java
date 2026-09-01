package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class yvd {
    public static final yvd FLEXIBLE_LOWER;
    public static final yvd FLEXIBLE_UPPER;
    public static final yvd INFLEXIBLE;
    public static final /* synthetic */ yvd[] a;

    static {
        yvd yvdVar = new yvd("FLEXIBLE_LOWER", 0);
        FLEXIBLE_LOWER = yvdVar;
        yvd yvdVar2 = new yvd("FLEXIBLE_UPPER", 1);
        FLEXIBLE_UPPER = yvdVar2;
        yvd yvdVar3 = new yvd("INFLEXIBLE", 2);
        INFLEXIBLE = yvdVar3;
        a = new yvd[]{yvdVar, yvdVar2, yvdVar3};
    }

    public static yvd valueOf(String str) {
        return (yvd) Enum.valueOf(yvd.class, str);
    }

    public static yvd[] values() {
        return (yvd[]) a.clone();
    }
}
