package db0;

import kotlinx.serialization.KSerializer;
import kotlinx.serialization.Serializable;
import kotlinx.serialization.internal.PluginExceptionsKt;
import org.jetbrains.annotations.NotNull;

@Serializable
/* loaded from: classes.dex */
public final class c extends c0 {

    @NotNull
    public static final b Companion = new b();

    /* renamed from: d, reason: collision with root package name */
    public static final KSerializer[] f49134d = {h0.Companion.serializer(), null};

    /* renamed from: b, reason: collision with root package name */
    public final h0 f49135b;

    /* renamed from: c, reason: collision with root package name */
    public final long f49136c;

    public /* synthetic */ c(int i5, h0 h0Var, long j11) {
        if (1 != (i5 & 1)) {
            PluginExceptionsKt.throwMissingFieldException(i5, 1, a.f49129a.getDescriptor());
        }
        this.f49135b = h0Var;
        if ((i5 & 2) == 0) {
            this.f49136c = System.currentTimeMillis();
        } else {
            this.f49136c = j11;
        }
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof c)) {
            return false;
        }
        c cVar = (c) obj;
        return this.f49135b == cVar.f49135b && this.f49136c == cVar.f49136c;
    }

    public final int hashCode() {
        return Long.hashCode(this.f49136c) + (this.f49135b.hashCode() * 31);
    }

    public final String toString() {
        return "ActivityLifecycle(lifecycle=" + this.f49135b + ", timestamp=" + this.f49136c + ")";
    }

    public c(h0 h0Var) {
        long jCurrentTimeMillis = System.currentTimeMillis();
        this.f49135b = h0Var;
        this.f49136c = jCurrentTimeMillis;
    }
}
