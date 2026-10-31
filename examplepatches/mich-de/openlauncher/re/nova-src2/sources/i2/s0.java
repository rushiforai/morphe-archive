package i2;

import androidx.recyclerview.widget.u1;
import com.google.firebase.crashlytics.internal.metadata.UserMetadata;
import kotlin.ULong;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.json.internal.ReaderJsonLexerKt;

/* loaded from: classes.dex */
public final class s0 implements a0 {

    /* renamed from: a, reason: collision with root package name */
    public int f61149a;

    /* renamed from: b, reason: collision with root package name */
    public float f61150b = 1.0f;

    /* renamed from: c, reason: collision with root package name */
    public float f61151c = 1.0f;

    /* renamed from: d, reason: collision with root package name */
    public float f61152d = 1.0f;

    /* renamed from: e, reason: collision with root package name */
    public float f61153e;

    /* renamed from: f, reason: collision with root package name */
    public float f61154f;

    /* renamed from: g, reason: collision with root package name */
    public float f61155g;

    /* renamed from: h, reason: collision with root package name */
    public long f61156h;

    /* renamed from: i, reason: collision with root package name */
    public long f61157i;

    /* renamed from: j, reason: collision with root package name */
    public float f61158j;

    /* renamed from: k, reason: collision with root package name */
    public float f61159k;

    /* renamed from: l, reason: collision with root package name */
    public long f61160l;

    /* renamed from: m, reason: collision with root package name */
    public v0 f61161m;
    public boolean n;
    public long o;

    /* renamed from: p, reason: collision with root package name */
    public y3.c f61162p;

    /* renamed from: q, reason: collision with root package name */
    public y3.n f61163q;

    /* renamed from: r, reason: collision with root package name */
    public int f61164r;

    /* renamed from: s, reason: collision with root package name */
    public r0 f61165s;

    public s0() {
        long j11 = b0.f61098a;
        this.f61156h = j11;
        this.f61157i = j11;
        this.f61159k = 8.0f;
        this.f61160l = y0.f61191b;
        this.f61161m = r0.f61135a;
        this.o = 9205357640488583168L;
        this.f61162p = v70.o.c();
        this.f61163q = y3.n.f96612a;
        this.f61164r = 3;
    }

    public final void a(float f11) {
        if (this.f61152d == f11) {
            return;
        }
        this.f61149a |= 4;
        this.f61152d = f11;
    }

    public final void b(long j11) {
        long j12 = this.f61156h;
        int i5 = s.n;
        if (ULong.a(j12, j11)) {
            return;
        }
        this.f61149a |= 64;
        this.f61156h = j11;
    }

    public final void f(boolean z11) {
        if (this.n != z11) {
            this.f61149a |= ReaderJsonLexerKt.BATCH_SIZE;
            this.n = z11;
        }
    }

    public final void g(float f11) {
        if (this.f61158j == f11) {
            return;
        }
        this.f61149a |= 1024;
        this.f61158j = f11;
    }

    @Override // y3.c
    public final float getDensity() {
        return this.f61162p.getDensity();
    }

    @Override // y3.c
    public final float getFontScale() {
        return this.f61162p.getFontScale();
    }

    public final void i(float f11) {
        if (this.f61150b == f11) {
            return;
        }
        this.f61149a |= 1;
        this.f61150b = f11;
    }

    public final void j(float f11) {
        if (this.f61151c == f11) {
            return;
        }
        this.f61149a |= 2;
        this.f61151c = f11;
    }

    public final void k(float f11) {
        if (this.f61155g == f11) {
            return;
        }
        this.f61149a |= 32;
        this.f61155g = f11;
    }

    public final void m(v0 v0Var) {
        if (Intrinsics.b(this.f61161m, v0Var)) {
            return;
        }
        this.f61149a |= UserMetadata.MAX_INTERNAL_KEY_SIZE;
        this.f61161m = v0Var;
    }

    public final void n(long j11) {
        long j12 = this.f61157i;
        int i5 = s.n;
        if (ULong.a(j12, j11)) {
            return;
        }
        this.f61149a |= 128;
        this.f61157i = j11;
    }

    public final void o(long j11) {
        if (y0.a(this.f61160l, j11)) {
            return;
        }
        this.f61149a |= u1.FLAG_APPEARED_IN_PRE_LAYOUT;
        this.f61160l = j11;
    }

    public final void q(float f11) {
        if (this.f61153e == f11) {
            return;
        }
        this.f61149a |= 8;
        this.f61153e = f11;
    }

    public final void t(float f11) {
        if (this.f61154f == f11) {
            return;
        }
        this.f61149a |= 16;
        this.f61154f = f11;
    }
}
