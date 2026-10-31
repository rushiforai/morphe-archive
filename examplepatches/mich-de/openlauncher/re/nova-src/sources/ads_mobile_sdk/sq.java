package ads_mobile_sdk;

import androidx.compose.ui.node.LayoutNode;
import b.c0;
import b.z6;
import com.google.firebase.crashlytics.internal.metadata.UserMetadata;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.Locale;

/* loaded from: classes.dex */
public abstract class sq implements Iterable, Serializable {

    /* renamed from: b, reason: collision with root package name */
    public static final qq f9634b = new qq(rb1.f9048a);

    /* renamed from: c, reason: collision with root package name */
    public static final z6 f9635c;

    /* renamed from: a, reason: collision with root package name */
    public int f9636a = 0;

    static {
        f9635c = qe.b() ? new b.i8(9) : new lm.e(6);
    }

    public static sq a(Iterator it, int i5) {
        if (i5 < 1) {
            Locale locale = Locale.ROOT;
            throw new IllegalArgumentException(c0.i(i5, "length (", ") must be >= 1"));
        }
        if (i5 == 1) {
            return (sq) it.next();
        }
        int i11 = i5 >>> 1;
        sq sqVarA = a(it, i11);
        sq sqVarA2 = a(it, i5 - i11);
        if (LayoutNode.NotPlacedPlaceOrder - sqVarA.size() >= sqVarA2.size()) {
            return pz2.a(sqVarA, sqVarA2);
        }
        throw new IllegalArgumentException(c0.g(sqVarA.size(), sqVarA2.size(), "ByteString would be too long: ", "+"));
    }

    public static qq b(int i5, int i11, byte[] bArr) {
        if (i11 == 0) {
            return f9634b;
        }
        a(i5, i5 + i11, bArr.length);
        return new qq(f9635c.a(bArr, i5, i11));
    }

    public abstract int a();

    public abstract sq a(int i5, int i11);

    /* renamed from: a */
    public abstract String mo3a();

    public abstract void a(int i5, int i11, int i12, byte[] bArr);

    public abstract void a(yu yuVar);

    public abstract byte b(int i5);

    public abstract int b(int i5, int i11, int i12);

    public abstract sq b(int i5, int i11);

    public abstract boolean b();

    public abstract boolean b(sq sqVar);

    public final byte[] c() {
        int size = size();
        if (size == 0) {
            return rb1.f9048a;
        }
        byte[] bArr = new byte[size];
        a(0, 0, size, bArr);
        return bArr;
    }

    public final boolean equals(Object obj) {
        if (obj == this) {
            return true;
        }
        if (!(obj instanceof sq)) {
            return false;
        }
        sq sqVar = (sq) obj;
        int size = size();
        if (size != sqVar.size()) {
            return false;
        }
        if (size == 0) {
            return true;
        }
        int i5 = this.f9636a;
        int i11 = sqVar.f9636a;
        if (i5 == 0 || i11 == 0 || i5 == i11) {
            return b(sqVar);
        }
        return false;
    }

    public final int hashCode() {
        int iB = this.f9636a;
        if (iB == 0) {
            int size = size();
            iB = b(size, 0, size);
            if (iB == 0) {
                iB = 1;
            }
            this.f9636a = iB;
        }
        return iB;
    }

    public abstract int size();

    public final String toString() {
        Locale locale = Locale.ROOT;
        String hexString = Integer.toHexString(System.identityHashCode(this));
        return c0.q(c0.v("<ByteString@", size(), hexString, " size=", " contents=\""), size() <= 50 ? ke3.a(this) : c0.E(ke3.a(b(0, 47)), "..."), "\">");
    }

    public static int a(int i5, int i11, int i12) {
        int i13 = i11 - i5;
        if ((i5 | i11 | i13 | (i12 - i11)) >= 0) {
            return i13;
        }
        if (i5 < 0) {
            throw new IndexOutOfBoundsException(c0.i(i5, "Beginning index: ", " < 0"));
        }
        if (i11 < i5) {
            throw new IndexOutOfBoundsException(c0.g(i5, i11, "Beginning index larger than ending index: ", ", "));
        }
        throw new IndexOutOfBoundsException(c0.g(i11, i12, "End index: ", " >= "));
    }

    public static qq a(int i5, int i11, byte[] bArr) {
        try {
            return b(i5, i11, bArr);
        } catch (yi1 e3) {
            throw new AssertionError("Expected no InvalidProtocolBufferException as data UTF8 validity is not checked.", e3);
        }
    }

    public static sq a(FileInputStream fileInputStream) throws IOException {
        ArrayList arrayList = new ArrayList();
        int iMin = 256;
        while (true) {
            byte[] bArr = new byte[iMin];
            int i5 = 0;
            while (i5 < iMin) {
                int i11 = fileInputStream.read(bArr, i5, iMin - i5);
                if (i11 == -1) {
                    break;
                }
                i5 += i11;
            }
            qq qqVarA = i5 == 0 ? null : a(0, i5, bArr);
            if (qqVarA == null) {
                break;
            }
            arrayList.add(qqVarA);
            iMin = Math.min(iMin * 2, UserMetadata.MAX_INTERNAL_KEY_SIZE);
        }
        int size = arrayList.size();
        if (size == 0) {
            return f9634b;
        }
        return a(arrayList.iterator(), size);
    }

    public static boolean a(byte[] bArr, int i5, byte[] bArr2, int i11, int i12) {
        int i13 = i5 + i12;
        a(i5, i13, bArr.length);
        a(i11, i12 + i11, bArr2.length);
        while (i5 < i13) {
            if (bArr[i5] != bArr2[i11]) {
                return false;
            }
            i5++;
            i11++;
        }
        return true;
    }
}
