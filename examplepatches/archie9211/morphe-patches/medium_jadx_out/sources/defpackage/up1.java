package defpackage;

import androidx.datastore.preferences.protobuf.InvalidProtocolBufferException;
import com.google.android.gms.internal.p000firebaseauthapi.zzale;
import com.google.android.recaptcha.internal.zzaek;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.security.GeneralSecurityException;
import java.security.InvalidKeyException;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class up1 {
    public final /* synthetic */ int a;
    public int b;
    public Object c;

    public up1(byte[] bArr, int i) throws InvalidKeyException {
        this.a = 4;
        if (bArr.length != 32) {
            throw new InvalidKeyException("The key length in bytes must be 32.");
        }
        this.c = y7g.d(bArr);
        this.b = i;
    }

    public static rmf H(byte[] bArr, int i, int i2) {
        rmf rmfVar = new rmf(bArr, i, i2);
        try {
            rmfVar.D(i2);
            return rmfVar;
        } catch (zzaek e) {
            throw new IllegalArgumentException(e);
        }
    }

    public static int I(int i) {
        return (i >>> 1) ^ (-(i & 1));
    }

    public static long J(long j) {
        return (j >>> 1) ^ (-(1 & j));
    }

    public static long M(long j) {
        return (-(j & 1)) ^ (j >>> 1);
    }

    public static xsf O(byte[] bArr, int i, int i2) {
        xsf xsfVar = new xsf(bArr, i, i2);
        try {
            xsfVar.S(i2);
            return xsfVar;
        } catch (zzale e) {
            throw new IllegalArgumentException(e);
        }
    }

    public abstract long A();

    public abstract long A0();

    public abstract boolean B(int i);

    public abstract String B0();

    public void C() throws InvalidProtocolBufferException {
        int iY;
        do {
            iY = y();
            if (iY == 0) {
                return;
            }
            int i = this.b;
            if (i >= 100) {
                throw new InvalidProtocolBufferException("Protocol message had too many levels of nesting.  May be malicious.  Use setRecursionLimit() to increase the recursion depth limit.");
            }
            this.b = i + 1;
            this.b--;
        } while (B(iY));
    }

    public abstract boolean C0();

    public abstract int D(int i);

    public abstract boolean D0();

    public abstract void E(int i);

    public abstract boolean F();

    public abstract int G();

    public abstract double K();

    public abstract int L();

    public ByteBuffer N(int i, byte[] bArr) {
        int[] iArrQ = Q(i, y7g.d(bArr));
        int[] iArr = (int[]) iArrQ.clone();
        y7g.b(iArr);
        for (int i2 = 0; i2 < iArrQ.length; i2++) {
            iArrQ[i2] = iArrQ[i2] + iArr[i2];
        }
        ByteBuffer byteBufferOrder = ByteBuffer.allocate(64).order(ByteOrder.LITTLE_ENDIAN);
        byteBufferOrder.asIntBuffer().put(iArrQ, 0, 16);
        return byteBufferOrder;
    }

    public void P(byte[] bArr, ByteBuffer byteBuffer, ByteBuffer byteBuffer2) throws GeneralSecurityException {
        if (bArr.length != L()) {
            throw new GeneralSecurityException(b09.w(L(), "The nonce length (in bytes) must be "));
        }
        int iRemaining = byteBuffer2.remaining();
        int i = iRemaining / 64;
        int i2 = i + 1;
        for (int i3 = 0; i3 < i2; i3++) {
            ByteBuffer byteBufferN = N(this.b + i3, bArr);
            if (i3 == i) {
                il7.E(byteBuffer, byteBuffer2, byteBufferN, iRemaining % 64);
            } else {
                il7.E(byteBuffer, byteBuffer2, byteBufferN, 64);
            }
        }
    }

    public abstract int[] Q(int i, int[] iArr);

    public abstract float R();

    public abstract int S(int i);

    public abstract void T();

    public abstract double U();

    public abstract int V();

    public abstract void X(int i);

    public abstract float Y();

    public abstract int Z();

    public abstract void a(int i);

    public abstract void a0(int i);

    public abstract int b();

    public abstract int b0();

    public abstract boolean c();

    public abstract long c0();

    public abstract int d0();

    public abstract long e0();

    public abstract z4f f(z4f z4fVar, List list);

    public abstract int f0();

    public abstract mya g(f4f f4fVar, mya myaVar);

    public abstract int g0();

    public abstract void h(int i);

    public abstract long h0();

    public abstract int i(int i);

    public abstract int i0();

    public abstract boolean j();

    public abstract int j0();

    public abstract d21 k();

    public abstract boolean k0();

    public abstract double l();

    public abstract long l0();

    public abstract int m();

    public abstract String m0();

    public abstract int n();

    public abstract long n0();

    public abstract long o();

    public abstract String o0();

    public abstract float p();

    public abstract omf p0();

    public abstract int q();

    public abstract int q0();

    public abstract long r();

    public abstract long r0();

    public abstract int s();

    public abstract int s0();

    public abstract long t();

    public abstract long t0();

    public String toString() {
        switch (this.a) {
            case 5:
                return String.format("%s(0x%04x)", (String) this.c, Integer.valueOf(this.b));
            default:
                return super.toString();
        }
    }

    public abstract int u();

    public abstract int u0();

    public abstract long v();

    public abstract long v0();

    public abstract String w();

    public abstract long w0();

    public abstract String x();

    public abstract rsf x0();

    public abstract int y();

    public abstract int y0();

    public abstract int z();

    public abstract String z0();

    public up1(String str, int i) {
        this.a = 5;
        this.c = str;
        this.b = i;
    }

    public void d(f4f f4fVar) {
    }

    public void e(f4f f4fVar) {
    }

    public /* synthetic */ up1(int i, byte b) {
        this.a = i;
    }

    public up1(int i) {
        this.a = 1;
        this.b = i;
    }
}
