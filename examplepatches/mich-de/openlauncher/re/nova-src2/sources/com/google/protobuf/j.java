package com.google.protobuf;

import b.u4;
import java.nio.charset.Charset;
import java.util.Iterator;

/* loaded from: classes.dex */
public class j extends l {

    /* renamed from: d, reason: collision with root package name */
    public final byte[] f34876d;

    public j(byte[] bArr) {
        this.f34886a = 0;
        bArr.getClass();
        this.f34876d = bArr;
    }

    @Override // com.google.protobuf.l
    public byte c(int i5) {
        return this.f34876d[i5];
    }

    public final boolean equals(Object obj) {
        if (obj == this) {
            return true;
        }
        if (!(obj instanceof l) || size() != ((l) obj).size()) {
            return false;
        }
        if (size() == 0) {
            return true;
        }
        if (!(obj instanceof j)) {
            return obj.equals(this);
        }
        j jVar = (j) obj;
        int i5 = this.f34886a;
        int i11 = jVar.f34886a;
        if (i5 != 0 && i11 != 0 && i5 != i11) {
            return false;
        }
        int size = size();
        if (size > jVar.size()) {
            throw new IllegalArgumentException("Length too large: " + size + size());
        }
        if (size > jVar.size()) {
            StringBuilder sbJ = u4.j(size, "Ran off end of other: 0, ", ", ");
            sbJ.append(jVar.size());
            throw new IllegalArgumentException(sbJ.toString());
        }
        byte[] bArr = jVar.f34876d;
        int iQ = q() + size;
        int iQ2 = q();
        int iQ3 = jVar.q();
        while (iQ2 < iQ) {
            if (this.f34876d[iQ2] != bArr[iQ3]) {
                return false;
            }
            iQ2++;
            iQ3++;
        }
        return true;
    }

    @Override // com.google.protobuf.l
    public byte g(int i5) {
        return this.f34876d[i5];
    }

    @Override // com.google.protobuf.l
    public final boolean h() {
        int iQ = q();
        return o2.f34936a.c(this.f34876d, iQ, size() + iQ) == 0;
    }

    @Override // java.lang.Iterable
    public final Iterator iterator() {
        return new androidx.datastore.preferences.protobuf.e(this);
    }

    @Override // com.google.protobuf.l
    public final p j() {
        return p.h(this.f34876d, q(), size(), true);
    }

    @Override // com.google.protobuf.l
    public final int k(int i5, int i11) {
        int iQ = q();
        Charset charset = a1.f34808a;
        for (int i12 = iQ; i12 < iQ + i11; i12++) {
            i5 = (i5 * 31) + this.f34876d[i12];
        }
        return i5;
    }

    @Override // com.google.protobuf.l
    public final l l(int i5) {
        int iD = l.d(0, i5, size());
        return iD == 0 ? l.f34884b : new i(this.f34876d, q(), iD);
    }

    @Override // com.google.protobuf.l
    public final String n(Charset charset) {
        return new String(this.f34876d, q(), size(), charset);
    }

    @Override // com.google.protobuf.l
    public final void p(t tVar) {
        tVar.C(q(), size(), this.f34876d);
    }

    public int q() {
        return 0;
    }

    @Override // com.google.protobuf.l
    public int size() {
        return this.f34876d.length;
    }
}
