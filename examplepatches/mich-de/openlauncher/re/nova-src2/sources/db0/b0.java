package db0;

import b.u4;
import kotlinx.serialization.Serializable;
import kotlinx.serialization.internal.PluginExceptionsKt;
import org.jetbrains.annotations.NotNull;

@Serializable
/* loaded from: classes.dex */
public final class b0 extends c0 {

    @NotNull
    public static final a0 Companion = new a0();

    /* renamed from: b, reason: collision with root package name */
    public final boolean f49130b;

    /* renamed from: c, reason: collision with root package name */
    public final long f49131c;

    /* renamed from: d, reason: collision with root package name */
    public final int f49132d;

    /* renamed from: e, reason: collision with root package name */
    public final long f49133e;

    public b0(boolean z11, long j11, int i5, long j12) {
        this.f49130b = z11;
        this.f49131c = j11;
        this.f49132d = i5;
        this.f49133e = j12;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof b0)) {
            return false;
        }
        b0 b0Var = (b0) obj;
        return this.f49130b == b0Var.f49130b && f0.b(this.f49131c, b0Var.f49131c) && this.f49132d == b0Var.f49132d && this.f49133e == b0Var.f49133e;
    }

    public final int hashCode() {
        return Long.hashCode(this.f49133e) + u4.a(this.f49132d, (f0.c(this.f49131c) + (Boolean.hashCode(this.f49130b) * 31)) * 31, 31);
    }

    public final String toString() {
        return "WifiNetwork(isConnected=" + this.f49130b + ", ssid=" + f0.d(this.f49131c) + ", networkId=" + this.f49132d + ", timestamp=" + this.f49133e + ")";
    }

    public /* synthetic */ b0(int i5, boolean z11, f0 f0Var, int i11, long j11) {
        if (15 != (i5 & 15)) {
            PluginExceptionsKt.throwMissingFieldException(i5, 15, z.f49213a.getDescriptor());
        }
        this.f49130b = z11;
        this.f49131c = f0Var.e();
        this.f49132d = i11;
        this.f49133e = j11;
    }
}
