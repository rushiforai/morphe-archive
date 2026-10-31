package kotlin.jvm.internal;

import java.util.Objects;
import kotlin.reflect.KClass;

/* loaded from: classes.dex */
public class MutablePropertyReference1Impl extends MutablePropertyReference1 {
    public MutablePropertyReference1Impl(KClass kClass, String str, String str2) {
        super(CallableReference.NO_RECEIVER, ((ClassBasedDeclarationContainer) kClass).getF71858a(), str, str2, !Objects.nonNull(kClass) ? 1 : 0);
    }

    @Override // kotlin.reflect.KProperty1
    public final Object get(Object obj) {
        return getGetter().call(obj);
    }

    @Override // kotlin.reflect.KMutableProperty1
    public final void set(Object obj, Object obj2) {
        getSetter().call(obj, obj2);
    }

    public MutablePropertyReference1Impl(Class cls, String str, String str2, int i5) {
        super(CallableReference.NO_RECEIVER, cls, str, str2, i5);
    }
}
