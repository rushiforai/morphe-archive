package ads_mobile_sdk;

import java.util.Arrays;
import java.util.UUID;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes2.dex */
public final class qi3 {

    /* renamed from: a, reason: collision with root package name */
    public final UUID f8684a;

    /* renamed from: b, reason: collision with root package name */
    public final cc2[] f8685b;

    public qi3(UUID rootTraceId, cc2[] perTraceMeta) {
        Intrinsics.g(rootTraceId, "rootTraceId");
        Intrinsics.g(perTraceMeta, "perTraceMeta");
        this.f8684a = rootTraceId;
        this.f8685b = perTraceMeta;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof qi3)) {
            return false;
        }
        qi3 qi3Var = (qi3) obj;
        return Intrinsics.b(this.f8684a, qi3Var.f8684a) && Intrinsics.b(this.f8685b, qi3Var.f8685b);
    }

    public final int hashCode() {
        return Arrays.hashCode(this.f8685b) + (this.f8684a.hashCode() * 31);
    }

    public final String toString() {
        return "TraceSnapshot(rootTraceId=" + this.f8684a + ", perTraceMeta=" + Arrays.toString(this.f8685b) + ")";
    }
}
