package p10;

import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.Serializable;
import kotlinx.serialization.internal.PluginExceptionsKt;
import org.jetbrains.annotations.NotNull;

@Serializable
/* loaded from: classes4.dex */
public final class k {

    @NotNull
    public static final j Companion = new j();

    /* renamed from: a, reason: collision with root package name */
    public final long f81802a;

    /* renamed from: b, reason: collision with root package name */
    public final long f81803b;

    /* renamed from: c, reason: collision with root package name */
    public final String f81804c;

    public /* synthetic */ k(int i5, long j11, long j12, String str) {
        if (7 != (i5 & 7)) {
            PluginExceptionsKt.throwMissingFieldException(i5, 7, i.f81789a.getDescriptor());
        }
        this.f81802a = j11;
        this.f81803b = j12;
        this.f81804c = str;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof k)) {
            return false;
        }
        k kVar = (k) obj;
        return this.f81802a == kVar.f81802a && this.f81803b == kVar.f81803b && Intrinsics.b(this.f81804c, kVar.f81804c);
    }

    public final int hashCode() {
        return this.f81804c.hashCode() + b.c0.d(Long.hashCode(this.f81802a) * 31, 31, this.f81803b);
    }

    public final String toString() {
        StringBuilder sbU = b.c0.u(this.f81802a, "CoinTransaction(timestampMs=", ", delta=");
        sbU.append(this.f81803b);
        sbU.append(", reason=");
        sbU.append(this.f81804c);
        sbU.append(")");
        return sbU.toString();
    }

    public k(long j11, long j12, String str) {
        this.f81802a = j11;
        this.f81803b = j12;
        this.f81804c = str;
    }
}
