package com.fyber.inneractive.sdk.player.exoplayer2.upstream.cache;

import android.net.Uri;
import com.fyber.inneractive.sdk.player.exoplayer2.upstream.e0;
import java.io.IOException;
import java.io.InterruptedIOException;

/* loaded from: classes3.dex */
public final class e implements com.fyber.inneractive.sdk.player.exoplayer2.upstream.h {

    /* renamed from: a, reason: collision with root package name */
    public final l f30288a;

    /* renamed from: b, reason: collision with root package name */
    public final com.fyber.inneractive.sdk.player.exoplayer2.upstream.h f30289b;

    /* renamed from: c, reason: collision with root package name */
    public final e0 f30290c;

    /* renamed from: d, reason: collision with root package name */
    public final com.fyber.inneractive.sdk.player.exoplayer2.upstream.h f30291d;

    /* renamed from: e, reason: collision with root package name */
    public final boolean f30292e = false;

    /* renamed from: f, reason: collision with root package name */
    public final boolean f30293f = true;

    /* renamed from: g, reason: collision with root package name */
    public final boolean f30294g = false;

    /* renamed from: h, reason: collision with root package name */
    public com.fyber.inneractive.sdk.player.exoplayer2.upstream.h f30295h;

    /* renamed from: i, reason: collision with root package name */
    public boolean f30296i;

    /* renamed from: j, reason: collision with root package name */
    public Uri f30297j;

    /* renamed from: k, reason: collision with root package name */
    public int f30298k;

    /* renamed from: l, reason: collision with root package name */
    public String f30299l;

    /* renamed from: m, reason: collision with root package name */
    public long f30300m;
    public long n;
    public m o;

    /* renamed from: p, reason: collision with root package name */
    public boolean f30301p;

    /* renamed from: q, reason: collision with root package name */
    public boolean f30302q;

