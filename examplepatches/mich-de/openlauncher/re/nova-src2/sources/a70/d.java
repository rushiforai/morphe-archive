package a70;

import java.io.Serializable;
import kotlin.Lazy;
import kotlin.UNINITIALIZED_VALUE;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class d implements Lazy, Serializable {

    /* renamed from: a, reason: collision with root package name */
    public Function0 f450a;

    /* renamed from: b, reason: collision with root package name */
    public volatile Object f451b;

    /* renamed from: c, reason: collision with root package name */
    public final Object f452c;

    public d(Function0 initializer) {
        Intrinsics.g(initializer, "initializer");
        this.f450a = initializer;
        this.f451b = UNINITIALIZED_VALUE.f71702a;
        this.f452c = this;
    }

    @Override // kotlin.Lazy
    public final Object getValue() {
        Object objInvoke;
        Object obj = this.f451b;
        UNINITIALIZED_VALUE uninitialized_value = UNINITIALIZED_VALUE.f71702a;
        if (obj != uninitialized_value) {
            return obj;
        }
        synchronized (this.f452c) {
            objInvoke = this.f451b;
            if (objInvoke == uninitialized_value) {
                Function0 function0 = this.f450a;
                Intrinsics.d(function0);
                objInvoke = function0.invoke();
                this.f451b = objInvoke;
                this.f450a = null;
            }
        }
        return objInvoke;
    }

    @Override // kotlin.Lazy
    public final boolean isInitialized() {
        return this.f451b != UNINITIALIZED_VALUE.f71702a;
    }

    public final String toString() {
        return isInitialized() ? String.valueOf(getValue()) : "Lazy value not initialized yet.";
    }
}
