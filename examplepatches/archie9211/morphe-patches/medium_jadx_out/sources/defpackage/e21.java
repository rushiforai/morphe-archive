package defpackage;

import java.io.OutputStream;
import java.util.ArrayList;
import java.util.Locale;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class e21 extends OutputStream {
    public static final byte[] f = new byte[0];
    public static final byte[] g = new byte[0];
    public final /* synthetic */ int a;
    public final ArrayList b;
    public int c;
    public byte[] d;
    public int e;

    public e21(int i) {
        this.a = i;
        switch (i) {
            case 1:
                this.b = new ArrayList();
                this.d = new byte[128];
                break;
            default:
                this.b = new ArrayList();
                this.d = new byte[128];
                break;
        }
    }

    private final String B() {
        int i;
        String hexString = Integer.toHexString(System.identityHashCode(this));
        synchronized (this) {
            i = this.c + this.e;
        }
        return String.format("<ByteString.Output@%s size=%d>", hexString, Integer.valueOf(i));
    }

    private final synchronized void D(int i) {
        try {
            if (this.e == this.d.length) {
                f(1);
            }
            byte[] bArr = this.d;
            int i2 = this.e;
            this.e = i2 + 1;
            bArr[i2] = (byte) i;
        } catch (Throwable th) {
            throw th;
        }
    }

    private final synchronized void I(byte[] bArr, int i, int i2) {
        try {
            byte[] bArr2 = this.d;
            int length = bArr2.length;
            int i3 = this.e;
            if (i2 <= length - i3) {
                System.arraycopy(bArr, i, bArr2, i3, i2);
                this.e += i2;
            } else {
                int length2 = bArr2.length - i3;
                System.arraycopy(bArr, i, bArr2, i3, length2);
                int i4 = i2 - length2;
                f(i4);
                System.arraycopy(bArr, i + length2, this.d, 0, i4);
                this.e = i4;
            }
        } catch (Throwable th) {
            throw th;
        }
    }

    private final synchronized void L(int i) {
        try {
            if (this.e == this.d.length) {
                Q(1);
            }
            byte[] bArr = this.d;
            int i2 = this.e;
            this.e = i2 + 1;
            bArr[i2] = (byte) i;
        } catch (Throwable th) {
            throw th;
        }
    }

    private final synchronized void N(byte[] bArr, int i, int i2) {
        byte[] bArr2 = this.d;
        int length = bArr2.length;
        int i3 = this.e;
        int i4 = length - i3;
        if (i2 <= i4) {
            System.arraycopy(bArr, i, bArr2, i3, i2);
            this.e += i2;
            return;
        }
        System.arraycopy(bArr, i, bArr2, i3, i4);
        int i5 = i2 - i4;
        Q(i5);
        System.arraycopy(bArr, i + i4, this.d, 0, i5);
        this.e = i5;
    }

    public void Q(int i) {
        this.b.add(new omf(this.d));
        int length = this.c + this.d.length;
        this.c = length;
        this.d = new byte[Math.max(128, Math.max(i, length >>> 1))];
        this.e = 0;
    }

    public void f(int i) {
        this.b.add(new c57(this.d));
        int length = this.c + this.d.length;
        this.c = length;
        this.d = new byte[Math.max(128, Math.max(i, length >>> 1))];
        this.e = 0;
    }

    public void m() {
        int i = this.e;
        byte[] bArr = this.d;
        int length = bArr.length;
        ArrayList arrayList = this.b;
        if (i >= length) {
            arrayList.add(new c57(bArr));
            this.d = f;
        } else if (i > 0) {
            byte[] bArr2 = new byte[i];
            System.arraycopy(bArr, 0, bArr2, 0, Math.min(bArr.length, i));
            arrayList.add(new c57(bArr2));
        }
        this.c += this.e;
        this.e = 0;
    }

    public synchronized g21 p() {
        ArrayList arrayList;
        m();
        arrayList = this.b;
        return arrayList.isEmpty() ? g21.a : g21.d(arrayList.iterator(), arrayList.size());
    }

    public final String toString() {
        int i;
        switch (this.a) {
            case 0:
                return B();
            default:
                Locale locale = Locale.ROOT;
                String hexString = Integer.toHexString(System.identityHashCode(this));
                synchronized (this) {
                    i = this.c + this.e;
                }
                return ho2.C(i, "<ByteString.Output@", hexString, " size=", ">");
        }
    }

    @Override // java.io.OutputStream
    public final synchronized void write(int i) {
        switch (this.a) {
            case 0:
                D(i);
                break;
            default:
                L(i);
                break;
        }
    }

    @Override // java.io.OutputStream
    public final synchronized void write(byte[] bArr, int i, int i2) {
        switch (this.a) {
            case 0:
                I(bArr, i, i2);
                break;
            default:
                N(bArr, i, i2);
                break;
        }
    }
}
