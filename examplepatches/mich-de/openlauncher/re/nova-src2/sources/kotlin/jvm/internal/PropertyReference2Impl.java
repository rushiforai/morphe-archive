package kotlin.jvm.internal;

/* loaded from: classes.dex */
public class PropertyReference2Impl extends PropertyReference2 {
    public PropertyReference2Impl(Class cls, String str, String str2) {
        super(CallableReference.NO_RECEIVER, cls, str, str2, 0);
    }

    @Override // kotlin.reflect.KProperty2
    public final Object get(Object obj, Object obj2) {
        return getGetter().call(obj, obj2);
    }
}
