package r3;

import b.u4;
import e10.z2;
import m3.o0;

/* loaded from: classes.dex */
public final class j {

    /* renamed from: a, reason: collision with root package name */
    public final fz.u f85446a;

    /* renamed from: b, reason: collision with root package name */
    public int f85447b;

    /* renamed from: c, reason: collision with root package name */
    public int f85448c;

    /* renamed from: d, reason: collision with root package name */
    public int f85449d;

    /* renamed from: e, reason: collision with root package name */
    public int f85450e;

    public j(m3.g gVar, long j11) {
        String str = gVar.f75880b;
        fz.u uVar = new fz.u();
        uVar.f56362d = str;
        uVar.f56360b = -1;
        uVar.f56361c = -1;
        this.f85446a = uVar;
        this.f85447b = o0.f(j11);
        this.f85448c = o0.e(j11);
        this.f85449d = -1;
        this.f85450e = -1;
        int iF = o0.f(j11);
        int iE = o0.e(j11);
        if (iF < 0 || iF > str.length()) {
            StringBuilder sbJ = u4.j(iF, "start (", ") offset is outside of text region ");
            sbJ.append(str.length());
            throw new IndexOutOfBoundsException(sbJ.toString());
        }
        if (iE < 0 || iE > str.length()) {
            StringBuilder sbJ2 = u4.j(iE, "end (", ") offset is outside of text region ");
            sbJ2.append(str.length());
            throw new IndexOutOfBoundsException(sbJ2.toString());
        }
        if (iF > iE) {
            throw new IllegalArgumentException(b.c0.g(iF, iE, "Do not set reversed range: ", " > "));
        }
    }

    public final void a(int i5, int i11) {
        long jU = z2.u(i5, i11);
        this.f85446a.b(i5, i11, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b);
        long jX = ps.f0.x(z2.u(this.f85447b, this.f85448c), jU);
        h(o0.f(jX));
        g(o0.e(jX));
        int i12 = this.f85449d;
        if (i12 != -1) {
            long jX2 = ps.f0.x(z2.u(i12, this.f85450e), jU);
            if (o0.c(jX2)) {
                this.f85449d = -1;
                this.f85450e = -1;
            } else {
                this.f85449d = o0.f(jX2);
                this.f85450e = o0.e(jX2);
            }
        }
    }

    public final char b(int i5) {
        fz.u uVar = this.f85446a;
        aq.y yVar = (aq.y) uVar.f56363e;
        if (yVar != null && i5 >= uVar.f56360b) {
            int iF = yVar.f();
            int i11 = uVar.f56360b;
            return i5 < iF + i11 ? yVar.e(i5 - i11) : ((String) uVar.f56362d).charAt(i5 - ((iF - uVar.f56361c) + i11));
        }
        return ((String) uVar.f56362d).charAt(i5);
    }

    public final o0 c() {
        int i5 = this.f85449d;
        if (i5 != -1) {
            return new o0(z2.u(i5, this.f85450e));
        }
        return null;
    }

    public final void d(int i5, int i11, String str) {
        fz.u uVar = this.f85446a;
        if (i5 < 0 || i5 > uVar.a()) {
            StringBuilder sbJ = u4.j(i5, "start (", ") offset is outside of text region ");
            sbJ.append(uVar.a());
            throw new IndexOutOfBoundsException(sbJ.toString());
        }
        if (i11 < 0 || i11 > uVar.a()) {
            StringBuilder sbJ2 = u4.j(i11, "end (", ") offset is outside of text region ");
            sbJ2.append(uVar.a());
            throw new IndexOutOfBoundsException(sbJ2.toString());
        }
        if (i5 > i11) {
            throw new IllegalArgumentException(b.c0.g(i5, i11, "Do not set reversed range: ", " > "));
        }
        uVar.b(i5, i11, str);
        h(str.length() + i5);
        g(str.length() + i5);
        this.f85449d = -1;
        this.f85450e = -1;
    }

    public final void e(int i5, int i11) {
        fz.u uVar = this.f85446a;
        if (i5 < 0 || i5 > uVar.a()) {
            StringBuilder sbJ = u4.j(i5, "start (", ") offset is outside of text region ");
            sbJ.append(uVar.a());
            throw new IndexOutOfBoundsException(sbJ.toString());
        }
        if (i11 < 0 || i11 > uVar.a()) {
            StringBuilder sbJ2 = u4.j(i11, "end (", ") offset is outside of text region ");
            sbJ2.append(uVar.a());
            throw new IndexOutOfBoundsException(sbJ2.toString());
        }
        if (i5 >= i11) {
            throw new IllegalArgumentException(b.c0.g(i5, i11, "Do not set reversed or empty range: ", " > "));
        }
        this.f85449d = i5;
        this.f85450e = i11;
    }

    public final void f(int i5, int i11) {
        fz.u uVar = this.f85446a;
        if (i5 < 0 || i5 > uVar.a()) {
            StringBuilder sbJ = u4.j(i5, "start (", ") offset is outside of text region ");
            sbJ.append(uVar.a());
            throw new IndexOutOfBoundsException(sbJ.toString());
        }
        if (i11 < 0 || i11 > uVar.a()) {
            StringBuilder sbJ2 = u4.j(i11, "end (", ") offset is outside of text region ");
            sbJ2.append(uVar.a());
            throw new IndexOutOfBoundsException(sbJ2.toString());
        }
        if (i5 > i11) {
            throw new IllegalArgumentException(b.c0.g(i5, i11, "Do not set reversed range: ", " > "));
        }
        h(i5);
        g(i11);
    }

    public final void g(int i5) {
        if (!(i5 >= 0)) {
            s3.a.a("Cannot set selectionEnd to a negative value: " + i5);
        }
        this.f85448c = i5;
    }

    public final void h(int i5) {
        if (!(i5 >= 0)) {
            s3.a.a("Cannot set selectionStart to a negative value: " + i5);
        }
        this.f85447b = i5;
    }

    public final String toString() {
        return this.f85446a.toString();
    }
}
