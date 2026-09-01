package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class ux {
    public static final ux JAVA;
    public static final ux KOTLIN;
    public static final /* synthetic */ ux[] a;

    static {
        ux uxVar = new ux("JAVA", 0);
        JAVA = uxVar;
        ux uxVar2 = new ux("KOTLIN", 1);
        KOTLIN = uxVar2;
        a = new ux[]{uxVar, uxVar2};
    }

    public static ux valueOf(String str) {
        return (ux) Enum.valueOf(ux.class, str);
    }

    public static ux[] values() {
        return (ux[]) a.clone();
    }
}
