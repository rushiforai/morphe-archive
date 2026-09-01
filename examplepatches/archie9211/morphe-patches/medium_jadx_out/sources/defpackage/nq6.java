package defpackage;

import android.os.Handler;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class nq6 implements f12 {
    public final aq6 a;
    public l22 b;
    public nvc c;
    public int d;
    public int e;
    public final f78 f;
    public final f78 g;
    public final iq6 h;
    public final fq6 i;
    public final f78 j;
    public final mvc k;
    public final f78 l;
    public final o78 m;
    public int n;
    public int o;
    public final String p;

    public nq6(aq6 aq6Var, nvc nvcVar) {
        this.a = aq6Var;
        this.c = nvcVar;
        long[] jArr = hqb.a;
        this.f = new f78();
        this.g = new f78();
        this.h = new iq6(this);
        this.i = new fq6(this);
        this.j = new f78();
        this.k = new mvc();
        this.l = new f78();
        this.m = new o78(new Object[16]);
        this.p = "Asking for intrinsic measurements of SubcomposeLayout layouts is not supported. This includes components that are built on top of SubcomposeLayout, such as lazy lists, BoxWithConstraints, TabRow, etc. To mitigate this:\n- if intrinsic measurements are used to achieve 'match parent' sizing, consider replacing the parent of the component with a custom layout which controls the order in which children are measured, making intrinsic measurement not needed\n- adding a size modifier to the component, in order to fast return the queried intrinsic measurement.";
    }

    public static void d(gq6 gq6Var) {
        g78 g78Var;
        l69 l69Var = gq6Var.f;
        if (l69Var != null) {
            l69Var.h.set(n69.Cancelled);
            l3b l3bVar = l69Var.k;
            if (((g78) l3bVar.g).h()) {
                g78Var = (g78) l3bVar.g;
                g78 g78Var2 = iqb.a;
                l3bVar.g = new g78();
                ((o78) l3bVar.c).i();
            } else {
                g78Var = null;
            }
            l3bVar.c();
            q22 q22Var = l69Var.a;
            q22Var.q = null;
            if (g78Var != null) {
                q22Var.u.i = g78Var;
                q22Var.w = 2;
            }
            gq6Var.f = null;
            q22 q22Var2 = gq6Var.c;
            if (q22Var2 != null) {
                q22Var2.m();
            }
            gq6Var.c = null;
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:16:0x004d  */
    @Override // defpackage.f12
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void a() {
        /*
            r17 = this;
            r0 = r17
            r1 = 1
            aq6 r2 = r0.a
            r2.q = r1
            f78 r1 = r0.f
            java.lang.Object[] r3 = r1.c
            long[] r4 = r1.a
            int r5 = r4.length
            int r5 = r5 + (-2)
            r6 = 0
            if (r5 < 0) goto L52
            r7 = r6
        L14:
            r8 = r4[r7]
            long r10 = ~r8
            r12 = 7
            long r10 = r10 << r12
            long r10 = r10 & r8
            r12 = -9187201950435737472(0x8080808080808080, double:-2.937446524422997E-306)
            long r10 = r10 & r12
            int r10 = (r10 > r12 ? 1 : (r10 == r12 ? 0 : -1))
            if (r10 == 0) goto L4d
            int r10 = r7 - r5
            int r10 = ~r10
            int r10 = r10 >>> 31
            r11 = 8
            int r10 = 8 - r10
            r12 = r6
        L2e:
            if (r12 >= r10) goto L4b
            r13 = 255(0xff, double:1.26E-321)
            long r13 = r13 & r8
            r15 = 128(0x80, double:6.3E-322)
            int r13 = (r13 > r15 ? 1 : (r13 == r15 ? 0 : -1))
            if (r13 >= 0) goto L47
            int r13 = r7 << 3
            int r13 = r13 + r12
            r13 = r3[r13]
            gq6 r13 = (defpackage.gq6) r13
            q22 r13 = r13.c
            if (r13 == 0) goto L47
            r13.m()
        L47:
            long r8 = r8 >> r11
            int r12 = r12 + 1
            goto L2e
        L4b:
            if (r10 != r11) goto L52
        L4d:
            if (r7 == r5) goto L52
            int r7 = r7 + 1
            goto L14
        L52:
            r2.P()
            r2.q = r6
            r1.a()
            f78 r1 = r0.g
            r1.a()
            r0.o = r6
            r0.n = r6
            f78 r1 = r0.j
            r1.a()
            r0.h()
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.nq6.a():void");
    }

    @Override // defpackage.f12
    public final void b() {
        i(true);
    }

    public final void c(gq6 gq6Var, boolean z) {
        l69 l69Var = gq6Var.f;
        if (l69Var != null) {
            oic oicVarA = vn7.A();
            x45 x45VarE = oicVarA != null ? oicVarA.e() : null;
            oic oicVarG = vn7.G(oicVarA);
            try {
                aq6 aq6Var = this.a;
                aq6Var.q = true;
                if (z) {
                    while (!l69Var.c()) {
                        try {
                            l69Var.e(new rd6());
                        } catch (Throwable th) {
                            throw th;
                        }
                    }
                }
                l69Var.a();
                gq6Var.f = null;
                aq6Var.q = false;
            } finally {
                vn7.T(oicVarA, oicVarG, x45VarE);
            }
        }
    }

    public final ivc e(Object obj) {
        return !this.a.H() ? new lq6() : new mq6(this, obj);
    }

    public final void f(int i) {
        boolean z;
        boolean z2 = false;
        this.n = 0;
        List listO = this.a.o();
        v68 v68Var = (v68) listO;
        int i2 = (((o78) v68Var.b).c - this.o) - 1;
        if (i <= i2) {
            this.k.clear();
            if (i <= i2) {
                int i3 = i;
                while (true) {
                    Object objG = this.f.g((aq6) v68Var.get(i3));
                    objG.getClass();
                    ((y68) this.k.b).a(((gq6) objG).a);
                    if (i3 == i2) {
                        break;
                    } else {
                        i3++;
                    }
                }
            }
            this.c.c(this.k);
            oic oicVarA = vn7.A();
            x45 x45VarE = oicVarA != null ? oicVarA.e() : null;
            oic oicVarG = vn7.G(oicVarA);
            z = false;
            while (i2 >= i) {
                try {
                    aq6 aq6Var = (aq6) ((v68) listO).get(i2);
                    Object objG2 = this.f.g(aq6Var);
                    objG2.getClass();
                    gq6 gq6Var = (gq6) objG2;
                    Object obj = gq6Var.a;
                    if (((y68) this.k.b).c(obj)) {
                        this.n++;
                        if (((Boolean) gq6Var.g.getValue()).booleanValue()) {
                            eq6 eq6Var = aq6Var.G;
                            yk7 yk7Var = eq6Var.p;
                            yp6 yp6Var = yp6.NotUsed;
                            yk7Var.l = yp6Var;
                            mb7 mb7Var = eq6Var.q;
                            if (mb7Var != null) {
                                mb7Var.j = yp6Var;
                            }
                            l(gq6Var, false);
                            if (gq6Var.h) {
                                z = true;
                            }
                        }
                    } else {
                        aq6 aq6Var2 = this.a;
                        aq6Var2.q = true;
                        this.f.k(aq6Var);
                        q22 q22Var = gq6Var.c;
                        if (q22Var != null) {
                            q22Var.m();
                        }
                        this.a.Q(i2, 1);
                        aq6Var2.q = false;
                    }
                    this.g.k(obj);
                    i2--;
                } catch (Throwable th) {
                    vn7.T(oicVarA, oicVarG, x45VarE);
                    throw th;
                }
            }
            vn7.T(oicVarA, oicVarG, x45VarE);
        } else {
            z = false;
        }
        if (z) {
            synchronized (uic.c) {
                g78 g78Var = uic.j.h;
                if (g78Var != null) {
                    if (g78Var.h()) {
                        z2 = true;
                    }
                }
            }
            if (z2) {
                uic.c();
            }
        }
        h();
    }

    public final void g(Object obj) {
        h();
        aq6 aq6Var = (aq6) this.j.k(obj);
        aq6 aq6Var2 = this.a;
        if (aq6Var != null) {
            if (this.o <= 0) {
                b26.b("No pre-composed items to dispose");
            }
            int iK = ((o78) ((v68) aq6Var2.o()).b).k(aq6Var);
            if (iK < ((o78) ((v68) aq6Var2.o()).b).c - this.o) {
                b26.b("Item is not in pre-composed item range");
            }
            this.n++;
            this.o--;
            gq6 gq6Var = (gq6) this.f.g(aq6Var);
            if (gq6Var != null) {
                d(gq6Var);
            }
            int i = (((o78) ((v68) aq6Var2.o()).b).c - this.o) - this.n;
            j(iK, i);
            f(i);
        }
        if (this.m.j(obj)) {
            aq6.V(aq6Var2, true, 6);
        }
    }

    public final void h() {
        int i = ((o78) ((v68) this.a.o()).b).c;
        f78 f78Var = this.f;
        if (f78Var.e != i) {
            b26.a("Inconsistency between the count of nodes tracked by the state (" + f78Var.e + ") and the children count on the SubcomposeLayout (" + i + "). Are you trying to use the state of the disposed SubcomposeLayout?");
        }
        if ((i - this.n) - this.o < 0) {
            StringBuilder sbC = ev6.C("Incorrect state. Total children ", i, ". Reusable children ");
            sbC.append(this.n);
            sbC.append(". Precomposed children ");
            sbC.append(this.o);
            b26.a(sbC.toString());
        }
        f78 f78Var2 = this.j;
        if (f78Var2.e == this.o) {
            return;
        }
        b26.a("Incorrect state. Precomposed children " + this.o + ". Map size " + f78Var2.e);
    }

    public final void i(boolean z) {
        this.o = 0;
        this.j.a();
        List listO = this.a.o();
        int i = ((o78) ((v68) listO).b).c;
        if (this.n != i) {
            this.n = i;
            oic oicVarA = vn7.A();
            x45 x45VarE = oicVarA != null ? oicVarA.e() : null;
            oic oicVarG = vn7.G(oicVarA);
            for (int i2 = 0; i2 < i; i2++) {
                try {
                    aq6 aq6Var = (aq6) ((v68) listO).get(i2);
                    gq6 gq6Var = (gq6) this.f.g(aq6Var);
                    if (gq6Var != null && ((Boolean) gq6Var.g.getValue()).booleanValue()) {
                        eq6 eq6Var = aq6Var.G;
                        yk7 yk7Var = eq6Var.p;
                        yp6 yp6Var = yp6.NotUsed;
                        yk7Var.l = yp6Var;
                        mb7 mb7Var = eq6Var.q;
                        if (mb7Var != null) {
                            mb7Var.j = yp6Var;
                        }
                        l(gq6Var, z);
                        gq6Var.a = f76.l;
                    }
                } catch (Throwable th) {
                    vn7.T(oicVarA, oicVarG, x45VarE);
                    throw th;
                }
            }
            vn7.T(oicVarA, oicVarG, x45VarE);
            this.g.a();
        }
        h();
    }

    public final void j(int i, int i2) {
        aq6 aq6Var = this.a;
        aq6Var.q = true;
        aq6Var.L(i, i2, 1);
        aq6Var.q = false;
    }

    public final void k(Object obj, b55 b55Var, boolean z) {
        aq6 aq6Var = this.a;
        if (aq6Var.H()) {
            h();
            if (this.g.c(obj)) {
                return;
            }
            this.l.k(obj);
            f78 f78Var = this.j;
            Object objG = f78Var.g(obj);
            if (objG == null) {
                objG = n(obj);
                if (objG != null) {
                    j(((o78) ((v68) aq6Var.o()).b).k(objG), ((o78) ((v68) aq6Var.o()).b).c);
                    this.o++;
                } else {
                    int i = ((o78) ((v68) aq6Var.o()).b).c;
                    aq6 aq6Var2 = new aq6(2);
                    aq6Var.q = true;
                    aq6Var.B(i, aq6Var2);
                    aq6Var.q = false;
                    this.o++;
                    objG = aq6Var2;
                }
                f78Var.m(obj, objG);
            }
            m((aq6) objG, obj, z, b55Var);
        }
    }

    public final void l(gq6 gq6Var, boolean z) {
        q22 q22Var;
        if (z || !gq6Var.h) {
            gq6Var.g = qo7.u(Boolean.FALSE);
        } else {
            gq6Var.g.setValue(Boolean.FALSE);
        }
        if (gq6Var.f != null) {
            d(gq6Var);
            return;
        }
        if (z) {
            q22 q22Var2 = gq6Var.c;
            if (q22Var2 != null) {
                q22Var2.l();
                return;
            }
            return;
        }
        kw8 outOfFrameExecutor = ((mn) dq6.a(this.a)).getOutOfFrameExecutor();
        if (outOfFrameExecutor == null) {
            if (gq6Var.h || (q22Var = gq6Var.c) == null) {
                return;
            }
            q22Var.l();
            return;
        }
        ir irVar = new ir(20, gq6Var);
        mn mnVar = (mn) outOfFrameExecutor;
        m70 m70Var = mnVar.i;
        boolean zIsEmpty = m70Var.isEmpty();
        m70Var.addLast(irVar);
        if (zIsEmpty) {
            Handler handler = mnVar.getHandler();
            if (handler != null) {
                handler.postAtFrontOfQueue(mnVar.j);
            } else {
                ay0.e("schedule is called when outOfFrameExecutor is not available (view is detached)");
            }
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:56:0x0092 A[Catch: all -> 0x008d, TryCatch #0 {all -> 0x008d, blocks: (B:44:0x0076, B:47:0x0082, B:59:0x00ad, B:61:0x00bf, B:64:0x00d4, B:66:0x00d8, B:72:0x010c, B:67:0x00e5, B:68:0x00f0, B:70:0x00f4, B:71:0x0109, B:62:0x00c2, B:56:0x0092, B:58:0x00a0, B:75:0x0116, B:76:0x0120), top: B:79:0x0076 }] */
    /* JADX WARN: Removed duplicated region for block: B:58:0x00a0 A[Catch: all -> 0x008d, TryCatch #0 {all -> 0x008d, blocks: (B:44:0x0076, B:47:0x0082, B:59:0x00ad, B:61:0x00bf, B:64:0x00d4, B:66:0x00d8, B:72:0x010c, B:67:0x00e5, B:68:0x00f0, B:70:0x00f4, B:71:0x0109, B:62:0x00c2, B:56:0x0092, B:58:0x00a0, B:75:0x0116, B:76:0x0120), top: B:79:0x0076 }] */
    /* JADX WARN: Type inference fix 'apply assigned field type' failed
    java.lang.UnsupportedOperationException: ArgType.getObject(), call class: class jadx.core.dex.instructions.args.ArgType$UnknownArg
    	at jadx.core.dex.instructions.args.ArgType.getObject(ArgType.java:593)
    	at jadx.core.dex.attributes.nodes.ClassTypeVarsAttr.getTypeVarsMapFor(ClassTypeVarsAttr.java:35)
    	at jadx.core.dex.nodes.utils.TypeUtils.replaceClassGenerics(TypeUtils.java:177)
    	at jadx.core.dex.visitors.typeinference.FixTypesVisitor.insertExplicitUseCast(FixTypesVisitor.java:397)
    	at jadx.core.dex.visitors.typeinference.FixTypesVisitor.tryFieldTypeWithNewCasts(FixTypesVisitor.java:359)
    	at jadx.core.dex.visitors.typeinference.FixTypesVisitor.applyFieldType(FixTypesVisitor.java:309)
    	at jadx.core.dex.visitors.typeinference.FixTypesVisitor.visit(FixTypesVisitor.java:94)
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void m(defpackage.aq6 r10, java.lang.Object r11, boolean r12, defpackage.b55 r13) {
        /*
            Method dump skipped, instruction units count: 293
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.nq6.m(aq6, java.lang.Object, boolean, b55):void");
    }

    public final aq6 n(Object obj) {
        f78 f78Var;
        int i;
        if (this.n == 0) {
            return null;
        }
        v68 v68Var = (v68) this.a.o();
        int i2 = ((o78) v68Var.b).c - this.o;
        int i3 = i2 - this.n;
        int i4 = i2 - 1;
        int i5 = i4;
        while (true) {
            f78Var = this.f;
            if (i5 < i3) {
                i = -1;
                break;
            }
            Object objG = f78Var.g((aq6) v68Var.get(i5));
            objG.getClass();
            if (g76.L(((gq6) objG).a, obj)) {
                i = i5;
                break;
            }
            i5--;
        }
        if (i == -1) {
            while (i4 >= i3) {
                Object objG2 = f78Var.g((aq6) v68Var.get(i4));
                objG2.getClass();
                gq6 gq6Var = (gq6) objG2;
                Object obj2 = gq6Var.a;
                if (obj2 == f76.l || this.c.i(obj, obj2)) {
                    gq6Var.a = obj;
                    i5 = i4;
                    i = i5;
                    break;
                }
                i4--;
            }
            i5 = i4;
        }
        if (i == -1) {
            return null;
        }
        if (i5 != i3) {
            j(i5, i3);
        }
        this.n--;
        aq6 aq6Var = (aq6) v68Var.get(i3);
        Object objG3 = f78Var.g(aq6Var);
        objG3.getClass();
        gq6 gq6Var2 = (gq6) objG3;
        gq6Var2.g = qo7.u(Boolean.TRUE);
        gq6Var2.e = true;
        gq6Var2.d = true;
        return aq6Var;
    }
}
