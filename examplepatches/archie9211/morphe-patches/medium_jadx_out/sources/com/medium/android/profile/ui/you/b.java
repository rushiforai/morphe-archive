package com.medium.android.profile.ui.you;

import android.content.Context;
import com.drew.lang.RandomAccessStreamReader;
import com.drew.metadata.exif.makernotes.OlympusMakernoteDirectory;
import com.drew.metadata.exif.makernotes.PanasonicMakernoteDirectory;
import com.drew.metadata.exif.makernotes.ReconyxUltraFireMakernoteDirectory;
import com.medium.android.profile.ui.you.YouProfileTab;
import com.medium.reader.R;
import defpackage.ar0;
import defpackage.b55;
import defpackage.bgf;
import defpackage.bo4;
import defpackage.bu7;
import defpackage.c1e;
import defpackage.cu;
import defpackage.cu1;
import defpackage.d13;
import defpackage.d2f;
import defpackage.d46;
import defpackage.d55;
import defpackage.dy0;
import defpackage.e67;
import defpackage.eo;
import defpackage.fa4;
import defpackage.fn;
import defpackage.fo7;
import defpackage.g76;
import defpackage.gbd;
import defpackage.gie;
import defpackage.guc;
import defpackage.gx1;
import defpackage.h70;
import defpackage.hl0;
import defpackage.ho2;
import defpackage.hp7;
import defpackage.i89;
import defpackage.il7;
import defpackage.ip7;
import defpackage.iq7;
import defpackage.iy0;
import defpackage.j5d;
import defpackage.j78;
import defpackage.jfc;
import defpackage.jp7;
import defpackage.jt7;
import defpackage.jz8;
import defpackage.ka1;
import defpackage.kaf;
import defpackage.kk7;
import defpackage.kt7;
import defpackage.kv4;
import defpackage.kyd;
import defpackage.l36;
import defpackage.lv8;
import defpackage.m40;
import defpackage.mwa;
import defpackage.mz1;
import defpackage.n1b;
import defpackage.n92;
import defpackage.nmb;
import defpackage.ns7;
import defpackage.o28;
import defpackage.obb;
import defpackage.obf;
import defpackage.og2;
import defpackage.ok7;
import defpackage.omb;
import defpackage.ot2;
import defpackage.p65;
import defpackage.pi5;
import defpackage.po;
import defpackage.pxf;
import defpackage.q12;
import defpackage.qb8;
import defpackage.r12;
import defpackage.r28;
import defpackage.r40;
import defpackage.rh4;
import defpackage.rz5;
import defpackage.sa0;
import defpackage.sed;
import defpackage.sn3;
import defpackage.sq6;
import defpackage.stc;
import defpackage.t40;
import defpackage.to7;
import defpackage.tp7;
import defpackage.ubf;
import defpackage.uob;
import defpackage.uv1;
import defpackage.vj3;
import defpackage.vo7;
import defpackage.vrd;
import defpackage.w12;
import defpackage.w2g;
import defpackage.wgd;
import defpackage.wue;
import defpackage.wv1;
import defpackage.x12;
import defpackage.x45;
import defpackage.xbf;
import defpackage.xn7;
import defpackage.ygf;
import defpackage.yq0;
import defpackage.z10;
import defpackage.z16;
import defpackage.z46;
import defpackage.zk7;
import defpackage.zo7;
import defpackage.zq0;
import gen.model.SourceParameter;
import java.util.ArrayList;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class b {
    public static final void a(ubf ubfVar, bo4 bo4Var, final j78 j78Var, final j78 j78Var2, d2f d2fVar, r28 r28Var, x12 x12Var, int i) {
        p65 p65Var;
        int i2;
        boolean z;
        final d2f d2fVar2;
        int i3;
        boolean z2;
        uob uobVar;
        int i4;
        d13 d13Var;
        boolean z3;
        Object j5dVar;
        j78 j78Var3;
        uob uobVar2;
        d13 d13Var2;
        int i5;
        j78 j78Var4;
        int i6;
        final ubf ubfVar2 = ubfVar;
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(400193478);
        int i7 = i | (p65Var2.f(ubfVar2) ? 4 : 2) | (p65Var2.h(bo4Var) ? 32 : 16) | (p65Var2.h(j78Var) ? 256 : 128) | (p65Var2.h(j78Var2) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024) | (p65Var2.f(d2fVar) ? OlympusMakernoteDirectory.TAG_MAIN_INFO : 8192) | (p65Var2.f(r28Var) ? 131072 : ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID);
        if (p65Var2.P(i7 & 1, (i7 & 74899) != 74898)) {
            final boolean zBooleanValue = ((Boolean) p65Var2.j(l36.a)).booleanValue();
            p65Var2.Y(-1961110803);
            List<YouProfileTab> list = ubfVar2.i;
            int i8 = ubfVar2.m;
            ArrayList arrayList = new ArrayList(cu1.k0(list, 10));
            for (YouProfileTab youProfileTab : list) {
                if (g76.L(youProfileTab, YouProfileTab.About.INSTANCE)) {
                    i6 = R.string.you_profile_tab_about;
                } else if (g76.L(youProfileTab, YouProfileTab.Activities.INSTANCE)) {
                    i6 = R.string.you_profile_tab_activity;
                } else if (g76.L(youProfileTab, YouProfileTab.Books.INSTANCE)) {
                    i6 = R.string.you_profile_tab_books;
                } else if (g76.L(youProfileTab, YouProfileTab.Catalogs.INSTANCE)) {
                    i6 = R.string.you_profile_tab_lists;
                } else if (g76.L(youProfileTab, YouProfileTab.Posts.INSTANCE)) {
                    i6 = R.string.you_profile_tab_stories;
                } else {
                    if (!g76.L(youProfileTab, YouProfileTab.Reposts.INSTANCE)) {
                        ygf.a();
                        return;
                    }
                    i6 = R.string.you_profile_tab_reposts;
                }
                arrayList.add(vo7.R(p65Var2, i6));
            }
            p65Var2.p(false);
            d13 d13VarB = jz8.b(i8, new kv4(0, 14, List.class, arrayList, "size", "size()I"), p65Var2, 0, 2);
            r28 r28VarN = bgf.N(r28Var, "content_state");
            wv1 wv1VarA = uv1.a(qb8.c, z46.p, p65Var2, 0);
            long j = p65Var2.T;
            int i9 = (int) (j ^ (j >>> 32));
            i89 i89VarL = p65Var2.l();
            r28 r28VarR = gx1.R(p65Var2, r28VarN);
            r12.W.getClass();
            ot2 ot2Var = q12.b;
            p65Var2.c0();
            if (p65Var2.S) {
                p65Var2.k(ot2Var);
            } else {
                p65Var2.m0();
            }
            cu cuVar = q12.f;
            tp7.B(p65Var2, cuVar, wv1VarA);
            cu cuVar2 = q12.e;
            tp7.B(p65Var2, cuVar2, i89VarL);
            Integer numValueOf = Integer.valueOf(i9);
            cu cuVar3 = q12.g;
            tp7.B(p65Var2, cuVar3, numValueOf);
            fn fnVar = q12.h;
            tp7.y(p65Var2, fnVar);
            cu cuVar4 = q12.d;
            tp7.B(p65Var2, cuVar4, r28VarR);
            p65Var2.Y(159589319);
            boolean zIsEmpty = arrayList.isEmpty();
            uob uobVar3 = w12.a;
            if (zIsEmpty) {
                p65Var2.p(false);
                d2fVar2 = d2fVar;
                uobVar = uobVar3;
                i2 = i8;
                d13Var = d13VarB;
                i3 = OlympusMakernoteDirectory.TAG_MAIN_INFO;
                i4 = 4;
                z = true;
                p65Var = p65Var2;
                z2 = false;
            } else {
                jp7 jp7Var = (jp7) p65Var2.j(kt7.a);
                o28 o28Var = o28.b;
                r28 r28VarJ = ka1.j(jp7Var, o28Var, 3, 1.0f);
                zk7 zk7VarC = dy0.c(z46.h, false);
                long j2 = p65Var2.T;
                int i10 = (int) (j2 ^ (j2 >>> 32));
                i89 i89VarL2 = p65Var2.l();
                r28 r28VarR2 = gx1.R(p65Var2, r28VarJ);
                p65Var2.c0();
                if (p65Var2.S) {
                    p65Var2.k(ot2Var);
                } else {
                    p65Var2.m0();
                }
                tp7.B(p65Var2, cuVar, zk7VarC);
                tp7.B(p65Var2, cuVar2, i89VarL2);
                ka1.z(i10, p65Var2, cuVar3, p65Var2, fnVar);
                tp7.B(p65Var2, cuVar4, r28VarR2);
                r28 r28VarD = jfc.d(jfc.o(o28Var, 0.0f, 0.0f, 648.0f, 0.0f, 11), 1.0f);
                zk7 zk7VarC2 = dy0.c(z46.d, false);
                long j3 = p65Var2.T;
                int i11 = (int) (j3 ^ (j3 >>> 32));
                i89 i89VarL3 = p65Var2.l();
                r28 r28VarR3 = gx1.R(p65Var2, r28VarD);
                p65Var2.c0();
                if (p65Var2.S) {
                    p65Var2.k(ot2Var);
                } else {
                    p65Var2.m0();
                }
                tp7.B(p65Var2, cuVar, zk7VarC2);
                tp7.B(p65Var2, cuVar2, i89VarL3);
                ka1.z(i11, p65Var2, cuVar3, p65Var2, fnVar);
                tp7.B(p65Var2, cuVar4, r28VarR3);
                int i12 = ubfVar2.m;
                boolean z4 = ((i7 & 14) == 4) | ((i7 & 57344) == 16384);
                Object objM = p65Var2.M();
                if (z4 || objM == uobVar3) {
                    objM = new vrd(d2fVar, 26, ubfVar2);
                    p65Var2.j0(objM);
                }
                i2 = i8;
                z = true;
                ns7.a(0.0f, i12, 0, 504, 0L, 0L, p65Var2, (x45) objM, null, null, null, arrayList);
                p65Var2.p(true);
                p65Var2.p(true);
                rh4 rh4Var = jfc.c;
                d2fVar2 = d2fVar;
                mz1 mz1VarE = pxf.E(-224016579, new d55() { // from class: rbf
                    @Override // defpackage.d55
                    public final Object k(Object obj, Object obj2, Object obj3, Object obj4) {
                        int iIntValue = ((Integer) obj2).intValue();
                        x12 x12Var2 = (x12) obj3;
                        ((Integer) obj4).getClass();
                        ((zy8) obj).getClass();
                        rh4 rh4Var2 = jfc.c;
                        boolean z5 = zBooleanValue;
                        c1e c1eVar = c1e.a;
                        if (z5) {
                            return c1eVar;
                        }
                        ubf ubfVar3 = ubfVar2;
                        YouProfileTab youProfileTab2 = (YouProfileTab) ubfVar3.i.get(iIntValue);
                        SourceParameter sourceParameter = ubfVar3.k;
                        boolean z6 = youProfileTab2 instanceof YouProfileTab.About;
                        d2f d2fVar3 = d2fVar2;
                        j78 j78Var5 = j78Var;
                        if (z6) {
                            p65 p65Var3 = (p65) x12Var2;
                            p65Var3.Y(701501467);
                            s42.G(ubfVar3.a, gp7.u(sourceParameter), d2fVar3, j78Var5, rh4Var2, 88.0f, null, p65Var3, 24576, 64);
                            p65Var3.p(false);
                            return c1eVar;
                        }
                        if (youProfileTab2 instanceof YouProfileTab.Activities) {
                            p65 p65Var4 = (p65) x12Var2;
                            p65Var4.Y(-531546143);
                            k50.T(ubfVar3.a, gp7.u(sourceParameter), j78Var5, d2fVar3, rh4Var2, null, p65Var4, 24576);
                            p65Var4.p(false);
                            return c1eVar;
                        }
                        if (youProfileTab2 instanceof YouProfileTab.Reposts) {
                            p65 p65Var5 = (p65) x12Var2;
                            p65Var5.Y(-531534306);
                            yi2.I(ubfVar3.a, gp7.u(sourceParameter), j78Var5, d2fVar3, rh4Var2, null, p65Var5, 24576);
                            p65Var5.p(false);
                            return c1eVar;
                        }
                        if (youProfileTab2 instanceof YouProfileTab.Books) {
                            p65 p65Var6 = (p65) x12Var2;
                            p65Var6.Y(702670167);
                            sfe.g(ubfVar3.a, gp7.u(sourceParameter), d2fVar3, j78Var5, rh4Var2, 88.0f, null, p65Var6, 24576, 64);
                            p65Var6.p(false);
                            return c1eVar;
                        }
                        if (youProfileTab2 instanceof YouProfileTab.Catalogs) {
                            p65 p65Var7 = (p65) x12Var2;
                            p65Var7.Y(703112661);
                            n01.Q(gp7.u(sourceParameter), ubfVar3.a, d2fVar3, rh4Var2, j78Var2, false, 88.0f, p65Var7, 199680, 0);
                            p65Var7.p(false);
                            return c1eVar;
                        }
                        if (!(youProfileTab2 instanceof YouProfileTab.Posts)) {
                            throw ho2.L((p65) x12Var2, -531560601, false);
                        }
                        p65 p65Var8 = (p65) x12Var2;
                        p65Var8.Y(-531493128);
                        vo7.m(gp7.u(sourceParameter), paf.DRAFT, d2fVar3, j78Var5, rh4Var2, null, p65Var8, 24624);
                        p65Var8.p(false);
                        return c1eVar;
                    }
                }, p65Var2);
                i3 = 16384;
                z2 = false;
                uobVar = uobVar3;
                i4 = 4;
                d13Var = d13VarB;
                kk7.c(d13Var, rh4Var, null, null, null, null, false, null, null, null, mz1VarE, p65Var2, 48, 16380);
                p65Var = p65Var2;
                p65Var.p(false);
            }
            p65Var.p(z);
            int i13 = i7 & 57344;
            boolean z5 = i13 == i3 ? z : z2;
            Object objM2 = p65Var.M();
            n92 n92Var = null;
            if (z5 || objM2 == uobVar) {
                objM2 = new obb(d2fVar2, n92Var, 28);
                p65Var.j0(objM2);
            }
            kyd.k(p65Var, (b55) objM2, c1e.a);
            Integer numValueOf2 = Integer.valueOf(i2);
            int i14 = i7 & 14;
            boolean zF = p65Var.f(d13Var) | (i14 == i4 ? z : z2);
            Object objM3 = p65Var.M();
            if (zF || objM3 == uobVar) {
                objM3 = new kaf(d13Var, ubfVar2, n92Var, 2);
                p65Var.j0(objM3);
            }
            kyd.k(p65Var, (b55) objM3, numValueOf2);
            List list2 = ubfVar2.i;
            boolean zF2 = (i13 == i3 ? z : z2) | p65Var.f(d13Var) | (i14 == i4 ? z : z2);
            Object objM4 = p65Var.M();
            if (zF2 || objM4 == uobVar) {
                z3 = z2;
                j78Var3 = j78Var2;
                uobVar2 = uobVar;
                d13Var2 = d13Var;
                i5 = i4;
                j78Var4 = j78Var;
                j5dVar = new j5d(d13Var2, d2fVar2, ubfVar2, null, 24);
                ubfVar2 = ubfVar2;
                p65Var.j0(j5dVar);
            } else {
                z3 = z2;
                uobVar2 = uobVar;
                i5 = i4;
                d13Var2 = d13Var;
                j5dVar = objM4;
                j78Var4 = j78Var;
                j78Var3 = j78Var2;
            }
            kyd.l(d13Var2, list2, (b55) j5dVar, p65Var);
            YouProfileTab youProfileTab2 = ubfVar2.j;
            boolean zH = p65Var.h(bo4Var) | (i14 == i5 ? z : z3) | p65Var.h(j78Var3) | p65Var.h(j78Var4);
            Object objM5 = p65Var.M();
            if (zH || objM5 == uobVar2) {
                gbd gbdVar = new gbd(bo4Var, ubfVar2, j78Var3, j78Var4, null, 23);
                p65Var.j0(gbdVar);
                objM5 = gbdVar;
            }
            kyd.k(p65Var, (b55) objM5, youProfileTab2);
        } else {
            p65Var = p65Var2;
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new gie(i, 5, r28Var, ubfVar, bo4Var, j78Var, j78Var2, d2fVar);
        }
    }

    public static final void b(r28 r28Var, x12 x12Var, int i) {
        p65 p65Var = (p65) x12Var;
        p65Var.a0(1020621749);
        int i2 = (p65Var.f(r28Var) ? 4 : 2) | i;
        if (p65Var.P(i2 & 1, (i2 & 3) != 2)) {
            r28 r28VarX = ho2.x((jp7) p65Var.j(kt7.a), r28Var, 3, 1.0f);
            ar0 ar0Var = z46.h;
            zk7 zk7VarC = dy0.c(ar0Var, false);
            long j = p65Var.T;
            int i3 = (int) (j ^ (j >>> 32));
            i89 i89VarL = p65Var.l();
            r28 r28VarR = gx1.R(p65Var, r28VarX);
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
            o28 o28Var = o28.b;
            r28 r28VarD = jfc.d(jfc.o(o28Var, 0.0f, 0.0f, 648.0f, 0.0f, 11), 1.0f);
            zk7 zk7VarC2 = dy0.c(z46.d, false);
            long j2 = p65Var.T;
            int i4 = (int) (j2 ^ (j2 >>> 32));
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
            ka1.z(i4, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR2);
            iq7.b(iy0.a.a(jfc.d(o28Var, 1.0f), ar0Var), vo7.R(p65Var, R.string.common_oops), null, null, null, null, null, p65Var, 384, 120);
            p65Var.p(true);
            p65Var.p(true);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new sed(r28Var, i, 18);
        }
    }

    public static final void c(int i, long j, x12 x12Var, r28 r28Var) {
        long j2;
        long j3;
        ar0 ar0Var = z46.d;
        ar0 ar0Var2 = z46.h;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(694352768);
        int i2 = i | (p65Var.f(r28Var) ? 4 : 2) | 16;
        if (p65Var.P(i2 & 1, (i2 & 19) != 18)) {
            p65Var.U();
            if ((i & 1) == 0 || p65Var.z()) {
                j3 = ((zo7) p65Var.j(kt7.b)).c;
            } else {
                p65Var.S();
                j3 = j;
            }
            p65Var.q();
            sn3 sn3Var = kt7.a;
            ((jp7) p65Var.j(sn3Var)).getClass();
            stc stcVar = jp7.a(p65Var) == ip7.COMPACT ? stc.M : stc.L;
            r28 r28VarV = m40.V(r28Var.b(jfc.c), p65Var, 0);
            wv1 wv1VarA = uv1.a(qb8.c, z46.p, p65Var, 0);
            long j4 = p65Var.T;
            int i3 = (int) (j4 ^ (j4 >>> 32));
            i89 i89VarL = p65Var.l();
            r28 r28VarR = gx1.R(p65Var, r28VarV);
            r12.W.getClass();
            ot2 ot2Var = q12.b;
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            cu cuVar = q12.f;
            tp7.B(p65Var, cuVar, wv1VarA);
            cu cuVar2 = q12.e;
            tp7.B(p65Var, cuVar2, i89VarL);
            Integer numValueOf = Integer.valueOf(i3);
            cu cuVar3 = q12.g;
            tp7.B(p65Var, cuVar3, numValueOf);
            fn fnVar = q12.h;
            tp7.y(p65Var, fnVar);
            cu cuVar4 = q12.d;
            tp7.B(p65Var, cuVar4, r28VarR);
            jp7 jp7Var = (jp7) p65Var.j(sn3Var);
            o28 o28Var = o28.b;
            stc stcVar2 = stcVar;
            r28 r28VarJ = ka1.j(jp7Var, o28Var, 3, 1.0f);
            zk7 zk7VarC = dy0.c(ar0Var2, false);
            ar0 ar0Var3 = ar0Var2;
            long j5 = p65Var.T;
            int i4 = (int) (j5 ^ (j5 >>> 32));
            i89 i89VarL2 = p65Var.l();
            r28 r28VarR2 = gx1.R(p65Var, r28VarJ);
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, cuVar, zk7VarC);
            tp7.B(p65Var, cuVar2, i89VarL2);
            ka1.z(i4, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR2);
            o28 o28Var2 = o28Var;
            r28 r28VarD = jfc.d(jfc.o(o28Var2, 0.0f, 0.0f, 648.0f, 0.0f, 11), 1.0f);
            zk7 zk7VarC2 = dy0.c(ar0Var, false);
            long j6 = p65Var.T;
            int i5 = (int) (j6 ^ (j6 >>> 32));
            i89 i89VarL3 = p65Var.l();
            r28 r28VarR3 = gx1.R(p65Var, r28VarD);
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, cuVar, zk7VarC2);
            tp7.B(p65Var, cuVar2, i89VarL3);
            ka1.z(i5, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR3);
            e(0, j3, p65Var, null);
            p65Var.p(true);
            p65Var.p(true);
            p65Var.Y(-1226887006);
            int iR = 0;
            while (iR < 5) {
                o28 o28Var3 = o28Var2;
                r28 r28VarJ2 = ka1.j((jp7) p65Var.j(kt7.a), o28Var3, 3, 1.0f);
                ar0 ar0Var4 = ar0Var3;
                zk7 zk7VarC3 = dy0.c(ar0Var4, false);
                long j7 = p65Var.T;
                int i6 = (int) (j7 ^ (j7 >>> 32));
                i89 i89VarL4 = p65Var.l();
                r28 r28VarR4 = gx1.R(p65Var, r28VarJ2);
                r12.W.getClass();
                ot2 ot2Var2 = q12.b;
                p65Var.c0();
                if (p65Var.S) {
                    p65Var.k(ot2Var2);
                } else {
                    p65Var.m0();
                }
                cu cuVar5 = q12.f;
                tp7.B(p65Var, cuVar5, zk7VarC3);
                cu cuVar6 = q12.e;
                tp7.B(p65Var, cuVar6, i89VarL4);
                Integer numValueOf2 = Integer.valueOf(i6);
                cu cuVar7 = q12.g;
                tp7.B(p65Var, cuVar7, numValueOf2);
                fn fnVar2 = q12.h;
                tp7.y(p65Var, fnVar2);
                cu cuVar8 = q12.d;
                tp7.B(p65Var, cuVar8, r28VarR4);
                o28Var2 = o28Var3;
                r28 r28VarD2 = jfc.d(jfc.o(o28Var2, 0.0f, 0.0f, 648.0f, 0.0f, 11), 1.0f);
                zk7 zk7VarC4 = dy0.c(ar0Var, false);
                long j8 = j3;
                long j9 = p65Var.T;
                int i7 = (int) (j9 ^ (j9 >>> 32));
                i89 i89VarL5 = p65Var.l();
                r28 r28VarR5 = gx1.R(p65Var, r28VarD2);
                p65Var.c0();
                if (p65Var.S) {
                    p65Var.k(ot2Var2);
                } else {
                    p65Var.m0();
                }
                tp7.B(p65Var, cuVar5, zk7VarC4);
                tp7.B(p65Var, cuVar6, i89VarL5);
                ka1.z(i7, p65Var, cuVar7, p65Var, fnVar2);
                tp7.B(p65Var, cuVar8, r28VarR5);
                j3 = j8;
                il7.l(stcVar2, null, j3, null, p65Var, 0, 10);
                iR = wgd.r(p65Var, true, true, iR, 1);
                ar0Var3 = ar0Var4;
            }
            p65Var.p(false);
            p65Var.p(true);
            j2 = j3;
        } else {
            p65Var.S();
            j2 = j;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new po(r28Var, j2, i, 26);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:196:0x082d  */
    /* JADX WARN: Removed duplicated region for block: B:199:0x0839  */
    /* JADX WARN: Removed duplicated region for block: B:201:0x083d  */
    /* JADX WARN: Removed duplicated region for block: B:204:0x084d  */
    /* JADX WARN: Removed duplicated region for block: B:206:0x0851  */
    /* JADX WARN: Removed duplicated region for block: B:208:0x0855  */
    /* JADX WARN: Removed duplicated region for block: B:209:0x0857  */
    /* JADX WARN: Removed duplicated region for block: B:213:0x0861  */
    /* JADX WARN: Removed duplicated region for block: B:217:0x087c  */
    /* JADX WARN: Removed duplicated region for block: B:220:0x0885  */
    /* JADX WARN: Removed duplicated region for block: B:222:0x0889  */
    /* JADX WARN: Removed duplicated region for block: B:84:0x04ac A[PHI: r9
      0x04ac: PHI (r9v27 d2f) = (r9v25 d2f), (r9v28 d2f) binds: [B:83:0x04aa, B:79:0x04a3] A[DONT_GENERATE, DONT_INLINE]] */
    /* JADX WARN: Removed duplicated region for block: B:96:0x04ca A[ADDED_TO_REGION] */
    /* JADX WARN: Removed duplicated region for block: B:97:0x04cc  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final void d(defpackage.yt7 r61, final defpackage.ubf r62, final defpackage.d2f r63, defpackage.r28 r64, defpackage.x12 r65, int r66) {
        /*
            Method dump skipped, instruction units count: 2242
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.medium.android.profile.ui.you.b.d(yt7, ubf, d2f, r28, x12, int):void");
    }

    public static final void e(int i, long j, x12 x12Var, r28 r28Var) {
        r28 r28Var2;
        r28 r28Var3;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-1062353999);
        int i2 = i | 6;
        if ((i & 48) == 0) {
            i2 |= p65Var.e(j) ? 32 : 16;
        }
        int i3 = i2;
        if (p65Var.P(i3 & 1, (i3 & 19) != 18)) {
            p65Var.U();
            int i4 = i & 1;
            o28 o28Var = o28.b;
            if (i4 == 0 || p65Var.z()) {
                r28Var3 = o28Var;
            } else {
                p65Var.S();
                r28Var3 = r28Var;
            }
            p65Var.q();
            r28 r28VarD = jfc.d(w2g.E(r28Var3, 24.0f, 0.0f, 2), 1.0f);
            rz5 rz5Var = qb8.c;
            yq0 yq0Var = z46.p;
            wv1 wv1VarA = uv1.a(rz5Var, yq0Var, p65Var, 0);
            long j2 = p65Var.T;
            int i5 = (int) (j2 ^ (j2 >>> 32));
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
            tp7.B(p65Var, cuVar, wv1VarA);
            cu cuVar2 = q12.e;
            tp7.B(p65Var, cuVar2, i89VarL);
            Integer numValueOf = Integer.valueOf(i5);
            cu cuVar3 = q12.g;
            tp7.B(p65Var, cuVar3, numValueOf);
            fn fnVar = q12.h;
            tp7.y(p65Var, fnVar);
            cu cuVar4 = q12.d;
            tp7.B(p65Var, cuVar4, r28VarR);
            r28 r28VarD2 = jfc.d(o28Var, 1.0f);
            fa4 fa4Var = qb8.a;
            zq0 zq0Var = z46.m;
            omb ombVarA = nmb.a(fa4Var, zq0Var, p65Var, 0);
            long j3 = p65Var.T;
            int i6 = (int) (j3 ^ (j3 >>> 32));
            i89 i89VarL2 = p65Var.l();
            r28 r28VarR2 = gx1.R(p65Var, r28VarD2);
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, cuVar, ombVarA);
            tp7.B(p65Var, cuVar2, i89VarL2);
            ka1.z(i6, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR2);
            int i7 = ((i3 << 3) & 896) | 6;
            r28 r28Var4 = r28Var3;
            d46.d(hl0.L, null, j, p65Var, i7, 2);
            hp7.t(p65Var, jfc.l(o28Var, 16.0f));
            wv1 wv1VarA2 = uv1.a(rz5Var, yq0Var, p65Var, 0);
            long j4 = p65Var.T;
            int i8 = (int) (j4 ^ (j4 >>> 32));
            i89 i89VarL3 = p65Var.l();
            r28 r28VarR3 = gx1.R(p65Var, o28Var);
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, cuVar, wv1VarA2);
            tp7.B(p65Var, cuVar2, i89VarL3);
            ka1.z(i8, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR3);
            sn3 sn3Var = jt7.c;
            int i9 = ((i3 << 6) & 7168) | 48;
            ok7.r(200.0f, i9, 4, j, p65Var, null, ((bu7) p65Var.j(sn3Var)).h);
            ok7.r(160.0f, i9, 4, j, p65Var, null, ((bu7) lv8.n(o28Var, 8.0f, p65Var, sn3Var)).l);
            p65Var = p65Var;
            p65Var.p(true);
            p65Var.p(true);
            Context context = (Context) p65Var.j(eo.b);
            context.getClass();
            float f = r0.widthPixels / context.getResources().getDisplayMetrics().density;
            r28 r28VarG = w2g.G(jfc.d(jfc.q(o28Var, 0.0f, (vj3.a(f, 600.0f) < 0 ? ip7.COMPACT : vj3.a(f, 840.0f) < 0 ? ip7.MEDIUM : ip7.EXPANDED) == ip7.COMPACT ? Float.NaN : 344.0f, 1), 1.0f), 0.0f, 20.0f, 0.0f, 0.0f, 13);
            omb ombVarA2 = nmb.a(new h70(12.0f, true, new z10(21)), zq0Var, p65Var, 6);
            long j5 = p65Var.T;
            int i10 = (int) (j5 ^ (j5 >>> 32));
            i89 i89VarL4 = p65Var.l();
            r28 r28VarR4 = gx1.R(p65Var, r28VarG);
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, cuVar, ombVarA2);
            tp7.B(p65Var, cuVar2, i89VarL4);
            ka1.z(i10, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR4);
            xn7 xn7Var = xn7.M;
            if (1.0f <= 0.0d) {
                z16.a("invalid weight; must be greater than zero");
            }
            fo7.h(xn7Var, new sq6(1.0f > Float.MAX_VALUE ? Float.MAX_VALUE : 1.0f, true), j, p65Var, i7, 0);
            if (1.0f <= 0.0d) {
                z16.a("invalid weight; must be greater than zero");
            }
            fo7.h(xn7Var, new sq6(1.0f > Float.MAX_VALUE ? Float.MAX_VALUE : 1.0f, true), j, p65Var, i7, 0);
            p65Var.p(true);
            p65Var.p(true);
            r28Var2 = r28Var4;
        } else {
            p65Var.S();
            r28Var2 = r28Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new sa0(r28Var2, j, i, 16);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:38:0x006b  */
    /* JADX WARN: Removed duplicated region for block: B:41:0x0075  */
    /* JADX WARN: Removed duplicated region for block: B:42:0x0077  */
    /* JADX WARN: Removed duplicated region for block: B:45:0x0080  */
    /* JADX WARN: Removed duplicated region for block: B:90:0x01bc  */
    /* JADX WARN: Removed duplicated region for block: B:93:0x01ca  */
    /* JADX WARN: Removed duplicated region for block: B:95:? A[RETURN, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final void f(defpackage.xbf r26, defpackage.bo4 r27, defpackage.d2f r28, defpackage.r28 r29, defpackage.nhc r30, defpackage.x12 r31, int r32, int r33) {
        /*
            Method dump skipped, instruction units count: 477
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.medium.android.profile.ui.you.b.f(xbf, bo4, d2f, r28, nhc, x12, int, int):void");
    }

    public static final void g(YouProfileTab youProfileTab, String str, bo4 bo4Var, obf obfVar, r28 r28Var, i iVar, x12 x12Var, int i) {
        i iVar2;
        int i2;
        i iVar3;
        youProfileTab.getClass();
        str.getClass();
        bo4Var.getClass();
        p65 p65Var = (p65) x12Var;
        p65Var.a0(1300796344);
        int i3 = i | (p65Var.f(youProfileTab) ? 4 : 2) | (p65Var.f(str) ? 32 : 16) | (p65Var.h(bo4Var) ? 256 : 128) | (p65Var.f(obfVar) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024) | (p65Var.f(r28Var) ? OlympusMakernoteDirectory.TAG_MAIN_INFO : 8192) | ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID;
        if (p65Var.P(i3 & 1, (74899 & i3) != 74898)) {
            p65Var.U();
            if ((i & 1) == 0 || p65Var.z()) {
                boolean z = ((i3 & 14) == 4) | ((i3 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32);
                Object objM = p65Var.M();
                if (z || objM == w12.a) {
                    objM = new vrd(youProfileTab, 25, str);
                    p65Var.j0(objM);
                }
                x45 x45Var = (x45) objM;
                wue wueVarA = e67.a(p65Var);
                if (wueVarA == null) {
                    ygf.f("No ViewModelStoreOwner was provided via LocalViewModelStoreOwner");
                    return;
                } else {
                    i iVar4 = (i) to7.z(n1b.a.b(i.class), wueVarA, t40.E(wueVarA, p65Var), wueVarA instanceof pi5 ? r40.N(((pi5) wueVarA).getDefaultViewModelCreationExtras(), x45Var) : r40.N(og2.b, x45Var), p65Var);
                    i2 = i3 & (-458753);
                    iVar3 = iVar4;
                }
            } else {
                p65Var.S();
                i2 = i3 & (-458753);
                iVar3 = iVar;
            }
            p65Var.q();
            f((xbf) guc.z(iVar3.l, p65Var, 0).getValue(), bo4Var, new d2f(obfVar, 2, iVar3), r28Var, null, p65Var, (i2 >> 3) & 7280, 16);
            iVar2 = iVar3;
        } else {
            p65Var.S();
            iVar2 = iVar;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new gie(youProfileTab, str, bo4Var, obfVar, r28Var, iVar2, i, 6);
        }
    }
}
