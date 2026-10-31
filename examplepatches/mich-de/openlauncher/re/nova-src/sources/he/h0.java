package he;

import com.google.android.exoplayer2.audio.AudioProcessor$UnhandledAudioFormatException;
import java.nio.ByteBuffer;

/* loaded from: classes3.dex */
public final class h0 extends q {

    /* renamed from: i, reason: collision with root package name */
    public int f59734i;

    /* renamed from: j, reason: collision with root package name */
    public int f59735j;

    /* renamed from: k, reason: collision with root package name */
    public boolean f59736k;

    /* renamed from: l, reason: collision with root package name */
    public int f59737l;

    /* renamed from: m, reason: collision with root package name */
    public byte[] f59738m;
    public int n;
    public long o;

    @Override // he.q, he.h
    public final ByteBuffer a() {
        int i5;
        if (super.f() && (i5 = this.n) > 0) {
            k(i5).put(this.f59738m, 0, this.n).flip();
            this.n = 0;
        }
        return super.a();
    }

    @Override // he.h
    public final void d(ByteBuffer byteBuffer) {
        int iPosition = byteBuffer.position();
        int iLimit = byteBuffer.limit();
        int i5 = iLimit - iPosition;
        if (i5 == 0) {
            return;
        }
        int iMin = Math.min(i5, this.f59737l);
        this.o += iMin / this.f59781b.f59719d;
        this.f59737l -= iMin;
        byteBuffer.position(iPosition + iMin);
        if (this.f59737l > 0) {
            return;
        }
        int i11 = i5 - iMin;
        int length = (this.n + i11) - this.f59738m.length;
        ByteBuffer byteBufferK = k(length);
        int iH = wf.v.h(length, 0, this.n);
        byteBufferK.put(this.f59738m, 0, iH);
        int iH2 = wf.v.h(length - iH, 0, i11);
        byteBuffer.limit(byteBuffer.position() + iH2);
        byteBufferK.put(byteBuffer);
        byteBuffer.limit(iLimit);
        int i12 = i11 - iH2;
        int i13 = this.n - iH;
        this.n = i13;
        byte[] bArr = this.f59738m;
        System.arraycopy(bArr, iH, bArr, 0, i13);
        byteBuffer.get(this.f59738m, this.n, i12);
        this.n += i12;
        byteBufferK.flip();
    }

    @Override // he.q, he.h
    public final boolean f() {
        return super.f() && this.n == 0;
    }

    @Override // he.q
    public final g g(g gVar) throws AudioProcessor$UnhandledAudioFormatException {
        if (gVar.f59718c != 2) {
            throw new AudioProcessor$UnhandledAudioFormatException(gVar);
        }
        this.f59736k = true;
        return (this.f59734i == 0 && this.f59735j == 0) ? g.f59715e : gVar;
    }

    @Override // he.q
    public final void h() {
        if (this.f59736k) {
            this.f59736k = false;
            int i5 = this.f59735j;
            int i11 = this.f59781b.f59719d;
            this.f59738m = new byte[i5 * i11];
            this.f59737l = this.f59734i * i11;
        }
        this.n = 0;
    }

    @Override // he.q
    public final void i() {
        if (this.f59736k) {
            if (this.n > 0) {
                this.o += r0 / this.f59781b.f59719d;
            }
            this.n = 0;
        }
    }

    @Override // he.q
    public final void j() {
        this.f59738m = wf.v.f94381f;
    }
}
