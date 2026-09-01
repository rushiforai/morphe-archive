package defpackage;

import android.app.Notification;
import android.app.PendingIntent;
import android.content.BroadcastReceiver;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.content.pm.PackageManager;
import android.content.res.Resources;
import android.graphics.Bitmap;
import android.graphics.drawable.AdaptiveIconDrawable;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.Icon;
import android.os.Build;
import android.view.ViewConfiguration;
import android.view.ViewParent;
import android.view.textclassifier.TextClassification;
import com.drew.lang.RandomAccessStreamReader;
import com.drew.metadata.exif.makernotes.OlympusMakernoteDirectory;
import com.drew.metadata.exif.makernotes.PanasonicMakernoteDirectory;
import com.drew.metadata.exif.makernotes.ReconyxHyperFire2MakernoteDirectory;
import com.medium.reader.R;
import java.io.File;
import java.io.IOException;
import java.lang.invoke.MethodHandles;
import java.lang.reflect.Constructor;
import java.lang.reflect.Method;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;
import java.util.Iterator;
import java.util.Set;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class u36 {
    public static Context a;
    public static Boolean b;
    public static Constructor c;

    public static final int A(Bitmap.Config config) {
        if (config == Bitmap.Config.ALPHA_8) {
            return 1;
        }
        if (config == Bitmap.Config.RGB_565) {
            return 2;
        }
        if (config == Bitmap.Config.ARGB_4444) {
            return 0;
        }
        int i = Build.VERSION.SDK_INT;
        if (i < 26 || config != Bitmap.Config.RGBA_F16) {
            return (i < 26 || config != Bitmap.Config.HARDWARE) ? 0 : 4;
        }
        return 3;
    }

    public static final void a(pl2 pl2Var, jl2 jl2Var, x45 x45Var, r28 r28Var, x12 x12Var, int i) {
        jl2 jl2Var2;
        iy0 iy0Var;
        Context context;
        o28 o28Var;
        boolean z;
        float f;
        Context context2;
        Object obj;
        Object next;
        int i2;
        int i3;
        boolean z2;
        int i4;
        boolean z3;
        boolean z4;
        o28 o28Var2;
        boolean z5;
        boolean z6;
        Object ll2Var;
        l78 l78Var;
        pl2 pl2Var2 = pl2Var;
        ar0 ar0Var = z46.d;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(1714733945);
        int i5 = i | (p65Var.f(pl2Var2) ? 4 : 2) | (p65Var.f(jl2Var) ? 32 : 16) | (p65Var.h(x45Var) ? 256 : 128);
        if (p65Var.P(i5 & 1, (i5 & 1171) != 1170)) {
            boolean z7 = pl2Var2 instanceof nl2;
            iy0 iy0Var2 = iy0.a;
            o28 o28Var3 = o28.b;
            if (z7) {
                p65Var.Y(-1408111383);
                r28 r28VarB = r28Var.b(jfc.c);
                zk7 zk7VarC = dy0.c(ar0Var, false);
                long j = p65Var.T;
                int i6 = (int) (j ^ (j >>> 32));
                i89 i89VarL = p65Var.l();
                r28 r28VarR = gx1.R(p65Var, r28VarB);
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
                tp7.B(p65Var, q12.g, Integer.valueOf(i6));
                tp7.y(p65Var, q12.h);
                tp7.B(p65Var, q12.d, r28VarR);
                xz5.o(iy0Var2.a(o28Var3, z46.h), null, 0.0f, 0L, 0L, 0, p65Var, 0, ReconyxHyperFire2MakernoteDirectory.TAG_SERIAL_NUMBER);
                p65Var = p65Var;
                p65Var.p(true);
                p65Var.p(false);
                jl2Var2 = jl2Var;
            } else {
                if (!(pl2Var2 instanceof ol2)) {
                    throw ho2.L(p65Var, -1408107243, false);
                }
                p65Var.Y(-701421117);
                Context context3 = (Context) p65Var.j(eo.b);
                PackageManager packageManager = context3.getPackageManager();
                rh4 rh4Var = jfc.c;
                r28 r28VarB2 = r28Var.b(rh4Var);
                zk7 zk7VarC2 = dy0.c(ar0Var, false);
                long j2 = p65Var.T;
                int i7 = (int) (j2 ^ (j2 >>> 32));
                i89 i89VarL2 = p65Var.l();
                r28 r28VarR2 = gx1.R(p65Var, r28VarB2);
                r12.W.getClass();
                ot2 ot2Var2 = q12.b;
                p65Var.c0();
                if (p65Var.S) {
                    p65Var.k(ot2Var2);
                } else {
                    p65Var.m0();
                }
                cu cuVar = q12.f;
                tp7.B(p65Var, cuVar, zk7VarC2);
                cu cuVar2 = q12.e;
                tp7.B(p65Var, cuVar2, i89VarL2);
                Integer numValueOf = Integer.valueOf(i7);
                cu cuVar3 = q12.g;
                tp7.B(p65Var, cuVar3, numValueOf);
                fn fnVar = q12.h;
                tp7.y(p65Var, fnVar);
                cu cuVar4 = q12.d;
                tp7.B(p65Var, cuVar4, r28VarR2);
                r28 r28VarD = w2g.D(wgf.R(r28Var.b(rh4Var), wgf.K(p65Var), false, 14), 24.0f, 32.0f);
                wv1 wv1VarA = uv1.a(qb8.c, z46.p, p65Var, 0);
                long j3 = p65Var.T;
                int i8 = (int) (j3 ^ (j3 >>> 32));
                i89 i89VarL3 = p65Var.l();
                r28 r28VarR3 = gx1.R(p65Var, r28VarD);
                p65Var.c0();
                if (p65Var.S) {
                    p65Var.k(ot2Var2);
                } else {
                    p65Var.m0();
                }
                tp7.B(p65Var, cuVar, wv1VarA);
                tp7.B(p65Var, cuVar2, i89VarL3);
                ka1.z(i8, p65Var, cuVar3, p65Var, fnVar);
                tp7.B(p65Var, cuVar4, r28VarR3);
                ol2 ol2Var = (ol2) pl2Var2;
                Set set = ol2Var.a;
                boolean z8 = ol2Var.c;
                boolean z9 = ol2Var.b;
                if (z9 || z8) {
                    iy0Var = iy0Var2;
                    context = context3;
                    o28Var = o28Var3;
                    z = false;
                    f = 24.0f;
                    p65Var.Y(1618787980);
                } else {
                    p65Var.Y(1623172310);
                    f = 24.0f;
                    iy0Var = iy0Var2;
                    context = context3;
                    o28Var = o28Var3;
                    jjd.b(vo7.R(p65Var, R.string.custom_app_icon_friend_tier_required), jfc.d(o28Var3, 1.0f), 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, ((bu7) p65Var.j(jt7.c)).m, p65Var, 48, 0, 131068);
                    p65Var = p65Var;
                    hp7.t(p65Var, jfc.e(jfc.d(o28Var, 1.0f), 16.0f));
                    z = false;
                }
                p65Var.p(z);
                boolean zF = p65Var.f(set);
                Object objM = p65Var.M();
                uob uobVar = w12.a;
                if (zF || objM == uobVar) {
                    Set set2 = set;
                    Iterator it2 = set2.iterator();
                    while (true) {
                        if (!it2.hasNext()) {
                            context2 = context;
                            obj = null;
                            next = null;
                            break;
                        } else {
                            next = it2.next();
                            obj = null;
                            context2 = context;
                            if (packageManager.getComponentEnabledSetting(new ComponentName(context2, ((ml2) next).a)) == 1) {
                                break;
                            } else {
                                context = context2;
                            }
                        }
                    }
                    ml2 ml2Var = (ml2) next;
                    if (ml2Var == null) {
                        ml2Var = (ml2) bu1.w0(set2);
                    }
                    objM = qo7.u(ml2Var);
                    p65Var.j0(objM);
                } else {
                    context2 = context;
                    obj = null;
                }
                l78 l78Var2 = (l78) objM;
                Object objM2 = p65Var.M();
                if (objM2 == uobVar) {
                    objM2 = qo7.u(obj);
                    p65Var.j0(objM2);
                }
                l78 l78Var3 = (l78) objM2;
                int i9 = i5 & 14;
                boolean z10 = i9 == 4;
                int i10 = i5 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION;
                boolean z11 = z10 | (i10 == 32);
                Object objM3 = p65Var.M();
                if (z11 || objM3 == uobVar) {
                    objM3 = new o8(pl2Var2, l78Var3, jl2Var, 7);
                    p65Var.j0(objM3);
                }
                x45 x45Var2 = (x45) objM3;
                dr5 dr5Var = new dr5(z46.q);
                h70 h70Var = new h70(16.0f, true, new z10(21));
                h70 h70Var2 = new h70(16.0f, true, new z10(21));
                ((jp7) p65Var.j(kt7.a)).getClass();
                if (jp7.a(p65Var) == ip7.COMPACT) {
                    i2 = i10;
                    i3 = 2;
                } else {
                    i2 = i10;
                    i3 = 4;
                }
                p65 p65Var2 = p65Var;
                int i11 = i2;
                m40.p(dr5Var, h70Var, h70Var2, null, i3, 0, pxf.E(-636110021, new nh(pl2Var2, x45Var2, l78Var2, 19), p65Var), p65Var2, 1573296, 40);
                p65Var = p65Var2;
                if (z9 || !z8) {
                    z2 = false;
                    p65Var.Y(1618787980);
                } else {
                    km4.F(52.0f, 1626667157, p65Var, p65Var, o28Var);
                    z2 = false;
                }
                p65Var.p(z2);
                ml2 ml2Var2 = (ml2) l78Var3.getValue();
                if (ml2Var2 != null) {
                    p65Var.Y(1626916924);
                    wp wpVarF = f(p65Var, ml2Var2.b);
                    boolean zF2 = ((i5 & 896) == 256 ? true : z2) | p65Var.f(ml2Var2) | p65Var.f(l78Var2) | (i9 == 4 ? true : z2) | p65Var.h(packageManager) | p65Var.h(context2);
                    Object objM4 = p65Var.M();
                    if (zF2 || objM4 == uobVar) {
                        i4 = i9;
                        z3 = z2;
                        l78Var = l78Var3;
                        z4 = true;
                        o28Var2 = o28Var;
                        ll2Var = new ll2(l78Var, x45Var, ml2Var2, pl2Var2, packageManager, context2, l78Var2);
                        pl2Var2 = pl2Var2;
                        p65Var.j0(ll2Var);
                    } else {
                        l78Var = l78Var3;
                        i4 = i9;
                        ll2Var = objM4;
                        z4 = true;
                        z3 = z2;
                        o28Var2 = o28Var;
                    }
                    m45 m45Var = (m45) ll2Var;
                    Object objM5 = p65Var.M();
                    if (objM5 == uobVar) {
                        objM5 = new vs(l78Var, 9);
                        p65Var.j0(objM5);
                    }
                    bgf.e(wpVarF, m45Var, (m45) objM5, p65Var, 384);
                } else {
                    i4 = i9;
                    z3 = z2;
                    z4 = true;
                    o28Var2 = o28Var;
                    p65Var.Y(1618787980);
                }
                p65Var.p(z3);
                p65Var.p(z4);
                if (z9 || !z8) {
                    jl2Var2 = jl2Var;
                    z5 = z4;
                    z6 = z3;
                    p65Var.Y(-1459117854);
                } else {
                    p65Var.Y(-1449357411);
                    boolean z12 = (i11 == 32 ? z4 : z3) | (i4 == 4 ? z4 : z3);
                    Object objM6 = p65Var.M();
                    if (z12 || objM6 == uobVar) {
                        jl2Var2 = jl2Var;
                        objM6 = new gf2(jl2Var2, 17, pl2Var2);
                        p65Var.j0(objM6);
                    } else {
                        jl2Var2 = jl2Var;
                    }
                    z6 = z3;
                    z5 = z4;
                    fo7.r((m45) objM6, vo7.R(p65Var, R.string.custom_app_icon_upsell), xn7.M, w2g.G(iy0Var.a(o28Var2, z46.k), 0.0f, 0.0f, 0.0f, f, 7), false, p65Var, 384, 16);
                }
                p65Var.p(z6);
                p65Var.p(z5);
                p65Var.p(z6);
            }
        } else {
            jl2Var2 = jl2Var;
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new swe(i, 25, pl2Var2, jl2Var2, x45Var, r28Var);
        }
    }

    public static final void b(pl2 pl2Var, jl2 jl2Var, x45 x45Var, r28 r28Var, x12 x12Var, int i) {
        int i2;
        p65 p65Var;
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(-1789785712);
        if ((i & 6) == 0) {
            i2 = (p65Var2.f(pl2Var) ? 4 : 2) | i;
        } else {
            i2 = i;
        }
        if ((i & 48) == 0) {
            i2 |= p65Var2.f(jl2Var) ? 32 : 16;
        }
        if ((i & 384) == 0) {
            i2 |= p65Var2.h(x45Var) ? 256 : 128;
        }
        if ((i & 3072) == 0) {
            i2 |= p65Var2.f(r28Var) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024;
        }
        int i3 = 1;
        if (p65Var2.P(i2 & 1, (i2 & 1171) != 1170)) {
            p65Var = p65Var2;
            pr7.b(bgf.N(r28Var, "custom_app_icon_screen").b(jfc.c), pxf.E(712451220, new k6c(29, jl2Var), p65Var2), null, null, null, 0, 0L, 0L, null, pxf.E(279613599, new nh(pl2Var, jl2Var, x45Var, i3), p65Var2), p65Var, 805306416, 508);
        } else {
            p65Var = p65Var2;
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new v8(i, 14, pl2Var, jl2Var, x45Var, r28Var);
        }
    }

    public static final void c(String str, jl2 jl2Var, r28 r28Var, sl2 sl2Var, x12 x12Var, int i) {
        sl2 sl2Var2;
        int i2;
        sl2 sl2Var3;
        str.getClass();
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-1971666915);
        int i3 = i | (p65Var.f(str) ? 4 : 2) | (p65Var.f(jl2Var) ? 32 : 16) | (p65Var.f(r28Var) ? 256 : 128) | 1024;
        if (p65Var.P(i3 & 1, (i3 & 1171) != 1170)) {
            p65Var.U();
            int i4 = i & 1;
            uob uobVar = w12.a;
            if (i4 == 0 || p65Var.z()) {
                boolean z = (i3 & 14) == 4;
                Object objM = p65Var.M();
                if (z || objM == uobVar) {
                    objM = new mb(str, 9);
                    p65Var.j0(objM);
                }
                x45 x45Var = (x45) objM;
                wue wueVarA = e67.a(p65Var);
                if (wueVarA == null) {
                    ygf.f("No ViewModelStoreOwner was provided via LocalViewModelStoreOwner");
                    return;
                } else {
                    i2 = i3 & (-7169);
                    sl2Var3 = (sl2) to7.z(n1b.a.b(sl2.class), wueVarA, t40.E(wueVarA, p65Var), wueVarA instanceof pi5 ? r40.N(((pi5) wueVarA).getDefaultViewModelCreationExtras(), x45Var) : r40.N(og2.b, x45Var), p65Var);
                }
            } else {
                p65Var.S();
                i2 = i3 & (-7169);
                sl2Var3 = sl2Var;
            }
            p65Var.q();
            l78 l78VarZ = guc.z(sl2Var3.h, p65Var, 0);
            pl2 pl2Var = (pl2) l78VarZ.getValue();
            boolean zH = p65Var.h(sl2Var3);
            Object objM2 = p65Var.M();
            if (zH || objM2 == uobVar) {
                k0 k0Var = new k0(1, sl2Var3, sl2.class, "onIconSelected", "onIconSelected(Lcom/medium/proto/event/AppIconName;)V", 0, 7);
                p65Var.j0(k0Var);
                objM2 = k0Var;
            }
            b(pl2Var, jl2Var, (x45) ((qh6) objM2), r28Var, p65Var, (i2 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) | ((i2 << 3) & 7168));
            pl2 pl2Var2 = (pl2) l78VarZ.getValue();
            boolean zF = p65Var.f(l78VarZ) | p65Var.h(sl2Var3);
            Object objM3 = p65Var.M();
            if (zF || objM3 == uobVar) {
                objM3 = new rc0(sl2Var3, l78VarZ, null, 6);
                p65Var.j0(objM3);
            }
            kyd.k(p65Var, (b55) objM3, pl2Var2);
            sl2Var2 = sl2Var3;
        } else {
            p65Var.S();
            sl2Var2 = sl2Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new swe(i, 26, str, jl2Var, r28Var, sl2Var2);
        }
    }

    public static final void d(jl2 jl2Var, r28 r28Var, x12 x12Var, int i) {
        p65 p65Var;
        r28 r28Var2;
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(-268336181);
        int i2 = (p65Var2.f(jl2Var) ? 4 : 2) | i | 48;
        if (p65Var2.P(i2 & 1, (i2 & 19) != 18)) {
            String strR = vo7.R(p65Var2, R.string.custom_app_icon_title);
            boolean z = (i2 & 14) == 4;
            Object objM = p65Var2.M();
            if (z || objM == w12.a) {
                objM = new gu1(0, jl2Var, jl2.class, "onBackPressed", "onBackPressed()V", 0, 6);
                p65Var2.j0(objM);
            }
            p65Var = p65Var2;
            r28Var2 = o28.b;
            qk7.g(r28Var2, strR, (m45) ((qh6) objM), null, null, null, 0L, 0L, null, p65Var, 6, 504);
        } else {
            p65Var = p65Var2;
            p65Var.S();
            r28Var2 = r28Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new ag1(jl2Var, r28Var2, i, 7);
        }
    }

    public static final void e(ml2 ml2Var, boolean z, boolean z2, x45 x45Var, r28 r28Var, x12 x12Var, int i) {
        p65 p65Var;
        char c2;
        long j;
        long j2;
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(425247917);
        int i2 = i | (p65Var2.f(ml2Var) ? 4 : 2) | (p65Var2.g(z) ? 32 : 16) | (p65Var2.g(z2) ? 256 : 128) | (p65Var2.h(x45Var) ? 2048 : 1024) | (p65Var2.f(r28Var) ? OlympusMakernoteDirectory.TAG_MAIN_INFO : 8192);
        if (p65Var2.P(i2 & 1, (i2 & 9363) != 9362)) {
            amb ambVarA = bmb.a(4.0f);
            r28 r28VarY = r40.y(jfc.f(r28Var, 122.0f, 0.0f, 2), ambVarA);
            if (z) {
                p65Var2.Y(641369731);
                c2 = ' ';
                j = rz5.A(p65Var2).y;
            } else {
                c2 = ' ';
                p65Var2.Y(641371266);
                j = rz5.A(p65Var2).z;
            }
            p65Var2.p(false);
            r28 r28VarB = bo.B(r28VarY, 1.0f, j, ambVarA);
            boolean z3 = ((i2 & 14) == 4) | ((i2 & 7168) == 2048);
            Object objM = p65Var2.M();
            if (z3 || objM == w12.a) {
                objM = new gf2(x45Var, 18, ml2Var);
                p65Var2.j0(objM);
            }
            r28 r28VarC = w2g.C(hlg.r(r28VarB, z2, null, null, (m45) objM, 14), 16.0f);
            wv1 wv1VarA = uv1.a(qb8.e, z46.q, p65Var2, 54);
            long j3 = p65Var2.T;
            int i3 = (int) (j3 ^ (j3 >>> c2));
            i89 i89VarL = p65Var2.l();
            r28 r28VarR = gx1.R(p65Var2, r28VarC);
            r12.W.getClass();
            ot2 ot2Var = q12.b;
            p65Var2.c0();
            if (p65Var2.S) {
                p65Var2.k(ot2Var);
            } else {
                p65Var2.m0();
            }
            tp7.B(p65Var2, q12.f, wv1VarA);
            tp7.B(p65Var2, q12.e, i89VarL);
            tp7.B(p65Var2, q12.g, Integer.valueOf(i3));
            tp7.y(p65Var2, q12.h);
            tp7.B(p65Var2, q12.d, r28VarR);
            wp wpVarF = f(p65Var2, ml2Var.b);
            if (wpVarF == null) {
                p65Var2.Y(-422256556);
                p65Var2.p(false);
            } else {
                p65Var2.Y(-422256555);
                o28 o28Var = o28.b;
                w2g.f(wpVarF, w2g.i(jfc.l(o28Var, 48.0f), z2 ? 1.0f : 0.5f), p65Var2, 248);
                lv8.y(o28Var, 8.0f, p65Var2, false);
            }
            String strR = vo7.R(p65Var2, ml2Var.c);
            mkd mkdVar = rz5.D(p65Var2).m;
            if (z2) {
                p65Var2.Y(263488399);
                j2 = rz5.A(p65Var2).n;
            } else {
                p65Var2.Y(263490001);
                j2 = rz5.A(p65Var2).o;
            }
            p65Var2.p(false);
            jjd.b(strR, null, 0L, 0L, 0L, null, new jgd(3), 0L, 0, false, 0, 0, null, mkd.a(mkdVar, j2, 0L, null, null, null, 0L, 0L, null, 0, 0L, null, null, 16777214), p65Var2, 0, 0, 130046);
            p65Var = p65Var2;
            p65Var.p(true);
        } else {
            p65Var = p65Var2;
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new al1(ml2Var, z, z2, x45Var, r28Var, i, 1);
        }
    }

    public static final wp f(x12 x12Var, int i) {
        sn3 sn3Var = eo.b;
        p65 p65Var = (p65) x12Var;
        Resources resources = ((Context) p65Var.j(sn3Var)).getResources();
        Resources.Theme theme = ((Context) p65Var.j(sn3Var)).getTheme();
        ThreadLocal threadLocal = wcb.a;
        Drawable drawable = resources.getDrawable(i, theme);
        if (Build.VERSION.SDK_INT >= 26 && (drawable instanceof AdaptiveIconDrawable)) {
            return new wp(w2g.N(drawable));
        }
        if (!(drawable instanceof BitmapDrawable)) {
            return null;
        }
        Bitmap bitmap = ((BitmapDrawable) drawable).getBitmap();
        bitmap.getClass();
        return new wp(bitmap);
    }

    public static final Bitmap g(wp wpVar) {
        if (wpVar instanceof wp) {
            return wpVar.a;
        }
        ik4.k("Unable to obtain android.graphics.Bitmap");
        return null;
    }

    public static Notification.Builder h(Context context, String str) {
        return new Notification.Builder(context, str);
    }

    public static Icon i(Bitmap bitmap) {
        return Icon.createWithAdaptiveBitmap(bitmap);
    }

    public static final int j(Bitmap bitmap) {
        if (!bitmap.isRecycled()) {
            try {
                return bitmap.getAllocationByteCount();
            } catch (Exception unused) {
                int height = bitmap.getHeight() * bitmap.getWidth();
                Bitmap.Config config = bitmap.getConfig();
                return height * (config == Bitmap.Config.ALPHA_8 ? 1 : (config == Bitmap.Config.RGB_565 || config == Bitmap.Config.ARGB_4444) ? 2 : (Build.VERSION.SDK_INT < 26 || config != Bitmap.Config.RGBA_F16) ? 4 : 8);
            }
        }
        StringBuilder sb = new StringBuilder("Cannot obtain size for recycled bitmap: ");
        sb.append(bitmap);
        int width = bitmap.getWidth();
        int height2 = bitmap.getHeight();
        Bitmap.Config config2 = bitmap.getConfig();
        sb.append(" [");
        sb.append(width);
        sb.append(" x ");
        sb.append(height2);
        sb.append("] + ");
        sb.append(config2);
        throw new IllegalStateException(sb.toString().toString());
    }

    public static float k(ViewConfiguration viewConfiguration) {
        return viewConfiguration.getScaledHorizontalScrollFactor();
    }

    public static float l(ViewConfiguration viewConfiguration) {
        return viewConfiguration.getScaledVerticalScrollFactor();
    }

    public static Object m(Class cls, Object obj, Method method, Object[] objArr) throws NoSuchMethodException {
        Constructor declaredConstructor = c;
        if (declaredConstructor == null) {
            declaredConstructor = MethodHandles.Lookup.class.getDeclaredConstructor(Class.class, Integer.TYPE);
            declaredConstructor.setAccessible(true);
            c = declaredConstructor;
        }
        return ((MethodHandles.Lookup) declaredConstructor.newInstance(cls, -1)).unreflectSpecial(method, cls).bindTo(obj).invokeWithArguments(objArr);
    }

    public static final boolean n(Bitmap.Config config) {
        return Build.VERSION.SDK_INT >= 26 && config == Bitmap.Config.HARDWARE;
    }

    public static synchronized boolean o(Context context) {
        Boolean boolValueOf;
        Boolean bool;
        Context applicationContext = context.getApplicationContext();
        Context context2 = a;
        if (context2 != null && (bool = b) != null && context2 == applicationContext) {
            return bool.booleanValue();
        }
        b = null;
        if (gq7.D()) {
            boolValueOf = Boolean.valueOf(applicationContext.getPackageManager().isInstantApp());
            b = boolValueOf;
        } else {
            try {
                context.getClassLoader().loadClass("com.google.android.instantapps.supervisor.InstantAppsRuntime");
                boolValueOf = Boolean.TRUE;
                b = boolValueOf;
            } catch (ClassNotFoundException unused) {
                boolValueOf = Boolean.FALSE;
                b = boolValueOf;
            }
        }
        a = applicationContext;
        return boolValueOf.booleanValue();
    }

    public static boolean p(File file, File file2) {
        try {
            Files.move(file.toPath(), file2.toPath(), StandardCopyOption.REPLACE_EXISTING);
            return true;
        } catch (IOException unused) {
            return false;
        }
    }

    public static void q(mn mnVar) {
        ViewParent parent = mnVar.getParent();
        if (parent != null) {
            parent.onDescendantInvalidated(mnVar, mnVar);
        }
    }

    public static Intent r(Context context, BroadcastReceiver broadcastReceiver, IntentFilter intentFilter, String str, int i) {
        return ((i & 4) == 0 || str != null) ? context.registerReceiver(broadcastReceiver, intentFilter, str, null, 0) : context.registerReceiver(broadcastReceiver, intentFilter, nm.v(context), null);
    }

    public static void s(Context context, TextClassification textClassification) throws PendingIntent.CanceledException {
        String text = textClassification.getText();
        PendingIntent activity = PendingIntent.getActivity(context, text != null ? text.hashCode() : 0, textClassification.getIntent(), 201326592);
        if (Build.VERSION.SDK_INT >= 34) {
            m4.C(activity);
        } else {
            activity.send();
        }
    }

    public static void t(Notification.Builder builder) {
        builder.setBadgeIconType(0);
    }

    public static void u(Notification.Builder builder) {
        builder.setGroupAlertBehavior(0);
    }

    public static void v(Notification.Builder builder) {
        builder.setSettingsText(null);
    }

    public static void w(Notification.Builder builder) {
        builder.setShortcutId(null);
    }

    public static void x(Notification.Builder builder) {
        builder.setTimeoutAfter(0L);
    }

    public static void y(Context context, Intent intent) {
        context.startForegroundService(intent);
    }

    public static final Bitmap.Config z(int i) {
        if (i == 0) {
            return Bitmap.Config.ARGB_8888;
        }
        if (i == 1) {
            return Bitmap.Config.ALPHA_8;
        }
        if (i == 2) {
            return Bitmap.Config.RGB_565;
        }
        int i2 = Build.VERSION.SDK_INT;
        return (i2 < 26 || i != 3) ? (i2 < 26 || i != 4) ? Bitmap.Config.ARGB_8888 : Bitmap.Config.HARDWARE : Bitmap.Config.RGBA_F16;
    }
}
