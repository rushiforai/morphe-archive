package com.facebook.ads.redexgen.X;

import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.nio.ShortBuffer;

/* loaded from: assets/audience_network/classes.dex */
public final class SF implements LZ {
    public static String[] A0F = {"dhS3EYKV", "ZkkY5XWjpO2rnywOvnQfCYWScHtgGtJO", "XcwM0lzTMpq3p6ymY", "r7nZn1oUqSfsnhbPbu2WD", "wNHOr", "BxeRJqP6XhEVpWkzyw3uNFzDy", "fbdBK7sycU7doRnSqGZcCfHncNuEGw", "vcClEFFqzd6zAeZQK"};
    public long A03;
    public long A04;
    public RM A09;
    public boolean A0D;
    public boolean A0E;
    public float A01 = 1.0f;
    public float A00 = 1.0f;
    public LX A07 = LX.A06;
    public LX A08 = LX.A06;
    public LX A05 = LX.A06;
    public LX A06 = LX.A06;
    public ByteBuffer A0A = LZ.A00;
    public ShortBuffer A0C = this.A0A.asShortBuffer();
    public ByteBuffer A0B = LZ.A00;
    public int A02 = -1;

    public final long A00(long j11) {
        if (this.A04 >= 1024) {
            long jA0I = this.A03 - ((RM) AbstractC1062Ln.A01(this.A09)).A0I();
            if (this.A06.A03 == this.A05.A03) {
                long processedInputBytes = N1.A0U(j11, jA0I, this.A04);
                return processedInputBytes;
            }
            long processedInputBytes2 = this.A06.A03;
            long j12 = jA0I * processedInputBytes2;
            long j13 = this.A04;
            long processedInputBytes3 = this.A05.A03;
            return N1.A0U(j11, j12, j13 * processedInputBytes3);
        }
        return (long) (this.A01 * j11);
    }

    public final void A01(float f11) {
        if (this.A00 != f11) {
            this.A00 = f11;
            this.A0E = true;
        }
    }

    public final void A02(float f11) {
        if (this.A01 != f11) {
            this.A01 = f11;
            this.A0E = true;
        }
    }

    @Override // com.facebook.ads.redexgen.X.LZ
    public final LX A5g(LX lx2) throws LY {
        int i5;
        if (lx2.A02 == 2) {
            if (this.A02 == -1) {
                i5 = lx2.A03;
            } else {
                i5 = this.A02;
            }
            this.A07 = lx2;
            this.A08 = new LX(i5, lx2.A01, 2);
            this.A0E = true;
            return this.A08;
        }
        throw new LY(lx2);
    }

    @Override // com.facebook.ads.redexgen.X.LZ
    public final ByteBuffer A9G() {
        int iA0H;
        RM rm = this.A09;
        if (rm != null && (iA0H = rm.A0H()) > 0) {
            if (this.A0A.capacity() < iA0H) {
                this.A0A = ByteBuffer.allocateDirect(iA0H).order(ByteOrder.nativeOrder());
                String[] strArr = A0F;
                String str = strArr[4];
                String str2 = strArr[3];
                int outputSize = str.length();
                if (outputSize == str2.length()) {
                    throw new RuntimeException();
                }
                A0F[6] = "dGp8WEdlV5CJICa8jyuboIHhKMygSb";
                this.A0C = this.A0A.asShortBuffer();
            } else {
                this.A0A.clear();
                this.A0C.clear();
            }
            rm.A0L(this.A0C);
            this.A04 += iA0H;
            this.A0A.limit(iA0H);
            this.A0B = this.A0A;
        }
        ByteBuffer byteBuffer = this.A0B;
        ByteBuffer byteBuffer2 = LZ.A00;
        String[] strArr2 = A0F;
        if (strArr2[0].length() != strArr2[5].length()) {
            String[] strArr3 = A0F;
            strArr3[2] = "EwZnRW8jwNgGiOEeq";
            strArr3[7] = "QFYMmx3pjGehFge66";
            this.A0B = byteBuffer2;
            return byteBuffer;
        }
        this.A0B = byteBuffer2;
        return byteBuffer;
    }

    @Override // com.facebook.ads.redexgen.X.LZ
    public final boolean AB3() {
        return this.A08.A03 != -1 && (Math.abs(this.A01 - 1.0f) >= 1.0E-4f || Math.abs(this.A00 - 1.0f) >= 1.0E-4f || this.A08.A03 != this.A07.A03);
    }

    @Override // com.facebook.ads.redexgen.X.LZ
    public final boolean AB7() {
        return this.A0D && (this.A09 == null || this.A09.A0H() == 0);
    }

    @Override // com.facebook.ads.redexgen.X.LZ
    public final void AIT() {
        if (this.A09 != null) {
            this.A09.A0K();
        }
        this.A0D = true;
    }

    @Override // com.facebook.ads.redexgen.X.LZ
    public final void AIU(ByteBuffer byteBuffer) {
        if (!byteBuffer.hasRemaining()) {
            return;
        }
        Object objA01 = AbstractC1062Ln.A01(this.A09);
        String[] strArr = A0F;
        if (strArr[2].length() != strArr[7].length()) {
            throw new RuntimeException();
        }
        String[] strArr2 = A0F;
        strArr2[0] = "Xkk0f5fX";
        strArr2[5] = "TqJqqQyzPne5TkQERIStxTko6";
        ShortBuffer shortBufferAsShortBuffer = byteBuffer.asShortBuffer();
        int iRemaining = byteBuffer.remaining();
        this.A03 += iRemaining;
        ((RM) objA01).A0M(shortBufferAsShortBuffer);
        byteBuffer.position(byteBuffer.position() + iRemaining);
    }

    @Override // com.facebook.ads.redexgen.X.LZ
    public final void flush() {
        if (AB3()) {
            this.A05 = this.A07;
            this.A06 = this.A08;
            if (this.A0E) {
                this.A09 = new RM(this.A05.A03, this.A05.A01, this.A01, this.A00, this.A06.A03);
            } else if (this.A09 != null) {
                this.A09.A0J();
            }
        }
        this.A0B = LZ.A00;
        this.A03 = 0L;
        this.A04 = 0L;
        this.A0D = false;
    }
}
