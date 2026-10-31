package db0;

import kotlinx.serialization.KSerializer;
import kotlinx.serialization.Serializable;
import kotlinx.serialization.internal.PluginExceptionsKt;
import org.jetbrains.annotations.NotNull;

@Serializable
/* loaded from: classes.dex */
public final class p extends c0 {

    @NotNull
    public static final o Companion = new o();

    /* renamed from: f, reason: collision with root package name */
    public static final KSerializer[] f49180f = {j0.Companion.serializer(), null, null, null};

    /* renamed from: b, reason: collision with root package name */
    public final j0 f49181b;

    /* renamed from: c, reason: collision with root package name */
    public final long f49182c;

    /* renamed from: d, reason: collision with root package name */
    public final long f49183d;

    /* renamed from: e, reason: collision with root package name */
    public final long f49184e;

    public p(j0 j0Var, long j11, long j12, long j13) {
        this.f49181b = j0Var;
        this.f49182c = j11;
        this.f49183d = j12;
        this.f49184e = j13;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof p)) {
            return false;
        }
        p pVar = (p) obj;
        return this.f49181b == pVar.f49181b && f0.b(this.f49182c, pVar.f49182c) && this.f49183d == pVar.f49183d && this.f49184e == pVar.f49184e;
    }

    public final int hashCode() {
        return Long.hashCode(this.f49184e) + b.c0.d((f0.c(this.f49182c) + (this.f49181b.hashCode() * 31)) * 31, 31, this.f49183d);
    }

    public final String toString() {
        return "PackageEvent(type=" + this.f49181b + ", pkg=" + f0.d(this.f49182c) + ", userId=" + this.f49183d + ", timestamp=" + this.f49184e + ")";
    }

    public /* synthetic */ p(int i5, j0 j0Var, f0 f0Var, long j11, long j12) {
        if (15 != (i5 & 15)) {
            PluginExceptionsKt.throwMissingFieldException(i5, 15, n.f49174a.getDescriptor());
        }
        this.f49181b = j0Var;
        this.f49182c = f0Var.e();
        this.f49183d = j11;
        this.f49184e = j12;
    }
}
