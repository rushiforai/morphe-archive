package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class he6 {
    public static final he6 FALLBACK;
    public static final he6 FROM_CLASS_LOADER;
    public static final he6 FROM_DEPENDENCIES;
    public static final /* synthetic */ he6[] a;

    static {
        he6 he6Var = new he6("FROM_DEPENDENCIES", 0);
        FROM_DEPENDENCIES = he6Var;
        he6 he6Var2 = new he6("FROM_CLASS_LOADER", 1);
        FROM_CLASS_LOADER = he6Var2;
        he6 he6Var3 = new he6("FALLBACK", 2);
        FALLBACK = he6Var3;
        a = new he6[]{he6Var, he6Var2, he6Var3};
    }

    public static he6 valueOf(String str) {
        return (he6) Enum.valueOf(he6.class, str);
    }

    public static he6[] values() {
        return (he6[]) a.clone();
    }
}
