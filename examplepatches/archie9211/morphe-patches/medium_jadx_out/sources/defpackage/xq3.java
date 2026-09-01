package defpackage;

import com.medium.android.common.api.Medium2Error;
import com.medium.android.common.post.body.EditPostBodyView;
import com.medium.android.donkey.write.EditPostSaveError;
import gen.model.SourceParameter;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class xq3 implements lre {
    public int a;
    public final Object b;
    public Object c;
    public final Object d;
    public Serializable e;
    public Serializable f;
    public Object g;
    public Object h;
    public Object i;
    public Object j;
    public Serializable k;
    public Object l;
    public Object m;

    public xq3(cw3 cw3Var, ak3 ak3Var, ty2 ty2Var, String str, String str2, SourceParameter sourceParameter) {
        cw3Var.getClass();
        ty2Var.getClass();
        str.getClass();
        str2.getClass();
        sourceParameter.getClass();
        this.b = cw3Var;
        this.c = ak3Var;
        this.d = ty2Var;
        this.e = str;
        this.f = str2;
        this.g = sourceParameter;
        this.h = new nvg(ak3Var.f);
        this.i = xsa.c;
        this.m = jr3.a;
    }

    public static EditPostSaveError o(Throwable th) {
        int i;
        a14 code = null;
        if (th instanceof Medium2Error) {
            Medium2Error medium2Error = (Medium2Error) th;
            i = medium2Error.a;
            l14 l14Var = medium2Error.c;
            if (l14Var != null) {
                code = l14Var.getCode();
            }
        } else {
            i = 500;
        }
        if (i == 401) {
            return new EditPostSaveError(yq3.LOGGED_OUT, th);
        }
        if (i != 403) {
            return i != 422 ? i != 429 ? i != 409 ? i != 410 ? new EditPostSaveError(yq3.UNKNOWN, th) : new EditPostSaveError(yq3.POST_DELETED, th) : new EditPostSaveError(yq3.MERGE, th) : new EditPostSaveError(yq3.PUBLISH_RATE_LIMIT, th) : new EditPostSaveError(yq3.MAX_SIZE_EXCEEDED, th);
        }
        int i2 = code == null ? -1 : qq3.a[code.ordinal()];
        return i2 != 1 ? i2 != 2 ? new EditPostSaveError(yq3.UNKNOWN, th) : new EditPostSaveError(yq3.USER_SUSPENDED, th) : new EditPostSaveError(yq3.UNVERIFIED_EMAIL, th);
    }

    public void a() {
        if (((bjb) this.k) != null) {
            km4.I(wld.a, null, "Save - Canceling pending save", new Object[0], "Save - Canceling pending save");
            this.k = null;
            this.j = null;
            l(hr3.a);
        }
    }

    @Override // defpackage.jre
    public boolean b() {
        return false;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public java.lang.Object c(defpackage.p92 r9) {
        /*
            r8 = this;
            boolean r0 = r9 instanceof defpackage.rq3
            if (r0 == 0) goto L13
            r0 = r9
            rq3 r0 = (defpackage.rq3) r0
            int r1 = r0.d
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.d = r1
            goto L18
        L13:
            rq3 r0 = new rq3
            r0.<init>(r8, r9)
        L18:
            java.lang.Object r9 = r0.b
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.d
            r3 = 3
            r4 = 2
            r5 = 1
            r6 = 0
            if (r2 == 0) goto L38
            if (r2 == r5) goto L2a
            if (r2 == r4) goto L2a
            if (r2 != r3) goto L32
        L2a:
            defpackage.br7.v(r9)
            bjb r9 = (defpackage.bjb) r9
            java.lang.Object r8 = r9.a
            return r8
        L32:
            java.lang.String r8 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r8)
            return r6
        L38:
            defpackage.br7.v(r9)
            uld r9 = defpackage.wld.a
            r2 = 0
            java.lang.Object[] r2 = new java.lang.Object[r2]
            java.lang.String r7 = "Save - Creating post"
            defpackage.km4.I(r9, r6, r7, r2, r7)
            java.lang.Object r9 = r8.c
            ak3 r9 = (defpackage.ak3) r9
            java.lang.String r2 = r9.d
            if (r2 != 0) goto L77
            gen.model.Quote r2 = r9.c
            if (r2 == 0) goto L5b
            r0.d = r5
            java.lang.Object r8 = r8.d(r2, r0)
            if (r8 != r1) goto L5a
            goto L75
        L5a:
            return r8
        L5b:
            java.lang.String r9 = r9.b
            java.lang.Object r8 = r8.b
            cw3 r8 = (defpackage.cw3) r8
            if (r9 == 0) goto L6d
            r0.d = r4
            java.lang.Object r8 = r8.e(r9, r0)
            if (r8 != r1) goto L6c
            goto L75
        L6c:
            return r8
        L6d:
            r0.d = r3
            java.lang.Object r8 = r8.d(r0)
            if (r8 != r1) goto L76
        L75:
            return r1
        L76:
            return r8
        L77:
            java.lang.String r8 = "Failed requirement."
            defpackage.ay0.e(r8)
            return r6
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.xq3.c(p92):java.lang.Object");
    }

    /* JADX WARN: Code restructure failed: missing block: B:25:0x007b, code lost:
    
        if (r7 == r9) goto L43;
     */
    /* JADX WARN: Removed duplicated region for block: B:41:0x00c7  */
    /* JADX WARN: Removed duplicated region for block: B:45:0x00d3  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0017  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public java.lang.Object d(gen.model.Quote r8, defpackage.p92 r9) {
        /*
            Method dump skipped, instruction units count: 217
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.xq3.d(gen.model.Quote, p92):java.lang.Object");
    }

    public int e(int i) {
        int i2;
        j68 j68Var = (j68) this.b;
        int i3 = j68Var.b;
        int i4 = 0;
        if (i3 <= 0) {
            z10.i("");
            return 0;
        }
        int i5 = i3 - 1;
        while (true) {
            if (i4 <= i5) {
                i2 = (i4 + i5) >>> 1;
                int i6 = j68Var.a[i2];
                if (i6 >= i) {
                    if (i6 <= i) {
                        break;
                    }
                    i5 = i2 - 1;
                } else {
                    i4 = i2 + 1;
                }
            } else {
                i2 = -(i4 + 1);
                break;
            }
        }
        return i2 < -1 ? -(i2 + 2) : i2;
    }

    public float f(int i, int i2, boolean z) {
        yn3 yn3Var;
        float f;
        j68 j68Var = (j68) this.b;
        if (i >= j68Var.b - 1) {
            f = i2;
        } else {
            int iC = j68Var.c(i);
            int iC2 = j68Var.c(i + 1);
            if (i2 != iC) {
                int i3 = iC2 - iC;
                ore oreVar = (ore) ((k68) this.c).b(iC);
                if (oreVar == null || (yn3Var = oreVar.b) == null) {
                    yn3Var = (yn3) this.d;
                }
                float f2 = i3;
                float fA = yn3Var.a((i2 - iC) / f2);
                return z ? fA : ((f2 * fA) + iC) / 1000.0f;
            }
            f = iC;
        }
        return f / 1000.0f;
    }

    /* JADX WARN: Type inference failed for: r13v5, types: [float[], java.io.Serializable] */
    /* JADX WARN: Type inference failed for: r3v5, types: [float[], java.io.Serializable] */
    /* JADX WARN: Type inference failed for: r3v6, types: [int[], java.io.Serializable] */
    public void g(dx dxVar, dx dxVar2, dx dxVar3) {
        float[] fArr;
        k68 k68Var = (k68) this.c;
        j68 j68Var = (j68) this.b;
        boolean z = ((zm7) this.m) != kre.c;
        if (((dx) this.g) == null) {
            this.g = dxVar.c();
            this.h = dxVar3.c();
            int i = j68Var.b;
            ?? r3 = new float[i];
            for (int i2 = 0; i2 < i; i2++) {
                r3[i2] = j68Var.c(i2) / 1000.0f;
            }
            this.f = r3;
            int i3 = j68Var.b;
            ?? r32 = new int[i3];
            for (int i4 = 0; i4 < i3; i4++) {
                r32[i4] = 0;
            }
            this.e = r32;
        }
        if (z) {
            if (((zm7) this.m) != kre.c && g76.L((dx) this.i, dxVar) && g76.L((dx) this.j, dxVar2)) {
                return;
            }
            this.i = dxVar;
            this.j = dxVar2;
            int iB = dxVar.b() + (dxVar.b() % 2);
            this.k = new float[iB];
            this.l = new float[iB];
            int i5 = j68Var.b;
            float[][] fArr2 = new float[i5][];
            for (int i6 = 0; i6 < i5; i6++) {
                int iC = j68Var.c(i6);
                ore oreVar = (ore) k68Var.b(iC);
                if (iC == 0 && oreVar == null) {
                    fArr = new float[iB];
                    for (int i7 = 0; i7 < iB; i7++) {
                        fArr[i7] = dxVar.a(i7);
                    }
                } else if (iC == this.a && oreVar == null) {
                    fArr = new float[iB];
                    for (int i8 = 0; i8 < iB; i8++) {
                        fArr[i8] = dxVar2.a(i8);
                    }
                } else {
                    oreVar.getClass();
                    dx dxVar4 = oreVar.a;
                    float[] fArr3 = new float[iB];
                    for (int i9 = 0; i9 < iB; i9++) {
                        fArr3[i9] = dxVar4.a(i9);
                    }
                    fArr = fArr3;
                }
                fArr2[i6] = fArr;
            }
            this.m = new zm7((int[]) this.e, (float[]) this.f, fArr2);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public java.lang.Object h(defpackage.mq3 r14, defpackage.p92 r15) {
        /*
            r13 = this;
            boolean r0 = r15 instanceof defpackage.tq3
            if (r0 == 0) goto L13
            r0 = r15
            tq3 r0 = (defpackage.tq3) r0
            int r1 = r0.d
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.d = r1
            goto L18
        L13:
            tq3 r0 = new tq3
            r0.<init>(r13, r15)
        L18:
            java.lang.Object r15 = r0.b
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.d
            r3 = 1
            r4 = 0
            if (r2 == 0) goto L32
            if (r2 != r3) goto L2c
            defpackage.br7.v(r15)
            bjb r15 = (defpackage.bjb) r15
            java.lang.Object r13 = r15.a
            return r13
        L2c:
            java.lang.String r13 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r13)
            return r4
        L32:
            defpackage.br7.v(r15)
            uld r15 = defpackage.wld.a
            r2 = 0
            java.lang.Object[] r2 = new java.lang.Object[r2]
            java.lang.String r5 = "Save - Created"
            defpackage.km4.I(r15, r4, r5, r2, r5)
            java.lang.Object r15 = r13.i
            pq3 r15 = (defpackage.pq3) r15
            gen.model.Post r2 = r14.getPost()
            java.lang.String r2 = r2.id
            if (r2 == 0) goto L74
            r15.L(r2)
            java.lang.Object r15 = r13.c
            r5 = r15
            ak3 r5 = (defpackage.ak3) r5
            gen.model.Post r14 = r14.getPost()
            java.lang.String r7 = r14.id
            r11 = 0
            r12 = 486(0x1e6, float:6.81E-43)
            r6 = 0
            r8 = -1
            r9 = 0
            r10 = 0
            ak3 r14 = defpackage.ak3.a(r5, r6, r7, r8, r9, r10, r11, r12)
            r13.c = r14
            r13.j = r4
            r13.k = r4
            r0.d = r3
            java.lang.Object r13 = r13.i(r0)
            if (r13 != r1) goto L73
            return r1
        L73:
            return r13
        L74:
            java.lang.String r13 = "Required value was null."
            defpackage.ay0.e(r13)
            return r4
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.xq3.h(mq3, p92):java.lang.Object");
    }

    /* JADX WARN: Code restructure failed: missing block: B:156:0x04a4, code lost:
    
        if (r1 == r5) goto L169;
     */
    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:155:0x0497  */
    /* JADX WARN: Removed duplicated region for block: B:163:0x04bb  */
    /* JADX WARN: Removed duplicated region for block: B:173:0x04e9  */
    /* JADX WARN: Removed duplicated region for block: B:193:0x0588  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x001f  */
    /* JADX WARN: Type inference failed for: r15v2 */
    /* JADX WARN: Type inference failed for: r15v3, types: [java.util.List] */
    /* JADX WARN: Type inference failed for: r15v9, types: [java.util.ArrayList] */
    /* JADX WARN: Type inference failed for: r31v0, types: [xq3] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public java.lang.Object i(defpackage.p92 r32) {
        /*
            Method dump skipped, instruction units count: 1532
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.xq3.i(p92):java.lang.Object");
    }

    @Override // defpackage.jre
    public dx j(long j, dx dxVar, dx dxVar2, dx dxVar3) {
        long j2 = j / 1000000;
        int[] iArr = kre.a;
        long j3 = this.a;
        if (j2 < 0) {
            j2 = 0;
        }
        long j4 = j2 > j3 ? j3 : j2;
        if (j4 < 0) {
            return dxVar3;
        }
        g(dxVar, dxVar2, dxVar3);
        dx dxVar4 = (dx) this.h;
        dxVar4.getClass();
        int i = 0;
        if (((zm7) this.m) != kre.c) {
            int i2 = (int) j4;
            float f = f(e(i2), i2, false);
            float[] fArr = (float[]) this.l;
            a70[][] a70VarArr = (a70[][]) ((zm7) this.m).b;
            float f2 = a70VarArr[0][0].a;
            float f3 = a70VarArr[a70VarArr.length - 1][0].b;
            if (f < f2) {
                f = f2;
            }
            if (f <= f3) {
                f3 = f;
            }
            int length = fArr.length;
            boolean z = false;
            for (a70[] a70VarArr2 : a70VarArr) {
                int i3 = 0;
                int i4 = 0;
                while (i3 < length - 1) {
                    a70 a70Var = a70VarArr2[i4];
                    if (f3 <= a70Var.b) {
                        if (a70Var.p) {
                            fArr[i3] = a70Var.q;
                            fArr[i3 + 1] = a70Var.r;
                        } else {
                            a70Var.c(f3);
                            fArr[i3] = a70Var.a();
                            fArr[i3 + 1] = a70Var.b();
                        }
                        z = true;
                    }
                    i3 += 2;
                    i4++;
                }
                if (z) {
                    break;
                }
            }
            int length2 = fArr.length;
            while (i < length2) {
                dxVar4.e(i, fArr[i]);
                i++;
            }
        } else {
            dx dxVarR = r((j4 - 1) * 1000000, dxVar, dxVar2, dxVar3);
            dx dxVarR2 = r(j4 * 1000000, dxVar, dxVar2, dxVar3);
            int iB = dxVarR.b();
            while (i < iB) {
                dxVar4.e(i, (dxVarR.a(i) - dxVarR2.a(i)) * 1000.0f);
                i++;
            }
        }
        return dxVar4;
    }

    /* JADX WARN: Code restructure failed: missing block: B:46:0x0134, code lost:
    
        if (r1 == r4) goto L47;
     */
    /* JADX WARN: Removed duplicated region for block: B:36:0x00ce A[Catch: all -> 0x015d, TryCatch #0 {all -> 0x015d, blocks: (B:13:0x0034, B:48:0x0137, B:50:0x013d, B:52:0x0148, B:53:0x014c, B:17:0x0043, B:34:0x00c8, B:36:0x00ce, B:38:0x00d9, B:39:0x00dd, B:25:0x0065, B:27:0x0070, B:29:0x0095, B:31:0x00a4, B:40:0x00de, B:42:0x00e2, B:44:0x0107, B:45:0x0111, B:54:0x014d, B:56:0x0151, B:59:0x0156, B:60:0x015b), top: B:65:0x002c }] */
    /* JADX WARN: Removed duplicated region for block: B:38:0x00d9 A[Catch: all -> 0x015d, TryCatch #0 {all -> 0x015d, blocks: (B:13:0x0034, B:48:0x0137, B:50:0x013d, B:52:0x0148, B:53:0x014c, B:17:0x0043, B:34:0x00c8, B:36:0x00ce, B:38:0x00d9, B:39:0x00dd, B:25:0x0065, B:27:0x0070, B:29:0x0095, B:31:0x00a4, B:40:0x00de, B:42:0x00e2, B:44:0x0107, B:45:0x0111, B:54:0x014d, B:56:0x0151, B:59:0x0156, B:60:0x015b), top: B:65:0x002c }] */
    /* JADX WARN: Removed duplicated region for block: B:7:0x001b  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public java.lang.Object k(defpackage.p92 r26) {
        /*
            Method dump skipped, instruction units count: 356
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.xq3.k(p92):java.lang.Object");
    }

    public void l(or3 or3Var) {
        or3 or3Var2 = (or3) this.m;
        ir3 ir3Var = or3Var2 instanceof ir3 ? (ir3) or3Var2 : null;
        if ((ir3Var == null || !ir3Var.a.a.isPermanent()) && !or3Var.equals((or3) this.m)) {
            String str = "Save - new state: " + or3Var;
            km4.I(wld.a, null, str, new Object[0], str);
            this.m = or3Var;
            ((pq3) this.i).k(or3Var);
        }
    }

    @Override // defpackage.lre
    public int m() {
        return 0;
    }

    public void n(d73 d73Var) {
        EditPostBodyView editPostBodyView = (EditPostBodyView) this.l;
        if (editPostBodyView == null) {
            return;
        }
        d73Var.getClass();
        int iC = editPostBodyView.a.c();
        for (int i = 0; i < iC; i++) {
            editPostBodyView.m(i, d73Var);
        }
        b1 b1Var = (b1) bu1.I0((ArrayList) editPostBodyView.n.c);
        if (b1Var != null) {
            b1Var.d = true;
        }
        List listB = editPostBodyView.n.b(this.a);
        ArrayList arrayList = new ArrayList();
        for (Object obj : listB) {
            if (!(((z63) obj) instanceof w63)) {
                arrayList.add(obj);
            }
        }
        Iterator it2 = arrayList.iterator();
        while (it2.hasNext()) {
            ((nvg) this.h).a((z63) it2.next(), d73.COMMAND);
        }
        this.a = listB.size() + this.a;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0019  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public java.lang.Object p(defpackage.ar3 r58, defpackage.p92 r59) {
        /*
            Method dump skipped, instruction units count: 285
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.xq3.p(ar3, p92):java.lang.Object");
    }

    @Override // defpackage.lre
    public int q() {
        return this.a;
    }

    @Override // defpackage.jre
    public dx r(long j, dx dxVar, dx dxVar2, dx dxVar3) {
        dx dxVar4;
        dx dxVar5;
        a70[][] a70VarArr;
        dx dxVar6 = dxVar;
        dx dxVar7 = dxVar2;
        j68 j68Var = (j68) this.b;
        long j2 = j / 1000000;
        int[] iArr = kre.a;
        int i = this.a;
        long j3 = i;
        if (j2 < 0) {
            j2 = 0;
        }
        if (j2 <= j3) {
            j3 = j2;
        }
        int i2 = (int) j3;
        k68 k68Var = (k68) this.c;
        ore oreVar = (ore) k68Var.b(i2);
        if (oreVar != null) {
            return oreVar.a;
        }
        if (i2 >= i) {
            return dxVar7;
        }
        if (i2 <= 0) {
            return dxVar6;
        }
        g(dxVar6, dxVar7, dxVar3);
        dx dxVar8 = (dx) this.g;
        dxVar8.getClass();
        int i3 = 0;
        if (((zm7) this.m) != kre.c) {
            float f = f(e(i2), i2, false);
            float[] fArr = (float[]) this.k;
            a70[][] a70VarArr2 = (a70[][]) ((zm7) this.m).b;
            int length = a70VarArr2.length - 1;
            float f2 = a70VarArr2[0][0].a;
            float f3 = a70VarArr2[length][0].b;
            int length2 = fArr.length;
            if (f < f2 || f > f3) {
                if (f > f3) {
                    f2 = f3;
                } else {
                    length = 0;
                }
                float f4 = f - f2;
                int i4 = 0;
                int i5 = 0;
                while (i4 < length2 - 1) {
                    a70 a70Var = a70VarArr2[length][i5];
                    boolean z = a70Var.p;
                    float f5 = a70Var.r;
                    float f6 = a70Var.q;
                    if (z) {
                        float f7 = a70Var.a;
                        float f8 = a70Var.k;
                        float f9 = a70Var.c;
                        a70VarArr = a70VarArr2;
                        fArr[i4] = (f6 * f4) + lv8.e(a70Var.e, f9, (f2 - f7) * f8, f9);
                        float f10 = (f2 - f7) * f8;
                        float f11 = a70Var.d;
                        fArr[i4 + 1] = (f5 * f4) + lv8.e(a70Var.f, f11, f10, f11);
                    } else {
                        a70VarArr = a70VarArr2;
                        a70Var.c(f2);
                        fArr[i4] = (a70Var.a() * f4) + (a70Var.n * a70Var.h) + f6;
                        fArr[i4 + 1] = (a70Var.b() * f4) + (a70Var.o * a70Var.i) + f5;
                    }
                    i4 += 2;
                    i5++;
                    a70VarArr2 = a70VarArr;
                }
            } else {
                int length3 = a70VarArr2.length;
                int i6 = 0;
                boolean z2 = false;
                while (i6 < length3) {
                    int i7 = i3;
                    int i8 = i7;
                    while (i7 < length2 - 1) {
                        a70 a70Var2 = a70VarArr2[i6][i8];
                        if (f <= a70Var2.b) {
                            if (a70Var2.p) {
                                float f12 = a70Var2.a;
                                float f13 = a70Var2.k;
                                float f14 = a70Var2.c;
                                fArr[i7] = lv8.e(a70Var2.e, f14, (f - f12) * f13, f14);
                                float f15 = a70Var2.d;
                                fArr[i7 + 1] = lv8.e(a70Var2.f, f15, (f - f12) * f13, f15);
                            } else {
                                a70Var2.c(f);
                                fArr[i7] = (a70Var2.n * a70Var2.h) + a70Var2.q;
                                fArr[i7 + 1] = (a70Var2.o * a70Var2.i) + a70Var2.r;
                            }
                            z2 = true;
                        }
                        i7 += 2;
                        i8++;
                    }
                    if (z2) {
                        break;
                    }
                    i6++;
                    i3 = 0;
                }
            }
            int length4 = fArr.length;
            for (int i9 = 0; i9 < length4; i9++) {
                dxVar8.e(i9, fArr[i9]);
            }
        } else {
            int iE = e(i2);
            float f16 = f(iE, i2, true);
            ore oreVar2 = (ore) k68Var.b(j68Var.c(iE));
            if (oreVar2 != null && (dxVar5 = oreVar2.a) != null) {
                dxVar6 = dxVar5;
            }
            ore oreVar3 = (ore) k68Var.b(j68Var.c(iE + 1));
            if (oreVar3 != null && (dxVar4 = oreVar3.a) != null) {
                dxVar7 = dxVar4;
            }
            int iB = dxVar8.b();
            for (int i10 = 0; i10 < iB; i10++) {
                dxVar8.e(i10, (dxVar7.a(i10) * f16) + ((1.0f - f16) * dxVar6.a(i10)));
            }
        }
        return dxVar8;
    }

    @Override // defpackage.jre
    public dx s(dx dxVar, dx dxVar2, dx dxVar3) {
        return j(t(dxVar, dxVar2, dxVar3), dxVar, dxVar2, dxVar3);
    }

    @Override // defpackage.jre
    public long t(dx dxVar, dx dxVar2, dx dxVar3) {
        return ((long) q()) * 1000000;
    }

    /* JADX WARN: Type inference failed for: r1v1, types: [int[], java.io.Serializable] */
    /* JADX WARN: Type inference failed for: r1v2, types: [float[], java.io.Serializable, java.lang.Object] */
    public xq3(j68 j68Var, k68 k68Var, int i, yn3 yn3Var) {
        this.b = j68Var;
        this.c = k68Var;
        this.a = i;
        this.d = yn3Var;
        this.e = kre.a;
        ?? r1 = kre.b;
        this.f = r1;
        this.k = r1;
        this.l = r1;
        this.m = kre.c;
    }
}
