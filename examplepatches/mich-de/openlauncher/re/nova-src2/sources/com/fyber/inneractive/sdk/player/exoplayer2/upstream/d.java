package com.fyber.inneractive.sdk.player.exoplayer2.upstream;

import android.content.Context;
import android.content.res.AssetManager;
import android.net.Uri;
import android.os.SystemClock;
import java.io.EOFException;
import java.io.IOException;
import java.io.InputStream;

/* loaded from: classes3.dex */
public final class d implements h {

    /* renamed from: a, reason: collision with root package name */
    public final AssetManager f30337a;

    /* renamed from: b, reason: collision with root package name */
    public final m f30338b;

    /* renamed from: c, reason: collision with root package name */
    public Uri f30339c;

    /* renamed from: d, reason: collision with root package name */
    public InputStream f30340d;

    /* renamed from: e, reason: collision with root package name */
    public long f30341e;

    /* renamed from: f, reason: collision with root package name */
    public boolean f30342f;

    public d(Context context, m mVar) {
        this.f30337a = context.getAssets();
        this.f30338b = mVar;
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.upstream.h
    public final long a(k kVar) throws IOException {
        try {
            Uri uri = kVar.f30365a;
            this.f30339c = uri;
            String path = uri.getPath();
            if (path.startsWith("/android_asset/")) {
                path = path.substring(15);
            } else if (path.startsWith("/")) {
                path = path.substring(1);
            }
            InputStream inputStreamOpen = this.f30337a.open(path, 1);
            this.f30340d = inputStreamOpen;
            if (inputStreamOpen.skip(kVar.f30367c) < kVar.f30367c) {
                throw new EOFException();
            }
            long j11 = kVar.f30368d;
            if (j11 != -1) {
                this.f30341e = j11;
            } else {
                long jAvailable = this.f30340d.available();
                this.f30341e = jAvailable;
                if (jAvailable == 2147483647L) {
                    this.f30341e = -1L;
                }
            }
            this.f30342f = true;
            m mVar = this.f30338b;
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
            return this.f30341e;
        } catch (IOException e3) {
            throw new c(e3);
        }
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.upstream.h
    public final void close() {
        this.f30339c = null;
        try {
            try {
                InputStream inputStream = this.f30340d;
                if (inputStream != null) {
                    inputStream.close();
                }
            } catch (IOException e3) {
                throw new c(e3);
            }
        } finally {
            this.f30340d = null;
            if (this.f30342f) {
                this.f30342f = false;
                m mVar = this.f30338b;
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
        long j11 = this.f30341e;
        if (j11 == 0) {
            return -1;
        }
        if (j11 != -1) {
            try {
                i11 = (int) Math.min(j11, i11);
            } catch (IOException e3) {
                throw new c(e3);
            }
        }
        int i12 = this.f30340d.read(bArr, i5, i11);
        if (i12 == -1) {
            if (this.f30341e == -1) {
                return -1;
            }
            throw new c(new EOFException());
        }
        long j12 = this.f30341e;
        if (j12 != -1) {
            this.f30341e = j12 - i12;
        }
        m mVar = this.f30338b;
        if (mVar == null) {
            return i12;
        }
        synchronized (mVar) {
            mVar.f30379d += i12;
        }
        return i12;
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.upstream.h
    public final Uri a() {
        return this.f30339c;
    }
}
