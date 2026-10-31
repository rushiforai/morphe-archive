package qo;

import com.android.volley.toolbox.i;
import com.google.firebase.crashlytics.internal.metadata.UserMetadata;
import java.io.Closeable;
import java.io.EOFException;
import java.io.FileInputStream;
import java.io.IOException;
import java.nio.charset.Charset;

/* loaded from: classes3.dex */
public final class e implements Closeable {

    /* renamed from: a, reason: collision with root package name */
    public final FileInputStream f84289a;

    /* renamed from: b, reason: collision with root package name */
    public final Charset f84290b;

    /* renamed from: c, reason: collision with root package name */
    public byte[] f84291c;

    /* renamed from: d, reason: collision with root package name */
    public int f84292d;

    /* renamed from: e, reason: collision with root package name */
    public int f84293e;

    public e(FileInputStream fileInputStream, Charset charset) {
        if (charset == null) {
            throw null;
        }
        if (!charset.equals(f.f84294a)) {
            throw new IllegalArgumentException("Unsupported encoding");
        }
        this.f84289a = fileInputStream;
        this.f84290b = charset;
        this.f84291c = new byte[UserMetadata.MAX_INTERNAL_KEY_SIZE];
    }

    /* JADX WARN: Removed duplicated region for block: B:25:0x0040  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final String a() {
        int i5;
        synchronized (this.f84289a) {
            try {
                byte[] bArr = this.f84291c;
                if (bArr == null) {
                    throw new IOException("LineReader is closed");
                }
                if (this.f84292d >= this.f84293e) {
                    int i11 = this.f84289a.read(bArr, 0, bArr.length);
                    if (i11 == -1) {
                        throw new EOFException();
                    }
                    this.f84292d = 0;
                    this.f84293e = i11;
                }
                for (int i12 = this.f84292d; i12 != this.f84293e; i12++) {
                    byte[] bArr2 = this.f84291c;
                    if (bArr2[i12] == 10) {
                        int i13 = this.f84292d;
                        if (i12 != i13) {
                            i5 = i12 - 1;
                            if (bArr2[i5] != 13) {
                                i5 = i12;
                            }
                        }
                        String str = new String(bArr2, i13, i5 - i13, this.f84290b.name());
                        this.f84292d = i12 + 1;
                        return str;
                    }
                }
                i iVar = new i(this, (this.f84293e - this.f84292d) + 80);
                while (true) {
                    byte[] bArr3 = this.f84291c;
                    int i14 = this.f84292d;
                    iVar.write(bArr3, i14, this.f84293e - i14);
                    this.f84293e = -1;
                    FileInputStream fileInputStream = this.f84289a;
                    byte[] bArr4 = this.f84291c;
                    int i15 = fileInputStream.read(bArr4, 0, bArr4.length);
                    if (i15 == -1) {
                        throw new EOFException();
                    }
                    this.f84292d = 0;
                    this.f84293e = i15;
                    for (int i16 = 0; i16 != this.f84293e; i16++) {
                        byte[] bArr5 = this.f84291c;
                        if (bArr5[i16] == 10) {
                            int i17 = this.f84292d;
                            if (i16 != i17) {
                                iVar.write(bArr5, i17, i16 - i17);
                            }
                            this.f84292d = i16 + 1;
                            return iVar.toString();
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
        synchronized (this.f84289a) {
            try {
                if (this.f84291c != null) {
                    this.f84291c = null;
                    this.f84289a.close();
                }
            } catch (Throwable th2) {
                throw th2;
            }
        }
    }
}
