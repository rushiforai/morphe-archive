package f80;

import a2.c;
import b.u4;
import java.util.Arrays;
import kotlin.UByte;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes5.dex */
public final class a implements Comparable {

    /* renamed from: c, reason: collision with root package name */
    public static final a f54352c = new a(new byte[0]);

    /* renamed from: d, reason: collision with root package name */
    public static final char[] f54353d;

    /* renamed from: a, reason: collision with root package name */
    public final byte[] f54354a;

    /* renamed from: b, reason: collision with root package name */
    public int f54355b;

    static {
        char[] charArray = "0123456789abcdef".toCharArray();
        Intrinsics.f(charArray, "toCharArray(...)");
        f54353d = charArray;
    }

    public a(byte[] bArr) {
        this.f54354a = bArr;
    }

    public final byte a(int i5) {
        byte[] bArr = this.f54354a;
        if (i5 < 0 || i5 >= bArr.length) {
            throw new IndexOutOfBoundsException(c.m(u4.j(i5, "index (", ") is out of byte string bounds: [0.."), bArr.length, ')'));
        }
        return bArr[i5];
    }

    public final int b() {
        return this.f54354a.length;
    }

    @Override // java.lang.Comparable
    public final int compareTo(Object obj) {
        a other = (a) obj;
        Intrinsics.g(other, "other");
        byte[] bArr = other.f54354a;
        if (other == this) {
            return 0;
        }
        byte[] bArr2 = this.f54354a;
        int iMin = Math.min(bArr2.length, bArr.length);
        for (int i5 = 0; i5 < iMin; i5++) {
            byte b11 = bArr2[i5];
            UByte.Companion companion = UByte.f71693b;
            int iH = Intrinsics.h(b11 & 255, bArr[i5] & 255);
            if (iH != 0) {
                return iH;
            }
        }
        return Intrinsics.h(bArr2.length, bArr.length);
    }

    public final boolean equals(Object obj) {
        int i5;
        if (this == obj) {
            return true;
        }
        if (obj == null || a.class != obj.getClass()) {
            return false;
        }
        a aVar = (a) obj;
        byte[] bArr = aVar.f54354a;
        int length = bArr.length;
        byte[] bArr2 = this.f54354a;
        if (length != bArr2.length) {
            return false;
        }
        int i11 = aVar.f54355b;
        if (i11 == 0 || (i5 = this.f54355b) == 0 || i11 == i5) {
            return Arrays.equals(bArr2, bArr);
        }
        return false;
    }

    public final int hashCode() {
        int i5 = this.f54355b;
        if (i5 != 0) {
            return i5;
        }
        int iHashCode = Arrays.hashCode(this.f54354a);
        this.f54355b = iHashCode;
        return iHashCode;
    }

    public final String toString() {
        byte[] bArr = this.f54354a;
        if (bArr.length == 0) {
            return "ByteString(size=0)";
        }
        String strValueOf = String.valueOf(bArr.length);
        StringBuilder sb2 = new StringBuilder((bArr.length * 2) + strValueOf.length() + 22);
        sb2.append("ByteString(size=");
        sb2.append(strValueOf);
        sb2.append(" hex=");
        for (byte b11 : bArr) {
            char[] cArr = f54353d;
            sb2.append(cArr[(b11 >>> 4) & 15]);
            sb2.append(cArr[b11 & 15]);
        }
        sb2.append(')');
        String string = sb2.toString();
        Intrinsics.f(string, "toString(...)");
        return string;
    }

    /* JADX WARN: 'this' call moved to the top of the method (can break code semantics) */
    public a(byte[] data, int i5, int i11) {
        this(u90.b.x(i5, i11, data));
        Intrinsics.g(data, "data");
    }
}
