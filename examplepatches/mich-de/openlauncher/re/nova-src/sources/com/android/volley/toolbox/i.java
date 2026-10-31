package com.android.volley.toolbox;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;

/* loaded from: classes2.dex */
public final class i extends ByteArrayOutputStream {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f21402a = 0;

    /* renamed from: b, reason: collision with root package name */
    public final Object f21403b;

    public i(a aVar, int i5) {
        this.f21403b = aVar;
        ((ByteArrayOutputStream) this).buf = aVar.a(Math.max(i5, 256));
    }

    public void a(int i5) {
        a aVar = (a) this.f21403b;
        int i11 = ((ByteArrayOutputStream) this).count;
        if (i11 + i5 <= ((ByteArrayOutputStream) this).buf.length) {
            return;
        }
        byte[] bArrA = aVar.a((i11 + i5) * 2);
        System.arraycopy(((ByteArrayOutputStream) this).buf, 0, bArrA, 0, ((ByteArrayOutputStream) this).count);
        aVar.b(((ByteArrayOutputStream) this).buf);
        ((ByteArrayOutputStream) this).buf = bArrA;
    }

    @Override // java.io.ByteArrayOutputStream, java.io.OutputStream, java.io.Closeable, java.lang.AutoCloseable
    public void close() throws IOException {
        switch (this.f21402a) {
            case 0:
                ((a) this.f21403b).b(((ByteArrayOutputStream) this).buf);
                ((ByteArrayOutputStream) this).buf = null;
                super.close();
                break;
            default:
                super.close();
                break;
        }
    }

    public void finalize() throws Throwable {
        switch (this.f21402a) {
            case 0:
                ((a) this.f21403b).b(((ByteArrayOutputStream) this).buf);
                break;
            default:
                super.finalize();
                break;
        }
    }

    @Override // java.io.ByteArrayOutputStream
    public String toString() {
        switch (this.f21402a) {
            case 1:
                int i5 = ((ByteArrayOutputStream) this).count;
                if (i5 > 0 && ((ByteArrayOutputStream) this).buf[i5 - 1] == 13) {
                    i5--;
                }
                try {
                    return new String(((ByteArrayOutputStream) this).buf, 0, i5, ((qo.e) this.f21403b).f84290b.name());
                } catch (UnsupportedEncodingException e3) {
                    throw new AssertionError(e3);
                }
            default:
                return super.toString();
        }
    }

    @Override // java.io.ByteArrayOutputStream, java.io.OutputStream
    public synchronized void write(byte[] bArr, int i5, int i11) {
        switch (this.f21402a) {
            case 0:
                synchronized (this) {
                    a(i11);
                    super.write(bArr, i5, i11);
                }
                return;
            default:
                super.write(bArr, i5, i11);
                return;
        }
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public i(qo.e eVar, int i5) {
        super(i5);
        this.f21403b = eVar;
    }

    @Override // java.io.ByteArrayOutputStream, java.io.OutputStream
    public synchronized void write(int i5) {
        switch (this.f21402a) {
            case 0:
                synchronized (this) {
                    a(1);
                    super.write(i5);
                }
                return;
            default:
                super.write(i5);
                return;
        }
    }
}
