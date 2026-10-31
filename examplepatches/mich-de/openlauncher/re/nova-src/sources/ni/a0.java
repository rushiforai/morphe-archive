package ni;

import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes3.dex */
public final class a0 {

    /* renamed from: a, reason: collision with root package name */
    public final k f78242a;

    /* renamed from: b, reason: collision with root package name */
    public final Integer f78243b;

    public a0(k kVar, Integer num) {
        this.f78242a = kVar;
        this.f78243b = num;
    }

    public final Integer a() {
        return this.f78243b;
    }

    public final k b() {
        return this.f78242a;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof a0)) {
            return false;
        }
        a0 a0Var = (a0) obj;
        return Intrinsics.b(this.f78242a, a0Var.f78242a) && Intrinsics.b(this.f78243b, a0Var.f78243b);
    }

    public final int hashCode() {
        int iHashCode = this.f78242a.hashCode() * 31;
        Integer num = this.f78243b;
        return iHashCode + (num == null ? 0 : num.hashCode());
    }

    public final String toString() {
        return "PreloadConfiguration(request=" + this.f78242a + ", bufferSize=" + this.f78243b + ")";
    }
}
