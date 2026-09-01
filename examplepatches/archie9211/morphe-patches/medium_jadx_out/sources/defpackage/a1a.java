package defpackage;

import android.content.Context;
import android.content.SharedPreferences;
import android.content.res.Resources;
import android.util.Log;
import androidx.emoji2.text.flatbuffer.aI.aJzfoQ;
import com.medium.android.admin.stagebranch.StageBranchData;
import com.medium.android.admin.stagebranch.StageBranchDataAdapter;
import com.medium.android.graphql.UserIsMutedQuery;
import com.medium.android.search.ui.main.SearchFragment;
import com.medium.reader.R;
import gen.model.SourceParameter;
import j$.util.concurrent.ConcurrentHashMap;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.concurrent.atomic.AtomicReference;
import org.json.JSONObject;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final class a1a implements obe, ara, j41, v0d, e9d, yp8 {
    public final /* synthetic */ int a;
    public Object b;
    public Object c;

    public a1a(int i) {
        this.a = i;
        switch (i) {
            case 10:
                break;
            case 17:
                this.b = new ConcurrentHashMap();
                this.c = new AtomicInteger(0);
                break;
            case 18:
                this.b = new dq1(24);
                this.c = new bd7(16);
                break;
            case 25:
                this.b = new aec(0);
                this.c = new ab7((Object) null);
                break;
            default:
                this.b = new LinkedHashMap();
                this.c = new LinkedHashMap();
                break;
        }
    }

    public static uvd i(List list) {
        return list.isEmpty() ? uvd.c : new uvd(list);
    }

    @Override // defpackage.obe
    public void A(SourceParameter sourceParameter, String str, boolean z) {
        switch (this.a) {
            case 2:
                throw ho2.J(sourceParameter, str, "PublicationAboutScreen doesn't support muting users");
            default:
                throw ho2.J(sourceParameter, str, "UsersSearchFragment doesn't support muting users");
        }
    }

    @Override // defpackage.e9d
    public void B(SourceParameter sourceParameter, String str, boolean z) {
        str.getClass();
        sourceParameter.getClass();
        efd efdVar = (efd) this.b;
        n92 n92Var = null;
        if (z) {
            vx0.c0(f76.F(efdVar), null, null, new bfd(efdVar, str, sourceParameter, n92Var, 0), 3);
        } else {
            vx0.c0(f76.F(efdVar), null, null, new bfd(efdVar, str, sourceParameter, n92Var, 1), 3);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x001b  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public java.lang.Object C(java.lang.String r21, java.lang.String r22, java.lang.String r23, defpackage.g08 r24, defpackage.p92 r25) {
        /*
            Method dump skipped, instruction units count: 318
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.a1a.C(java.lang.String, java.lang.String, java.lang.String, g08, p92):java.lang.Object");
    }

    /* JADX WARN: Code restructure failed: missing block: B:22:0x0069, code lost:
    
        if (r7 == r1) goto L23;
     */
    /* JADX WARN: Removed duplicated region for block: B:27:0x0075  */
    /* JADX WARN: Removed duplicated region for block: B:30:0x0087  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public java.lang.Object D(defpackage.p92 r8) {
        /*
            r7 = this;
            boolean r0 = r8 instanceof defpackage.h2b
            if (r0 == 0) goto L13
            r0 = r8
            h2b r0 = (defpackage.h2b) r0
            int r1 = r0.d
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.d = r1
            goto L18
        L13:
            h2b r0 = new h2b
            r0.<init>(r7, r8)
        L18:
            java.lang.Object r8 = r0.b
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.d
            r3 = 2
            r4 = 1
            r5 = 0
            if (r2 == 0) goto L3e
            if (r2 == r4) goto L36
            if (r2 != r3) goto L2f
            defpackage.br7.v(r8)
            bjb r8 = (defpackage.bjb) r8
            java.lang.Object r7 = r8.a
            goto L71
        L2f:
            java.lang.String r7 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r7)
            r7 = 0
            return r7
        L36:
            defpackage.br7.v(r8)
            bjb r8 = (defpackage.bjb) r8
            java.lang.Object r8 = r8.a
            goto L57
        L3e:
            defpackage.br7.v(r8)
            uld r8 = defpackage.wld.a
            java.lang.String r2 = "Refresh Push Notification Token"
            java.lang.Object[] r6 = new java.lang.Object[r5]
            r8.a(r2, r6)
            java.lang.Object r8 = r7.c
            olb r8 = (defpackage.olb) r8
            r0.d = r4
            java.io.Serializable r8 = r8.l(r0)
            if (r8 != r1) goto L57
            goto L6b
        L57:
            java.lang.Throwable r2 = defpackage.bjb.b(r8)
            if (r2 != 0) goto L6c
            java.lang.String r8 = (java.lang.String) r8
            java.lang.Object r7 = r7.b
            l07 r7 = (defpackage.l07) r7
            r0.d = r3
            java.lang.Object r7 = r7.a(r8, r0)
            if (r7 != r1) goto L71
        L6b:
            return r1
        L6c:
            ajb r7 = new ajb
            r7.<init>(r2)
        L71:
            boolean r8 = r7 instanceof defpackage.ajb
            if (r8 != 0) goto L81
            r8 = r7
            c1e r8 = (defpackage.c1e) r8
            uld r8 = defpackage.wld.a
            java.lang.String r0 = "Successfully refreshed push notification token"
            java.lang.Object[] r1 = new java.lang.Object[r5]
            r8.a(r0, r1)
        L81:
            java.lang.Throwable r8 = defpackage.bjb.b(r7)
            if (r8 == 0) goto L90
            uld r0 = defpackage.wld.a
            java.lang.String r1 = "Failed to refresh push notification token"
            java.lang.Object[] r2 = new java.lang.Object[r5]
            r0.e(r8, r1, r2)
        L90:
            return r7
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.a1a.D(p92):java.lang.Object");
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x001b  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public java.lang.Object H(defpackage.p92 r17, java.lang.String r18, java.lang.String r19, java.lang.String r20, java.lang.String r21, boolean r22) {
        /*
            Method dump skipped, instruction units count: 221
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.a1a.H(p92, java.lang.String, java.lang.String, java.lang.String, java.lang.String, boolean):java.lang.Object");
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0019  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public java.lang.Object I(java.lang.String r18, java.lang.String r19, java.lang.String r20, java.lang.String r21, defpackage.p92 r22) {
        /*
            r17 = this;
            r0 = r17
            r1 = r18
            r2 = r22
            boolean r3 = r2 instanceof defpackage.j0e
            if (r3 == 0) goto L19
            r3 = r2
            j0e r3 = (defpackage.j0e) r3
            int r4 = r3.h
            r5 = -2147483648(0xffffffff80000000, float:-0.0)
            r6 = r4 & r5
            if (r6 == 0) goto L19
            int r4 = r4 - r5
            r3.h = r4
            goto L1e
        L19:
            j0e r3 = new j0e
            r3.<init>(r0, r2)
        L1e:
            java.lang.Object r2 = r3.f
            tb2 r4 = defpackage.tb2.COROUTINE_SUSPENDED
            int r5 = r3.h
            r6 = 0
            r7 = 1
            r8 = 0
            if (r5 == 0) goto L45
            if (r5 != r7) goto L3f
            java.lang.String r1 = r3.e
            java.lang.String r4 = r3.d
            java.lang.String r5 = r3.c
            java.lang.String r3 = r3.b
            defpackage.br7.v(r2)
            bjb r2 = (defpackage.bjb) r2
            java.lang.Object r2 = r2.a
            r15 = r1
            r1 = r3
            r12 = r4
        L3d:
            r11 = r5
            goto L70
        L3f:
            java.lang.String r0 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r0)
            return r6
        L45:
            java.lang.String r5 = "Unfollow catalog. Catalog id: "
            java.lang.String r2 = defpackage.wgd.u(r2, r5, r1)
            uld r5 = defpackage.wld.a
            java.lang.Object[] r9 = new java.lang.Object[r8]
            defpackage.km4.I(r5, r6, r2, r9, r2)
            java.lang.Object r2 = r0.b
            qi1 r2 = (defpackage.qi1) r2
            r3.b = r1
            r5 = r19
            r3.c = r5
            r9 = r20
            r3.d = r9
            r10 = r21
            r3.e = r10
            r3.h = r7
            java.lang.Object r2 = r2.B(r1, r3)
            if (r2 != r4) goto L6d
            return r4
        L6d:
            r12 = r9
            r15 = r10
            goto L3d
        L70:
            boolean r3 = r2 instanceof defpackage.ajb
            if (r3 != 0) goto La9
            r3 = r2
            c1e r3 = (defpackage.c1e) r3
            java.lang.String r3 = "Unfollow catalog success: Catalog id: "
            java.lang.String r3 = defpackage.ka1.r(r3, r1)
            uld r4 = defpackage.wld.a
            java.lang.Object[] r5 = new java.lang.Object[r8]
            defpackage.km4.I(r4, r6, r3, r5, r3)
            java.lang.Object r0 = r0.c
            ax2 r0 = (defpackage.ax2) r0
            defpackage.ho2.Q(r1, r11, r12, r15)
            rqd r9 = r0.b
            com.medium.proto.event.ListRemovedFromLibrary r10 = new com.medium.proto.event.ListRemovedFromLibrary
            r0 = 5
            r3 = 0
            r4 = 0
            r5 = 0
            r21 = r0
            r19 = r1
            r22 = r3
            r18 = r4
            r20 = r5
            r17 = r10
            r17.<init>(r18, r19, r20, r21, r22)
            r14 = 0
            r16 = 24
            r13 = 0
            defpackage.rqd.a(r9, r10, r11, r12, r13, r14, r15, r16)
        La9:
            java.lang.Throwable r0 = defpackage.bjb.b(r2)
            if (r0 == 0) goto Lbc
            java.lang.String r3 = "Unfollow catalog failure. Catalog id: "
            java.lang.String r1 = defpackage.ka1.r(r3, r1)
            uld r3 = defpackage.wld.a
            java.lang.Object[] r4 = new java.lang.Object[r8]
            r3.e(r0, r1, r4)
        Lbc:
            return r2
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.a1a.I(java.lang.String, java.lang.String, java.lang.String, java.lang.String, p92):java.lang.Object");
    }

    public yqa J(pr0 pr0Var, int i) {
        lue lueVar;
        yqa yqaVar;
        aec aecVar = (aec) this.b;
        int iC = aecVar.c(pr0Var);
        if (iC >= 0 && (lueVar = (lue) aecVar.i(iC)) != null) {
            int i2 = lueVar.a;
            if ((i2 & i) != 0) {
                int i3 = i2 & (~i);
                lueVar.a = i3;
                if (i == 4) {
                    yqaVar = lueVar.b;
                } else if (i == 8) {
                    yqaVar = lueVar.c;
                } else {
                    ay0.e("Must provide flag PRE or POST");
                }
                if ((i3 & 12) == 0) {
                    aecVar.g(iC);
                    lueVar.a = 0;
                    lueVar.b = null;
                    lueVar.c = null;
                    lue.d.c(lueVar);
                }
                return yqaVar;
            }
        }
        return null;
    }

    @Override // defpackage.jt4
    public void L(SourceParameter sourceParameter, String str, String str2, String str3) {
        switch (this.a) {
            case 2:
                ho2.P(sourceParameter, str, str2, str3);
                vaa vaaVar = (vaa) this.b;
                vx0.c0(f76.F(vaaVar), null, null, new saa(vaaVar, str3, str, str2, sourceParameter, null, 1), 3);
                break;
            default:
                ho2.P(sourceParameter, str, str2, str3);
                ooe ooeVar = (ooe) this.b;
                vx0.c0(f76.F(ooeVar), null, null, new noe(ooeVar, str3, str, str2, sourceParameter, null, 1), 3);
                break;
        }
    }

    @Override // defpackage.jt4
    public void M(String str, SourceParameter sourceParameter) {
        int i = this.a;
        sourceParameter.getClass();
        switch (i) {
            case 2:
                vaa vaaVar = (vaa) this.b;
                vaaVar.k.e(sourceParameter, str, vaaVar.c, vaaVar.o);
                break;
            default:
                ooe ooeVar = (ooe) this.b;
                ooeVar.d.e(sourceParameter, str, ooeVar.b, ooeVar.o);
                break;
        }
    }

    @Override // defpackage.jt4
    public void N(SourceParameter sourceParameter, String str, String str2) {
        switch (this.a) {
            case 2:
                str2.getClass();
                sourceParameter.getClass();
                vaa vaaVar = (vaa) this.b;
                vx0.c0(f76.F(vaaVar), null, null, new raa(vaaVar, str, str2, sourceParameter, null, 1), 3);
                break;
            default:
                str2.getClass();
                sourceParameter.getClass();
                ooe ooeVar = (ooe) this.b;
                vx0.c0(f76.F(ooeVar), null, null, new koe(ooeVar, str, str2, sourceParameter, null, 1), 3);
                break;
        }
    }

    @Override // defpackage.jt4
    public void O(SourceParameter sourceParameter, String str, String str2, String str3) {
        switch (this.a) {
            case 2:
                ho2.O(sourceParameter, str, str2);
                vaa vaaVar = (vaa) this.b;
                vx0.c0(f76.F(vaaVar), null, null, new saa(vaaVar, str3, str, str2, sourceParameter, null, 0), 3);
                break;
            default:
                ho2.O(sourceParameter, str, str2);
                ooe ooeVar = (ooe) this.b;
                vx0.c0(f76.F(ooeVar), null, null, new noe(ooeVar, str3, str, str2, sourceParameter, null, 0), 3);
                break;
        }
    }

    @Override // defpackage.obe
    public /* bridge */ void P(String str, SourceParameter sourceParameter) {
        switch (this.a) {
            case 2:
                wgd.c(str, sourceParameter);
                break;
            default:
                wgd.c(str, sourceParameter);
                break;
        }
    }

    public unc Q(h7f h7fVar) {
        unc uncVarF;
        h7fVar.getClass();
        synchronized (this.c) {
            uncVarF = ((ct2) this.b).f(h7fVar);
        }
        return uncVarF;
    }

    @Override // defpackage.jt4
    public void S(SourceParameter sourceParameter, String str, String str2) {
        switch (this.a) {
            case 2:
                str2.getClass();
                sourceParameter.getClass();
                vaa vaaVar = (vaa) this.b;
                vx0.c0(f76.F(vaaVar), null, null, new raa(vaaVar, str, str2, sourceParameter, null, 0), 3);
                break;
            default:
                str2.getClass();
                sourceParameter.getClass();
                ooe ooeVar = (ooe) this.b;
                vx0.c0(f76.F(ooeVar), null, null, new koe(ooeVar, str, str2, sourceParameter, null, 0), 3);
                break;
        }
    }

    @Override // defpackage.jt4
    public void U(String str, SourceParameter sourceParameter) {
        switch (this.a) {
            case 2:
                str.getClass();
                sourceParameter.getClass();
                vaa vaaVar = (vaa) this.b;
                vx0.c0(f76.F(vaaVar), null, null, new mw9((que) vaaVar, str, (Object) sourceParameter, (n92) null, 4), 3);
                break;
            default:
                str.getClass();
                sourceParameter.getClass();
                ooe ooeVar = (ooe) this.b;
                vx0.c0(f76.F(ooeVar), null, null, new j5d(ooeVar, str, sourceParameter, null, 20), 3);
                break;
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:37:0x0091  */
    @Override // defpackage.yp8
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public defpackage.z4f W(android.view.View r18, defpackage.z4f r19) {
        /*
            r17 = this;
            r0 = r17
            r1 = r18
            r2 = r19
            java.lang.Object r3 = r0.b
            sv0 r3 = (defpackage.sv0) r3
            java.lang.Object r0 = r0.c
            awe r0 = (defpackage.awe) r0
            int r4 = r0.a
            int r5 = r0.b
            int r0 = r0.c
            w4f r6 = r2.a
            r7 = 519(0x207, float:7.27E-43)
            b36 r7 = r6.i(r7)
            r8 = 32
            b36 r6 = r6.i(r8)
            java.lang.Object r8 = r3.c
            com.google.android.material.bottomsheet.BottomSheetBehavior r8 = (com.google.android.material.bottomsheet.BottomSheetBehavior) r8
            int r9 = r7.b
            int r10 = r7.c
            int r11 = r7.a
            r8.x = r9
            int r9 = r1.getLayoutDirection()
            r13 = 1
            if (r9 != r13) goto L37
            r9 = r13
            goto L38
        L37:
            r9 = 0
        L38:
            int r14 = r1.getPaddingBottom()
            int r15 = r1.getPaddingLeft()
            int r16 = r1.getPaddingRight()
            boolean r12 = r8.p
            if (r12 == 0) goto L4f
            int r14 = r2.a()
            r8.w = r14
            int r14 = r14 + r0
        L4f:
            boolean r0 = r8.q
            if (r0 == 0) goto L5a
            if (r9 == 0) goto L57
            r0 = r5
            goto L58
        L57:
            r0 = r4
        L58:
            int r15 = r0 + r11
        L5a:
            boolean r0 = r8.r
            if (r0 == 0) goto L64
            if (r9 == 0) goto L61
            goto L62
        L61:
            r4 = r5
        L62:
            int r16 = r4 + r10
        L64:
            r0 = r16
            android.view.ViewGroup$LayoutParams r4 = r1.getLayoutParams()
            android.view.ViewGroup$MarginLayoutParams r4 = (android.view.ViewGroup.MarginLayoutParams) r4
            boolean r5 = r8.t
            if (r5 == 0) goto L78
            int r5 = r4.leftMargin
            if (r5 == r11) goto L78
            r4.leftMargin = r11
            r5 = r13
            goto L79
        L78:
            r5 = 0
        L79:
            boolean r9 = r8.u
            if (r9 == 0) goto L84
            int r9 = r4.rightMargin
            if (r9 == r10) goto L84
            r4.rightMargin = r10
            r5 = r13
        L84:
            boolean r9 = r8.v
            if (r9 == 0) goto L91
            int r9 = r4.topMargin
            int r7 = r7.b
            if (r9 == r7) goto L91
            r4.topMargin = r7
            goto L92
        L91:
            r13 = r5
        L92:
            if (r13 == 0) goto L97
            r1.setLayoutParams(r4)
        L97:
            int r4 = r1.getPaddingTop()
            r1.setPadding(r15, r4, r0, r14)
            boolean r0 = r3.b
            if (r0 == 0) goto La6
            int r1 = r6.d
            r8.n = r1
        La6:
            if (r12 != 0) goto Lac
            if (r0 == 0) goto Lab
            goto Lac
        Lab:
            return r2
        Lac:
            r8.S()
            return r2
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.a1a.W(android.view.View, z4f):z4f");
    }

    public void X(pr0 pr0Var) {
        lue lueVar = (lue) ((aec) this.b).get(pr0Var);
        if (lueVar == null) {
            return;
        }
        lueVar.a &= -2;
    }

    public void Y(pr0 pr0Var) {
        ab7 ab7Var = (ab7) this.c;
        int iK = ab7Var.k() - 1;
        while (true) {
            if (iK < 0) {
                break;
            }
            if (pr0Var == ab7Var.l(iK)) {
                Object[] objArr = ab7Var.c;
                Object obj = objArr[iK];
                Object obj2 = vx0.t;
                if (obj != obj2) {
                    objArr[iK] = obj2;
                    ab7Var.a = true;
                }
            } else {
                iK--;
            }
        }
        lue lueVar = (lue) ((aec) this.b).remove(pr0Var);
        if (lueVar != null) {
            lueVar.a = 0;
            lueVar.b = null;
            lueVar.c = null;
            lue.d.c(lueVar);
        }
    }

    public void Z(String str) {
        str.getClass();
        wea weaVar = (wea) this.b;
        weaVar.getClass();
        vx0.c0(f76.F(weaVar), null, null, new nx9(weaVar, str, null, 8), 3);
    }

    public unc a0(h7f h7fVar) {
        unc uncVarH;
        synchronized (this.c) {
            uncVarH = ((ct2) this.b).h(h7fVar);
        }
        return uncVarH;
    }

    @Override // defpackage.ara
    public void b(zqa zqaVar, int i) throws IOException {
        int[] iArr = (int[]) this.c;
        try {
            zqaVar.read((byte[]) this.b, iArr[0], i);
            iArr[0] = iArr[0] + i;
        } finally {
            zqaVar.close();
        }
    }

    public void d(pr0 pr0Var, yqa yqaVar) {
        aec aecVar = (aec) this.b;
        lue lueVarA = (lue) aecVar.get(pr0Var);
        if (lueVarA == null) {
            lueVarA = lue.a();
            aecVar.put(pr0Var, lueVarA);
        }
        lueVarA.c = yqaVar;
        lueVarA.a |= 8;
    }

    public boolean f(h7f h7fVar) {
        boolean zContainsKey;
        synchronized (this.c) {
            zContainsKey = ((ct2) this.b).a.containsKey(h7fVar);
        }
        return zContainsKey;
    }

    public void h0(ijc ijcVar) {
        synchronized (this) {
            zm7 zm7Var = (zm7) this.b;
            ((SharedPreferences) zm7Var.b).edit().putLong("com.lyft.kronos.cached_current_time", ijcVar.a).apply();
            zm7 zm7Var2 = (zm7) this.b;
            ((SharedPreferences) zm7Var2.b).edit().putLong("com.lyft.kronos.cached_elapsed_time", ijcVar.b).apply();
            zm7 zm7Var3 = (zm7) this.b;
            ((SharedPreferences) zm7Var3.b).edit().putLong("com.lyft.kronos.cached_offset", ijcVar.c).apply();
        }
    }

    public int n(wg6 wg6Var) {
        wg6Var.getClass();
        String strD = wg6Var.d();
        strD.getClass();
        return r(strD);
    }

    /* JADX WARN: Removed duplicated region for block: B:39:0x00dd A[PHI: r10 r12 r14
      0x00dd: PHI (r10v5 java.lang.Integer) = (r10v4 java.lang.Integer), (r10v9 java.lang.Integer) binds: [B:54:0x0106, B:36:0x00d3] A[DONT_GENERATE, DONT_INLINE]
      0x00dd: PHI (r12v8 java.lang.Integer) = (r12v6 java.lang.Integer), (r12v4 java.lang.Integer) binds: [B:54:0x0106, B:36:0x00d3] A[DONT_GENERATE, DONT_INLINE]
      0x00dd: PHI (r14v17 boolean) = (r14v11 boolean), (r14v20 boolean) binds: [B:54:0x0106, B:36:0x00d3] A[DONT_GENERATE, DONT_INLINE]] */
    @Override // defpackage.j41
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public void o(defpackage.cva r20, defpackage.adb r21) {
        /*
            Method dump skipped, instruction units count: 498
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.a1a.o(cva, adb):void");
    }

    @Override // defpackage.obe, defpackage.e9d
    public void p(String str, SourceParameter sourceParameter) {
        n92 n92Var = null;
        switch (this.a) {
            case 2:
                str.getClass();
                ((kia) ((sja) ((pkf) this.c).a)).d(str, sourceParameter);
                break;
            case 15:
                efd efdVar = (efd) this.b;
                vx0.c0(f76.F(efdVar), null, null, new cfd(efdVar, str, n92Var, 0), 3);
                SearchFragment searchFragment = ((htb) ((gub) this.c).b).a;
                ((p13) searchFragment.Z()).N(searchFragment.S(), str, gp7.u(sourceParameter));
                break;
            default:
                str.getClass();
                ooe ooeVar = (ooe) this.b;
                vx0.c0(f76.F(ooeVar), null, null, new cfd(ooeVar, str, n92Var, 20), 3);
                SearchFragment searchFragment2 = ((htb) ((fub) this.c).b).a;
                ((p13) searchFragment2.Z()).Q(searchFragment2.S(), str, gp7.u(sourceParameter));
                break;
        }
    }

    public int r(String str) {
        int andIncrement;
        ConcurrentHashMap concurrentHashMap = (ConcurrentHashMap) this.b;
        Integer num = (Integer) concurrentHashMap.get(str);
        if (num != null) {
            return num.intValue();
        }
        synchronized (concurrentHashMap) {
            try {
                Integer num2 = (Integer) concurrentHashMap.get(str);
                if (num2 != null) {
                    andIncrement = num2.intValue();
                } else {
                    andIncrement = ((AtomicInteger) this.c).getAndIncrement();
                    concurrentHashMap.putIfAbsent(str, Integer.valueOf(andIncrement));
                }
            } catch (Throwable th) {
                throw th;
            }
        }
        return andIncrement;
    }

    public String s(String str) {
        String str2 = (String) this.c;
        Resources resources = (Resources) this.b;
        int identifier = resources.getIdentifier(str, "string", str2);
        if (identifier == 0) {
            return null;
        }
        return resources.getString(identifier);
    }

    public String toString() {
        switch (this.a) {
            case 0:
                String str = "[ ";
                if (((gkc) this.b) != null) {
                    for (int i = 0; i < 9; i++) {
                        str = str + ((gkc) this.b).h[i] + " ";
                    }
                }
                return str + "] " + ((gkc) this.b);
            default:
                return super.toString();
        }
    }

    public void u(String str) {
        hz2 hz2VarB = ((x38) this.b).b();
        hz2VarB.a(new StageBranchDataAdapter());
        StageBranchData stageBranchData = (StageBranchData) jq7.f(new x38(hz2VarB), n1b.a(StageBranchData.class)).b(str);
        qn7 qn7Var = (qn7) this.c;
        if (stageBranchData == null) {
            qn7Var.P(null);
            return;
        }
        en0 en0Var = gn0.f;
        byte[] bytes = str.getBytes(wk1.a);
        bytes.getClass();
        qn7Var.P(gn0.b(en0Var, bytes));
    }

    @Override // defpackage.j41
    public void w(cva cvaVar, IOException iOException) {
        zva.c((zva) this.b, iOException, 6);
    }

    public bo4 x(String str, boolean z) {
        bo4 mxeVar;
        str.getClass();
        if (str.equals(((zk2) this.c).m())) {
            mxeVar = new u50(7, d88.CANT_MUTE);
        } else {
            e00 e00Var = ((ble) this.b).a;
            UserIsMutedQuery userIsMutedQuery = new UserIsMutedQuery(str);
            e00Var.getClass();
            uz uzVar = new uz(e00Var, userIsMutedQuery);
            uzVar.b.i = Boolean.valueOf(z);
            yd4 yd4Var = yd4.CacheFirst;
            mxeVar = new mxe(new zz(new xz(gr7.F((uz) gr7.x((h68) gr7.i(uzVar, yd4Var), yd4.CacheOnly)), yd4Var, 20), 0), str, 5);
        }
        return m40.J(mxeVar);
    }

    @Override // defpackage.obe, defpackage.e9d
    public void y(String str, SourceParameter sourceParameter) {
        switch (this.a) {
            case 2:
                str.getClass();
                vaa vaaVar = (vaa) this.b;
                if (vaaVar.r.add(str)) {
                    vaaVar.h.x0(str, vaaVar.c, gp7.u(sourceParameter), vaaVar.o);
                }
                break;
            case 15:
                efd efdVar = (efd) this.b;
                if (efdVar.p.add(str)) {
                    efdVar.g.g(str, efdVar.b, gp7.u(sourceParameter), efdVar.n);
                }
                break;
            default:
                str.getClass();
                ooe ooeVar = (ooe) this.b;
                if (ooeVar.q.add(str)) {
                    ooeVar.g.x0(str, ooeVar.b, gp7.u(sourceParameter), ooeVar.o);
                }
                break;
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0019  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public java.lang.Object F(defpackage.p92 r25, gen.model.SourceParameter r26, java.lang.String r27, java.lang.String r28, java.lang.String r29, java.lang.String r30) {
        /*
            Method dump skipped, instruction units count: 213
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.a1a.F(p92, gen.model.SourceParameter, java.lang.String, java.lang.String, java.lang.String, java.lang.String):java.lang.Object");
    }

    @Override // defpackage.v0d
    public jrg z(Object obj) throws Throwable {
        FileWriter fileWriter;
        iv2 iv2Var = (iv2) this.c;
        JSONObject jSONObject = (JSONObject) ((ud2) ((m50) this.b).d).a.submit(new lc2(2, this)).get();
        FileWriter fileWriter2 = null;
        if (jSONObject != null) {
            w1c w1cVarL = ((qlb) iv2Var.c).l(jSONObject);
            olb olbVar = (olb) iv2Var.d;
            long j = w1cVarL.c;
            if (Log.isLoggable("FirebaseCrashlytics", 2)) {
                Log.v("FirebaseCrashlytics", "Writing settings to cache file...", null);
            }
            try {
                try {
                    jSONObject.put("expires_at", j);
                } catch (Throwable th) {
                    th = th;
                    gx1.D(fileWriter2, "Failed to close settings writer.");
                    throw th;
                }
                try {
                    fileWriter = new FileWriter((File) olbVar.b);
                    try {
                        try {
                            fileWriter.write(jSONObject.toString());
                            fileWriter.flush();
                        } catch (Exception e) {
                            e = e;
                            Log.e("FirebaseCrashlytics", aJzfoQ.zPorGjwDspE, e);
                        }
                    } catch (Throwable th2) {
                        th = th2;
                        fileWriter2 = fileWriter;
                        gx1.D(fileWriter2, "Failed to close settings writer.");
                        throw th;
                    }
                } catch (Exception e2) {
                    e = e2;
                    fileWriter = null;
                    Log.e("FirebaseCrashlytics", aJzfoQ.zPorGjwDspE, e);
                    gx1.D(fileWriter, "Failed to close settings writer.");
                    iv2.e("Loaded settings: ", jSONObject);
                    String str = ((m2c) iv2Var.b).f;
                    SharedPreferences.Editor editorEdit = ((Context) iv2Var.a).getSharedPreferences("com.google.firebase.crashlytics", 0).edit();
                    editorEdit.putString("existing_instance_identifier", str);
                    editorEdit.apply();
                    ((AtomicReference) iv2Var.g).set(w1cVarL);
                    ((wfd) ((AtomicReference) iv2Var.h).get()).d(w1cVarL);
                    return vp7.x(null);
                }
            } catch (Exception e3) {
                e = e3;
            }
            gx1.D(fileWriter, "Failed to close settings writer.");
            iv2.e("Loaded settings: ", jSONObject);
            String str2 = ((m2c) iv2Var.b).f;
            SharedPreferences.Editor editorEdit2 = ((Context) iv2Var.a).getSharedPreferences("com.google.firebase.crashlytics", 0).edit();
            editorEdit2.putString("existing_instance_identifier", str2);
            editorEdit2.apply();
            ((AtomicReference) iv2Var.g).set(w1cVarL);
            ((wfd) ((AtomicReference) iv2Var.h).get()).d(w1cVarL);
        }
        return vp7.x(null);
    }

    public a1a(Context context) {
        this.a = 13;
        vp7.p(context);
        Resources resources = context.getResources();
        this.b = resources;
        this.c = resources.getResourcePackageName(R.string.common_google_play_services_unknown_issue);
    }

    public a1a(qi1 qi1Var, ax2 ax2Var) {
        this.a = 20;
        qi1Var.getClass();
        this.b = qi1Var;
        this.c = ax2Var;
    }

    public a1a(nfb nfbVar, ax2 ax2Var) {
        this.a = 16;
        nfbVar.getClass();
        this.b = nfbVar;
        this.c = ax2Var;
    }

    public a1a(zk2 zk2Var, gn9 gn9Var) {
        this.a = 28;
        zk2Var.getClass();
        gn9Var.getClass();
        this.b = zk2Var;
        this.c = gn9Var;
    }

    public a1a(x38 x38Var, qn7 qn7Var) {
        this.a = 12;
        x38Var.getClass();
        qn7Var.getClass();
        this.b = x38Var;
        this.c = qn7Var;
    }

    public a1a(gn9 gn9Var, ax2 ax2Var) {
        this.a = 22;
        gn9Var.getClass();
        this.b = gn9Var;
        this.c = ax2Var;
    }

    public a1a(zk2 zk2Var, ble bleVar) {
        this.a = 29;
        zk2Var.getClass();
        this.b = bleVar;
        this.c = zk2Var;
    }

    public a1a(hx4 hx4Var, gn9 gn9Var) {
        this.a = 27;
        gn9Var.getClass();
        this.b = hx4Var;
        this.c = gn9Var;
    }

    public a1a(f66 f66Var) {
        this.a = 8;
        f66Var.getClass();
        this.b = f66Var;
        this.c = new LinkedHashMap();
    }

    public a1a(List list) {
        this.a = 23;
        this.b = list;
    }

    public a1a(b1a b1aVar) {
        this.a = 0;
        this.c = b1aVar;
    }

    public a1a(ct2 ct2Var) {
        this.a = 14;
        this.b = ct2Var;
        this.c = new Object();
    }

    public /* synthetic */ a1a(Object obj, int i, Object obj2) {
        this.a = i;
        this.b = obj;
        this.c = obj2;
    }

    public a1a(iv2 iv2Var, m50 m50Var) {
        this.a = 9;
        this.c = iv2Var;
        this.b = m50Var;
    }
}
