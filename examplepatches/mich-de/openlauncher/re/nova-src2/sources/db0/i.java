package db0;

import b.u4;
import kotlinx.serialization.Serializable;
import kotlinx.serialization.internal.PluginExceptionsKt;
import org.jetbrains.annotations.NotNull;

@Serializable
/* loaded from: classes.dex */
public final class i extends c0 {

    @NotNull
    public static final h Companion = new h();

    /* renamed from: b, reason: collision with root package name */
    public final boolean f49155b;

    /* renamed from: c, reason: collision with root package name */
    public final long f49156c;

    /* renamed from: d, reason: collision with root package name */
    public final long f49157d;

    /* renamed from: e, reason: collision with root package name */
    public final int f49158e;

    /* renamed from: f, reason: collision with root package name */
    public final int f49159f;

    /* renamed from: g, reason: collision with root package name */
    public final long f49160g;

    public i(long j11, long j12, long j13, int i5, int i11, boolean z11) {
        this.f49155b = z11;
        this.f49156c = j11;
        this.f49157d = j12;
        this.f49158e = i5;
        this.f49159f = i11;
        this.f49160g = j13;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof i)) {
            return false;
        }
        i iVar = (i) obj;
        return this.f49155b == iVar.f49155b && f0.b(this.f49156c, iVar.f49156c) && f0.b(this.f49157d, iVar.f49157d) && this.f49158e == iVar.f49158e && this.f49159f == iVar.f49159f && this.f49160g == iVar.f49160g;
    }

    public final int hashCode() {
        return Long.hashCode(this.f49160g) + u4.a(this.f49159f, u4.a(this.f49158e, (f0.c(this.f49157d) + ((f0.c(this.f49156c) + (Boolean.hashCode(this.f49155b) * 31)) * 31)) * 31, 31), 31);
    }

    public final String toString() {
        return "BluetoothDevice(isConnected=" + this.f49155b + ", name=" + f0.d(this.f49156c) + ", address=" + f0.d(this.f49157d) + ", type=" + this.f49158e + ", deviceClass=" + this.f49159f + ", timestamp=" + this.f49160g + ")";
    }

    public /* synthetic */ i(int i5, boolean z11, f0 f0Var, f0 f0Var2, int i11, int i12, long j11) {
        if (63 != (i5 & 63)) {
            PluginExceptionsKt.throwMissingFieldException(i5, 63, g.f49146a.getDescriptor());
        }
        this.f49155b = z11;
        this.f49156c = f0Var.e();
        this.f49157d = f0Var2.e();
        this.f49158e = i11;
        this.f49159f = i12;
        this.f49160g = j11;
    }
}
