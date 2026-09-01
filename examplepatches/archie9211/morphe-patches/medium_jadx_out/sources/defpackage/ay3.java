package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class ay3 implements xqa {
    public static final ay3 INSTANCE;
    public static final ay3 NEVER;
    public static final /* synthetic */ ay3[] a;

    static {
        ay3 ay3Var = new ay3("INSTANCE", 0);
        INSTANCE = ay3Var;
        ay3 ay3Var2 = new ay3("NEVER", 1);
        NEVER = ay3Var2;
        a = new ay3[]{ay3Var, ay3Var2};
    }

    public static void complete(jn8 jn8Var) {
        jn8Var.a(INSTANCE);
        jn8Var.onComplete();
    }

    public static void error(Throwable th, jn8 jn8Var) {
        jn8Var.a(INSTANCE);
        jn8Var.onError(th);
    }

    public static ay3 valueOf(String str) {
        return (ay3) Enum.valueOf(ay3.class, str);
    }

    public static ay3[] values() {
        return (ay3[]) a.clone();
    }

    public boolean isDisposed() {
        return this == INSTANCE;
    }

    @Override // defpackage.fec
    public boolean isEmpty() {
        return true;
    }

    @Override // defpackage.fec
    public boolean offer(Object obj) {
        throw new UnsupportedOperationException("Should not be called!");
    }

    @Override // defpackage.fec
    public Object poll() {
        return null;
    }

    @Override // defpackage.dra
    public int requestFusion(int i) {
        return i & 2;
    }

    public boolean offer(Object obj, Object obj2) {
        throw new UnsupportedOperationException("Should not be called!");
    }

    public static void complete(sk7 sk7Var) {
        sk7Var.b();
        sk7Var.onComplete();
    }

    public static void error(Throwable th, zx1 zx1Var) {
        zx1Var.b();
        zx1Var.a();
    }

    public static void complete(zx1 zx1Var) {
        zx1Var.b();
        zx1Var.onComplete();
    }

    public static void error(Throwable th, oec oecVar) {
        oecVar.b();
        oecVar.a();
    }

    public static void error(Throwable th, sk7 sk7Var) {
        sk7Var.b();
        sk7Var.a();
    }

    @Override // defpackage.fec
    public void clear() {
    }

    @Override // defpackage.sh3
    public void dispose() {
    }
}
