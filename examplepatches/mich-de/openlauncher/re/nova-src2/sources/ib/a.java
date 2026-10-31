package ib;

import android.graphics.Bitmap;
import b.c0;
import k9.h;

/* loaded from: classes2.dex */
public final class a extends h {
    public int o;

    /* renamed from: p, reason: collision with root package name */
    public int f61466p;

    /* renamed from: q, reason: collision with root package name */
    public int f61467q;

    /* renamed from: r, reason: collision with root package name */
    public a f61468r;

    /* renamed from: s, reason: collision with root package name */
    public Bitmap f61469s;

    /* renamed from: t, reason: collision with root package name */
    public volatile int f61470t = 1;

    /* renamed from: u, reason: collision with root package name */
    public final /* synthetic */ c f61471u;

    public a(c cVar, int i5, int i11, int i12) {
        this.f61471u = cVar;
        this.o = i5;
        this.f61466p = i11;
        this.f61467q = i12;
    }

    @Override // k9.a
    public final int a() {
        return this.f61471u.f61474a;
    }

    @Override // k9.a
    public final int b() {
        return this.f61471u.f61474a;
    }

    @Override // k9.h
    public final void h(Bitmap bitmap) {
        c.E.n(bitmap);
    }

    @Override // k9.h
    public final Bitmap i() {
        boolean z11 = this.f61470t == 8;
        long[] jArr = i9.a.f61459a;
        if (!z11) {
            throw new AssertionError();
        }
        c cVar = this.f61471u;
        int i5 = cVar.f61488q - this.o;
        int i11 = this.f61467q;
        d(Math.min(cVar.f61474a, i5 >> i11), Math.min(this.f61471u.f61474a, (cVar.f61489r - this.f61466p) >> i11));
        Bitmap bitmap = this.f61469s;
        this.f61469s = null;
        this.f61470t = 1;
        return bitmap;
    }

    public final String toString() {
        int i5 = this.o;
        c cVar = this.f61471u;
        int i11 = i5 / cVar.f61474a;
        int i12 = this.f61466p / cVar.f61474a;
        int i13 = cVar.f61478e;
        int i14 = cVar.f61477d;
        StringBuilder sbT = c0.t(i11, "tile(", ", ", i12, ", ");
        sbT.append(i13);
        sbT.append(" / ");
        sbT.append(i14);
        sbT.append(")");
        return sbT.toString();
    }
}
