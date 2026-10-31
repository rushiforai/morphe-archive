package b2;

import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function2;

/* loaded from: classes.dex */
public interface s extends t {
    @Override // b2.t
    default boolean all(Function1 function1) {
        return ((Boolean) function1.invoke(this)).booleanValue();
    }

    @Override // b2.t
    default Object foldIn(Object obj, Function2 function2) {
        return function2.invoke(obj, this);
    }
}
