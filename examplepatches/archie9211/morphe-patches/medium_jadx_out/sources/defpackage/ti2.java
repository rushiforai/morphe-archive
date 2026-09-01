package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class ti2 {
    public static final ti2 CRONET_SOURCE_FAKE;
    public static final ti2 CRONET_SOURCE_FALLBACK;
    public static final ti2 CRONET_SOURCE_PLATFORM;
    public static final ti2 CRONET_SOURCE_PLAY_SERVICES;
    public static final ti2 CRONET_SOURCE_STATICALLY_LINKED;
    public static final ti2 CRONET_SOURCE_UNSPECIFIED;
    public static final /* synthetic */ ti2[] a;

    static {
        ti2 ti2Var = new ti2("CRONET_SOURCE_UNSPECIFIED", 0);
        CRONET_SOURCE_UNSPECIFIED = ti2Var;
        ti2 ti2Var2 = new ti2("CRONET_SOURCE_STATICALLY_LINKED", 1);
        CRONET_SOURCE_STATICALLY_LINKED = ti2Var2;
        ti2 ti2Var3 = new ti2("CRONET_SOURCE_PLAY_SERVICES", 2);
        CRONET_SOURCE_PLAY_SERVICES = ti2Var3;
        ti2 ti2Var4 = new ti2("CRONET_SOURCE_FALLBACK", 3);
        CRONET_SOURCE_FALLBACK = ti2Var4;
        ti2 ti2Var5 = new ti2("CRONET_SOURCE_PLATFORM", 4);
        CRONET_SOURCE_PLATFORM = ti2Var5;
        ti2 ti2Var6 = new ti2("CRONET_SOURCE_FAKE", 5);
        CRONET_SOURCE_FAKE = ti2Var6;
        a = new ti2[]{ti2Var, ti2Var2, ti2Var3, ti2Var4, ti2Var5, ti2Var6};
    }

    public static ti2 valueOf(String str) {
        return (ti2) Enum.valueOf(ti2.class, str);
    }

    public static ti2[] values() {
        return (ti2[]) a.clone();
    }
}
