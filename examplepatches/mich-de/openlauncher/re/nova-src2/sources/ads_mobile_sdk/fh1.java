package ads_mobile_sdk;

import b.c0;
import b.k9;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes2.dex */
public final class fh1 {

    /* renamed from: a, reason: collision with root package name */
    public String f3351a = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;

    /* renamed from: b, reason: collision with root package name */
    public String f3352b = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;

    /* renamed from: c, reason: collision with root package name */
    public int f3353c = 0;

    /* renamed from: d, reason: collision with root package name */
    public bw0 f3354d = bw0.SCAR_REQUEST_TYPE_UNSPECIFIED;

    /* renamed from: e, reason: collision with root package name */
    public int f3355e = 0;

    /* renamed from: f, reason: collision with root package name */
    public te2 f3356f = null;

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof fh1)) {
            return false;
        }
        fh1 fh1Var = (fh1) obj;
        return Intrinsics.b(this.f3351a, fh1Var.f3351a) && Intrinsics.b(this.f3352b, fh1Var.f3352b) && this.f3353c == fh1Var.f3353c && this.f3354d == fh1Var.f3354d && this.f3355e == fh1Var.f3355e && Intrinsics.b(this.f3356f, fh1Var.f3356f);
    }

    public final int hashCode() {
        int iB = k9.b(this.f3355e, (this.f3354d.hashCode() + k9.b(this.f3353c, c0.e(this.f3351a.hashCode() * 31, 31, this.f3352b))) * 31);
        te2 te2Var = this.f3356f;
        return iB + (te2Var == null ? 0 : te2Var.hashCode());
    }

    public final String toString() {
        String str = this.f3351a;
        String str2 = this.f3352b;
        int i5 = this.f3353c;
        bw0 bw0Var = this.f3354d;
        int i11 = this.f3355e;
        te2 te2Var = this.f3356f;
        StringBuilder sbW = c0.w("InternalRequestTraceMeta(internalRequestId=", str, ", gwsQueryId=", str2, ", sequenceNumber=");
        sbW.append(i5);
        sbW.append(", scarRequestType=");
        sbW.append(bw0Var);
        sbW.append(", mediationChainLength=");
        sbW.append(i11);
        sbW.append(", persistentCacheRequestData=");
        sbW.append(te2Var);
        sbW.append(")");
        return sbW.toString();
    }
}
