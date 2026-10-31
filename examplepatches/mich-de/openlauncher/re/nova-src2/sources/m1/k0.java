package m1;

import kotlin.jvm.internal.MutablePropertyReference0Impl;
import p1.e1;

/* loaded from: classes2.dex */
public final /* synthetic */ class k0 extends MutablePropertyReference0Impl {
    @Override // kotlin.jvm.internal.MutablePropertyReference0Impl, kotlin.reflect.KProperty0
    public final Object get() {
        return ((e1) this.receiver).getValue();
    }

    @Override // kotlin.jvm.internal.MutablePropertyReference0Impl, kotlin.reflect.KMutableProperty0
    public final void set(Object obj) {
        ((e1) this.receiver).setValue(obj);
    }
}
