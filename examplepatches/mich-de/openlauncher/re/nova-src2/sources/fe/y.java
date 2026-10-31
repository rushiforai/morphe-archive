package fe;

import android.media.MediaFormat;

/* loaded from: classes3.dex */
public final class y implements xf.i, yf.a, n1 {

    /* renamed from: a, reason: collision with root package name */
    public xf.i f55082a;

    /* renamed from: b, reason: collision with root package name */
    public yf.a f55083b;

    /* renamed from: c, reason: collision with root package name */
    public yf.i f55084c;

    /* renamed from: d, reason: collision with root package name */
    public yf.i f55085d;

    @Override // xf.i
    public final void a(long j11, long j12, k0 k0Var, MediaFormat mediaFormat) {
        long j13;
        long j14;
        k0 k0Var2;
        MediaFormat mediaFormat2;
        yf.i iVar = this.f55084c;
        if (iVar != null) {
            iVar.a(j11, j12, k0Var, mediaFormat);
            mediaFormat2 = mediaFormat;
            k0Var2 = k0Var;
            j14 = j12;
            j13 = j11;
        } else {
            j13 = j11;
            j14 = j12;
            k0Var2 = k0Var;
            mediaFormat2 = mediaFormat;
        }
        xf.i iVar2 = this.f55082a;
        if (iVar2 != null) {
            iVar2.a(j13, j14, k0Var2, mediaFormat2);
        }
    }

    @Override // fe.n1
    public final void b(int i5, Object obj) {
        if (i5 == 7) {
            this.f55082a = (xf.i) obj;
            return;
        }
        if (i5 == 8) {
            this.f55083b = (yf.a) obj;
            return;
        }
        if (i5 != 10000) {
            return;
        }
        yf.k kVar = (yf.k) obj;
        if (kVar == null) {
            this.f55084c = null;
            this.f55085d = null;
        } else {
            yf.i iVar = kVar.f97298f;
            this.f55084c = iVar;
            this.f55085d = iVar;
        }
    }

    @Override // yf.a
    public final void c(long j11, float[] fArr) {
        yf.i iVar = this.f55085d;
        if (iVar != null) {
            iVar.c(j11, fArr);
        }
        yf.a aVar = this.f55083b;
        if (aVar != null) {
            aVar.c(j11, fArr);
        }
    }

    @Override // yf.a
    public final void d() {
        yf.i iVar = this.f55085d;
        if (iVar != null) {
            iVar.d();
        }
        yf.a aVar = this.f55083b;
        if (aVar != null) {
            aVar.d();
        }
    }
}
