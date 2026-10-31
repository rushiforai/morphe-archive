package ads_mobile_sdk;

import b.u1;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class zf0 implements u1 {

    /* renamed from: a, reason: collision with root package name */
    public final String f12527a;

    /* renamed from: b, reason: collision with root package name */
    public final boolean f12528b;

    public zf0(String str, boolean z11) {
        this.f12527a = str;
        this.f12528b = z11;
    }

    @Override // b.u1
    public final void a(ti.p signals) {
        Intrinsics.g(signals, "signals");
        String str = this.f12527a;
        if (str.length() > 0) {
            signals.creativeToken = str;
        }
        if (this.f12528b) {
            signals.debugSignalsEnabled = "1";
        }
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof zf0)) {
            return false;
        }
        zf0 zf0Var = (zf0) obj;
        return Intrinsics.b(this.f12527a, zf0Var.f12527a) && this.f12528b == zf0Var.f12528b;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public final int hashCode() {
        int iHashCode = this.f12527a.hashCode() * 31;
        boolean z11 = this.f12528b;
        int i5 = z11;
        if (z11 != 0) {
            i5 = 1;
        }
        return iHashCode + i5;
    }

    public final String toString() {
        return "DebugSignal(creativePreviewToken=" + this.f12527a + ", isTroubleshooting=" + this.f12528b + ")";
    }
}
