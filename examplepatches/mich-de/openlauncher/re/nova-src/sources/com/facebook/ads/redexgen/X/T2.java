package com.facebook.ads.redexgen.X;

import com.facebook.video.heroplayer.exocustom.MetaExoPlayerCustomization;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.nio.ByteBuffer;
import java.util.Arrays;
import org.checkerframework.checker.nullness.qual.EnsuresNonNull;

/* loaded from: assets/audience_network/classes.dex */
public class T2 extends AbstractC1109Nj {
    public static byte[] A08;
    public static String[] A09 = {"zcEqXL1N8elUZ5AGbIZqVEP7K1UDW", "E7RMfjNGpncmYaePWgJ0MtDw9J", "Pm7V0dMul4gD42HE3Ka", "MdfNTpEHUh4VDYfcR4vB5xziFXAbk", "G9ZK8Ip7Vu6JoblR0BPjMGlH8UcrwP", "fKhcGj6Ar0s4F0nGHZI0gBapuwHeTpsT", "6hESiHBu0l19UPRod5eix3XGIfCjfgBT", "cBRQIMII4"};

    @MetaExoPlayerCustomization
    public long A00;
    public long A01;
    public ByteBuffer A02;
    public ByteBuffer A03;
    public boolean A04;
    public final C1114No A05;
    public final int A06;
    public final int A07;

    public static String A03(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A08, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 42);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A05() {
        A08 = new byte[]{-108, -100, -100, -108, 91, -110, -91, -100, 91, -111, -110, -112, -100, -111, -110, -97};
    }

    static {
        A05();
        C1045Ku.A03(A03(0, 16, 3));
    }

    public T2(int i5) {
        this(i5, 0);
    }

    public T2(int i5, int i11) {
        this.A05 = new C1114No();
        this.A06 = i5;
        this.A07 = i11;
    }

    public static T2 A02() {
        return new T2(0);
    }

    private ByteBuffer A04(int i5) {
        int iCapacity;
        if (this.A06 == 1) {
            return ByteBuffer.allocate(i5);
        }
        if (this.A06 == 2) {
            ByteBuffer byteBufferAllocateDirect = ByteBuffer.allocateDirect(i5);
            if (A09[0].length() != 29) {
                throw new RuntimeException();
            }
            A09[7] = b.f42142b;
            return byteBufferAllocateDirect;
        }
        if (this.A02 == null) {
            iCapacity = 0;
        } else {
            ByteBuffer byteBuffer = this.A02;
            if (A09[7].length() != 31) {
                String[] strArr = A09;
                strArr[4] = "q3bjZu06h8SOZchGztrU8NzppC1RtG";
                strArr[3] = "8BxEv5Idv5hKUagZvY2AuyJCTYAC9";
                iCapacity = byteBuffer.capacity();
            } else {
                A09[7] = "dtJV4mOwzvkM";
                iCapacity = byteBuffer.capacity();
            }
        }
        throw new C1118Ns(iCapacity, i5);
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC1109Nj
    public void A0A() {
        super.A0A();
        if (this.A02 != null) {
            this.A02.clear();
        }
        if (this.A03 != null) {
            ByteBuffer byteBuffer = this.A03;
            if (A09[7].length() == 31) {
                throw new RuntimeException();
            }
            A09[7] = "9K9W7SxaQv1fg42tfkOMw8SwWZ";
            byteBuffer.clear();
        }
        this.A04 = false;
    }

    public final void A0B() {
        if (this.A02 != null) {
            this.A02.flip();
        }
        if (this.A03 != null) {
            ByteBuffer byteBuffer = this.A03;
            if (A09[7].length() == 31) {
                throw new RuntimeException();
            }
            String[] strArr = A09;
            strArr[2] = "ugUrIW1vc8EvY8rCmbn";
            strArr[1] = "lOp0wWUynqD3gXTpAl80VWbiF0";
            byteBuffer.flip();
        }
    }

    @EnsuresNonNull
    public final void A0C(int i5) {
        int i11 = i5 + this.A07;
        ByteBuffer byteBuffer = this.A02;
        if (byteBuffer == null) {
            ByteBuffer currentData = A04(i11);
            this.A02 = currentData;
            return;
        }
        int capacity = byteBuffer.capacity();
        int position = byteBuffer.position();
        int i12 = position + i11;
        if (capacity >= i12) {
            this.A02 = byteBuffer;
            return;
        }
        ByteBuffer byteBufferA04 = A04(i12);
        byteBufferA04.order(byteBuffer.order());
        if (position > 0) {
            byteBuffer.flip();
            byteBufferA04.put(byteBuffer);
        }
        this.A02 = byteBufferA04;
    }

    @EnsuresNonNull
    public final void A0D(int i5) {
        if (this.A03 == null || this.A03.capacity() < i5) {
            this.A03 = ByteBuffer.allocate(i5);
        } else {
            this.A03.clear();
        }
    }

    public final boolean A0E() {
        return A09(1073741824);
    }
}
