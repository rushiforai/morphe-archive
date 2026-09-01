package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ux6 {
    private static final /* synthetic */ g04 $ENTRIES;
    private static final /* synthetic */ ux6[] $VALUES;
    public static final sx6 Companion;
    public static final ux6 ON_ANY;
    public static final ux6 ON_CREATE;
    public static final ux6 ON_DESTROY;
    public static final ux6 ON_PAUSE;
    public static final ux6 ON_RESUME;
    public static final ux6 ON_START;
    public static final ux6 ON_STOP;

    static {
        ux6 ux6Var = new ux6("ON_CREATE", 0);
        ON_CREATE = ux6Var;
        ux6 ux6Var2 = new ux6("ON_START", 1);
        ON_START = ux6Var2;
        ux6 ux6Var3 = new ux6("ON_RESUME", 2);
        ON_RESUME = ux6Var3;
        ux6 ux6Var4 = new ux6("ON_PAUSE", 3);
        ON_PAUSE = ux6Var4;
        ux6 ux6Var5 = new ux6("ON_STOP", 4);
        ON_STOP = ux6Var5;
        ux6 ux6Var6 = new ux6("ON_DESTROY", 5);
        ON_DESTROY = ux6Var6;
        ux6 ux6Var7 = new ux6("ON_ANY", 6);
        ON_ANY = ux6Var7;
        ux6[] ux6VarArr = {ux6Var, ux6Var2, ux6Var3, ux6Var4, ux6Var5, ux6Var6, ux6Var7};
        $VALUES = ux6VarArr;
        $ENTRIES = new i04(ux6VarArr);
        Companion = new sx6();
    }

    public static final ux6 downFrom(vx6 vx6Var) {
        Companion.getClass();
        return sx6.a(vx6Var);
    }

    public static final ux6 downTo(vx6 vx6Var) {
        Companion.getClass();
        vx6Var.getClass();
        int i = rx6.a[vx6Var.ordinal()];
        if (i == 1) {
            return ON_STOP;
        }
        if (i == 2) {
            return ON_PAUSE;
        }
        if (i != 4) {
            return null;
        }
        return ON_DESTROY;
    }

    public static g04 getEntries() {
        return $ENTRIES;
    }

    public static final ux6 upFrom(vx6 vx6Var) {
        Companion.getClass();
        return sx6.b(vx6Var);
    }

    public static final ux6 upTo(vx6 vx6Var) {
        Companion.getClass();
        return sx6.c(vx6Var);
    }

    public static ux6 valueOf(String str) {
        return (ux6) Enum.valueOf(ux6.class, str);
    }

    public static ux6[] values() {
        return (ux6[]) $VALUES.clone();
    }

    public final vx6 getTargetState() {
        switch (tx6.a[ordinal()]) {
            case 1:
            case 2:
                return vx6.CREATED;
            case 3:
            case 4:
                return vx6.STARTED;
            case 5:
                return vx6.RESUMED;
            case 6:
                return vx6.DESTROYED;
            case 7:
                throw new IllegalArgumentException(this + " has no target state");
            default:
                ygf.a();
                return null;
        }
    }
}
