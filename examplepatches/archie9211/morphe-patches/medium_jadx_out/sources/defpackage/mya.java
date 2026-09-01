package defpackage;

import android.content.Context;
import android.graphics.Rect;
import android.view.View;
import android.view.WindowInsetsAnimation;
import com.facebook.FacebookException;
import com.medium.android.core.models.EntityType;
import com.medium.android.graphql.UserIsFollowingQuery;
import com.medium.android.settings.main.SettingsFragment;
import java.lang.ref.Reference;
import java.lang.ref.ReferenceQueue;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.concurrent.ExecutorService;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class mya implements kpb, w84, ye1, yp8, v0d, khf {
    public final /* synthetic */ int a;
    public Object b;
    public Object c;

    public mya(int i) {
        this.a = i;
        switch (i) {
            case 25:
                this.b = new o78(new Reference[16]);
                this.c = new ReferenceQueue();
                break;
            default:
                p0d p0dVar = new p0d(1, null);
                l9f l9fVar = l9f.Text;
                l9fVar.getClass();
                this.b = p0dVar;
                this.c = l9fVar;
                break;
        }
    }

    public static to4 w(mya myaVar, yd4 yd4Var, int i) {
        boolean z = (i & 1) != 0;
        if ((i & 2) != 0) {
            yd4Var = yd4.NetworkOnly;
        }
        myaVar.getClass();
        yd4Var.getClass();
        return new to4(new j13(z, myaVar, yd4Var, null), new zz((vpc) ((zk2) myaVar.b).f.getValue(), 18));
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x001b  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public java.lang.Object A(defpackage.p92 r17, java.lang.String r18, java.lang.String r19, java.lang.String r20, java.lang.String r21, boolean r22) {
        /*
            Method dump skipped, instruction units count: 221
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.mya.A(p92, java.lang.String, java.lang.String, java.lang.String, java.lang.String, boolean):java.lang.Object");
    }

    /* JADX WARN: Removed duplicated region for block: B:8:0x001e  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public java.lang.Object B(java.lang.String r26, java.lang.String r27, com.medium.android.data.post.model.ReportRepostReason r28, boolean r29, defpackage.g08 r30, defpackage.p92 r31) {
        /*
            Method dump skipped, instruction units count: 257
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.mya.B(java.lang.String, java.lang.String, com.medium.android.data.post.model.ReportRepostReason, boolean, g08, p92):java.lang.Object");
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0019  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public java.lang.Object C(java.lang.String r23, java.lang.String r24, gen.model.SourceParameter r25, java.lang.String r26, boolean r27, defpackage.p92 r28) {
        /*
            Method dump skipped, instruction units count: 209
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.mya.C(java.lang.String, java.lang.String, gen.model.SourceParameter, java.lang.String, boolean, p92):java.lang.Object");
    }

    @Override // defpackage.ye1
    public void D(int i, String str) {
        str.getClass();
        ide ideVar = (ide) this.b;
        vx0.c0(f76.F(ideVar), null, null, new wm4(ideVar, str, i, (n92) null, 4), 3);
    }

    public boolean E(View view) {
        fte fteVar = (fte) this.c;
        gte gteVar = (gte) this.b;
        int iH = gteVar.h();
        int iQ = gteVar.q();
        int iF = gteVar.f(view);
        int iW = gteVar.w(view);
        fteVar.b = iH;
        fteVar.c = iQ;
        fteVar.d = iF;
        fteVar.e = iW;
        fteVar.a = 24579;
        return fteVar.a();
    }

    public void F(int i, int i2) {
        int[] iArr = (int[]) this.b;
        if (iArr == null || i >= iArr.length) {
            return;
        }
        int i3 = i + i2;
        k(i3);
        int[] iArr2 = (int[]) this.b;
        System.arraycopy(iArr2, i, iArr2, i3, (iArr2.length - i) - i2);
        Arrays.fill((int[]) this.b, i, i3, -1);
        ArrayList arrayList = (ArrayList) this.c;
        if (arrayList == null) {
            return;
        }
        for (int size = arrayList.size() - 1; size >= 0; size--) {
            bnc bncVar = (bnc) ((ArrayList) this.c).get(size);
            int i4 = bncVar.a;
            if (i4 >= i) {
                bncVar.a = i4 + i2;
            }
        }
    }

    public void G(int i, int i2) {
        int[] iArr = (int[]) this.b;
        if (iArr == null || i >= iArr.length) {
            return;
        }
        int i3 = i + i2;
        k(i3);
        int[] iArr2 = (int[]) this.b;
        System.arraycopy(iArr2, i3, iArr2, i, (iArr2.length - i) - i2);
        int[] iArr3 = (int[]) this.b;
        Arrays.fill(iArr3, iArr3.length - i2, iArr3.length, -1);
        ArrayList arrayList = (ArrayList) this.c;
        if (arrayList == null) {
            return;
        }
        for (int size = arrayList.size() - 1; size >= 0; size--) {
            bnc bncVar = (bnc) ((ArrayList) this.c).get(size);
            int i4 = bncVar.a;
            if (i4 >= i) {
                if (i4 < i3) {
                    ((ArrayList) this.c).remove(size);
                } else {
                    bncVar.a = i4 - i2;
                }
            }
        }
    }

    public void H(unc uncVar, vwa vwaVar) {
        uncVar.getClass();
        ((q7f) ((xfd) this.c)).a(new ss(this, uncVar, vwaVar, 18));
    }

    public void I(unc uncVar, int i) {
        uncVar.getClass();
        ((q7f) ((xfd) this.c)).a(new yrc((i2a) this.b, uncVar, false, i));
    }

    /* JADX WARN: Removed duplicated region for block: B:26:0x00a3  */
    /* JADX WARN: Removed duplicated region for block: B:47:0x0119  */
    /* JADX WARN: Removed duplicated region for block: B:71:0x019a  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public defpackage.p1c J(defpackage.ixd r17, java.util.List r18, defpackage.v96 r19) {
        /*
            Method dump skipped, instruction units count: 487
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.mya.J(ixd, java.util.List, v96):p1c");
    }

    /* JADX WARN: Removed duplicated region for block: B:8:0x0014  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public java.lang.Object K(java.lang.String r9, java.lang.String r10, gen.model.SourceParameter r11, java.lang.String r12, defpackage.p92 r13) {
        /*
            r8 = this;
            boolean r0 = r13 instanceof defpackage.z8d
            if (r0 == 0) goto L14
            r0 = r13
            z8d r0 = (defpackage.z8d) r0
            int r1 = r0.f
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L14
            int r1 = r1 - r2
            r0.f = r1
        L12:
            r7 = r0
            goto L1a
        L14:
            z8d r0 = new z8d
            r0.<init>(r8, r13)
            goto L12
        L1a:
            java.lang.Object r13 = r7.d
            tb2 r0 = defpackage.tb2.COROUTINE_SUSPENDED
            int r1 = r7.f
            r2 = 1
            if (r1 == 0) goto L38
            if (r1 != r2) goto L31
            gen.model.SourceParameter r11 = r7.c
            java.lang.String r9 = r7.b
            defpackage.br7.v(r13)
            bjb r13 = (defpackage.bjb) r13
            java.lang.Object r8 = r13.a
            goto L54
        L31:
            java.lang.String r8 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r8)
            r8 = 0
            return r8
        L38:
            defpackage.br7.v(r13)
            java.lang.Object r8 = r8.c
            r1 = r8
            mya r1 = (defpackage.mya) r1
            r7.b = r9
            r7.c = r11
            r7.f = r2
            r6 = 0
            r2 = r9
            r3 = r10
            r4 = r11
            r5 = r12
            java.lang.Object r8 = r1.C(r2, r3, r4, r5, r6, r7)
            if (r8 != r0) goto L52
            return r0
        L52:
            r9 = r2
            r11 = r4
        L54:
            java.lang.Throwable r10 = defpackage.bjb.b(r8)
            if (r10 != 0) goto L62
            yod r8 = (defpackage.yod) r8
            c8d r8 = new c8d
            r8.<init>(r9, r11)
            return r8
        L62:
            b8d r8 = new b8d
            r8.<init>(r11, r9, r10)
            return r8
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.mya.K(java.lang.String, java.lang.String, gen.model.SourceParameter, java.lang.String, p92):java.lang.Object");
    }

    @Override // defpackage.yp8
    public z4f W(View view, z4f z4fVar) {
        fve fveVar = (fve) this.c;
        z4f z4fVarJ = ute.j(view, z4fVar);
        if (z4fVarJ.a.s()) {
            return z4fVarJ;
        }
        Rect rect = (Rect) this.b;
        rect.left = z4fVarJ.b();
        rect.top = z4fVarJ.d();
        rect.right = z4fVarJ.c();
        rect.bottom = z4fVarJ.a();
        int childCount = fveVar.getChildCount();
        for (int i = 0; i < childCount; i++) {
            z4f z4fVarB = ute.b(fveVar.getChildAt(i), z4fVarJ);
            rect.left = Math.min(z4fVarB.b(), rect.left);
            rect.top = Math.min(z4fVarB.d(), rect.top);
            rect.right = Math.min(z4fVarB.c(), rect.right);
            rect.bottom = Math.min(z4fVarB.a(), rect.bottom);
        }
        return z4fVarJ.f(rect.left, rect.top, rect.right, rect.bottom);
    }

    @Override // defpackage.kpb
    public Object a(Object obj) {
        return ((x45) this.c).invoke(obj);
    }

    @Override // defpackage.kpb
    public Object b(lpb lpbVar, Object obj) {
        return ((b55) this.b).invoke(lpbVar, obj);
    }

    @Override // defpackage.ye1
    public void c(String str, String str2, boolean z) {
        str.getClass();
        str2.getClass();
        ide ideVar = (ide) this.b;
        n92 n92Var = null;
        if (z) {
            vx0.c0(f76.F(ideVar), null, null, new dde(ideVar, str, str2, n92Var, 0), 3);
        } else {
            vx0.c0(f76.F(ideVar), null, null, new dde(ideVar, str, str2, n92Var, 3), 3);
        }
    }

    @Override // defpackage.w84
    public void d(ca7 ca7Var) {
        f3c f3cVarJ1 = ((SettingsFragment) this.b).j1();
        vx0.c0(f76.F(f3cVarJ1), null, null, new rna(ca7Var, (s2a) m50.o.T().d, f3cVarJ1, null, 16), 3);
        aa7.f((o41) this.c);
    }

    public void e() {
        int[] iArr = (int[]) this.b;
        if (iArr != null) {
            Arrays.fill(iArr, -1);
        }
        this.c = null;
    }

    @Override // defpackage.ye1
    public void f(String str, String str2) {
        str.getClass();
        ((qbe) this.c).w(str, str2);
    }

    @Override // defpackage.ye1
    public void g(String str, String str2) {
        str.getClass();
        ide ideVar = (ide) this.b;
        vx0.c0(f76.F(ideVar), null, null, new dde(ideVar, str, str2, null, 2), 3);
    }

    /* JADX WARN: Code restructure failed: missing block: B:85:0x019e, code lost:
    
        r0 = new defpackage.a85[]{r7, r5}[1].b;
        r1 = r22 - r0.length;
        r3 = 0;
     */
    /* JADX WARN: Code restructure failed: missing block: B:86:0x01ae, code lost:
    
        if (r3 >= r1) goto L122;
     */
    /* JADX WARN: Code restructure failed: missing block: B:87:0x01b0, code lost:
    
        r23[r4 + r3] = 0;
        r3 = r3 + 1;
     */
    /* JADX WARN: Code restructure failed: missing block: B:88:0x01b7, code lost:
    
        java.lang.System.arraycopy(r0, 0, r23, r4 + r1, r0.length);
     */
    /* JADX WARN: Code restructure failed: missing block: B:89:0x01bc, code lost:
    
        return;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public void h(int r22, int[] r23) {
        /*
            Method dump skipped, instruction units count: 481
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.mya.h(int, int[]):void");
    }

    @Override // defpackage.w84
    public void i(FacebookException facebookException) {
        f3c f3cVarJ1 = ((SettingsFragment) this.b).j1();
        vx0.c0(f76.F(f3cVarJ1), null, null, new eub(facebookException, f3cVarJ1, null, 1), 3);
        aa7.f((o41) this.c);
    }

    @Override // defpackage.ye1
    public void j(rg1 rg1Var, boolean z) {
        rg1Var.getClass();
        ide ideVar = (ide) this.b;
        vx0.c0(f76.F(ideVar), null, null, new lj1(z, ideVar, rg1Var, (n92) null, 15), 3);
    }

    public void k(int i) {
        int[] iArr = (int[]) this.b;
        if (iArr == null) {
            int[] iArr2 = new int[Math.max(i, 10) + 1];
            this.b = iArr2;
            Arrays.fill(iArr2, -1);
        } else if (i >= iArr.length) {
            int length = iArr.length;
            while (length <= i) {
                length *= 2;
            }
            int[] iArr3 = new int[length];
            this.b = iArr3;
            System.arraycopy(iArr, 0, iArr3, 0, iArr.length);
            int[] iArr4 = (int[]) this.b;
            Arrays.fill(iArr4, iArr.length, iArr4.length, -1);
        }
    }

    public View l(int i, int i2, int i3, int i4) {
        fte fteVar = (fte) this.c;
        gte gteVar = (gte) this.b;
        int iH = gteVar.h();
        int iQ = gteVar.q();
        int i5 = i2 > i ? 1 : -1;
        View view = null;
        while (i != i2) {
            View viewV = gteVar.v(i);
            int iF = gteVar.f(viewV);
            int iW = gteVar.w(viewV);
            fteVar.b = iH;
            fteVar.c = iQ;
            fteVar.d = iF;
            fteVar.e = iW;
            if (i3 != 0) {
                fteVar.a = i3;
                if (fteVar.a()) {
                    return viewV;
                }
            }
            if (i4 != 0) {
                fteVar.a = i4;
                if (fteVar.a()) {
                    view = viewV;
                }
            }
            i += i5;
        }
        return view;
    }

    @Override // defpackage.ye1
    public void m(eg1 eg1Var, String str) {
        eg1Var.getClass();
        ide ideVar = (ide) this.b;
        String str2 = eg1Var.b;
        str2.getClass();
        ideVar.g.h(str2, ideVar.b, str, ideVar.o);
        ((qbe) this.c).x(eg1Var);
    }

    @Override // defpackage.ye1
    public void n(rg1 rg1Var) {
        rg1Var.getClass();
        ide ideVar = (ide) this.b;
        vx0.c0(f76.F(ideVar), null, null, new fde(ideVar, rg1Var, null, 1), 3);
    }

    @Override // defpackage.ye1
    public void o(String str, String str2) {
        str.getClass();
        ide ideVar = (ide) this.b;
        if (ideVar.q.add(str)) {
            ev6.L(ideVar.g, str, ideVar.b, str2, ideVar.o);
        }
    }

    @Override // defpackage.w84
    public void onCancel() {
        xpc xpcVar = ((SettingsFragment) this.b).j1().B;
        Boolean bool = Boolean.FALSE;
        xpcVar.getClass();
        xpcVar.m(null, bool);
        aa7.f((o41) this.c);
    }

    /* JADX WARN: Removed duplicated region for block: B:8:0x0014  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public java.lang.Object p(java.lang.String r9, java.lang.String r10, gen.model.SourceParameter r11, java.lang.String r12, defpackage.p92 r13) {
        /*
            r8 = this;
            boolean r0 = r13 instanceof defpackage.y8d
            if (r0 == 0) goto L14
            r0 = r13
            y8d r0 = (defpackage.y8d) r0
            int r1 = r0.f
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L14
            int r1 = r1 - r2
            r0.f = r1
        L12:
            r7 = r0
            goto L1a
        L14:
            y8d r0 = new y8d
            r0.<init>(r8, r13)
            goto L12
        L1a:
            java.lang.Object r13 = r7.d
            tb2 r0 = defpackage.tb2.COROUTINE_SUSPENDED
            int r1 = r7.f
            r2 = 1
            if (r1 == 0) goto L38
            if (r1 != r2) goto L31
            gen.model.SourceParameter r11 = r7.c
            java.lang.String r9 = r7.b
            defpackage.br7.v(r13)
            bjb r13 = (defpackage.bjb) r13
            java.lang.Object r8 = r13.a
            goto L54
        L31:
            java.lang.String r8 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r8)
            r8 = 0
            return r8
        L38:
            defpackage.br7.v(r13)
            java.lang.Object r8 = r8.b
            r1 = r8
            ku3 r1 = (defpackage.ku3) r1
            r7.b = r9
            r7.c = r11
            r7.f = r2
            r6 = 0
            r2 = r9
            r3 = r10
            r4 = r11
            r5 = r12
            java.lang.Object r8 = r1.F(r2, r3, r4, r5, r6, r7)
            if (r8 != r0) goto L52
            return r0
        L52:
            r9 = r2
            r11 = r4
        L54:
            java.lang.Throwable r10 = defpackage.bjb.b(r8)
            if (r10 != 0) goto L62
            yod r8 = (defpackage.yod) r8
            z7d r8 = new z7d
            r8.<init>(r9, r11)
            return r8
        L62:
            y7d r8 = new y7d
            r8.<init>(r11, r9, r10)
            return r8
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.mya.p(java.lang.String, java.lang.String, gen.model.SourceParameter, java.lang.String, p92):java.lang.Object");
    }

    public void q(String str, String str2, x45 x45Var) {
        LinkedHashMap linkedHashMap = ((ct2) this.c).a;
        ydc ydcVar = new ydc(this, str, str2);
        x45Var.invoke(ydcVar);
        String str3 = (String) this.b;
        ArrayList arrayList = ydcVar.b;
        ArrayList arrayList2 = new ArrayList(cu1.k0(arrayList, 10));
        Iterator it2 = arrayList.iterator();
        while (it2.hasNext()) {
            arrayList2.add((String) ((f09) it2.next()).a);
        }
        String strT = (String) ydcVar.c.a;
        strT.getClass();
        StringBuilder sb = new StringBuilder(str);
        sb.append('(');
        sb.append(bu1.F0(arrayList2, "", null, null, p79.A, 30));
        sb.append(')');
        if (strT.length() > 1) {
            strT = wgd.t(';', "L", strT);
        }
        sb.append(strT);
        String strR = ev6.r('.', str3, sb.toString());
        gwd gwdVar = (gwd) ydcVar.c.b;
        ArrayList arrayList3 = new ArrayList(cu1.k0(arrayList, 10));
        Iterator it3 = arrayList.iterator();
        while (it3.hasNext()) {
            arrayList3.add((gwd) ((f09) it3.next()).b);
        }
        linkedHashMap.put(strR, new gy9(gwdVar, arrayList3, ydcVar.a));
    }

    public o3e r(v96 v96Var) {
        o3e o3eVarJ;
        hec hecVar = v96Var.f;
        return (hecVar == null || (o3eVarJ = ok7.J(hecVar)) == null) ? (i24) ((w5d) this.b).getValue() : o3eVarJ;
    }

    @Override // defpackage.ye1
    public void s(String str, String str2) {
        str.getClass();
        ide ideVar = (ide) this.b;
        vx0.c0(f76.F(ideVar), null, null, new dde(ideVar, str, str2, null, 1), 3);
    }

    public mn6 t(swd swdVar, v96 v96Var) {
        swdVar.getClass();
        v96Var.getClass();
        return (mn6) ((r67) this.c).invoke(new wwd(swdVar, v96Var));
    }

    public String toString() {
        switch (this.a) {
            case 26:
                return "Bounds{lower=" + ((b36) this.b) + " upper=" + ((b36) this.c) + "}";
            default:
                return super.toString();
        }
    }

    public bo4 u(EntityType entityType, String str, boolean z) {
        entityType.getClass();
        str.getClass();
        return m40.J(new u50(12, new dye(this, entityType, str, z, null)));
    }

    public bo4 v(String str, boolean z) {
        bo4 mxeVar;
        str.getClass();
        if (str.equals(((zk2) this.b).m())) {
            mxeVar = new u50(7, bt4.CANT_FOLLOW);
        } else {
            e00 e00Var = ((ble) this.c).a;
            UserIsFollowingQuery userIsFollowingQuery = new UserIsFollowingQuery(str);
            e00Var.getClass();
            uz uzVar = new uz(e00Var, userIsFollowingQuery);
            uzVar.b.i = Boolean.valueOf(z);
            yd4 yd4Var = yd4.CacheFirst;
            mxeVar = new mxe(new zz(new xz(gr7.F((uz) gr7.x((h68) gr7.i(uzVar, yd4Var), yd4.CacheOnly)), yd4Var, 19), 0), str, 4);
        }
        return m40.J(mxeVar);
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0019  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public java.lang.Object x(defpackage.p92 r25, gen.model.SourceParameter r26, java.lang.String r27, java.lang.String r28, java.lang.String r29, java.lang.String r30) {
        /*
            Method dump skipped, instruction units count: 214
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.mya.x(p92, gen.model.SourceParameter, java.lang.String, java.lang.String, java.lang.String, java.lang.String):java.lang.Object");
    }

    @Override // defpackage.khf
    public Object y() {
        return new phf((Context) ((hha) this.b).a, (jif) ((vgf) this.c).y(), new fa4(26));
    }

    @Override // defpackage.v0d
    public jrg z(Object obj) {
        xgf xgfVar = (xgf) this.b;
        return vp7.x(new shf(xgfVar.b, ((zhf) this.c).a, ((Long) obj).longValue()));
    }

    public mya(hha hhaVar, vgf vgfVar, xsa xsaVar) {
        this.a = 29;
        this.b = hhaVar;
        this.c = vgfVar;
    }

    public /* synthetic */ mya(Object obj, int i, Object obj2) {
        this.a = i;
        this.b = obj;
        this.c = obj2;
    }

    public mya(nfb nfbVar, ax2 ax2Var) {
        this.a = 13;
        nfbVar.getClass();
        this.b = nfbVar;
        this.c = ax2Var;
    }

    public mya(gn9 gn9Var, ax2 ax2Var) {
        this.a = 1;
        gn9Var.getClass();
        this.b = gn9Var;
        this.c = ax2Var;
    }

    public mya(zk2 zk2Var, ble bleVar) {
        this.a = 24;
        zk2Var.getClass();
        this.b = zk2Var;
        this.c = bleVar;
    }

    public mya(zk2 zk2Var, sb2 sb2Var) {
        this.a = 22;
        zk2Var.getClass();
        sb2Var.getClass();
        this.b = zk2Var;
        this.c = sb2Var;
    }

    public mya(rz5 rz5Var) {
        this.a = 15;
        x67 x67Var = new x67("Type parameter upper bound erasure results");
        this.b = new w5d(new bx6(14, this));
        this.c = x67Var.b(new k0b(7, this));
    }

    public mya(Object obj) {
        this.a = 7;
        this.b = obj;
        this.c = Thread.currentThread();
    }

    public mya(Context context, kb2 kb2Var) {
        this.a = 18;
        this.b = kb2Var;
        this.c = context.getContentResolver();
    }

    public mya(z75 z75Var) {
        this.a = 0;
        this.b = z75Var;
        ArrayList arrayList = new ArrayList();
        this.c = arrayList;
        arrayList.add(new a85(z75Var, new int[]{1}));
    }

    public mya(ExecutorService executorService) {
        this.a = 2;
        this.c = new y70(0);
        this.b = executorService;
    }

    public mya(i2a i2aVar, xfd xfdVar) {
        this.a = 27;
        i2aVar.getClass();
        xfdVar.getClass();
        this.b = i2aVar;
        this.c = xfdVar;
    }

    public /* synthetic */ mya(int i, boolean z) {
        this.a = i;
    }

    public mya(gte gteVar) {
        this.a = 20;
        this.b = gteVar;
        fte fteVar = new fte();
        fteVar.a = 0;
        this.c = fteVar;
    }

    public mya(uz0 uz0Var, oz0 oz0Var) {
        this.a = 4;
        qz0 qz0Var = qz0.a;
        rz0 rz0Var = rz0.a;
        this.b = uz0Var;
        this.c = oz0Var;
    }

    public mya(SettingsFragment settingsFragment, aa7 aa7Var, o41 o41Var) {
        this.a = 5;
        this.b = settingsFragment;
        this.c = o41Var;
    }

    public mya(WindowInsetsAnimation.Bounds bounds) {
        this.a = 26;
        this.b = d4f.g(bounds);
        this.c = d4f.f(bounds);
    }

    public mya(ct2 ct2Var, String str) {
        this.a = 6;
        this.c = ct2Var;
        this.b = str;
    }

    public mya(fve fveVar) {
        this.a = 21;
        this.c = fveVar;
        this.b = new Rect();
    }
}
