package defpackage;

import com.drew.lang.RandomAccessStreamReader;
import com.drew.metadata.exif.makernotes.OlympusMakernoteDirectory;
import com.drew.metadata.exif.makernotes.PanasonicMakernoteDirectory;
import com.drew.metadata.exif.makernotes.ReconyxHyperFire2MakernoteDirectory;
import com.drew.metadata.exif.makernotes.ReconyxUltraFireMakernoteDirectory;
import com.medium.proto.event.BooksTabPresented;
import gen.model.SourceParameter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class sfe {
    public static final k54 a = sz3.f(new tjd(19), 7).a(sz3.d(null, 3));

    public static final void a(hge hgeVar, r28 r28Var, rfe rfeVar, x12 x12Var, int i) {
        int i2;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(997209191);
        if ((i & 6) == 0) {
            i2 = (p65Var.f(hgeVar) ? 4 : 2) | i;
        } else {
            i2 = i;
        }
        if ((i & 48) == 0) {
            i2 |= p65Var.f(r28Var) ? 32 : 16;
        }
        if ((i & 384) == 0) {
            i2 |= p65Var.f(rfeVar) ? 256 : 128;
        }
        if (p65Var.P(i2 & 1, (i2 & 147) != 146)) {
            r28 r28VarX = ho2.x((jp7) p65Var.j(kt7.a), bgf.N(r28Var, "account_suspended_state"), 3, 1.0f);
            zk7 zk7VarC = dy0.c(z46.h, false);
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
            r28 r28VarD = jfc.d(jfc.o(o28.b, 0.0f, 0.0f, 648.0f, 0.0f, 11), 1.0f);
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
            boolean z = ((i2 & 14) == 4) | ((i2 & 896) == 256);
            Object objM = p65Var.M();
            if (z || objM == w12.a) {
                objM = new ube(rfeVar, 5, hgeVar);
                p65Var.j0(objM);
            }
            mk7.m(0, p65Var, (m45) objM, null);
            p65Var.p(true);
            p65Var.p(true);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new pfe(i, 0, hgeVar, r28Var, rfeVar);
        }
    }

    public static final void b(ige igeVar, rfe rfeVar, kv6 kv6Var, float f, r28 r28Var, x12 x12Var, int i) {
        int i2;
        kv6 kv6Var2;
        p65 p65Var;
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(520670032);
        if ((i & 6) == 0) {
            i2 = (p65Var2.f(igeVar) ? 4 : 2) | i;
        } else {
            i2 = i;
        }
        if ((i & 48) == 0) {
            i2 |= p65Var2.f(rfeVar) ? 32 : 16;
        }
        if ((i & 384) == 0) {
            kv6Var2 = kv6Var;
            i2 |= p65Var2.f(kv6Var2) ? 256 : 128;
        } else {
            kv6Var2 = kv6Var;
        }
        if ((i & 3072) == 0) {
            i2 |= p65Var2.c(f) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024;
        }
        if ((i & 24576) == 0) {
            i2 |= p65Var2.f(r28Var) ? OlympusMakernoteDirectory.TAG_MAIN_INFO : 8192;
        }
        if (p65Var2.P(i2 & 1, (i2 & 9363) != 9362)) {
            r28 r28VarJ = rv8.J(bgf.N(r28Var, "content_state"), jq7.t(p65Var2), null);
            jy8 jy8VarH = w2g.h(0.0f, 0.0f, 0.0f, f, 7);
            int i3 = i2 & 14;
            boolean z = i3 == 4;
            int i4 = i2 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION;
            boolean z2 = z | (i4 == 32);
            Object objM = p65Var2.M();
            uob uobVar = w12.a;
            if (z2 || objM == uobVar) {
                objM = new vrd(igeVar, 12, rfeVar);
                p65Var2.j0(objM);
            }
            k40.t(r28VarJ, kv6Var2, jy8VarH, null, null, null, false, null, (x45) objM, p65Var2, (i2 >> 3) & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION, 504);
            p65Var = p65Var2;
            oge ogeVar = rfeVar.a;
            String str = ogeVar.i;
            SourceParameter sourceParameter = ogeVar.j;
            String str2 = ogeVar.c;
            if (!ogeVar.h) {
                ogeVar.h = true;
                ogeVar.f.j(str2, gp7.u(sourceParameter), str);
                yx2 yx2Var = ogeVar.g;
                String str3 = ogeVar.b;
                String strU = gp7.u(sourceParameter);
                yx2Var.getClass();
                str3.getClass();
                rqd.a(yx2Var.a, new BooksTabPresented(null, str3, null, 5, null), str2, strU, false, null, str, 24);
            }
            Boolean boolValueOf = Boolean.valueOf(igeVar.d);
            boolean z3 = (i4 == 32) | (i3 == 4);
            Object objM2 = p65Var.M();
            if (z3 || objM2 == uobVar) {
                objM2 = new n79(rfeVar, igeVar, null, 29);
                p65Var.j0(objM2);
            }
            kyd.k(p65Var, (b55) objM2, boolValueOf);
        } else {
            p65Var = p65Var2;
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new lu0(igeVar, rfeVar, kv6Var, f, r28Var, i);
        }
    }

    public static final void c(jge jgeVar, rfe rfeVar, r28 r28Var, x12 x12Var, int i) {
        int i2;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-1656538063);
        if ((i & 6) == 0) {
            i2 = (p65Var.f(jgeVar) ? 4 : 2) | i;
        } else {
            i2 = i;
        }
        if ((i & 48) == 0) {
            i2 |= p65Var.f(rfeVar) ? 32 : 16;
        }
        if ((i & 384) == 0) {
            i2 |= p65Var.f(r28Var) ? 256 : 128;
        }
        if (p65Var.P(i2 & 1, (i2 & 147) != 146)) {
            b24 b24Var = jgeVar.a;
            r28 r28VarN = bgf.N(r28Var, "error_state");
            boolean z = (i2 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32;
            Object objM = p65Var.M();
            if (z || objM == w12.a) {
                k8e k8eVar = new k8e(0, rfeVar, rfe.class, "refresh", "refresh()V", 0, 10);
                p65Var.j0(k8eVar);
                objM = k8eVar;
            }
            iq7.a(b24Var, r28VarN, null, null, null, null, (m45) ((qh6) objM), null, p65Var, 0, 188);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new y5c(i, 28, jgeVar, rfeVar, r28Var);
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    public static final void d(int i, long j, x12 x12Var, r28 r28Var) {
        long j2;
        long j3;
        rz5 rz5Var = qb8.c;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-204924621);
        int i2 = i | (p65Var.f(r28Var) ? 4 : 2) | 16;
        int i3 = 0;
        boolean z = true;
        if (p65Var.P(i2 & 1, (i2 & 19) != 18)) {
            p65Var.U();
            if ((i & 1) == 0 || p65Var.z()) {
                j3 = ((zo7) p65Var.j(kt7.b)).c;
            } else {
                p65Var.S();
                j3 = j;
            }
            p65Var.q();
            r28 r28VarV = m40.V(bgf.N(r28Var, "loading_state"), p65Var, 0);
            wv1 wv1VarA = uv1.a(rz5Var, z46.q, p65Var, 48);
            long j4 = p65Var.T;
            char c = ' ';
            int i4 = (int) (j4 ^ (j4 >>> 32));
            i89 i89VarL = p65Var.l();
            r28 r28VarR = gx1.R(p65Var, r28VarV);
            r12.W.getClass();
            m45 m45Var = q12.b;
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(m45Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, q12.f, wv1VarA);
            tp7.B(p65Var, q12.e, i89VarL);
            tp7.B(p65Var, q12.g, Integer.valueOf(i4));
            tp7.y(p65Var, q12.h);
            tp7.B(p65Var, q12.d, r28VarR);
            p65Var.Y(1580715429);
            int i5 = 0;
            while (i5 < 10) {
                wv1 wv1VarA2 = uv1.a(rz5Var, z46.p, p65Var, i3);
                long j5 = p65Var.T;
                int i6 = (int) (j5 ^ (j5 >>> c));
                i89 i89VarL2 = p65Var.l();
                o28 o28Var = o28.b;
                r28 r28VarR2 = gx1.R(p65Var, o28Var);
                r12.W.getClass();
                m45 m45Var2 = q12.b;
                p65Var.c0();
                char c2 = c;
                if (p65Var.S) {
                    p65Var.k(m45Var2);
                } else {
                    p65Var.m0();
                }
                cu cuVar = q12.f;
                tp7.B(p65Var, cuVar, wv1VarA2);
                cu cuVar2 = q12.e;
                tp7.B(p65Var, cuVar2, i89VarL2);
                Integer numValueOf = Integer.valueOf(i6);
                cu cuVar3 = q12.g;
                tp7.B(p65Var, cuVar3, numValueOf);
                fn fnVar = q12.h;
                tp7.y(p65Var, fnVar);
                cu cuVar4 = q12.d;
                tp7.B(p65Var, cuVar4, r28VarR2);
                d8a d8aVar = kt7.a;
                rz5 rz5Var2 = rz5Var;
                r28 r28VarJ = ka1.j((jp7) p65Var.j(d8aVar), o28Var, 3, 1.0f);
                ar0 ar0Var = z46.h;
                zk7 zk7VarC = dy0.c(ar0Var, false);
                long j6 = j3;
                long j7 = p65Var.T;
                int i7 = (int) (j7 ^ (j7 >>> c2));
                i89 i89VarL3 = p65Var.l();
                r28 r28VarR3 = gx1.R(p65Var, r28VarJ);
                p65Var.c0();
                if (p65Var.S) {
                    p65Var.k(m45Var2);
                } else {
                    p65Var.m0();
                }
                tp7.B(p65Var, cuVar, zk7VarC);
                tp7.B(p65Var, cuVar2, i89VarL3);
                ka1.z(i7, p65Var, cuVar3, p65Var, fnVar);
                tp7.B(p65Var, cuVar4, r28VarR3);
                r28 r28VarD = jfc.d(jfc.o(o28Var, 0.0f, 0.0f, 648.0f, 0.0f, 11), 1.0f);
                ar0 ar0Var2 = z46.d;
                zk7 zk7VarC2 = dy0.c(ar0Var2, false);
                int i8 = i5;
                long j8 = p65Var.T;
                int i9 = (int) (j8 ^ (j8 >>> c2));
                i89 i89VarL4 = p65Var.l();
                r28 r28VarR4 = gx1.R(p65Var, r28VarD);
                p65Var.c0();
                if (p65Var.S) {
                    p65Var.k(m45Var2);
                } else {
                    p65Var.m0();
                }
                tp7.B(p65Var, cuVar, zk7VarC2);
                tp7.B(p65Var, cuVar2, i89VarL4);
                ka1.z(i9, p65Var, cuVar3, p65Var, fnVar);
                tp7.B(p65Var, cuVar4, r28VarR4);
                j3 = j6;
                hlg.c(0, j3, p65Var, null);
                p65Var.p(true);
                p65Var.p(true);
                r28 r28VarJ2 = ka1.j((jp7) p65Var.j(d8aVar), o28Var, 3, 1.0f);
                zk7 zk7VarC3 = dy0.c(ar0Var, false);
                long j9 = p65Var.T;
                int i10 = (int) (j9 ^ (j9 >>> c2));
                i89 i89VarL5 = p65Var.l();
                r28 r28VarR5 = gx1.R(p65Var, r28VarJ2);
                p65Var.c0();
                if (p65Var.S) {
                    p65Var.k(m45Var2);
                } else {
                    p65Var.m0();
                }
                tp7.B(p65Var, cuVar, zk7VarC3);
                tp7.B(p65Var, cuVar2, i89VarL5);
                ka1.z(i10, p65Var, cuVar3, p65Var, fnVar);
                tp7.B(p65Var, cuVar4, r28VarR5);
                r28 r28VarD2 = jfc.d(jfc.o(o28Var, 0.0f, 0.0f, 648.0f, 0.0f, 11), 1.0f);
                zk7 zk7VarC4 = dy0.c(ar0Var2, false);
                long j10 = p65Var.T;
                int i11 = (int) (j10 ^ (j10 >>> c2));
                i89 i89VarL6 = p65Var.l();
                r28 r28VarR6 = gx1.R(p65Var, r28VarD2);
                p65Var.c0();
                if (p65Var.S) {
                    p65Var.k(m45Var2);
                } else {
                    p65Var.m0();
                }
                tp7.B(p65Var, cuVar, zk7VarC4);
                tp7.B(p65Var, cuVar2, i89VarL6);
                ka1.z(i11, p65Var, cuVar3, p65Var, fnVar);
                tp7.B(p65Var, cuVar4, r28VarR6);
                tp7.c(0.0f, 6, 4, j3, p65Var, w2g.E(o28Var, 24.0f, 0.0f, 2));
                p65Var.p(true);
                p65Var.p(true);
                p65Var.p(true);
                i5 = i8 + 1;
                c = c2;
                z = true;
                rz5Var = rz5Var2;
                i3 = 0;
            }
            p65Var.p(i3);
            p65Var.p(z);
            j2 = j3;
        } else {
            p65Var.S();
            j2 = j;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new po(r28Var, j2, i, 23);
        }
    }

    public static final void e(lge lgeVar, r28 r28Var, rfe rfeVar, x12 x12Var, int i) {
        int i2;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-1606644055);
        if ((i & 6) == 0) {
            i2 = (p65Var.f(lgeVar) ? 4 : 2) | i;
        } else {
            i2 = i;
        }
        if ((i & 48) == 0) {
            i2 |= p65Var.f(r28Var) ? 32 : 16;
        }
        if ((i & 384) == 0) {
            i2 |= p65Var.f(rfeVar) ? 256 : 128;
        }
        if (p65Var.P(i2 & 1, (i2 & 147) != 146)) {
            r28 r28VarX = ho2.x((jp7) p65Var.j(kt7.a), bgf.N(r28Var, "not_found_state"), 3, 1.0f);
            zk7 zk7VarC = dy0.c(z46.h, false);
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
            r28 r28VarD = jfc.d(jfc.o(o28.b, 0.0f, 0.0f, 648.0f, 0.0f, 11), 1.0f);
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
            boolean z = ((i2 & 14) == 4) | ((i2 & 896) == 256);
            Object objM = p65Var.M();
            if (z || objM == w12.a) {
                objM = new ube(rfeVar, 4, lgeVar);
                p65Var.j0(objM);
            }
            il7.o(0, p65Var, (m45) objM, null);
            p65Var.p(true);
            p65Var.p(true);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new y5c(i, 29, lgeVar, r28Var, rfeVar);
        }
    }

    public static final void f(mge mgeVar, rfe rfeVar, r28 r28Var, kv6 kv6Var, float f, x12 x12Var, int i) {
        int i2;
        float f2;
        mgeVar.getClass();
        p65 p65Var = (p65) x12Var;
        p65Var.a0(1668438945);
        if ((i & 6) == 0) {
            i2 = (p65Var.f(mgeVar) ? 4 : 2) | i;
        } else {
            i2 = i;
        }
        if ((i & 48) == 0) {
            i2 |= p65Var.f(rfeVar) ? 32 : 16;
        }
        if ((i & 384) == 0) {
            i2 |= p65Var.f(r28Var) ? 256 : 128;
        }
        if ((i & 3072) == 0) {
            i2 |= p65Var.f(kv6Var) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024;
        }
        if ((i & 24576) == 0) {
            f2 = f;
            i2 |= p65Var.c(f2) ? OlympusMakernoteDirectory.TAG_MAIN_INFO : 8192;
        } else {
            f2 = f;
        }
        if (p65Var.P(i2 & 1, (i2 & 9363) != 9362)) {
            p65Var.U();
            if ((i & 1) != 0 && !p65Var.z()) {
                p65Var.S();
            }
            p65Var.q();
            Object objM = p65Var.M();
            if (objM == w12.a) {
                objM = new tjd(20);
                p65Var.j0(objM);
            }
            r28 r28VarB = wxb.a(r28Var, false, (x45) objM).b(jfc.c);
            if (mgeVar instanceof ige) {
                p65Var.Y(-1191443374);
                int i3 = i2 & ReconyxHyperFire2MakernoteDirectory.TAG_SERIAL_NUMBER;
                int i4 = i2 >> 3;
                b((ige) mgeVar, rfeVar, kv6Var, f2, r28VarB, p65Var, i3 | (i4 & 896) | (i4 & 7168));
                p65Var.p(false);
            } else if (mgeVar instanceof kge) {
                p65Var.Y(1347049022);
                d(0, 0L, p65Var, r28VarB);
                p65Var.p(false);
            } else if (mgeVar instanceof jge) {
                p65Var.Y(1347051906);
                c((jge) mgeVar, rfeVar, r28VarB, p65Var, i2 & ReconyxHyperFire2MakernoteDirectory.TAG_SERIAL_NUMBER);
                p65Var.p(false);
            } else if (mgeVar instanceof hge) {
                p65Var.Y(-1190867115);
                a((hge) mgeVar, r28VarB, rfeVar, p65Var, ((i2 << 3) & 896) | (i2 & 14));
                p65Var.p(false);
            } else {
                if (!(mgeVar instanceof lge)) {
                    throw ho2.L(p65Var, 1347037961, false);
                }
                p65Var.Y(-1190667971);
                e((lge) mgeVar, r28VarB, rfeVar, p65Var, ((i2 << 3) & 896) | (i2 & 14));
                p65Var.p(false);
            }
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new lu0(mgeVar, rfeVar, r28Var, kv6Var, f, i, 4);
        }
    }

    public static final void g(String str, String str2, nfe nfeVar, bo4 bo4Var, r28 r28Var, float f, oge ogeVar, x12 x12Var, int i, int i2) {
        float f2;
        int i3;
        float f3;
        oge ogeVar2;
        oge ogeVar3;
        int i4;
        Object j5dVar;
        oge ogeVar4;
        str.getClass();
        bo4Var.getClass();
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-686273351);
        int i5 = i | (p65Var.f(str) ? 4 : 2) | (p65Var.f(str2) ? 32 : 16) | (p65Var.f(nfeVar) ? 256 : 128) | (p65Var.h(bo4Var) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024);
        int i6 = i2 & 32;
        if (i6 != 0) {
            i3 = i5 | 196608;
            f2 = f;
        } else {
            f2 = f;
            i3 = i5 | (p65Var.c(f2) ? 131072 : ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID);
        }
        int i7 = i3 | 524288;
        if (p65Var.P(i7 & 1, (599187 & i7) != 599186)) {
            p65Var.U();
            int i8 = i & 1;
            uob uobVar = w12.a;
            if (i8 == 0 || p65Var.z()) {
                if (i6 != 0) {
                    f2 = 0.0f;
                }
                boolean z = ((i7 & 14) == 4) | ((i7 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32);
                Object objM = p65Var.M();
                if (z || objM == uobVar) {
                    objM = new bb0(str, str2, 27);
                    p65Var.j0(objM);
                }
                x45 x45Var = (x45) objM;
                wue wueVarA = e67.a(p65Var);
                if (wueVarA == null) {
                    ygf.f("No ViewModelStoreOwner was provided via LocalViewModelStoreOwner");
                    return;
                } else {
                    ogeVar3 = (oge) to7.z(n1b.a.b(oge.class), wueVarA, t40.E(wueVarA, p65Var), wueVarA instanceof pi5 ? r40.N(((pi5) wueVarA).getDefaultViewModelCreationExtras(), x45Var) : r40.N(og2.b, x45Var), p65Var);
                    i4 = i7 & (-3670017);
                }
            } else {
                p65Var.S();
                i4 = i7 & (-3670017);
                ogeVar3 = ogeVar;
            }
            float f4 = f2;
            p65Var.q();
            l78 l78VarZ = guc.z(ogeVar3.k, p65Var, 0);
            kv6 kv6VarA = pv6.a(p65Var);
            f((mge) l78VarZ.getValue(), new rfe(ogeVar3, nfeVar), r28Var, kv6VarA, f4, p65Var, 384 | ((i4 >> 3) & 57344));
            boolean zH = p65Var.h(bo4Var) | p65Var.h(ogeVar3) | p65Var.f(kv6VarA);
            Object objM2 = p65Var.M();
            if (zH || objM2 == uobVar) {
                ogeVar4 = ogeVar3;
                j5dVar = new j5d(bo4Var, ogeVar4, kv6VarA, null, 15);
                p65Var.j0(j5dVar);
            } else {
                j5dVar = objM2;
                ogeVar4 = ogeVar3;
            }
            kyd.k(p65Var, (b55) j5dVar, c1e.a);
            ogeVar2 = ogeVar4;
            f3 = f4;
        } else {
            p65Var.S();
            f3 = f2;
            ogeVar2 = ogeVar;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new v00(str, str2, nfeVar, bo4Var, r28Var, f3, ogeVar2, i, i2, 4);
        }
    }
}
