package ns;

import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.Serializable;
import kotlinx.serialization.internal.PluginExceptionsKt;
import org.jetbrains.annotations.NotNull;

@Serializable
/* loaded from: classes4.dex */
public final class o {

    @NotNull
    public static final n Companion = new n();

    /* renamed from: a, reason: collision with root package name */
    public final String f78547a;

    /* renamed from: b, reason: collision with root package name */
    public final long f78548b;

    public /* synthetic */ o(int i5, String str, long j11) {
        if (3 != (i5 & 3)) {
            PluginExceptionsKt.throwMissingFieldException(i5, 3, m.f78546a.getDescriptor());
        }
        this.f78547a = str;
        this.f78548b = j11;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof o)) {
            return false;
        }
        o oVar = (o) obj;
        return Intrinsics.b(this.f78547a, oVar.f78547a) && this.f78548b == oVar.f78548b;
    }

    public final int hashCode() {
        return Long.hashCode(this.f78548b) + (this.f78547a.hashCode() * 31);
    }

    public final String toString() {
        return "PaymentInfo(currency=" + this.f78547a + ", amount=" + this.f78548b + ")";
    }

    public o(String currency, long j11) {
        Intrinsics.g(currency, "currency");
        this.f78547a = currency;
        this.f78548b = j11;
    }
}
