package defpackage;

import java.util.Arrays;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class z6g extends o7g {
    public final a6g a;

    public z6g(a6g a6gVar) {
        this.a = a6gVar;
    }

    @Override // defpackage.o7g
    public final int a() {
        return o7g.d((byte) 64);
    }

    @Override // java.lang.Comparable
    public final int compareTo(Object obj) {
        o7g o7gVar = (o7g) obj;
        int iA = o7gVar.a();
        int iD = o7g.d((byte) 64);
        if (iD != iA) {
            return iD - o7gVar.a();
        }
        a6g a6gVar = ((z6g) o7gVar).a;
        a6g a6gVar2 = this.a;
        byte[] bArr = a6gVar2.b;
        int length = bArr.length;
        byte[] bArr2 = a6gVar.b;
        if (length != bArr2.length) {
            return bArr.length - bArr2.length;
        }
        return r5g.a.compare(a6gVar2.t(), a6gVar.t());
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj != null && z6g.class == obj.getClass()) {
            return this.a.equals(((z6g) obj).a);
        }
        return false;
    }

    public final int hashCode() {
        return Arrays.hashCode(new Object[]{Integer.valueOf(o7g.d((byte) 64)), this.a});
    }

    /* JADX WARN: Multi-variable type inference failed */
    public final String toString() {
        x4g x4gVar;
        int i;
        boolean z;
        z4g z4gVar = f5g.d;
        f5g z4gVar2 = z4gVar.c;
        if (z4gVar2 == null) {
            x4g x4gVar2 = z4gVar.a;
            char[] cArr = x4gVar2.b;
            int i2 = 0;
            while (true) {
                if (i2 >= cArr.length) {
                    x4gVar = x4gVar2;
                    break;
                }
                char c = cArr[i2];
                if (c < 'a' || c > 'z') {
                    i2++;
                } else {
                    int i3 = 0;
                    while (true) {
                        if (i3 >= cArr.length) {
                            z = false;
                            break;
                        }
                        char c2 = cArr[i3];
                        if (c2 >= 'A' && c2 <= 'Z') {
                            z = true;
                            break;
                        }
                        i3++;
                    }
                    if (z) {
                        ygf.f("Cannot call upperCase() on a mixed-case alphabet");
                        return null;
                    }
                    char[] cArr2 = new char[cArr.length];
                    for (int i4 = 0; i4 < cArr.length; i4++) {
                        char c3 = cArr[i4];
                        if (c3 >= 97 && c3 <= 122) {
                            c3 ^= 32;
                        }
                        cArr2[i4] = (char) c3;
                    }
                    x4gVar = new x4g(x4gVar2.a.concat(".upperCase()"), cArr2);
                    byte[] bArr = x4gVar.g;
                    if (x4gVar2.h && !x4gVar.h) {
                        byte[] bArrCopyOf = Arrays.copyOf(bArr, bArr.length);
                        for (i = 65; i <= 90; i++) {
                            int i5 = i | 32;
                            byte b = bArr[i];
                            byte b2 = bArr[i5];
                            if (b == -1) {
                                bArrCopyOf[i] = b2;
                            } else {
                                char c4 = (char) i;
                                char c5 = (char) i5;
                                if (b2 != -1) {
                                    ygf.f(qq7.H("Can't ignoreCase() since '%s' and '%s' encode different values", Character.valueOf(c4), Character.valueOf(c5)));
                                    return null;
                                }
                                bArrCopyOf[i5] = b;
                            }
                        }
                        x4gVar = new x4g(x4gVar.a.concat(".ignoreCase()"), x4gVar.b, bArrCopyOf, true);
                    }
                }
            }
            z4gVar2 = x4gVar == x4gVar2 ? z4gVar : new z4g(x4gVar);
            z4gVar.c = z4gVar2;
        }
        byte[] bArrT = this.a.t();
        return ev6.x("h'", z4gVar2.c(bArrT.length, bArrT), "'");
    }
}
