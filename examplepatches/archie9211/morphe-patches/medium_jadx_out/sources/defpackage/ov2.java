package defpackage;

import android.content.Context;
import android.content.res.Resources;
import com.drew.metadata.iptc.IptcDirectory;
import com.medium.android.data.preferences.DarkMode;
import com.medium.android.data.settings.Frequency;
import com.medium.reader.R;
import gen.model.SourceParameter;
import java.text.SimpleDateFormat;
import java.util.Iterator;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final /* synthetic */ class ov2 implements c55 {
    public final /* synthetic */ int a;
    public final /* synthetic */ Object b;
    public final /* synthetic */ Object c;
    public final /* synthetic */ Object d;
    public final /* synthetic */ Object e;

    public /* synthetic */ ov2(r28 r28Var, b55 b55Var, ip7 ip7Var, String str) {
        this.a = 23;
        this.b = r28Var;
        this.d = b55Var;
        this.c = ip7Var;
        this.e = str;
    }

    private final Object a(Object obj, Object obj2, Object obj3) {
        bt4 bt4Var;
        int i;
        o28 o28Var;
        int i2;
        boolean z;
        o28 o28Var2;
        boolean z2;
        o28 o28Var3;
        boolean z3;
        boolean z4;
        boolean z5;
        int i3;
        boolean z6;
        boolean z7;
        d88 d88Var;
        mq9 mq9Var = (mq9) this.b;
        iq9 iq9Var = (iq9) this.c;
        String str = (String) this.d;
        l78 l78Var = (l78) this.e;
        x12 x12Var = (x12) obj2;
        int iIntValue = ((Integer) obj3).intValue();
        ((xv1) obj).getClass();
        p65 p65Var = (p65) x12Var;
        if (p65Var.P(iIntValue & 1, (iIntValue & 17) != 16)) {
            bo4 bo4Var = mq9Var.f;
            d88 d88Var2 = mq9Var.k;
            d88 d88Var3 = mq9Var.j;
            bt4 bt4Var2 = mq9Var.i;
            l78 l78VarX = guc.x(bo4Var, null, p65Var, 48);
            z54 z54Var = (z54) l78VarX.getValue();
            int i4 = z54Var == null ? -1 : hq9.a[z54Var.ordinal()];
            uob uobVar = w12.a;
            if (i4 == -1) {
                bt4Var = bt4Var2;
                i = 2;
                p65Var.Y(-1945875429);
                mz1 mz1Var = pxf.h;
                Object objM = p65Var.M();
                if (objM == uobVar) {
                    objM = new lg9(4);
                    p65Var.j0(objM);
                }
                oq.b(mz1Var, (m45) objM, null, null, null, false, null, w2g.g(2, 12.0f), p65Var, 12779574, 348);
                p65Var = p65Var;
                p65Var.p(false);
            } else if (i4 == 1) {
                bt4Var = bt4Var2;
                i = 2;
                p65Var.Y(-1945838569);
                mz1 mz1Var2 = pxf.i;
                boolean zF = p65Var.f(iq9Var) | p65Var.f(mq9Var);
                Object objM2 = p65Var.M();
                if (zF || objM2 == uobVar) {
                    objM2 = new gq9(iq9Var, mq9Var, l78Var, 9);
                    p65Var.j0(objM2);
                }
                oq.b(mz1Var2, (m45) objM2, null, null, null, false, null, w2g.g(2, 12.0f), p65Var, 12582918, 380);
                p65Var = p65Var;
                p65Var.p(false);
            } else if (i4 == 2 || i4 == 3) {
                p65Var.Y(-1945797209);
                mz1 mz1Var3 = pxf.j;
                boolean zF2 = p65Var.f(iq9Var) | p65Var.f(mq9Var);
                Object objM3 = p65Var.M();
                if (zF2 || objM3 == uobVar) {
                    objM3 = new gq9(iq9Var, mq9Var, l78Var, 11);
                    p65Var.j0(objM3);
                }
                bt4Var = bt4Var2;
                i = 2;
                oq.b(mz1Var3, (m45) objM3, null, null, null, false, null, w2g.g(2, 12.0f), p65Var, 12582918, 380);
                p65Var = p65Var;
                p65Var.p(false);
            } else {
                if (i4 == 4) {
                    p65Var.Y(-1945759817);
                    p65Var.p(false);
                } else {
                    if (i4 != 5) {
                        throw ho2.L(p65Var, -1945874453, false);
                    }
                    p65Var.Y(-1945758217);
                    p65Var.p(false);
                }
                bt4Var = bt4Var2;
                i = 2;
            }
            z54 z54Var2 = (z54) l78VarX.getValue();
            o28 o28Var4 = o28.b;
            if (z54Var2 == null || ((z54) l78VarX.getValue()) == z54.SHOWING_MORE || ((z54) l78VarX.getValue()) == z54.SHOWING_LESS || ((z54) l78VarX.getValue()) == z54.NOT_SHOWING_MORE_OR_LESS) {
                p65Var.Y(-188647063);
                o28Var = o28Var4;
                i2 = -197864913;
                tp7.c(0.0f, 6, 6, 0L, p65Var, w2g.G(o28Var4, 0.0f, 8.0f, 0.0f, 8.0f, 5));
                p65Var.p(false);
            } else {
                p65Var.Y(-197864913);
                p65Var.p(false);
                i2 = -197864913;
                o28Var = o28Var4;
            }
            if (mq9Var.h) {
                p65Var.Y(-188497023);
                mz1 mz1Var4 = pxf.k;
                boolean zF3 = p65Var.f(iq9Var) | p65Var.f(mq9Var);
                Object objM4 = p65Var.M();
                if (zF3 || objM4 == uobVar) {
                    objM4 = new gq9(iq9Var, mq9Var, l78Var, 12);
                    p65Var.j0(objM4);
                }
                p65 p65Var2 = p65Var;
                oq.b(mz1Var4, (m45) objM4, null, null, null, false, null, w2g.g(i, 12.0f), p65Var2, 12582918, 380);
                p65Var = p65Var2;
                z = false;
            } else {
                z = false;
                p65Var.Y(i2);
            }
            p65Var.p(z);
            mz1 mz1Var5 = pxf.l;
            boolean zF4 = p65Var.f(iq9Var) | p65Var.f(mq9Var);
            Object objM5 = p65Var.M();
            if (zF4 || objM5 == uobVar) {
                objM5 = new gq9(iq9Var, mq9Var, l78Var, 13);
                p65Var.j0(objM5);
            }
            p65 p65Var3 = p65Var;
            oq.b(mz1Var5, (m45) objM5, null, null, null, false, null, w2g.g(i, 12.0f), p65Var3, 12582918, 380);
            p65 p65Var4 = p65Var3;
            l78 l78VarX2 = guc.x(mq9Var.r, zf9.a, p65Var4, 0);
            if ((((dg9) l78VarX2.getValue()) instanceof bg9) || (((dg9) l78VarX2.getValue()) instanceof cg9)) {
                p65Var4.Y(-187394167);
                o28 o28Var5 = o28Var;
                o28Var2 = o28Var5;
                tp7.c(0.0f, 6, 6, 0L, p65Var4, w2g.G(o28Var5, 0.0f, 8.0f, 0.0f, 8.0f, 5));
                p65Var4.p(false);
            } else {
                p65Var4.Y(i2);
                p65Var4.p(false);
                o28Var2 = o28Var;
            }
            dg9 dg9Var = (dg9) l78VarX2.getValue();
            if ((dg9Var instanceof zf9) || (dg9Var instanceof ag9)) {
                z2 = false;
                p65Var4.Y(-1945698921);
                p65Var4.p(false);
            } else if (dg9Var instanceof bg9) {
                p65Var4.Y(-1945696229);
                mz1 mz1VarE = pxf.E(217126091, new yj9((bg9) dg9Var, 1), p65Var4);
                boolean zF5 = p65Var4.f(iq9Var) | p65Var4.f(mq9Var);
                Object objM6 = p65Var4.M();
                if (zF5 || objM6 == uobVar) {
                    objM6 = new gq9(iq9Var, mq9Var, l78Var, 14);
                    p65Var4.j0(objM6);
                }
                oq.b(mz1VarE, (m45) objM6, bgf.N(o28Var2, "stop_featuring_story"), null, null, false, null, w2g.g(i, 12.0f), p65Var4, 12583302, IptcDirectory.TAG_ARM_IDENTIFIER);
                p65Var4 = p65Var4;
                z2 = false;
                p65Var4.p(false);
            } else {
                if (!(dg9Var instanceof cg9)) {
                    throw ho2.L(p65Var4, -1945701936, false);
                }
                p65Var4.Y(-1945665556);
                mz1 mz1VarE2 = pxf.E(103515596, new zj9((cg9) dg9Var, 1), p65Var4);
                boolean zF6 = p65Var4.f(iq9Var) | p65Var4.f(mq9Var);
                Object objM7 = p65Var4.M();
                if (zF6 || objM7 == uobVar) {
                    objM7 = new gq9(iq9Var, mq9Var, l78Var, 15);
                    p65Var4.j0(objM7);
                }
                oq.b(mz1VarE2, (m45) objM7, bgf.N(o28Var2, "feature_this_story"), null, null, false, null, w2g.g(i, 12.0f), p65Var4, 12583302, IptcDirectory.TAG_ARM_IDENTIFIER);
                p65Var4 = p65Var4;
                z2 = false;
                p65Var4.p(false);
            }
            if (bt4Var == bt4.FOLLOWING || bt4Var == bt4.NOT_FOLLOWING) {
                p65Var4.Y(-185055031);
                o28 o28Var6 = o28Var2;
                o28Var3 = o28Var6;
                tp7.c(0.0f, 6, 6, 0L, p65Var4, w2g.G(o28Var6, 0.0f, 8.0f, 0.0f, 8.0f, 5));
                z2 = false;
                p65Var4.p(false);
            } else {
                p65Var4.Y(-197864913);
                p65Var4.p(z2);
                o28Var3 = o28Var2;
            }
            int i5 = hq9.b[bt4Var.ordinal()];
            if (i5 == 1) {
                p65Var4.Y(-1945625377);
                mz1 mz1Var6 = pxf.m;
                boolean zF7 = p65Var4.f(iq9Var) | p65Var4.f(mq9Var);
                Object objM8 = p65Var4.M();
                if (zF7 || objM8 == uobVar) {
                    objM8 = new gq9(iq9Var, mq9Var, l78Var, 16);
                    p65Var4.j0(objM8);
                }
                p65 p65Var5 = p65Var4;
                oq.b(mz1Var6, (m45) objM8, null, null, null, false, null, w2g.g(i, 12.0f), p65Var5, 12582918, 380);
                p65Var4 = p65Var5;
                z2 = false;
                p65Var4.p(false);
            } else if (i5 == i) {
                p65Var4.Y(-1945604037);
                mz1 mz1Var7 = pxf.n;
                boolean zF8 = p65Var4.f(iq9Var) | p65Var4.f(mq9Var);
                Object objM9 = p65Var4.M();
                if (zF8 || objM9 == uobVar) {
                    objM9 = new gq9(iq9Var, mq9Var, l78Var, 0);
                    p65Var4.j0(objM9);
                }
                p65 p65Var6 = p65Var4;
                oq.b(mz1Var7, (m45) objM9, null, null, null, false, null, w2g.g(i, 12.0f), p65Var6, 12582918, 380);
                p65Var4 = p65Var6;
                z2 = false;
                p65Var4.p(false);
            } else if (i5 == 3) {
                p65Var4.Y(-1945583497);
                p65Var4.p(z2);
            } else {
                if (i5 != 4) {
                    throw ho2.L(p65Var4, -1945627089, z2);
                }
                p65Var4.Y(-1945582153);
                p65Var4.p(z2);
            }
            d88 d88Var4 = d88.MUTED;
            if (d88Var3 == d88Var4 || d88Var3 == (d88Var = d88.NOT_MUTED) || d88Var2 == d88Var4 || d88Var2 == d88Var) {
                p65Var4.Y(-183208919);
                o28 o28Var7 = o28Var3;
                o28Var3 = o28Var7;
                tp7.c(0.0f, 6, 6, 0L, p65Var4, w2g.G(o28Var7, 0.0f, 8.0f, 0.0f, 8.0f, 5));
                z2 = false;
            } else {
                p65Var4.Y(-197864913);
            }
            p65Var4.p(z2);
            int[] iArr = hq9.c;
            int i6 = iArr[d88Var3.ordinal()];
            if (i6 == 1) {
                p65Var4.Y(-1945566274);
                mz1 mz1Var8 = pxf.o;
                boolean zF9 = p65Var4.f(mq9Var) | p65Var4.f(iq9Var);
                Object objM10 = p65Var4.M();
                if (zF9 || objM10 == uobVar) {
                    objM10 = new gq9(mq9Var, iq9Var, l78Var, 1);
                    p65Var4.j0(objM10);
                }
                p65 p65Var7 = p65Var4;
                oq.b(mz1Var8, (m45) objM10, null, null, null, false, null, w2g.g(i, 12.0f), p65Var7, 12582918, 380);
                p65Var4 = p65Var7;
                z2 = false;
                p65Var4.p(false);
            } else if (i6 == i) {
                p65Var4.Y(-1945547206);
                mz1 mz1Var9 = pxf.p;
                boolean zF10 = p65Var4.f(mq9Var) | p65Var4.f(iq9Var);
                Object objM11 = p65Var4.M();
                if (zF10 || objM11 == uobVar) {
                    objM11 = new gq9(mq9Var, iq9Var, l78Var, i);
                    p65Var4.j0(objM11);
                }
                p65 p65Var8 = p65Var4;
                oq.b(mz1Var9, (m45) objM11, null, null, null, false, null, w2g.g(i, 12.0f), p65Var8, 12582918, 380);
                p65Var4 = p65Var8;
                z2 = false;
                p65Var4.p(false);
            } else if (i6 == 3) {
                p65Var4.Y(-1945528809);
                p65Var4.p(z2);
            } else {
                if (i6 != 4) {
                    throw ho2.L(p65Var4, -1945567691, z2);
                }
                p65Var4.Y(-1945527529);
                p65Var4.p(z2);
            }
            int i7 = iArr[d88Var2.ordinal()];
            if (i7 == 1) {
                p65Var4.Y(-1945523539);
                mz1 mz1Var10 = pxf.q;
                boolean zF11 = p65Var4.f(mq9Var) | p65Var4.f(iq9Var);
                Object objM12 = p65Var4.M();
                if (zF11 || objM12 == uobVar) {
                    objM12 = new gq9(mq9Var, iq9Var, l78Var, 3);
                    p65Var4.j0(objM12);
                }
                p65 p65Var9 = p65Var4;
                oq.b(mz1Var10, (m45) objM12, null, null, null, false, null, w2g.g(i, 12.0f), p65Var9, 12582918, 380);
                p65Var4 = p65Var9;
                p65Var4.p(false);
            } else if (i7 == i) {
                p65Var4.Y(-1945500919);
                mz1 mz1Var11 = pxf.r;
                boolean zF12 = p65Var4.f(mq9Var) | p65Var4.f(iq9Var);
                Object objM13 = p65Var4.M();
                if (zF12 || objM13 == uobVar) {
                    objM13 = new gq9(mq9Var, iq9Var, l78Var, 4);
                    p65Var4.j0(objM13);
                }
                p65 p65Var10 = p65Var4;
                oq.b(mz1Var11, (m45) objM13, null, null, null, false, null, w2g.g(i, 12.0f), p65Var10, 12582918, 380);
                p65Var4 = p65Var10;
                p65Var4.p(false);
            } else if (i7 == 3) {
                p65Var4.Y(-1945479081);
                p65Var4.p(z2);
            } else {
                if (i7 != 4) {
                    throw ho2.L(p65Var4, -1945524969, z2);
                }
                p65Var4.Y(-1945477801);
                p65Var4.p(z2);
            }
            tp7.c(0.0f, 6, 6, 0L, p65Var4, w2g.G(o28Var3, 0.0f, 8.0f, 0.0f, 8.0f, 5));
            if (mq9Var.l) {
                p65Var4.Y(-180109694);
                mz1 mz1Var12 = pxf.s;
                boolean zF13 = p65Var4.f(iq9Var) | p65Var4.f(mq9Var);
                Object objM14 = p65Var4.M();
                if (zF13 || objM14 == uobVar) {
                    objM14 = new gq9(iq9Var, mq9Var, l78Var, 5);
                    p65Var4.j0(objM14);
                }
                p65 p65Var11 = p65Var4;
                oq.b(mz1Var12, (m45) objM14, null, null, null, false, null, w2g.g(i, 12.0f), p65Var11, 12582918, 380);
                p65Var4 = p65Var11;
                z3 = false;
            } else {
                z3 = false;
                p65Var4.Y(-197864913);
            }
            p65Var4.p(z3);
            p99 p99Var = mq9Var.m;
            if ((p99Var instanceof o99) && ((o99) p99Var).a) {
                p65Var4.Y(-1945450272);
                mz1 mz1Var13 = pxf.t;
                boolean zF14 = p65Var4.f(iq9Var) | p65Var4.f(mq9Var);
                Object objM15 = p65Var4.M();
                if (zF14 || objM15 == uobVar) {
                    objM15 = new gq9(iq9Var, mq9Var, l78Var, 6);
                    p65Var4.j0(objM15);
                }
                p65 p65Var12 = p65Var4;
                oq.b(mz1Var13, (m45) objM15, null, null, null, false, null, w2g.g(i, 12.0f), p65Var12, 12582918, 380);
                p65Var4 = p65Var12;
                p65Var4.p(false);
            } else {
                if ((p99Var instanceof n99) && ((n99) p99Var).a) {
                    p65Var4.Y(-1945431460);
                    mz1 mz1Var14 = pxf.u;
                    boolean zF15 = p65Var4.f(iq9Var) | p65Var4.f(mq9Var);
                    Object objM16 = p65Var4.M();
                    if (zF15 || objM16 == uobVar) {
                        objM16 = new gq9(iq9Var, mq9Var, l78Var, 7);
                        p65Var4.j0(objM16);
                    }
                    p65 p65Var13 = p65Var4;
                    oq.b(mz1Var14, (m45) objM16, null, null, null, false, null, w2g.g(i, 12.0f), p65Var13, 12582918, 380);
                    p65Var4 = p65Var13;
                    z4 = false;
                } else {
                    z4 = false;
                    p65Var4.Y(-197864913);
                }
                p65Var4.p(z4);
            }
            if (mq9Var.n) {
                p65Var4.Y(-178297186);
                mz1 mz1Var15 = pxf.v;
                boolean zF16 = p65Var4.f(iq9Var) | p65Var4.f(mq9Var);
                Object objM17 = p65Var4.M();
                if (zF16 || objM17 == uobVar) {
                    objM17 = new gq9(iq9Var, mq9Var, l78Var, 8);
                    p65Var4.j0(objM17);
                }
                p65 p65Var14 = p65Var4;
                oq.b(mz1Var15, (m45) objM17, null, null, null, false, null, w2g.g(i, 12.0f), p65Var14, 12582918, 380);
                p65Var4 = p65Var14;
                z5 = false;
            } else {
                z5 = false;
                p65Var4.Y(-197864913);
            }
            p65Var4.p(z5);
            if (mq9Var.o) {
                p65Var4.Y(-177827474);
                mz1 mz1Var16 = pxf.w;
                boolean zF17 = p65Var4.f(iq9Var) | p65Var4.f(mq9Var) | p65Var4.f(str);
                Object objM18 = p65Var4.M();
                if (zF17 || objM18 == uobVar) {
                    i3 = i;
                    hu0 hu0Var = new hu0(iq9Var, mq9Var, str, l78Var, 8);
                    p65Var4.j0(hu0Var);
                    objM18 = hu0Var;
                } else {
                    i3 = i;
                }
                p65 p65Var15 = p65Var4;
                oq.b(mz1Var16, (m45) objM18, null, null, null, false, null, w2g.g(i3, 12.0f), p65Var15, 12582918, 380);
                p65Var4 = p65Var15;
                z6 = false;
            } else {
                i3 = i;
                z6 = false;
                p65Var4.Y(-197864913);
            }
            p65Var4.p(z6);
            if (mq9Var.p) {
                p65Var4.Y(-177376641);
                mz1 mz1Var17 = pxf.x;
                boolean zF18 = p65Var4.f(iq9Var) | p65Var4.f(mq9Var);
                Object objM19 = p65Var4.M();
                if (zF18 || objM19 == uobVar) {
                    objM19 = new gq9(iq9Var, mq9Var, l78Var, 10);
                    p65Var4.j0(objM19);
                }
                p65 p65Var16 = p65Var4;
                oq.b(mz1Var17, (m45) objM19, null, null, null, false, null, w2g.g(i3, 12.0f), p65Var16, 12582918, 380);
                p65Var4 = p65Var16;
                z7 = false;
            } else {
                z7 = false;
                p65Var4.Y(-197864913);
            }
            p65Var4.p(z7);
        } else {
            p65Var.S();
        }
        return c1e.a;
    }

    private final Object d(Object obj, Object obj2, Object obj3) {
        Integer num = (Integer) this.b;
        nba nbaVar = (nba) this.c;
        List list = (List) this.d;
        l78 l78Var = (l78) this.e;
        x12 x12Var = (x12) obj2;
        int iIntValue = ((Integer) obj3).intValue();
        ((xv1) obj).getClass();
        p65 p65Var = (p65) x12Var;
        if (p65Var.P(iIntValue & 1, (iIntValue & 17) != 16)) {
            bq7 bq7Var = new bq7(vo7.R(p65Var, R.string.publication_archive_all_years), num == null, null, null, 28);
            boolean zF = p65Var.f(nbaVar);
            Object objM = p65Var.M();
            uob uobVar = w12.a;
            if (zF || objM == uobVar) {
                objM = new jba(nbaVar, l78Var, 0);
                p65Var.j0(objM);
            }
            m45 m45Var = (m45) objM;
            o28 o28Var = o28.b;
            aq7.b(bq7Var, m45Var, bgf.N(o28Var, "publication_archive_years_filter_all"), 0L, 0L, p65Var, 0, 24);
            p65 p65Var2 = p65Var;
            if (list.isEmpty()) {
                p65Var2.Y(1841181001);
            } else {
                p65Var2.Y(1867976409);
                tp7.c(0.0f, 0, 7, 0L, p65Var2, null);
            }
            p65Var2.p(false);
            Iterator it2 = list.iterator();
            while (it2.hasNext()) {
                int iIntValue2 = ((Number) it2.next()).intValue();
                bq7 bq7Var2 = new bq7(String.valueOf(iIntValue2), num != null && num.intValue() == iIntValue2, null, null, 28);
                boolean zF2 = p65Var2.f(nbaVar) | p65Var2.d(iIntValue2);
                Object objM2 = p65Var2.M();
                if (zF2 || objM2 == uobVar) {
                    objM2 = new o(nbaVar, iIntValue2, l78Var, 2);
                    p65Var2.j0(objM2);
                }
                p65 p65Var3 = p65Var2;
                aq7.b(bq7Var2, (m45) objM2, bgf.N(o28Var, "publication_archive_years_filter_" + iIntValue2), 0L, 0L, p65Var3, 0, 24);
                p65Var2 = p65Var3;
            }
        } else {
            p65Var.S();
        }
        return c1e.a;
    }

    private final Object g(Object obj, Object obj2, Object obj3) {
        mja mjaVar = (mja) this.b;
        qia qiaVar = (qia) this.c;
        ip7 ip7Var = (ip7) this.d;
        md3 md3Var = (md3) this.e;
        hy8 hy8Var = (hy8) obj;
        x12 x12Var = (x12) obj2;
        int iIntValue = ((Integer) obj3).intValue();
        hy8Var.getClass();
        if ((iIntValue & 6) == 0) {
            iIntValue |= ((p65) x12Var).f(hy8Var) ? 4 : 2;
        }
        p65 p65Var = (p65) x12Var;
        if (p65Var.P(iIntValue & 1, (iIntValue & 19) != 18)) {
            r28 r28VarB = w2g.B(o28.b, hy8Var);
            if (mjaVar instanceof lja) {
                p65Var.Y(-1631755701);
                g76.w(0, 0, p65Var, r28VarB);
                p65Var.p(false);
            } else if (mjaVar instanceof kja) {
                p65Var.Y(-1631751037);
                g76.v((kja) mjaVar, qiaVar, r28VarB, p65Var, 0);
                p65Var.p(false);
            } else if (mjaVar instanceof jja) {
                p65Var.Y(-1631742676);
                g76.u((jja) mjaVar, qiaVar, r28VarB, p65Var, 0);
                p65Var.p(false);
            } else {
                if (!(mjaVar instanceof ija)) {
                    throw ho2.L(p65Var, -1631757308, false);
                }
                p65Var.Y(-1631734843);
                g76.t((ija) mjaVar, ip7Var, qiaVar, md3Var, r28VarB, p65Var, 0);
                p65Var.p(false);
            }
        } else {
            p65Var.S();
        }
        return c1e.a;
    }

    private final Object h(Object obj, Object obj2, Object obj3) {
        jka jkaVar = (jka) this.b;
        xja xjaVar = (xja) this.c;
        my6 my6Var = (my6) this.d;
        sh9 sh9Var = (sh9) this.e;
        hy8 hy8Var = (hy8) obj;
        x12 x12Var = (x12) obj2;
        int iIntValue = ((Integer) obj3).intValue();
        hy8Var.getClass();
        if ((iIntValue & 6) == 0) {
            iIntValue |= ((p65) x12Var).f(hy8Var) ? 4 : 2;
        }
        p65 p65Var = (p65) x12Var;
        if (p65Var.P(iIntValue & 1, (iIntValue & 19) != 18)) {
            r28 r28VarB = w2g.B(o28.b, hy8Var);
            if (jkaVar instanceof hka) {
                p65Var.Y(-630247852);
                lk7.h((hka) jkaVar, r28VarB, p65Var, 0);
                p65Var.p(false);
            } else if (jkaVar instanceof ika) {
                p65Var.Y(-630014019);
                lk7.i(r28VarB, p65Var, 0);
                p65Var.p(false);
            } else {
                if (!(jkaVar instanceof gka)) {
                    throw ho2.L(p65Var, 2057877464, false);
                }
                p65Var.Y(-629811527);
                lk7.g((gka) jkaVar, xjaVar, my6Var, sh9Var, r28VarB, p65Var, 0);
                p65Var.p(false);
            }
        } else {
            p65Var.S();
        }
        return c1e.a;
    }

    private final Object i(Object obj, Object obj2, Object obj3) {
        j4b j4bVar = (j4b) this.b;
        sb2 sb2Var = (sb2) this.c;
        v7c v7cVar = (v7c) this.d;
        h4b h4bVar = (h4b) this.e;
        x12 x12Var = (x12) obj2;
        int iIntValue = ((Integer) obj3).intValue();
        ((xv1) obj).getClass();
        p65 p65Var = (p65) x12Var;
        if (p65Var.P(iIntValue & 1, (iIntValue & 17) != 16)) {
            vp7.f(j4bVar, new i4b(sb2Var, v7cVar, h4bVar), null, p65Var, 0);
        } else {
            p65Var.S();
        }
        return c1e.a;
    }

    private final Object j(Object obj, Object obj2, Object obj3) {
        j8b j8bVar = (j8b) this.b;
        dr9 dr9Var = (dr9) this.c;
        k8b k8bVar = (k8b) this.d;
        l78 l78Var = (l78) this.e;
        x12 x12Var = (x12) obj2;
        int iIntValue = ((Integer) obj3).intValue();
        ((xv1) obj).getClass();
        p65 p65Var = (p65) x12Var;
        if (p65Var.P(iIntValue & 1, (iIntValue & 17) != 16)) {
            Object objM = p65Var.M();
            uob uobVar = w12.a;
            if (objM == uobVar) {
                objM = new z7b(l78Var, 0);
                p65Var.j0(objM);
            }
            lk7.n(j8bVar, dr9Var, k8bVar, (m45) objM, p65Var, 3072);
            Object objM2 = p65Var.M();
            if (objM2 == uobVar) {
                objM2 = new z7b(l78Var, 1);
                p65Var.j0(objM2);
            }
            lk7.p(j8bVar, dr9Var, k8bVar, (m45) objM2, p65Var, 3072);
        } else {
            p65Var.S();
        }
        return c1e.a;
    }

    private final Object l(Object obj, Object obj2, Object obj3) {
        q8b q8bVar = (q8b) this.b;
        sb2 sb2Var = (sb2) this.c;
        v7c v7cVar = (v7c) this.d;
        l8b l8bVar = (l8b) this.e;
        x12 x12Var = (x12) obj2;
        int iIntValue = ((Integer) obj3).intValue();
        ((xv1) obj).getClass();
        p65 p65Var = (p65) x12Var;
        if (p65Var.P(iIntValue & 1, (iIntValue & 17) != 16)) {
            mk7.g(q8bVar, new p8b(sb2Var, v7cVar, l8bVar), null, p65Var, 0);
        } else {
            p65Var.S();
        }
        return c1e.a;
    }

    private final Object n(Object obj, Object obj2, Object obj3) {
        m8d m8dVar = (m8d) this.b;
        kv6 kv6Var = (kv6) this.c;
        f8d f8dVar = (f8d) this.d;
        h8d h8dVar = (h8d) this.e;
        hy8 hy8Var = (hy8) obj;
        x12 x12Var = (x12) obj2;
        int iIntValue = ((Integer) obj3).intValue();
        hy8Var.getClass();
        if ((iIntValue & 6) == 0) {
            iIntValue |= ((p65) x12Var).f(hy8Var) ? 4 : 2;
        }
        p65 p65Var = (p65) x12Var;
        if (p65Var.P(iIntValue & 1, (iIntValue & 19) != 18)) {
            gsa.K(m8dVar, kv6Var, f8dVar, h8dVar, w2g.B(o28.b, hy8Var), p65Var, 0);
        } else {
            p65Var.S();
        }
        return c1e.a;
    }

    private final Object o(Object obj, Object obj2, Object obj3) {
        mkd mkdVar;
        r28 r28Var = (r28) this.b;
        b55 b55Var = (b55) this.d;
        ip7 ip7Var = (ip7) this.c;
        String str = (String) this.e;
        x12 x12Var = (x12) obj2;
        int iIntValue = ((Integer) obj3).intValue();
        ((xr6) obj).getClass();
        p65 p65Var = (p65) x12Var;
        if (p65Var.P(iIntValue & 1, (iIntValue & 17) != 16)) {
            r28 r28VarX = ho2.x((jp7) p65Var.j(kt7.a), r28Var, 3, 1.0f);
            zk7 zk7VarC = dy0.c(z46.h, false);
            long j = p65Var.T;
            int i = (int) (j ^ (j >>> 32));
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
            Integer numValueOf = Integer.valueOf(i);
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
            String str2 = (String) b55Var.invoke(p65Var, 0);
            if (ip7Var == ip7.COMPACT) {
                p65Var.Y(834237010);
                mkdVar = ((bu7) p65Var.j(jt7.c)).i;
                p65Var.p(false);
            } else {
                p65Var.Y(834314386);
                mkdVar = ((bu7) p65Var.j(jt7.c)).h;
                p65Var.p(false);
            }
            jjd.b(str2, bgf.N(w2g.F(o28Var, 24.0f, 40.0f, 24.0f, 8.0f), str), 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, mkdVar, p65Var, 0, 0, 131068);
            p65Var.p(true);
            p65Var.p(true);
        } else {
            p65Var.S();
        }
        return c1e.a;
    }

    private final Object r(Object obj, Object obj2, Object obj3) {
        zed zedVar = (zed) this.b;
        ted tedVar = (ted) this.c;
        bo4 bo4Var = (bo4) this.d;
        e9d e9dVar = (e9d) this.e;
        hy8 hy8Var = (hy8) obj;
        x12 x12Var = (x12) obj2;
        int iIntValue = ((Integer) obj3).intValue();
        hy8Var.getClass();
        if ((iIntValue & 6) == 0) {
            iIntValue |= ((p65) x12Var).f(hy8Var) ? 4 : 2;
        }
        p65 p65Var = (p65) x12Var;
        if (p65Var.P(iIntValue & 1, (iIntValue & 19) != 18)) {
            r28 r28VarB = w2g.B(o28.b, hy8Var);
            if (zedVar instanceof ved) {
                p65Var.Y(-1845014202);
                kyd.x(((ved) zedVar).a, tedVar, r28VarB, p65Var, 0);
                p65Var.p(false);
            } else if (g76.L(zedVar, wed.a)) {
                p65Var.Y(-1844754236);
                kyd.y(r28VarB, p65Var, 0);
                p65Var.p(false);
            } else if (g76.L(zedVar, xed.a)) {
                p65Var.Y(-1844583581);
                kyd.z(r28VarB, p65Var, 0);
                p65Var.p(false);
            } else {
                if (!(zedVar instanceof yed)) {
                    throw ho2.L(p65Var, -890802117, false);
                }
                p65Var.Y(-1844403874);
                kyd.A((yed) zedVar, bo4Var, tedVar, e9dVar, r28VarB, p65Var, 0);
                p65Var.p(false);
            }
        } else {
            p65Var.S();
        }
        return c1e.a;
    }

    private final Object t(Object obj, Object obj2, Object obj3) {
        yed yedVar = (yed) this.b;
        bo4 bo4Var = (bo4) this.c;
        ted tedVar = (ted) this.d;
        e9d e9dVar = (e9d) this.e;
        x12 x12Var = (x12) obj2;
        int iIntValue = ((Integer) obj3).intValue();
        ((hy0) obj).getClass();
        p65 p65Var = (p65) x12Var;
        if (p65Var.P(iIntValue & 1, (iIntValue & 17) != 16)) {
            kyd.w(yedVar, bo4Var, tedVar, e9dVar, p65Var, 0);
        } else {
            p65Var.S();
        }
        return c1e.a;
    }

    private final Object u(Object obj, Object obj2, Object obj3) {
        Object objC;
        dkc dkcVar = (dkc) this.b;
        kx6 kx6Var = (kx6) this.c;
        uid uidVar = (uid) this.d;
        yqa yqaVar = (yqa) this.e;
        r28 r28Var = (r28) obj;
        ((Integer) obj3).getClass();
        p65 p65Var = (p65) ((x12) obj2);
        p65Var.Y(-84507373);
        boolean zBooleanValue = ((Boolean) p65Var.j(z22.y)).booleanValue();
        boolean zG = p65Var.g(zBooleanValue);
        Object objM = p65Var.M();
        uob uobVar = w12.a;
        if (zG || objM == uobVar) {
            objM = new il2(zBooleanValue);
            p65Var.j0(objM);
        }
        il2 il2Var = (il2) objM;
        boolean z = dkcVar.a != 16;
        if (((Boolean) ((ax6) ((w3f) p65Var.j(z22.v))).c.getValue()).booleanValue() && kx6Var.b() && bkd.c(uidVar.b) && z) {
            p65Var.Y(-707487962);
            mx mxVar = uidVar.a;
            bkd bkdVar = new bkd(uidVar.b);
            boolean zH = p65Var.h(il2Var);
            Object objM2 = p65Var.M();
            if (zH || objM2 == uobVar) {
                objM2 = new xi7(il2Var, null, 26);
                p65Var.j0(objM2);
            }
            kyd.l(mxVar, bkdVar, (b55) objM2, p65Var);
            boolean zH2 = p65Var.h(il2Var) | p65Var.h(yqaVar) | p65Var.f(uidVar) | p65Var.h(kx6Var) | p65Var.f(dkcVar);
            Object objM3 = p65Var.M();
            if (zH2 || objM3 == uobVar) {
                s7 s7Var = new s7(il2Var, yqaVar, uidVar, kx6Var, dkcVar, 11);
                p65Var.j0(s7Var);
                objM3 = s7Var;
            }
            objC = guc.C(r28Var, (x45) objM3);
            p65Var.p(false);
        } else {
            p65Var.Y(-705473241);
            p65Var.p(false);
            objC = o28.b;
        }
        p65Var.p(false);
        return objC;
    }

    private final Object v(Object obj, Object obj2, Object obj3) {
        List<w9e> list = (List) this.b;
        w9e w9eVar = (w9e) this.c;
        l8e l8eVar = (l8e) this.d;
        l78 l78Var = (l78) this.e;
        x12 x12Var = (x12) obj2;
        int iIntValue = ((Integer) obj3).intValue();
        ((xv1) obj).getClass();
        int i = 1;
        p65 p65Var = (p65) x12Var;
        if (p65Var.P(iIntValue & 1, (iIntValue & 17) != 16)) {
            for (w9e w9eVar2 : list) {
                r28 r28VarN = bgf.N(o28.b, "user_activities_activity_type_selector_" + w9eVar2);
                String strR = vo7.R(p65Var, k50.c0(w9eVar2));
                boolean z = w9eVar2 == w9eVar;
                int i2 = o8e.a[w9eVar2.ordinal()];
                Integer numValueOf = null;
                if (i2 != 1) {
                    if (i2 == 2) {
                        numValueOf = Integer.valueOf(R.drawable.ic_clap_filled_16);
                    } else if (i2 == 3) {
                        numValueOf = Integer.valueOf(R.drawable.ic_respond_filled_16);
                    } else {
                        if (i2 != 4) {
                            ygf.a();
                            return null;
                        }
                        numValueOf = Integer.valueOf(R.drawable.ic_highlight_filled_16);
                    }
                }
                bq7 bq7Var = new bq7(strR, z, numValueOf, null, 24);
                boolean zF = p65Var.f(l8eVar) | p65Var.d(w9eVar2.ordinal());
                Object objM = p65Var.M();
                if (zF || objM == w12.a) {
                    objM = new ukd(l8eVar, w9eVar2, l78Var, i);
                    p65Var.j0(objM);
                }
                p65 p65Var2 = p65Var;
                aq7.b(bq7Var, (m45) objM, r28VarN, 0L, 0L, p65Var2, 0, 24);
                p65Var = p65Var2;
                if (w9eVar2 == w9e.ALL_ACTIVITIES) {
                    p65Var.Y(-1257179695);
                    tp7.c(0.0f, 0, 7, 0L, p65Var, null);
                } else {
                    p65Var.Y(-1276030423);
                }
                p65Var.p(false);
            }
        } else {
            p65Var.S();
        }
        return c1e.a;
    }

    private final Object w(Object obj, Object obj2, Object obj3) {
        ioe ioeVar = (ioe) this.b;
        coe coeVar = (coe) this.c;
        bo4 bo4Var = (bo4) this.d;
        obe obeVar = (obe) this.e;
        hy8 hy8Var = (hy8) obj;
        x12 x12Var = (x12) obj2;
        int iIntValue = ((Integer) obj3).intValue();
        hy8Var.getClass();
        if ((iIntValue & 6) == 0) {
            iIntValue |= ((p65) x12Var).f(hy8Var) ? 4 : 2;
        }
        p65 p65Var = (p65) x12Var;
        if (p65Var.P(iIntValue & 1, (iIntValue & 19) != 18)) {
            r28 r28VarB = w2g.B(o28.b, hy8Var);
            if (ioeVar instanceof eoe) {
                p65Var.Y(2013468890);
                ht2.V(((eoe) ioeVar).a, coeVar, r28VarB, p65Var, 0);
                p65Var.p(false);
            } else if (g76.L(ioeVar, foe.a)) {
                p65Var.Y(2013730840);
                ht2.W(r28VarB, p65Var, 0);
                p65Var.p(false);
            } else if (g76.L(ioeVar, goe.a)) {
                p65Var.Y(2013903479);
                ht2.X(r28VarB, p65Var, 0);
                p65Var.p(false);
            } else {
                if (!(ioeVar instanceof hoe)) {
                    throw ho2.L(p65Var, -1320524270, false);
                }
                p65Var.Y(2014085294);
                ht2.Y((hoe) ioeVar, bo4Var, coeVar, obeVar, r28VarB, p65Var, 0);
                p65Var.p(false);
            }
        } else {
            p65Var.S();
        }
        return c1e.a;
    }

    /* JADX WARN: Multi-variable type inference failed */
    @Override // defpackage.c55
    public final Object f(Object obj, Object obj2, Object obj3) {
        int i;
        final l78 l78Var;
        final ub0 ub0Var;
        Object obj4;
        Object obj5;
        final ub0 ub0Var2;
        m45 m45Var;
        o28 o28Var;
        r28 r28Var;
        int i2 = this.a;
        int i3 = 23;
        int i4 = 18;
        o28 o28Var2 = o28.b;
        Object obj6 = w12.a;
        int i5 = 16;
        c1e c1eVar = c1e.a;
        int i6 = 0;
        Object obj7 = this.e;
        Object obj8 = this.d;
        Object obj9 = this.c;
        Object obj10 = this.b;
        switch (i2) {
            case 0:
                sv2 sv2Var = (sv2) obj10;
                SimpleDateFormat simpleDateFormat = (SimpleDateFormat) obj9;
                b55 b55Var = (b55) obj8;
                l78 l78Var2 = (l78) obj7;
                x12 x12Var = (x12) obj2;
                int iIntValue = ((Integer) obj3).intValue();
                ((xv1) obj).getClass();
                p65 p65Var = (p65) x12Var;
                if (p65Var.P(iIntValue & 1, (iIntValue & 17) != 16)) {
                    for (Object obj11 : sv2Var.a) {
                        int i7 = i6 + 1;
                        if (i6 < 0) {
                            d46.i0();
                            throw null;
                        }
                        rv2 rv2Var = (rv2) obj11;
                        String str = simpleDateFormat.format(Long.valueOf(rv2Var.a));
                        str.getClass();
                        bq7 bq7Var = new bq7(str, rv2Var.b, null, null, 28);
                        boolean zF = p65Var.f(b55Var) | p65Var.d(i6) | p65Var.f(rv2Var);
                        Object objM = p65Var.M();
                        if (zF || objM == obj6) {
                            objM = new qv2(b55Var, i6, rv2Var, l78Var2);
                            p65Var.j0(objM);
                        }
                        aq7.b(bq7Var, (m45) objM, null, 0L, 0L, p65Var, 0, 28);
                        i6 = i7;
                    }
                } else {
                    p65Var.S();
                }
                return c1eVar;
            case 1:
                v53 v53Var = (v53) obj10;
                sb2 sb2Var = (sb2) obj9;
                v7c v7cVar = (v7c) obj8;
                t53 t53Var = (t53) obj7;
                x12 x12Var2 = (x12) obj2;
                int iIntValue2 = ((Integer) obj3).intValue();
                ((xv1) obj).getClass();
                p65 p65Var2 = (p65) x12Var2;
                if (p65Var2.P(iIntValue2 & 1, (iIntValue2 & 17) != 16)) {
                    wgf.b(v53Var, new u53(sb2Var, v7cVar, t53Var), null, p65Var2, 0);
                } else {
                    p65Var2.S();
                }
                return c1eVar;
            case 2:
                az5<Frequency> az5Var = (az5) obj10;
                Frequency frequency = (Frequency) obj9;
                x45 x45Var = (x45) obj8;
                l78 l78Var3 = (l78) obj7;
                x12 x12Var3 = (x12) obj2;
                int iIntValue3 = ((Integer) obj3).intValue();
                ((xv1) obj).getClass();
                p65 p65Var3 = (p65) x12Var3;
                if (p65Var3.P(iIntValue3 & 1, (iIntValue3 & 17) != 16)) {
                    for (Frequency frequency2 : az5Var) {
                        bq7 bq7Var2 = new bq7(n01.a0(frequency2, p65Var3), frequency2 == frequency, null, null, 28);
                        boolean zF2 = p65Var3.f(x45Var) | p65Var3.d(frequency2.ordinal());
                        Object objM2 = p65Var3.M();
                        if (zF2 || objM2 == obj6) {
                            objM2 = new le0(x45Var, frequency2, l78Var3, i5);
                            p65Var3.j0(objM2);
                        }
                        aq7.b(bq7Var2, (m45) objM2, null, 0L, 0L, p65Var3, 0, 28);
                    }
                } else {
                    p65Var3.S();
                }
                return c1eVar;
            case 3:
                List<DarkMode> list = (List) obj10;
                lh3 lh3Var = (lh3) obj9;
                ah3 ah3Var = (ah3) obj8;
                l78 l78Var4 = (l78) obj7;
                x12 x12Var4 = (x12) obj2;
                int iIntValue4 = ((Integer) obj3).intValue();
                ((xv1) obj).getClass();
                p65 p65Var4 = (p65) x12Var4;
                if (p65Var4.P(iIntValue4 & 1, (iIntValue4 & 17) != 16)) {
                    for (DarkMode darkMode : list) {
                        r28 r28VarN = bgf.N(o28Var2, "appearance_selector_" + darkMode);
                        bq7 bq7Var3 = new bq7(rv8.R(darkMode, p65Var4), darkMode == lh3Var.e, null, null, 28);
                        boolean zF3 = p65Var4.f(ah3Var) | p65Var4.d(darkMode.ordinal());
                        Object objM3 = p65Var4.M();
                        if (zF3 || objM3 == obj6) {
                            objM3 = new le0(ah3Var, darkMode, l78Var4, i4);
                            p65Var4.j0(objM3);
                        }
                        aq7.b(bq7Var3, (m45) objM3, r28VarN, 0L, 0L, p65Var4, 0, 24);
                    }
                } else {
                    p65Var4.S();
                }
                return c1eVar;
            case 4:
                l78 l78Var5 = (l78) obj7;
                String str2 = (String) obj10;
                sb2 sb2Var2 = (sb2) obj9;
                nhc nhcVar = (nhc) obj8;
                x12 x12Var5 = (x12) obj2;
                int iIntValue5 = ((Integer) obj3).intValue();
                ((pmb) obj).getClass();
                p65 p65Var5 = (p65) x12Var5;
                if (p65Var5.P(iIntValue5 & 1, (iIntValue5 & 17) != 16)) {
                    Context context = (Context) p65Var5.j(eo.b);
                    Resources resources = (Resources) p65Var5.j(eo.c);
                    Object objM4 = p65Var5.M();
                    if (objM4 == obj6) {
                        objM4 = new vs(l78Var5, 22);
                        p65Var5.j0(objM4);
                    }
                    f49.l((m45) objM4, bgf.N(o28Var2, "more_options"), false, null, null, gsa.a, p65Var5, 1572918, 60);
                    boolean zBooleanValue = ((Boolean) l78Var5.getValue()).booleanValue();
                    Object objM5 = p65Var5.M();
                    if (objM5 == obj6) {
                        objM5 = new vs(l78Var5, i3);
                        p65Var5.j0(objM5);
                    }
                    oq.a(zBooleanValue, (m45) objM5, bgf.N(o28Var2, "more_options_dropdown"), 0L, null, null, null, 0L, 0.0f, pxf.E(-209875342, new j84(context, resources, str2, sb2Var2, nhcVar, l78Var5, 0), p65Var5), p65Var5, 432, 48, 2040);
                } else {
                    p65Var5.S();
                }
                return c1eVar;
            case 5:
                kv6 kv6Var = (kv6) obj10;
                jy4 jy4Var = (jy4) obj9;
                x45 x45Var2 = (x45) obj8;
                obe obeVar = (obe) obj7;
                x12 x12Var6 = (x12) obj2;
                int iIntValue6 = ((Integer) obj3).intValue();
                ((hy0) obj).getClass();
                p65 p65Var6 = (p65) x12Var6;
                if (p65Var6.P(iIntValue6 & 1, (iIntValue6 & 17) != 16)) {
                    r28 r28VarN2 = bgf.N(o28Var2, "following_users_list");
                    boolean zF4 = p65Var6.f(jy4Var) | p65Var6.f(x45Var2) | p65Var6.f(obeVar);
                    Object objM6 = p65Var6.M();
                    if (zF4 || objM6 == obj6) {
                        objM6 = new o8(jy4Var, x45Var2, obeVar, 21);
                        p65Var6.j0(objM6);
                    }
                    k40.t(r28VarN2, kv6Var, null, null, null, null, false, null, (x45) objM6, p65Var6, 6, 508);
                } else {
                    p65Var6.S();
                }
                return c1eVar;
            case 6:
                final ub0 ub0Var3 = (ub0) obj10;
                final i45 i45Var = (i45) obj9;
                final SourceParameter sourceParameter = (SourceParameter) obj8;
                final l78 l78Var6 = (l78) obj7;
                x12 x12Var7 = (x12) obj2;
                int iIntValue7 = ((Integer) obj3).intValue();
                ((xv1) obj).getClass();
                p65 p65Var7 = (p65) x12Var7;
                if (p65Var7.P(iIntValue7 & 1, (iIntValue7 & 17) != 16)) {
                    boolean z = ub0Var3.k;
                    tb0 tb0Var = ub0Var3.d;
                    tb0 tb0Var2 = ub0Var3.e;
                    if (z) {
                        p65Var7.Y(-1289342563);
                        mz1 mz1Var = w2g.b;
                        boolean zF5 = p65Var7.f(i45Var) | p65Var7.f("");
                        Object objM7 = p65Var7.M();
                        if (zF5 || objM7 == obj6) {
                            objM7 = new gd3(i45Var, i3, l78Var6);
                            p65Var7.j0(objM7);
                        }
                        oq.b(mz1Var, (m45) objM7, bgf.N(o28Var2, "action_select_voice"), null, null, false, null, null, p65Var7, 390, 504);
                    } else {
                        p65Var7.Y(-1309173852);
                    }
                    p65Var7.p(false);
                    mz1 mz1Var2 = w2g.c;
                    boolean zF6 = p65Var7.f(i45Var) | p65Var7.f(ub0Var3);
                    Object objM8 = p65Var7.M();
                    if (zF6 || objM8 == obj6) {
                        objM8 = new le0(i45Var, ub0Var3, l78Var6, 27);
                        p65Var7.j0(objM8);
                    }
                    oq.b(mz1Var2, (m45) objM8, bgf.N(o28Var2, "action_view_story"), null, null, false, null, null, p65Var7, 390, 504);
                    if (ub0Var3.m) {
                        p65Var7.Y(-1288467433);
                        mz1 mz1Var3 = w2g.d;
                        boolean zF7 = p65Var7.f(i45Var) | p65Var7.f(ub0Var3) | p65Var7.f(sourceParameter);
                        Object objM9 = p65Var7.M();
                        if (zF7 || objM9 == obj6) {
                            final int i8 = 0;
                            objM9 = new m45() { // from class: d45
                                @Override // defpackage.m45
                                public final Object invoke() {
                                    int i9 = i8;
                                    c1e c1eVar2 = c1e.a;
                                    l78 l78Var7 = l78Var6;
                                    SourceParameter sourceParameter2 = sourceParameter;
                                    ub0 ub0Var4 = ub0Var3;
                                    i45 i45Var2 = i45Var;
                                    switch (i9) {
                                        case 0:
                                            i45Var2.w(ub0Var4.a, gp7.u(sourceParameter2));
                                            l78Var7.setValue(Boolean.FALSE);
                                            return c1eVar2;
                                        case 1:
                                            i45Var2.k(sourceParameter2, ub0Var4.e.a, ub0Var4.a, true);
                                            l78Var7.setValue(Boolean.FALSE);
                                            return c1eVar2;
                                        case 2:
                                            i45Var2.k(sourceParameter2, ub0Var4.e.a, ub0Var4.a, false);
                                            l78Var7.setValue(Boolean.FALSE);
                                            return c1eVar2;
                                        case 3:
                                            l78Var7.setValue(Boolean.FALSE);
                                            i45Var2.x(sourceParameter2, ub0Var4.d.a, ub0Var4.a, true);
                                            return c1eVar2;
                                        case 4:
                                            l78Var7.setValue(Boolean.FALSE);
                                            i45Var2.x(sourceParameter2, ub0Var4.d.a, ub0Var4.a, false);
                                            return c1eVar2;
                                        default:
                                            String str3 = ub0Var4.a;
                                            tb0 tb0Var3 = ub0Var4.d;
                                            String str4 = tb0Var3 != null ? tb0Var3.a : null;
                                            if (str4 == null) {
                                                ywb.g(ev6.x("Author id of post ", str3, " is null"));
                                                return null;
                                            }
                                            i45Var2.r(str3, str4, gp7.u(sourceParameter2));
                                            l78Var7.setValue(Boolean.FALSE);
                                            return c1eVar2;
                                    }
                                }
                            };
                            p65Var7.j0(objM9);
                        }
                        oq.b(mz1Var3, (m45) objM9, bgf.N(o28Var2, "action_show_less"), null, null, false, null, null, p65Var7, 390, 504);
                    } else {
                        p65Var7.Y(-1309173852);
                    }
                    p65Var7.p(false);
                    if (ub0Var3.n) {
                        p65Var7.Y(-1287729881);
                        if (tb0Var2 != null) {
                            p65Var7.Y(-1287732640);
                            int i9 = h45.a[((d88) guc.x(tb0Var2.c, d88.NOT_MUTED, p65Var7, 48).getValue()).ordinal()];
                            if (i9 == 1) {
                                i = -1309173852;
                                l78Var = l78Var6;
                                p65Var7.Y(-1287485849);
                                mz1 mz1Var4 = w2g.e;
                                boolean zF8 = p65Var7.f(i45Var) | p65Var7.f(ub0Var3) | p65Var7.f(sourceParameter) | p65Var7.f("");
                                Object objM10 = p65Var7.M();
                                if (zF8 || objM10 == obj6) {
                                    final int i10 = 1;
                                    Object obj12 = new m45() { // from class: d45
                                        @Override // defpackage.m45
                                        public final Object invoke() {
                                            int i92 = i10;
                                            c1e c1eVar2 = c1e.a;
                                            l78 l78Var7 = l78Var;
                                            SourceParameter sourceParameter2 = sourceParameter;
                                            ub0 ub0Var4 = ub0Var3;
                                            i45 i45Var2 = i45Var;
                                            switch (i92) {
                                                case 0:
                                                    i45Var2.w(ub0Var4.a, gp7.u(sourceParameter2));
                                                    l78Var7.setValue(Boolean.FALSE);
                                                    return c1eVar2;
                                                case 1:
                                                    i45Var2.k(sourceParameter2, ub0Var4.e.a, ub0Var4.a, true);
                                                    l78Var7.setValue(Boolean.FALSE);
                                                    return c1eVar2;
                                                case 2:
                                                    i45Var2.k(sourceParameter2, ub0Var4.e.a, ub0Var4.a, false);
                                                    l78Var7.setValue(Boolean.FALSE);
                                                    return c1eVar2;
                                                case 3:
                                                    l78Var7.setValue(Boolean.FALSE);
                                                    i45Var2.x(sourceParameter2, ub0Var4.d.a, ub0Var4.a, true);
                                                    return c1eVar2;
                                                case 4:
                                                    l78Var7.setValue(Boolean.FALSE);
                                                    i45Var2.x(sourceParameter2, ub0Var4.d.a, ub0Var4.a, false);
                                                    return c1eVar2;
                                                default:
                                                    String str3 = ub0Var4.a;
                                                    tb0 tb0Var3 = ub0Var4.d;
                                                    String str4 = tb0Var3 != null ? tb0Var3.a : null;
                                                    if (str4 == null) {
                                                        ywb.g(ev6.x("Author id of post ", str3, " is null"));
                                                        return null;
                                                    }
                                                    i45Var2.r(str3, str4, gp7.u(sourceParameter2));
                                                    l78Var7.setValue(Boolean.FALSE);
                                                    return c1eVar2;
                                            }
                                        }
                                    };
                                    ub0Var3 = ub0Var3;
                                    p65Var7.j0(obj12);
                                    objM10 = obj12;
                                } else {
                                    ub0Var3 = ub0Var3;
                                }
                                oq.b(mz1Var4, (m45) objM10, bgf.N(o28Var2, "action_unmute_publication"), null, null, false, null, null, p65Var7, 390, 504);
                                p65Var7.p(false);
                            } else if (i9 == 2) {
                                p65Var7.Y(-1286448310);
                                mz1 mz1Var5 = w2g.f;
                                boolean zF9 = p65Var7.f(i45Var) | p65Var7.f(ub0Var3) | p65Var7.f(sourceParameter) | p65Var7.f("");
                                Object objM11 = p65Var7.M();
                                if (zF9 || objM11 == obj6) {
                                    final int i11 = 2;
                                    i = -1309173852;
                                    l78Var = l78Var6;
                                    ub0Var2 = ub0Var3;
                                    obj5 = new m45() { // from class: d45
                                        @Override // defpackage.m45
                                        public final Object invoke() {
                                            int i92 = i11;
                                            c1e c1eVar2 = c1e.a;
                                            l78 l78Var7 = l78Var;
                                            SourceParameter sourceParameter2 = sourceParameter;
                                            ub0 ub0Var4 = ub0Var2;
                                            i45 i45Var2 = i45Var;
                                            switch (i92) {
                                                case 0:
                                                    i45Var2.w(ub0Var4.a, gp7.u(sourceParameter2));
                                                    l78Var7.setValue(Boolean.FALSE);
                                                    return c1eVar2;
                                                case 1:
                                                    i45Var2.k(sourceParameter2, ub0Var4.e.a, ub0Var4.a, true);
                                                    l78Var7.setValue(Boolean.FALSE);
                                                    return c1eVar2;
                                                case 2:
                                                    i45Var2.k(sourceParameter2, ub0Var4.e.a, ub0Var4.a, false);
                                                    l78Var7.setValue(Boolean.FALSE);
                                                    return c1eVar2;
                                                case 3:
                                                    l78Var7.setValue(Boolean.FALSE);
                                                    i45Var2.x(sourceParameter2, ub0Var4.d.a, ub0Var4.a, true);
                                                    return c1eVar2;
                                                case 4:
                                                    l78Var7.setValue(Boolean.FALSE);
                                                    i45Var2.x(sourceParameter2, ub0Var4.d.a, ub0Var4.a, false);
                                                    return c1eVar2;
                                                default:
                                                    String str3 = ub0Var4.a;
                                                    tb0 tb0Var3 = ub0Var4.d;
                                                    String str4 = tb0Var3 != null ? tb0Var3.a : null;
                                                    if (str4 == null) {
                                                        ywb.g(ev6.x("Author id of post ", str3, " is null"));
                                                        return null;
                                                    }
                                                    i45Var2.r(str3, str4, gp7.u(sourceParameter2));
                                                    l78Var7.setValue(Boolean.FALSE);
                                                    return c1eVar2;
                                            }
                                        }
                                    };
                                    p65Var7.j0(obj5);
                                } else {
                                    i = -1309173852;
                                    l78Var = l78Var6;
                                    obj5 = objM11;
                                    ub0Var2 = ub0Var3;
                                }
                                oq.b(mz1Var5, (m45) obj5, bgf.N(o28Var2, "action_mute_publication"), null, null, false, null, null, p65Var7, 390, 504);
                                p65Var7.p(false);
                                ub0Var3 = ub0Var2;
                            } else {
                                if (i9 != 3 && i9 != 4) {
                                    throw ho2.L(p65Var7, 651203599, false);
                                }
                                p65Var7.Y(651273474);
                                p65Var7.p(false);
                                i = -1309173852;
                                l78Var = l78Var6;
                            }
                            p65Var7.p(false);
                            ub0Var = ub0Var3;
                        } else {
                            i = -1309173852;
                            l78Var = l78Var6;
                            if (tb0Var != null) {
                                p65Var7.Y(-1285171017);
                                int i12 = h45.a[((d88) guc.x(tb0Var.c, d88.NOT_MUTED, p65Var7, 48).getValue()).ordinal()];
                                if (i12 == 1) {
                                    ub0Var = ub0Var3;
                                    p65Var7.Y(-1284936595);
                                    mz1 mz1Var6 = w2g.g;
                                    boolean zF10 = p65Var7.f(i45Var) | p65Var7.f(ub0Var) | p65Var7.f(sourceParameter) | p65Var7.f("");
                                    Object objM12 = p65Var7.M();
                                    if (zF10 || objM12 == obj6) {
                                        final int i13 = 3;
                                        Object obj13 = new m45() { // from class: d45
                                            @Override // defpackage.m45
                                            public final Object invoke() {
                                                int i92 = i13;
                                                c1e c1eVar2 = c1e.a;
                                                l78 l78Var7 = l78Var;
                                                SourceParameter sourceParameter2 = sourceParameter;
                                                ub0 ub0Var4 = ub0Var;
                                                i45 i45Var2 = i45Var;
                                                switch (i92) {
                                                    case 0:
                                                        i45Var2.w(ub0Var4.a, gp7.u(sourceParameter2));
                                                        l78Var7.setValue(Boolean.FALSE);
                                                        return c1eVar2;
                                                    case 1:
                                                        i45Var2.k(sourceParameter2, ub0Var4.e.a, ub0Var4.a, true);
                                                        l78Var7.setValue(Boolean.FALSE);
                                                        return c1eVar2;
                                                    case 2:
                                                        i45Var2.k(sourceParameter2, ub0Var4.e.a, ub0Var4.a, false);
                                                        l78Var7.setValue(Boolean.FALSE);
                                                        return c1eVar2;
                                                    case 3:
                                                        l78Var7.setValue(Boolean.FALSE);
                                                        i45Var2.x(sourceParameter2, ub0Var4.d.a, ub0Var4.a, true);
                                                        return c1eVar2;
                                                    case 4:
                                                        l78Var7.setValue(Boolean.FALSE);
                                                        i45Var2.x(sourceParameter2, ub0Var4.d.a, ub0Var4.a, false);
                                                        return c1eVar2;
                                                    default:
                                                        String str3 = ub0Var4.a;
                                                        tb0 tb0Var3 = ub0Var4.d;
                                                        String str4 = tb0Var3 != null ? tb0Var3.a : null;
                                                        if (str4 == null) {
                                                            ywb.g(ev6.x("Author id of post ", str3, " is null"));
                                                            return null;
                                                        }
                                                        i45Var2.r(str3, str4, gp7.u(sourceParameter2));
                                                        l78Var7.setValue(Boolean.FALSE);
                                                        return c1eVar2;
                                                }
                                            }
                                        };
                                        p65Var7.j0(obj13);
                                        objM12 = obj13;
                                    }
                                    oq.b(mz1Var6, (m45) objM12, bgf.N(o28Var2, "action_unmute_author"), null, null, false, null, null, p65Var7, 390, 504);
                                    p65Var7.p(false);
                                } else if (i12 != 2) {
                                    if (i12 == 3) {
                                        p65Var7.Y(651354594);
                                        p65Var7.p(false);
                                    } else {
                                        if (i12 != 4) {
                                            throw ho2.L(p65Var7, 651285953, false);
                                        }
                                        p65Var7.Y(651356386);
                                        p65Var7.p(false);
                                    }
                                    ub0Var = ub0Var3;
                                } else {
                                    p65Var7.Y(-1283873264);
                                    mz1 mz1Var7 = w2g.h;
                                    boolean zF11 = p65Var7.f(i45Var) | p65Var7.f(ub0Var3) | p65Var7.f(sourceParameter) | p65Var7.f("");
                                    Object objM13 = p65Var7.M();
                                    if (zF11 || objM13 == obj6) {
                                        final int i14 = 4;
                                        ub0Var = ub0Var3;
                                        obj4 = new m45() { // from class: d45
                                            @Override // defpackage.m45
                                            public final Object invoke() {
                                                int i92 = i14;
                                                c1e c1eVar2 = c1e.a;
                                                l78 l78Var7 = l78Var;
                                                SourceParameter sourceParameter2 = sourceParameter;
                                                ub0 ub0Var4 = ub0Var;
                                                i45 i45Var2 = i45Var;
                                                switch (i92) {
                                                    case 0:
                                                        i45Var2.w(ub0Var4.a, gp7.u(sourceParameter2));
                                                        l78Var7.setValue(Boolean.FALSE);
                                                        return c1eVar2;
                                                    case 1:
                                                        i45Var2.k(sourceParameter2, ub0Var4.e.a, ub0Var4.a, true);
                                                        l78Var7.setValue(Boolean.FALSE);
                                                        return c1eVar2;
                                                    case 2:
                                                        i45Var2.k(sourceParameter2, ub0Var4.e.a, ub0Var4.a, false);
                                                        l78Var7.setValue(Boolean.FALSE);
                                                        return c1eVar2;
                                                    case 3:
                                                        l78Var7.setValue(Boolean.FALSE);
                                                        i45Var2.x(sourceParameter2, ub0Var4.d.a, ub0Var4.a, true);
                                                        return c1eVar2;
                                                    case 4:
                                                        l78Var7.setValue(Boolean.FALSE);
                                                        i45Var2.x(sourceParameter2, ub0Var4.d.a, ub0Var4.a, false);
                                                        return c1eVar2;
                                                    default:
                                                        String str3 = ub0Var4.a;
                                                        tb0 tb0Var3 = ub0Var4.d;
                                                        String str4 = tb0Var3 != null ? tb0Var3.a : null;
                                                        if (str4 == null) {
                                                            ywb.g(ev6.x("Author id of post ", str3, " is null"));
                                                            return null;
                                                        }
                                                        i45Var2.r(str3, str4, gp7.u(sourceParameter2));
                                                        l78Var7.setValue(Boolean.FALSE);
                                                        return c1eVar2;
                                                }
                                            }
                                        };
                                        p65Var7.j0(obj4);
                                    } else {
                                        obj4 = objM13;
                                        ub0Var = ub0Var3;
                                    }
                                    oq.b(mz1Var7, (m45) obj4, bgf.N(o28Var2, "action_mute_author"), null, null, false, null, null, p65Var7, 390, 504);
                                    p65Var7.p(false);
                                }
                            } else {
                                ub0Var = ub0Var3;
                                p65Var7.Y(-1309173852);
                            }
                            p65Var7.p(false);
                        }
                    } else {
                        i = -1309173852;
                        l78Var = l78Var6;
                        ub0Var = ub0Var3;
                        p65Var7.Y(-1309173852);
                    }
                    p65Var7.p(false);
                    if (ub0Var.l) {
                        p65Var7.Y(-1282625576);
                        mz1 mz1Var8 = w2g.i;
                        boolean zF12 = p65Var7.f(i45Var) | p65Var7.f(ub0Var) | p65Var7.f(sourceParameter);
                        Object objM14 = p65Var7.M();
                        if (zF12 || objM14 == obj6) {
                            final int i15 = 5;
                            Object obj14 = new m45() { // from class: d45
                                @Override // defpackage.m45
                                public final Object invoke() {
                                    int i92 = i15;
                                    c1e c1eVar2 = c1e.a;
                                    l78 l78Var7 = l78Var;
                                    SourceParameter sourceParameter2 = sourceParameter;
                                    ub0 ub0Var4 = ub0Var;
                                    i45 i45Var2 = i45Var;
                                    switch (i92) {
                                        case 0:
                                            i45Var2.w(ub0Var4.a, gp7.u(sourceParameter2));
                                            l78Var7.setValue(Boolean.FALSE);
                                            return c1eVar2;
                                        case 1:
                                            i45Var2.k(sourceParameter2, ub0Var4.e.a, ub0Var4.a, true);
                                            l78Var7.setValue(Boolean.FALSE);
                                            return c1eVar2;
                                        case 2:
                                            i45Var2.k(sourceParameter2, ub0Var4.e.a, ub0Var4.a, false);
                                            l78Var7.setValue(Boolean.FALSE);
                                            return c1eVar2;
                                        case 3:
                                            l78Var7.setValue(Boolean.FALSE);
                                            i45Var2.x(sourceParameter2, ub0Var4.d.a, ub0Var4.a, true);
                                            return c1eVar2;
                                        case 4:
                                            l78Var7.setValue(Boolean.FALSE);
                                            i45Var2.x(sourceParameter2, ub0Var4.d.a, ub0Var4.a, false);
                                            return c1eVar2;
                                        default:
                                            String str3 = ub0Var4.a;
                                            tb0 tb0Var3 = ub0Var4.d;
                                            String str4 = tb0Var3 != null ? tb0Var3.a : null;
                                            if (str4 == null) {
                                                ywb.g(ev6.x("Author id of post ", str3, " is null"));
                                                return null;
                                            }
                                            i45Var2.r(str3, str4, gp7.u(sourceParameter2));
                                            l78Var7.setValue(Boolean.FALSE);
                                            return c1eVar2;
                                    }
                                }
                            };
                            p65Var7.j0(obj14);
                            objM14 = obj14;
                        }
                        oq.b(mz1Var8, (m45) objM14, bgf.N(o28Var2, "action_report"), null, null, false, null, null, p65Var7, 390, 504);
                    } else {
                        p65Var7.Y(i);
                    }
                    p65Var7.p(false);
                } else {
                    p65Var7.S();
                }
                return c1eVar;
            case 7:
                vq5 vq5Var = (vq5) obj10;
                nhc nhcVar2 = (nhc) obj9;
                bo4 bo4Var = (bo4) obj8;
                rq5 rq5Var = (rq5) obj7;
                hy8 hy8Var = (hy8) obj;
                x12 x12Var8 = (x12) obj2;
                int iIntValue8 = ((Integer) obj3).intValue();
                hy8Var.getClass();
                if ((iIntValue8 & 6) == 0) {
                    iIntValue8 |= ((p65) x12Var8).f(hy8Var) ? 4 : 2;
                }
                p65 p65Var8 = (p65) x12Var8;
                if (p65Var8.P(iIntValue8 & 1, (iIntValue8 & 19) != 18)) {
                    op8.q(vq5Var, nhcVar2, bo4Var, rq5Var, w2g.B(o28Var2, hy8Var), p65Var8, 48);
                } else {
                    p65Var8.S();
                }
                return c1eVar;
            case 8:
                sb2 sb2Var3 = (sb2) obj10;
                v7c v7cVar2 = (v7c) obj9;
                m45 m45Var2 = (m45) obj8;
                m45 m45Var3 = (m45) obj7;
                x12 x12Var9 = (x12) obj2;
                int iIntValue9 = ((Integer) obj3).intValue();
                ((xv1) obj).getClass();
                p65 p65Var9 = (p65) x12Var9;
                if (p65Var9.P(iIntValue9 & 1, (iIntValue9 & 17) != 16)) {
                    boolean zH = p65Var9.h(sb2Var3) | p65Var9.f(v7cVar2) | p65Var9.f(m45Var2) | p65Var9.f(m45Var3);
                    Object objM15 = p65Var9.M();
                    if (zH || objM15 == obj6) {
                        Object z47Var = new z47(m45Var3, sb2Var3, v7cVar2, m45Var2, 0);
                        v7cVar2 = v7cVar2;
                        m45Var = m45Var2;
                        p65Var9.j0(z47Var);
                        objM15 = z47Var;
                    } else {
                        m45Var = m45Var2;
                    }
                    m45 m45Var4 = (m45) objM15;
                    boolean zH2 = p65Var9.h(sb2Var3) | p65Var9.f(v7cVar2) | p65Var9.f(m45Var);
                    Object objM16 = p65Var9.M();
                    if (zH2 || objM16 == obj6) {
                        objM16 = new a57(sb2Var3, v7cVar2, m45Var, i);
                        p65Var9.j0(objM16);
                    }
                    m40.w(m45Var4, (m45) objM16, null, p65Var9, 0);
                } else {
                    p65Var9.S();
                }
                return c1eVar;
            case 9:
                mz1 mz1Var9 = (mz1) obj10;
                Object obj15 = (hy8) obj9;
                mx0 mx0Var = (mx0) obj8;
                m45 m45Var5 = (m45) obj7;
                jy0 jy0Var = (jy0) obj;
                x12 x12Var10 = (x12) obj2;
                int iIntValue10 = ((Integer) obj3).intValue();
                jy0Var.getClass();
                if ((iIntValue10 & 6) == 0) {
                    iIntValue10 |= ((p65) x12Var10).f(jy0Var) ? 4 : 2;
                }
                p65 p65Var10 = (p65) x12Var10;
                if (p65Var10.P(iIntValue10 & 1, (iIntValue10 & 19) != 18)) {
                    mz1Var9.f(obj15, p65Var10, 0);
                    boolean zE = mx0Var.a.e();
                    m73 m73Var = jy0Var.a;
                    long j = jy0Var.b;
                    vv2.q(0, p65Var10, m45Var5, jfc.e(o28Var2, f72.c(j) ? m73Var.N(f72.g(j)) : Float.POSITIVE_INFINITY), zE);
                } else {
                    p65Var10.S();
                }
                return c1eVar;
            case 10:
                String str3 = (String) obj10;
                m45 m45Var6 = (m45) obj9;
                String str4 = (String) obj8;
                m45 m45Var7 = (m45) obj7;
                x12 x12Var11 = (x12) obj2;
                int iIntValue11 = ((Integer) obj3).intValue();
                ((xv1) obj).getClass();
                p65 p65Var11 = (p65) x12Var11;
                if (p65Var11.P(iIntValue11 & 1, (iIntValue11 & 17) != 16)) {
                    Object[] objArr = (str3 == null || m45Var6 == null) ? false : true;
                    i = (str4 == null || m45Var7 == null) ? 0 : 1;
                    o28 o28Var3 = o28.b;
                    if (objArr == true || i != 0) {
                        km4.F(21.0f, 760948991, p65Var11, p65Var11, o28Var3);
                    } else {
                        p65Var11.Y(758953862);
                    }
                    p65Var11.p(false);
                    if (objArr == true) {
                        p65Var11.Y(761073363);
                        if (str3 == null) {
                            ay0.e("Primary action button should not be shown without providing a text");
                            return null;
                        }
                        if (m45Var6 == null) {
                            ay0.e("Primary action button should not be shown without providing a callback");
                            return null;
                        }
                        o28Var = o28Var3;
                        fo7.i(m45Var6, str3, xn7.L, bgf.N(jfc.d(w2g.G(o28Var3, 24.0f, 0.0f, 24.0f, 0.0f, 10), 1.0f), "primary_action"), false, p65Var11, 3456, 16);
                    } else {
                        o28Var = o28Var3;
                        p65Var11.Y(758953862);
                    }
                    p65Var11.p(false);
                    if (!objArr == true || i == 0) {
                        p65Var11.Y(758953862);
                    } else {
                        km4.F(6.0f, 761766368, p65Var11, p65Var11, o28Var);
                    }
                    p65Var11.p(false);
                    if (i != 0) {
                        p65Var11.Y(761892259);
                        if (str4 == null) {
                            ay0.e("Secondary action button should not be shown without providing a text");
                            return null;
                        }
                        if (m45Var7 == null) {
                            ay0.e("Secondary action button should not be shown without providing a callback");
                            return null;
                        }
                        fo7.j(m45Var7, str4, xn7.L, bgf.N(jfc.d(w2g.G(o28Var, 24.0f, 0.0f, 24.0f, 0.0f, 10), 1.0f), "secondary_action"), false, null, p65Var11, 3456, 48);
                    } else {
                        p65Var11.Y(758953862);
                    }
                    p65Var11.p(false);
                    if (objArr == true || i != 0) {
                        km4.F(21.0f, 762600671, p65Var11, p65Var11, o28Var);
                    } else {
                        p65Var11.Y(758953862);
                    }
                    p65Var11.p(false);
                } else {
                    p65Var11.S();
                }
                return c1eVar;
            case 11:
                l38 l38Var = (l38) obj10;
                Long l = l38Var.c;
                r28 r28Var2 = (r28) obj9;
                upc upcVar = (upc) obj8;
                upc upcVar2 = (upc) obj7;
                x12 x12Var12 = (x12) obj2;
                int iIntValue12 = ((Integer) obj3).intValue();
                ((gq4) obj).getClass();
                p65 p65Var12 = (p65) x12Var12;
                if (p65Var12.P(iIntValue12 & 1, (iIntValue12 & 17) != 16)) {
                    Long l2 = l38Var.g;
                    Long l3 = l38Var.f;
                    if (l != null) {
                        p65Var12.Y(-1534643963);
                        h38.a(l.longValue(), R.string.stats_monthly_chart_total_presentations, r28Var2, false, Integer.valueOf(R.string.stats_presentations_tooltip), p65Var12, 0, 8);
                    } else {
                        p65Var12.Y(-1540579006);
                    }
                    p65Var12.p(false);
                    Long l4 = (Long) upcVar.getValue();
                    if (l4 == null) {
                        p65Var12.Y(-1534323858);
                    } else {
                        p65Var12.Y(-1534323857);
                        h38.a(l4.longValue(), R.string.stats_views, r28Var2, false, null, p65Var12, 0, 24);
                    }
                    p65Var12.p(false);
                    Long l5 = (Long) upcVar2.getValue();
                    if (l5 == null) {
                        p65Var12.Y(-1534088754);
                    } else {
                        p65Var12.Y(-1534088753);
                        h38.a(l5.longValue(), R.string.stats_reads, r28Var2, false, null, p65Var12, 0, 24);
                    }
                    p65Var12.p(false);
                    if (l3 != null) {
                        p65Var12.Y(-1533807149);
                        h38.a(l3.longValue(), R.string.stats_followers, r28Var2, true, null, p65Var12, 3072, 16);
                    } else {
                        p65Var12.Y(-1540579006);
                    }
                    p65Var12.p(false);
                    if (l2 != null) {
                        p65Var12.Y(-1533482641);
                        h38.a(l2.longValue(), R.string.stats_subscribers, r28Var2, true, null, p65Var12, 3072, 16);
                        r28Var = r28Var2;
                    } else {
                        r28Var = r28Var2;
                        p65Var12.Y(-1540579006);
                    }
                    p65Var12.p(false);
                    if (l3 == null || l2 == null) {
                        p65Var12.Y(-1540579006);
                    } else {
                        p65Var12.Y(-1533140308);
                        hp7.t(p65Var12, r28Var);
                    }
                    p65Var12.p(false);
                } else {
                    p65Var12.S();
                }
                return c1eVar;
            case 12:
                return a(obj, obj2, obj3);
            case 13:
                kx9 kx9Var = (kx9) obj10;
                ex9 ex9Var = (ex9) obj9;
                bo4 bo4Var2 = (bo4) obj8;
                md3 md3Var = (md3) obj7;
                hy8 hy8Var2 = (hy8) obj;
                x12 x12Var13 = (x12) obj2;
                int iIntValue13 = ((Integer) obj3).intValue();
                hy8Var2.getClass();
                if ((iIntValue13 & 6) == 0) {
                    iIntValue13 |= ((p65) x12Var13).f(hy8Var2) ? 4 : 2;
                }
                p65 p65Var13 = (p65) x12Var13;
                if (p65Var13.P(iIntValue13 & 1, (iIntValue13 & 19) != 18)) {
                    r28 r28VarB = w2g.B(o28Var2, hy8Var2);
                    if (kx9Var instanceof gx9) {
                        p65Var13.Y(632083644);
                        rx0.B(((gx9) kx9Var).a, ex9Var, r28VarB, p65Var13, 0);
                        p65Var13.p(false);
                    } else if (g76.L(kx9Var, hx9.a)) {
                        p65Var13.Y(632363853);
                        rx0.C(r28VarB, p65Var13, 0);
                        p65Var13.p(false);
                    } else if (g76.L(kx9Var, ix9.a)) {
                        p65Var13.Y(632536492);
                        rx0.D(r28VarB, p65Var13, 0);
                        p65Var13.p(false);
                    } else {
                        if (!(kx9Var instanceof jx9)) {
                            throw ho2.L(p65Var13, -949443088, false);
                        }
                        p65Var13.Y(632718307);
                        rx0.E((jx9) kx9Var, bo4Var2, ex9Var, md3Var, r28VarB, p65Var13, 0);
                        p65Var13.p(false);
                    }
                } else {
                    p65Var13.S();
                }
                return c1eVar;
            case 14:
                jx9 jx9Var = (jx9) obj10;
                bo4 bo4Var3 = (bo4) obj9;
                ex9 ex9Var2 = (ex9) obj8;
                md3 md3Var2 = (md3) obj7;
                x12 x12Var14 = (x12) obj2;
                int iIntValue14 = ((Integer) obj3).intValue();
                ((hy0) obj).getClass();
                p65 p65Var14 = (p65) x12Var14;
                if (p65Var14.P(iIntValue14 & 1, (iIntValue14 & 17) != 16)) {
                    rx0.A(jx9Var, bo4Var3, ex9Var2, md3Var2, p65Var14, 0);
                } else {
                    p65Var14.S();
                }
                return c1eVar;
            case 15:
                List<rba> list2 = (List) obj10;
                rba rbaVar = (rba) obj9;
                nba nbaVar = (nba) obj8;
                l78 l78Var7 = (l78) obj7;
                x12 x12Var15 = (x12) obj2;
                int iIntValue15 = ((Integer) obj3).intValue();
                ((xv1) obj).getClass();
                p65 p65Var15 = (p65) x12Var15;
                if (p65Var15.P(iIntValue15 & 1, (iIntValue15 & 17) != 16)) {
                    for (rba rbaVar2 : list2) {
                        if (rbaVar2 == rba.MOST_POPULAR) {
                            p65Var15.Y(129739697);
                            tp7.c(0.0f, 0, 7, 0L, p65Var15, null);
                        } else {
                            p65Var15.Y(101367753);
                        }
                        p65Var15.p(false);
                        bq7 bq7Var4 = new bq7(pba.k(rbaVar2, p65Var15), rbaVar == rbaVar2, null, null, 28);
                        boolean zF13 = p65Var15.f(nbaVar) | p65Var15.d(rbaVar2.ordinal());
                        Object objM17 = p65Var15.M();
                        if (zF13 || objM17 == obj6) {
                            objM17 = new i16(nbaVar, rbaVar2, l78Var7, 17);
                            p65Var15.j0(objM17);
                        }
                        aq7.b(bq7Var4, (m45) objM17, bgf.N(o28Var2, "publication_archive_sort_filter_" + rbaVar2), 0L, 0L, p65Var15, 0, 24);
                    }
                } else {
                    p65Var15.S();
                }
                return c1eVar;
            case 16:
                return d(obj, obj2, obj3);
            case 17:
                return g(obj, obj2, obj3);
            case 18:
                return h(obj, obj2, obj3);
            case 19:
                return i(obj, obj2, obj3);
            case 20:
                return j(obj, obj2, obj3);
            case 21:
                return l(obj, obj2, obj3);
            case 22:
                return n(obj, obj2, obj3);
            case 23:
                return o(obj, obj2, obj3);
            case 24:
                return r(obj, obj2, obj3);
            case 25:
                return t(obj, obj2, obj3);
            case 26:
                return u(obj, obj2, obj3);
            case 27:
                return v(obj, obj2, obj3);
            case 28:
                return w(obj, obj2, obj3);
            default:
                hoe hoeVar = (hoe) obj10;
                bo4 bo4Var4 = (bo4) obj9;
                coe coeVar = (coe) obj8;
                obe obeVar2 = (obe) obj7;
                x12 x12Var16 = (x12) obj2;
                int iIntValue16 = ((Integer) obj3).intValue();
                ((hy0) obj).getClass();
                p65 p65Var16 = (p65) x12Var16;
                if (p65Var16.P(iIntValue16 & 1, (iIntValue16 & 17) != 16)) {
                    ht2.U(hoeVar, bo4Var4, coeVar, obeVar2, p65Var16, 0);
                } else {
                    p65Var16.S();
                }
                return c1eVar;
        }
    }

    public /* synthetic */ ov2(l78 l78Var, String str, sb2 sb2Var, nhc nhcVar) {
        this.a = 4;
        this.e = l78Var;
        this.b = str;
        this.c = sb2Var;
        this.d = nhcVar;
    }

    public /* synthetic */ ov2(Object obj, Object obj2, Object obj3, Object obj4, int i) {
        this.a = i;
        this.b = obj;
        this.c = obj2;
        this.d = obj3;
        this.e = obj4;
    }
}
