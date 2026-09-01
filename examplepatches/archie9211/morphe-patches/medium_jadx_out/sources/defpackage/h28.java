package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class h28 {
    public static final h28 MTML_APP_EVENT_PREDICTION;
    public static final h28 MTML_INTEGRITY_DETECT;
    public static final /* synthetic */ h28[] a;

    static {
        h28 h28Var = new h28("MTML_INTEGRITY_DETECT", 0);
        MTML_INTEGRITY_DETECT = h28Var;
        h28 h28Var2 = new h28("MTML_APP_EVENT_PREDICTION", 1);
        MTML_APP_EVENT_PREDICTION = h28Var2;
        a = new h28[]{h28Var, h28Var2};
    }

    public static h28 valueOf(String str) {
        return (h28) Enum.valueOf(h28.class, str);
    }

    public static h28[] values() {
        return (h28[]) a.clone();
    }

    public final String toKey() {
        int i = g28.a[ordinal()];
        if (i == 1) {
            return "integrity_detect";
        }
        if (i == 2) {
            return "app_event_pred";
        }
        ygf.a();
        return null;
    }

    public final String toUseCase() {
        int i = g28.a[ordinal()];
        if (i == 1) {
            return "MTML_INTEGRITY_DETECT";
        }
        if (i == 2) {
            return "MTML_APP_EVENT_PRED";
        }
        ygf.a();
        return null;
    }
}
