package defpackage;

import android.content.Context;
import android.content.res.Resources;
import android.view.KeyEvent;
import com.drew.metadata.exif.makernotes.PanasonicMakernoteDirectory;
import com.drew.metadata.photoshop.PhotoshopDirectory;
import com.google.firebase.auth.FirebaseAuth;
import com.medium.reader.R;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Locale;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class br7 {
    public static final /* synthetic */ int a = 0;
    public static final /* synthetic */ int b = 0;
    public static final /* synthetic */ int c = 0;
    public static final float d = 0.38f;
    public static final /* synthetic */ int e = 0;

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r10v0, types: [a43, java.lang.Object, ssd] */
    /* JADX WARN: Type inference failed for: r11v0, types: [x45] */
    /* JADX WARN: Type inference failed for: r2v12 */
    /* JADX WARN: Type inference failed for: r2v13, types: [q28] */
    /* JADX WARN: Type inference failed for: r2v14, types: [java.lang.Object] */
    /* JADX WARN: Type inference failed for: r2v15 */
    /* JADX WARN: Type inference failed for: r2v16 */
    /* JADX WARN: Type inference failed for: r2v17 */
    /* JADX WARN: Type inference failed for: r2v18 */
    /* JADX WARN: Type inference failed for: r2v19 */
    /* JADX WARN: Type inference failed for: r2v20 */
    /* JADX WARN: Type inference failed for: r2v7 */
    /* JADX WARN: Type inference failed for: r2v8, types: [q28] */
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
    /* JADX WARN: Type inference failed for: r6v7 */
    public static final void A(ssd ssdVar, x45 x45Var) {
        hj0 hj0Var;
        q28 q28Var = (q28) ssdVar;
        if (!q28Var.a.n) {
            b26.b("visitAncestors called on an unattached node");
        }
        q28 q28Var2 = q28Var.a.e;
        aq6 aq6VarV0 = flb.v0(ssdVar);
        while (aq6VarV0 != null) {
            if ((((q28) aq6VarV0.F.g).d & 262144) != 0) {
                while (q28Var2 != null) {
                    if ((q28Var2.c & 262144) != 0) {
                        ?? Q0 = q28Var2;
                        ?? o78Var = 0;
                        while (Q0 != 0) {
                            boolean zBooleanValue = true;
                            if (Q0 instanceof ssd) {
                                ssd ssdVar2 = (ssd) Q0;
                                if (g76.L(ssdVar.m(), ssdVar2.m()) && ssdVar.getClass() == ssdVar2.getClass()) {
                                    zBooleanValue = ((Boolean) x45Var.invoke(ssdVar2)).booleanValue();
                                }
                                if (!zBooleanValue) {
                                    return;
                                }
                            } else if ((Q0.c & 262144) != 0 && (Q0 instanceof b43)) {
                                q28 q28Var3 = ((b43) Q0).p;
                                int i = 0;
                                Q0 = Q0;
                                o78Var = o78Var;
                                while (q28Var3 != null) {
                                    if ((q28Var3.c & 262144) != 0) {
                                        i++;
                                        o78Var = o78Var;
                                        if (i == 1) {
                                            Q0 = q28Var3;
                                        } else {
                                            if (o78Var == 0) {
                                                o78Var = new o78(new q28[16]);
                                            }
                                            if (Q0 != 0) {
                                                o78Var.b(Q0);
                                                Q0 = 0;
                                            }
                                            o78Var.b(q28Var3);
                                        }
                                    }
                                    q28Var3 = q28Var3.f;
                                    Q0 = Q0;
                                    o78Var = o78Var;
                                }
                                if (i == 1) {
                                }
                            }
                            Q0 = flb.q0(o78Var);
                        }
                    }
                    q28Var2 = q28Var2.e;
                }
            }
            aq6VarV0 = aq6VarV0.v();
            q28Var2 = (aq6VarV0 == null || (hj0Var = aq6VarV0.F) == null) ? null : (ffd) hj0Var.f;
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r13v0, types: [x45] */
    /* JADX WARN: Type inference failed for: r5v0 */
    /* JADX WARN: Type inference failed for: r5v1, types: [q28] */
    /* JADX WARN: Type inference failed for: r5v10 */
    /* JADX WARN: Type inference failed for: r5v11 */
    /* JADX WARN: Type inference failed for: r5v12 */
    /* JADX WARN: Type inference failed for: r5v13 */
    /* JADX WARN: Type inference failed for: r5v14 */
    /* JADX WARN: Type inference failed for: r5v15 */
    /* JADX WARN: Type inference failed for: r5v7 */
    /* JADX WARN: Type inference failed for: r5v8, types: [q28] */
    /* JADX WARN: Type inference failed for: r5v9, types: [java.lang.Object] */
    /* JADX WARN: Type inference failed for: r6v0 */
    /* JADX WARN: Type inference failed for: r6v1 */
    /* JADX WARN: Type inference failed for: r6v10 */
    /* JADX WARN: Type inference failed for: r6v11 */
    /* JADX WARN: Type inference failed for: r6v2 */
    /* JADX WARN: Type inference failed for: r6v3, types: [o78] */
    /* JADX WARN: Type inference failed for: r6v4 */
    /* JADX WARN: Type inference failed for: r6v5 */
    /* JADX WARN: Type inference failed for: r6v6, types: [o78] */
    /* JADX WARN: Type inference failed for: r6v8 */
    /* JADX WARN: Type inference failed for: r6v9 */
    /* JADX WARN: Type inference failed for: r7v8 */
    public static final void B(q28 q28Var, String str, x45 x45Var) {
        if (!q28Var.a.n) {
            b26.b("visitSubtreeIf called on an unattached node");
        }
        o78 o78Var = new o78(new q28[16]);
        q28 q28Var2 = q28Var.a;
        q28 q28Var3 = q28Var2.f;
        if (q28Var3 == null) {
            flb.X(o78Var, q28Var2);
        } else {
            o78Var.b(q28Var3);
        }
        while (true) {
            int i = o78Var.c;
            if (i == 0) {
                return;
            }
            q28 q28Var4 = (q28) o78Var.m(i - 1);
            if ((q28Var4.d & 262144) != 0) {
                for (q28 q28Var5 = q28Var4; q28Var5 != null && q28Var5.n; q28Var5 = q28Var5.f) {
                    if ((q28Var5.c & 262144) != 0) {
                        ?? Q0 = q28Var5;
                        ?? o78Var2 = 0;
                        while (Q0 != 0) {
                            if (Q0 instanceof ssd) {
                                ssd ssdVar = (ssd) Q0;
                                rsd rsdVar = str.equals(ssdVar.m()) ? (rsd) x45Var.invoke(ssdVar) : rsd.ContinueTraversal;
                                if (rsdVar == rsd.CancelTraversal) {
                                    return;
                                }
                                if (rsdVar == rsd.SkipSubtreeAndContinueTraversal) {
                                    break;
                                }
                            } else if ((Q0.c & 262144) != 0 && (Q0 instanceof b43)) {
                                q28 q28Var6 = ((b43) Q0).p;
                                int i2 = 0;
                                Q0 = Q0;
                                o78Var2 = o78Var2;
                                while (q28Var6 != null) {
                                    if ((q28Var6.c & 262144) != 0) {
                                        i2++;
                                        o78Var2 = o78Var2;
                                        if (i2 == 1) {
                                            Q0 = q28Var6;
                                        } else {
                                            if (o78Var2 == 0) {
                                                o78Var2 = new o78(new q28[16]);
                                            }
                                            if (Q0 != 0) {
                                                o78Var2.b(Q0);
                                                Q0 = 0;
                                            }
                                            o78Var2.b(q28Var6);
                                        }
                                    }
                                    q28Var6 = q28Var6.f;
                                    Q0 = Q0;
                                    o78Var2 = o78Var2;
                                }
                                if (i2 == 1) {
                                }
                            }
                            Q0 = flb.q0(o78Var2);
                        }
                    }
                }
            }
            flb.X(o78Var, q28Var4);
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r12v0, types: [java.lang.Object, ssd] */
    /* JADX WARN: Type inference failed for: r13v0, types: [x45] */
    /* JADX WARN: Type inference failed for: r6v0 */
    /* JADX WARN: Type inference failed for: r6v1, types: [q28] */
    /* JADX WARN: Type inference failed for: r6v10 */
    /* JADX WARN: Type inference failed for: r6v11 */
    /* JADX WARN: Type inference failed for: r6v12 */
    /* JADX WARN: Type inference failed for: r6v13 */
    /* JADX WARN: Type inference failed for: r6v14 */
    /* JADX WARN: Type inference failed for: r6v15 */
    /* JADX WARN: Type inference failed for: r6v7 */
    /* JADX WARN: Type inference failed for: r6v8, types: [q28] */
    /* JADX WARN: Type inference failed for: r6v9, types: [java.lang.Object] */
    /* JADX WARN: Type inference failed for: r7v0 */
    /* JADX WARN: Type inference failed for: r7v1 */
    /* JADX WARN: Type inference failed for: r7v10 */
    /* JADX WARN: Type inference failed for: r7v11 */
    /* JADX WARN: Type inference failed for: r7v2 */
    /* JADX WARN: Type inference failed for: r7v3, types: [o78] */
    /* JADX WARN: Type inference failed for: r7v4 */
    /* JADX WARN: Type inference failed for: r7v5 */
    /* JADX WARN: Type inference failed for: r7v6, types: [o78] */
    /* JADX WARN: Type inference failed for: r7v8 */
    /* JADX WARN: Type inference failed for: r7v9 */
    /* JADX WARN: Type inference failed for: r8v9 */
    public static final void C(ssd ssdVar, x45 x45Var) {
        q28 q28Var = (q28) ssdVar;
        if (!q28Var.a.n) {
            b26.b("visitSubtreeIf called on an unattached node");
        }
        o78 o78Var = new o78(new q28[16]);
        q28 q28Var2 = q28Var.a;
        q28 q28Var3 = q28Var2.f;
        if (q28Var3 == null) {
            flb.X(o78Var, q28Var2);
        } else {
            o78Var.b(q28Var3);
        }
        while (true) {
            int i = o78Var.c;
            if (i == 0) {
                return;
            }
            q28 q28Var4 = (q28) o78Var.m(i - 1);
            if ((q28Var4.d & 262144) != 0) {
                for (q28 q28Var5 = q28Var4; q28Var5 != null && q28Var5.n; q28Var5 = q28Var5.f) {
                    if ((q28Var5.c & 262144) != 0) {
                        ?? Q0 = q28Var5;
                        ?? o78Var2 = 0;
                        while (Q0 != 0) {
                            if (Q0 instanceof ssd) {
                                ssd ssdVar2 = (ssd) Q0;
                                rsd rsdVar = (g76.L(ssdVar.m(), ssdVar2.m()) && ssdVar.getClass() == ssdVar2.getClass()) ? (rsd) x45Var.invoke(ssdVar2) : rsd.ContinueTraversal;
                                if (rsdVar == rsd.CancelTraversal) {
                                    return;
                                }
                                if (rsdVar == rsd.SkipSubtreeAndContinueTraversal) {
                                    break;
                                }
                            } else if ((Q0.c & 262144) != 0 && (Q0 instanceof b43)) {
                                q28 q28Var6 = ((b43) Q0).p;
                                int i2 = 0;
                                Q0 = Q0;
                                o78Var2 = o78Var2;
                                while (q28Var6 != null) {
                                    if ((q28Var6.c & 262144) != 0) {
                                        i2++;
                                        o78Var2 = o78Var2;
                                        if (i2 == 1) {
                                            Q0 = q28Var6;
                                        } else {
                                            if (o78Var2 == 0) {
                                                o78Var2 = new o78(new q28[16]);
                                            }
                                            if (Q0 != 0) {
                                                o78Var2.b(Q0);
                                                Q0 = 0;
                                            }
                                            o78Var2.b(q28Var6);
                                        }
                                    }
                                    q28Var6 = q28Var6.f;
                                    Q0 = Q0;
                                    o78Var2 = o78Var2;
                                }
                                if (i2 == 1) {
                                }
                            }
                            Q0 = flb.q0(o78Var2);
                        }
                    }
                }
            }
            flb.X(o78Var, q28Var4);
        }
    }

    public static void F(Object obj, Object obj2) {
        if (obj == null) {
            z72.c("null key in entry: null=".concat(String.valueOf(obj2)));
        } else {
            if (obj2 != null) {
                return;
            }
            String string = obj.toString();
            z72.c(y30.s(new StringBuilder(string.length() + 26), "null value in entry: ", string, "=null"));
        }
    }

    public static void G(int i, String str) {
        if (i >= 0) {
            return;
        }
        StringBuilder sb = new StringBuilder(str.length() + 29 + String.valueOf(i).length());
        sb.append(str);
        sb.append(" cannot be negative but was: ");
        sb.append(i);
        throw new IllegalArgumentException(sb.toString());
    }

    /* JADX WARN: Removed duplicated region for block: B:23:0x0042  */
    /* JADX WARN: Removed duplicated region for block: B:26:0x004d  */
    /* JADX WARN: Removed duplicated region for block: B:30:0x0059  */
    /* JADX WARN: Removed duplicated region for block: B:31:0x005b  */
    /* JADX WARN: Removed duplicated region for block: B:34:0x0064  */
    /* JADX WARN: Removed duplicated region for block: B:58:0x00ff  */
    /* JADX WARN: Removed duplicated region for block: B:61:0x010d  */
    /* JADX WARN: Removed duplicated region for block: B:63:? A[RETURN, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final void a(defpackage.r28 r21, java.lang.Float r22, float r23, long r24, defpackage.x12 r26, int r27, int r28) {
        /*
            Method dump skipped, instruction units count: 281
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.br7.a(r28, java.lang.Float, float, long, x12, int, int):void");
    }

    /* JADX WARN: Removed duplicated region for block: B:15:0x0030  */
    /* JADX WARN: Removed duplicated region for block: B:16:0x0032  */
    /* JADX WARN: Removed duplicated region for block: B:19:0x003b  */
    /* JADX WARN: Removed duplicated region for block: B:34:0x00b2  */
    /* JADX WARN: Removed duplicated region for block: B:37:0x00c2  */
    /* JADX WARN: Removed duplicated region for block: B:39:? A[RETURN, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final void b(defpackage.r28 r21, java.lang.Float r22, long r23, long r25, defpackage.x12 r27, final int r28, final int r29) {
        /*
            Method dump skipped, instruction units count: 206
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.br7.b(r28, java.lang.Float, long, long, x12, int, int):void");
    }

    public static final void c(oh8 oh8Var, md5 md5Var, r28 r28Var, x12 x12Var, int i) {
        r28 r28Var2;
        String str;
        float f;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(1730374797);
        int i2 = i | (p65Var.f(oh8Var) ? 4 : 2) | (p65Var.f(md5Var) ? 32 : 16) | 384;
        if (p65Var.P(i2 & 1, (i2 & 147) != 146)) {
            o28 o28Var = o28.b;
            r28 r28VarG = w2g.G(o28Var, 0.0f, 0.0f, 0.0f, 24.0f, 7);
            Object objM = p65Var.M();
            uob uobVar = w12.a;
            if (objM == uobVar) {
                objM = new hb8(6);
                p65Var.j0(objM);
            }
            r28 r28VarD = jfc.d(jfc.r(bgf.N(wxb.a(r28VarG, false, (x45) objM), "non_moc_upsell"), 3), 1.0f);
            zk7 zk7VarC = dy0.c(z46.h, false);
            long j = p65Var.T;
            int i3 = (int) (j ^ (j >>> 32));
            i89 i89VarL = p65Var.l();
            r28 r28VarR = gx1.R(p65Var, r28VarD);
            r12.W.getClass();
            ot2 ot2Var = q12.b;
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            cu cuVar = q12.f;
            tp7.B(p65Var, cuVar, zk7VarC);
            cu cuVar2 = q12.e;
            tp7.B(p65Var, cuVar2, i89VarL);
            Integer numValueOf = Integer.valueOf(i3);
            cu cuVar3 = q12.g;
            tp7.B(p65Var, cuVar3, numValueOf);
            fn fnVar = q12.h;
            tp7.y(p65Var, fnVar);
            cu cuVar4 = q12.d;
            tp7.B(p65Var, cuVar4, r28VarR);
            r28 r28VarD2 = jfc.d(jfc.o(o28Var, 0.0f, 0.0f, 600.0f, 0.0f, 11), 1.0f);
            zk7 zk7VarC2 = dy0.c(z46.d, false);
            long j2 = p65Var.T;
            int i4 = (int) (j2 ^ (j2 >>> 32));
            i89 i89VarL2 = p65Var.l();
            r28 r28VarR2 = gx1.R(p65Var, r28VarD2);
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, cuVar, zk7VarC2);
            tp7.B(p65Var, cuVar2, i89VarL2);
            ka1.z(i4, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR2);
            Context context = (Context) p65Var.j(eo.b);
            context.getClass();
            float f2 = r2.widthPixels / context.getResources().getDisplayMetrics().density;
            boolean z = (vj3.a(f2, 600.0f) < 0 ? ip7.COMPACT : vj3.a(f2, 840.0f) < 0 ? ip7.MEDIUM : ip7.EXPANDED) == ip7.COMPACT;
            if (z) {
                str = oh8Var.d;
                f = 24.0f;
            } else {
                str = oh8Var.c;
                f = 0.0f;
            }
            k40.c(u57.a.a(new nh8(z, (Resources) p65Var.j(eo.c))), pxf.E(628999962, new dj3(oh8Var, f, md5Var, str), p65Var), p65Var, 56);
            p65Var.p(true);
            p65Var.p(true);
            boolean z2 = ((i2 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32) | ((i2 & 14) == 4);
            Object objM2 = p65Var.M();
            if (z2 || objM2 == uobVar) {
                objM2 = new rc0(md5Var, oh8Var, null, 24);
                p65Var.j0(objM2);
            }
            kyd.k(p65Var, (b55) objM2, c1e.a);
            r28Var2 = o28Var;
        } else {
            p65Var.S();
            r28Var2 = r28Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new ho5(i, 17, oh8Var, md5Var, r28Var2);
        }
    }

    public static final void d(m45 m45Var, m45 m45Var2, m45 m45Var3, r28 r28Var, x12 x12Var, int i) {
        r28 r28Var2;
        m45Var.getClass();
        m45Var2.getClass();
        m45Var3.getClass();
        p65 p65Var = (p65) x12Var;
        p65Var.a0(2021627844);
        int i2 = i | (p65Var.h(m45Var) ? 4 : 2) | (p65Var.h(m45Var2) ? 32 : 16) | (p65Var.h(m45Var3) ? 256 : 128) | 3072;
        if (p65Var.P(i2 & 1, (i2 & 1171) != 1170)) {
            v7c v7cVarF = t18.f(6, 2, p65Var);
            Object objM = p65Var.M();
            uob uobVar = w12.a;
            if (objM == uobVar) {
                objM = kyd.M(p65Var);
                p65Var.j0(objM);
            }
            sb2 sb2Var = (sb2) objM;
            boolean zH = p65Var.h(sb2Var) | p65Var.f(v7cVarF) | ((i2 & 896) == 256);
            Object objM2 = p65Var.M();
            if (zH || objM2 == uobVar) {
                a57 a57Var = new a57(sb2Var, v7cVarF, m45Var3, 2, false);
                p65Var.j0(a57Var);
                objM2 = a57Var;
            }
            m45 m45Var4 = (m45) objM2;
            mz1 mz1VarE = pxf.E(-1306553848, new g91(sb2Var, v7cVarF, m45Var3, m45Var, m45Var2, 19), p65Var);
            o28 o28Var = o28.b;
            qq7.a(m45Var4, o28Var, v7cVarF, mz1VarE, p65Var, 3120, 0);
            r28Var2 = o28Var;
        } else {
            p65Var.S();
            r28Var2 = r28Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new mw8(m45Var, m45Var2, m45Var3, r28Var2, i, 0);
        }
    }

    public static final void e(m45 m45Var, m45 m45Var2, m45 m45Var3, r28 r28Var, x12 x12Var, int i) {
        r28 r28Var2;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(1283948271);
        int i2 = i | (p65Var.h(m45Var) ? 4 : 2) | (p65Var.h(m45Var2) ? 32 : 16) | (p65Var.h(m45Var3) ? 256 : 128) | 3072;
        if (p65Var.P(i2 & 1, (i2 & 1171) != 1170)) {
            String strR = vo7.R(p65Var, R.string.out_of_storage_modal_title);
            String strR2 = vo7.R(p65Var, R.string.out_of_storage_modal_text);
            String strR3 = vo7.R(p65Var, R.string.out_of_storage_modal_positive_cta);
            String strR4 = vo7.R(p65Var, R.string.out_of_storage_modal_negative_cta);
            int i3 = ((i2 >> 3) & PhotoshopDirectory.TAG_CAPTION) | ((i2 << 15) & 458752) | ((i2 << 18) & 29360128);
            o28 o28Var = o28.b;
            vv2.s(strR, m45Var3, o28Var, strR2, strR3, m45Var, strR4, m45Var2, p65Var, i3, 0);
            r28Var2 = o28Var;
        } else {
            p65Var.S();
            r28Var2 = r28Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new mw8(m45Var, m45Var2, m45Var3, r28Var2, i, 1);
        }
    }

    public static final void f(x12 x12Var, int i) {
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-1368453136);
        if (p65Var.P(i & 1, i != 0)) {
            r28 r28VarD = jfc.d(o28.b, 1.0f);
            wv1 wv1VarA = uv1.a(new h70(8.0f, true, new z10(21)), z46.q, p65Var, 54);
            long j = p65Var.T;
            int i2 = (int) (j ^ (j >>> 32));
            i89 i89VarL = p65Var.l();
            r28 r28VarR = gx1.R(p65Var, r28VarD);
            r12.W.getClass();
            ot2 ot2Var = q12.b;
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, q12.f, wv1VarA);
            tp7.B(p65Var, q12.e, i89VarL);
            tp7.B(p65Var, q12.g, Integer.valueOf(i2));
            tp7.y(p65Var, q12.h);
            tp7.B(p65Var, q12.d, r28VarR);
            a(null, null, 0.0f, 0L, p65Var, 0, 15);
            a(null, Float.valueOf(0.5f), 0.0f, 0L, p65Var, 48, 13);
            b(null, null, 0L, 0L, p65Var, 0, 31);
            b(null, Float.valueOf(0.25f), 0L, 0L, p65Var, 48, 29);
            p65Var = p65Var;
            p65Var.p(true);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new wn7(i, 16);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:102:0x01f7  */
    /* JADX WARN: Removed duplicated region for block: B:107:0x0212  */
    /* JADX WARN: Removed duplicated region for block: B:69:0x00d1  */
    /* JADX WARN: Removed duplicated region for block: B:72:0x00eb  */
    /* JADX WARN: Removed duplicated region for block: B:73:0x00ee  */
    /* JADX WARN: Removed duplicated region for block: B:77:0x00f8  */
    /* JADX WARN: Removed duplicated region for block: B:82:0x0137  */
    /* JADX WARN: Removed duplicated region for block: B:83:0x0139  */
    /* JADX WARN: Removed duplicated region for block: B:89:0x0145  */
    /* JADX WARN: Removed duplicated region for block: B:92:0x016d  */
    /* JADX WARN: Removed duplicated region for block: B:93:0x016f  */
    /* JADX WARN: Removed duplicated region for block: B:99:0x017b  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final void g(defpackage.uid r30, boolean r31, boolean r32, defpackage.pub r33, defpackage.r28 r34, java.lang.String r35, defpackage.x12 r36, int r37, int r38) {
        /*
            Method dump skipped, instruction units count: 585
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.br7.g(uid, boolean, boolean, pub, r28, java.lang.String, x12, int, int):void");
    }

    public static final void h(m45 m45Var, m45 m45Var2, x12 x12Var, int i) {
        int i2;
        p65 p65Var;
        m45Var.getClass();
        m45Var2.getClass();
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(1299989235);
        if ((i & 6) == 0) {
            i2 = i | (p65Var2.h(m45Var) ? 4 : 2);
        } else {
            i2 = i;
        }
        if ((i & 48) == 0) {
            i2 |= p65Var2.h(m45Var2) ? 32 : 16;
        }
        if (p65Var2.P(i2 & 1, (i2 & 19) != 18)) {
            p65Var = p65Var2;
            hlg.a(m45Var2, pxf.E(-298142293, new c60(19, m45Var), p65Var2), null, pxf.E(-909411351, new c60(20, m45Var2), p65Var2), null, f76.h, f76.i, null, 0L, 0L, 0L, 0L, null, p65Var, ((i2 >> 3) & 14) | 1772592, 0, 16276);
        } else {
            p65Var = p65Var2;
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new b5b(m45Var, m45Var2, i, 1);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:23:0x0042  */
    /* JADX WARN: Removed duplicated region for block: B:30:0x0052  */
    /* JADX WARN: Removed duplicated region for block: B:37:0x0062  */
    /* JADX WARN: Removed duplicated region for block: B:38:0x0065  */
    /* JADX WARN: Removed duplicated region for block: B:47:0x007c  */
    /* JADX WARN: Removed duplicated region for block: B:49:0x0080  */
    /* JADX WARN: Removed duplicated region for block: B:58:0x0096  */
    /* JADX WARN: Removed duplicated region for block: B:63:0x00a5  */
    /* JADX WARN: Removed duplicated region for block: B:66:0x00b4  */
    /* JADX WARN: Removed duplicated region for block: B:67:0x00b7  */
    /* JADX WARN: Removed duplicated region for block: B:70:0x00c1  */
    /* JADX WARN: Removed duplicated region for block: B:84:0x0124  */
    /* JADX WARN: Removed duplicated region for block: B:87:0x012f  */
    /* JADX WARN: Removed duplicated region for block: B:89:? A[RETURN, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final void i(defpackage.r28 r18, defpackage.m3c r19, long r20, long r22, float r24, defpackage.mz1 r25, defpackage.x12 r26, int r27, int r28) {
        /*
            Method dump skipped, instruction units count: 319
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.br7.i(r28, m3c, long, long, float, mz1, x12, int, int):void");
    }

    /* JADX WARN: Removed duplicated region for block: B:101:0x016c  */
    /* JADX WARN: Removed duplicated region for block: B:103:? A[RETURN, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:70:0x00c3  */
    /* JADX WARN: Removed duplicated region for block: B:77:0x00d8  */
    /* JADX WARN: Removed duplicated region for block: B:84:0x00f3  */
    /* JADX WARN: Removed duplicated region for block: B:85:0x00f6  */
    /* JADX WARN: Removed duplicated region for block: B:88:0x0100  */
    /* JADX WARN: Removed duplicated region for block: B:98:0x0162  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final void j(final defpackage.m45 r26, defpackage.r28 r27, boolean r28, defpackage.m3c r29, long r30, long r32, defpackage.cu0 r34, float r35, final defpackage.m68 r36, final defpackage.mz1 r37, defpackage.x12 r38, int r39, int r40) {
        /*
            Method dump skipped, instruction units count: 389
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.br7.j(m45, r28, boolean, m3c, long, long, cu0, float, m68, mz1, x12, int, int):void");
    }

    /* JADX WARN: Removed duplicated region for block: B:23:0x0041  */
    /* JADX WARN: Removed duplicated region for block: B:26:0x0047  */
    /* JADX WARN: Removed duplicated region for block: B:28:0x004c  */
    /* JADX WARN: Removed duplicated region for block: B:37:0x0065  */
    /* JADX WARN: Removed duplicated region for block: B:38:0x0067  */
    /* JADX WARN: Removed duplicated region for block: B:41:0x0070  */
    /* JADX WARN: Removed duplicated region for block: B:56:0x00db  */
    /* JADX WARN: Removed duplicated region for block: B:57:0x00df  */
    /* JADX WARN: Removed duplicated region for block: B:60:0x0132  */
    /* JADX WARN: Removed duplicated region for block: B:61:0x0136  */
    /* JADX WARN: Removed duplicated region for block: B:63:0x015e  */
    /* JADX WARN: Removed duplicated region for block: B:66:0x016b  */
    /* JADX WARN: Removed duplicated region for block: B:68:? A[RETURN, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final void k(defpackage.nhc r20, defpackage.r28 r21, float r22, defpackage.c55 r23, defpackage.x12 r24, int r25, int r26) {
        /*
            Method dump skipped, instruction units count: 375
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.br7.k(nhc, r28, float, c55, x12, int, int):void");
    }

    public static void l(int i, int i2) {
        String strT;
        if (i < 0 || i >= i2) {
            if (i < 0) {
                strT = er7.t("%s (%s) must not be negative", "index", Integer.valueOf(i));
            } else {
                if (i2 < 0) {
                    ay0.e(b09.w(i2, "negative size: "));
                    return;
                }
                strT = er7.t("%s (%s) must be less than size (%s)", "index", Integer.valueOf(i), Integer.valueOf(i2));
            }
            throw new IndexOutOfBoundsException(strT);
        }
    }

    public static void m(int i, int i2, int i3) {
        if (i < 0 || i2 < i || i2 > i3) {
            throw new IndexOutOfBoundsException((i < 0 || i > i3) ? o(i, i3, "start index") : (i2 < 0 || i2 > i3) ? o(i2, i3, "end index") : er7.t("end index (%s) must not be less than start index (%s)", Integer.valueOf(i2), Integer.valueOf(i)));
        }
    }

    public static final ajb n(Throwable th) {
        th.getClass();
        return new ajb(th);
    }

    public static String o(int i, int i2, String str) {
        if (i < 0) {
            return er7.t("%s (%s) must not be negative", str, Integer.valueOf(i));
        }
        if (i2 >= 0) {
            return er7.t("%s (%s) must not be greater than size (%s)", str, Integer.valueOf(i), Integer.valueOf(i2));
        }
        ay0.e(b09.w(i2, "negative size: "));
        return null;
    }

    public static final float p(x12 x12Var, int i) {
        p65 p65Var = (p65) x12Var;
        return ((Resources) p65Var.j(eo.c)).getDimension(i) / ((m73) p65Var.j(z22.h)).b();
    }

    public static final boolean q(long j, long j2) {
        return j == j2;
    }

    public static final ssd r(b43 b43Var, Object obj) {
        hj0 hj0Var;
        if (!b43Var.a.n) {
            b26.b("visitAncestors called on an unattached node");
        }
        q28 q28Var = b43Var.a.e;
        aq6 aq6VarV0 = flb.v0(b43Var);
        while (aq6VarV0 != null) {
            if ((((q28) aq6VarV0.F.g).d & 262144) != 0) {
                while (q28Var != null) {
                    if ((q28Var.c & 262144) != 0) {
                        q28 q28VarQ0 = q28Var;
                        o78 o78Var = null;
                        while (q28VarQ0 != null) {
                            if (q28VarQ0 instanceof ssd) {
                                ssd ssdVar = (ssd) q28VarQ0;
                                if (obj.equals(ssdVar.m())) {
                                    return ssdVar;
                                }
                            }
                            if ((q28VarQ0.c & 262144) != 0 && (q28VarQ0 instanceof b43)) {
                                int i = 0;
                                for (q28 q28Var2 = ((b43) q28VarQ0).p; q28Var2 != null; q28Var2 = q28Var2.f) {
                                    if ((q28Var2.c & 262144) != 0) {
                                        i++;
                                        if (i == 1) {
                                            q28VarQ0 = q28Var2;
                                        } else {
                                            if (o78Var == null) {
                                                o78Var = new o78(new q28[16]);
                                            }
                                            if (q28VarQ0 != null) {
                                                o78Var.b(q28VarQ0);
                                                q28VarQ0 = null;
                                            }
                                            o78Var.b(q28Var2);
                                        }
                                    }
                                }
                                if (i == 1) {
                                }
                            }
                            q28VarQ0 = flb.q0(o78Var);
                        }
                    }
                    q28Var = q28Var.e;
                }
            }
            aq6VarV0 = aq6VarV0.v();
            q28Var = (aq6VarV0 == null || (hj0Var = aq6VarV0.F) == null) ? null : (ffd) hj0Var.f;
        }
        return null;
    }

    public static final boolean s(int i, KeyEvent keyEvent) {
        return ((int) (nk7.p0(keyEvent) >> 32)) == i;
    }

    public static final r28 t(r28 r28Var, m3c m3cVar, long j, cu0 cu0Var, float f) {
        return r40.y(flb.a0(wo7.w(r28Var, f, m3cVar, 0L, 0L, 24).b(cu0Var != null ? new bu0(cu0Var.a, cu0Var.b, m3cVar) : o28.b), j, m3cVar), m3cVar);
    }

    public static final long u(long j, uy2 uy2Var, float f, p65 p65Var) {
        long jE = ((sv1) p65Var.j(tv1.a)).e();
        int i = uu1.i;
        if (!ezd.a(j, jE) || uy2Var == null) {
            p65Var.Y(-1124546347);
            p65Var.p(false);
            return j;
        }
        p65Var.Y(-1124614454);
        long jA = uy2.a(j, f, p65Var, 0);
        p65Var.p(false);
        return jA;
    }

    public static final void v(Object obj) {
        if (obj instanceof ajb) {
            throw ((ajb) obj).a;
        }
    }

    public static final ne8 w(adb adbVar) {
        zz0 zz0VarV0;
        int i = adbVar.d;
        long j = adbVar.l;
        long j2 = adbVar.m;
        yi5 yi5Var = adbVar.f;
        LinkedHashMap linkedHashMap = new LinkedHashMap();
        Iterator it2 = yi5Var.iterator();
        while (true) {
            h1 h1Var = (h1) it2;
            if (!h1Var.hasNext()) {
                break;
            }
            f09 f09Var = (f09) h1Var.next();
            String str = (String) f09Var.a;
            String str2 = (String) f09Var.b;
            String lowerCase = str.toLowerCase(Locale.ROOT);
            lowerCase.getClass();
            Object arrayList = linkedHashMap.get(lowerCase);
            if (arrayList == null) {
                arrayList = new ArrayList();
                linkedHashMap.put(lowerCase, arrayList);
            }
            ((List) arrayList).add(str2);
        }
        ce8 ce8Var = new ce8(ei7.W(linkedHashMap));
        fdb fdbVar = adbVar.g;
        return new ne8(i, j, j2, ce8Var, (fdbVar == null || (zz0VarV0 = fdbVar.v0()) == null) ? null : new qkc(zz0VarV0), adbVar);
    }

    /* JADX WARN: Removed duplicated region for block: B:23:0x0072  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final defpackage.kbb x(defpackage.ke8 r5, defpackage.p92 r6) {
        /*
            Method dump skipped, instruction units count: 201
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.br7.x(ke8, p92):kbb");
    }

    public static String y(long j) {
        return "PointerId(value=" + j + ')';
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r11v0, types: [x45] */
    /* JADX WARN: Type inference failed for: r1v12 */
    /* JADX WARN: Type inference failed for: r1v13, types: [q28] */
    /* JADX WARN: Type inference failed for: r1v14, types: [java.lang.Object] */
    /* JADX WARN: Type inference failed for: r1v15 */
    /* JADX WARN: Type inference failed for: r1v16 */
    /* JADX WARN: Type inference failed for: r1v17 */
    /* JADX WARN: Type inference failed for: r1v18 */
    /* JADX WARN: Type inference failed for: r1v19 */
    /* JADX WARN: Type inference failed for: r1v20 */
    /* JADX WARN: Type inference failed for: r1v7 */
    /* JADX WARN: Type inference failed for: r1v8, types: [q28] */
    /* JADX WARN: Type inference failed for: r4v0 */
    /* JADX WARN: Type inference failed for: r4v1 */
    /* JADX WARN: Type inference failed for: r4v10 */
    /* JADX WARN: Type inference failed for: r4v11 */
    /* JADX WARN: Type inference failed for: r4v2 */
    /* JADX WARN: Type inference failed for: r4v3, types: [o78] */
    /* JADX WARN: Type inference failed for: r4v4 */
    /* JADX WARN: Type inference failed for: r4v5 */
    /* JADX WARN: Type inference failed for: r4v6, types: [o78] */
    /* JADX WARN: Type inference failed for: r4v8 */
    /* JADX WARN: Type inference failed for: r4v9 */
    /* JADX WARN: Type inference failed for: r5v6 */
    public static final void z(a43 a43Var, Object obj, x45 x45Var) {
        hj0 hj0Var;
        if (!((q28) a43Var).a.n) {
            b26.b("visitAncestors called on an unattached node");
        }
        q28 q28Var = ((q28) a43Var).a.e;
        aq6 aq6VarV0 = flb.v0(a43Var);
        while (aq6VarV0 != null) {
            if ((((q28) aq6VarV0.F.g).d & 262144) != 0) {
                while (q28Var != null) {
                    if ((q28Var.c & 262144) != 0) {
                        ?? Q0 = q28Var;
                        ?? o78Var = 0;
                        while (Q0 != 0) {
                            if (Q0 instanceof ssd) {
                                ssd ssdVar = (ssd) Q0;
                                if (!(obj.equals(ssdVar.m()) ? ((Boolean) x45Var.invoke(ssdVar)).booleanValue() : true)) {
                                    return;
                                }
                            } else if ((Q0.c & 262144) != 0 && (Q0 instanceof b43)) {
                                q28 q28Var2 = ((b43) Q0).p;
                                int i = 0;
                                Q0 = Q0;
                                o78Var = o78Var;
                                while (q28Var2 != null) {
                                    if ((q28Var2.c & 262144) != 0) {
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
                    q28Var = q28Var.e;
                }
            }
            aq6VarV0 = aq6VarV0.v();
            q28Var = (aq6VarV0 == null || (hj0Var = aq6VarV0.F) == null) ? null : (ffd) hj0Var.f;
        }
    }

    public jrg D(FirebaseAuth firebaseAuth, String str, awa awaVar) {
        boolean z;
        boolean z2 = false;
        ujf ujfVar = new ujf(14, z2);
        ujfVar.b = this;
        uz5 uz5VarI = firebaseAuth.i();
        if (uz5VarI != null) {
            synchronized (uz5VarI.a) {
                try {
                    bqf bqfVar = (bqf) uz5VarI.c;
                    z = bqfVar != null && bqfVar.b();
                } catch (Throwable th) {
                    throw th;
                }
            }
            if (z) {
                jrg jrgVarP = uz5VarI.p(str, Boolean.FALSE, awaVar);
                o2b o2bVar = new o2b(str, uz5VarI, awaVar, ujfVar, 22);
                p7f p7fVar = yfd.a;
                return jrgVarP.g(p7fVar, ujfVar).g(p7fVar, o2bVar);
            }
        }
        jrg jrgVarE = E(null);
        o2b o2bVar2 = new o2b(21, z2);
        o2bVar2.b = awaVar;
        o2bVar2.c = firebaseAuth;
        o2bVar2.d = str;
        o2bVar2.e = ujfVar;
        jrgVarE.getClass();
        return jrgVarE.g(yfd.a, o2bVar2);
    }

    public abstract jrg E(String str);
}
