package i30;

import android.graphics.Bitmap;
import b.c0;

/* loaded from: classes4.dex */
public final class r extends x {

    /* renamed from: q, reason: collision with root package name */
    public int f61330q;

    /* renamed from: r, reason: collision with root package name */
    public int f61331r;

    /* renamed from: s, reason: collision with root package name */
    public int f61332s;

    /* renamed from: t, reason: collision with root package name */
    public r f61333t;

    /* renamed from: u, reason: collision with root package name */
    public Bitmap f61334u;

    /* renamed from: v, reason: collision with root package name */
    public volatile int f61335v;

    /* renamed from: w, reason: collision with root package name */
    public final /* synthetic */ u f61336w;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public r(u uVar, int i5, int i11, int i12) {
        super(0);
        this.f61336w = uVar;
        this.f61335v = 1;
        this.f61330q = i5;
        this.f61331r = i11;
        this.f61332s = i12;
    }

    @Override // i30.a
    public final int c() {
        return 256;
    }

    @Override // i30.a
    public final int d() {
        return 256;
    }

    @Override // i30.x
    public final void k(Bitmap bitmap) {
        u.H.b(bitmap);
    }

    @Override // i30.x
    public final Bitmap l() {
        f30.f.a(this.f61335v == 8);
        u uVar = this.f61336w;
        int i5 = uVar.f61352u - this.f61330q;
        int i11 = this.f61332s;
        f(Math.min(256, (i5 >> i11) + 1), Math.min(256, ((uVar.f61353v - this.f61331r) >> i11) + 1));
        Bitmap bitmap = this.f61334u;
        this.f61334u = null;
        this.f61335v = 1;
        return bitmap;
    }

    public final String toString() {
        int i5 = this.f61330q / 254;
        int i11 = this.f61331r / 254;
        u uVar = this.f61336w;
        int i12 = uVar.f61343j;
        int i13 = uVar.f61342i;
        StringBuilder sbT = c0.t(i5, "tile(", ", ", i11, ", ");
        sbT.append(i12);
        sbT.append(" / ");
        sbT.append(i13);
        sbT.append(")");
        return sbT.toString();
    }
}
