package com.fyber.inneractive.sdk.player.exoplayer2.upstream.cache;

import com.fyber.inneractive.sdk.player.exoplayer2.util.p;
import com.fyber.inneractive.sdk.player.exoplayer2.util.z;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.regex.Pattern;

/* loaded from: classes3.dex */
public final class c {

    /* renamed from: a, reason: collision with root package name */
    public final l f30277a;

    /* renamed from: b, reason: collision with root package name */
    public final long f30278b = 10485760;

    /* renamed from: c, reason: collision with root package name */
    public final int f30279c = 20480;

    /* renamed from: d, reason: collision with root package name */
    public com.fyber.inneractive.sdk.player.exoplayer2.upstream.k f30280d;

    /* renamed from: e, reason: collision with root package name */
    public File f30281e;

    /* renamed from: f, reason: collision with root package name */
    public OutputStream f30282f;

    /* renamed from: g, reason: collision with root package name */
    public FileOutputStream f30283g;

    /* renamed from: h, reason: collision with root package name */
    public long f30284h;

    /* renamed from: i, reason: collision with root package name */
    public long f30285i;

    /* renamed from: j, reason: collision with root package name */
    public p f30286j;

    public c(l lVar) {
        this.f30277a = lVar;
    }

    public final void a() throws IOException {
        OutputStream outputStream = this.f30282f;
        if (outputStream == null) {
            return;
        }
        try {
            outputStream.flush();
            this.f30283g.getFD().sync();
            z.a(this.f30282f);
            this.f30282f = null;
            File file = this.f30281e;
            this.f30281e = null;
            l lVar = this.f30277a;
            synchronized (lVar) {
                m mVarA = m.a(file, lVar.f30331d);
                if (mVarA == null) {
                    throw new IllegalStateException();
                }
                if (!lVar.f30330c.containsKey(mVarA.f30307a)) {
                    throw new IllegalStateException();
                }
                if (file.exists()) {
                    if (file.length() == 0) {
                        file.delete();
                        return;
                    }
                    long jA = lVar.a(mVarA.f30307a);
                    if (jA != -1 && mVarA.f30308b + mVarA.f30309c > jA) {
                        throw new IllegalStateException();
                    }
                    lVar.a(mVarA);
                    lVar.f30331d.b();
                    lVar.notifyAll();
                }
            }
        } catch (Throwable th2) {
            z.a(this.f30282f);
            this.f30282f = null;
            File file2 = this.f30281e;
            this.f30281e = null;
            file2.delete();
            throw th2;
        }
    }

    public final void b() {
        File file;
        long j11 = this.f30280d.f30368d;
        long jMin = j11 == -1 ? this.f30278b : Math.min(j11 - this.f30285i, this.f30278b);
        l lVar = this.f30277a;
        com.fyber.inneractive.sdk.player.exoplayer2.upstream.k kVar = this.f30280d;
        String str = kVar.f30369e;
        long j12 = kVar.f30366b + this.f30285i;
        synchronized (lVar) {
            try {
                if (!lVar.f30330c.containsKey(str)) {
                    throw new IllegalStateException();
                }
                if (!lVar.f30328a.exists()) {
                    lVar.a();
                    lVar.f30328a.mkdirs();
                }
                lVar.f30329b.a(lVar, jMin);
                File file2 = lVar.f30328a;
                i iVar = lVar.f30331d;
                h hVarA = (h) iVar.f30317a.get(str);
                if (hVarA == null) {
                    hVarA = iVar.a(str, -1L);
                }
                int i5 = hVarA.f30313a;
                long jCurrentTimeMillis = System.currentTimeMillis();
                Pattern pattern = m.f30334g;
                file = new File(file2, i5 + "." + j12 + "." + jCurrentTimeMillis + ".v3.exo");
            } catch (Throwable th2) {
                throw th2;
            }
        }
        this.f30281e = file;
        FileOutputStream fileOutputStream = new FileOutputStream(this.f30281e);
        this.f30283g = fileOutputStream;
        if (this.f30279c > 0) {
            p pVar = this.f30286j;
            if (pVar == null) {
                this.f30286j = new p(this.f30283g, this.f30279c);
            } else {
                pVar.a(fileOutputStream);
            }
            this.f30282f = this.f30286j;
        } else {
            this.f30282f = fileOutputStream;
        }
        this.f30284h = 0L;
    }
}
