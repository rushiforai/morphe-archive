package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class xq4 {
    public static final xq4 EAGER_FLUSHING_EVENT;
    public static final xq4 EVENT_THRESHOLD;
    public static final xq4 EXPLICIT;
    public static final xq4 PERSISTED_EVENTS;
    public static final xq4 SESSION_CHANGE;
    public static final xq4 TIMER;
    public static final /* synthetic */ xq4[] a;

    static {
        xq4 xq4Var = new xq4("EXPLICIT", 0);
        EXPLICIT = xq4Var;
        xq4 xq4Var2 = new xq4("TIMER", 1);
        TIMER = xq4Var2;
        xq4 xq4Var3 = new xq4("SESSION_CHANGE", 2);
        SESSION_CHANGE = xq4Var3;
        xq4 xq4Var4 = new xq4("PERSISTED_EVENTS", 3);
        PERSISTED_EVENTS = xq4Var4;
        xq4 xq4Var5 = new xq4("EVENT_THRESHOLD", 4);
        EVENT_THRESHOLD = xq4Var5;
        xq4 xq4Var6 = new xq4("EAGER_FLUSHING_EVENT", 5);
        EAGER_FLUSHING_EVENT = xq4Var6;
        a = new xq4[]{xq4Var, xq4Var2, xq4Var3, xq4Var4, xq4Var5, xq4Var6};
    }

    public static xq4 valueOf(String str) {
        return (xq4) Enum.valueOf(xq4.class, str);
    }

    public static xq4[] values() {
        return (xq4[]) a.clone();
    }
}
