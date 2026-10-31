package p1;

import kotlin.jvm.functions.Function2;

/* loaded from: classes.dex */
public interface c {
    void c(int i5, int i11, int i12);

    void d(int i5, int i11);

    default void e(Object obj, Function2 function2) {
        function2.invoke(l(), obj);
    }

    void j(int i5, Object obj);

    default void k() {
    }

    Object l();

    void m(int i5, Object obj);

    void n(Object obj);

    void o();

    void q();
}
