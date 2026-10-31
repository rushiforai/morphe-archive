package p1;

import io.branch.requery.android.database.sqlite.SQLiteDatabase;
import java.util.ArrayList;

/* loaded from: classes.dex */
public final class f2 {

    /* renamed from: a, reason: collision with root package name */
    public final g2 f81409a;

    /* renamed from: b, reason: collision with root package name */
    public final int[] f81410b;

    /* renamed from: c, reason: collision with root package name */
    public final int f81411c;

    /* renamed from: d, reason: collision with root package name */
    public Object[] f81412d;

    /* renamed from: e, reason: collision with root package name */
    public final int f81413e;

    /* renamed from: f, reason: collision with root package name */
    public boolean f81414f;

    /* renamed from: g, reason: collision with root package name */
    public int f81415g;

    /* renamed from: h, reason: collision with root package name */
    public int f81416h;

    /* renamed from: i, reason: collision with root package name */
    public int f81417i;

    /* renamed from: j, reason: collision with root package name */
    public final fa.t f81418j;

    /* renamed from: k, reason: collision with root package name */
    public int f81419k;

    /* renamed from: l, reason: collision with root package name */
    public int f81420l;

    /* renamed from: m, reason: collision with root package name */
    public int f81421m;
    public boolean n;

    public f2(g2 g2Var) {
        this.f81409a = g2Var;
        this.f81410b = g2Var.f81427a;
        int i5 = g2Var.f81428b;
        this.f81411c = i5;
        this.f81412d = g2Var.f81429c;
        this.f81413e = g2Var.f81430d;
        this.f81416h = i5;
        this.f81417i = -1;
        this.f81418j = new fa.t((char) 0, 3);
    }

    public final a a(int i5) {
        ArrayList arrayList = this.f81409a.f81435i;
        int iE = i2.e(arrayList, i5, this.f81411c);
        if (iE >= 0) {
            return (a) arrayList.get(iE);
        }
        a aVar = new a(i5);
        arrayList.add(-(iE + 1), aVar);
        return aVar;
    }

    public final Object b(int[] iArr, int i5) {
        int i11 = i5 * 5;
        int i12 = iArr[i11 + 1];
        if ((268435456 & i12) != 0) {
            return this.f81412d[i11 >= iArr.length ? iArr.length : iArr[i11 + 4] + Integer.bitCount(i12 >> 29)];
        }
        return n.f81514a;
    }

    public final void c() {
        this.f81414f = true;
        g2 g2Var = this.f81409a;
        g2Var.getClass();
        if (this.f81409a != g2Var || g2Var.f81431e <= 0) {
            u.c("Unexpected reader close()");
        }
        g2Var.f81431e--;
        this.f81412d = new Object[0];
    }

    public final boolean d(int i5) {
        return (this.f81410b[(i5 * 5) + 1] & 67108864) != 0;
    }

    public final void e() {
        if (this.f81419k == 0) {
            if (!(this.f81415g == this.f81416h)) {
                u.c("endGroup() not called at the end of a group");
            }
            int i5 = (this.f81417i * 5) + 2;
            int[] iArr = this.f81410b;
            int i11 = iArr[i5];
            this.f81417i = i11;
            int i12 = this.f81411c;
            this.f81416h = i11 < 0 ? i12 : i2.a(iArr, i11) + i11;
            int iF = this.f81418j.f();
            if (iF < 0) {
                this.f81420l = 0;
                this.f81421m = 0;
            } else {
                this.f81420l = iF;
                this.f81421m = i11 >= i12 - 1 ? this.f81413e : iArr[((i11 + 1) * 5) + 4];
            }
        }
    }

    public final Object f() {
        int i5 = this.f81415g;
        if (i5 < this.f81416h) {
            return b(this.f81410b, i5);
        }
        return 0;
    }

    public final int g() {
        int i5 = this.f81415g;
        if (i5 >= this.f81416h) {
            return 0;
        }
        return this.f81410b[i5 * 5];
    }

    public final Object h(int i5, int i11) {
        int[] iArr = this.f81410b;
        int iC = i2.c(iArr, i5);
        int i12 = i5 + 1;
        int i13 = iC + i11;
        return i13 < (i12 < this.f81411c ? iArr[(i12 * 5) + 4] : this.f81413e) ? this.f81412d[i13] : n.f81514a;
    }

