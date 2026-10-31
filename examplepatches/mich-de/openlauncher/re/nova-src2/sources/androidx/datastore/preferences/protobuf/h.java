package androidx.datastore.preferences.protobuf;

import b.hb;
import b.u4;
import java.io.Serializable;
import java.util.Iterator;
import java.util.Locale;

/* loaded from: classes.dex */
public class h implements Iterable, Serializable {

    /* renamed from: c, reason: collision with root package name */
    public static final h f14324c = new h(b0.f14279b);

    /* renamed from: d, reason: collision with root package name */
    public static final g f14325d;

    /* renamed from: a, reason: collision with root package name */
    public int f14326a = 0;

    /* renamed from: b, reason: collision with root package name */
    public final byte[] f14327b;

    static {
        f14325d = c.a() ? new i() : new hb(25);
    }

    public h(byte[] bArr) {
        bArr.getClass();
        this.f14327b = bArr;
    }

    public static int d(int i5, int i11, int i12) {
        int i13 = i11 - i5;
        if ((i5 | i11 | i13 | (i12 - i11)) >= 0) {
            return i13;
        }
        if (i5 < 0) {
            throw new IndexOutOfBoundsException(b.c0.i(i5, "Beginning index: ", " < 0"));
        }
        if (i11 < i5) {
            throw new IndexOutOfBoundsException(b.c0.g(i5, i11, "Beginning index larger than ending index: ", ", "));
        }
        throw new IndexOutOfBoundsException(b.c0.g(i11, i12, "End index: ", " >= "));
    }

    public static h e(int i5, int i11, byte[] bArr) {
        d(i5, i5 + i11, bArr.length);
        return new h(f14325d.a(i5, i11, bArr));
    }

    public byte c(int i5) {
        return this.f14327b[i5];
    }

    public final boolean equals(Object obj) {
        if (obj == this) {
            return true;
        }
        if (!(obj instanceof h) || size() != ((h) obj).size()) {
            return false;
        }
        if (size() == 0) {
            return true;
        }
        if (!(obj instanceof h)) {
            return obj.equals(this);
        }
        h hVar = (h) obj;
        int i5 = this.f14326a;
        int i11 = hVar.f14326a;
        if (i5 != 0 && i11 != 0 && i5 != i11) {
            return false;
        }
        int size = size();
        if (size > hVar.size()) {
            throw new IllegalArgumentException("Length too large: " + size + size());
        }
        if (size > hVar.size()) {
            StringBuilder sbJ = u4.j(size, "Ran off end of other: 0, ", ", ");
            sbJ.append(hVar.size());
            throw new IllegalArgumentException(sbJ.toString());
        }
        byte[] bArr = hVar.f14327b;
        int iG = g() + size;
        int iG2 = g();
        int iG3 = hVar.g();
        while (iG2 < iG) {
            if (this.f14327b[iG2] != bArr[iG3]) {
                return false;
            }
            iG2++;
            iG3++;
        }
        return true;
    }

    public void f(int i5, byte[] bArr) {
        System.arraycopy(this.f14327b, 0, bArr, 0, i5);
    }

    public int g() {
        return 0;
    }

    public byte h(int i5) {
        return this.f14327b[i5];
    }

    public final int hashCode() {
        int i5 = this.f14326a;
        if (i5 != 0) {
            return i5;
        }
        int size = size();
        int iG = g();
        int i11 = size;
        for (int i12 = iG; i12 < iG + size; i12++) {
            i11 = (i11 * 31) + this.f14327b[i12];
        }
        if (i11 == 0) {
            i11 = 1;
        }
        this.f14326a = i11;
        return i11;
    }

    @Override // java.lang.Iterable
    public final Iterator iterator() {
        return new e(this);
    }

    public int size() {
        return this.f14327b.length;
    }

    public final String toString() {
        String string;
        Locale locale = Locale.ROOT;
        String hexString = Integer.toHexString(System.identityHashCode(this));
        int size = size();
        if (size() <= 50) {
            string = ex.i.u(this);
        } else {
            StringBuilder sb2 = new StringBuilder();
            int iD = d(0, 47, size());
            sb2.append(ex.i.u(iD == 0 ? f14324c : new f(this.f14327b, g(), iD)));
            sb2.append("...");
            string = sb2.toString();
        }
        return b.c0.q(b.c0.v("<ByteString@", size, hexString, " size=", " contents=\""), string, "\">");
    }
}
