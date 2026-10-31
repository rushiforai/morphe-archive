package he;

import b.u4;
import com.google.android.exoplayer2.audio.AudioProcessor$UnhandledAudioFormatException;
import java.nio.ByteBuffer;

/* loaded from: classes3.dex */
public final class e0 extends q {

    /* renamed from: i, reason: collision with root package name */
    public final long f59680i = 150000;

    /* renamed from: j, reason: collision with root package name */
    public final long f59681j = 20000;

    /* renamed from: k, reason: collision with root package name */
    public final short f59682k = 1024;

    /* renamed from: l, reason: collision with root package name */
    public int f59683l;

    /* renamed from: m, reason: collision with root package name */
    public boolean f59684m;
    public byte[] n;
    public byte[] o;

    /* renamed from: p, reason: collision with root package name */
    public int f59685p;

    /* renamed from: q, reason: collision with root package name */
    public int f59686q;

    /* renamed from: r, reason: collision with root package name */
    public int f59687r;

    /* renamed from: s, reason: collision with root package name */
    public boolean f59688s;

    /* renamed from: t, reason: collision with root package name */
    public long f59689t;

    public e0() {
        byte[] bArr = wf.v.f94381f;
        this.n = bArr;
        this.o = bArr;
    }

    @Override // he.q, he.h
    public final boolean b() {
        return this.f59684m;
    }

    @Override // he.h
    public final void d(ByteBuffer byteBuffer) {
        int iPosition;
        while (byteBuffer.hasRemaining() && !this.f59786g.hasRemaining()) {
            int i5 = this.f59685p;
            if (i5 == 0) {
                int iLimit = byteBuffer.limit();
                byteBuffer.limit(Math.min(iLimit, byteBuffer.position() + this.n.length));
                int iLimit2 = byteBuffer.limit() - 2;
                while (true) {
                    if (iLimit2 < byteBuffer.position()) {
                        iPosition = byteBuffer.position();
                        break;
                    } else {
                        if (Math.abs((int) byteBuffer.getShort(iLimit2)) > this.f59682k) {
                            int i11 = this.f59683l;
                            iPosition = u4.b(iLimit2, i11, i11, i11);
                            break;
                        }
                        iLimit2 -= 2;
                    }
                }
                if (iPosition == byteBuffer.position()) {
                    this.f59685p = 1;
                } else {
                    byteBuffer.limit(iPosition);
                    int iRemaining = byteBuffer.remaining();
                    k(iRemaining).put(byteBuffer).flip();
                    if (iRemaining > 0) {
                        this.f59688s = true;
                    }
                }
                byteBuffer.limit(iLimit);
            } else if (i5 == 1) {
                int iLimit3 = byteBuffer.limit();
                int iL = l(byteBuffer);
                int iPosition2 = iL - byteBuffer.position();
                byte[] bArr = this.n;
                int length = bArr.length;
                int i12 = this.f59686q;
                int i13 = length - i12;
                if (iL >= iLimit3 || iPosition2 >= i13) {
                    int iMin = Math.min(iPosition2, i13);
                    byteBuffer.limit(byteBuffer.position() + iMin);
                    byteBuffer.get(this.n, this.f59686q, iMin);
                    int i14 = this.f59686q + iMin;
                    this.f59686q = i14;
                    byte[] bArr2 = this.n;
                    if (i14 == bArr2.length) {
                        if (this.f59688s) {
                            m(this.f59687r, bArr2);
                            this.f59689t += (this.f59686q - (this.f59687r * 2)) / this.f59683l;
                        } else {
                            this.f59689t += (i14 - this.f59687r) / this.f59683l;
                        }
                        n(byteBuffer, this.n, this.f59686q);
                        this.f59686q = 0;
                        this.f59685p = 2;
                    }
                    byteBuffer.limit(iLimit3);
                } else {
                    m(i12, bArr);
                    this.f59686q = 0;
                    this.f59685p = 0;
                }
            } else {
                if (i5 != 2) {
                    throw new IllegalStateException();
                }
                int iLimit4 = byteBuffer.limit();
                int iL2 = l(byteBuffer);
                byteBuffer.limit(iL2);
                this.f59689t += byteBuffer.remaining() / this.f59683l;
                n(byteBuffer, this.o, this.f59687r);
                if (iL2 < iLimit4) {
                    m(this.f59687r, this.o);
                    this.f59685p = 0;
                    byteBuffer.limit(iLimit4);
                }
            }
        }
    }

    @Override // he.q
    public final g g(g gVar) throws AudioProcessor$UnhandledAudioFormatException {
        if (gVar.f59718c == 2) {
            return this.f59684m ? gVar : g.f59715e;
        }
        throw new AudioProcessor$UnhandledAudioFormatException(gVar);
    }

    @Override // he.q
    public final void h() {
        if (this.f59684m) {
            g gVar = this.f59781b;
            int i5 = gVar.f59719d;
            this.f59683l = i5;
            int i11 = gVar.f59716a;
            int i12 = ((int) ((this.f59680i * i11) / 1000000)) * i5;
            if (this.n.length != i12) {
                this.n = new byte[i12];
            }
            int i13 = ((int) ((this.f59681j * i11) / 1000000)) * i5;
            this.f59687r = i13;
            if (this.o.length != i13) {
                this.o = new byte[i13];
            }
        }
        this.f59685p = 0;
        this.f59689t = 0L;
        this.f59686q = 0;
        this.f59688s = false;
    }

    @Override // he.q
    public final void i() {
        int i5 = this.f59686q;
        if (i5 > 0) {
            m(i5, this.n);
        }
        if (this.f59688s) {
            return;
        }
        this.f59689t += this.f59687r / this.f59683l;
    }

    @Override // he.q
    public final void j() {
        this.f59684m = false;
        this.f59687r = 0;
        byte[] bArr = wf.v.f94381f;
        this.n = bArr;
        this.o = bArr;
    }

    public final int l(ByteBuffer byteBuffer) {
        for (int iPosition = byteBuffer.position(); iPosition < byteBuffer.limit(); iPosition += 2) {
            if (Math.abs((int) byteBuffer.getShort(iPosition)) > this.f59682k) {
                int i5 = this.f59683l;
                return (iPosition / i5) * i5;
            }
        }
        return byteBuffer.limit();
    }

    public final void m(int i5, byte[] bArr) {
        k(i5).put(bArr, 0, i5).flip();
        if (i5 > 0) {
            this.f59688s = true;
        }
    }

    public final void n(ByteBuffer byteBuffer, byte[] bArr, int i5) {
        int iMin = Math.min(byteBuffer.remaining(), this.f59687r);
        int i11 = this.f59687r - iMin;
        System.arraycopy(bArr, i5 - i11, this.o, 0, i11);
        byteBuffer.position(byteBuffer.limit() - iMin);
        byteBuffer.get(this.o, i11, iMin);
    }
}
