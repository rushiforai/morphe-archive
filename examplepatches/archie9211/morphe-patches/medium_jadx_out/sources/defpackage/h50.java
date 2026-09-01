package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class h50 {
    public static final h50 CUSTOM_APP_EVENTS;
    public static final h50 MOBILE_INSTALL_EVENT;
    public static final /* synthetic */ h50[] a;

    static {
        h50 h50Var = new h50("MOBILE_INSTALL_EVENT", 0);
        MOBILE_INSTALL_EVENT = h50Var;
        h50 h50Var2 = new h50("CUSTOM_APP_EVENTS", 1);
        CUSTOM_APP_EVENTS = h50Var2;
        a = new h50[]{h50Var, h50Var2};
    }

    public static h50 valueOf(String str) {
        return (h50) Enum.valueOf(h50.class, str);
    }

    public static h50[] values() {
        return (h50[]) a.clone();
    }
}
