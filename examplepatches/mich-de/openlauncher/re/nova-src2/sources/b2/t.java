package b2;

import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function2;

/* loaded from: classes.dex */
public interface t {
    boolean all(Function1 function1);

    Object foldIn(Object obj, Function2 function2);

    default t then(t tVar) {
        return tVar == r.f17024a ? this : new m(this, tVar);
    }
}
