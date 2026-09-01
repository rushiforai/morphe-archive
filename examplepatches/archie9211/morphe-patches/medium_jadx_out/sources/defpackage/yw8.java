package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class yw8 {
    public static final yw8 RENDER_OPEN;
    public static final yw8 RENDER_OPEN_OVERRIDE;
    public static final yw8 RENDER_OVERRIDE;
    public static final /* synthetic */ yw8[] a;

    static {
        yw8 yw8Var = new yw8("RENDER_OVERRIDE", 0);
        RENDER_OVERRIDE = yw8Var;
        yw8 yw8Var2 = new yw8("RENDER_OPEN", 1);
        RENDER_OPEN = yw8Var2;
        yw8 yw8Var3 = new yw8("RENDER_OPEN_OVERRIDE", 2);
        RENDER_OPEN_OVERRIDE = yw8Var3;
        a = new yw8[]{yw8Var, yw8Var2, yw8Var3};
    }

    public static yw8 valueOf(String str) {
        return (yw8) Enum.valueOf(yw8.class, str);
    }

    public static yw8[] values() {
        return (yw8[]) a.clone();
    }
}
