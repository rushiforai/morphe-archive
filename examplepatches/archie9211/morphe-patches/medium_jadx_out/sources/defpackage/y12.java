package defpackage;

import com.medium.android.donkey.main.Wv.MaAxRJinch;
import java.util.ArrayList;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final class y12 {
    public final p65 a;
    public tj1 b;
    public boolean c;
    public int f;
    public int g;
    public int l;
    public final t46 d = new t46();
    public boolean e = true;
    public final ArrayList h = new ArrayList();
    public int i = -1;
    public int j = -1;
    public int k = -1;

    public y12(p65 p65Var, tj1 tj1Var) {
        this.a = p65Var;
        this.b = tj1Var;
    }

    public final void a() {
        c();
        ArrayList arrayList = this.h;
        if (arrayList.isEmpty()) {
            this.g++;
        } else {
            arrayList.remove(arrayList.size() - 1);
        }
    }

    public final void b() {
        int i = this.g;
        if (i > 0) {
            qv8 qv8Var = this.b.s;
            qv8Var.I(fv8.d);
            qv8Var.f[qv8Var.g - qv8Var.d[qv8Var.e - 1].b] = i;
            this.g = 0;
        }
        ArrayList arrayList = this.h;
        if (arrayList.isEmpty()) {
            return;
        }
        tj1 tj1Var = this.b;
        int size = arrayList.size();
        Object[] objArr = new Object[size];
        for (int i2 = 0; i2 < size; i2++) {
            objArr[i2] = arrayList.get(i2);
        }
        tj1Var.getClass();
        if (size != 0) {
            qv8 qv8Var2 = tj1Var.s;
            qv8Var2.I(gu8.d);
            gq7.S(qv8Var2, 0, objArr);
        }
        arrayList.clear();
    }

    public final void c() {
        int i = this.l;
        if (i > 0) {
            int i2 = this.i;
            if (i2 >= 0) {
                b();
                qv8 qv8Var = this.b.s;
                qv8Var.I(vu8.d);
                int i3 = qv8Var.g - qv8Var.d[qv8Var.e - 1].b;
                int[] iArr = qv8Var.f;
                iArr[i3] = i2;
                iArr[i3 + 1] = i;
                this.i = -1;
            } else {
                int i4 = this.k;
                int i5 = this.j;
                b();
                qv8 qv8Var2 = this.b.s;
                qv8Var2.I(ru8.d);
                int i6 = qv8Var2.g - qv8Var2.d[qv8Var2.e - 1].b;
                int[] iArr2 = qv8Var2.f;
                iArr2[i6 + 1] = i4;
                iArr2[i6] = i5;
                iArr2[i6 + 2] = i;
                this.j = -1;
                this.k = -1;
            }
            this.l = 0;
        }
    }

    public final void d(boolean z) {
        egc egcVar = this.a.G;
        int i = z ? egcVar.i : egcVar.g;
        int i2 = i - this.f;
        if (i2 < 0) {
            b22.a("Tried to seek backward");
        }
        if (i2 > 0) {
            qv8 qv8Var = this.b.s;
            qv8Var.I(yt8.d);
            qv8Var.f[qv8Var.g - qv8Var.d[qv8Var.e - 1].b] = i2;
            this.f = i;
        }
    }

    public final void e(int i, int i2) {
        if (i2 > 0) {
            if (!(i >= 0)) {
                b22.a(MaAxRJinch.Kbub + i);
            }
            if (this.i == i) {
                this.l += i2;
                return;
            }
            c();
            this.i = i;
            this.l = i2;
        }
    }
}
