package defpackage;

import com.google.protobuf.InvalidProtocolBufferException;
import com.google.protobuf.a;
import com.google.protobuf.b;
import com.google.protobuf.d;
import java.io.IOException;
import java.io.InputStream;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class sp1 {
    public int a;
    public d b;

    public static int b(int i) {
        return (-(i & 1)) ^ (i >>> 1);
    }

    public static long c(long j) {
        return (-(j & 1)) ^ (j >>> 1);
    }

    public static sp1 f(InputStream inputStream) {
        if (inputStream != null) {
            return new b(inputStream);
        }
        byte[] bArr = v56.b;
        return g(bArr, 0, bArr.length, false);
    }

    public static a g(byte[] bArr, int i, int i2, boolean z) {
        a aVar = new a(bArr, i, i2, z);
        try {
            aVar.i(i2);
            return aVar;
        } catch (InvalidProtocolBufferException e) {
            throw new IllegalArgumentException(e);
        }
    }

    public static int s(InputStream inputStream, int i) throws IOException {
        if ((i & 128) == 0) {
            return i;
        }
        int i2 = i & 127;
        int i3 = 7;
        while (i3 < 32) {
            int i4 = inputStream.read();
            if (i4 == -1) {
                throw InvalidProtocolBufferException.g();
            }
            i2 |= (i4 & 127) << i3;
            if ((i4 & 128) == 0) {
                return i2;
            }
            i3 += 7;
        }
        while (i3 < 64) {
            int i5 = inputStream.read();
            if (i5 == -1) {
                throw InvalidProtocolBufferException.g();
            }
            if ((i5 & 128) == 0) {
                return i2;
            }
            i3 += 7;
        }
        throw InvalidProtocolBufferException.d();
    }

    public abstract int A();

    public abstract long B();

    public abstract boolean C(int i);

    public abstract void a(int i);

    public abstract int d();

    public abstract boolean e();

    public abstract void h(int i);

    public abstract int i(int i);

    public abstract boolean j();

    public abstract c21 k();

    public abstract double l();

    public abstract int m();

    public abstract int n();

    public abstract long o();

    public abstract float p();

    public abstract int q();

    public abstract long r();

    public abstract int t();

    public abstract long u();

    public abstract int v();

    public abstract long w();

    public abstract String x();

    public abstract String y();

    public abstract int z();
}
