package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class hj8 {
    public static final hj8 COMPLETE;
    public static final /* synthetic */ hj8[] a;

    static {
        hj8 hj8Var = new hj8("COMPLETE", 0);
        COMPLETE = hj8Var;
        a = new hj8[]{hj8Var};
    }

    public static <T> boolean accept(Object obj, ywc ywcVar) {
        if (obj == COMPLETE) {
            ywcVar.onComplete();
            return true;
        }
        if (obj instanceof fj8) {
            ywcVar.onError(((fj8) obj).a);
            return true;
        }
        ywcVar.onNext(obj);
        return false;
    }

    public static <T> boolean acceptFull(Object obj, ywc ywcVar) {
        if (obj == COMPLETE) {
            ywcVar.onComplete();
            return true;
        }
        if (obj instanceof fj8) {
            ywcVar.onError(((fj8) obj).a);
            return true;
        }
        if (obj instanceof gj8) {
            ywcVar.a(((gj8) obj).a);
            return false;
        }
        ywcVar.onNext(obj);
        return false;
    }

    public static Object complete() {
        return COMPLETE;
    }

    public static Object disposable(sh3 sh3Var) {
        return new ej8(sh3Var);
    }

    public static Object error(Throwable th) {
        return new fj8(th);
    }

    public static sh3 getDisposable(Object obj) {
        return ((ej8) obj).a;
    }

    public static Throwable getError(Object obj) {
        return ((fj8) obj).a;
    }

    public static rxc getSubscription(Object obj) {
        return ((gj8) obj).a;
    }

    public static boolean isComplete(Object obj) {
        return obj == COMPLETE;
    }

    public static boolean isDisposable(Object obj) {
        return obj instanceof ej8;
    }

    public static boolean isError(Object obj) {
        return obj instanceof fj8;
    }

    public static boolean isSubscription(Object obj) {
        return obj instanceof gj8;
    }

    public static Object subscription(rxc rxcVar) {
        return new gj8(rxcVar);
    }

    public static hj8 valueOf(String str) {
        return (hj8) Enum.valueOf(hj8.class, str);
    }

    public static hj8[] values() {
        return (hj8[]) a.clone();
    }

    @Override // java.lang.Enum
    public String toString() {
        return "NotificationLite.Complete";
    }

    public static <T> boolean accept(Object obj, jn8 jn8Var) {
        if (obj == COMPLETE) {
            jn8Var.onComplete();
            return true;
        }
        if (obj instanceof fj8) {
            jn8Var.onError(((fj8) obj).a);
            return true;
        }
        jn8Var.onNext(obj);
        return false;
    }

    public static <T> boolean acceptFull(Object obj, jn8 jn8Var) {
        if (obj == COMPLETE) {
            jn8Var.onComplete();
            return true;
        }
        if (obj instanceof fj8) {
            jn8Var.onError(((fj8) obj).a);
            return true;
        }
        if (obj instanceof ej8) {
            jn8Var.a(((ej8) obj).a);
            return false;
        }
        jn8Var.onNext(obj);
        return false;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public static <T> T getValue(Object obj) {
        return obj;
    }

    public static <T> Object next(T t) {
        return t;
    }
}
