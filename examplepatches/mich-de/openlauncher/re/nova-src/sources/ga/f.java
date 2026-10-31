package ga;

import aa.n;
import android.content.Context;
import com.android.launcher3.icons.BitmapInfo;
import com.teslacoilsw.launcher.icon.NovaIconSource;
import com.teslacoilsw.launcher.icon.UriIconSource;
import com.teslacoilsw.launcher.util.NamedIntent;

/* loaded from: classes.dex */
public abstract class f extends e {

    /* renamed from: r, reason: collision with root package name */
    public BitmapInfo f57304r;

    /* renamed from: s, reason: collision with root package name */
    public int f57305s;

    /* renamed from: t, reason: collision with root package name */
    public int f57306t;

    /* renamed from: u, reason: collision with root package name */
    public NovaIconSource f57307u;

    /* renamed from: v, reason: collision with root package name */
    public NamedIntent f57308v;

    /* renamed from: w, reason: collision with root package name */
    public NamedIntent f57309w;

    public f() {
        this.f57304r = BitmapInfo.f21150d;
        this.f57305s = 0;
        this.f57306t = 100;
        this.f57307u = null;
    }

    public final void C0(int i5, int i11) {
        if (i11 == 1) {
            this.f57306t = i5;
            this.f57305s = i5 < 100 ? this.f57305s | 1024 : this.f57305s & (-1025);
        } else {
            if (i11 != 2) {
                this.f57306t = i11 != 0 ? 0 : 100;
                this.f57305s &= -3073;
                return;
            }
            this.f57306t = i5;
            int i12 = this.f57305s;
            int i13 = i12 & (-1025);
            this.f57305s = i13;
            this.f57305s = i5 < 100 ? i13 | 2048 : i12 & (-3073);
        }
    }

    public final void K0(ja.d dVar) {
        int i5 = dVar.f69284c;
        int i11 = dVar.f69283b;
        C0(i5, i11);
        if (i11 == 3) {
            ea.b.b("ItemInfoDebug", "Icon info: " + this + " marked broken with install info: " + dVar, new Exception());
        }
    }

    public final boolean L0() {
        if (BitmapInfo.f21149c == this.f57304r.f21151a) {
            return ((this.f57307u instanceof UriIconSource) && this.f57303q.a()) ? false : true;
        }
        return false;
    }

    @Override // ga.e
    public void a(e eVar) {
        if (!(eVar instanceof f)) {
            throw new IllegalStateException();
        }
        super.a(eVar);
        f fVar = (f) eVar;
        this.f57304r = fVar.f57304r;
        this.f57305s = fVar.f57305s;
        this.f57307u = fVar.f57307u;
        this.f57308v = fVar.f57308v;
        this.f57309w = fVar.f57309w;
    }

    @Override // ga.e
    public final void b0(ya.b bVar) {
        super.b0(bVar);
        bVar.i("flingUpIntent", this.f57308v);
        bVar.i("flingDownIntent", this.f57309w);
    }

    public final int f0() {
        if ((this.f57305s & 3072) != 0) {
            return this.f57306t;
        }
        return 100;
    }

    @Override // ga.e
    public final boolean m() {
        return (this.f57305s & 63) != 0;
    }

    public final boolean p0() {
        int i5 = this.f57305s;
        if ((i5 & 1024) == 0) {
            return (i5 & 2048) != 0 || this.f57306t == 100;
        }
        return false;
    }

    public final n r0(Context context, boolean z11) {
        n nVarI = z11 ? this.f57304r.i(context) : this.f57304r.f(context);
        nVarI.j(m());
        return nVarI;
    }

    public f(f fVar) {
        this.f57289a = -1;
        this.f57291c = -1;
        this.f57292d = -1;
        n30.a aVar = n30.a.f77776b;
        this.f57293e = aVar;
        this.f57294f = aVar;
        n30.b bVar = n30.b.f77779c;
        this.f57295g = bVar;
        this.f57296h = bVar;
        this.f57297i = bVar;
        this.f57298j = bVar;
        this.f57299k = 0;
        this.f57302p = 0;
        this.f57303q = new iz.c(0);
        a(fVar);
        this.f57304r = BitmapInfo.f21150d;
        this.f57305s = 0;
        this.f57306t = 100;
        this.f57307u = null;
        this.f57304r = fVar.f57304r;
        this.f57306t = fVar.f57306t;
        this.f57305s = fVar.f57305s;
        this.o = fVar.o;
        this.f57307u = fVar.f57307u;
    }
}