    public e(l lVar, com.fyber.inneractive.sdk.player.exoplayer2.upstream.h hVar, com.fyber.inneractive.sdk.player.exoplayer2.upstream.h hVar2, c cVar) {
        this.f30288a = lVar;
        this.f30289b = hVar2;
        this.f30291d = hVar;
        if (cVar != null) {
            this.f30290c = new e0(hVar, cVar);
        } else {
            this.f30290c = null;
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:18:0x002f  */
    @Override // com.fyber.inneractive.sdk.player.exoplayer2.upstream.h
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final long a(com.fyber.inneractive.sdk.player.exoplayer2.upstream.k kVar) throws IOException {
        boolean z11;
        try {
            Uri uri = kVar.f30365a;
            this.f30297j = uri;
            this.f30298k = kVar.f30370f;
            String string = kVar.f30369e;
            if (string == null) {
                string = uri.toString();
            }
            this.f30299l = string;
            this.f30300m = kVar.f30367c;
            if (!this.f30293f || !this.f30301p) {
                z11 = kVar.f30368d == -1 && this.f30294g;
            }
            this.f30302q = z11;
            long j11 = kVar.f30368d;
            if (j11 != -1 || z11) {
                this.n = j11;
            } else {
                long jA = this.f30288a.a(string);
                this.n = jA;
                if (jA != -1) {
                    long j12 = jA - kVar.f30367c;
                    this.n = j12;
                    if (j12 <= 0) {
                        throw new com.fyber.inneractive.sdk.player.exoplayer2.upstream.i();
                    }
                }
            }
            a(true);
            return this.n;
        } catch (IOException e3) {
            if (this.f30295h == this.f30289b || (e3 instanceof a)) {
                this.f30301p = true;
            }
            throw e3;
        }
    }

    public final void b() {
        com.fyber.inneractive.sdk.player.exoplayer2.upstream.h hVar = this.f30295h;
        if (hVar == null) {
            return;
        }
        try {
            hVar.close();
            this.f30295h = null;
            this.f30296i = false;
            m mVar = this.o;
            if (mVar != null) {
                l lVar = this.f30288a;
                synchronized (lVar) {
                    if (mVar != lVar.f30330c.remove(mVar.f30307a)) {
                        throw new IllegalStateException();
                    }
                    lVar.notifyAll();
                }
                this.o = null;
            }
        } catch (Throwable th2) {
            m mVar2 = this.o;
            if (mVar2 != null) {
                this.f30288a.b(mVar2);
                this.o = null;
            }
            throw th2;
        }
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.upstream.h
    public final void close() throws IOException {
        this.f30297j = null;
        try {
            b();
        } catch (IOException e3) {
            if (this.f30295h == this.f30289b || (e3 instanceof a)) {
                this.f30301p = true;
            }
            throw e3;
        }
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.upstream.h
    public final int read(byte[] bArr, int i5, int i11) throws IOException {
        if (i11 == 0) {
            return 0;
        }
        if (this.n == 0) {
            return -1;
        }
        try {
            int i12 = this.f30295h.read(bArr, i5, i11);
            if (i12 >= 0) {
                long j11 = i12;
                this.f30300m += j11;
                long j12 = this.n;
                if (j12 != -1) {
                    this.n = j12 - j11;
                    return i12;
                }
            } else {
                if (this.f30296i) {
                    a(this.f30300m);
                    this.n = 0L;
                }
                b();
                long j13 = this.n;
                if ((j13 > 0 || j13 == -1) && a(false)) {
                    return read(bArr, i5, i11);
                }
            }
            return i12;
        } catch (IOException e3) {
            if (this.f30295h == this.f30289b || (e3 instanceof a)) {
                this.f30301p = true;
            }
            throw e3;
        }
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.upstream.h
    public final Uri a() {
        com.fyber.inneractive.sdk.player.exoplayer2.upstream.h hVar = this.f30295h;
        return hVar == this.f30291d ? hVar.a() : this.f30297j;
    }

    /* JADX WARN: Removed duplicated region for block: B:63:0x00eb  */
    /* JADX WARN: Removed duplicated region for block: B:70:0x00fe  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final boolean a(boolean z11) throws IOException {
        m mVarA;
        com.fyber.inneractive.sdk.player.exoplayer2.upstream.k kVar;
        long jA;
        IOException iOException = null;
        if (this.f30302q) {
            mVarA = null;
        } else if (this.f30292e) {
            try {
                l lVar = this.f30288a;
                String str = this.f30299l;
                long j11 = this.f30300m;
                synchronized (lVar) {
                    while (true) {
                        mVarA = lVar.a(str, j11);
                        if (mVarA != null) {
                            break;
                        }
                        lVar.wait();
                    }
                }
            } catch (InterruptedException unused) {
                throw new InterruptedIOException();
            }
        } else {
            mVarA = this.f30288a.a(this.f30299l, this.f30300m);
        }
        if (mVarA == null) {
            this.f30295h = this.f30291d;
            Uri uri = this.f30297j;
            long j12 = this.f30300m;
            kVar = new com.fyber.inneractive.sdk.player.exoplayer2.upstream.k(uri, j12, j12, this.n, this.f30299l, this.f30298k);
        } else if (mVarA.f30310d) {
            Uri uriFromFile = Uri.fromFile(mVarA.f30311e);
            long j13 = this.f30300m - mVarA.f30308b;
            long jMin = mVarA.f30309c - j13;
            long j14 = this.n;
            if (j14 != -1) {
                jMin = Math.min(jMin, j14);
            }
            com.fyber.inneractive.sdk.player.exoplayer2.upstream.k kVar2 = new com.fyber.inneractive.sdk.player.exoplayer2.upstream.k(uriFromFile, this.f30300m, j13, jMin, this.f30299l, this.f30298k);
            this.f30295h = this.f30289b;
            kVar = kVar2;
        } else {
            long jMin2 = mVarA.f30309c;
            if (jMin2 == -1) {
                jMin2 = this.n;
            } else {
                long j15 = this.n;
                if (j15 != -1) {
                    jMin2 = Math.min(jMin2, j15);
                }
            }
            long j16 = jMin2;
            Uri uri2 = this.f30297j;
            long j17 = this.f30300m;
            com.fyber.inneractive.sdk.player.exoplayer2.upstream.k kVar3 = new com.fyber.inneractive.sdk.player.exoplayer2.upstream.k(uri2, j17, j17, j16, this.f30299l, this.f30298k);
            e0 e0Var = this.f30290c;
            if (e0Var != null) {
                this.f30295h = e0Var;
                this.o = mVarA;
            } else {
                this.f30295h = this.f30291d;
                this.f30288a.b(mVarA);
            }
            kVar = kVar3;
        }
        boolean z12 = false;
        this.f30296i = kVar.f30368d == -1;
        try {
            jA = this.f30295h.a(kVar);
            z12 = true;
        } catch (IOException e3) {
            if (z11 || !this.f30296i) {
                iOException = e3;
                if (iOException == null) {
                    throw iOException;
                }
                jA = 0;
            } else {
                for (Throwable cause = e3; cause != null; cause = cause.getCause()) {
                    if ((cause instanceof com.fyber.inneractive.sdk.player.exoplayer2.upstream.i) && ((com.fyber.inneractive.sdk.player.exoplayer2.upstream.i) cause).f30358a == 0) {
                        break;
                    }
                }
                iOException = e3;
                if (iOException == null) {
                }
            }
        }
        if (this.f30296i && jA != -1) {
            this.n = jA;
            a(kVar.f30367c + jA);
        }
        return z12;
    }

    public final void a(long j11) {
        if (this.f30295h == this.f30290c) {
            l lVar = this.f30288a;
            String str = this.f30299l;
            synchronized (lVar) {
                try {
                    i iVar = lVar.f30331d;
                    h hVar = (h) iVar.f30317a.get(str);
                    if (hVar == null) {
                        iVar.a(str, j11);
                    } else if (hVar.f30316d != j11) {
                        hVar.f30316d = j11;
                        iVar.f30322f = true;
                    }
                    lVar.f30331d.b();
                } catch (Throwable th2) {
                    throw th2;
                }
            }
        }
    }
}
