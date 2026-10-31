package com.fyber.inneractive.sdk.player.cache;

import com.google.firebase.crashlytics.internal.metadata.UserMetadata;
import java.io.Closeable;
import java.io.EOFException;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.nio.charset.Charset;

/* loaded from: classes.dex */
public final class k implements Closeable {

    /* renamed from: a, reason: collision with root package name */
    public final InputStream f28867a;

    /* renamed from: b, reason: collision with root package name */
    public final Charset f28868b;

    /* renamed from: c, reason: collision with root package name */
    public byte[] f28869c;

    /* renamed from: d, reason: collision with root package name */
    public int f28870d;

    /* renamed from: e, reason: collision with root package name */
    public int f28871e;

    public k(FileInputStream fileInputStream) {
        Charset charset = l.f28872a;
        charset.getClass();
        if (!charset.equals(charset)) {
            throw new IllegalArgumentException("Unsupported encoding");
        }
        this.f28867a = fileInputStream;
        this.f28868b = charset;
        this.f28869c = new byte[UserMetadata.MAX_INTERNAL_KEY_SIZE];
    }

    /* JADX WARN: Removed duplicated region for block: B:25:0x0041  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final String a() {
        int i5;
        synchronized (this.f28867a) {
            try {
                byte[] bArr = this.f28869c;
                if (bArr == null) {
                    throw new IOException("LineReader is closed");
                }
                if (this.f28870d >= this.f28871e) {
                    int i11 = this.f28867a.read(bArr, 0, bArr.length);
                    if (i11 == -1) {
                        throw new EOFException();
                    }
                    this.f28870d = 0;
                    this.f28871e = i11;
                }
                for (int i12 = this.f28870d; i12 != this.f28871e; i12++) {
                    byte[] bArr2 = this.f28869c;
                    if (bArr2[i12] == 10) {
                        int i13 = this.f28870d;
                        if (i12 != i13) {
                            i5 = i12 - 1;
                            if (bArr2[i5] != 13) {
                                i5 = i12;
                            }
                        }
                        String str = new String(bArr2, i13, i5 - i13, this.f28868b.name());
                        this.f28870d = i12 + 1;
                        return str;
                    }
                }
                j jVar = new j(this, (this.f28871e - this.f28870d) + 80);
                while (true) {
                    byte[] bArr3 = this.f28869c;
                    int i14 = this.f28870d;
                    jVar.write(bArr3, i14, this.f28871e - i14);
                    this.f28871e = -1;
                    InputStream inputStream = this.f28867a;
                    byte[] bArr4 = this.f28869c;
                    int i15 = inputStream.read(bArr4, 0, bArr4.length);
                    if (i15 == -1) {
                        throw new EOFException();
                    }
                    this.f28870d = 0;
                    this.f28871e = i15;
                    for (int i16 = 0; i16 != this.f28871e; i16++) {
                        byte[] bArr5 = this.f28869c;
                        if (bArr5[i16] == 10) {
                            int i17 = this.f28870d;
                            if (i16 != i17) {
                                jVar.write(bArr5, i17, i16 - i17);
                            }
                            this.f28870d = i16 + 1;
                            return jVar.toString();
                        }
                    }
                }
            } catch (Throwable th2) {
                throw th2;
            }
        }
    }

    @Override // java.io.Closeable, java.lang.AutoCloseable
    public final void close() {
        synchronized (this.f28867a) {
            try {
                if (this.f28869c != null) {
                    this.f28869c = null;
                    this.f28867a.close();
                }
            } catch (Throwable th2) {
                throw th2;
            }
        }
    }
}
