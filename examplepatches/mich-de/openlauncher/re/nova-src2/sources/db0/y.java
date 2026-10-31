package db0;

import kotlinx.serialization.Serializable;
import kotlinx.serialization.internal.PluginExceptionsKt;
import org.jetbrains.annotations.NotNull;

@Serializable
/* loaded from: classes.dex */
public final class y extends c0 {

    @NotNull
    public static final x Companion = new x();

    /* renamed from: b, reason: collision with root package name */
    public final boolean f49211b;

    /* renamed from: c, reason: collision with root package name */
    public final long f49212c;

    public y(boolean z11, long j11) {
        this.f49211b = z11;
        this.f49212c = j11;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof y)) {
            return false;
        }
        y yVar = (y) obj;
        return this.f49211b == yVar.f49211b && this.f49212c == yVar.f49212c;
    }

    public final int hashCode() {
        return Long.hashCode(this.f49212c) + (Boolean.hashCode(this.f49211b) * 31);
    }

    public final String toString() {
        return "WifiEnabled(isEnabled=" + this.f49211b + ", timestamp=" + this.f49212c + ")";
    }

    public /* synthetic */ y(long j11, int i5, boolean z11) {
        if (3 != (i5 & 3)) {
            PluginExceptionsKt.throwMissingFieldException(i5, 3, w.f49210a.getDescriptor());
        }
        this.f49211b = z11;
        this.f49212c = j11;
    }
}
