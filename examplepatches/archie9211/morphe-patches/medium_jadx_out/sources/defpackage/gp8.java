package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class gp8 {
    public static final gp8 BITMAP;
    public static final gp8 DIRECT;
    public static final gp8 RENDER_NODE;
    public static final gp8 SAVE_LAYER;
    public static final /* synthetic */ gp8[] a;

    static {
        gp8 gp8Var = new gp8("DIRECT", 0);
        DIRECT = gp8Var;
        gp8 gp8Var2 = new gp8("SAVE_LAYER", 1);
        SAVE_LAYER = gp8Var2;
        gp8 gp8Var3 = new gp8("BITMAP", 2);
        BITMAP = gp8Var3;
        gp8 gp8Var4 = new gp8("RENDER_NODE", 3);
        RENDER_NODE = gp8Var4;
        a = new gp8[]{gp8Var, gp8Var2, gp8Var3, gp8Var4};
    }

    public static gp8 valueOf(String str) {
        return (gp8) Enum.valueOf(gp8.class, str);
    }

    public static gp8[] values() {
        return (gp8[]) a.clone();
    }
}
