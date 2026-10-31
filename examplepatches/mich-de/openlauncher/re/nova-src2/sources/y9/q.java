package y9;

import android.graphics.Point;
import android.util.SparseArray;
import java.util.ArrayList;
import java.util.List;
import mx.j0;

/* loaded from: classes.dex */
public final class q implements n30.c {

    /* renamed from: a, reason: collision with root package name */
    public final Point f96943a;

    /* renamed from: b, reason: collision with root package name */
    public final int f96944b;

    /* renamed from: c, reason: collision with root package name */
    public final int f96945c;

    /* renamed from: d, reason: collision with root package name */
    public final int f96946d;

    /* renamed from: e, reason: collision with root package name */
    public int f96947e;

    /* renamed from: f, reason: collision with root package name */
    public int f96948f;

    /* renamed from: g, reason: collision with root package name */
    public int f96949g;

    /* renamed from: h, reason: collision with root package name */
    public final boolean f96950h;

    /* renamed from: i, reason: collision with root package name */
    public final nz.c f96951i;

    public q(j0 j0Var, nz.c cVar, boolean z11) {
        this.f96943a = new Point();
        int i5 = j0Var.f77174w0;
        this.f96944b = i5;
        int i11 = j0Var.f77172v0;
        this.f96945c = i11;
        this.f96946d = i5 * i11;
        this.f96951i = cVar;
        this.f96950h = z11;
    }

    public final Point a(int i5) {
        int i11 = i5 % this.f96946d;
        int i12 = this.f96948f;
        Point point = this.f96943a;
        point.x = i11 % i12;
        point.y = i11 / i12;
        return point;
    }

    public final ArrayList b(int i5, List list) {
        SparseArray sparseArray = new SparseArray();
        int i11 = this.f96948f * this.f96949g;
        int i12 = i5 * i11;
        int size = list.size();
        int iMin = Math.min(i12 + i11, size);
        int iMin2 = Math.min(i11, size);
        int i13 = 0;
        while (i12 < iMin) {
            int i14 = this.f96948f;
            nz.c cVar = this.f96951i;
            int iA = cVar.a(iMin2, i13, i14);
            if (iA >= 0) {
                sparseArray.put(iA, list.get(i12));
            }
            if (sparseArray.size() == cVar.b()) {
                break;
            }
            i12++;
            i13++;
        }
        ArrayList arrayList = new ArrayList(sparseArray.size());
        for (int i15 = 0; i15 < sparseArray.size(); i15++) {
            arrayList.add(sparseArray.valueAt(i15));
        }
        return arrayList;
    }

    /* JADX WARN: Removed duplicated region for block: B:23:0x0037  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void c(int i5) {
        boolean z11;
        int iMax;
        int iMax2;
        if (i5 != this.f96947e) {
            int i11 = this.f96948f;
            int i12 = this.f96949g;
            boolean z12 = this.f96950h;
            int i13 = this.f96944b;
            int i14 = this.f96945c;
            if (z12 || i5 >= this.f96946d) {
                i11 = i13;
                i12 = i14;
                z11 = true;
            } else {
                z11 = false;
            }
            while (!z11) {
                if (i11 * i12 < i5) {
                    if ((i11 <= i12 || i12 == i14) && i11 < i13) {
                        iMax = i11 + 1;
                    } else if (i12 < i14) {
                        iMax2 = i12 + 1;
                        iMax = i11;
                        if (iMax2 == 0) {
                            iMax2++;
                        }
                    } else {
                        iMax = i11;
                    }
                    iMax2 = i12;
                    if (iMax2 == 0) {
                    }
                } else {
                    int i15 = i12 - 1;
                    if (i15 * i11 < i5 || i12 < i11) {
                        int i16 = i11 - 1;
                        iMax = i16 * i12 >= i5 ? Math.max(0, i16) : i11;
                        iMax2 = i12;
                    } else {
                        iMax2 = Math.max(0, i15);
                        iMax = i11;
                    }
                }
                boolean z13 = iMax == i11 && iMax2 == i12;
                i12 = iMax2;
                z11 = z13;
                i11 = iMax;
            }
            this.f96948f = i11;
            this.f96949g = i12;
            this.f96951i.getClass();
            this.f96947e = i5;
        }
    }

    public final void d(ga.c cVar) {
        if (cVar != null) {
            c(cVar.H.size());
        }
    }

    public final boolean e(ga.j jVar, int i5) {
        Point pointA = a(i5);
        if (pointA.equals(jVar.f57293e.c(this), jVar.f57294f.c(this)) && i5 == jVar.f57299k) {
            return false;
        }
        jVar.f57299k = i5;
        jVar.f57293e = n30.a.b(this, pointA.x);
        jVar.f57294f = n30.a.b(this, pointA.y);
        return true;
    }

    @Override // n30.c
    public final boolean f() {
        return false;
    }

    public q(int i5, int i11) {
        this.f96943a = new Point();
        this.f96948f = i5;
        this.f96949g = i11;
        this.f96944b = i5;
        this.f96945c = i11;
        this.f96946d = i5 * i11;
        this.f96951i = null;
        this.f96950h = true;
    }
}
