package defpackage;

import android.content.Context;
import android.content.res.Resources;
import android.graphics.PointF;
import android.graphics.drawable.Drawable;
import android.view.View;
import com.drew.lang.RandomAccessStreamReader;
import com.drew.metadata.exif.makernotes.OlympusMakernoteDirectory;
import com.drew.metadata.exif.makernotes.PanasonicMakernoteDirectory;
import com.drew.metadata.exif.makernotes.ReconyxHyperFire2MakernoteDirectory;
import com.drew.metadata.exif.makernotes.ReconyxUltraFireMakernoteDirectory;
import com.medium.android.explore.ui.vAWg.OphtYB;
import com.medium.android.yourlibrary.YourLibraryTab;
import com.medium.reader.R;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;
import java.util.WeakHashMap;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public abstract class guc {
    public static final lr5 a = new lr5(0, null);
    public static final lr5 b = new lr5(1, null);
    public static final mz1 c = new mz1(new a02(0), false, 463904084);
    public static final mz1 d = new mz1(new a02(1), false, 1863540999);
    public static final mz1 e = new mz1(new yz1(12), false, 1360300203);
    public static final mz1 f = new mz1(new f02(19), false, 1677996342);
    public static final mz1 g = new mz1(new f02(20), false, -2146615312);
    public static final mz1 h = new mz1(new n02(25), false, 1575276760);
    public static final mz1 i = new mz1(new n02(26), false, 605434022);
    public static final q84 j = new q84(-1);
    public static final q84 k = new q84(null);
    public static final q84 l = new q84(null);
    public static final q84 m = new q84(null);
    public static final Object n = new Object();
    public static Method o;
    public static boolean p;
    public static final /* synthetic */ int q = 0;
    public static final /* synthetic */ int r = 0;

    public static final r28 A(r28 r28Var, x45 x45Var) {
        return r28Var.b(new ul3(x45Var));
    }

    public static final r28 B(r28 r28Var, x45 x45Var) {
        return r28Var.b(new bm3(x45Var));
    }

    public static final r28 C(r28 r28Var, x45 x45Var) {
        return r28Var.b(new cm3(x45Var));
    }

    public static final ib2 D(ib2 ib2Var, ib2 ib2Var2, boolean z) {
        Boolean bool = Boolean.FALSE;
        int i2 = 17;
        byte b2 = 0;
        boolean zBooleanValue = ((Boolean) ib2Var.N(new v02(i2, b2), bool)).booleanValue();
        boolean zBooleanValue2 = ((Boolean) ib2Var2.N(new v02(i2, b2), bool)).booleanValue();
        if (!zBooleanValue && !zBooleanValue2) {
            return ib2Var.j0(ib2Var2);
        }
        v02 v02Var = new v02(18, b2);
        zx3 zx3Var = zx3.a;
        ib2 ib2Var3 = (ib2) ib2Var.N(v02Var, zx3Var);
        Object objN = ib2Var2;
        if (zBooleanValue2) {
            objN = ib2Var2.N(new v02(19, b2), zx3Var);
        }
        return ib2Var3.j0((ib2) objN);
    }

    public static Drawable E(Context context, int i2) {
        return scb.d().f(context, i2);
    }

    public static final int F(f58 f58Var, long j2, zte zteVar) {
        float fH = zteVar != null ? zteVar.h() : 0.0f;
        int i2 = (int) (4294967295L & j2);
        int iE = f58Var.e(Float.intBitsToFloat(i2));
        if (Float.intBitsToFloat(i2) < f58Var.f(iE) - fH || Float.intBitsToFloat(i2) > f58Var.b(iE) + fH) {
            return -1;
        }
        int i3 = (int) (j2 >> 32);
        if (Float.intBitsToFloat(i3) < (-fH) || Float.intBitsToFloat(i3) > f58Var.d + fH) {
            return -1;
        }
        return iE;
    }

    public static final int G(kx6 kx6Var, long j2, zte zteVar) {
        long jF;
        int iF;
        rjd rjdVarD = kx6Var.d();
        if (rjdVarD != null) {
            f58 f58Var = rjdVarD.a.b;
            hp6 hp6VarC = kx6Var.c();
            if (hp6VarC != null && (iF = F(f58Var, (jF = hp6VarC.F(j2)), zteVar)) != -1) {
                return f58Var.g(ip8.a((f58Var.b(iF) + f58Var.f(iF)) / 2.0f, 1, jF));
            }
        }
        return -1;
    }

    public static final long H(kx6 kx6Var, zwa zwaVar, int i2) {
        ywb ywbVar = tz7.n;
        rjd rjdVarD = kx6Var.d();
        f58 f58Var = rjdVarD != null ? rjdVarD.a.b : null;
        hp6 hp6VarC = kx6Var.c();
        return (f58Var == null || hp6VarC == null) ? bkd.b : f58Var.h(zwaVar.i(hp6VarC.F(0L)), i2, ywbVar);
    }

    public static final long I(kx6 kx6Var, zwa zwaVar, zwa zwaVar2, int i2) {
        long jH = H(kx6Var, zwaVar, i2);
        if (bkd.c(jH)) {
            return bkd.b;
        }
        long jH2 = H(kx6Var, zwaVar2, i2);
        if (bkd.c(jH2)) {
            return bkd.b;
        }
        int i3 = (int) (jH >> 32);
        int i4 = (int) (jH2 & 4294967295L);
        return lk7.q(Math.min(i3, i3), Math.max(i4, i4));
    }

    public static ckf J(Context context) {
        vp7.p(context);
        return new ckf(context, new skf());
    }

    public static final boolean K(qjd qjdVar, int i2) {
        f58 f58Var = qjdVar.b;
        int iD = f58Var.d(i2);
        return i2 == qjdVar.g(iD) || i2 == f58Var.c(iD, false) ? qjdVar.h(i2) != qjdVar.a(i2) : qjdVar.a(i2) != qjdVar.a(i2 - 1);
    }

    /* JADX WARN: Removed duplicated region for block: B:24:0x0031  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static boolean L(defpackage.adb r2, defpackage.kbb r3) {
        /*
            r3.getClass()
            int r0 = r2.d
            r1 = 200(0xc8, float:2.8E-43)
            if (r0 == r1) goto L58
            r1 = 410(0x19a, float:5.75E-43)
            if (r0 == r1) goto L58
            r1 = 414(0x19e, float:5.8E-43)
            if (r0 == r1) goto L58
            r1 = 501(0x1f5, float:7.02E-43)
            if (r0 == r1) goto L58
            r1 = 203(0xcb, float:2.84E-43)
            if (r0 == r1) goto L58
            r1 = 204(0xcc, float:2.86E-43)
            if (r0 == r1) goto L58
            r1 = 307(0x133, float:4.3E-43)
            if (r0 == r1) goto L31
            r1 = 308(0x134, float:4.32E-43)
            if (r0 == r1) goto L58
            r1 = 404(0x194, float:5.66E-43)
            if (r0 == r1) goto L58
            r1 = 405(0x195, float:5.68E-43)
            if (r0 == r1) goto L58
            switch(r0) {
                case 300: goto L58;
                case 301: goto L58;
                case 302: goto L31;
                default: goto L30;
            }
        L30:
            goto L74
        L31:
            yi5 r0 = r2.f
            java.lang.String r1 = "Expires"
            java.lang.String r0 = r0.d(r1)
            if (r0 != 0) goto L3c
            r0 = 0
        L3c:
            if (r0 != 0) goto L58
            b31 r0 = r2.f()
            int r0 = r0.c
            r1 = -1
            if (r0 != r1) goto L58
            b31 r0 = r2.f()
            boolean r0 = r0.f
            if (r0 != 0) goto L58
            b31 r0 = r2.f()
            boolean r0 = r0.e
            if (r0 != 0) goto L58
            goto L74
        L58:
            b31 r2 = r2.f()
            boolean r2 = r2.b
            if (r2 != 0) goto L74
            b31 r2 = r3.f
            if (r2 != 0) goto L6e
            int r2 = defpackage.b31.n
            yi5 r2 = r3.c
            b31 r2 = defpackage.f49.U(r2)
            r3.f = r2
        L6e:
            boolean r2 = r2.b
            if (r2 != 0) goto L74
            r2 = 1
            return r2
        L74:
            r2 = 0
            return r2
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.guc.L(adb, kbb):boolean");
    }

    public static final boolean M(Throwable th) {
        Class<?> superclass = th.getClass();
        while (!g76.L(superclass.getCanonicalName(), "com.intellij.openapi.progress.ProcessCanceledException")) {
            superclass = superclass.getSuperclass();
            if (superclass == null) {
                return false;
            }
        }
        return true;
    }

    public static final boolean N(int i2) {
        int type = Character.getType(i2);
        return type == 23 || type == 20 || type == 22 || type == 30 || type == 29 || type == 24 || type == 21;
    }

    public static final boolean O(int i2) {
        return Character.isWhitespace(i2) || i2 == 160;
    }

    public static final boolean P(int i2) {
        int type;
        return (!O(i2) || (type = Character.getType(i2)) == 14 || type == 13 || i2 == 10) ? false : true;
    }

    public static final ib2 Q(sb2 sb2Var, ib2 ib2Var) {
        ib2 ib2VarD = D(sb2Var.Q(), ib2Var, true);
        r13 r13Var = xg3.a;
        return (ib2VarD == r13Var || ib2VarD.o0(wz7.d) != null) ? ib2VarD : ib2VarD.j0(r13Var);
    }

    public static final r28 R(r28 r28Var, x45 x45Var) {
        return r28Var.b(new mp8(x45Var));
    }

    public static final r28 S(r28 r28Var, float f2, float f3) {
        return r28Var.b(new jp8(f2, f3));
    }

    public static final long T(x12 x12Var) {
        return ((zo7) ((p65) x12Var).j(kt7.b)).c;
    }

    public static final View U(a43 a43Var) {
        if (!((q28) a43Var).a.n) {
            b26.b("Cannot get View because the Modifier node is not currently attached.");
        }
        return (View) dq6.a(flb.v0(a43Var));
    }

    public static void V(xu6 xu6Var, dr9 dr9Var, sh9 sh9Var, stc stcVar, int i2, String str) {
        xu6Var.k0(lv8.r("tags_", str, "_stream_post_item_", dr9Var.a), "stream_post_item_" + stcVar, new mz1(new vla(dr9Var, stcVar, sh9Var, i2, 1), true, -1617649553));
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final defpackage.tb2 W(java.lang.Throwable r5, defpackage.n92 r6) {
        /*
            boolean r0 = r6 instanceof defpackage.an6
            if (r0 == 0) goto L13
            r0 = r6
            an6 r0 = (defpackage.an6) r0
            int r1 = r0.c
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.c = r1
            goto L18
        L13:
            an6 r0 = new an6
            r0.<init>(r6)
        L18:
            java.lang.Object r6 = r0.b
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.c
            r3 = 1
            if (r2 == 0) goto L31
            r5 = 0
            if (r2 == r3) goto L2a
            java.lang.String r6 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r6)
            return r5
        L2a:
            defpackage.br7.v(r6)
            defpackage.z72.b()
            return r5
        L31:
            defpackage.br7.v(r6)
            r0.c = r3
            r13 r6 = defpackage.xg3.a
            ib2 r2 = r0.getContext()
            p0g r3 = new p0g
            r4 = 8
            r3.<init>(r0, r4, r5)
            r6.E0(r2, r3)
            return r1
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.guc.W(java.lang.Throwable, n92):tb2");
    }

    public static void X(xu6 xu6Var, String str, int i2, ip7 ip7Var) {
        xu6Var.k0(str, "section_title", new mz1(new ov2(o28.b, new jd3(i2, 5), ip7Var, str), true, 777652053));
    }

    public static final long Y(PointF pointF) {
        float f2 = pointF.x;
        float f3 = pointF.y;
        return (((long) Float.floatToRawIntBits(f2)) << 32) | (((long) Float.floatToRawIntBits(f3)) & 4294967295L);
    }

    public static final String Z(byte b2) {
        return b2 == 1 ? "quotation mark '\"'" : b2 == 2 ? "string escape sequence '\\'" : b2 == 4 ? OphtYB.pemsvQzvhTKGHp : b2 == 5 ? "colon ':'" : b2 == 6 ? "start of the object '{'" : b2 == 7 ? "end of the object '}'" : b2 == 8 ? "start of the array '['" : b2 == 9 ? "end of the array ']'" : b2 == 10 ? "end of the input" : b2 == 127 ? "invalid token" : "valid token";
    }

    public static final void a(gd9 gd9Var, mz1 mz1Var, pod podVar, r28 r28Var, boolean z, mz1 mz1Var2, x12 x12Var, int i2) {
        int i3;
        boolean z2;
        l78 l78Var;
        boolean z3;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-1221877520);
        if ((i2 & 6) == 0) {
            i3 = (p65Var.f(gd9Var) ? 4 : 2) | i2;
        } else {
            i3 = i2;
        }
        if ((i2 & 48) == 0) {
            i3 |= p65Var.h(mz1Var) ? 32 : 16;
        }
        if ((i2 & 384) == 0) {
            i3 |= (i2 & 512) == 0 ? p65Var.f(podVar) : p65Var.h(podVar) ? 256 : 128;
        }
        if ((i2 & 3072) == 0) {
            i3 |= p65Var.f(r28Var) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024;
        }
        if ((i2 & 24576) == 0) {
            i3 |= p65Var.h(null) ? OlympusMakernoteDirectory.TAG_MAIN_INFO : 8192;
        }
        if ((i2 & 196608) == 0) {
            z2 = z;
            i3 |= p65Var.g(z2) ? 131072 : ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID;
        } else {
            z2 = z;
        }
        if ((1572864 & i2) == 0) {
            i3 |= p65Var.g(true) ? 1048576 : 524288;
        }
        if ((12582912 & i2) == 0) {
            i3 |= p65Var.g(false) ? 8388608 : 4194304;
        }
        if ((100663296 & i2) == 0) {
            i3 |= p65Var.h(mz1Var2) ? 67108864 : 33554432;
        }
        int i4 = i3;
        if (p65Var.P(i4 & 1, (38347923 & i4) != 38347922)) {
            Object objM = p65Var.M();
            uob uobVar = w12.a;
            if (objM == uobVar) {
                objM = kyd.M(p65Var);
                p65Var.j0(objM);
            }
            sb2 sb2Var = (sb2) objM;
            Object objM2 = p65Var.M();
            if (objM2 == uobVar) {
                objM2 = qo7.u(Boolean.FALSE);
                p65Var.j0(objM2);
            }
            l78 l78Var2 = (l78) objM2;
            zk7 zk7VarC = dy0.c(z46.d, false);
            int iS = w2g.s(p65Var);
            i89 i89VarL = p65Var.l();
            r28 r28VarR = gx1.R(p65Var, o28.b);
            r12.W.getClass();
            ot2 ot2Var = q12.b;
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, q12.f, zk7VarC);
            tp7.B(p65Var, q12.e, i89VarL);
            cu cuVar = q12.g;
            if (p65Var.S || !g76.L(p65Var.M(), Integer.valueOf(iS))) {
                lv8.w(iS, p65Var, iS, cuVar);
            }
            tp7.B(p65Var, q12.d, r28VarR);
            if (podVar.b()) {
                p65Var.Y(-1891243071);
                n(gd9Var, podVar, sb2Var, z2, l78Var2, mz1Var, p65Var, (i4 & 14) | 196608 | ((i4 >> 3) & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) | ((i4 >> 6) & 896) | ((i4 << 15) & 3670016));
                l78Var = l78Var2;
                p65Var = p65Var;
                z3 = false;
                p65Var.p(false);
            } else {
                l78Var = l78Var2;
                z3 = false;
                p65Var.Y(-1890863476);
                p65Var.p(false);
            }
            o(podVar, l78Var, r28Var, mz1Var2, p65Var, ((i4 >> 18) & 14) | 384 | ((i4 >> 3) & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) | ((i4 >> 12) & 7168) | (57344 & (i4 << 3)) | ((i4 >> 9) & 458752));
            p65Var.p(true);
            boolean z4 = ((i4 & 896) == 256 || ((i4 & 512) != 0 && p65Var.h(podVar))) ? true : z3;
            Object objM3 = p65Var.M();
            if (z4 || objM3 == uobVar) {
                objM3 = new s0(9, podVar);
                p65Var.j0(objM3);
            }
            kyd.h(podVar, (x45) objM3, p65Var);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new jp0(gd9Var, mz1Var, podVar, r28Var, z, mz1Var2, i2);
        }
    }

    public static final uzd a0(n92 n92Var, ib2 ib2Var, Object obj) {
        uzd uzdVar = null;
        if ((n92Var instanceof ub2) && ib2Var.o0(d61.d) != null) {
            ub2 callerFrame = (ub2) n92Var;
            while (true) {
                if ((callerFrame instanceof sg3) || (callerFrame = callerFrame.getCallerFrame()) == null) {
                    break;
                }
                if (callerFrame instanceof uzd) {
                    uzdVar = (uzd) callerFrame;
                    break;
                }
            }
            if (uzdVar != null) {
                uzdVar.q0(ib2Var, obj);
            }
        }
        return uzdVar;
    }

    public static final void b(lid lidVar, mz1 mz1Var, x12 x12Var, int i2) {
        int i3;
        r28 r28VarZ;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(1533506138);
        int i4 = 2;
        if ((i2 & 6) == 0) {
            i3 = (p65Var.h(lidVar) ? 4 : 2) | i2;
        } else {
            i3 = i2;
        }
        if ((i2 & 48) == 0) {
            i3 |= p65Var.h(mz1Var) ? 32 : 16;
        }
        int i5 = 0;
        if (p65Var.P(i3 & 1, (i3 & 19) != 18)) {
            p65Var.Y(-885604480);
            if (lidVar.i()) {
                n92 n92Var = null;
                r28VarZ = sgg.Z(wgf.N(new fid(lidVar, n92Var, i5)), lidVar.x, new mt2(lidVar, n92Var, 3), new gid(lidVar, n92Var, i5), new ta2(lidVar, i4));
            } else {
                r28VarZ = o28.b;
            }
            aq7.d(r28VarZ, mz1Var, p65Var, i3 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION);
            p65Var.p(false);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new bx1(lidVar, mz1Var, i2, i5);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final java.lang.Object b0(defpackage.ib2 r5, java.lang.Object r6, java.lang.Object r7, defpackage.b55 r8, defpackage.n92 r9) throws java.lang.Throwable {
        /*
            boolean r0 = r9 instanceof defpackage.ak1
            if (r0 == 0) goto L13
            r0 = r9
            ak1 r0 = (defpackage.ak1) r0
            int r1 = r0.f
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.f = r1
            goto L18
        L13:
            ak1 r0 = new ak1
            r0.<init>(r9)
        L18:
            java.lang.Object r9 = r0.e
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.f
            r3 = 1
            if (r2 == 0) goto L3a
            if (r2 != r3) goto L33
            java.lang.Object r5 = r0.d
            ib2 r6 = r0.c
            defpackage.br7.v(r9)     // Catch: java.lang.Throwable -> L2d
            r7 = r5
            r5 = r6
            goto L68
        L2d:
            r7 = move-exception
            r4 = r7
            r7 = r5
            r5 = r6
            r6 = r4
            goto L6c
        L33:
            java.lang.String r5 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r5)
            r5 = 0
            return r5
        L3a:
            defpackage.br7.v(r9)
            java.lang.Object r7 = defpackage.gx1.f0(r5, r7)
            r0.b = r6     // Catch: java.lang.Throwable -> L5a
            r0.c = r5     // Catch: java.lang.Throwable -> L5a
            r0.d = r7     // Catch: java.lang.Throwable -> L5a
            r0.f = r3     // Catch: java.lang.Throwable -> L5a
            fmc r9 = new fmc     // Catch: java.lang.Throwable -> L5a
            r9.<init>(r0, r5)     // Catch: java.lang.Throwable -> L5a
            boolean r0 = defpackage.y30.C(r8)     // Catch: java.lang.Throwable -> L5a
            if (r0 != 0) goto L5c
            java.lang.Object r6 = defpackage.pwd.f0(r8, r6, r9)     // Catch: java.lang.Throwable -> L5a
        L58:
            r9 = r6
            goto L65
        L5a:
            r6 = move-exception
            goto L6c
        L5c:
            r0 = 2
            defpackage.pwd.B(r0, r8)     // Catch: java.lang.Throwable -> L5a
            java.lang.Object r6 = r8.invoke(r6, r9)     // Catch: java.lang.Throwable -> L5a
            goto L58
        L65:
            if (r9 != r1) goto L68
            return r1
        L68:
            defpackage.gx1.Z(r5, r7)
            return r9
        L6c:
            defpackage.gx1.Z(r5, r7)
            throw r6
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.guc.b0(ib2, java.lang.Object, java.lang.Object, b55, n92):java.lang.Object");
    }

    public static final void c(final String str, final pg1 pg1Var, kj3 kj3Var, final m45 m45Var, r28 r28Var, long j2, x12 x12Var, final int i2, final int i3) {
        kj3 kj3Var2;
        final long j3;
        final r28 r28Var2;
        int i4;
        long j4;
        r28 r28Var3;
        str.getClass();
        pg1Var.getClass();
        kj3Var.getClass();
        m45Var.getClass();
        p65 p65Var = (p65) x12Var;
        p65Var.a0(1421584233);
        long j5 = j2;
        int i5 = i2 | (p65Var.f(str) ? 4 : 2) | (p65Var.f(pg1Var) ? 32 : 16) | (p65Var.h(m45Var) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024) | 24576 | (((i3 & 32) == 0 && p65Var.e(j5)) ? 131072 : ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID);
        if (p65Var.P(i5 & 1, (74899 & i5) != 74898)) {
            p65Var.U();
            if ((i2 & 1) == 0 || p65Var.z()) {
                int i6 = i3 & 32;
                o28 o28Var = o28.b;
                if (i6 != 0) {
                    j5 = ((zo7) p65Var.j(kt7.b)).n;
                    i5 &= -458753;
                }
                i4 = i5;
                j4 = j5;
                r28Var3 = o28Var;
            } else {
                p65Var.S();
                if ((i3 & 32) != 0) {
                    i5 &= -458753;
                }
                i4 = i5;
                j4 = j5;
                r28Var3 = r28Var;
            }
            p65Var.q();
            kj3Var2 = kj3Var;
            f49.l(m45Var, bgf.N(r28Var3, "download_icon_button"), false, rv8.F(j4, p65Var), null, pxf.E(-1323489657, new af0(kj3Var2, pg1Var, str, 25), p65Var), p65Var, ((i4 >> 9) & 14) | 1572864, 52);
            r28Var2 = r28Var3;
            j3 = j4;
        } else {
            kj3Var2 = kj3Var;
            p65Var.S();
            j3 = j5;
            r28Var2 = r28Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            final kj3 kj3Var3 = kj3Var2;
            mwaVarS.d = new b55(str, pg1Var, kj3Var3, m45Var, r28Var2, j3, i2, i3) { // from class: ij3
                public final /* synthetic */ String a;
                public final /* synthetic */ pg1 b;
                public final /* synthetic */ kj3 c;
                public final /* synthetic */ m45 d;
                public final /* synthetic */ r28 e;
                public final /* synthetic */ long f;
                public final /* synthetic */ int g;

                {
                    this.g = i3;
                }

                @Override // defpackage.b55
                public final Object invoke(Object obj, Object obj2) {
                    ((Integer) obj2).getClass();
                    int iY = tr7.y(385);
                    guc.c(this.a, this.b, this.c, this.d, this.e, this.f, (x12) obj, iY, this.g);
                    return c1e.a;
                }
            };
        }
    }

    public static final void d(mg1 mg1Var, kj3 kj3Var, r28 r28Var, long j2, x12 x12Var, int i2) {
        long j3;
        long j4;
        int i3;
        long j5;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(1241648418);
        int i4 = i2 | (p65Var.f(mg1Var) ? 4 : 2) | (p65Var.d(kj3Var.ordinal()) ? 32 : 16) | (p65Var.f(r28Var) ? 256 : 128) | 1024;
        if (p65Var.P(i4 & 1, (i4 & 1171) != 1170)) {
            p65Var.U();
            if ((i2 & 1) == 0 || p65Var.z()) {
                j4 = ((uu1) p65Var.j(c82.a)).a;
                i3 = i4 & (-7169);
            } else {
                p65Var.S();
                i3 = i4 & (-7169);
                j4 = j2;
            }
            p65Var.q();
            long jB = uu1.b(0.2f, j4);
            boolean zE = ((i3 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32) | p65Var.e(jB) | p65Var.e(j4) | ((i3 & 14) == 4);
            Object objM = p65Var.M();
            if (zE || objM == w12.a) {
                j5 = j4;
                objM = new xt0(kj3Var, jB, j5, mg1Var, 1);
                p65Var.j0(objM);
            } else {
                j5 = j4;
            }
            pxf.a(r28Var, (x45) objM, p65Var, (i3 >> 6) & 14);
            j3 = j5;
        } else {
            p65Var.S();
            j3 = j2;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new jj3(mg1Var, kj3Var, r28Var, j3, i2, 0);
        }
    }

    public static final void e(m45 m45Var, m45 m45Var2, r28 r28Var, x12 x12Var, int i2) {
        int i3;
        p65 p65Var;
        r28 r28Var2;
        m45Var.getClass();
        m45Var2.getClass();
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(1649960084);
        if ((i2 & 6) == 0) {
            i3 = i2 | (p65Var2.h(m45Var) ? 4 : 2);
        } else {
            i3 = i2;
        }
        if ((i2 & 48) == 0) {
            i3 |= p65Var2.h(m45Var2) ? 32 : 16;
        }
        int i4 = i3 | 384;
        if (p65Var2.P(i4 & 1, (i4 & 147) != 146)) {
            o28 o28Var = o28.b;
            p65Var = p65Var2;
            hlg.a(m45Var2, pxf.E(-2099082020, new c60(5, m45Var), p65Var2), o28Var, pxf.E(-941549730, new c60(6, m45Var2), p65Var2), null, bo.h, bo.i, null, 0L, 0L, 0L, 0L, null, p65Var, ((i4 >> 3) & 14) | 1772976, 0, 16272);
            r28Var2 = o28Var;
        } else {
            p65Var = p65Var2;
            p65Var.S();
            r28Var2 = r28Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new zk4(m45Var, m45Var2, r28Var2, i2, 1);
        }
    }

    public static final void f(ncd ncdVar, lbd lbdVar, x12 x12Var, int i2) {
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-1837941807);
        int i3 = (p65Var.f(ncdVar) ? 4 : 2) | i2 | (p65Var.f(lbdVar) ? 32 : 16);
        int i4 = 10;
        if (p65Var.P(i3 & 1, (i3 & 19) != 18)) {
            r28 r28VarD = jfc.d(w2g.G(o28.b, 0.0f, 24.0f, 0.0f, 0.0f, 13), 1.0f);
            if (ncdVar instanceof mcd) {
                p65Var.Y(-1880988241);
                r28VarD = m40.V(r28VarD, p65Var, 0);
                p65Var.p(false);
            } else {
                p65Var.Y(-1880948871);
                p65Var.p(false);
            }
            jy8 jy8VarH = w2g.h(24.0f, 0.0f, 24.0f, 0.0f, 10);
            h70 h70Var = new h70(8.0f, true, new z10(21));
            boolean z = ncdVar instanceof kcd;
            boolean z2 = ((i3 & 14) == 4) | ((i3 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32);
            Object objM = p65Var.M();
            if (z2 || objM == w12.a) {
                objM = new pda(ncdVar, 22, lbdVar);
                p65Var.j0(objM);
            }
            k40.u(r28VarD, null, jy8VarH, h70Var, null, null, z, null, (x45) objM, p65Var, 24960, 362);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new l6c(ncdVar, lbdVar, i2, i4);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:49:0x00b4  */
    /* JADX WARN: Removed duplicated region for block: B:68:0x0179  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final void g(final defpackage.ycd r21, defpackage.kv6 r22, final defpackage.d9d r23, final defpackage.lbd r24, final defpackage.cs1 r25, final defpackage.sh9 r26, final defpackage.obe r27, final defpackage.x45 r28, final defpackage.r28 r29, defpackage.x12 r30, final int r31) {
        /*
            Method dump skipped, instruction units count: 678
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.guc.g(ycd, kv6, d9d, lbd, cs1, sh9, obe, x45, r28, x12, int):void");
    }

    public static final void h(rcd rcdVar, lbd lbdVar, x12 x12Var, int i2) {
        p65 p65Var = (p65) x12Var;
        p65Var.a0(1890863583);
        int i3 = (p65Var.f(rcdVar) ? 4 : 2) | i2 | (p65Var.f(lbdVar) ? 32 : 16);
        if (!p65Var.P(i3 & 1, (i3 & 19) != 18)) {
            p65Var.S();
        } else if (rcdVar instanceof ocd) {
            p65Var.Y(-2073842722);
            i((ocd) rcdVar, lbdVar, p65Var, i3 & ReconyxHyperFire2MakernoteDirectory.TAG_SERIAL_NUMBER);
            p65Var.p(false);
        } else if (rcdVar instanceof pcd) {
            p65Var.Y(348750723);
            p65Var.p(false);
        } else {
            if (!g76.L(rcdVar, qcd.a)) {
                throw ho2.L(p65Var, 348741431, false);
            }
            p65Var.Y(-2073571751);
            j(p65Var, 0);
            p65Var.p(false);
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new l6c(rcdVar, lbdVar, i2, 11);
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:47:0x01ee  */
    /* JADX WARN: Removed duplicated region for block: B:49:0x01f6  */
    /* JADX WARN: Removed duplicated region for block: B:52:0x0216  */
    /* JADX WARN: Removed duplicated region for block: B:59:0x0244  */
    /* JADX WARN: Removed duplicated region for block: B:66:0x02db  */
    /* JADX WARN: Removed duplicated region for block: B:75:0x0330  */
    /* JADX WARN: Removed duplicated region for block: B:81:0x0380  */
    /* JADX WARN: Removed duplicated region for block: B:84:0x038e  */
    /* JADX WARN: Removed duplicated region for block: B:85:0x0392  */
    /* JADX WARN: Removed duplicated region for block: B:88:0x0399  */
    /* JADX WARN: Removed duplicated region for block: B:97:0x03e1  */
    /* JADX WARN: Type inference failed for: r21v2, types: [x12] */
    /* JADX WARN: Type inference failed for: r21v3, types: [x12] */
    /* JADX WARN: Type inference failed for: r21v4, types: [x12] */
    /* JADX WARN: Type inference failed for: r2v2 */
    /* JADX WARN: Type inference failed for: r2v3, types: [boolean, int] */
    /* JADX WARN: Type inference failed for: r2v4 */
    /* JADX WARN: Type inference failed for: r7v10 */
    /* JADX WARN: Type inference failed for: r7v11 */
    /* JADX WARN: Type inference failed for: r7v13 */
    /* JADX WARN: Type inference failed for: r7v5 */
    /* JADX WARN: Type inference failed for: r7v6 */
    /* JADX WARN: Type inference failed for: r7v8 */
    /* JADX WARN: Type inference failed for: r8v10 */
    /* JADX WARN: Type inference failed for: r8v11 */
    /* JADX WARN: Type inference failed for: r8v12 */
    /* JADX WARN: Type inference failed for: r8v13 */
    /* JADX WARN: Type inference failed for: r8v14 */
    /* JADX WARN: Type inference failed for: r8v15 */
    /* JADX WARN: Type inference failed for: r8v16 */
    /* JADX WARN: Type inference failed for: r8v17 */
    /* JADX WARN: Type inference failed for: r8v18 */
    /* JADX WARN: Type inference failed for: r8v19 */
    /* JADX WARN: Type inference failed for: r8v2, types: [p65] */
    /* JADX WARN: Type inference failed for: r8v4, types: [p65, x12] */
    /* JADX WARN: Type inference failed for: r8v5, types: [p65, x12] */
    /* JADX WARN: Type inference failed for: r8v6, types: [p65, x12] */
    /* JADX WARN: Type inference failed for: r8v7, types: [p65, x12] */
    /* JADX WARN: Type inference failed for: r8v9, types: [p65] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final void i(defpackage.ocd r63, final defpackage.lbd r64, defpackage.x12 r65, int r66) {
        /*
            Method dump skipped, instruction units count: 1106
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.guc.i(ocd, lbd, x12, int):void");
    }

    public static final void j(x12 x12Var, int i2) {
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-130568343);
        if (p65Var.P(i2 & 1, i2 != 0)) {
            o28 o28Var = o28.b;
            r28 r28VarV = m40.V(jfc.d(o28Var, 1.0f), p65Var, 6);
            wv1 wv1VarA = uv1.a(qb8.e, z46.q, p65Var, 54);
            long j2 = p65Var.T;
            int i3 = (int) (j2 ^ (j2 >>> 32));
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
            tp7.B(p65Var, q12.f, wv1VarA);
            tp7.B(p65Var, q12.e, i89VarL);
            tp7.B(p65Var, q12.g, Integer.valueOf(i3));
            tp7.y(p65Var, q12.h);
            tp7.B(p65Var, q12.d, r28VarR);
            y30.y(o28Var, 1.0f, 48.0f, p65Var);
            r28 r28VarM = jfc.m(o28Var, 280.0f, 48.0f);
            long jT = T(p65Var);
            nr5 nr5Var = rv8.r;
            dy0.a(flb.a0(r28VarM, jT, nr5Var), p65Var, 0);
            y30.y(o28Var, 1.0f, 16.0f, p65Var);
            dy0.a(flb.a0(jfc.m(o28Var, 120.0f, 16.0f), T(p65Var), nr5Var), p65Var, 0);
            y30.y(o28Var, 1.0f, 24.0f, p65Var);
            dy0.a(flb.a0(r40.y(jfc.m(o28Var, 80.0f, 38.0f), bmb.a(18.0f)), T(p65Var), nr5Var), p65Var, 0);
            y30.y(o28Var, 1.0f, 76.0f, p65Var);
            tp7.c(0.0f, 0, 7, 0L, p65Var, null);
            p65Var.p(true);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new n2c(i2, 5);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:73:0x00dd  */
    /* JADX WARN: Removed duplicated region for block: B:74:0x00df  */
    /* JADX WARN: Removed duplicated region for block: B:77:0x00e8  */
    /* JADX WARN: Removed duplicated region for block: B:84:0x0165  */
    /* JADX WARN: Removed duplicated region for block: B:87:0x016f  */
    /* JADX WARN: Removed duplicated region for block: B:89:? A[RETURN, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final void k(defpackage.ycd r26, defpackage.nhc r27, defpackage.kv6 r28, defpackage.d9d r29, defpackage.lbd r30, defpackage.cs1 r31, defpackage.sh9 r32, defpackage.obe r33, defpackage.r28 r34, defpackage.x12 r35, int r36, int r37) {
        /*
            Method dump skipped, instruction units count: 391
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.guc.k(ycd, nhc, kv6, d9d, lbd, cs1, sh9, obe, r28, x12, int, int):void");
    }

    public static final void l(String str, String str2, u8d u8dVar, r28 r28Var, odd oddVar, x12 x12Var, int i2) {
        p65 p65Var;
        odd oddVar2;
        int i3;
        odd oddVar3;
        odd oddVar4;
        str.getClass();
        str2.getClass();
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(-127608815);
        int i4 = i2 | (p65Var2.f(str) ? 4 : 2) | (p65Var2.f(str2) ? 32 : 16) | (p65Var2.f(u8dVar) ? 256 : 128) | (p65Var2.f(r28Var) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024) | 8192;
        if (p65Var2.P(i4 & 1, (i4 & 9363) != 9362)) {
            p65Var2.U();
            int i5 = i2 & 1;
            uob uobVar = w12.a;
            if (i5 == 0 || p65Var2.z()) {
                boolean z = ((i4 & 14) == 4) | ((i4 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32);
                Object objM = p65Var2.M();
                if (z || objM == uobVar) {
                    objM = new bb0(str, str2, 22);
                    p65Var2.j0(objM);
                }
                x45 x45Var = (x45) objM;
                wue wueVarA = e67.a(p65Var2);
                if (wueVarA == null) {
                    ygf.f("No ViewModelStoreOwner was provided via LocalViewModelStoreOwner");
                    return;
                } else {
                    odd oddVar5 = (odd) to7.z(n1b.a.b(odd.class), wueVarA, t40.E(wueVarA, p65Var2), wueVarA instanceof pi5 ? r40.N(((pi5) wueVarA).getDefaultViewModelCreationExtras(), x45Var) : r40.N(og2.b, x45Var), p65Var2);
                    i3 = i4 & (-57345);
                    oddVar3 = oddVar5;
                }
            } else {
                p65Var2.S();
                i3 = i4 & (-57345);
                oddVar3 = oddVar;
            }
            p65Var2.q();
            l78 l78VarZ = z(oddVar3.L, p65Var2, 0);
            nhc nhcVarF = mk7.F(p65Var2);
            kv6 kv6VarA = pv6.a(p65Var2);
            Resources resources = (Resources) p65Var2.j(eo.c);
            Context context = (Context) p65Var2.j(eo.b);
            Object objM2 = p65Var2.M();
            if (objM2 == uobVar) {
                objM2 = kyd.M(p65Var2);
                p65Var2.j0(objM2);
            }
            sb2 sb2Var = (sb2) objM2;
            int i6 = i3 & 896;
            boolean zF = (i6 == 256) | p65Var2.f(oddVar3);
            Object objM3 = p65Var2.M();
            if (zF || objM3 == uobVar) {
                objM3 = new mbd(u8dVar, oddVar3);
                p65Var2.j0(objM3);
            }
            mbd mbdVar = (mbd) objM3;
            boolean zF2 = (i6 == 256) | p65Var2.f(oddVar3) | p65Var2.f(context);
            Object objM4 = p65Var2.M();
            if (zF2 || objM4 == uobVar) {
                objM4 = new jbd(oddVar3, u8dVar, context);
                p65Var2.j0(objM4);
            }
            jbd jbdVar = (jbd) objM4;
            boolean zF3 = (i6 == 256) | p65Var2.f(oddVar3);
            Object objM5 = p65Var2.M();
            if (zF3 || objM5 == uobVar) {
                objM5 = new kbd(u8dVar, oddVar3);
                p65Var2.j0(objM5);
            }
            kbd kbdVar = (kbd) objM5;
            boolean zF4 = (i6 == 256) | p65Var2.f(oddVar3);
            Object objM6 = p65Var2.M();
            if (zF4 || objM6 == uobVar) {
                objM6 = new nbd(u8dVar, oddVar3);
                p65Var2.j0(objM6);
            }
            nbd nbdVar = (nbd) objM6;
            boolean zF5 = p65Var2.f(oddVar3);
            Object objM7 = p65Var2.M();
            if (zF5 || objM7 == uobVar) {
                objM7 = new lbd(oddVar3);
                p65Var2.j0(objM7);
            }
            k((ycd) l78VarZ.getValue(), nhcVarF, kv6VarA, u8dVar, (lbd) objM7, kbdVar, mbdVar, nbdVar, r28Var, p65Var2, ((i3 << 3) & 7168) | ((i3 << 15) & 234881024), 0);
            boolean zH = p65Var2.h(oddVar3) | p65Var2.f(nhcVarF) | p65Var2.h(sb2Var) | p65Var2.h(resources) | p65Var2.f(jbdVar) | (i6 == 256) | p65Var2.f(kbdVar) | p65Var2.f(mbdVar) | p65Var2.f(nbdVar);
            Object objM8 = p65Var2.M();
            if (zH || objM8 == uobVar) {
                oddVar4 = oddVar3;
                p65Var = p65Var2;
                y78 y78Var = new y78(oddVar4, nhcVarF, sb2Var, resources, jbdVar, u8dVar, kbdVar, mbdVar, nbdVar, null, 3);
                p65Var.j0(y78Var);
                objM8 = y78Var;
            } else {
                oddVar4 = oddVar3;
                p65Var = p65Var2;
            }
            kyd.k(p65Var, (b55) objM8, c1e.a);
            oddVar2 = oddVar4;
        } else {
            p65Var = p65Var2;
            p65Var.S();
            oddVar2 = oddVar;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new exc(str, str2, u8dVar, r28Var, oddVar2, i2, 7);
        }
    }

    public static final void m(ycd ycdVar, boolean z, d9d d9dVar, lbd lbdVar, float f2, x12 x12Var, int i2) {
        Object ibdVar;
        d9d d9dVar2;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(1355538381);
        int i3 = i2 | (p65Var.f(ycdVar) ? 4 : 2) | (p65Var.g(z) ? 32 : 16) | (p65Var.f(d9dVar) ? 256 : 128) | (p65Var.f(lbdVar) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024) | (p65Var.c(f2) ? OlympusMakernoteDirectory.TAG_MAIN_INFO : 8192);
        if (p65Var.P(i3 & 1, (i3 & 9363) != 9362)) {
            boolean z2 = (i3 & 896) == 256;
            Object objM = p65Var.M();
            if (z2 || objM == w12.a) {
                ibdVar = new ibd(0, d9dVar, d9d.class, "onBackPressed", "onBackPressed()V", 0, 1);
                d9dVar2 = d9dVar;
                p65Var.j0(ibdVar);
            } else {
                d9dVar2 = d9dVar;
                ibdVar = objM;
            }
            qk7.f(pxf.E(686986367, new pv0(z, ycdVar, 6), p65Var), wo7.w(o28.b, f2, null, 0L, 0L, 30), (m45) ((qh6) ibdVar), pxf.E(1295538932, new gab(ycdVar, lbdVar, d9dVar2, 7), p65Var), null, null, 0L, 0L, null, p65Var, 3078, 496);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new ea1(ycdVar, z, d9dVar, lbdVar, f2, i2);
        }
    }

    public static final void n(gd9 gd9Var, pod podVar, sb2 sb2Var, boolean z, l78 l78Var, mz1 mz1Var, x12 x12Var, int i2) {
        int i3;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-1413720282);
        int i4 = 4;
        if ((i2 & 6) == 0) {
            i3 = (p65Var.f(gd9Var) ? 4 : 2) | i2;
        } else {
            i3 = i2;
        }
        if ((i2 & 48) == 0) {
            i3 |= (i2 & 64) == 0 ? p65Var.f(podVar) : p65Var.h(podVar) ? 32 : 16;
        }
        if ((i2 & 384) == 0) {
            i3 |= p65Var.h(null) ? 256 : 128;
        }
        if ((i2 & 3072) == 0) {
            i3 |= p65Var.h(sb2Var) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024;
        }
        if ((i2 & 24576) == 0) {
            i3 |= p65Var.g(z) ? OlympusMakernoteDirectory.TAG_MAIN_INFO : 8192;
        }
        if ((196608 & i2) == 0) {
            i3 |= p65Var.f(l78Var) ? 131072 : ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID;
        }
        if ((1572864 & i2) == 0) {
            i3 |= p65Var.h(mz1Var) ? 1048576 : 524288;
        }
        int i5 = 1;
        if (p65Var.P(i3 & 1, (599187 & i3) != 599186)) {
            String strR = vo7.R(p65Var, R.string.tooltip_description);
            boolean zH = ((i3 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32 || ((i3 & 64) != 0 && p65Var.h(podVar))) | ((i3 & 896) == 256) | p65Var.h(sb2Var) | ((458752 & i3) == 131072);
            Object objM = p65Var.M();
            if (zH || objM == w12.a) {
                objM = new le0(podVar, sb2Var, l78Var, i4);
                p65Var.j0(objM);
            }
            tr.a(gd9Var, (m45) objM, new hd9(z), pxf.E(-1287705660, new kd(strR, i5, mz1Var), p65Var), p65Var, (i3 & 14) | 3072, 0);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new jp0(gd9Var, podVar, sb2Var, z, l78Var, mz1Var, i2);
        }
    }

    public static final void o(pod podVar, l78 l78Var, r28 r28Var, mz1 mz1Var, x12 x12Var, int i2) {
        int i3;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(1873232064);
        int i4 = 1;
        if ((i2 & 6) == 0) {
            i3 = (p65Var.g(true) ? 4 : 2) | i2;
        } else {
            i3 = i2;
        }
        if ((i2 & 48) == 0) {
            i3 |= (i2 & 64) == 0 ? p65Var.f(podVar) : p65Var.h(podVar) ? 32 : 16;
        }
        if ((i2 & 384) == 0) {
            i3 |= p65Var.f(l78Var) ? 256 : 128;
        }
        int i5 = 0;
        if ((i2 & 3072) == 0) {
            i3 |= p65Var.g(false) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024;
        }
        if ((i2 & 24576) == 0) {
            i3 |= p65Var.f(r28Var) ? OlympusMakernoteDirectory.TAG_MAIN_INFO : 8192;
        }
        if ((196608 & i2) == 0) {
            i3 |= p65Var.h(mz1Var) ? 131072 : ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID;
        }
        if (p65Var.P(i3 & 1, (74899 & i3) != 74898)) {
            Object objM = p65Var.M();
            if (objM == w12.a) {
                objM = kyd.M(p65Var);
                p65Var.j0(objM);
            }
            sb2 sb2Var = (sb2) objM;
            r28 r28VarJ = wgf.J(r40.J(r4d.a(r4d.a(r28Var, podVar, new op0(podVar, i5)), podVar, new op0(podVar, i4)).b(new o49(new o8(vo7.R(p65Var, R.string.tooltip_label), sb2Var, podVar, 3))), new i0(sb2Var, 15, podVar)), new s2(podVar, 11, l78Var));
            zk7 zk7VarC = dy0.c(z46.d, false);
            int iS = w2g.s(p65Var);
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
            tp7.B(p65Var, q12.f, zk7VarC);
            tp7.B(p65Var, q12.e, i89VarL);
            cu cuVar = q12.g;
            if (p65Var.S || !g76.L(p65Var.M(), Integer.valueOf(iS))) {
                lv8.w(iS, p65Var, iS, cuVar);
            }
            tp7.B(p65Var, q12.d, r28VarR);
            km4.H((i3 >> 15) & 14, mz1Var, p65Var, true);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new v8(podVar, l78Var, r28Var, mz1Var, i2);
        }
    }

    public static final void p(final cff cffVar, final String str, final zef zefVar, final String str2, bo4 bo4Var, r28 r28Var, x12 x12Var, int i2) {
        int i3;
        zef zefVar2;
        bo4 bo4Var2;
        p65 p65Var;
        char c2;
        Object obj;
        float f2;
        int i4;
        Object obj2;
        int i5;
        Object obj3;
        n92 n92Var;
        Object obj4;
        Object j5dVar;
        d13 d13Var;
        j78 j78Var;
        j78 j78Var2;
        cffVar.getClass();
        az5 az5Var = cffVar.a;
        zefVar.getClass();
        str2.getClass();
        bo4Var.getClass();
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(-1971174229);
        if ((i2 & 6) == 0) {
            i3 = (p65Var2.f(cffVar) ? 4 : 2) | i2;
        } else {
            i3 = i2;
        }
        if ((i2 & 48) == 0) {
            i3 |= p65Var2.f(str) ? 32 : 16;
        }
        if ((i2 & 384) == 0) {
            i3 |= p65Var2.f(zefVar) ? 256 : 128;
        }
        if ((i2 & 3072) == 0) {
            i3 |= p65Var2.f(str2) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024;
        }
        if ((i2 & 24576) == 0) {
            i3 |= p65Var2.h(bo4Var) ? OlympusMakernoteDirectory.TAG_MAIN_INFO : 8192;
        }
        if ((196608 & i2) == 0) {
            i3 |= p65Var2.f(r28Var) ? 131072 : ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID;
        }
        if (p65Var2.P(i3 & 1, (74899 & i3) != 74898)) {
            boolean zF = p65Var2.f(az5Var);
            Object objM = p65Var2.M();
            uob uobVar = w12.a;
            if (zF || objM == uobVar) {
                ArrayList arrayList = new ArrayList(cu1.k0(az5Var, 10));
                Iterator<E> it2 = az5Var.iterator();
                while (it2.hasNext()) {
                    arrayList.add(new mz1(new zq(12, (YourLibraryTab) it2.next()), true, -1299701775));
                }
                c2 = ' ';
                p65Var2.j0(arrayList);
                obj = arrayList;
            } else {
                c2 = ' ';
                obj = objM;
            }
            List list = (List) obj;
            d13 d13VarB = jz8.b(cffVar.c, new kv4(0, 15, List.class, list, "size", "size()I"), p65Var2, 0, 2);
            m73 m73Var = (m73) p65Var2.j(z22.h);
            Object objM2 = p65Var2.M();
            Object obj5 = objM2;
            if (objM2 == uobVar) {
                g49 g49Var = new g49(0.0f);
                p65Var2.j0(g49Var);
                obj5 = g49Var;
            }
            g49 g49Var2 = (g49) obj5;
            p65Var2.Y(-217803096);
            WeakHashMap weakHashMap = f5f.w;
            float fN = m73Var.N(tr7.o(p65Var2).f.e().b);
            p65Var2.p(false);
            Object objM3 = p65Var2.M();
            Object obj6 = objM3;
            if (objM3 == uobVar) {
                g49 g49Var3 = new g49(0.0f);
                p65Var2.j0(g49Var3);
                obj6 = g49Var3;
            }
            g49 g49Var4 = (g49) obj6;
            Object objM4 = p65Var2.M();
            if (objM4 == uobVar) {
                f2 = 0.0f;
                i4 = 0;
                r6c r6cVarX = k40.x(0, 7, null);
                p65Var2.j0(r6cVarX);
                obj2 = r6cVarX;
            } else {
                f2 = 0.0f;
                i4 = 0;
                obj2 = objM4;
            }
            final j78 j78Var3 = (j78) obj2;
            Object objM5 = p65Var2.M();
            Object obj7 = objM5;
            if (objM5 == uobVar) {
                r6c r6cVarX2 = k40.x(i4, 7, null);
                p65Var2.j0(r6cVarX2);
                obj7 = r6cVarX2;
            }
            final j78 j78Var4 = (j78) obj7;
            Object objM6 = p65Var2.M();
            Object obj8 = objM6;
            if (objM6 == uobVar) {
                r6c r6cVarX3 = k40.x(i4, 7, null);
                p65Var2.j0(r6cVarX3);
                obj8 = r6cVarX3;
            }
            final j78 j78Var5 = (j78) obj8;
            Object objM7 = p65Var2.M();
            Object obj9 = objM7;
            if (objM7 == uobVar) {
                r6c r6cVarX4 = k40.x(i4, 7, null);
                p65Var2.j0(r6cVarX4);
                obj9 = r6cVarX4;
            }
            final j78 j78Var6 = (j78) obj9;
            Object objM8 = p65Var2.M();
            Object obj10 = objM8;
            if (objM8 == uobVar) {
                r6c r6cVarX5 = k40.x(i4, 7, null);
                p65Var2.j0(r6cVarX5);
                obj10 = r6cVarX5;
            }
            final j78 j78Var7 = (j78) obj10;
            Object objM9 = p65Var2.M();
            Object obj11 = objM9;
            if (objM9 == uobVar) {
                r6c r6cVarX6 = k40.x(i4, 7, null);
                p65Var2.j0(r6cVarX6);
                obj11 = r6cVarX6;
            }
            final j78 j78Var8 = (j78) obj11;
            Object objM10 = p65Var2.M();
            Object obj12 = objM10;
            if (objM10 == uobVar) {
                aff affVar = new aff(g49Var4, g49Var2);
                p65Var2.j0(affVar);
                obj12 = affVar;
            }
            sn3 sn3Var = kt7.b;
            long j2 = ((zo7) p65Var2.j(sn3Var)).a;
            nr5 nr5Var = rv8.r;
            r28 r28VarJ = rv8.J(bgf.N(flb.a0(r28Var, j2, nr5Var).b(jfc.c), "your_library"), (aff) obj12, null);
            ar0 ar0Var = z46.d;
            zk7 zk7VarC = dy0.c(ar0Var, false);
            long j3 = p65Var2.T;
            int i6 = (int) (j3 ^ (j3 >>> c2));
            i89 i89VarL = p65Var2.l();
            r28 r28VarR = gx1.R(p65Var2, r28VarJ);
            r12.W.getClass();
            ot2 ot2Var = q12.b;
            p65Var2.c0();
            if (p65Var2.S) {
                p65Var2.k(ot2Var);
            } else {
                p65Var2.m0();
            }
            cu cuVar = q12.f;
            tp7.B(p65Var2, cuVar, zk7VarC);
            cu cuVar2 = q12.e;
            tp7.B(p65Var2, cuVar2, i89VarL);
            Integer numValueOf = Integer.valueOf(i6);
            cu cuVar3 = q12.g;
            tp7.B(p65Var2, cuVar3, numValueOf);
            fn fnVar = q12.h;
            tp7.y(p65Var2, fnVar);
            cu cuVar4 = q12.d;
            tp7.B(p65Var2, cuVar4, r28VarR);
            o28 o28Var = o28.b;
            r28 r28VarG = w2g.G(o28Var, 0.0f, fN, 0.0f, 0.0f, 13);
            int i7 = i3;
            Object objM11 = p65Var2.M();
            Object obj13 = objM11;
            if (objM11 == uobVar) {
                w35 w35Var = new w35(g49Var2, 7);
                p65Var2.j0(w35Var);
                obj13 = w35Var;
            }
            r28 r28VarV = pwd.V(r28VarG, (x45) obj13);
            Object objM12 = p65Var2.M();
            Object obj14 = objM12;
            if (objM12 == uobVar) {
                w35 w35Var2 = new w35(g49Var4, 8);
                p65Var2.j0(w35Var2);
                obj14 = w35Var2;
            }
            r(zefVar, R(r28VarV, (x45) obj14), p65Var2, (i7 >> 6) & 14);
            float fG = g49Var4.g() + g49Var2.g();
            r28 r28VarG2 = w2g.G(o28Var, 0.0f, m73Var.Q(fG < f2 ? f2 : fG) + fN, 0.0f, 0.0f, 13);
            wv1 wv1VarA = uv1.a(qb8.c, z46.p, p65Var2, 0);
            long j4 = p65Var2.T;
            int i8 = (int) (j4 ^ (j4 >>> c2));
            i89 i89VarL2 = p65Var2.l();
            r28 r28VarR2 = gx1.R(p65Var2, r28VarG2);
            p65Var2.c0();
            if (p65Var2.S) {
                p65Var2.k(ot2Var);
            } else {
                p65Var2.m0();
            }
            tp7.B(p65Var2, cuVar, wv1VarA);
            tp7.B(p65Var2, cuVar2, i89VarL2);
            ka1.z(i8, p65Var2, cuVar3, p65Var2, fnVar);
            tp7.B(p65Var2, cuVar4, r28VarR2);
            r28 r28VarJ2 = ka1.j((jp7) p65Var2.j(kt7.a), o28Var, 3, 1.0f);
            zk7 zk7VarC2 = dy0.c(z46.h, false);
            long j5 = p65Var2.T;
            int i9 = (int) (j5 ^ (j5 >>> c2));
            i89 i89VarL3 = p65Var2.l();
            r28 r28VarR3 = gx1.R(p65Var2, r28VarJ2);
            p65Var2.c0();
            if (p65Var2.S) {
                p65Var2.k(ot2Var);
            } else {
                p65Var2.m0();
            }
            tp7.B(p65Var2, cuVar, zk7VarC2);
            tp7.B(p65Var2, cuVar2, i89VarL3);
            ka1.z(i9, p65Var2, cuVar3, p65Var2, fnVar);
            tp7.B(p65Var2, cuVar4, r28VarR3);
            r28 r28VarD = jfc.d(jfc.o(o28Var, 0.0f, 0.0f, 648.0f, 0.0f, 11), 1.0f);
            zk7 zk7VarC3 = dy0.c(ar0Var, false);
            long j6 = p65Var2.T;
            int i10 = (int) (j6 ^ (j6 >>> c2));
            i89 i89VarL4 = p65Var2.l();
            r28 r28VarR4 = gx1.R(p65Var2, r28VarD);
            p65Var2.c0();
            if (p65Var2.S) {
                p65Var2.k(ot2Var);
            } else {
                p65Var2.m0();
            }
            tp7.B(p65Var2, cuVar, zk7VarC3);
            tp7.B(p65Var2, cuVar2, i89VarL4);
            ka1.z(i10, p65Var2, cuVar3, p65Var2, fnVar);
            tp7.B(p65Var2, cuVar4, r28VarR4);
            int i11 = cffVar.c;
            r28 r28VarD2 = jfc.d(o28Var, 1.0f);
            int i12 = i7 & 896;
            int i13 = i7 & 14;
            boolean z = (i12 == 256) | (i13 == 4);
            Object objM13 = p65Var2.M();
            if (z || objM13 == uobVar) {
                i5 = 0;
                vef vefVar = new vef(zefVar, i5, cffVar);
                p65Var2.j0(vefVar);
                obj3 = vefVar;
            } else {
                i5 = 0;
                obj3 = objM13;
            }
            ns7.b(0.0f, i11, 48, 248, 0L, 0L, p65Var2, (x45) obj3, null, r28VarD2, null, list);
            p65Var2.p(true);
            p65Var2.p(true);
            int i14 = i5;
            kk7.c(d13VarB, null, null, null, null, null, false, null, null, null, pxf.E(1887549160, new d55() { // from class: wef
                @Override // defpackage.d55
                public final Object k(Object obj15, Object obj16, Object obj17, Object obj18) {
                    int iIntValue = ((Integer) obj16).intValue();
                    x12 x12Var2 = (x12) obj17;
                    ((Integer) obj18).getClass();
                    ((zy8) obj15).getClass();
                    rh4 rh4Var = jfc.c;
                    r28 r28VarX = rv8.X(rh4Var, rv8.w);
                    zk7 zk7VarC4 = dy0.c(z46.d, false);
                    p65 p65Var3 = (p65) x12Var2;
                    long j7 = p65Var3.T;
                    int i15 = (int) (j7 ^ (j7 >>> 32));
                    i89 i89VarL5 = p65Var3.l();
                    r28 r28VarR5 = gx1.R(x12Var2, r28VarX);
                    r12.W.getClass();
                    ot2 ot2Var2 = q12.b;
                    p65 p65Var4 = (p65) x12Var2;
                    p65Var4.c0();
                    if (p65Var4.S) {
                        p65Var4.k(ot2Var2);
                    } else {
                        p65Var4.m0();
                    }
                    tp7.B(x12Var2, q12.f, zk7VarC4);
                    tp7.B(x12Var2, q12.e, i89VarL5);
                    tp7.B(x12Var2, q12.g, Integer.valueOf(i15));
                    tp7.y(x12Var2, q12.h);
                    tp7.B(x12Var2, q12.d, r28VarR5);
                    YourLibraryTab yourLibraryTab = (YourLibraryTab) bu1.A0(iIntValue, cffVar.a);
                    if (yourLibraryTab == null) {
                        yourLibraryTab = YourLibraryTab.YOUR_LISTS;
                    }
                    int i16 = xef.a[yourLibraryTab.ordinal()];
                    String str3 = str2;
                    zef zefVar3 = zefVar;
                    switch (i16) {
                        case 1:
                            p65Var4.Y(73022104);
                            op8.v(3072, x12Var2, j78Var3, rh4Var, zefVar3, str3);
                            p65Var4.p(false);
                            break;
                        case 2:
                            p65Var4.Y(73423244);
                            rx0.r(3072, x12Var2, j78Var4, rh4Var, zefVar3, str3);
                            p65Var4.p(false);
                            break;
                        case 3:
                            p65Var4.Y(73832382);
                            nk7.n(str, str3, j78Var5, zefVar3, rh4Var, x12Var2, 24576);
                            p65Var4.p(false);
                            break;
                        case 4:
                            p65Var4.Y(74286067);
                            g76.r(zefVar3, j78Var6, rh4Var, x12Var2, 384);
                            p65Var4.p(false);
                            break;
                        case 5:
                            p65Var4.Y(74665042);
                            op8.B(zefVar3, str3, "reading_history", j78Var7, rh4Var, null, null, x12Var2, 24960, 96);
                            p65Var4.p(false);
                            break;
                        case 6:
                            p65Var4.Y(75126508);
                            pwd.u(3072, x12Var2, j78Var8, rh4Var, zefVar3, str3);
                            p65Var4.p(false);
                            break;
                        default:
                            throw ho2.L(p65Var4, -1798759657, false);
                    }
                    p65Var4.p(true);
                    return c1e.a;
                }
            }, p65Var2), p65Var2, 0, 16382);
            p65 p65Var3 = p65Var2;
            p65Var3.p(true);
            dy0.a(jfc.e(jfc.d(flb.a0(o28Var, ((zo7) p65Var3.j(sn3Var)).a, nr5Var), 1.0f), fN), p65Var3, i14);
            p65Var3.p(true);
            YourLibraryTab yourLibraryTab = cffVar.b;
            int i15 = (p65Var3.f(d13VarB) ? 1 : 0) | (i13 == 4 ? 1 : i14);
            Object objM14 = p65Var3.M();
            if (i15 != 0 || objM14 == uobVar) {
                n92Var = null;
                kaf kafVar = new kaf(d13VarB, cffVar, n92Var, 3);
                p65Var3.j0(kafVar);
                obj4 = kafVar;
            } else {
                n92Var = null;
                obj4 = objM14;
            }
            kyd.k(p65Var3, (b55) obj4, yourLibraryTab);
            int i16 = (p65Var3.f(d13VarB) ? 1 : 0) | (i12 == 256 ? 1 : i14) | (p65Var3.f(az5Var) ? 1 : 0);
            Object objM15 = p65Var3.M();
            if (i16 != 0 || objM15 == uobVar) {
                d13Var = d13VarB;
                n92 n92Var2 = n92Var;
                j78Var = j78Var7;
                j78Var2 = j78Var8;
                j5dVar = new j5d(d13Var, zefVar, az5Var, n92Var2, 25);
                zefVar2 = zefVar;
                p65Var3.j0(j5dVar);
            } else {
                zefVar2 = zefVar;
                j5dVar = objM15;
                d13Var = d13VarB;
                j78Var = j78Var7;
                j78Var2 = j78Var8;
            }
            b55 b55Var = (b55) j5dVar;
            ib2 ib2Var = p65Var3.R;
            boolean zF2 = p65Var3.f(d13Var) | p65Var3.f(zefVar2) | p65Var3.f(az5Var);
            Object objM16 = p65Var3.M();
            Object obj15 = objM16;
            if (zF2 || objM16 == uobVar) {
                fo6 fo6Var = new fo6(ib2Var, b55Var);
                p65Var3.j0(fo6Var);
                obj15 = fo6Var;
            }
            bo4Var2 = bo4Var;
            boolean zH = p65Var3.h(bo4Var2) | p65Var3.h(j78Var3) | p65Var3.h(j78Var4) | p65Var3.h(j78Var5) | p65Var3.h(j78Var6) | p65Var3.h(j78Var) | p65Var3.h(j78Var2);
            Object objM17 = p65Var3.M();
            if (zH || objM17 == uobVar) {
                uc0 uc0Var = new uc0(bo4Var2, g49Var4, j78Var3, j78Var4, j78Var5, j78Var6, j78Var, j78Var2, null, 7);
                p65Var3.j0(uc0Var);
                objM17 = uc0Var;
            }
            kyd.k(p65Var3, (b55) objM17, bo4Var2);
            p65Var = p65Var3;
        } else {
            p65 p65Var4 = p65Var2;
            zefVar2 = zefVar;
            bo4Var2 = bo4Var;
            p65Var4.S();
            p65Var = p65Var4;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new iu0(cffVar, str, zefVar2, str2, bo4Var2, r28Var, i2);
        }
    }

    public static final void q(YourLibraryTab yourLibraryTab, String str, uef uefVar, String str2, bo4 bo4Var, r28 r28Var, eff effVar, x12 x12Var, int i2) {
        YourLibraryTab yourLibraryTab2;
        uef uefVar2;
        eff effVar2;
        int i3;
        yourLibraryTab.getClass();
        uefVar.getClass();
        str2.getClass();
        bo4Var.getClass();
        p65 p65Var = (p65) x12Var;
        p65Var.a0(544352005);
        int i4 = i2 | (p65Var.d(yourLibraryTab.ordinal()) ? 4 : 2) | (p65Var.f(str) ? 32 : 16) | (p65Var.f(str2) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024) | (p65Var.h(bo4Var) ? OlympusMakernoteDirectory.TAG_MAIN_INFO : 8192) | (p65Var.f(r28Var) ? 131072 : ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID) | 524288;
        if (p65Var.P(i4 & 1, (599187 & i4) != 599186)) {
            p65Var.U();
            int i5 = i2 & 1;
            uob uobVar = w12.a;
            if (i5 == 0 || p65Var.z()) {
                boolean z = (i4 & 14) == 4;
                Object objM = p65Var.M();
                if (z || objM == uobVar) {
                    yourLibraryTab2 = yourLibraryTab;
                    objM = new zzb(21, yourLibraryTab2);
                    p65Var.j0(objM);
                } else {
                    yourLibraryTab2 = yourLibraryTab;
                }
                x45 x45Var = (x45) objM;
                wue wueVarA = e67.a(p65Var);
                if (wueVarA == null) {
                    ygf.f("No ViewModelStoreOwner was provided via LocalViewModelStoreOwner");
                    return;
                } else {
                    i3 = i4 & (-3670017);
                    effVar2 = (eff) to7.z(n1b.a.b(eff.class), wueVarA, t40.E(wueVarA, p65Var), wueVarA instanceof pi5 ? r40.N(((pi5) wueVarA).getDefaultViewModelCreationExtras(), x45Var) : r40.N(og2.b, x45Var), p65Var);
                }
            } else {
                p65Var.S();
                i3 = i4 & (-3670017);
                yourLibraryTab2 = yourLibraryTab;
                effVar2 = effVar;
            }
            p65Var.q();
            l78 l78VarZ = z(effVar2.c, p65Var, 0);
            boolean zF = p65Var.f(effVar2);
            Object objM2 = p65Var.M();
            if (zF || objM2 == uobVar) {
                uefVar2 = uefVar;
                objM2 = new zef(uefVar2, effVar2);
                p65Var.j0(objM2);
            } else {
                uefVar2 = uefVar;
            }
            p((cff) l78VarZ.getValue(), str, (zef) objM2, str2, bo4Var, r28Var, p65Var, i3 & 523376);
        } else {
            yourLibraryTab2 = yourLibraryTab;
            uefVar2 = uefVar;
            p65Var.S();
            effVar2 = effVar;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new mc3(yourLibraryTab2, str, uefVar2, str2, bo4Var, r28Var, effVar2, i2);
        }
    }

    public static final void r(zef zefVar, r28 r28Var, x12 x12Var, int i2) {
        int i3;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-502001409);
        if ((i2 & 6) == 0) {
            i3 = (p65Var.f(zefVar) ? 4 : 2) | i2;
        } else {
            i3 = i2;
        }
        if ((i2 & 48) == 0) {
            i3 |= p65Var.f(r28Var) ? 32 : 16;
        }
        int i4 = i3;
        if (p65Var.P(i4 & 1, (i4 & 19) != 18)) {
            r28 r28VarF = w2g.F(jfc.d(r28Var, 1.0f), 24.0f, 22.0f, 24.0f, 16.0f);
            omb ombVarA = nmb.a(qb8.a, z46.n, p65Var, 48);
            long j2 = p65Var.T;
            int i5 = (int) (j2 ^ (j2 >>> 32));
            i89 i89VarL = p65Var.l();
            r28 r28VarR = gx1.R(p65Var, r28VarF);
            r12.W.getClass();
            ot2 ot2Var = q12.b;
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, q12.f, ombVarA);
            tp7.B(p65Var, q12.e, i89VarL);
            tp7.B(p65Var, q12.g, Integer.valueOf(i5));
            tp7.y(p65Var, q12.h);
            tp7.B(p65Var, q12.d, r28VarR);
            jjd.b(vo7.R(p65Var, R.string.your_library_title), bgf.N(jfc.t(new sq6(1.0f, true), z46.p, 2), "title"), 0L, 0L, 0L, null, new jgd(5), 0L, 2, false, 1, 0, null, ((bu7) p65Var.j(jt7.c)).h, p65Var, 0, 24960, 109564);
            p65Var = p65Var;
            boolean z = (i4 & 14) == 4;
            Object objM = p65Var.M();
            if (z || objM == w12.a) {
                objM = new l2f(8, zefVar);
                p65Var.j0(objM);
            }
            fo7.r((m45) objM, vo7.R(p65Var, R.string.your_library_new_list), xn7.M, bgf.N(jfc.t(o28.b, z46.r, 2), "new_list_button"), false, p65Var, 3456, 16);
            p65Var.p(true);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new meb(zefVar, r28Var, i2, 12);
        }
    }

    public static final void s(que queVar, epb epbVar, wx6 wx6Var) {
        epbVar.getClass();
        wx6Var.getClass();
        wob wobVar = (wob) queVar.c("androidx.lifecycle.savedstate.vm.tag");
        if (wobVar == null || wobVar.c) {
            return;
        }
        wobVar.m(epbVar, wx6Var);
        vx6 vx6Var = ((ky6) wx6Var).d;
        if (vx6Var == vx6.INITIALIZED || vx6Var.isAtLeast(vx6.STARTED)) {
            epbVar.d();
        } else {
            wx6Var.a(new h03(wx6Var, 1, epbVar));
        }
    }

    public static final Object t(v31 v31Var, n92 n92Var) {
        x51 x51Var = new x51(1, pwd.Q(n92Var));
        x51Var.s();
        x51Var.v(new zm6(v31Var, 0));
        v31Var.f(new pkf(x51Var));
        return x51Var.q();
    }

    public static final Object u(v31 v31Var, n92 n92Var) {
        x51 x51Var = new x51(1, pwd.Q(n92Var));
        x51Var.s();
        x51Var.v(new zm6(v31Var, 1));
        v31Var.f(new zg2(x51Var));
        return x51Var.q();
    }

    public static final int v(int i2, o78 o78Var) {
        int i3 = o78Var.c - 1;
        int i4 = 0;
        while (i4 < i3) {
            int i5 = ((i3 - i4) / 2) + i4;
            Object[] objArr = o78Var.a;
            int i6 = ((v66) objArr[i5]).a;
            if (i6 != i2) {
                if (i6 < i2) {
                    i4 = i5 + 1;
                    if (i2 < ((v66) objArr[i4]).a) {
                    }
                } else {
                    i3 = i5 - 1;
                }
            }
            return i5;
        }
        return i4;
    }

    public static final byte w(char c2) {
        if (c2 < '~') {
            return pk1.b[c2];
        }
        return (byte) 0;
    }

    public static final l78 x(bo4 bo4Var, Object obj, x12 x12Var, int i2) {
        iy6 iy6Var = (iy6) ((p65) x12Var).j(y57.a);
        return y(bo4Var, obj, iy6Var.getLifecycle(), vx6.STARTED, x12Var, (i2 & 14) | (((i2 >> 3) & 8) << 3) | (i2 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) | (i2 & 7168) | (i2 & 57344));
    }

    public static final l78 y(bo4 bo4Var, Object obj, wx6 wx6Var, vx6 vx6Var, x12 x12Var, int i2) {
        int i3 = 2;
        zx3 zx3Var = zx3.a;
        Object[] objArr = {bo4Var, wx6Var, vx6Var, zx3Var};
        p65 p65Var = (p65) x12Var;
        boolean zH = p65Var.h(wx6Var) | ((((i2 & 7168) ^ 3072) > 2048 && p65Var.d(vx6Var.ordinal())) || (i2 & 3072) == 2048) | p65Var.h(zx3Var) | p65Var.h(bo4Var);
        Object objM = p65Var.M();
        n92 n92Var = null;
        uob uobVar = w12.a;
        if (zH || objM == uobVar) {
            io4 io4Var = new io4(wx6Var, vx6Var, bo4Var, n92Var, 0);
            p65Var.j0(io4Var);
            objM = io4Var;
        }
        b55 b55Var = (b55) objM;
        Object objM2 = p65Var.M();
        if (objM2 == uobVar) {
            objM2 = qo7.u(obj);
            p65Var.j0(objM2);
        }
        l78 l78Var = (l78) objM2;
        Object[] objArrCopyOf = Arrays.copyOf(objArr, 4);
        boolean zH2 = p65Var.h(b55Var);
        Object objM3 = p65Var.M();
        if (zH2 || objM3 == uobVar) {
            objM3 = new cjc(b55Var, l78Var, n92Var, i3);
            p65Var.j0(objM3);
        }
        kyd.m(objArrCopyOf, (b55) objM3, p65Var);
        return l78Var;
    }

    public static final l78 z(vpc vpcVar, x12 x12Var, int i2) {
        iy6 iy6Var = (iy6) ((p65) x12Var).j(y57.a);
        vx6 vx6Var = vx6.STARTED;
        Object value = vpcVar.getValue();
        wx6 lifecycle = iy6Var.getLifecycle();
        int i3 = i2 & 14;
        int i4 = i2 << 3;
        return y(vpcVar, value, lifecycle, vx6Var, x12Var, i3 | (i4 & 7168) | (i4 & 57344));
    }
}
