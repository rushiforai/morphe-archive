package l1;

import com.amplitude.eventbridge.EventBridgeChannel;
import com.google.firebase.crashlytics.internal.metadata.UserMetadata;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class p9 {

    /* renamed from: a, reason: collision with root package name */
    public final m3.p0 f73798a;

    /* renamed from: b, reason: collision with root package name */
    public final m3.p0 f73799b;

    /* renamed from: c, reason: collision with root package name */
    public final m3.p0 f73800c;

    /* renamed from: d, reason: collision with root package name */
    public final m3.p0 f73801d;

    /* renamed from: e, reason: collision with root package name */
    public final m3.p0 f73802e;

    /* renamed from: f, reason: collision with root package name */
    public final m3.p0 f73803f;

    /* renamed from: g, reason: collision with root package name */
    public final m3.p0 f73804g;

    /* renamed from: h, reason: collision with root package name */
    public final m3.p0 f73805h;

    /* renamed from: i, reason: collision with root package name */
    public final m3.p0 f73806i;

    /* renamed from: j, reason: collision with root package name */
    public final m3.p0 f73807j;

    /* renamed from: k, reason: collision with root package name */
    public final m3.p0 f73808k;

    /* renamed from: l, reason: collision with root package name */
    public final m3.p0 f73809l;

    /* renamed from: m, reason: collision with root package name */
    public final m3.p0 f73810m;
    public final m3.p0 n;
    public final m3.p0 o;

    public p9(m3.p0 p0Var, m3.p0 p0Var2, m3.p0 p0Var3, m3.p0 p0Var4, int i5) {
        this(o1.h0.f79071d, o1.h0.f79072e, o1.h0.f79073f, o1.h0.f79074g, (i5 & 16) != 0 ? o1.h0.f79075h : p0Var, o1.h0.f79076i, (i5 & 64) != 0 ? o1.h0.f79080m : p0Var2, o1.h0.n, o1.h0.o, (i5 & EventBridgeChannel.QUEUE_CAPACITY) != 0 ? o1.h0.f79068a : p0Var3, o1.h0.f79069b, o1.h0.f79070c, o1.h0.f79077j, (i5 & UserMetadata.MAX_INTERNAL_KEY_SIZE) != 0 ? o1.h0.f79078k : p0Var4, o1.h0.f79079l);
    }

    public static p9 a(p9 p9Var, m3.p0 p0Var, m3.p0 p0Var2, m3.p0 p0Var3, int i5) {
        m3.p0 p0Var4 = p9Var.f73798a;
        m3.p0 p0Var5 = p9Var.f73799b;
        m3.p0 p0Var6 = p9Var.f73800c;
        m3.p0 p0Var7 = p9Var.f73801d;
        m3.p0 p0Var8 = (i5 & 16) != 0 ? p9Var.f73802e : p0Var;
        m3.p0 p0Var9 = p9Var.f73803f;
        m3.p0 p0Var10 = (i5 & 64) != 0 ? p9Var.f73804g : p0Var2;
        m3.p0 p0Var11 = p9Var.f73805h;
        m3.p0 p0Var12 = p9Var.f73806i;
        m3.p0 p0Var13 = p9Var.f73808k;
        m3.p0 p0Var14 = p9Var.f73809l;
        m3.p0 p0Var15 = p9Var.f73810m;
        m3.p0 p0Var16 = p9Var.n;
        m3.p0 p0Var17 = p9Var.o;
        p9Var.getClass();
        return new p9(p0Var4, p0Var5, p0Var6, p0Var7, p0Var8, p0Var9, p0Var10, p0Var11, p0Var12, p0Var3, p0Var13, p0Var14, p0Var15, p0Var16, p0Var17);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof p9)) {
            return false;
        }
        p9 p9Var = (p9) obj;
        return Intrinsics.b(this.f73798a, p9Var.f73798a) && Intrinsics.b(this.f73799b, p9Var.f73799b) && Intrinsics.b(this.f73800c, p9Var.f73800c) && Intrinsics.b(this.f73801d, p9Var.f73801d) && Intrinsics.b(this.f73802e, p9Var.f73802e) && Intrinsics.b(this.f73803f, p9Var.f73803f) && Intrinsics.b(this.f73804g, p9Var.f73804g) && Intrinsics.b(this.f73805h, p9Var.f73805h) && Intrinsics.b(this.f73806i, p9Var.f73806i) && Intrinsics.b(this.f73807j, p9Var.f73807j) && Intrinsics.b(this.f73808k, p9Var.f73808k) && Intrinsics.b(this.f73809l, p9Var.f73809l) && Intrinsics.b(this.f73810m, p9Var.f73810m) && Intrinsics.b(this.n, p9Var.n) && Intrinsics.b(this.o, p9Var.o);
    }

    public final int hashCode() {
        return this.o.hashCode() + com.google.android.gms.internal.measurement.k2.g(com.google.android.gms.internal.measurement.k2.g(com.google.android.gms.internal.measurement.k2.g(com.google.android.gms.internal.measurement.k2.g(com.google.android.gms.internal.measurement.k2.g(com.google.android.gms.internal.measurement.k2.g(com.google.android.gms.internal.measurement.k2.g(com.google.android.gms.internal.measurement.k2.g(com.google.android.gms.internal.measurement.k2.g(com.google.android.gms.internal.measurement.k2.g(com.google.android.gms.internal.measurement.k2.g(com.google.android.gms.internal.measurement.k2.g(com.google.android.gms.internal.measurement.k2.g(this.f73798a.hashCode() * 31, 31, this.f73799b), 31, this.f73800c), 31, this.f73801d), 31, this.f73802e), 31, this.f73803f), 31, this.f73804g), 31, this.f73805h), 31, this.f73806i), 31, this.f73807j), 31, this.f73808k), 31, this.f73809l), 31, this.f73810m), 31, this.n);
    }

    public final String toString() {
        return "Typography(displayLarge=" + this.f73798a + ", displayMedium=" + this.f73799b + ",displaySmall=" + this.f73800c + ", headlineLarge=" + this.f73801d + ", headlineMedium=" + this.f73802e + ", headlineSmall=" + this.f73803f + ", titleLarge=" + this.f73804g + ", titleMedium=" + this.f73805h + ", titleSmall=" + this.f73806i + ", bodyLarge=" + this.f73807j + ", bodyMedium=" + this.f73808k + ", bodySmall=" + this.f73809l + ", labelLarge=" + this.f73810m + ", labelMedium=" + this.n + ", labelSmall=" + this.o + ')';
    }

    public p9(m3.p0 p0Var, m3.p0 p0Var2, m3.p0 p0Var3, m3.p0 p0Var4, m3.p0 p0Var5, m3.p0 p0Var6, m3.p0 p0Var7, m3.p0 p0Var8, m3.p0 p0Var9, m3.p0 p0Var10, m3.p0 p0Var11, m3.p0 p0Var12, m3.p0 p0Var13, m3.p0 p0Var14, m3.p0 p0Var15) {
        this.f73798a = p0Var;
        this.f73799b = p0Var2;
        this.f73800c = p0Var3;
        this.f73801d = p0Var4;
        this.f73802e = p0Var5;
        this.f73803f = p0Var6;
        this.f73804g = p0Var7;
        this.f73805h = p0Var8;
        this.f73806i = p0Var9;
        this.f73807j = p0Var10;
        this.f73808k = p0Var11;
        this.f73809l = p0Var12;
        this.f73810m = p0Var13;
        this.n = p0Var14;
        this.o = p0Var15;
    }
}
