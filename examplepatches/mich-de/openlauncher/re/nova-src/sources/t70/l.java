package t70;

import kotlin.coroutines.Continuation;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function3;

/* loaded from: classes.dex */
public interface l extends Continuation {
    boolean a(Throwable th2);

    boolean b();

    w50.g g(Object obj, Function3 function3);

    void i(Object obj, Function1 function1);

    boolean isCancelled();

    void o(Object obj, Function3 function3);

    void x(Object obj);
}
