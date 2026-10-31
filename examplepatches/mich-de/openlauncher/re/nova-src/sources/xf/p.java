package xf;

import com.vungle.ads.internal.protos.Sdk;

/* loaded from: classes3.dex */
public final class p implements fe.e {

    /* renamed from: e, reason: collision with root package name */
    public static final p f95825e = new p(0, 1.0f, 0, 0);

    /* renamed from: a, reason: collision with root package name */
    public final int f95826a;

    /* renamed from: b, reason: collision with root package name */
    public final int f95827b;

    /* renamed from: c, reason: collision with root package name */
    public final int f95828c;

    /* renamed from: d, reason: collision with root package name */
    public final float f95829d;

    public p(int i5, float f11, int i11, int i12) {
        this.f95826a = i5;
        this.f95827b = i11;
        this.f95828c = i12;
        this.f95829d = f11;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj instanceof p) {
            p pVar = (p) obj;
            if (this.f95826a == pVar.f95826a && this.f95827b == pVar.f95827b && this.f95828c == pVar.f95828c && this.f95829d == pVar.f95829d) {
                return true;
            }
        }
        return false;
    }

    public final int hashCode() {
        return Float.floatToRawIntBits(this.f95829d) + ((((((Sdk.SDKError.Reason.AD_RESPONSE_TIMED_OUT_VALUE + this.f95826a) * 31) + this.f95827b) * 31) + this.f95828c) * 31);
    }
}
