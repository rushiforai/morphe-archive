package r3;

/* loaded from: classes2.dex */
public final class g implements h {

    /* renamed from: a, reason: collision with root package name */
    public final int f85441a;

    /* renamed from: b, reason: collision with root package name */
    public final int f85442b;

    public g(int i5, int i11) {
        this.f85441a = i5;
        this.f85442b = i11;
        if (i5 >= 0 && i11 >= 0) {
            return;
        }
        s3.a.a("Expected lengthBeforeCursor and lengthAfterCursor to be non-negative, were " + i5 + " and " + i11 + " respectively.");
    }

    @Override // r3.h
    public final void a(j jVar) {
        int i5 = 0;
        int i11 = 0;
        int i12 = 0;
        while (true) {
            if (i11 < this.f85441a) {
                int i13 = i12 + 1;
                int i14 = jVar.f85447b;
                if (i14 <= i13) {
                    i12 = i14;
                    break;
                } else {
                    i12 = (Character.isHighSurrogate(jVar.b((i14 - i13) + (-1))) && Character.isLowSurrogate(jVar.b(jVar.f85447b - i13))) ? i12 + 2 : i13;
                    i11++;
                }
            } else {
                break;
            }
        }
        int iA = 0;
        while (true) {
            if (i5 >= this.f85442b) {
                break;
            }
            int i15 = iA + 1;
            int i16 = jVar.f85448c;
            fz.u uVar = jVar.f85446a;
            if (i16 + i15 >= uVar.a()) {
                iA = uVar.a() - jVar.f85448c;
                break;
            } else {
                iA = (Character.isHighSurrogate(jVar.b((jVar.f85448c + i15) + (-1))) && Character.isLowSurrogate(jVar.b(jVar.f85448c + i15))) ? iA + 2 : i15;
                i5++;
            }
        }
        int i17 = jVar.f85448c;
        jVar.a(i17, iA + i17);
        int i18 = jVar.f85447b;
        jVar.a(i18 - i12, i18);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof g)) {
            return false;
        }
        g gVar = (g) obj;
        return this.f85441a == gVar.f85441a && this.f85442b == gVar.f85442b;
    }

    public final int hashCode() {
        return (this.f85441a * 31) + this.f85442b;
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("DeleteSurroundingTextInCodePointsCommand(lengthBeforeCursor=");
        sb2.append(this.f85441a);
        sb2.append(", lengthAfterCursor=");
        return a2.c.m(sb2, this.f85442b, ')');
    }
}
