package za0;

import a80.m;

/* loaded from: classes.dex */
public interface b {
    boolean a();

    boolean b();

    void c();

    boolean d();

    boolean e();

    void f(Throwable th2);

    boolean g();

    void h(String str);

    default boolean i(int i5) {
        int iB = m.b(i5);
        if (iB == 0) {
            return e();
        }
        if (iB == 10) {
            return b();
        }
        if (iB == 20) {
            return d();
        }
        if (iB == 30) {
            return a();
        }
        if (iB == 40) {
            return g();
        }
        throw new IllegalArgumentException("Level [" + m.x(i5) + "] not recognized.");
    }
}
