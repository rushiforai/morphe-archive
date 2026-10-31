package com.fyber.inneractive.sdk.player.exoplayer2.upstream;

import android.content.ContentResolver;
import android.content.Context;
import android.content.res.AssetFileDescriptor;
import android.net.Uri;
import android.os.SystemClock;
import java.io.EOFException;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;

/* loaded from: classes3.dex */
public final class f implements h {

    /* renamed from: a, reason: collision with root package name */
    public final ContentResolver f30351a;

    /* renamed from: b, reason: collision with root package name */
    public final m f30352b;

    /* renamed from: c, reason: collision with root package name */
    public Uri f30353c;

    /* renamed from: d, reason: collision with root package name */
    public AssetFileDescriptor f30354d;

    /* renamed from: e, reason: collision with root package name */
    public FileInputStream f30355e;

    /* renamed from: f, reason: collision with root package name */
    public long f30356f;

    /* renamed from: g, reason: collision with root package name */
    public boolean f30357g;

    public f(Context context, m mVar) {
        this.f30351a = context.getContentResolver();
        this.f30352b = mVar;
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.upstream.h
    public final long a(k kVar) throws e, EOFException, FileNotFoundException {
        try {
            Uri uri = kVar.f30365a;
            this.f30353c = uri;
            AssetFileDescriptor assetFileDescriptorOpenAssetFileDescriptor = this.f30351a.openAssetFileDescriptor(uri, "r");
            this.f30354d = assetFileDescriptorOpenAssetFileDescriptor;
            if (assetFileDescriptorOpenAssetFileDescriptor == null) {
                throw new FileNotFoundException("Could not open file descriptor for: " + this.f30353c);
            }
            this.f30355e = new FileInputStream(this.f30354d.getFileDescriptor());
            long startOffset = this.f30354d.getStartOffset();
            if (this.f30355e.skip(kVar.f30367c + startOffset) - startOffset != kVar.f30367c) {
                throw new EOFException();
            }
            long j11 = kVar.f30368d;
            if (j11 != -1) {
                this.f30356f = j11;
            } else {
                long length = this.f30354d.getLength();
                this.f30356f = length;
                if (length == -1) {
                    long jAvailable = this.f30355e.available();
                    this.f30356f = jAvailable;
                    if (jAvailable == 0) {
                        this.f30356f = -1L;
                    }
                }
            }
            this.f30357g = true;
            m mVar = this.f30352b;
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
            return this.f30356f;
        } catch (IOException e3) {
            throw new e(e3);
        }
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.upstream.h
    public final void close() {
        this.f30353c = null;
        try {
            try {
                FileInputStream fileInputStream = this.f30355e;
                if (fileInputStream != null) {
                    fileInputStream.close();
                }
                this.f30355e = null;
                try {
                    try {
                        AssetFileDescriptor assetFileDescriptor = this.f30354d;
                        if (assetFileDescriptor != null) {
                            assetFileDescriptor.close();
                        }
                    } catch (IOException e3) {
                        throw new e(e3);
                    }
                } finally {
                    this.f30354d = null;
                    if (this.f30357g) {
                        this.f30357g = false;
                        m mVar = this.f30352b;
                        if (mVar != null) {
                            mVar.a();
                        }
                    }
                }
            } catch (IOException e11) {
                throw new e(e11);
            }
        } catch (Throwable th2) {
            this.f30355e = null;
            try {
                try {
                    AssetFileDescriptor assetFileDescriptor2 = this.f30354d;
                    if (assetFileDescriptor2 != null) {
                        assetFileDescriptor2.close();
                    }
                    this.f30354d = null;
                    if (this.f30357g) {
                        this.f30357g = false;
                        m mVar2 = this.f30352b;
                        if (mVar2 != null) {
                            mVar2.a();
                        }
                    }
                    throw th2;
                } catch (IOException e12) {
                    throw new e(e12);
                }
            } finally {
                this.f30354d = null;
                if (this.f30357g) {
                    this.f30357g = false;
                    m mVar3 = this.f30352b;
                    if (mVar3 != null) {
                        mVar3.a();
                    }
                }
            }
        }
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.upstream.h
    public final int read(byte[] bArr, int i5, int i11) throws IOException {
        if (i11 == 0) {
            return 0;
        }
        long j11 = this.f30356f;
        if (j11 == 0) {
            return -1;
        }
        if (j11 != -1) {
            try {
                i11 = (int) Math.min(j11, i11);
            } catch (IOException e3) {
                throw new e(e3);
            }
        }
        int i12 = this.f30355e.read(bArr, i5, i11);
        if (i12 == -1) {
            if (this.f30356f == -1) {
                return -1;
            }
            throw new e(new EOFException());
        }
        long j12 = this.f30356f;
        if (j12 != -1) {
            this.f30356f = j12 - i12;
        }
        m mVar = this.f30352b;
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
        return this.f30353c;
    }
}
