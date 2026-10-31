package t70;

import kotlin.coroutines.AbstractCoroutineContextElement;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class i0 extends AbstractCoroutineContextElement {

    /* renamed from: c, reason: collision with root package name */
    public static final h0 f88803c = new h0();

    /* renamed from: b, reason: collision with root package name */
    public final String f88804b;

    public i0(String str) {
        super(f88803c);
        this.f88804b = str;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof i0) && Intrinsics.b(this.f88804b, ((i0) obj).f88804b);
    }

    public final int hashCode() {
        return this.f88804b.hashCode();
    }

    public final String toString() {
        return h6.c1.t(new StringBuilder("CoroutineName("), this.f88804b, ')');
    }
}
