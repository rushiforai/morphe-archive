package ads_mobile_sdk;

import b.u1;
import java.util.ArrayList;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class v8 implements u1 {

    /* renamed from: a, reason: collision with root package name */
    public final ArrayList f10634a;

    public v8(ArrayList arrayList) {
        this.f10634a = arrayList;
    }

    @Override // b.u1
    public final void a(ti.p signals) {
        Intrinsics.g(signals, "signals");
        signals.adTypes.addAll(this.f10634a);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof v8) && this.f10634a.equals(((v8) obj).f10634a);
    }

    public final int hashCode() {
        return this.f10634a.hashCode();
    }

    public final String toString() {
        return "AdTypeSignal(adTypes=" + this.f10634a + ")";
    }
}
