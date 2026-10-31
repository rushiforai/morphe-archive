package com.google.crypto.tink.shaded.protobuf;

import b.u4;
import java.util.Iterator;

/* loaded from: classes.dex */
public class g extends i {

    /* renamed from: d, reason: collision with root package name */
    public final byte[] f34597d;

    public g(byte[] bArr) {
        this.f34610a = 0;
        bArr.getClass();
        this.f34597d = bArr;
    }

    @Override // com.google.crypto.tink.shaded.protobuf.i
    public byte c(int i5) {
        return this.f34597d[i5];
    }

    @Override // com.google.crypto.tink.shaded.protobuf.i
    public final boolean equals(Object obj) {
        if (obj == this) {
            return true;
        }
        if (!(obj instanceof i) || size() != ((i) obj).size()) {
            return false;
        }
        if (size() == 0) {
            return true;
        }
        if (!(obj instanceof g)) {
            return obj.equals(this);
        }
        g gVar = (g) obj;
        int i5 = this.f34610a;
        int i11 = gVar.f34610a;
        if (i5 != 0 && i11 != 0 && i5 != i11) {
            return false;
        }
        int size = size();
        if (size > gVar.size()) {
            throw new IllegalArgumentException("Length too large: " + size + size());
        }
        if (size > gVar.size()) {
            StringBuilder sbJ = u4.j(size, "Ran off end of other: 0, ", ", ");
            sbJ.append(gVar.size());
            throw new IllegalArgumentException(sbJ.toString());
        }
        byte[] bArr = gVar.f34597d;
        int iJ = j() + size;
        int iJ2 = j();
        int iJ3 = gVar.j();
        while (iJ2 < iJ) {
            if (this.f34597d[iJ2] != bArr[iJ3]) {
                return false;
            }
            iJ2++;
            iJ3++;
        }
        return true;
    }

    @Override // com.google.crypto.tink.shaded.protobuf.i
    public void f(int i5, byte[] bArr) {
        System.arraycopy(this.f34597d, 0, bArr, 0, i5);
    }

    @Override // com.google.crypto.tink.shaded.protobuf.i
    public byte g(int i5) {
        return this.f34597d[i5];
    }

    @Override // java.lang.Iterable
    public final Iterator iterator() {
        return new androidx.datastore.preferences.protobuf.e(this);
    }

    public int j() {
        return 0;
    }

    @Override // com.google.crypto.tink.shaded.protobuf.i
    public int size() {
        return this.f34597d.length;
    }
}
