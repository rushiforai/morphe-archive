package com.fyber.inneractive.sdk.player.exoplayer2;

/* loaded from: classes3.dex */
public final class s {

    /* renamed from: d, reason: collision with root package name */
    public static final s f30148d = new s(1.0f, 1.0f);

    /* renamed from: a, reason: collision with root package name */
    public final float f30149a;

    /* renamed from: b, reason: collision with root package name */
    public final float f30150b;

    /* renamed from: c, reason: collision with root package name */
    public final int f30151c;

    public s(float f11, float f12) {
        this.f30149a = f11;
        this.f30150b = f12;
        this.f30151c = Math.round(f11 * 1000.0f);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj != null && s.class == obj.getClass()) {
            s sVar = (s) obj;
            if (this.f30149a == sVar.f30149a && this.f30150b == sVar.f30150b) {
                return true;
            }
        }
        return false;
    }

    public final int hashCode() {
        return Float.floatToRawIntBits(this.f30150b) + ((Float.floatToRawIntBits(this.f30149a) + 527) * 31);
    }
}
