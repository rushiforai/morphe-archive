package fz;

/* loaded from: classes.dex */
public final class u {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f56359a = 1;

    /* renamed from: b, reason: collision with root package name */
    public int f56360b;

    /* renamed from: c, reason: collision with root package name */
    public int f56361c;

    /* renamed from: d, reason: collision with root package name */
    public Object f56362d;

    /* renamed from: e, reason: collision with root package name */
    public Object f56363e;

    public /* synthetic */ u() {
    }

    public int a() {
        aq.y yVar = (aq.y) this.f56363e;
        if (yVar == null) {
            return ((String) this.f56362d).length();
        }
        return yVar.f() + (((String) this.f56362d).length() - (this.f56361c - this.f56360b));
    }

    public void b(int i5, int i11, String str) {
        if (i5 > i11) {
            s3.a.a("start index must be less than or equal to end index: " + i5 + " > " + i11);
        }
        if (i5 < 0) {
            s3.a.a("start must be non-negative, but was " + i5);
        }
        aq.y yVar = (aq.y) this.f56363e;
        if (yVar != null) {
            int i12 = this.f56360b;
            int i13 = i5 - i12;
            int i14 = i11 - i12;
            if (i13 >= 0 && i14 <= yVar.f()) {
                yVar.g(i13, i14, str);
                return;
            }
            this.f56362d = toString();
            this.f56363e = null;
            this.f56360b = -1;
            this.f56361c = -1;
            b(i5, i11, str);
            return;
        }
        int iMax = Math.max(255, str.length() + 128);
        char[] cArr = new char[iMax];
        int iMin = Math.min(i5, 64);
        int iMin2 = Math.min(((String) this.f56362d).length() - i11, 64);
        int i15 = i5 - iMin;
        ps.j0.t((String) this.f56362d, cArr, 0, i15, i5);
        int i16 = iMax - iMin2;
        int i17 = iMin2 + i11;
        ps.j0.t((String) this.f56362d, cArr, i16, i11, i17);
        ps.i0.h(str, cArr, iMin);
        this.f56363e = new aq.y(cArr, str.length() + iMin, i16);
        this.f56360b = i15;
        this.f56361c = i17;
    }

    public final String toString() {
        switch (this.f56359a) {
            case 0:
                int i5 = this.f56361c;
                int i11 = this.f56360b;
                String strB = ((d) this.f56362d).b();
                gz.f fVar = (gz.f) this.f56363e;
                StringBuilder sbT = b.c0.t(i5, "IconConfigStatic(", ", ", i11, ", ");
                sbT.append(strB);
                sbT.append(", ");
                sbT.append(fVar);
                sbT.append(")");
                return sbT.toString();
            default:
                aq.y yVar = (aq.y) this.f56363e;
                if (yVar == null) {
                    return (String) this.f56362d;
                }
                StringBuilder sb2 = new StringBuilder();
                sb2.append((CharSequence) this.f56362d, 0, this.f56360b);
                yVar.c(sb2);
                String str = (String) this.f56362d;
                sb2.append((CharSequence) str, this.f56361c, str.length());
                return sb2.toString();
        }
    }

    public u(int i5, int i11, d dVar, gz.f fVar) {
        this.f56360b = i5;
        this.f56361c = i11;
        this.f56362d = dVar;
        this.f56363e = fVar;
    }
}
