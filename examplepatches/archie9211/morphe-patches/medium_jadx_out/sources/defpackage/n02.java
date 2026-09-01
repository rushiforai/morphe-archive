package defpackage;

import com.drew.lang.RandomAccessStreamReader;
import com.drew.metadata.exif.makernotes.OlympusMakernoteDirectory;
import com.medium.reader.R;
import java.util.concurrent.TimeUnit;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class n02 implements c55 {
    public final /* synthetic */ int a;

    public /* synthetic */ n02(int i) {
        this.a = i;
    }

    private final Object a(Object obj, Object obj2, Object obj3) {
        x12 x12Var = (x12) obj2;
        int iIntValue = ((Integer) obj3).intValue();
        ((xr6) obj).getClass();
        p65 p65Var = (p65) x12Var;
        if (p65Var.P(iIntValue & 1, (iIntValue & 17) != 16)) {
            jp7 jp7Var = (jp7) p65Var.j(kt7.a);
            o28 o28Var = o28.b;
            r28 r28VarJ = ka1.j(jp7Var, o28Var, 3, 1.0f);
            zk7 zk7VarC = dy0.c(z46.h, false);
            long j = p65Var.T;
            int i = (int) (j ^ (j >>> 32));
            i89 i89VarL = p65Var.l();
            r28 r28VarR = gx1.R(p65Var, r28VarJ);
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
            Integer numValueOf = Integer.valueOf(i);
            cu cuVar3 = q12.g;
            tp7.B(p65Var, cuVar3, numValueOf);
            fn fnVar = q12.h;
            tp7.y(p65Var, fnVar);
            cu cuVar4 = q12.d;
            tp7.B(p65Var, cuVar4, r28VarR);
            r28 r28VarD = jfc.d(jfc.o(o28Var, 0.0f, 0.0f, 648.0f, 0.0f, 11), 1.0f);
            zk7 zk7VarC2 = dy0.c(z46.d, false);
            long j2 = p65Var.T;
            int i2 = (int) (j2 ^ (j2 >>> 32));
            i89 i89VarL2 = p65Var.l();
            r28 r28VarR2 = gx1.R(p65Var, r28VarD);
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, cuVar, zk7VarC2);
            tp7.B(p65Var, cuVar2, i89VarL2);
            ka1.z(i2, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR2);
            r28 r28VarV = m40.V(w2g.G(jfc.d(o28Var, 1.0f), 24.0f, 32.0f, 24.0f, 0.0f, 8), p65Var, 0);
            wv1 wv1VarA = uv1.a(qb8.c, z46.p, p65Var, 0);
            long j3 = p65Var.T;
            int i3 = (int) (j3 ^ (j3 >>> 32));
            i89 i89VarL3 = p65Var.l();
            r28 r28VarR3 = gx1.R(p65Var, r28VarV);
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, cuVar, wv1VarA);
            tp7.B(p65Var, cuVar2, i89VarL3);
            ka1.z(i3, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR3);
            tr7.b(0, 3, 0L, p65Var, null);
            p65Var.Y(-1650760499);
            float fZ = ((m73) p65Var.j(z22.h)).z(((bu7) p65Var.j(jt7.c)).j.b.c);
            p65Var.p(false);
            dy0.a(flb.a0(jfc.d(jfc.e(w2g.F(o28Var, 24.0f, 32.0f, 24.0f, 12.0f), fZ), 1.0f), ((zo7) p65Var.j(kt7.b)).c, rv8.r), p65Var, 0);
            p65Var.p(true);
            p65Var.p(true);
            p65Var.p(true);
        } else {
            p65Var.S();
        }
        return c1e.a;
    }

    private final Object d(Object obj, Object obj2, Object obj3) {
        x12 x12Var = (x12) obj2;
        int iIntValue = ((Integer) obj3).intValue();
        ((xr6) obj).getClass();
        p65 p65Var = (p65) x12Var;
        if (p65Var.P(iIntValue & 1, (iIntValue & 17) != 16)) {
            jp7 jp7Var = (jp7) p65Var.j(kt7.a);
            o28 o28Var = o28.b;
            r28 r28VarJ = ka1.j(jp7Var, o28Var, 3, 1.0f);
            zk7 zk7VarC = dy0.c(z46.h, false);
            long j = p65Var.T;
            int i = (int) (j ^ (j >>> 32));
            i89 i89VarL = p65Var.l();
            r28 r28VarR = gx1.R(p65Var, r28VarJ);
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
            Integer numValueOf = Integer.valueOf(i);
            cu cuVar3 = q12.g;
            tp7.B(p65Var, cuVar3, numValueOf);
            fn fnVar = q12.h;
            tp7.y(p65Var, fnVar);
            cu cuVar4 = q12.d;
            tp7.B(p65Var, cuVar4, r28VarR);
            r28 r28VarD = jfc.d(jfc.o(o28Var, 0.0f, 0.0f, 648.0f, 0.0f, 11), 1.0f);
            zk7 zk7VarC2 = dy0.c(z46.d, false);
            long j2 = p65Var.T;
            int i2 = (int) (j2 ^ (j2 >>> 32));
            i89 i89VarL2 = p65Var.l();
            r28 r28VarR2 = gx1.R(p65Var, r28VarD);
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, cuVar, zk7VarC2);
            tp7.B(p65Var, cuVar2, i89VarL2);
            ka1.z(i2, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR2);
            tr7.g(0, 1, p65Var, null);
            p65Var.p(true);
            p65Var.p(true);
        } else {
            p65Var.S();
        }
        return c1e.a;
    }

    private final Object g(Object obj, Object obj2, Object obj3) {
        x12 x12Var = (x12) obj2;
        int iIntValue = ((Integer) obj3).intValue();
        ((xr6) obj).getClass();
        p65 p65Var = (p65) x12Var;
        if (p65Var.P(iIntValue & 1, (iIntValue & 17) != 16)) {
            jp7 jp7Var = (jp7) p65Var.j(kt7.a);
            o28 o28Var = o28.b;
            r28 r28VarJ = ka1.j(jp7Var, o28Var, 3, 1.0f);
            zk7 zk7VarC = dy0.c(z46.h, false);
            long j = p65Var.T;
            int i = (int) (j ^ (j >>> 32));
            i89 i89VarL = p65Var.l();
            r28 r28VarR = gx1.R(p65Var, r28VarJ);
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
            Integer numValueOf = Integer.valueOf(i);
            cu cuVar3 = q12.g;
            tp7.B(p65Var, cuVar3, numValueOf);
            fn fnVar = q12.h;
            tp7.y(p65Var, fnVar);
            cu cuVar4 = q12.d;
            tp7.B(p65Var, cuVar4, r28VarR);
            r28 r28VarD = jfc.d(jfc.o(o28Var, 0.0f, 0.0f, 648.0f, 0.0f, 11), 1.0f);
            zk7 zk7VarC2 = dy0.c(z46.d, false);
            long j2 = p65Var.T;
            int i2 = (int) (j2 ^ (j2 >>> 32));
            i89 i89VarL2 = p65Var.l();
            r28 r28VarR2 = gx1.R(p65Var, r28VarD);
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, cuVar, zk7VarC2);
            tp7.B(p65Var, cuVar2, i89VarL2);
            ka1.z(i2, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR2);
            tp7.c(0.0f, 6, 6, 0L, p65Var, jfc.d(w2g.G(o28Var, 0.0f, 18.0f, 0.0f, 0.0f, 13), 1.0f));
            p65Var.p(true);
            p65Var.p(true);
        } else {
            p65Var.S();
        }
        return c1e.a;
    }

    private final Object h(Object obj, Object obj2, Object obj3) {
        x12 x12Var = (x12) obj2;
        int iIntValue = ((Integer) obj3).intValue();
        ((xr6) obj).getClass();
        p65 p65Var = (p65) x12Var;
        if (p65Var.P(iIntValue & 1, (iIntValue & 17) != 16)) {
            jp7 jp7Var = (jp7) p65Var.j(kt7.a);
            o28 o28Var = o28.b;
            r28 r28VarJ = ka1.j(jp7Var, o28Var, 3, 1.0f);
            zk7 zk7VarC = dy0.c(z46.h, false);
            long j = p65Var.T;
            int i = (int) (j ^ (j >>> 32));
            i89 i89VarL = p65Var.l();
            r28 r28VarR = gx1.R(p65Var, r28VarJ);
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
            Integer numValueOf = Integer.valueOf(i);
            cu cuVar3 = q12.g;
            tp7.B(p65Var, cuVar3, numValueOf);
            fn fnVar = q12.h;
            tp7.y(p65Var, fnVar);
            cu cuVar4 = q12.d;
            tp7.B(p65Var, cuVar4, r28VarR);
            r28 r28VarD = jfc.d(jfc.o(o28Var, 0.0f, 0.0f, 648.0f, 0.0f, 11), 1.0f);
            zk7 zk7VarC2 = dy0.c(z46.d, false);
            long j2 = p65Var.T;
            int i2 = (int) (j2 ^ (j2 >>> 32));
            i89 i89VarL2 = p65Var.l();
            r28 r28VarR2 = gx1.R(p65Var, r28VarD);
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, cuVar, zk7VarC2);
            tp7.B(p65Var, cuVar2, i89VarL2);
            ka1.z(i2, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR2);
            tp7.c(0.0f, 6, 6, 0L, p65Var, jfc.d(w2g.G(o28Var, 0.0f, 56.0f, 0.0f, 0.0f, 13), 1.0f));
            p65Var.p(true);
            p65Var.p(true);
        } else {
            p65Var.S();
        }
        return c1e.a;
    }

    @Override // defpackage.c55
    public final Object f(Object obj, Object obj2, Object obj3) {
        int i = this.a;
        o28 o28Var = o28.b;
        c1e c1eVar = c1e.a;
        switch (i) {
            case 0:
                x12 x12Var = (x12) obj2;
                int iIntValue = ((Integer) obj3).intValue();
                ((pmb) obj).getClass();
                p65 p65Var = (p65) x12Var;
                if (p65Var.P(iIntValue & 1, (iIntValue & 17) != 16)) {
                    jjd.b(vo7.R(p65Var, R.string.remove_downloaded_lists_catalog_positive), null, 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, null, p65Var, 0, 0, 262142);
                } else {
                    p65Var.S();
                }
                return c1eVar;
            case 1:
                x12 x12Var2 = (x12) obj2;
                int iIntValue2 = ((Integer) obj3).intValue();
                ((pmb) obj).getClass();
                p65 p65Var2 = (p65) x12Var2;
                if (p65Var2.P(iIntValue2 & 1, (iIntValue2 & 17) != 16)) {
                    jjd.b(vo7.R(p65Var2, R.string.remove_downloaded_lists_catalog_negative), null, 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, null, p65Var2, 0, 0, 262142);
                } else {
                    p65Var2.S();
                }
                return c1eVar;
            case 2:
                x12 x12Var3 = (x12) obj2;
                int iIntValue3 = ((Integer) obj3).intValue();
                ((pmb) obj).getClass();
                p65 p65Var3 = (p65) x12Var3;
                if (p65Var3.P(iIntValue3 & 1, (iIntValue3 & 17) != 16)) {
                    jjd.b(vo7.R(p65Var3, R.string.common_report), null, 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, null, p65Var3, 0, 0, 262142);
                } else {
                    p65Var3.S();
                }
                return c1eVar;
            case 3:
                x12 x12Var4 = (x12) obj2;
                int iIntValue4 = ((Integer) obj3).intValue();
                ((pmb) obj).getClass();
                p65 p65Var4 = (p65) x12Var4;
                if (p65Var4.P(iIntValue4 & 1, (iIntValue4 & 17) != 16)) {
                    jjd.b(vo7.R(p65Var4, R.string.common_cancel), null, 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, null, p65Var4, 0, 0, 262142);
                } else {
                    p65Var4.S();
                }
                return c1eVar;
            case 4:
                x12 x12Var5 = (x12) obj2;
                int iIntValue5 = ((Integer) obj3).intValue();
                ((xr6) obj).getClass();
                p65 p65Var5 = (p65) x12Var5;
                if (p65Var5.P(iIntValue5 & 1, (iIntValue5 & 17) != 16)) {
                    jp7 jp7Var = (jp7) p65Var5.j(kt7.a);
                    o28 o28Var2 = o28.b;
                    r28 r28VarJ = ka1.j(jp7Var, o28Var2, 3, 1.0f);
                    zk7 zk7VarC = dy0.c(z46.h, false);
                    long j = p65Var5.T;
                    int i2 = (int) (j ^ (j >>> 32));
                    i89 i89VarL = p65Var5.l();
                    r28 r28VarR = gx1.R(p65Var5, r28VarJ);
                    r12.W.getClass();
                    ot2 ot2Var = q12.b;
                    p65Var5.c0();
                    if (p65Var5.S) {
                        p65Var5.k(ot2Var);
                    } else {
                        p65Var5.m0();
                    }
                    cu cuVar = q12.f;
                    tp7.B(p65Var5, cuVar, zk7VarC);
                    cu cuVar2 = q12.e;
                    tp7.B(p65Var5, cuVar2, i89VarL);
                    Integer numValueOf = Integer.valueOf(i2);
                    cu cuVar3 = q12.g;
                    tp7.B(p65Var5, cuVar3, numValueOf);
                    fn fnVar = q12.h;
                    tp7.y(p65Var5, fnVar);
                    cu cuVar4 = q12.d;
                    tp7.B(p65Var5, cuVar4, r28VarR);
                    r28 r28VarD = jfc.d(jfc.o(o28Var2, 0.0f, 0.0f, 648.0f, 0.0f, 11), 1.0f);
                    zk7 zk7VarC2 = dy0.c(z46.d, false);
                    long j2 = p65Var5.T;
                    int i3 = (int) (j2 ^ (j2 >>> 32));
                    i89 i89VarL2 = p65Var5.l();
                    r28 r28VarR2 = gx1.R(p65Var5, r28VarD);
                    p65Var5.c0();
                    if (p65Var5.S) {
                        p65Var5.k(ot2Var);
                    } else {
                        p65Var5.m0();
                    }
                    tp7.B(p65Var5, cuVar, zk7VarC2);
                    tp7.B(p65Var5, cuVar2, i89VarL2);
                    ka1.z(i3, p65Var5, cuVar3, p65Var5, fnVar);
                    tp7.B(p65Var5, cuVar4, r28VarR2);
                    tr7.g(0, 0, p65Var5, m40.V(o28Var2, p65Var5, 6));
                    p65Var5.p(true);
                    p65Var5.p(true);
                } else {
                    p65Var5.S();
                }
                return c1eVar;
            case 5:
                x12 x12Var6 = (x12) obj2;
                int iIntValue6 = ((Integer) obj3).intValue();
                ((xr6) obj).getClass();
                p65 p65Var6 = (p65) x12Var6;
                if (p65Var6.P(iIntValue6 & 1, (iIntValue6 & 17) != 16)) {
                    String str = (4193279 & 1) != 0 ? "RESPONSE_ID" : null;
                    long jCurrentTimeMillis = (4193279 & 2) != 0 ? System.currentTimeMillis() - TimeUnit.DAYS.toMillis(msa.b.e(1L, 365L)) : 0L;
                    String str2 = (4193279 & 16) != 0 ? "Peter Canvas" : null;
                    int i4 = 4193279 & 32;
                    ey3 ey3Var = ey3.a;
                    ep7.j(new sfb(str, jCurrentTimeMillis, (4193279 & 2097152) != 0 ? d46.Q(new rfb("PARAGRAPH_ID", "Hmmm, I kind of disagree. Last week I was hanging around in downtown, and I noticed quite the opposite.", ey3Var)) : null, null, new qfb("AUTHOR_ID", str2, "IMAGE_ID", (4193279 & 128) != 0 ? zw7.NOT_A_MEMBER : null, (4193279 & 512) == 0, (4193279 & 1024) == 0, (4193279 & RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH) == 0, ns0.NOT_BLOCKED, i4 != 0 ? ey3Var : null), (4193279 & 4096) != 0 ? new tm1(0, 0L) : null, 0, (4193279 & OlympusMakernoteDirectory.TAG_MAIN_INFO) == 0, false, false, 0, false, "", false), false, false, xsa.f, null, p65Var6, 3504, 16);
                } else {
                    p65Var6.S();
                }
                return c1eVar;
            case 6:
                x12 x12Var7 = (x12) obj2;
                int iIntValue7 = ((Integer) obj3).intValue();
                ((pmb) obj).getClass();
                p65 p65Var7 = (p65) x12Var7;
                if (p65Var7.P(iIntValue7 & 1, (iIntValue7 & 17) != 16)) {
                    jjd.b(vo7.R(p65Var7, R.string.responses_locked_close_discussion), null, 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, null, p65Var7, 0, 0, 262142);
                } else {
                    p65Var7.S();
                }
                return c1eVar;
            case 7:
                x12 x12Var8 = (x12) obj2;
                int iIntValue8 = ((Integer) obj3).intValue();
                ((pmb) obj).getClass();
                p65 p65Var8 = (p65) x12Var8;
                if (p65Var8.P(iIntValue8 & 1, (iIntValue8 & 17) != 16)) {
                    jjd.b(vo7.R(p65Var8, R.string.common_confirm), null, 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, null, p65Var8, 0, 0, 262142);
                } else {
                    p65Var8.S();
                }
                return c1eVar;
            case 8:
                x12 x12Var9 = (x12) obj2;
                int iIntValue9 = ((Integer) obj3).intValue();
                ((pmb) obj).getClass();
                p65 p65Var9 = (p65) x12Var9;
                if (p65Var9.P(iIntValue9 & 1, (iIntValue9 & 17) != 16)) {
                    jjd.b(vo7.R(p65Var9, R.string.common_cancel), null, 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, null, p65Var9, 0, 0, 262142);
                } else {
                    p65Var9.S();
                }
                return c1eVar;
            case 9:
                x12 x12Var10 = (x12) obj2;
                int iIntValue10 = ((Integer) obj3).intValue();
                ((pmb) obj).getClass();
                p65 p65Var10 = (p65) x12Var10;
                if (p65Var10.P(iIntValue10 & 1, (iIntValue10 & 17) != 16)) {
                    jjd.b(vo7.R(p65Var10, R.string.common_cancel), null, 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, null, p65Var10, 0, 0, 262142);
                } else {
                    p65Var10.S();
                }
                return c1eVar;
            case 10:
                x12 x12Var11 = (x12) obj2;
                int iIntValue11 = ((Integer) obj3).intValue();
                ((pmb) obj).getClass();
                p65 p65Var11 = (p65) x12Var11;
                if (p65Var11.P(iIntValue11 & 1, (iIntValue11 & 17) != 16)) {
                    jjd.b(vo7.R(p65Var11, R.string.response_delete_confirmation_positive_button), null, 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, null, p65Var11, 0, 0, 262142);
                } else {
                    p65Var11.S();
                }
                return c1eVar;
            case 11:
                x12 x12Var12 = (x12) obj2;
                int iIntValue12 = ((Integer) obj3).intValue();
                ((pmb) obj).getClass();
                p65 p65Var12 = (p65) x12Var12;
                if (p65Var12.P(iIntValue12 & 1, (iIntValue12 & 17) != 16)) {
                    jjd.b(vo7.R(p65Var12, R.string.common_cancel), null, 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, null, p65Var12, 0, 0, 262142);
                } else {
                    p65Var12.S();
                }
                return c1eVar;
            case 12:
                ihc ihcVar = (ihc) obj;
                x12 x12Var13 = (x12) obj2;
                int iIntValue13 = ((Integer) obj3).intValue();
                ihcVar.getClass();
                if ((iIntValue13 & 6) == 0) {
                    iIntValue13 |= ((p65) x12Var13).f(ihcVar) ? 4 : 2;
                }
                p65 p65Var13 = (p65) x12Var13;
                if (p65Var13.P(iIntValue13 & 1, (iIntValue13 & 19) != 18)) {
                    dl7.d(w2g.C(o28Var, 16.0f), null, null, null, 0L, 0L, 0L, 0L, pxf.E(-1363574720, new k6c(24, ihcVar), p65Var13), p65Var13, 805306374, 510);
                } else {
                    p65Var13.S();
                }
                return c1eVar;
            case 13:
                pmb pmbVar = (pmb) obj;
                x12 x12Var14 = (x12) obj2;
                int iIntValue14 = ((Integer) obj3).intValue();
                pmbVar.getClass();
                if ((iIntValue14 & 6) == 0) {
                    iIntValue14 |= ((p65) x12Var14).f(pmbVar) ? 4 : 2;
                }
                p65 p65Var14 = (p65) x12Var14;
                if (p65Var14.P(iIntValue14 & 1, (iIntValue14 & 19) != 18)) {
                    c09 c09VarJ = vn7.J(R.drawable.ic_respond_24, 0, p65Var14);
                    sn3 sn3Var = kt7.b;
                    long j3 = ((zo7) p65Var14.j(sn3Var)).o;
                    zq0 zq0Var = z46.n;
                    qv5.b(c09VarJ, null, jfc.l(pmbVar.b(o28Var, zq0Var), 24.0f), j3, p65Var14, 56, 0);
                    jjd.b(y30.n(4.0f, R.string.response_item_show_more_replies, p65Var14, p65Var14, o28Var), pmbVar.b(o28Var, zq0Var), 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, mkd.a(((bu7) p65Var14.j(jt7.c)).n, ((zo7) p65Var14.j(sn3Var)).o, 0L, null, null, null, 0L, 0L, null, 0, 0L, null, null, 16777214), p65Var14, 0, 0, 131068);
                    hp7.t(p65Var14, jfc.l(o28Var, 4.0f));
                    qv5.b(vn7.J(R.drawable.ic_chevron_forward, 0, p65Var14), null, jfc.l(pmbVar.b(o28Var, zq0Var), 24.0f), ((zo7) p65Var14.j(sn3Var)).o, p65Var14, 56, 0);
                    hp7.t(p65Var14, jfc.l(o28Var, 8.0f));
                } else {
                    p65Var14.S();
                }
                return c1eVar;
            case 14:
                x12 x12Var15 = (x12) obj2;
                int iIntValue15 = ((Integer) obj3).intValue();
                ((pmb) obj).getClass();
                p65 p65Var15 = (p65) x12Var15;
                if (p65Var15.P(iIntValue15 & 1, (iIntValue15 & 17) != 16)) {
                    jjd.b(vo7.R(p65Var15, R.string.common_confirm), null, 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, null, p65Var15, 0, 0, 262142);
                } else {
                    p65Var15.S();
                }
                return c1eVar;
            case 15:
                x12 x12Var16 = (x12) obj2;
                int iIntValue16 = ((Integer) obj3).intValue();
                ((pmb) obj).getClass();
                p65 p65Var16 = (p65) x12Var16;
                if (p65Var16.P(iIntValue16 & 1, (iIntValue16 & 17) != 16)) {
                    jjd.b(vo7.R(p65Var16, R.string.common_cancel), null, 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, null, p65Var16, 0, 0, 262142);
                } else {
                    p65Var16.S();
                }
                return c1eVar;
            case 16:
                jhc jhcVar = (jhc) obj;
                x12 x12Var17 = (x12) obj2;
                int iIntValue17 = ((Integer) obj3).intValue();
                if ((iIntValue17 & 6) == 0) {
                    iIntValue17 |= (iIntValue17 & 8) == 0 ? ((p65) x12Var17).f(jhcVar) : ((p65) x12Var17).h(jhcVar) ? 4 : 2;
                }
                p65 p65Var17 = (p65) x12Var17;
                if (p65Var17.P(iIntValue17 & 1, (iIntValue17 & 19) != 18)) {
                    il7.j(jhcVar, null, null, 0L, 0L, 0L, 0.0f, p65Var17, iIntValue17 & 14);
                } else {
                    p65Var17.S();
                }
                return c1eVar;
            case 17:
                x12 x12Var18 = (x12) obj2;
                int iIntValue18 = ((Integer) obj3).intValue();
                ((pmb) obj).getClass();
                p65 p65Var18 = (p65) x12Var18;
                if (p65Var18.P(iIntValue18 & 1, (iIntValue18 & 17) != 16)) {
                    jjd.b(vo7.R(p65Var18, R.string.settings_disconnect_confirm), null, 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, null, p65Var18, 0, 0, 262142);
                } else {
                    p65Var18.S();
                }
                return c1eVar;
            case 18:
                x12 x12Var19 = (x12) obj2;
                int iIntValue19 = ((Integer) obj3).intValue();
                ((pmb) obj).getClass();
                p65 p65Var19 = (p65) x12Var19;
                if (p65Var19.P(iIntValue19 & 1, (iIntValue19 & 17) != 16)) {
                    jjd.b(vo7.R(p65Var19, R.string.common_cancel), null, 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, null, p65Var19, 0, 0, 262142);
                } else {
                    p65Var19.S();
                }
                return c1eVar;
            case 19:
                x12 x12Var20 = (x12) obj2;
                int iIntValue20 = ((Integer) obj3).intValue();
                ((pmb) obj).getClass();
                p65 p65Var20 = (p65) x12Var20;
                if (!p65Var20.P(iIntValue20 & 1, (iIntValue20 & 17) != 16)) {
                    p65Var20.S();
                }
                return c1eVar;
            case 20:
                x12 x12Var21 = (x12) obj2;
                int iIntValue21 = ((Integer) obj3).intValue();
                ((pmb) obj).getClass();
                p65 p65Var21 = (p65) x12Var21;
                if (p65Var21.P(iIntValue21 & 1, (iIntValue21 & 17) != 16)) {
                    jjd.b(vo7.R(p65Var21, R.string.onboarding_starter_pack_detail_explore), null, 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, mkd.a(((bu7) p65Var21.j(jt7.c)).l, ((uu1) p65Var21.j(c82.a)).a, 0L, null, null, null, 0L, 0L, null, 0, 0L, null, null, 16777214), p65Var21, 0, 0, 131070);
                } else {
                    p65Var21.S();
                }
                return c1eVar;
            case 21:
                x12 x12Var22 = (x12) obj2;
                int iIntValue22 = ((Integer) obj3).intValue();
                ((pmb) obj).getClass();
                p65 p65Var22 = (p65) x12Var22;
                if (p65Var22.P(iIntValue22 & 1, (iIntValue22 & 17) != 16)) {
                    jjd.b(vo7.R(p65Var22, R.string.onboarding_starter_pack_detail_follow_all), null, 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, mkd.a(((bu7) p65Var22.j(jt7.c)).l, ((uu1) p65Var22.j(c82.a)).a, 0L, null, null, null, 0L, 0L, null, 0, 0L, null, null, 16777214), p65Var22, 0, 0, 131070);
                } else {
                    p65Var22.S();
                }
                return c1eVar;
            case 22:
                x12 x12Var23 = (x12) obj2;
                int iIntValue23 = ((Integer) obj3).intValue();
                ((pmb) obj).getClass();
                p65 p65Var23 = (p65) x12Var23;
                if (p65Var23.P(iIntValue23 & 1, (iIntValue23 & 17) != 16)) {
                    jjd.b(vo7.R(p65Var23, R.string.onboarding_starter_pack_educational_ok), null, 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, null, p65Var23, 0, 0, 262142);
                } else {
                    p65Var23.S();
                }
                return c1eVar;
            case 23:
                x12 x12Var24 = (x12) obj2;
                int iIntValue24 = ((Integer) obj3).intValue();
                ((xr6) obj).getClass();
                p65 p65Var24 = (p65) x12Var24;
                if (p65Var24.P(iIntValue24 & 1, (iIntValue24 & 17) != 16)) {
                    r28 r28VarG = w2g.G(jfc.d(o28Var, 1.0f), 24.0f, 0.0f, 24.0f, 32.0f, 2);
                    wv1 wv1VarA = uv1.a(qb8.c, z46.q, p65Var24, 48);
                    long j4 = p65Var24.T;
                    int i5 = (int) (j4 ^ (j4 >>> 32));
                    i89 i89VarL3 = p65Var24.l();
                    r28 r28VarR3 = gx1.R(p65Var24, r28VarG);
                    r12.W.getClass();
                    ot2 ot2Var2 = q12.b;
                    p65Var24.c0();
                    if (p65Var24.S) {
                        p65Var24.k(ot2Var2);
                    } else {
                        p65Var24.m0();
                    }
                    tp7.B(p65Var24, q12.f, wv1VarA);
                    tp7.B(p65Var24, q12.e, i89VarL3);
                    tp7.B(p65Var24, q12.g, Integer.valueOf(i5));
                    tp7.y(p65Var24, q12.h);
                    tp7.B(p65Var24, q12.d, r28VarR3);
                    c09 c09VarJ2 = vn7.J(2131231054, 0, p65Var24);
                    sn3 sn3Var2 = kt7.b;
                    qv5.b(c09VarJ2, null, null, ((zo7) p65Var24.j(sn3Var2)).n, p65Var24, 56, 4);
                    String strN = y30.n(12.0f, R.string.onboarding_starter_packs_title, p65Var24, p65Var24, o28Var);
                    sn3 sn3Var3 = jt7.c;
                    jjd.b(strN, bgf.N(o28Var, "starter_packs_title"), 0L, 0L, 0L, null, new jgd(3), 0L, 0, false, 0, 0, null, ((bu7) p65Var24.j(sn3Var3)).F, p65Var24, 48, 0, 130044);
                    hp7.t(p65Var24, jfc.e(o28Var, 4.0f));
                    jjd.b(vo7.R(p65Var24, R.string.onboarding_starter_packs_subtitle), bgf.N(o28Var, "starter_packs_subtitle"), 0L, 0L, 0L, null, new jgd(3), 0L, 0, false, 0, 0, null, mkd.a(((bu7) p65Var24.j(sn3Var3)).m, ((zo7) p65Var24.j(sn3Var2)).o, 0L, null, null, null, 0L, 0L, null, 0, 0L, null, null, 16777214), p65Var24, 48, 0, 130044);
                    p65Var24.p(true);
                } else {
                    p65Var24.S();
                }
                return c1eVar;
            case 24:
                x12 x12Var25 = (x12) obj2;
                int iIntValue25 = ((Integer) obj3).intValue();
                ((xr6) obj).getClass();
                p65 p65Var25 = (p65) x12Var25;
                if (p65Var25.P(iIntValue25 & 1, (iIntValue25 & 17) != 16)) {
                    g76.G(0, 3, 0L, p65Var25, null);
                } else {
                    p65Var25.S();
                }
                return c1eVar;
            case 25:
                return a(obj, obj2, obj3);
            case 26:
                return d(obj, obj2, obj3);
            case 27:
                return g(obj, obj2, obj3);
            case 28:
                return h(obj, obj2, obj3);
            default:
                x12 x12Var26 = (x12) obj2;
                int iIntValue26 = ((Integer) obj3).intValue();
                ((xr6) obj).getClass();
                p65 p65Var26 = (p65) x12Var26;
                if (p65Var26.P(iIntValue26 & 1, (iIntValue26 & 17) != 16)) {
                    jp7 jp7Var2 = (jp7) p65Var26.j(kt7.a);
                    o28 o28Var3 = o28.b;
                    r28 r28VarJ2 = ka1.j(jp7Var2, o28Var3, 3, 1.0f);
                    zk7 zk7VarC3 = dy0.c(z46.h, false);
                    long j5 = p65Var26.T;
                    int i6 = (int) (j5 ^ (j5 >>> 32));
                    i89 i89VarL4 = p65Var26.l();
                    r28 r28VarR4 = gx1.R(p65Var26, r28VarJ2);
                    r12.W.getClass();
                    ot2 ot2Var3 = q12.b;
                    p65Var26.c0();
                    if (p65Var26.S) {
                        p65Var26.k(ot2Var3);
                    } else {
                        p65Var26.m0();
                    }
                    cu cuVar5 = q12.f;
                    tp7.B(p65Var26, cuVar5, zk7VarC3);
                    cu cuVar6 = q12.e;
                    tp7.B(p65Var26, cuVar6, i89VarL4);
                    Integer numValueOf2 = Integer.valueOf(i6);
                    cu cuVar7 = q12.g;
                    tp7.B(p65Var26, cuVar7, numValueOf2);
                    fn fnVar2 = q12.h;
                    tp7.y(p65Var26, fnVar2);
                    cu cuVar8 = q12.d;
                    tp7.B(p65Var26, cuVar8, r28VarR4);
                    r28 r28VarD2 = jfc.d(jfc.o(o28Var3, 0.0f, 0.0f, 648.0f, 0.0f, 11), 1.0f);
                    zk7 zk7VarC4 = dy0.c(z46.d, false);
                    long j6 = p65Var26.T;
                    int i7 = (int) (j6 ^ (j6 >>> 32));
                    i89 i89VarL5 = p65Var26.l();
                    r28 r28VarR5 = gx1.R(p65Var26, r28VarD2);
                    p65Var26.c0();
                    if (p65Var26.S) {
                        p65Var26.k(ot2Var3);
                    } else {
                        p65Var26.m0();
                    }
                    tp7.B(p65Var26, cuVar5, zk7VarC4);
                    tp7.B(p65Var26, cuVar6, i89VarL5);
                    ka1.z(i7, p65Var26, cuVar7, p65Var26, fnVar2);
                    tp7.B(p65Var26, cuVar8, r28VarR5);
                    tp7.c(0.0f, 6, 6, 0L, p65Var26, jfc.d(w2g.G(o28Var3, 0.0f, 24.0f, 0.0f, 0.0f, 13), 1.0f));
                    p65Var26.p(true);
                    p65Var26.p(true);
                } else {
                    p65Var26.S();
                }
                return c1eVar;
        }
    }
}
