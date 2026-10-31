package he;

import com.google.android.exoplayer2.audio.AudioProcessor$UnhandledAudioFormatException;
import java.nio.ByteBuffer;

/* loaded from: classes3.dex */
public final class a0 extends q {

    /* renamed from: i, reason: collision with root package name */
    public static final int f59671i = Float.floatToIntBits(Float.NaN);

    @Override // he.h
    public final void d(ByteBuffer byteBuffer) {
        ByteBuffer byteBufferK;
        int iPosition = byteBuffer.position();
        int iLimit = byteBuffer.limit();
        int i5 = iLimit - iPosition;
        int i11 = this.f59781b.f59718c;
        int i12 = f59671i;
        if (i11 == 536870912) {
            byteBufferK = k((i5 / 3) * 4);
            while (iPosition < iLimit) {
                int iFloatToIntBits = Float.floatToIntBits((float) ((((byteBuffer.get(iPosition) & 255) << 8) | ((byteBuffer.get(iPosition + 1) & 255) << 16) | ((byteBuffer.get(iPosition + 2) & 255) << 24)) * 4.656612875245797E-10d));
                if (iFloatToIntBits == i12) {
                    iFloatToIntBits = Float.floatToIntBits(0.0f);
                }
                byteBufferK.putInt(iFloatToIntBits);
                iPosition += 3;
            }
        } else {
            if (i11 != 805306368) {
                throw new IllegalStateException();
            }
            byteBufferK = k(i5);
            while (iPosition < iLimit) {
                int iFloatToIntBits2 = Float.floatToIntBits((float) (((byteBuffer.get(iPosition) & 255) | ((byteBuffer.get(iPosition + 1) & 255) << 8) | ((byteBuffer.get(iPosition + 2) & 255) << 16) | ((byteBuffer.get(iPosition + 3) & 255) << 24)) * 4.656612875245797E-10d));
                if (iFloatToIntBits2 == i12) {
                    iFloatToIntBits2 = Float.floatToIntBits(0.0f);
                }
                byteBufferK.putInt(iFloatToIntBits2);
                iPosition += 4;
            }
        }
        byteBuffer.position(byteBuffer.limit());
        byteBufferK.flip();
    }

    @Override // he.q
    public final g g(g gVar) throws AudioProcessor$UnhandledAudioFormatException {
        int i5 = gVar.f59718c;
        if (i5 == 536870912 || i5 == 805306368 || i5 == 4) {
            return i5 != 4 ? new g(gVar.f59716a, gVar.f59717b, 4) : g.f59715e;
        }
        throw new AudioProcessor$UnhandledAudioFormatException(gVar);
    }
}
