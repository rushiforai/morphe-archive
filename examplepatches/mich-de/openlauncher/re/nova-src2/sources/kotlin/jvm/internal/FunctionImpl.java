package kotlin.jvm.internal;

import b.u4;
import java.io.Serializable;
import kotlin.Deprecated;
import kotlin.Function;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function10;
import kotlin.jvm.functions.Function11;
import kotlin.jvm.functions.Function12;
import kotlin.jvm.functions.Function13;
import kotlin.jvm.functions.Function14;
import kotlin.jvm.functions.Function15;
import kotlin.jvm.functions.Function16;
import kotlin.jvm.functions.Function17;
import kotlin.jvm.functions.Function18;
import kotlin.jvm.functions.Function19;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.functions.Function20;
import kotlin.jvm.functions.Function21;
import kotlin.jvm.functions.Function22;
import kotlin.jvm.functions.Function3;
import kotlin.jvm.functions.Function4;
import kotlin.jvm.functions.Function5;
import kotlin.jvm.functions.Function6;
import kotlin.jvm.functions.Function7;
import kotlin.jvm.functions.Function8;
import kotlin.jvm.functions.Function9;

@Deprecated
@Deprecated
/* loaded from: classes4.dex */
public abstract class FunctionImpl implements Function, Serializable, Function0, Function1, Function2, Function3, Function4, Function5, Function6, Function7, Function8, Function9, Function10, Function11, Function12, Function13, Function14, Function15, Function16, Function17, Function18, Function19, Function20, Function21, Function22 {
    public final void a(int i5) {
        if (getArity() == i5) {
            return;
        }
        StringBuilder sbJ = u4.j(i5, "Wrong function arity, expected: ", ", actual: ");
        sbJ.append(getArity());
        throw new IllegalStateException(sbJ.toString());
    }

    public abstract int getArity();

    @Override // kotlin.jvm.functions.Function0
    public final Object invoke() {
        a(0);
        throw new UnsupportedOperationException();
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        a(1);
        throw new UnsupportedOperationException();
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        a(2);
        throw new UnsupportedOperationException();
    }

    @Override // kotlin.jvm.functions.Function3
    public final Object invoke(Object obj, Object obj2, Object obj3) {
        a(3);
        throw new UnsupportedOperationException();
    }

    @Override // kotlin.jvm.functions.Function4
    public final Object invoke(Object obj, Object obj2, Object obj3, Object obj4) {
        a(4);
        throw new UnsupportedOperationException();
    }

    @Override // kotlin.jvm.functions.Function5
    public final Object invoke(Object obj, Object obj2, Object obj3, Object obj4, Object obj5) {
        a(5);
        throw new UnsupportedOperationException();
    }

    @Override // kotlin.jvm.functions.Function6
    public final Object invoke(Object obj, Object obj2, Object obj3, Object obj4, Object obj5, Object obj6) {
        a(6);
        throw new UnsupportedOperationException();
    }

    @Override // kotlin.jvm.functions.Function7
    public final Object invoke(Object obj, Object obj2, Object obj3, Object obj4, Object obj5, Object obj6, Object obj7) {
        a(7);
        throw new UnsupportedOperationException();
    }

    @Override // kotlin.jvm.functions.Function8
    public final Object invoke(Object obj, Object obj2, Object obj3, Object obj4, Object obj5, Object obj6, Object obj7, Object obj8) {
        a(8);
        throw new UnsupportedOperationException();
    }

    @Override // kotlin.jvm.functions.Function10
    public final Object invoke(Object obj, Object obj2, Object obj3, Object obj4, Object obj5, Object obj6, Object obj7, Object obj8, Object obj9, Object obj10) {
        a(10);
        throw new UnsupportedOperationException();
    }

    @Override // kotlin.jvm.functions.Function11
    public final Object invoke(Object obj, Object obj2, Object obj3, Object obj4, Object obj5, Object obj6, Object obj7, Object obj8, Object obj9, Object obj10, Object obj11) {
        a(11);
        throw new UnsupportedOperationException();
    }
}
