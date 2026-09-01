package defpackage;

import java.io.InputStream;
import java.nio.ByteBuffer;
import java.util.Iterator;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class wnf extends InputStream {
    public Iterator a;
    public ByteBuffer b;
    public int c;
    public int d;
    public int e;
    public boolean f;
    public byte[] g;
    public int h;

    public final boolean f() {
        ByteBuffer byteBuffer;
        Iterator it2 = this.a;
        do {
            this.d++;
            if (!it2.hasNext()) {
                return false;
            }
            byteBuffer = (ByteBuffer) it2.next();
            this.b = byteBuffer;
        } while (!byteBuffer.hasRemaining());
        this.e = this.b.position();
        if (this.b.hasArray()) {
            this.f = true;
            this.g = this.b.array();
            this.h = this.b.arrayOffset();
        } else {
            this.f = false;
            this.g = null;
        }
        return true;
    }

    public final void m(int i) {
        int i2 = this.e + i;
        this.e = i2;
        if (i2 == this.b.limit()) {
            f();
        }
    }

    @Override // java.io.InputStream
    public final int read(byte[] bArr, int i, int i2) {
        if (this.d == this.c) {
            return -1;
        }
        int iLimit = this.b.limit();
        int i3 = this.e;
        int i4 = iLimit - i3;
        if (i2 > i4) {
            i2 = i4;
        }
        if (this.f) {
            System.arraycopy(this.g, i3 + this.h, bArr, i, i2);
            m(i2);
            return i2;
        }
        int iPosition = this.b.position();
        this.b.position(this.e);
        this.b.get(bArr, i, i2);
        this.b.position(iPosition);
        m(i2);
        return i2;
    }

    @Override // java.io.InputStream
    public final int read() {
        if (this.d == this.c) {
            return -1;
        }
        if (this.f) {
            int i = this.g[this.e + this.h] & 255;
            m(1);
            return i;
        }
        int i2 = this.b.get(this.e) & 255;
        m(1);
        return i2;
    }
}
