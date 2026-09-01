package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class mu3 {
    public final h30 a;
    public int b;
    public int c;
    public int d;
    public int e;

    public mu3(mx mxVar, long j) {
        String str = mxVar.b;
        h30 h30Var = new h30();
        h30Var.d = str;
        h30Var.b = -1;
        h30Var.c = -1;
        this.a = h30Var;
        this.b = bkd.f(j);
        this.c = bkd.e(j);
        this.d = -1;
        this.e = -1;
        int iF = bkd.f(j);
        int iE = bkd.e(j);
        if (iF < 0 || iF > str.length()) {
            ik4.e(str.length(), ev6.C("start (", iF, ") offset is outside of text region "));
            throw null;
        }
        if (iE < 0 || iE > str.length()) {
            ik4.e(str.length(), ev6.C("end (", iE, ") offset is outside of text region "));
            throw null;
        }
        if (iF <= iE) {
            return;
        }
        ay0.e(ev6.v("Do not set reversed range: ", iF, iE, " > "));
        throw null;
    }

    public final void a(int i, int i2) {
        long jQ = lk7.q(i, i2);
        this.a.z(i, i2, "");
        long jT = yi2.T(lk7.q(this.b, this.c), jQ);
        h(bkd.f(jT));
        g(bkd.e(jT));
        int i3 = this.d;
        if (i3 != -1) {
            long jT2 = yi2.T(lk7.q(i3, this.e), jQ);
            if (bkd.c(jT2)) {
                this.d = -1;
                this.e = -1;
            } else {
                this.d = bkd.f(jT2);
                this.e = bkd.e(jT2);
            }
        }
    }

    public final char b(int i) {
        h30 h30Var = this.a;
        ym0 ym0Var = (ym0) h30Var.e;
        if (ym0Var == null) {
            return ((String) h30Var.d).charAt(i);
        }
        if (i < h30Var.b) {
            return ((String) h30Var.d).charAt(i);
        }
        int iF = ym0Var.b - ym0Var.f();
        int i2 = h30Var.b;
        if (i >= iF + i2) {
            return ((String) h30Var.d).charAt(i - ((iF - h30Var.c) + i2));
        }
        int i3 = i - i2;
        int i4 = ym0Var.c;
        char[] cArr = (char[]) ym0Var.e;
        return i3 < i4 ? cArr[i3] : cArr[(i3 - i4) + ym0Var.d];
    }

    public final bkd c() {
        int i = this.d;
        if (i != -1) {
            return new bkd(lk7.q(i, this.e));
        }
        return null;
    }

    public final void d(int i, int i2, String str) {
        h30 h30Var = this.a;
        if (i < 0 || i > h30Var.l()) {
            ik4.e(h30Var.l(), ev6.C("start (", i, ") offset is outside of text region "));
            return;
        }
        if (i2 < 0 || i2 > h30Var.l()) {
            ik4.e(h30Var.l(), ev6.C("end (", i2, ") offset is outside of text region "));
        } else {
            if (i > i2) {
                ay0.e(ev6.v("Do not set reversed range: ", i, i2, " > "));
                return;
            }
            h30Var.z(i, i2, str);
            h(str.length() + i);
            g(str.length() + i);
            this.d = -1;
            this.e = -1;
        }
    }

    public final void e(int i, int i2) {
        h30 h30Var = this.a;
        if (i < 0 || i > h30Var.l()) {
            ik4.e(h30Var.l(), ev6.C("start (", i, ") offset is outside of text region "));
        } else if (i2 < 0 || i2 > h30Var.l()) {
            ik4.e(h30Var.l(), ev6.C("end (", i2, ") offset is outside of text region "));
        } else if (i >= i2) {
            ay0.e(ev6.v("Do not set reversed or empty range: ", i, i2, " > "));
        } else {
            this.d = i;
            this.e = i2;
        }
    }

    public final void f(int i, int i2) {
        h30 h30Var = this.a;
        if (i < 0 || i > h30Var.l()) {
            ik4.e(h30Var.l(), ev6.C("start (", i, ") offset is outside of text region "));
        } else if (i2 < 0 || i2 > h30Var.l()) {
            ik4.e(h30Var.l(), ev6.C("end (", i2, ") offset is outside of text region "));
        } else if (i > i2) {
            ay0.e(ev6.v("Do not set reversed range: ", i, i2, " > "));
        } else {
            h(i);
            g(i2);
        }
    }

    public final void g(int i) {
        if (!(i >= 0)) {
            c26.a("Cannot set selectionEnd to a negative value: " + i);
        }
        this.c = i;
    }

    public final void h(int i) {
        if (!(i >= 0)) {
            c26.a("Cannot set selectionStart to a negative value: " + i);
        }
        this.b = i;
    }

    public final String toString() {
        return this.a.toString();
    }
}
