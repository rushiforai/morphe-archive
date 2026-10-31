package kotlin.jvm.internal;

/* loaded from: classes4.dex */
public class MutablePropertyReference2Impl extends MutablePropertyReference2 {
    @Override // kotlin.reflect.KProperty2
    public final Object get(Object obj, Object obj2) {
        return getGetter().call(obj, obj2);
    }

    @Override // kotlin.reflect.KMutableProperty2
    public final void set(Object obj, Object obj2, Object obj3) {
        getSetter().call(obj, obj2, obj3);
    }
}
