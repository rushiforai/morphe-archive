package ub0;

import o2.f;

/* loaded from: classes.dex */
public abstract class a {

    /* renamed from: a, reason: collision with root package name */
    public static volatile f f90779a = new f(10);

    /* renamed from: b, reason: collision with root package name */
    public static volatile o7.a f90780b = new o7.a(11);

    /* renamed from: c, reason: collision with root package name */
    public static volatile f f90781c = new f(12);

    public static void a(Throwable th2) {
        try {
            f90779a.mo5b((Object) th2);
        } catch (Throwable th3) {
            System.err.println("The onError handler threw an Exception. It shouldn't. => " + th3.getMessage());
            th3.printStackTrace();
            Thread threadCurrentThread = Thread.currentThread();
            threadCurrentThread.getUncaughtExceptionHandler().uncaughtException(threadCurrentThread, th3);
            Thread threadCurrentThread2 = Thread.currentThread();
            threadCurrentThread2.getUncaughtExceptionHandler().uncaughtException(threadCurrentThread2, th2);
        }
    }

    public static Throwable b(Throwable th2) {
        return (Throwable) f90781c.b((Object) th2);
    }

    public static mb0.a c(mb0.a aVar) {
        return (mb0.a) f90780b.b(aVar);
    }
}
