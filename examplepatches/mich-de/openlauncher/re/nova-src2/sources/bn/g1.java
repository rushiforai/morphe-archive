package bn;

import kotlinx.serialization.Serializable;
import kotlinx.serialization.internal.PluginExceptionsKt;
import org.jetbrains.annotations.NotNull;

@Serializable
/* loaded from: classes3.dex */
public final class g1 {

    @NotNull
    public static final f1 Companion = new f1();

    /* renamed from: a, reason: collision with root package name */
    public final long f18197a;

    /* renamed from: b, reason: collision with root package name */
    public final long f18198b;

    /* renamed from: c, reason: collision with root package name */
    public final long f18199c;

    public /* synthetic */ g1(long j11, long j12, int i5, long j13) {
        if (1 != (i5 & 1)) {
            PluginExceptionsKt.throwMissingFieldException(i5, 1, e1.f18183a.getDescriptor());
        }
        this.f18197a = j11;
        this.f18198b = (i5 & 2) == 0 ? 1000 * j11 : j12;
        if ((i5 & 4) == 0) {
            this.f18199c = j11 / 1000;
        } else {
            this.f18199c = j13;
        }
    }

    public final long a() {
        return this.f18198b;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof g1) && this.f18197a == ((g1) obj).f18197a;
    }

    public final int hashCode() {
        return Long.hashCode(this.f18197a);
    }

    public final String toString() {
        return a2.c.n(new StringBuilder("Time(ms="), this.f18197a, ')');
    }

    public g1(long j11) {
        this.f18197a = j11;
        long j12 = 1000;
        this.f18198b = j11 * j12;
        this.f18199c = j11 / j12;
    }
}
