package t70;

/* loaded from: classes.dex */
public abstract class k2 {

    /* renamed from: a, reason: collision with root package name */
    public static final ThreadLocal f88812a = new ThreadLocal();

    public static i1 a() {
        ThreadLocal threadLocal = f88812a;
        i1 i1Var = (i1) threadLocal.get();
        if (i1Var != null) {
            return i1Var;
        }
        h hVar = new h(Thread.currentThread());
        threadLocal.set(hVar);
        return hVar;
    }
}
