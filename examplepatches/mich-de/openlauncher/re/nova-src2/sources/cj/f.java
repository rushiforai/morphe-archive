package cj;

import android.animation.ObjectAnimator;
import android.animation.TimeInterpolator;
import b.c0;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* loaded from: classes3.dex */
public final class f {

    /* renamed from: a, reason: collision with root package name */
    public long f19961a;

    /* renamed from: c, reason: collision with root package name */
    public TimeInterpolator f19963c = null;

    /* renamed from: d, reason: collision with root package name */
    public int f19964d = 0;

    /* renamed from: e, reason: collision with root package name */
    public int f19965e = 1;

    /* renamed from: b, reason: collision with root package name */
    public long f19962b = 150;

    public f(long j11) {
        this.f19961a = j11;
    }

    public final void a(ObjectAnimator objectAnimator) {
        objectAnimator.setStartDelay(this.f19961a);
        objectAnimator.setDuration(this.f19962b);
        objectAnimator.setInterpolator(b());
        objectAnimator.setRepeatCount(this.f19964d);
        objectAnimator.setRepeatMode(this.f19965e);
    }

    public final TimeInterpolator b() {
        TimeInterpolator timeInterpolator = this.f19963c;
        return timeInterpolator != null ? timeInterpolator : a.f19952b;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof f)) {
            return false;
        }
        f fVar = (f) obj;
        if (this.f19961a == fVar.f19961a && this.f19962b == fVar.f19962b && this.f19964d == fVar.f19964d && this.f19965e == fVar.f19965e) {
            return b().getClass().equals(fVar.b().getClass());
        }
        return false;
    }

    public final int hashCode() {
        long j11 = this.f19961a;
        long j12 = this.f19962b;
        return ((((b().getClass().hashCode() + (((((int) (j11 ^ (j11 >>> 32))) * 31) + ((int) ((j12 >>> 32) ^ j12))) * 31)) * 31) + this.f19964d) * 31) + this.f19965e;
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("\n");
        sb2.append(f.class.getName());
        sb2.append(AbstractJsonLexerKt.BEGIN_OBJ);
        sb2.append(Integer.toHexString(System.identityHashCode(this)));
        sb2.append(" delay: ");
        sb2.append(this.f19961a);
        sb2.append(" duration: ");
        sb2.append(this.f19962b);
        sb2.append(" interpolator: ");
        sb2.append(b().getClass());
        sb2.append(" repeatCount: ");
        sb2.append(this.f19964d);
        sb2.append(" repeatMode: ");
        return c0.o(sb2, this.f19965e, "}\n");
    }
}
