package com.medium.android.profile.ui.view;

import android.content.res.Resources;
import com.drew.metadata.exif.makernotes.OlympusMakernoteDirectory;
import com.drew.metadata.exif.makernotes.PanasonicMakernoteDirectory;
import com.drew.metadata.exif.makernotes.ReconyxUltraFireMakernoteDirectory;
import com.drew.metadata.photoshop.PhotoshopDirectory;
import com.medium.android.donkey.main.Wv.MaAxRJinch;
import com.medium.android.profile.ui.view.UserProfileTab;
import com.medium.reader.R;
import defpackage.ar0;
import defpackage.b24;
import defpackage.b55;
import defpackage.bgf;
import defpackage.bjc;
import defpackage.bu7;
import defpackage.c1e;
import defpackage.cfd;
import defpackage.cu;
import defpackage.cu1;
import defpackage.d13;
import defpackage.d42;
import defpackage.d46;
import defpackage.die;
import defpackage.dl7;
import defpackage.dy0;
import defpackage.dyc;
import defpackage.e67;
import defpackage.eo;
import defpackage.er7;
import defpackage.fn;
import defpackage.g49;
import defpackage.g9b;
import defpackage.gie;
import defpackage.guc;
import defpackage.gx1;
import defpackage.h5d;
import defpackage.ho2;
import defpackage.hp7;
import defpackage.hu0;
import defpackage.i89;
import defpackage.ihe;
import defpackage.iie;
import defpackage.ije;
import defpackage.il7;
import defpackage.ip7;
import defpackage.iq7;
import defpackage.iy0;
import defpackage.j5d;
import defpackage.j78;
import defpackage.jfc;
import defpackage.jie;
import defpackage.jje;
import defpackage.jp7;
import defpackage.jt7;
import defpackage.jz8;
import defpackage.k40;
import defpackage.k8e;
import defpackage.ka1;
import defpackage.kt7;
import defpackage.kv4;
import defpackage.kyc;
import defpackage.kyd;
import defpackage.l36;
import defpackage.l78;
import defpackage.m40;
import defpackage.m45;
import defpackage.m73;
import defpackage.mje;
import defpackage.mk7;
import defpackage.mwa;
import defpackage.mz1;
import defpackage.n1b;
import defpackage.n92;
import defpackage.nhc;
import defpackage.nje;
import defpackage.nmb;
import defpackage.ns7;
import defpackage.o28;
import defpackage.o7c;
import defpackage.obb;
import defpackage.og2;
import defpackage.ok7;
import defpackage.omb;
import defpackage.ot2;
import defpackage.ov0;
import defpackage.p65;
import defpackage.pge;
import defpackage.pi5;
import defpackage.pi9;
import defpackage.po;
import defpackage.pv0;
import defpackage.pxf;
import defpackage.q12;
import defpackage.qb8;
import defpackage.qh6;
import defpackage.qk7;
import defpackage.qo7;
import defpackage.r12;
import defpackage.r28;
import defpackage.r40;
import defpackage.rv8;
import defpackage.rz5;
import defpackage.sb2;
import defpackage.sn3;
import defpackage.stc;
import defpackage.t40;
import defpackage.tkc;
import defpackage.to7;
import defpackage.tp7;
import defpackage.ube;
import defpackage.uob;
import defpackage.upc;
import defpackage.uv1;
import defpackage.vrd;
import defpackage.vx4;
import defpackage.w12;
import defpackage.w2g;
import defpackage.wgd;
import defpackage.wue;
import defpackage.wv1;
import defpackage.x12;
import defpackage.x45;
import defpackage.y30;
import defpackage.ygf;
import defpackage.yq0;
import defpackage.z22;
import defpackage.z46;
import defpackage.zk7;
import defpackage.zo7;
import java.util.ArrayList;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public abstract class e {
    public static final void a(ije ijeVar, r28 r28Var, ihe iheVar, x12 x12Var, int i) {
        ije ijeVar2 = ijeVar;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(1303750758);
        int i2 = i | (p65Var.f(ijeVar2) ? 4 : 2) | (p65Var.f(r28Var) ? 32 : 16) | (p65Var.f(iheVar) ? 256 : 128);
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
                ijeVar2 = ijeVar;
                objM = new ube(iheVar, 8, ijeVar2);
                p65Var.j0(objM);
            } else {
                ijeVar2 = ijeVar;
            }
            mk7.m(0, p65Var, (m45) objM, null);
            p65Var.p(true);
            p65Var.p(true);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new h5d(i, 21, ijeVar2, r28Var, iheVar);
        }
    }

    public static final void b(jje jjeVar, ihe iheVar, r28 r28Var, x45 x45Var, x12 x12Var, int i) {
        x45 x45Var2;
        upc upcVar;
        j78 j78Var;
        Object hu0Var;
        jie jieVar;
        g49 g49Var;
        n92 n92Var;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-2047334505);
        int i2 = i | (p65Var.f(jjeVar) ? 4 : 2) | (p65Var.f(iheVar) ? 32 : 16) | (p65Var.f(r28Var) ? 256 : 128);
        if (p65Var.P(i2 & 1, (i2 & 1171) != 1170)) {
            m73 m73Var = (m73) p65Var.j(z22.h);
            float f = -m73Var.Z(45.0f);
            boolean zBooleanValue = ((Boolean) p65Var.j(l36.a)).booleanValue();
            Object[] objArr = new Object[0];
            boolean zG = p65Var.g(zBooleanValue) | p65Var.f(m73Var);
            Object objM = p65Var.M();
            uob uobVar = w12.a;
            if (zG || objM == uobVar) {
                objM = new d42(zBooleanValue, m73Var, 3);
                p65Var.j0(objM);
            }
            g49 g49Var2 = (g49) hp7.E(objArr, (m45) objM, p65Var, 0);
            Object[] objArr2 = new Object[0];
            Object objM2 = p65Var.M();
            if (objM2 == uobVar) {
                objM2 = new tkc(16);
                p65Var.j0(objM2);
            }
            g49 g49Var3 = (g49) hp7.E(objArr2, (m45) objM2, p65Var, 48);
            Object objM3 = p65Var.M();
            int i3 = 7;
            if (objM3 == uobVar) {
                objM3 = bjc.b(new ube(g49Var3, i3, g49Var2));
                p65Var.j0(objM3);
            }
            upc upcVar2 = (upc) objM3;
            Object objM4 = p65Var.M();
            if (objM4 == uobVar) {
                objM4 = bjc.b(new o7c(f, upcVar2));
                p65Var.j0(objM4);
            }
            upc upcVar3 = (upc) objM4;
            Object objM5 = p65Var.M();
            if (objM5 == uobVar) {
                objM5 = new jie(g49Var3, g49Var2);
                p65Var.j0(objM5);
            }
            jie jieVar2 = (jie) objM5;
            int i4 = jjeVar.u;
            List list = jjeVar.a;
            boolean z = jjeVar.s;
            d13 d13VarB = jz8.b(i4, new kv4(0, 12, List.class, list, "size", "size()I"), p65Var, 0, 2);
            boolean zG2 = p65Var.g(z);
            Object objM6 = p65Var.M();
            if (zG2 || objM6 == uobVar) {
                objM6 = qo7.u(Boolean.valueOf(z));
                p65Var.j0(objM6);
            }
            l78 l78Var = (l78) objM6;
            Object objM7 = p65Var.M();
            if (objM7 == uobVar) {
                objM7 = k40.x(0, 7, null);
                p65Var.j0(objM7);
            }
            j78 j78Var2 = (j78) objM7;
            Object objM8 = p65Var.M();
            if (objM8 == uobVar) {
                objM8 = k40.x(0, 7, null);
                p65Var.j0(objM8);
            }
            j78 j78Var3 = (j78) objM8;
            Object objM9 = p65Var.M();
            if (objM9 == uobVar) {
                objM9 = kyd.M(p65Var);
                p65Var.j0(objM9);
            }
            sb2 sb2Var = (sb2) objM9;
            boolean zBooleanValue2 = ((Boolean) l78Var.getValue()).booleanValue();
            int i5 = i2 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION;
            boolean zH = (i5 == 32) | p65Var.h(sb2Var) | p65Var.h(j78Var2) | p65Var.h(j78Var3);
            Object objM10 = p65Var.M();
            if (zH || objM10 == uobVar) {
                upcVar = upcVar2;
                j78Var = j78Var2;
                jieVar = jieVar2;
                g49Var = g49Var2;
                hu0Var = new hu0(iheVar, sb2Var, j78Var, j78Var3, 10);
                p65Var.j0(hu0Var);
            } else {
                j78Var = j78Var2;
                hu0Var = objM10;
                upcVar = upcVar2;
                g49Var = g49Var2;
                jieVar = jieVar2;
            }
            n92 n92Var2 = null;
            er7.d(zBooleanValue2, (m45) hu0Var, rv8.J(bgf.N(r28Var, "content_state"), jieVar, null), null, 0L, 0L, false, 0.0f, null, null, pxf.E(1127231177, new die(m73Var, upcVar, jjeVar, iheVar, g49Var, d13VarB, j78Var, j78Var3), p65Var), p65Var, 0, PhotoshopDirectory.TAG_COLOR_TRANSFER_FUNCTIONS);
            p65Var = p65Var;
            boolean z2 = i5 == 32;
            Object objM11 = p65Var.M();
            if (z2 || objM11 == uobVar) {
                objM11 = new obb(iheVar, n92Var2, 24);
                p65Var.j0(objM11);
            }
            kyd.k(p65Var, (b55) objM11, c1e.a);
            Integer numValueOf = Integer.valueOf(jjeVar.u);
            int i6 = i2 & 14;
            boolean zF = p65Var.f(d13VarB) | (i6 == 4);
            Object objM12 = p65Var.M();
            if (zF || objM12 == uobVar) {
                objM12 = new cfd(d13VarB, jjeVar, n92Var2, 13);
                p65Var.j0(objM12);
            }
            kyd.k(p65Var, (b55) objM12, numValueOf);
            boolean zF2 = p65Var.f(d13VarB) | (i5 == 32) | (i6 == 4);
            Object objM13 = p65Var.M();
            if (zF2 || objM13 == uobVar) {
                n92Var = null;
                j5d j5dVar = new j5d(d13VarB, iheVar, jjeVar, n92Var, 17);
                p65Var.j0(j5dVar);
                objM13 = j5dVar;
            } else {
                n92Var = null;
            }
            kyd.l(d13VarB, list, (b55) objM13, p65Var);
            Boolean bool = (Boolean) upcVar3.getValue();
            bool.getClass();
            Object objM14 = p65Var.M();
            if (objM14 == uobVar) {
                x45Var2 = x45Var;
                objM14 = new iie(x45Var2, upcVar3, n92Var, 0);
                p65Var.j0(objM14);
            } else {
                x45Var2 = x45Var;
            }
            kyd.k(p65Var, (b55) objM14, bool);
        } else {
            x45Var2 = x45Var;
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new g9b(i, 25, r28Var, (Object) jjeVar, (Object) iheVar, (Object) x45Var2);
        }
    }

    public static final void c(b24 b24Var, ihe iheVar, r28 r28Var, x12 x12Var, int i) {
        ar0 ar0Var;
        Object k8eVar;
        float f;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(274611687);
        int i2 = i | (p65Var.f(b24Var) ? 4 : 2) | (p65Var.f(iheVar) ? 32 : 16) | (p65Var.f(r28Var) ? 256 : 128);
        if (p65Var.P(i2 & 1, (i2 & 147) != 146)) {
            r28 r28VarX = ho2.x((jp7) p65Var.j(kt7.a), bgf.N(r28Var, "error_state"), 3, 1.0f);
            ar0 ar0Var2 = z46.h;
            zk7 zk7VarC = dy0.c(ar0Var2, false);
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
            boolean z = (i2 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32;
            Object objM = p65Var.M();
            if (z || objM == w12.a) {
                ar0Var = ar0Var2;
                f = 1.0f;
                k8eVar = new k8e(0, iheVar, ihe.class, "refresh", "refresh()V", 0, 15);
                p65Var.j0(k8eVar);
            } else {
                k8eVar = objM;
                ar0Var = ar0Var2;
                f = 1.0f;
            }
            iq7.a(b24Var, iy0.a.a(jfc.d(o28Var, f), ar0Var), null, null, null, null, (m45) ((qh6) k8eVar), null, p65Var, i2 & 14, 188);
            p65Var.p(true);
            p65Var.p(true);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new h5d(i, 20, b24Var, iheVar, r28Var);
        }
    }

    public static final void d(int i, long j, x12 x12Var, r28 r28Var) {
        long j2;
        long j3;
        ar0 ar0Var = z46.d;
        ar0 ar0Var2 = z46.h;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-513340908);
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
            r28 r28VarV = m40.V(bgf.N(r28Var, "loading_state"), p65Var, 0);
            rz5 rz5Var = qb8.c;
            yq0 yq0Var = z46.p;
            wv1 wv1VarA = uv1.a(rz5Var, yq0Var, p65Var, 0);
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
            r28 r28VarJ = ka1.j(jp7Var, o28Var, 3, 1.0f);
            zk7 zk7VarC = dy0.c(ar0Var2, false);
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
            r28 r28VarD = jfc.d(jfc.o(o28Var, 0.0f, 0.0f, 648.0f, 0.0f, 11), 1.0f);
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
            dl7.i(0, j3, p65Var, null);
            p65Var.p(true);
            p65Var.p(true);
            r28 r28VarJ2 = ka1.j((jp7) p65Var.j(sn3Var), o28Var, 3, 1.0f);
            zk7 zk7VarC3 = dy0.c(ar0Var2, false);
            long j7 = p65Var.T;
            int i6 = (int) (j7 ^ (j7 >>> 32));
            i89 i89VarL4 = p65Var.l();
            r28 r28VarR4 = gx1.R(p65Var, r28VarJ2);
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, cuVar, zk7VarC3);
            tp7.B(p65Var, cuVar2, i89VarL4);
            ka1.z(i6, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR4);
            o28 o28Var2 = o28Var;
            r28 r28VarD2 = jfc.d(jfc.o(o28Var, 0.0f, 0.0f, 648.0f, 0.0f, 11), 1.0f);
            zk7 zk7VarC4 = dy0.c(ar0Var, false);
            long j8 = p65Var.T;
            int i7 = (int) (j8 ^ (j8 >>> 32));
            i89 i89VarL5 = p65Var.l();
            r28 r28VarR5 = gx1.R(p65Var, r28VarD2);
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, cuVar, zk7VarC4);
            tp7.B(p65Var, cuVar2, i89VarL5);
            ka1.z(i7, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR5);
            wv1 wv1VarA2 = uv1.a(rz5Var, yq0Var, p65Var, 0);
            long j9 = p65Var.T;
            int i8 = (int) (j9 ^ (j9 >>> 32));
            i89 i89VarL6 = p65Var.l();
            r28 r28VarR6 = gx1.R(p65Var, o28Var2);
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, cuVar, wv1VarA2);
            tp7.B(p65Var, cuVar2, i89VarL6);
            ka1.z(i8, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR6);
            omb ombVarA = nmb.a(qb8.a, z46.m, p65Var, 0);
            long j10 = p65Var.T;
            int i9 = (int) (j10 ^ (j10 >>> 32));
            i89 i89VarL7 = p65Var.l();
            r28 r28VarR7 = gx1.R(p65Var, o28Var2);
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, cuVar, ombVarA);
            tp7.B(p65Var, cuVar2, i89VarL7);
            ka1.z(i9, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR7);
            p65Var.Y(-664633752);
            int i10 = 0;
            while (i10 < 4) {
                ok7.r(38.0f, 432, 0, j3, p65Var, w2g.C(o28Var2, 16.0f), ((bu7) p65Var.j(jt7.c)).m);
                i10++;
                o28Var2 = o28Var2;
            }
            o28 o28Var3 = o28Var2;
            float f = 1.0f;
            int i11 = 3;
            p65Var.p(false);
            p65Var.p(true);
            tp7.c(0.0f, 0, 5, j3, p65Var, null);
            p65Var.p(true);
            p65Var.p(true);
            p65Var.p(true);
            p65Var.Y(519693128);
            int iR = 0;
            while (iR < 10) {
                r28 r28VarJ3 = ka1.j((jp7) p65Var.j(kt7.a), o28Var3, i11, f);
                zk7 zk7VarC5 = dy0.c(ar0Var2, false);
                long j11 = p65Var.T;
                int i12 = (int) (j11 ^ (j11 >>> 32));
                i89 i89VarL8 = p65Var.l();
                r28 r28VarR8 = gx1.R(p65Var, r28VarJ3);
                r12.W.getClass();
                ot2 ot2Var2 = q12.b;
                p65Var.c0();
                if (p65Var.S) {
                    p65Var.k(ot2Var2);
                } else {
                    p65Var.m0();
                }
                cu cuVar5 = q12.f;
                tp7.B(p65Var, cuVar5, zk7VarC5);
                cu cuVar6 = q12.e;
                tp7.B(p65Var, cuVar6, i89VarL8);
                Integer numValueOf2 = Integer.valueOf(i12);
                cu cuVar7 = q12.g;
                tp7.B(p65Var, cuVar7, numValueOf2);
                fn fnVar2 = q12.h;
                tp7.y(p65Var, fnVar2);
                cu cuVar8 = q12.d;
                tp7.B(p65Var, cuVar8, r28VarR8);
                o28 o28Var4 = o28Var3;
                r28 r28VarD3 = jfc.d(jfc.o(o28Var4, 0.0f, 0.0f, 648.0f, 0.0f, 11), f);
                zk7 zk7VarC6 = dy0.c(ar0Var, false);
                long j12 = p65Var.T;
                int i13 = (int) (j12 ^ (j12 >>> 32));
                i89 i89VarL9 = p65Var.l();
                r28 r28VarR9 = gx1.R(p65Var, r28VarD3);
                p65Var.c0();
                ar0 ar0Var3 = ar0Var;
                if (p65Var.S) {
                    p65Var.k(ot2Var2);
                } else {
                    p65Var.m0();
                }
                tp7.B(p65Var, cuVar5, zk7VarC6);
                tp7.B(p65Var, cuVar6, i89VarL9);
                ka1.z(i13, p65Var, cuVar7, p65Var, fnVar2);
                tp7.B(p65Var, cuVar8, r28VarR9);
                long j13 = j3;
                il7.l(stcVar, null, j13, null, p65Var, 0, 10);
                j3 = j13;
                iR = wgd.r(p65Var, true, true, iR, 1);
                ar0Var = ar0Var3;
                o28Var3 = o28Var4;
                f = 1.0f;
                i11 = 3;
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
            mwaVarS.d = new po(r28Var, j2, i, 25);
        }
    }

    public static final void e(mje mjeVar, r28 r28Var, ihe iheVar, x12 x12Var, int i) {
        mje mjeVar2 = mjeVar;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-86301852);
        int i2 = i | (p65Var.f(mjeVar2) ? 4 : 2) | (p65Var.f(r28Var) ? 32 : 16) | (p65Var.f(iheVar) ? 256 : 128);
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
                mjeVar2 = mjeVar;
                objM = new ube(iheVar, 9, mjeVar2);
                p65Var.j0(objM);
            } else {
                mjeVar2 = mjeVar;
            }
            il7.o(0, p65Var, (m45) objM, null);
            p65Var.p(true);
            p65Var.p(true);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new h5d(i, 22, mjeVar2, r28Var, iheVar);
        }
    }

    public static final void f(jje jjeVar, ihe iheVar, r28 r28Var, x12 x12Var, int i) {
        Object obj;
        boolean z;
        String string;
        Object obj2;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(1268992100);
        int i2 = i | (p65Var.f(jjeVar) ? 4 : 2) | (p65Var.f(iheVar) ? 32 : 16) | 384;
        if (p65Var.P(i2 & 1, (i2 & 147) != 146)) {
            Resources resources = (Resources) p65Var.j(eo.c);
            jp7 jp7Var = (jp7) p65Var.j(kt7.a);
            o28 o28Var = o28.b;
            r28 r28VarJ = ka1.j(jp7Var, o28Var, 3, 1.0f);
            zk7 zk7VarC = dy0.c(z46.h, false);
            long j = p65Var.T;
            int i3 = (int) (j ^ (j >>> 32));
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
            Integer numValueOf = Integer.valueOf(i3);
            cu cuVar3 = q12.g;
            tp7.B(p65Var, cuVar3, numValueOf);
            fn fnVar = q12.h;
            tp7.y(p65Var, fnVar);
            cu cuVar4 = q12.d;
            tp7.B(p65Var, cuVar4, r28VarR);
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
            boolean zF = p65Var.f(jjeVar.a) | p65Var.g(jjeVar.t);
            Object objM = p65Var.M();
            uob uobVar = w12.a;
            if (zF || objM == uobVar) {
                List list = jjeVar.a;
                ArrayList arrayList = new ArrayList(cu1.k0(list, 10));
                int i5 = 0;
                for (Object obj3 : list) {
                    int i6 = i5 + 1;
                    if (i5 < 0) {
                        d46.i0();
                        throw null;
                    }
                    UserProfileTab userProfileTab = (UserProfileTab) obj3;
                    if (i5 == 0) {
                        string = resources.getString(R.string.user_profile_tab_home);
                    } else if (userProfileTab instanceof UserProfileTab.Posts) {
                        string = resources.getString(R.string.user_profile_tab_home);
                    } else if (userProfileTab instanceof UserProfileTab.Catalogs) {
                        string = resources.getString(R.string.user_profile_tab_lists);
                    } else if (userProfileTab instanceof UserProfileTab.Books) {
                        string = resources.getString(R.string.user_profile_tab_books);
                    } else if (userProfileTab instanceof UserProfileTab.About) {
                        string = resources.getString(R.string.user_profile_tab_about);
                    } else if (userProfileTab instanceof UserProfileTab.Activity) {
                        string = resources.getString(R.string.user_profile_tab_activity);
                    } else {
                        if (!(userProfileTab instanceof UserProfileTab.Reposts)) {
                            ygf.a();
                            return;
                        }
                        string = resources.getString(R.string.user_profile_tab_reposts);
                    }
                    string.getClass();
                    arrayList.add(new mz1(new vx4(userProfileTab, jjeVar, string, iheVar), true, -783530950));
                    i5 = i6;
                }
                z = true;
                p65Var.j0(arrayList);
                obj2 = arrayList;
            } else {
                z = true;
                obj2 = objM;
            }
            List list2 = (List) obj2;
            int i7 = jjeVar.u;
            boolean z2 = ((i2 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32 ? z : false) | ((i2 & 14) == 4 ? z : false);
            Object objM2 = p65Var.M();
            if (z2 || objM2 == uobVar) {
                objM2 = new vrd(iheVar, 13, jjeVar);
                p65Var.j0(objM2);
            }
            boolean z3 = z;
            ns7.b(0.0f, i7, 0, 250, 0L, 0L, p65Var, (x45) objM2, null, null, null, list2);
            p65Var.p(z3);
            p65Var.p(z3);
            obj = o28Var;
        } else {
            p65Var.S();
            obj = r28Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new h5d(i, 23, jjeVar, iheVar, obj);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:30:0x0052  */
    /* JADX WARN: Removed duplicated region for block: B:32:0x0057  */
    /* JADX WARN: Removed duplicated region for block: B:41:0x0071  */
    /* JADX WARN: Removed duplicated region for block: B:42:0x0073  */
    /* JADX WARN: Removed duplicated region for block: B:45:0x007b  */
    /* JADX WARN: Removed duplicated region for block: B:62:0x0106  */
    /* JADX WARN: Removed duplicated region for block: B:65:0x0113  */
    /* JADX WARN: Removed duplicated region for block: B:67:? A[RETURN, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final void g(defpackage.nje r21, defpackage.ihe r22, defpackage.r28 r23, defpackage.nhc r24, defpackage.x12 r25, int r26, int r27) {
        /*
            Method dump skipped, instruction units count: 287
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.medium.android.profile.ui.view.e.g(nje, ihe, r28, nhc, x12, int, int):void");
    }

    public static final void h(UserProfileReference userProfileReference, UserProfileTab userProfileTab, String str, pge pgeVar, r28 r28Var, m mVar, x12 x12Var, int i) {
        m mVar2;
        int i2;
        m mVar3;
        userProfileReference.getClass();
        userProfileTab.getClass();
        str.getClass();
        p65 p65Var = (p65) x12Var;
        p65Var.a0(1082627081);
        int i3 = i | (p65Var.f(userProfileReference) ? 4 : 2) | (p65Var.f(userProfileTab) ? 32 : 16) | (p65Var.f(str) ? 256 : 128) | (p65Var.f(pgeVar) ? 2048 : 1024) | (p65Var.f(r28Var) ? OlympusMakernoteDirectory.TAG_MAIN_INFO : 8192) | ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID;
        if (p65Var.P(i3 & 1, (74899 & i3) != 74898)) {
            p65Var.U();
            int i4 = i & 1;
            uob uobVar = w12.a;
            if (i4 == 0 || p65Var.z()) {
                boolean z = ((i3 & 14) == 4) | ((i3 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32) | ((i3 & 896) == 256);
                Object objM = p65Var.M();
                if (z || objM == uobVar) {
                    objM = new pi9(userProfileReference, userProfileTab, str, 21);
                    p65Var.j0(objM);
                }
                x45 x45Var = (x45) objM;
                wue wueVarA = e67.a(p65Var);
                if (wueVarA == null) {
                    ygf.f("No ViewModelStoreOwner was provided via LocalViewModelStoreOwner");
                    return;
                } else {
                    i2 = i3 & (-458753);
                    mVar3 = (m) to7.z(n1b.a.b(m.class), wueVarA, t40.E(wueVarA, p65Var), wueVarA instanceof pi5 ? r40.N(((pi5) wueVarA).getDefaultViewModelCreationExtras(), x45Var) : r40.N(og2.b, x45Var), p65Var);
                }
            } else {
                p65Var.S();
                i2 = i3 & (-458753);
                mVar3 = mVar;
            }
            p65Var.q();
            l78 l78VarZ = guc.z(mVar3.E, p65Var, 0);
            Object objM2 = p65Var.M();
            if (objM2 == uobVar) {
                objM2 = y30.j(p65Var);
            }
            nhc nhcVar = (nhc) objM2;
            g((nje) l78VarZ.getValue(), new d(pgeVar, mVar3), r28Var, nhcVar, p65Var, ((i2 >> 6) & 896) | 3072, 0);
            Resources resources = (Resources) p65Var.j(eo.c);
            Object objM3 = p65Var.M();
            if (objM3 == uobVar) {
                objM3 = kyd.M(p65Var);
                p65Var.j0(objM3);
            }
            sb2 sb2Var = (sb2) objM3;
            boolean zH = p65Var.h(mVar3) | p65Var.h(sb2Var) | p65Var.h(resources) | ((i2 & 7168) == 2048);
            Object objM4 = p65Var.M();
            if (zH || objM4 == uobVar) {
                objM4 = new kyc(mVar3, nhcVar, sb2Var, pgeVar, resources, (n92) null);
                p65Var.j0(objM4);
            }
            kyd.k(p65Var, (b55) objM4, c1e.a);
            mVar2 = mVar3;
        } else {
            p65Var.S();
            mVar2 = mVar;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new gie(userProfileReference, userProfileTab, str, pgeVar, r28Var, mVar2, i);
        }
    }

    public static final void i(nje njeVar, ihe iheVar, boolean z, r28 r28Var, x12 x12Var, int i) {
        r28 r28Var2;
        Object k8eVar;
        ihe iheVar2;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(1398428691);
        int i2 = i | (p65Var.f(njeVar) ? 4 : 2) | (p65Var.f(iheVar) ? 32 : 16) | (p65Var.g(z) ? 256 : 128) | 3072;
        if (p65Var.P(i2 & 1, (i2 & 1171) != 1170)) {
            boolean z2 = (i2 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32;
            Object objM = p65Var.M();
            if (z2 || objM == w12.a) {
                k8eVar = new k8e(0, iheVar, ihe.class, MaAxRJinch.EckSZfQa, "onBackPressed()V", 0, 16);
                iheVar2 = iheVar;
                p65Var.j0(k8eVar);
            } else {
                iheVar2 = iheVar;
                k8eVar = objM;
            }
            mz1 mz1VarE = pxf.E(418834426, new dyc(njeVar, 10, iheVar2), p65Var);
            o28 o28Var = o28.b;
            qk7.f(pxf.E(1631491909, new pv0(njeVar, z, 7), p65Var), o28Var, (m45) ((qh6) k8eVar), mz1VarE, null, null, 0L, 0L, null, p65Var, 3126, 496);
            r28Var2 = o28Var;
        } else {
            p65Var.S();
            r28Var2 = r28Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new ov0(njeVar, iheVar, z, r28Var2, i, 11);
        }
    }
}
