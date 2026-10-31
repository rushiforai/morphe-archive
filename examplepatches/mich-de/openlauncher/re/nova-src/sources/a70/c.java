package a70;

import java.io.Serializable;
import java.util.concurrent.atomic.AtomicReferenceFieldUpdater;
import kotlin.Lazy;
import kotlin.SafePublicationLazyImpl$Companion;
import kotlin.UNINITIALIZED_VALUE;
import kotlin.jvm.functions.Function0;

/* loaded from: classes.dex */
public final class c implements Lazy, Serializable {

    /* renamed from: c, reason: collision with root package name */
    public static final AtomicReferenceFieldUpdater f447c;

    /* renamed from: a, reason: collision with root package name */
    public volatile Function0 f448a;

    /* renamed from: b, reason: collision with root package name */
    public volatile Object f449b;

    static {
        new SafePublicationLazyImpl$Companion(0);
        f447c = AtomicReferenceFieldUpdater.newUpdater(c.class, Object.class, "b");
    }

    @Override // kotlin.Lazy
    public final Object getValue() {
        Object obj = this.f449b;
        UNINITIALIZED_VALUE uninitialized_value = UNINITIALIZED_VALUE.f71702a;
        if (obj != uninitialized_value) {
            return obj;
        }
        Function0 function0 = this.f448a;
        if (function0 != null) {
            Object objInvoke = function0.invoke();
            AtomicReferenceFieldUpdater atomicReferenceFieldUpdater = f447c;
            while (!atomicReferenceFieldUpdater.compareAndSet(this, uninitialized_value, objInvoke)) {
                if (atomicReferenceFieldUpdater.get(this) != uninitialized_value) {
                }
            }
            this.f448a = null;
            return objInvoke;
        }
        return this.f449b;
    }

    @Override // kotlin.Lazy
    public final boolean isInitialized() {
        return this.f449b != UNINITIALIZED_VALUE.f71702a;
    }

    public final String toString() {
        return isInitialized() ? String.valueOf(getValue()) : "Lazy value not initialized yet.";
    }
}