    public final int i(int i5) {
        return this.f81410b[i5 * 5];
    }

    public final boolean j(int i5) {
        return (this.f81410b[(i5 * 5) + 1] & 134217728) != 0;
    }

    public final boolean k(int i5) {
        return (this.f81410b[(i5 * 5) + 1] & SQLiteDatabase.ENABLE_WRITE_AHEAD_LOGGING) != 0;
    }

    public final boolean l(int i5) {
        return (this.f81410b[(i5 * 5) + 1] & 1073741824) != 0;
    }

    public final Object m() {
        int i5;
        if (this.f81419k > 0 || (i5 = this.f81420l) >= this.f81421m) {
            this.n = false;
            return n.f81514a;
        }
        this.n = true;
        Object[] objArr = this.f81412d;
        this.f81420l = i5 + 1;
        return objArr[i5];
    }

    public final Object n(int i5) {
        int i11 = i5 * 5;
        int[] iArr = this.f81410b;
        int i12 = iArr[i11 + 1] & 1073741824;
        if (i12 != 0) {
            return i12 != 0 ? this.f81412d[iArr[i11 + 4]] : n.f81514a;
        }
        return null;
    }

    public final int o(int i5) {
        return this.f81410b[(i5 * 5) + 1] & 67108863;
    }

    public final Object p(int[] iArr, int i5) {
        int i11 = i5 * 5;
        int i12 = iArr[i11 + 1];
        if ((536870912 & i12) == 0) {
            return null;
        }
        return this.f81412d[Integer.bitCount(i12 >> 30) + iArr[i11 + 4]];
    }

    public final int q(int i5) {
        return this.f81410b[(i5 * 5) + 2];
    }

    public final void r(int i5) {
        if (!(this.f81419k == 0)) {
            u.c("Cannot reposition while in an empty region");
        }
        this.f81415g = i5;
        int[] iArr = this.f81410b;
        int i11 = this.f81411c;
        int i12 = i5 < i11 ? iArr[(i5 * 5) + 2] : -1;
        if (i12 != this.f81417i) {
            this.f81417i = i12;
            if (i12 < 0) {
                this.f81416h = i11;
            } else {
                this.f81416h = i2.a(iArr, i12) + i12;
            }
            this.f81420l = 0;
            this.f81421m = 0;
        }
    }

    public final int s() {
        if (!(this.f81419k == 0)) {
            u.c("Cannot skip while in an empty region");
        }
        int i5 = this.f81415g;
        int[] iArr = this.f81410b;
        int i11 = (iArr[(i5 * 5) + 1] & 1073741824) == 0 ? iArr[(i5 * 5) + 1] & 67108863 : 1;
        this.f81415g = i2.a(iArr, i5) + i5;
        return i11;
    }

    public final void t() {
        if (!(this.f81419k == 0)) {
            u.c("Cannot skip the enclosing group while in an empty region");
        }
        this.f81415g = this.f81416h;
        this.f81420l = 0;
        this.f81421m = 0;
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("SlotReader(current=");
        sb2.append(this.f81415g);
        sb2.append(", key=");
        sb2.append(g());
        sb2.append(", parent=");
        sb2.append(this.f81417i);
        sb2.append(", end=");
        return a2.c.m(sb2, this.f81416h, ')');
    }

    public final void u() {
        if (this.f81419k <= 0) {
            int i5 = this.f81417i;
            int i11 = this.f81415g;
            int[] iArr = this.f81410b;
            if (!(iArr[(i11 * 5) + 2] == i5)) {
                o1.a("Invalid slot table detected");
            }
            int i12 = this.f81420l;
            int i13 = this.f81421m;
            fa.t tVar = this.f81418j;
            if (i12 == 0 && i13 == 0) {
                tVar.g(-1);
            } else {
                tVar.g(i12);
            }
            this.f81417i = i11;
            this.f81416h = i2.a(iArr, i11) + i11;
            int i14 = i11 + 1;
            this.f81415g = i14;
            this.f81420l = i2.c(iArr, i11);
            this.f81421m = i11 >= this.f81411c - 1 ? this.f81413e : iArr[(i14 * 5) + 4];
        }
    }
}
