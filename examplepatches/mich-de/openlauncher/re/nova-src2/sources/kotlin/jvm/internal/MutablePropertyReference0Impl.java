package kotlin.jvm.internal;

/* loaded from: classes.dex */
public class MutablePropertyReference0Impl extends MutablePropertyReference0 {
    @Override // kotlin.reflect.KProperty0
    public Object get() {
        return getGetter().call(new Object[0]);
    }

    @Override // kotlin.reflect.KMutableProperty0
    public void set(Object obj) {
        getSetter().call(obj);
    }
}
