package db0;

import kotlinx.serialization.Serializable;
import kotlinx.serialization.internal.PluginExceptionsKt;
import org.jetbrains.annotations.NotNull;

@Serializable
/* loaded from: classes.dex */
public final class l extends c0 {

    @NotNull
    public static final k Companion = new k();

    /* renamed from: b, reason: collision with root package name */
    public final boolean f49168b;

    /* renamed from: c, reason: collision with root package name */
    public final long f49169c;

    public l(boolean z11, long j11) {
        this.f49168b = z11;
        this.f49169c = j11;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof l)) {
            return false;
        }
        l lVar = (l) obj;
        return this.f49168b == lVar.f49168b && this.f49169c == lVar.f49169c;
    }

    public final int hashCode() {
        return Long.hashCode(this.f49169c) + (Boolean.hashCode(this.f49168b) * 31);
    }

    public final String toString() {
        return "BluetoothEnabled(isEnabled=" + this.f49168b + ", timestamp=" + this.f49169c + ")";
    }

    public /* synthetic */ l(long j11, int i5, boolean z11) {
        if (3 != (i5 & 3)) {
            PluginExceptionsKt.throwMissingFieldException(i5, 3, j.f49161a.getDescriptor());
        }
        this.f49168b = z11;
        this.f49169c = j11;
    }
}
