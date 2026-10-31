package fe;

import com.google.android.exoplayer2.ExoPlaybackException;
import java.util.List;
import xk.r2;

/* loaded from: classes3.dex */
public final class f1 {

    /* renamed from: s, reason: collision with root package name */
    public static final gf.w f54763s = new gf.w(new Object());

    /* renamed from: a, reason: collision with root package name */
    public final z1 f54764a;

    /* renamed from: b, reason: collision with root package name */
    public final gf.w f54765b;

    /* renamed from: c, reason: collision with root package name */
    public final long f54766c;

    /* renamed from: d, reason: collision with root package name */
    public final long f54767d;

    /* renamed from: e, reason: collision with root package name */
    public final int f54768e;

    /* renamed from: f, reason: collision with root package name */
    public final ExoPlaybackException f54769f;

    /* renamed from: g, reason: collision with root package name */
    public final boolean f54770g;

    /* renamed from: h, reason: collision with root package name */
    public final gf.y0 f54771h;

    /* renamed from: i, reason: collision with root package name */
    public final tf.v f54772i;

    /* renamed from: j, reason: collision with root package name */
    public final List f54773j;

    /* renamed from: k, reason: collision with root package name */
    public final gf.w f54774k;

    /* renamed from: l, reason: collision with root package name */
    public final boolean f54775l;

    /* renamed from: m, reason: collision with root package name */
    public final int f54776m;
    public final g1 n;
    public final boolean o;

    /* renamed from: p, reason: collision with root package name */
    public volatile long f54777p;

    /* renamed from: q, reason: collision with root package name */
    public volatile long f54778q;

    /* renamed from: r, reason: collision with root package name */
    public volatile long f54779r;

    public f1(z1 z1Var, gf.w wVar, long j11, long j12, int i5, ExoPlaybackException exoPlaybackException, boolean z11, gf.y0 y0Var, tf.v vVar, List list, gf.w wVar2, boolean z12, int i11, g1 g1Var, long j13, long j14, long j15, boolean z13) {
        this.f54764a = z1Var;
        this.f54765b = wVar;
        this.f54766c = j11;
        this.f54767d = j12;
        this.f54768e = i5;
        this.f54769f = exoPlaybackException;
        this.f54770g = z11;
        this.f54771h = y0Var;
        this.f54772i = vVar;
        this.f54773j = list;
        this.f54774k = wVar2;
        this.f54775l = z12;
        this.f54776m = i11;
        this.n = g1Var;
        this.f54777p = j13;
        this.f54778q = j14;
        this.f54779r = j15;
        this.o = z13;
    }

    public static f1 h(tf.v vVar) {
        gf.y0 y0Var = gf.y0.f57665d;
        r2 r2Var = r2.f96007e;
        g1 g1Var = g1.f54796d;
        w1 w1Var = z1.f55127a;
        gf.w wVar = f54763s;
        return new f1(w1Var, wVar, -9223372036854775807L, 0L, 1, null, false, y0Var, vVar, r2Var, wVar, false, 0, g1Var, 0L, 0L, 0L, false);
    }

    public final f1 a(gf.w wVar) {
        return new f1(this.f54764a, this.f54765b, this.f54766c, this.f54767d, this.f54768e, this.f54769f, this.f54770g, this.f54771h, this.f54772i, this.f54773j, wVar, this.f54775l, this.f54776m, this.n, this.f54777p, this.f54778q, this.f54779r, this.o);
    }

    public final f1 b(gf.w wVar, long j11, long j12, long j13, long j14, gf.y0 y0Var, tf.v vVar, List list) {
        return new f1(this.f54764a, wVar, j12, j13, this.f54768e, this.f54769f, this.f54770g, y0Var, vVar, list, this.f54774k, this.f54775l, this.f54776m, this.n, this.f54777p, j14, j11, this.o);
    }

    public final f1 c(int i5, boolean z11) {
        return new f1(this.f54764a, this.f54765b, this.f54766c, this.f54767d, this.f54768e, this.f54769f, this.f54770g, this.f54771h, this.f54772i, this.f54773j, this.f54774k, z11, i5, this.n, this.f54777p, this.f54778q, this.f54779r, this.o);
    }

    public final f1 d(ExoPlaybackException exoPlaybackException) {
        return new f1(this.f54764a, this.f54765b, this.f54766c, this.f54767d, this.f54768e, exoPlaybackException, this.f54770g, this.f54771h, this.f54772i, this.f54773j, this.f54774k, this.f54775l, this.f54776m, this.n, this.f54777p, this.f54778q, this.f54779r, this.o);
    }

    public final f1 e(g1 g1Var) {
        return new f1(this.f54764a, this.f54765b, this.f54766c, this.f54767d, this.f54768e, this.f54769f, this.f54770g, this.f54771h, this.f54772i, this.f54773j, this.f54774k, this.f54775l, this.f54776m, g1Var, this.f54777p, this.f54778q, this.f54779r, this.o);
    }

    public final f1 f(int i5) {
        return new f1(this.f54764a, this.f54765b, this.f54766c, this.f54767d, i5, this.f54769f, this.f54770g, this.f54771h, this.f54772i, this.f54773j, this.f54774k, this.f54775l, this.f54776m, this.n, this.f54777p, this.f54778q, this.f54779r, this.o);
    }

    public final f1 g(z1 z1Var) {
        return new f1(z1Var, this.f54765b, this.f54766c, this.f54767d, this.f54768e, this.f54769f, this.f54770g, this.f54771h, this.f54772i, this.f54773j, this.f54774k, this.f54775l, this.f54776m, this.n, this.f54777p, this.f54778q, this.f54779r, this.o);
    }
}
