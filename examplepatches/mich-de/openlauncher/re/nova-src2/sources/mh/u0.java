package mh;

import b.u4;
import java.io.ByteArrayInputStream;
import java.io.Closeable;
import java.io.EOFException;
import java.io.IOException;
import java.util.ArrayDeque;

/* loaded from: classes3.dex */
public final class u0 implements Closeable {

    /* renamed from: a, reason: collision with root package name */
    public final ByteArrayInputStream f76383a;

    /* renamed from: b, reason: collision with root package name */
    public t0 f76384b;

    /* renamed from: c, reason: collision with root package name */
    public final byte[] f76385c = new byte[8];

    /* renamed from: d, reason: collision with root package name */
    public final je.f f76386d = new je.f(17);

    public u0(ByteArrayInputStream byteArrayInputStream) {
        this.f76383a = byteArrayInputStream;
    }

    public final long a() {
        l((byte) -128);
        h();
        long jF = f();
        if (jF < 0) {
            throw new UnsupportedOperationException("the maximum supported array length is 9223372036854775807");
        }
        if (jF > 0) {
            ((ArrayDeque) this.f76386d.f69487b).push(Long.valueOf(jF));
        }
        return jF;
    }

    public final long b() {
        boolean z11;
        d();
        byte b11 = this.f76384b.f76378a;
        if (b11 == 0) {
            z11 = true;
        } else {
            if (b11 != 32) {
                throw new IllegalStateException(b.c0.h((this.f76384b.f76378a >> 5) & 7, "expected major type 0 or 1 but found "));
            }
            z11 = false;
        }
        long jF = f();
        if (jF >= 0) {
            return z11 ? jF : ~jF;
        }
        throw new UnsupportedOperationException("the maximum supported unsigned/negative integer is 9223372036854775807");
    }

    public final long c() {
        l((byte) -96);
        h();
        long jF = f();
        if (jF < 0 || jF > 4611686018427387903L) {
            throw new UnsupportedOperationException("the maximum supported map length is 4611686018427387903L");
        }
        if (jF > 0) {
            ((ArrayDeque) this.f76386d.f69487b).push(Long.valueOf(jF + jF));
        }
        return jF;
    }

    @Override // java.io.Closeable, java.lang.AutoCloseable
    public final void close() throws IOException {
        this.f76383a.close();
        this.f76386d.z();
    }

