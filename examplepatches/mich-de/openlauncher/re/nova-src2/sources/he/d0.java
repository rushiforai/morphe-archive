package he;

import com.google.android.exoplayer2.audio.AudioProcessor$UnhandledAudioFormatException;
import java.nio.ByteBuffer;

/* loaded from: classes3.dex */
public final class d0 extends q {
    @Override // he.h
    public final void d(ByteBuffer byteBuffer) {
        int iPosition = byteBuffer.position();
        int iLimit = byteBuffer.limit();
        int i5 = iLimit - iPosition;
        int i11 = this.f59781b.f59718c;
        if (i11 == 3) {
            i5 *= 2;
        } else if (i11 == 4) {
            i5 /= 2;
        } else if (i11 != 268435456) {
            if (i11 != 536870912) {
                if (i11 != 805306368) {
                    throw new IllegalStateException();
                }
                i5 /= 2;
            } else {
                i5 /= 3;
                i5 *= 2;
            }
        }
        ByteBuffer byteBufferK = k(i5);
        int i12 = this.f59781b.f59718c;
        if (i12 == 3) {
            while (iPosition < iLimit) {
                byteBufferK.put((byte) 0);
                byteBufferK.put((byte) ((byteBuffer.get(iPosition) & 255) - 128));
                iPosition++;
            }
        } else if (i12 == 4) {
            while (iPosition < iLimit) {
                short sG = (short) (wf.v.g(byteBuffer.getFloat(iPosition), -1.0f, 1.0f) * 32767.0f);
                byteBufferK.put((byte) (sG & 255));
                byteBufferK.put((byte) ((sG >> 8) & 255));
                iPosition += 4;
            }
        } else if (i12 == 268435456) {
            while (iPosition < iLimit) {
                byteBufferK.put(byteBuffer.get(iPosition + 1));
                byteBufferK.put(byteBuffer.get(iPosition));
                iPosition += 2;
            }
        } else if (i12 == 536870912) {
            while (iPosition < iLimit) {
                byteBufferK.put(byteBuffer.get(iPosition + 1));
                byteBufferK.put(byteBuffer.get(iPosition + 2));
                iPosition += 3;
            }
        } else {
            if (i12 != 805306368) {
                throw new IllegalStateException();
            }
            while (iPosition < iLimit) {
                byteBufferK.put(byteBuffer.get(iPosition + 2));
                byteBufferK.put(byteBuffer.get(iPosition + 3));
                iPosition += 4;
            }
        }
        byteBuffer.position(byteBuffer.limit());
        byteBufferK.flip();
    }

    @Override // he.q
    public final g g(g gVar) throws AudioProcessor$UnhandledAudioFormatException {
        int i5 = gVar.f59718c;
        if (i5 == 3 || i5 == 2 || i5 == 268435456 || i5 == 536870912 || i5 == 805306368 || i5 == 4) {
            return i5 != 2 ? new g(gVar.f59716a, gVar.f59717b, 2) : g.f59715e;
        }
        throw new AudioProcessor$UnhandledAudioFormatException(gVar);
    }
}
