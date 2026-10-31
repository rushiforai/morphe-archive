package kotlin;

import java.io.Serializable;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Intrinsics;

@Metadata(d1 = {"\u0000\u0014\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0000\u0018\u0000*\u0006\b\u0000\u0010\u0001 \u00012\b\u0012\u0004\u0012\u00028\u00000\u00022\u00060\u0003j\u0002`\u0004¨\u0006\u0005"}, d2 = {"Lkotlin/UnsafeLazyImpl;", "T", "Lkotlin/Lazy;", "Ljava/io/Serializable;", "Lkotlin/io/Serializable;", "kotlin-stdlib"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes.dex */
public final class UnsafeLazyImpl<T> implements Lazy<T>, Serializable {

    /* renamed from: a, reason: collision with root package name */
    public Function0 f71707a;

    /* renamed from: b, reason: collision with root package name */
    public Object f71708b;

    @Override // kotlin.Lazy
    public final Object getValue() {
        if (this.f71708b == UNINITIALIZED_VALUE.f71702a) {
            Function0 function0 = this.f71707a;
            Intrinsics.d(function0);
            this.f71708b = function0.invoke();
            this.f71707a = null;
        }
        return this.f71708b;
    }

    @Override // kotlin.Lazy
    public final boolean isInitialized() {
        return this.f71708b != UNINITIALIZED_VALUE.f71702a;
    }

    public final String toString() {
        return isInitialized() ? String.valueOf(getValue()) : "Lazy value not initialized yet.";
    }
}
