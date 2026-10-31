package l50;

import com.google.android.gms.internal.measurement.k2;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class c {

    /* renamed from: a, reason: collision with root package name */
    public final x50.a f74730a;

    /* renamed from: b, reason: collision with root package name */
    public final Object f74731b;

    public c(x50.a expectedType, Object response) {
        Intrinsics.g(expectedType, "expectedType");
        Intrinsics.g(response, "response");
        this.f74730a = expectedType;
        this.f74731b = response;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof c)) {
            return false;
        }
        c cVar = (c) obj;
        return Intrinsics.b(this.f74730a, cVar.f74730a) && Intrinsics.b(this.f74731b, cVar.f74731b);
    }

    public final int hashCode() {
        return this.f74731b.hashCode() + (this.f74730a.hashCode() * 31);
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("HttpResponseContainer(expectedType=");
        sb2.append(this.f74730a);
        sb2.append(", response=");
        return k2.j(sb2, this.f74731b, ')');
    }
}
