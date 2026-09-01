package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class c28 {
    public static final c28 ABSTRACT;
    public static final a28 Companion;
    public static final c28 FINAL;
    public static final c28 OPEN;
    public static final c28 SEALED;
    public static final /* synthetic */ c28[] a;

    static {
        c28 c28Var = new c28("FINAL", 0);
        FINAL = c28Var;
        c28 c28Var2 = new c28("SEALED", 1);
        SEALED = c28Var2;
        c28 c28Var3 = new c28("OPEN", 2);
        OPEN = c28Var3;
        c28 c28Var4 = new c28("ABSTRACT", 3);
        ABSTRACT = c28Var4;
        a = new c28[]{c28Var, c28Var2, c28Var3, c28Var4};
        Companion = new a28();
    }

    public static c28 valueOf(String str) {
        return (c28) Enum.valueOf(c28.class, str);
    }

    public static c28[] values() {
        return (c28[]) a.clone();
    }
}
