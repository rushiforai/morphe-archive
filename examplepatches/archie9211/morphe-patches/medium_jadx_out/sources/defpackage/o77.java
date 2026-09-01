package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public enum o77 {
    CRITICAL("critical"),
    ERROR("error"),
    WARN("warn"),
    INFO("info"),
    DEBUG("debug"),
    TRACE("trace"),
    EMERGENCY("emergency");

    public static final n77 Companion = new n77();
    public final String a;

    o77(String str) {
        this.a = str;
    }

    public static final o77 fromJson(String str) {
        Companion.getClass();
        str.getClass();
        for (o77 o77Var : values()) {
            if (g76.L(o77Var.a, str)) {
                return o77Var;
            }
        }
        ywb.h("Array contains no element matching the predicate.");
        return null;
    }

    public final dc6 toJson() {
        return new zc6(this.a);
    }
}
