package com.fyber.inneractive.sdk.player.exoplayer2.upstream;

import android.net.Uri;
import android.os.SystemClock;
import java.io.EOFException;
import java.io.IOException;
import java.io.RandomAccessFile;

/* loaded from: classes3.dex */
public final class s implements h {

    /* renamed from: a, reason: collision with root package name */
    public final m f30410a;

    /* renamed from: b, reason: collision with root package name */
    public RandomAccessFile f30411b;

    /* renamed from: c, reason: collision with root package name */
    public Uri f30412c;

    /* renamed from: d, reason: collision with root package name */
    public long f30413d;

    /* renamed from: e, reason: collision with root package name */
    public boolean f30414e;

    public s(m mVar) {
        this.f30410a = mVar;
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.upstream.h
    public final long a(k kVar) throws IOException {
        try {
            this.f30412c = kVar.f30365a;
            RandomAccessFile randomAccessFile = new RandomAccessFile(kVar.f30365a.getPath(), "r");
            this.f30411b = randomAccessFile;
            randomAccessFile.seek(kVar.f30367c);
            long length = kVar.f30368d;
            if (length == -1) {
                length = this.f30411b.length() - kVar.f30367c;
            }
            this.f30413d = length;
            if (length < 0) {
                throw new EOFException();
            }
            this.f30414e = true;
            m mVar = this.f30410a;
            if (mVar != null) {
                synchronized (mVar) {
                    try {
                        if (mVar.f30377b == 0) {
                            mVar.f30378c = SystemClock.elapsedRealtime();
                        }
                        mVar.f30377b++;
                    } catch (Throwable th2) {
                        throw th2;
                    }
                }
            }
            return this.f30413d;
        } catch (IOException e3) {
            throw new r(e3);
        }
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.upstream.h
    public final void close() {
        this.f30412c = null;
        try {
            try {
                RandomAccessFile randomAccessFile = this.f30411b;
                if (randomAccessFile != null) {
                    randomAccessFile.close();
                }
            } catch (IOException e3) {
                throw new r(e3);
            }
        } finally {
            this.f30411b = null;
            if (this.f30414e) {
                this.f30414e = false;
                m mVar = this.f30410a;
                if (mVar != null) {
                    mVar.a();
                }
            }
        }
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.upstream.h
    public final int read(byte[] bArr, int i5, int i11) throws IOException {
        if (i11 == 0) {
            return 0;
        }
        long j11 = this.f30413d;
        if (j11 == 0) {
            return -1;
        }
        try {
            int i12 = this.f30411b.read(bArr, i5, (int) Math.min(j11, i11));
            if (i12 > 0) {
                long j12 = i12;
                this.f30413d -= j12;
                m mVar = this.f30410a;
                if (mVar != null) {
                    synchronized (mVar) {
                        mVar.f30379d += j12;
                    }
                    return i12;
                }
            }
            return i12;
        } catch (IOException e3) {
            throw new r(e3);
        }
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.upstream.h
    public final Uri a() {
        return this.f30412c;
    }
}