    /* JADX WARN: Code restructure failed: missing block: B:41:0x0098, code lost:
    
        if (r0 != (-2)) goto L42;
     */
    /* JADX WARN: Removed duplicated region for block: B:40:0x0096  */
    /* JADX WARN: Removed duplicated region for block: B:53:0x00da  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final t0 d() {
        long jB;
        if (this.f76384b == null) {
            int i5 = this.f76383a.read();
            je.f fVar = this.f76386d;
            if (i5 == -1) {
                fVar.z();
                return null;
            }
            t0 t0Var = new t0(i5);
            this.f76384b = t0Var;
            long j11 = -2;
            byte b11 = t0Var.f76378a;
            if (b11 == -128 || b11 == -96 || b11 == -64) {
                jB = fVar.B();
                if (jB != -1) {
                    j11 = jB;
                }
                throw new IOException(u4.g(j11, "expected non-string scope but found "));
            }
            if (b11 != -32) {
                if (b11 != 0 && b11 != 32) {
                    if (b11 == 64) {
                        fVar.A(-1L);
                    } else {
                        if (b11 != 96) {
                            throw new IllegalStateException(b.c0.h((this.f76384b.f76378a >> 5) & 7, "invalid major type: "));
                        }
                        fVar.A(-2L);
                    }
                }
                long jB2 = fVar.B();
                ArrayDeque arrayDeque = (ArrayDeque) fVar.f69487b;
                if (jB2 == 1) {
                    arrayDeque.pop();
                } else if (jB2 > 1) {
                    arrayDeque.pop();
                    arrayDeque.push(Long.valueOf(jB2 - 1));
                } else if (jB2 == -4) {
                    arrayDeque.pop();
                    arrayDeque.push(-5L);
                } else if (jB2 == -5) {
                    arrayDeque.pop();
                    arrayDeque.push(-4L);
                }
            } else if (t0Var.f76379b == 31) {
                long jB3 = fVar.B();
                if (jB3 >= 0) {
                    throw new IOException(u4.g(jB3, "expected indefinite length scope but found "));
                }
                if (jB3 == -5) {
                    throw new IOException("expected a value for dangling key in indefinite-length map");
                }
                ((ArrayDeque) fVar.f69487b).pop();
            }
            jB = fVar.B();
            if (jB != -1) {
            }
            throw new IOException(u4.g(j11, "expected non-string scope but found "));
        }
        return this.f76384b;
    }

    public final boolean e() {
        l((byte) -32);
        if (this.f76384b.f76379b > 24) {
            throw new IllegalStateException("expected simple value");
        }
        int iF = (int) f();
        if (iF == 20) {
            return false;
        }
        if (iF == 21) {
            return true;
        }
        throw new IllegalStateException("expected FALSE or TRUE");
    }

    public final long f() throws IOException {
        byte b11 = this.f76384b.f76379b;
        if (b11 < 24) {
            long j11 = b11;
            this.f76384b = null;
            return j11;
        }
        if (b11 == 24) {
            int i5 = this.f76383a.read();
            if (i5 == -1) {
                throw new EOFException();
            }
            this.f76384b = null;
            return i5 & 255;
        }
        byte[] bArr = this.f76385c;
        if (b11 == 25) {
            p(2, bArr);
            return ((bArr[0] & 255) << 8) | (bArr[1] & 255);
        }
        if (b11 == 26) {
            p(4, bArr);
            return ((bArr[0] & 255) << 24) | ((bArr[1] & 255) << 16) | ((bArr[2] & 255) << 8) | (bArr[3] & 255);
        }
        if (b11 != 27) {
            t0 t0Var = this.f76384b;
            throw new IOException(b.c0.g(t0Var.f76379b, (t0Var.f76378a >> 5) & 7, "invalid additional information ", " for major type "));
        }
        p(8, bArr);
        return ((bArr[0] & 255) << 56) | ((bArr[1] & 255) << 48) | ((bArr[2] & 255) << 40) | ((bArr[3] & 255) << 32) | ((bArr[4] & 255) << 24) | ((bArr[5] & 255) << 16) | ((bArr[6] & 255) << 8) | (bArr[7] & 255);
    }

    public final void h() {
        d();
        if (this.f76384b.f76379b == 31) {
            throw new IllegalStateException(b.c0.h(this.f76384b.f76379b, "expected definite length but found "));
        }
    }

    public final void l(byte b11) {
        d();
        if (this.f76384b.f76378a != b11) {
            throw new IllegalStateException(b.c0.g((b11 >> 5) & 7, (this.f76384b.f76378a >> 5) & 7, "expected major type ", " but found "));
        }
    }

    public final void p(int i5, byte[] bArr) throws IOException {
        int i11 = 0;
        while (i11 != i5) {
            int i12 = this.f76383a.read(bArr, i11, i5 - i11);
            if (i12 == -1) {
                throw new EOFException();
            }
            i11 += i12;
        }
        this.f76384b = null;
    }

    public final byte[] s() {
        h();
        long jF = f();
        if (jF < 0 || jF > 2147483647L) {
            throw new UnsupportedOperationException("the maximum supported byte/text string length is 2147483647 bytes");
        }
        if (this.f76383a.available() < jF) {
            throw new EOFException();
        }
        int i5 = (int) jF;
        byte[] bArr = new byte[i5];
        p(i5, bArr);
        return bArr;
    }
}
