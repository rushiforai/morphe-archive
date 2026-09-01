package defpackage;

import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class qy8 {
    public final md5 a;
    public final k68 b;
    public final l68 c;
    public final i68 d;
    public final k68 e;
    public float f;
    public int g;
    public int h;
    public int i;
    public int j;
    public int k;
    public boolean l;
    public int m;
    public final gu6 n;
    public final ku3 o;

    public qy8(md5 md5Var, gu6 gu6Var, wx4 wx4Var) {
        this.a = md5Var;
        k68 k68Var = j46.a;
        this.b = new k68();
        this.c = new l68();
        int i = e46.a;
        this.d = new i68();
        this.e = new k68();
        this.g = -1;
        this.h = Integer.MAX_VALUE;
        this.i = Integer.MIN_VALUE;
        this.n = gu6Var;
        this.o = new ku3(wx4Var);
    }

    public final int a(ku3 ku3Var, int i, boolean z) {
        List list;
        List list2;
        k68 k68Var = this.e;
        if (k68Var.a(i)) {
            Object objB = k68Var.b(i);
            objB.getClass();
            return ((o31) objB).b;
        }
        k68 k68Var2 = this.b;
        int i2 = 0;
        if (k68Var2.a(i)) {
            if (!z || (list2 = (List) k68Var2.b(i)) == null) {
                return -1;
            }
            int size = list2.size();
            while (i2 < size) {
                ((fu6) list2.get(i2)).a();
                i2++;
            }
            return -1;
        }
        n31 n31Var = new n31(this, ku3Var, i2);
        long j = ku3Var.v().u;
        gu6 gu6Var = (gu6) ku3Var.d;
        if (gu6Var == null) {
            g76.g0("state");
            throw null;
        }
        k68Var2.i(i, d46.Q(gu6Var.a(i, j, true, new q58(n31Var, 17, ku3Var))));
        if (!z || (list = (List) k68Var2.b(i)) == null) {
            return -1;
        }
        int size2 = list.size();
        while (i2 < size2) {
            ((fu6) list.get(i2)).a();
            i2++;
        }
        return -1;
    }

    public final boolean b() {
        return (this.h == Integer.MAX_VALUE || this.i == Integer.MIN_VALUE) ? false : true;
    }

    /* JADX WARN: Type inference fix 'apply assigned field type' failed
    java.lang.UnsupportedOperationException: ArgType.getObject(), call class: class jadx.core.dex.instructions.args.ArgType$PrimitiveArg
    	at jadx.core.dex.instructions.args.ArgType.getObject(ArgType.java:593)
    	at jadx.core.dex.attributes.nodes.ClassTypeVarsAttr.getTypeVarsMapFor(ClassTypeVarsAttr.java:35)
    	at jadx.core.dex.nodes.utils.TypeUtils.replaceClassGenerics(TypeUtils.java:177)
    	at jadx.core.dex.visitors.typeinference.FixTypesVisitor.insertExplicitUseCast(FixTypesVisitor.java:397)
    	at jadx.core.dex.visitors.typeinference.FixTypesVisitor.tryFieldTypeWithNewCasts(FixTypesVisitor.java:359)
    	at jadx.core.dex.visitors.typeinference.FixTypesVisitor.applyFieldType(FixTypesVisitor.java:309)
    	at jadx.core.dex.visitors.typeinference.FixTypesVisitor.visit(FixTypesVisitor.java:94)
     */
    public final void c(ku3 ku3Var, int i, int i2) {
        int i3;
        int i4;
        k68 k68Var = this.e;
        o31 o31Var = (o31) k68Var.b(i);
        y3b y3bVar = o31.c;
        if (o31Var != null) {
            o31Var.b = i2;
            o31Var.a = y3bVar;
        } else {
            o31Var = new o31();
            o31Var.a = y3bVar;
            o31Var.b = i2;
        }
        k68Var.i(i, o31Var);
        if (i > this.i) {
            this.i = i;
            this.k -= i2;
        } else if (i < this.h) {
            this.h = i;
            this.j -= i2;
        }
        int i5 = 1;
        if (Math.signum(this.f) <= 0.0f) {
            if (this.k > 0) {
                i3 = this.i + 1;
                i4 = i3;
            }
            i4 = -1;
        } else {
            if (Math.signum(this.f) > 0.0f && this.j > 0) {
                i3 = this.h - 1;
                i4 = i3;
            }
            i4 = -1;
        }
        if (i4 > 0 && i4 != -1 && i4 < this.m) {
            n31 n31Var = new n31(this, ku3Var, i5);
            long j = ku3Var.v().u;
            gu6 gu6Var = (gu6) ku3Var.d;
            if (gu6Var == null) {
                g76.g0("state");
                throw null;
            }
            this.b.i(i4, d46.Q(gu6Var.a(i4, j, true, new q58(n31Var, 17, ku3Var))));
        }
        h();
    }

    public final void d(ku3 ku3Var, int i, int i2, int i3, int i4, int i5, float f, boolean z) {
        int i6;
        int i7;
        boolean z2 = Math.signum(f) == Math.signum(this.f);
        if (!z) {
            if (!z2 || this.l) {
                this.j = i3 - i5;
                this.h = i;
            } else {
                int iW0 = nk7.w0(Math.abs(f)) + this.j;
                int i8 = i3 - i5;
                if (iW0 > i8) {
                    iW0 = i8;
                }
                this.j = iW0;
            }
            while (this.j > 0 && (i6 = this.h) > 0) {
                int iA = a(ku3Var, this.h - 1, i6 + (-1) == i + (-1) && ((f > 0.0f ? 1 : (f == 0.0f ? 0 : -1)) != 0) && Math.abs(f) >= ((float) i5));
                if (iA == -1) {
                    return;
                }
                this.h--;
                this.j -= iA;
            }
            return;
        }
        if (!z2 || this.l) {
            this.k = i3 - i4;
            this.i = i2;
        } else {
            int iW02 = nk7.w0(Math.abs(f)) + this.k;
            int i9 = i3 - i4;
            if (iW02 > i9) {
                iW02 = i9;
            }
            this.k = iW02;
        }
        while (this.k > 0 && (i7 = this.i) != -1 && i7 < this.m - 1) {
            int iA2 = a(ku3Var, this.i + 1, i7 + 1 == i2 + 1 && ((f > 0.0f ? 1 : (f == 0.0f ? 0 : -1)) != 0) && Math.abs(f) >= ((float) i4));
            if (iA2 == -1) {
                return;
            }
            this.i++;
            this.k -= iA2;
        }
    }

    public final void e(float f, yy8 yy8Var) {
        qy8 qy8Var;
        boolean z;
        int i;
        int i2;
        int i3;
        ku3 ku3Var = this.o;
        ku3Var.c = yy8Var;
        ku3Var.d = this.n;
        float f2 = -f;
        h();
        if (ku3Var.t()) {
            lk7.u(ku3Var.v());
            ku3Var.v();
            this.m = ku3Var.y();
            int iS = ku3Var.s();
            int iU = ku3Var.u();
            int iY = ku3Var.y();
            int iX = ku3Var.x();
            int iW = ku3Var.w();
            k68 k68Var = this.e;
            if (f2 <= 0.0f) {
                this.j = 0 - iX;
                this.h = iS;
                while (this.j > 0 && (i3 = this.h) > 0 && k68Var.a(i3 - 1)) {
                    Object objB = k68Var.b(this.h - 1);
                    objB.getClass();
                    this.h--;
                    this.j -= ((o31) objB).b;
                }
                f(0, this.h - 1);
            } else {
                this.k = 0 - iW;
                this.i = iU;
                while (this.k > 0 && (i2 = this.i) < iY - 1 && k68Var.a(i2 + 1)) {
                    Object objB2 = k68Var.b(this.i + 1);
                    objB2.getClass();
                    int i4 = ((o31) objB2).b;
                    this.i++;
                    this.k -= i4;
                }
                f(this.i + 1, iY - 1);
            }
        }
        if (ku3Var.t()) {
            lk7.u(ku3Var.v());
            if (ku3Var.v().t != null) {
                i = ((gz8) this.a.b).o;
                z = false;
            } else {
                z = false;
                i = 0;
            }
            qy8Var = this;
            qy8Var.d(ku3Var, ku3Var.s(), ku3Var.u(), i, ku3Var.w(), ku3Var.x(), f2, f2 <= 0.0f ? true : z);
        } else {
            qy8Var = this;
        }
        qy8Var.f = f2;
        qy8Var.h();
    }

    /* JADX WARN: Removed duplicated region for block: B:17:0x0054  */
    /* JADX WARN: Removed duplicated region for block: B:57:0x00f0  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void f(int r29, int r30) {
        /*
            Method dump skipped, instruction units count: 412
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.qy8.f(int, int):void");
    }

    public final void g() {
        this.h = Integer.MAX_VALUE;
        this.i = Integer.MIN_VALUE;
        this.j = 0;
        this.k = 0;
        this.l = false;
        this.d.a();
        this.e.c();
        k68 k68Var = this.b;
        long[] jArr = k68Var.a;
        int length = jArr.length - 2;
        if (length < 0) {
            return;
        }
        int i = 0;
        while (true) {
            long j = jArr[i];
            if ((((~j) << 7) & j & (-9187201950435737472L)) != -9187201950435737472L) {
                int i2 = 8 - ((~(i - length)) >>> 31);
                for (int i3 = 0; i3 < i2; i3++) {
                    if ((255 & j) < 128) {
                        int i4 = (i << 3) + i3;
                        int i5 = k68Var.b[i4];
                        List list = (List) k68Var.c[i4];
                        int size = list.size();
                        for (int i6 = 0; i6 < size; i6++) {
                            ((fu6) list.get(i6)).cancel();
                        }
                        k68Var.h(i4);
                    }
                    j >>= 8;
                }
                if (i2 != 8) {
                    return;
                }
            }
            if (i == length) {
                return;
            } else {
                i++;
            }
        }
    }

    public final void h() {
        nm.N(this.j, "prefetchWindowStartExtraSpace");
        nm.N(this.k, "prefetchWindowEndExtraSpace");
        nm.N(this.h, "prefetchWindowStartIndex");
        nm.N(this.i, "prefetchWindowEndIndex");
    }
}
