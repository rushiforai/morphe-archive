package kotlin.jvm.internal;

import java.io.Serializable;
import kotlin.SinceKotlin;
import kotlin.reflect.KCallable;
import kotlin.reflect.KFunction;

@SinceKotlin
/* loaded from: classes4.dex */
public class FunInterfaceConstructorReference extends FunctionReference implements Serializable {
    @Override // kotlin.jvm.internal.FunctionReference
    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj instanceof FunInterfaceConstructorReference) {
            throw null;
        }
        return false;
    }

    @Override // kotlin.jvm.internal.FunctionReference, kotlin.jvm.internal.CallableReference
    public final /* bridge */ /* synthetic */ KCallable getReflected() {
        getReflected();
        throw null;
    }

    @Override // kotlin.jvm.internal.FunctionReference
    public final int hashCode() {
        throw null;
    }

    @Override // kotlin.jvm.internal.FunctionReference
    public final String toString() {
        throw null;
    }

    @Override // kotlin.jvm.internal.FunctionReference, kotlin.jvm.internal.CallableReference
    public final KFunction getReflected() {
        throw new UnsupportedOperationException("Functional interface constructor does not support reflection");
    }
}
