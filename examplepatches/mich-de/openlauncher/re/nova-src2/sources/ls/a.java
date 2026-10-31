package ls;

import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class a implements f {

    /* renamed from: a, reason: collision with root package name */
    public final Throwable f75087a;

    public a(Throwable th2) {
        this.f75087a = th2;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof a) && Intrinsics.b(this.f75087a, ((a) obj).f75087a);
    }

    public final int hashCode() {
        return this.f75087a.hashCode();
    }

    public final String toString() {
        return fq.c.d("Error(error=", ")", this.f75087a);
    }
}
