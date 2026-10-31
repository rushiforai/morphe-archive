package ads_mobile_sdk;

import b.c0;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class w12 {

    /* renamed from: a, reason: collision with root package name */
    public boolean f10990a;

    /* renamed from: d, reason: collision with root package name */
    public long f10991d;

    /* renamed from: f, reason: collision with root package name */
    public qo3 f10992f;

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof w12)) {
            return false;
        }
        w12 w12Var = (w12) obj;
        return this.f10990a == w12Var.f10990a && this.f10991d == w12Var.f10991d && Intrinsics.b(this.f10992f, w12Var.f10992f);
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r0v1, types: [int] */
    /* JADX WARN: Type inference failed for: r0v5 */
    /* JADX WARN: Type inference failed for: r0v6 */
    public final int hashCode() {
        boolean z11 = this.f10990a;
        ?? r02 = z11;
        if (z11) {
            r02 = 1;
        }
        int iD = c0.d(r02 * 29791, 961, this.f10991d);
        qo3 qo3Var = this.f10992f;
        return iD + (qo3Var == null ? 0 : qo3Var.hashCode());
    }

    public final String toString() {
        return "NativeVideoViewabilityState(isVisible=" + this.f10990a + ", isPaused=false, isStopped=false, timestamp=" + this.f10991d + ", doneReason=null, viewabilityEvent=" + this.f10992f + ")";
    }
}
