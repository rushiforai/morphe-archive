package defpackage;

import android.app.Activity;
import android.content.Intent;
import android.util.Pair;
import android.util.SparseIntArray;
import com.medium.android.publication.ui.editors.PublicationEditorsFragment;
import com.medium.android.publication.ui.writers.PublicationWritersFragment;
import gen.model.SourceParameter;
import java.io.IOException;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class gg5 implements hvc, qnc, gd9, hmc, ul8, j41, kv8, mic, obe {
    public final /* synthetic */ int a;
    public Object b;
    public Object c;

    public gg5(int i) {
        this.a = i;
        switch (i) {
            case 10:
                hud hudVar = d46.i;
                Float fValueOf = Float.valueOf(0.0f);
                this.c = new xw(hudVar, fValueOf, (dx) hudVar.a.invoke(fValueOf), Long.MIN_VALUE, Long.MIN_VALUE, false);
                break;
            case 18:
                this.b = new f78();
                this.c = new f78();
                break;
            case 21:
                this.b = new o78(new aq6[16]);
                break;
            default:
                this.b = new SparseIntArray();
                this.c = new SparseIntArray();
                break;
        }
    }

    public static int D(int i, int i2) {
        int i3 = 0;
        int i4 = 0;
        for (int i5 = 0; i5 < i; i5++) {
            i3++;
            if (i3 == i2) {
                i4++;
                i3 = 0;
            } else if (i3 > i2) {
                i4++;
                i3 = 1;
            }
        }
        return i3 + 1 > i2 ? i4 + 1 : i4;
    }

    public static gg5 X(String... strArr) {
        try {
            h21[] h21VarArr = new h21[strArr.length];
            kz0 kz0Var = new kz0();
            for (int i = 0; i < strArr.length; i++) {
                ud6.g0(kz0Var, strArr[i]);
                kz0Var.readByte();
                h21VarArr[i] = kz0Var.r(kz0Var.b);
            }
            return new gg5((String[]) strArr.clone(), 5, mq7.E(h21VarArr));
        } catch (IOException e) {
            ay0.d(e);
            return null;
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r4v0 */
    /* JADX WARN: Type inference failed for: r4v1, types: [q28] */
    /* JADX WARN: Type inference failed for: r4v10 */
    /* JADX WARN: Type inference failed for: r4v11 */
    /* JADX WARN: Type inference failed for: r4v3 */
    /* JADX WARN: Type inference failed for: r4v4, types: [q28] */
    /* JADX WARN: Type inference failed for: r4v5, types: [java.lang.Object] */
    /* JADX WARN: Type inference failed for: r4v6 */
    /* JADX WARN: Type inference failed for: r4v7 */
    /* JADX WARN: Type inference failed for: r4v8 */
    /* JADX WARN: Type inference failed for: r4v9 */
    /* JADX WARN: Type inference failed for: r5v0 */
    /* JADX WARN: Type inference failed for: r5v1 */
    /* JADX WARN: Type inference failed for: r5v10 */
    /* JADX WARN: Type inference failed for: r5v11 */
    /* JADX WARN: Type inference failed for: r5v2 */
    /* JADX WARN: Type inference failed for: r5v3, types: [o78] */
    /* JADX WARN: Type inference failed for: r5v4 */
    /* JADX WARN: Type inference failed for: r5v5 */
    /* JADX WARN: Type inference failed for: r5v6, types: [o78] */
    /* JADX WARN: Type inference failed for: r5v8 */
    /* JADX WARN: Type inference failed for: r5v9 */
    /* JADX WARN: Type inference failed for: r6v5 */
    public static void z(aq6 aq6Var) {
        if (aq6Var.P > 0) {
            if (aq6Var.G.d == wp6.Idle && !aq6Var.p() && !aq6Var.q() && !aq6Var.Q && aq6Var.I()) {
                q28 q28Var = (q28) aq6Var.F.g;
                if ((q28Var.d & 256) != 0) {
                    while (q28Var != null) {
                        if ((q28Var.c & 256) != 0) {
                            ?? Q0 = q28Var;
                            ?? o78Var = 0;
                            while (Q0 != 0) {
                                if (Q0 instanceof od5) {
                                    od5 od5Var = (od5) Q0;
                                    od5Var.X(flb.t0(od5Var, 256));
                                } else if ((Q0.c & 256) != 0 && (Q0 instanceof b43)) {
                                    q28 q28Var2 = ((b43) Q0).p;
                                    int i = 0;
                                    Q0 = Q0;
                                    o78Var = o78Var;
                                    while (q28Var2 != null) {
                                        if ((q28Var2.c & 256) != 0) {
                                            i++;
                                            o78Var = o78Var;
                                            if (i == 1) {
                                                Q0 = q28Var2;
                                            } else {
                                                if (o78Var == 0) {
                                                    o78Var = new o78(new q28[16]);
                                                }
                                                if (Q0 != 0) {
                                                    o78Var.b(Q0);
                                                    Q0 = 0;
                                                }
                                                o78Var.b(q28Var2);
                                            }
                                        }
                                        q28Var2 = q28Var2.f;
                                        Q0 = Q0;
                                        o78Var = o78Var;
                                    }
                                    if (i == 1) {
                                    }
                                }
                                Q0 = flb.q0(o78Var);
                            }
                        }
                        if ((q28Var.d & 256) == 0) {
                            break;
                        } else {
                            q28Var = q28Var.f;
                        }
                    }
                }
            }
            aq6Var.O = false;
            o78 o78VarZ = aq6Var.z();
            Object[] objArr = o78VarZ.a;
            int i2 = o78VarZ.c;
            for (int i3 = 0; i3 < i2; i3++) {
                z((aq6) objArr[i3]);
            }
        }
    }

    @Override // defpackage.obe
    public void A(SourceParameter sourceParameter, String str, boolean z) {
        switch (this.a) {
            case 27:
                throw ho2.J(sourceParameter, str, "PublicationEditorsScreen doesn't support muting users");
            default:
                throw ho2.J(sourceParameter, str, "PublicationWritersScreen doesn't support muting users");
        }
    }

    public zk7 B() {
        return (zk7) ((k49) this.c).getValue();
    }

    @Override // defpackage.gd9
    public long C(o46 o46Var, long j, ip6 ip6Var, long j2) {
        int i;
        boolean z;
        x45 x45Var = (x45) this.c;
        m73 m73Var = (m73) this.b;
        o46Var.getClass();
        int i2 = o46Var.a;
        ip6Var.getClass();
        int i3 = o46Var.b;
        if (i3 < 0 || i2 < 0 || o46Var.c > (i = (int) (j >> 32))) {
            x45Var.invoke(nt7.a);
            return 0L;
        }
        int iI0 = m73Var.i0(12.0f);
        int i4 = (int) (j2 >> 32);
        int i5 = i4 / 2;
        int iV = iq7.v(((o46Var.d() / 2) + i2) - i5, iI0, (i - i4) - iI0);
        int i6 = o46Var.d;
        int i7 = (int) (j2 & 4294967295L);
        if (i6 < ((int) (j & 4294967295L)) - i7) {
            z = false;
        } else {
            i6 = i3 - i7;
            z = true;
        }
        jy8 jy8Var = mt7.a;
        int iI02 = m73Var.i0(16.0f);
        x45Var.invoke(new ot7(i4 < o46Var.d() ? i5 - (iI02 / 2) : ((o46Var.d() / 2) + (i2 - iV)) - (iI02 / 2), z));
        return (((long) iV) << 32) | (((long) i6) & 4294967295L);
    }

    public void F() {
        ((SparseIntArray) this.b).clear();
    }

    /* JADX WARN: Removed duplicated region for block: B:28:0x009c  */
    /* JADX WARN: Removed duplicated region for block: B:31:0x00b2  */
    /* JADX WARN: Removed duplicated region for block: B:8:0x0016  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public java.lang.Object H(java.lang.String r13, java.lang.String r14, com.medium.android.graphql.type.CatalogType r15, java.util.List r16, defpackage.p92 r17) {
        /*
            Method dump skipped, instruction units count: 273
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.gg5.H(java.lang.String, java.lang.String, com.medium.android.graphql.type.CatalogType, java.util.List, p92):java.lang.Object");
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0019  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public java.lang.Object I(defpackage.p92 r24, gen.model.SourceParameter r25, java.lang.String r26, java.lang.String r27, java.lang.String r28, java.lang.String r29) {
        /*
            Method dump skipped, instruction units count: 211
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.gg5.I(p92, gen.model.SourceParameter, java.lang.String, java.lang.String, java.lang.String, java.lang.String):java.lang.Object");
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public java.lang.Object J(java.lang.String r7, java.lang.String r8, java.lang.String r9, java.lang.String r10, java.lang.String r11, defpackage.p92 r12) {
        /*
            r6 = this;
            boolean r0 = r12 instanceof defpackage.rj5
            if (r0 == 0) goto L13
            r0 = r12
            rj5 r0 = (defpackage.rj5) r0
            int r1 = r0.i
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.i = r1
            goto L18
        L13:
            rj5 r0 = new rj5
            r0.<init>(r6, r12)
        L18:
            java.lang.Object r12 = r0.g
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.i
            r3 = 0
            r4 = 1
            if (r2 == 0) goto L3c
            if (r2 != r4) goto L36
            java.lang.String r11 = r0.f
            java.lang.String r10 = r0.e
            java.lang.String r9 = r0.d
            java.lang.String r8 = r0.c
            java.lang.String r7 = r0.b
            defpackage.br7.v(r12)
            bjb r12 = (defpackage.bjb) r12
            java.lang.Object r12 = r12.a
            goto L56
        L36:
            java.lang.String r6 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r6)
            return r3
        L3c:
            defpackage.br7.v(r12)
            java.lang.Object r12 = r6.b
            nfb r12 = (defpackage.nfb) r12
            r0.b = r7
            r0.c = r8
            r0.d = r9
            r0.e = r10
            r0.f = r11
            r0.i = r4
            java.lang.Object r12 = r12.f(r7, r8, r0)
            if (r12 != r1) goto L56
            return r1
        L56:
            boolean r0 = r12 instanceof defpackage.ajb
            r1 = 0
            java.lang.String r2 = ", response id: "
            if (r0 != 0) goto L74
            r0 = r12
            c1e r0 = (defpackage.c1e) r0
            java.lang.String r0 = "Hide catalog response success. Catalog id: "
            java.lang.String r0 = defpackage.lv8.r(r0, r7, r2, r8)
            uld r4 = defpackage.wld.a
            java.lang.Object[] r5 = new java.lang.Object[r1]
            defpackage.km4.I(r4, r3, r0, r5, r0)
            java.lang.Object r6 = r6.c
            qy2 r6 = (defpackage.qy2) r6
            r6.e(r8, r9, r10, r11)
        L74:
            java.lang.Throwable r6 = defpackage.bjb.b(r12)
            if (r6 == 0) goto L87
            java.lang.String r9 = "Hide catalog response failure. Catalog id: "
            java.lang.String r7 = defpackage.lv8.r(r9, r7, r2, r8)
            uld r8 = defpackage.wld.a
            java.lang.Object[] r9 = new java.lang.Object[r1]
            r8.e(r6, r7, r9)
        L87:
            return r12
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.gg5.J(java.lang.String, java.lang.String, java.lang.String, java.lang.String, java.lang.String, p92):java.lang.Object");
    }

    @Override // defpackage.jt4
    public void L(SourceParameter sourceParameter, String str, String str2, String str3) {
        switch (this.a) {
            case 27:
                ho2.P(sourceParameter, str, str2, str3);
                dda ddaVar = (dda) this.b;
                vx0.c0(f76.F(ddaVar), null, null, new ada(ddaVar, str3, str, str2, sourceParameter, null, 1), 3);
                break;
            default:
                ho2.P(sourceParameter, str, str2, str3);
                eoa eoaVar = (eoa) this.b;
                vx0.c0(f76.F(eoaVar), null, null, new coa(eoaVar, str3, str, str2, sourceParameter, null, 1), 3);
                break;
        }
    }

    @Override // defpackage.jt4
    public void M(String str, SourceParameter sourceParameter) {
        int i = this.a;
        sourceParameter.getClass();
        switch (i) {
            case 27:
                dda ddaVar = (dda) this.b;
                ddaVar.i.e(sourceParameter, str, ddaVar.b, ddaVar.m);
                break;
            default:
                eoa eoaVar = (eoa) this.b;
                eoaVar.c.e(sourceParameter, str, eoaVar.b, eoaVar.m);
                break;
        }
    }

    @Override // defpackage.jt4
    public void N(SourceParameter sourceParameter, String str, String str2) {
        switch (this.a) {
            case 27:
                str2.getClass();
                sourceParameter.getClass();
                dda ddaVar = (dda) this.b;
                vx0.c0(f76.F(ddaVar), null, null, new yca(ddaVar, str, str2, sourceParameter, null, 1), 3);
                break;
            default:
                str2.getClass();
                sourceParameter.getClass();
                eoa eoaVar = (eoa) this.b;
                vx0.c0(f76.F(eoaVar), null, null, new aoa(eoaVar, str, str2, sourceParameter, null, 1), 3);
                break;
        }
    }

    @Override // defpackage.jt4
    public void O(SourceParameter sourceParameter, String str, String str2, String str3) {
        switch (this.a) {
            case 27:
                ho2.O(sourceParameter, str, str2);
                dda ddaVar = (dda) this.b;
                vx0.c0(f76.F(ddaVar), null, null, new ada(ddaVar, str3, str, str2, sourceParameter, null, 0), 3);
                break;
            default:
                ho2.O(sourceParameter, str, str2);
                eoa eoaVar = (eoa) this.b;
                vx0.c0(f76.F(eoaVar), null, null, new coa(eoaVar, str3, str, str2, sourceParameter, null, 0), 3);
                break;
        }
    }

    @Override // defpackage.obe
    public /* bridge */ void P(String str, SourceParameter sourceParameter) {
        switch (this.a) {
            case 27:
                wgd.c(str, sourceParameter);
                break;
            default:
                wgd.c(str, sourceParameter);
                break;
        }
    }

    @Override // defpackage.hvc
    public boolean Q() {
        return true;
    }

    @Override // defpackage.jt4
    public void S(SourceParameter sourceParameter, String str, String str2) {
        switch (this.a) {
            case 27:
                str2.getClass();
                sourceParameter.getClass();
                dda ddaVar = (dda) this.b;
                vx0.c0(f76.F(ddaVar), null, null, new yca(ddaVar, str, str2, sourceParameter, null, 0), 3);
                break;
            default:
                str2.getClass();
                sourceParameter.getClass();
                eoa eoaVar = (eoa) this.b;
                vx0.c0(f76.F(eoaVar), null, null, new aoa(eoaVar, str, str2, sourceParameter, null, 0), 3);
                break;
        }
    }

    @Override // defpackage.jt4
    public void U(String str, SourceParameter sourceParameter) {
        switch (this.a) {
            case 27:
                str.getClass();
                sourceParameter.getClass();
                dda ddaVar = (dda) this.b;
                vx0.c0(f76.F(ddaVar), null, null, new mw9((que) ddaVar, str, (Object) sourceParameter, (n92) null, 5), 3);
                break;
            default:
                str.getClass();
                sourceParameter.getClass();
                eoa eoaVar = (eoa) this.b;
                vx0.c0(f76.F(eoaVar), null, null, new mw9((que) eoaVar, str, (Object) sourceParameter, (n92) null, 11), 3);
                break;
        }
    }

    public boolean W() {
        return !(((Number) ((xw) this.c).b.getValue()).floatValue() == 0.0f);
    }

    public boolean Y() {
        float fFloatValue = Float.valueOf(((osa) this.b).b).floatValue();
        int i = 1;
        if (fFloatValue < 0.0f) {
            f66.e0.getClass();
            f49.K(c66.b, d66.WARN, e66.USER, new osa(i, fFloatValue), null, false, 56);
            fFloatValue = 0.0f;
        } else if (fFloatValue > 100.0f) {
            f66.e0.getClass();
            f49.K(c66.b, d66.WARN, e66.USER, new osa(2, fFloatValue), null, false, 56);
            fFloatValue = 100.0f;
        }
        if (fFloatValue == 0.0f) {
            return false;
        }
        return fFloatValue == 100.0f || ((SecureRandom) ((w5d) this.c).getValue()).nextFloat() * 100.0f <= fFloatValue;
    }

    public void Z() {
        enc encVar = (enc) this.b;
        dx dxVar = null;
        if (encVar != null) {
            encVar.m(null);
        }
        this.c = new xw(d46.i, Float.valueOf(0.0f), dxVar, 60);
    }

    /* JADX WARN: Multi-variable type inference failed */
    public void a0(float f, m73 m73Var, sb2 sb2Var) {
        if (f <= m73Var.Z(1.0f)) {
            return;
        }
        oic oicVarA = vn7.A();
        n92 n92Var = null;
        Object[] objArr = 0;
        x45 x45VarE = oicVarA != null ? oicVarA.e() : null;
        oic oicVarG = vn7.G(oicVarA);
        try {
            float fFloatValue = ((Number) ((xw) this.c).b.getValue()).floatValue();
            enc encVar = (enc) this.b;
            if (encVar != null) {
                encVar.m(null);
            }
            xw xwVar = (xw) this.c;
            if (xwVar.f) {
                this.c = g76.T(xwVar, fFloatValue - f, 0.0f, 30);
            } else {
                this.c = new xw(d46.i, Float.valueOf(-f), objArr == true ? 1 : 0, 60);
            }
            this.b = vx0.c0(sb2Var, null, null, new m1(this, n92Var, 26), 3);
            vn7.T(oicVarA, oicVarG, x45VarE);
        } catch (Throwable th) {
            vn7.T(oicVarA, oicVarG, x45VarE);
            throw th;
        }
    }

    @Override // defpackage.hvc
    public ivc apply() {
        return ((nq6) this.b).e(this.c);
    }

    @Override // defpackage.hvc
    public boolean b(lt ltVar) {
        return true;
    }

    @Override // defpackage.qnc
    public void d(Intent intent, int i) {
        final my6 my6Var = new my6();
        q7 q7VarC = ((m15) this.b).getActivityResultRegistry().c("facebook-login", new g7(8), new d7() { // from class: z97
            @Override // defpackage.d7
            public final void onActivityResult(Object obj) {
                Pair pair = (Pair) obj;
                o41 o41Var = (o41) this.a.c;
                int requestCode = n41.Login.toRequestCode();
                Object obj2 = pair.first;
                obj2.getClass();
                o41Var.a(requestCode, ((Number) obj2).intValue(), (Intent) pair.second);
                my6 my6Var2 = my6Var;
                q7 q7Var = (q7) my6Var2.a;
                if (q7Var != null) {
                    q7Var.b();
                }
                my6Var2.a = null;
            }
        });
        my6Var.a = q7VarC;
        q7VarC.a(intent, null);
    }

    @Override // defpackage.qnc
    public Activity f() {
        return (m15) this.b;
    }

    @Override // defpackage.mic
    public float i(float f, float f2) {
        gz8 gz8Var = (gz8) this.b;
        int iP = gz8Var.p();
        k49 k49Var = gz8Var.m;
        int i = ((yy8) k49Var.getValue()).c + iP;
        if (i == 0) {
            return 0.0f;
        }
        int i2 = gz8Var.e;
        if (f < 0.0f) {
            i2++;
        }
        int iV = iq7.v(((int) (f2 / i)) + i2, 0, gz8Var.o());
        gz8Var.p();
        int i3 = ((yy8) k49Var.getValue()).c;
        long j = i2;
        long j2 = j - 1;
        if (j2 < 0) {
            j2 = 0;
        }
        int i4 = (int) j2;
        long j3 = j + 1;
        if (j3 > 2147483647L) {
            j3 = 2147483647L;
        }
        int iAbs = Math.abs((iq7.v(iq7.v(iV, i4, (int) j3), 0, gz8Var.o()) - i2) * i) - i;
        int i5 = iAbs >= 0 ? iAbs : 0;
        if (i5 == 0) {
            return i5;
        }
        return Math.signum(f) * i5;
    }

    @Override // defpackage.hmc
    public StackTraceElement[] n(StackTraceElement[] stackTraceElementArr) {
        if (stackTraceElementArr.length <= 1024) {
            return stackTraceElementArr;
        }
        hmc[] hmcVarArr = (hmc[]) this.b;
        StackTraceElement[] stackTraceElementArrN = stackTraceElementArr;
        for (int i = 0; i < 1; i++) {
            hmc hmcVar = hmcVarArr[i];
            if (stackTraceElementArrN.length <= 1024) {
                break;
            }
            stackTraceElementArrN = hmcVar.n(stackTraceElementArr);
        }
        return stackTraceElementArrN.length > 1024 ? ((y3b) this.c).n(stackTraceElementArrN) : stackTraceElementArrN;
    }

    @Override // defpackage.j41
    public void o(cva cvaVar, adb adbVar) {
        i41 i41Var = (i41) this.b;
        sp8 sp8Var = (sp8) this.c;
        try {
            try {
                i41Var.f(sp8Var, sp8Var.c(adbVar));
            } catch (Throwable th) {
                vv2.Y(th);
                th.printStackTrace();
            }
        } catch (Throwable th2) {
            vv2.Y(th2);
            try {
                i41Var.w(sp8Var, th2);
            } catch (Throwable th3) {
                vv2.Y(th3);
                th3.printStackTrace();
            }
        }
    }

    @Override // defpackage.obe, defpackage.e9d
    public void p(String str, SourceParameter sourceParameter) {
        int i = this.a;
        str.getClass();
        switch (i) {
            case 27:
                PublicationEditorsFragment publicationEditorsFragment = (PublicationEditorsFragment) ((my6) this.c).a;
                ((p13) publicationEditorsFragment.Z()).Q(publicationEditorsFragment.S(), str, gp7.u(sourceParameter));
                break;
            default:
                PublicationWritersFragment publicationWritersFragment = (PublicationWritersFragment) ((my6) this.c).a;
                ((p13) publicationWritersFragment.Z()).Q(publicationWritersFragment.S(), str, gp7.u(sourceParameter));
                break;
        }
    }

    @Override // defpackage.mic
    public float r(float f) {
        gz8 gz8Var = (gz8) this.b;
        hpe hpeVar = gz8Var.n().n;
        List list = gz8Var.n().a;
        int size = list.size();
        float f2 = Float.NEGATIVE_INFINITY;
        float f3 = Float.POSITIVE_INFINITY;
        for (int i = 0; i < size; i++) {
            el7 el7Var = (el7) list.get(i);
            lk7.u(gz8Var.n());
            int i2 = gz8Var.n().f;
            int i3 = gz8Var.n().d;
            int i4 = gz8Var.n().b;
            int i5 = el7Var.j;
            gz8Var.o();
            hpeVar.getClass();
            float f4 = i5 - 0.0f;
            if (f4 <= 0.0f && f4 > f2) {
                f2 = f4;
            }
            if (f4 >= 0.0f && f4 < f3) {
                f3 = f4;
            }
        }
        if (f2 == Float.NEGATIVE_INFINITY) {
            f2 = f3;
        }
        if (f3 == Float.POSITIVE_INFINITY) {
            f3 = f2;
        }
        if (!gz8Var.d()) {
            if (qk7.v(gz8Var, f)) {
                f2 = 0.0f;
                f3 = 0.0f;
            } else {
                f3 = 0.0f;
            }
        }
        if (!gz8Var.c()) {
            f2 = 0.0f;
            if (!qk7.v(gz8Var, f)) {
                f3 = 0.0f;
            }
        }
        Float fValueOf = Float.valueOf(f2);
        Float fValueOf2 = Float.valueOf(f3);
        float fFloatValue = fValueOf.floatValue();
        float fFloatValue2 = fValueOf2.floatValue();
        float fFloatValue3 = ((Number) ((g64) this.c).f(Float.valueOf(f), Float.valueOf(fFloatValue), Float.valueOf(fFloatValue2))).floatValue();
        if (fFloatValue3 != fFloatValue && fFloatValue3 != fFloatValue2 && fFloatValue3 != 0.0f) {
            e26.c("Final Snapping Offset Should Be one of " + fFloatValue + ", " + fFloatValue2 + " or 0.0");
        }
        if (fFloatValue3 == Float.POSITIVE_INFINITY || fFloatValue3 == Float.NEGATIVE_INFINITY) {
            return 0.0f;
        }
        return fFloatValue3;
    }

    @Override // defpackage.kv8
    public List s(Integer num) {
        List listS = ((kv8) this.b).s(null);
        igc igcVar = (igc) this.c;
        int i = igcVar.v;
        return i < 0 ? listS : bu1.Q0(listS, sgg.C(igcVar, num, i, Integer.valueOf(igcVar.D(i, igcVar.b))));
    }

    public String toString() {
        switch (this.a) {
            case 7:
                return (String) this.b;
            default:
                return super.toString();
        }
    }

    @Override // defpackage.kv8
    public boolean u() {
        return ((kv8) this.b).u();
    }

    @Override // defpackage.j41
    public void w(cva cvaVar, IOException iOException) {
        try {
            ((i41) this.b).w((sp8) this.c, iOException);
        } catch (Throwable th) {
            vv2.Y(th);
            th.printStackTrace();
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:6:0x0019  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public void x() {
        /*
            r6 = this;
            java.lang.Object r0 = r6.b
            o78 r0 = (defpackage.o78) r0
            js4 r1 = defpackage.js4.e
            java.lang.Object[] r2 = r0.a
            int r3 = r0.c
            r4 = 0
            java.util.Arrays.sort(r2, r4, r3, r1)
            int r1 = r0.c
            java.lang.Object r2 = r6.c
            aq6[] r2 = (defpackage.aq6[]) r2
            if (r2 == 0) goto L19
            int r3 = r2.length
            if (r3 >= r1) goto L21
        L19:
            r2 = 16
            int r2 = java.lang.Math.max(r2, r1)
            aq6[] r2 = new defpackage.aq6[r2]
        L21:
            r3 = 0
            r6.c = r3
        L24:
            if (r4 >= r1) goto L2f
            java.lang.Object[] r5 = r0.a
            r5 = r5[r4]
            r2[r4] = r5
            int r4 = r4 + 1
            goto L24
        L2f:
            r0.i()
            int r1 = r1 + (-1)
        L34:
            r0 = -1
            if (r0 >= r1) goto L48
            r0 = r2[r1]
            r0.getClass()
            boolean r4 = r0.O
            if (r4 == 0) goto L43
            z(r0)
        L43:
            r2[r1] = r3
            int r1 = r1 + (-1)
            goto L34
        L48:
            r6.c = r2
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.gg5.x():void");
    }

    @Override // defpackage.obe, defpackage.e9d
    public void y(String str, SourceParameter sourceParameter) {
        int i = this.a;
        str.getClass();
        switch (i) {
            case 27:
                dda ddaVar = (dda) this.b;
                if (ddaVar.o.add(str)) {
                    ddaVar.f.x0(str, ddaVar.b, gp7.u(sourceParameter), ddaVar.m);
                }
                break;
            default:
                eoa eoaVar = (eoa) this.b;
                if (eoaVar.o.add(str)) {
                    eoaVar.g.x0(str, eoaVar.b, gp7.u(sourceParameter), eoaVar.m);
                }
                break;
        }
    }

    @Override // defpackage.hvc
    public void cancel() {
    }

    public /* synthetic */ gg5(Object obj, int i, Object obj2) {
        this.a = i;
        this.b = obj;
        this.c = obj2;
    }

    public gg5(nfb nfbVar, qy2 qy2Var) {
        this.a = 1;
        nfbVar.getClass();
        this.b = nfbVar;
        this.c = qy2Var;
    }

    public gg5(qi1 qi1Var, yo8 yo8Var) {
        this.a = 25;
        qi1Var.getClass();
        this.b = qi1Var;
        this.c = yo8Var;
    }

    public gg5(zk2 zk2Var, kb2 kb2Var) {
        this.a = 3;
        zk2Var.getClass();
        this.b = zk2Var;
        this.c = kb2Var;
    }

    public gg5(m73 m73Var, x45 x45Var) {
        this.a = 15;
        m73Var.getClass();
        x45Var.getClass();
        this.b = m73Var;
        this.c = x45Var;
    }

    public gg5(float f) {
        this.a = 29;
        this.b = new osa(0, f);
        this.c = new w5d(b18.i);
    }

    public gg5(hmc[] hmcVarArr) {
        this.a = 16;
        this.b = hmcVarArr;
        this.c = new y3b(19);
    }

    public gg5(aq6 aq6Var, zk7 zk7Var) {
        this.a = 2;
        this.b = aq6Var;
        this.c = qo7.u(zk7Var);
    }

    public gg5(gz8 gz8Var, g64 g64Var, az8 az8Var) {
        this.a = 23;
        this.b = gz8Var;
        this.c = g64Var;
    }

    public gg5(Map map) {
        this.a = 19;
        this.b = map;
        this.c = new x67("Java nullability annotation states").c(new z(24, this));
    }

    public gg5(sp8 sp8Var, i41 i41Var) {
        this.a = 20;
        this.c = sp8Var;
        this.b = i41Var;
    }

    public gg5(String str) {
        this.a = 7;
        str.getClass();
        this.b = str;
        this.c = new ArrayList(0);
        sz7.a.getClass();
        List listA = rz7.a();
        new ArrayList();
        Iterator it2 = listA.iterator();
        while (it2.hasNext()) {
            ((sz7) it2.next()).getClass();
        }
    }

    public /* synthetic */ gg5(int i, boolean z) {
        this.a = i;
    }
}
