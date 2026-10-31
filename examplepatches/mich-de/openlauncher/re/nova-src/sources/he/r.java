package he;

import com.google.android.exoplayer2.audio.AudioProcessor$UnhandledAudioFormatException;
import java.nio.ByteBuffer;

/* loaded from: classes3.dex */
public final class r extends q {

    /* renamed from: i, reason: collision with root package name */
    public int[] f59788i;

    /* renamed from: j, reason: collision with root package name */
    public int[] f59789j;

    @Override // he.h
    public final void d(ByteBuffer byteBuffer) {
        int[] iArr = this.f59789j;
        iArr.getClass();
        int iPosition = byteBuffer.position();
        int iLimit = byteBuffer.limit();
        ByteBuffer byteBufferK = k(((iLimit - iPosition) / this.f59781b.f59719d) * this.f59782c.f59719d);
        while (iPosition < iLimit) {
            for (int i5 : iArr) {
                byteBufferK.putShort(byteBuffer.getShort((i5 * 2) + iPosition));
            }
            iPosition += this.f59781b.f59719d;
        }
        byteBuffer.position(iLimit);
        byteBufferK.flip();
    }

    @Override // he.q
    public final g g(g gVar) throws AudioProcessor$UnhandledAudioFormatException {
        int[] iArr = this.f59788i;
        if (iArr == null) {
            return g.f59715e;
        }
        int i5 = gVar.f59718c;
        int i11 = gVar.f59717b;
        if (i5 != 2) {
            throw new AudioProcessor$UnhandledAudioFormatException(gVar);
        }
        boolean z11 = i11 != iArr.length;
        int i12 = 0;
        while (i12 < iArr.length) {
            int i13 = iArr[i12];
            if (i13 >= i11) {
                throw new AudioProcessor$UnhandledAudioFormatException(gVar);
            }
            z11 |= i13 != i12;
            i12++;
        }
        return z11 ? new g(gVar.f59716a, iArr.length, 2) : g.f59715e;
    }

    @Override // he.q
    public final void h() {
        this.f59789j = this.f59788i;
    }

    @Override // he.q
    public final void j() {
        this.f59789j = null;
        this.f59788i = null;
    }
}
