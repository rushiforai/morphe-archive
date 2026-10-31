package ads_mobile_sdk;

import java.util.ArrayList;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes2.dex */
public final class cd3 {

    /* renamed from: a, reason: collision with root package name */
    public final int f1823a;

    /* renamed from: b, reason: collision with root package name */
    public final s23 f1824b;

    /* renamed from: c, reason: collision with root package name */
    public final String f1825c;

    /* renamed from: d, reason: collision with root package name */
    public final ArrayList f1826d;

    public cd3(int i5, s23 s23Var, String str, ArrayList arrayList) {
        this.f1823a = i5;
        this.f1824b = s23Var;
        this.f1825c = str;
        this.f1826d = arrayList;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof cd3)) {
            return false;
        }
        cd3 cd3Var = (cd3) obj;
        return this.f1823a == cd3Var.f1823a && this.f1824b == cd3Var.f1824b && Intrinsics.b(this.f1825c, cd3Var.f1825c) && this.f1826d.equals(cd3Var.f1826d);
    }

    public final int hashCode() {
        int iHashCode = Integer.hashCode(this.f1823a) * 31;
        s23 s23Var = this.f1824b;
        int iHashCode2 = (iHashCode + (s23Var == null ? 0 : s23Var.hashCode())) * 31;
        String str = this.f1825c;
        return this.f1826d.hashCode() + ((iHashCode2 + (str != null ? str.hashCode() : 0)) * 31);
    }

    public final String toString() {
        return "SwipeableInterstitialAdConfig(requiredScreenHoldSec=" + this.f1823a + ", videoAutoPlayStartTime=" + this.f1824b + ", interactionUrl=" + this.f1825c + ", interactionTypes=" + this.f1826d + ")";
    }
}
