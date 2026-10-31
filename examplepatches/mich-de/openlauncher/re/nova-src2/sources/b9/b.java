package b9;

import android.graphics.drawable.Drawable;
import x8.l;
import x8.r;

/* loaded from: classes.dex */
public final class b implements f {

    /* renamed from: a, reason: collision with root package name */
    public final g f17642a;

    /* renamed from: b, reason: collision with root package name */
    public final l f17643b;

    /* renamed from: c, reason: collision with root package name */
    public final int f17644c;

    public b(g gVar, l lVar, int i5) {
        this.f17642a = gVar;
        this.f17643b = lVar;
        this.f17644c = i5;
        if (i5 <= 0) {
            throw new IllegalArgumentException("durationMillis must be > 0.");
        }
    }

    @Override // b9.f
    public final void a() {
        g gVar = this.f17642a;
        Drawable drawableX = gVar.x();
        l lVar = this.f17643b;
        boolean z11 = lVar instanceof r;
        q8.a aVar = new q8.a(drawableX, lVar.a(), lVar.b().E, this.f17644c, (z11 && ((r) lVar).f95373g) ? false : true);
        if (z11) {
            gVar.g(aVar);
        } else if (lVar instanceof x8.e) {
            gVar.u(aVar);
        }
    }
}
