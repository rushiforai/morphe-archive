package defpackage;

import android.content.Context;
import android.os.Build;
import com.drew.metadata.exif.makernotes.PanasonicMakernoteDirectory;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class n23 {
    public static final hd9 a = new hd9(30);

    public static final void a(khd khdVar, xgd xgdVar, x12 x12Var, int i) {
        Context context;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(1904307118);
        int i2 = (p65Var.f(khdVar) ? 4 : 2) | i | (p65Var.h(xgdVar) ? 32 : 16);
        if (p65Var.P(i2 & 1, (i2 & 19) != 18)) {
            if (Build.VERSION.SDK_INT >= 28) {
                p65Var.Y(-1009482584);
                context = (Context) p65Var.j(eo.b);
                p65Var.p(false);
            } else {
                p65Var.Y(-1009433480);
                p65Var.p(false);
                context = null;
            }
            boolean zH = p65Var.h(xgdVar) | ((i2 & 14) == 4) | p65Var.h(context);
            Object objM = p65Var.M();
            if (zH || objM == w12.a) {
                objM = new o8(xgdVar, context, khdVar, 9);
                p65Var.j0(objM);
            }
            i92.b(null, null, (x45) objM, p65Var, 0, 3);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new ag1(khdVar, xgdVar, i, 12);
        }
    }

    public static final void b(final int i, final long j, x12 x12Var, final int i2) {
        final int i3;
        int i4;
        mwa mwaVarS;
        b55 b55Var;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-1240244237);
        if ((i2 & 6) == 0) {
            i3 = i;
            i4 = i2 | (p65Var.d(i3) ? 4 : 2);
        } else {
            i3 = i;
            i4 = i2;
        }
        if ((i2 & 48) == 0) {
            i4 |= p65Var.e(j) ? 32 : 16;
        }
        if (p65Var.P(i4 & 1, (i4 & 19) != 18)) {
            Context context = (Context) p65Var.j(eo.b);
            boolean zF = ((i4 & 14) == 4) | p65Var.f(context);
            Object objM = p65Var.M();
            uob uobVar = w12.a;
            if (zF || objM == uobVar) {
                objM = Integer.valueOf(context.obtainStyledAttributes(new int[]{i3}).getResourceId(0, -1));
                p65Var.j0(objM);
            }
            int iIntValue = ((Number) objM).intValue();
            if (iIntValue == -1) {
                mwaVarS = p65Var.s();
                if (mwaVarS != null) {
                    final int i5 = 1;
                    b55Var = new b55() { // from class: k23
                        @Override // defpackage.b55
                        public final Object invoke(Object obj, Object obj2) {
                            int i6 = i5;
                            c1e c1eVar = c1e.a;
                            int i7 = i2;
                            long j2 = j;
                            int i8 = i3;
                            x12 x12Var2 = (x12) obj;
                            ((Integer) obj2).intValue();
                            switch (i6) {
                                case 0:
                                    n23.b(i8, j2, x12Var2, tr7.y(i7 | 1));
                                    break;
                                default:
                                    n23.b(i8, j2, x12Var2, tr7.y(i7 | 1));
                                    break;
                            }
                            return c1eVar;
                        }
                    };
                    mwaVarS.d = b55Var;
                }
                return;
            }
            c09 c09VarJ = vn7.J(iIntValue, 0, p65Var);
            boolean z = (i4 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32;
            Object objM2 = p65Var.M();
            if (z || objM2 == uobVar) {
                objM2 = j == 16 ? null : new bs0(5, j);
                p65Var.j0(objM2);
            }
            dy0.a(sgg.R(jfc.l(o28.b, h92.e), c09VarJ, null, v82.b, 0.0f, (bs0) objM2, 22), p65Var, 0);
        } else {
            p65Var.S();
        }
        mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            final int i6 = 0;
            b55Var = new b55() { // from class: k23
                @Override // defpackage.b55
                public final Object invoke(Object obj, Object obj2) {
                    int i62 = i6;
                    c1e c1eVar = c1e.a;
                    int i7 = i2;
                    long j2 = j;
                    int i8 = i;
                    x12 x12Var2 = (x12) obj;
                    ((Integer) obj2).intValue();
                    switch (i62) {
                        case 0:
                            n23.b(i8, j2, x12Var2, tr7.y(i7 | 1));
                            break;
                        default:
                            n23.b(i8, j2, x12Var2, tr7.y(i7 | 1));
                            break;
                    }
                    return c1eVar;
                }
            };
            mwaVarS.d = b55Var;
        }
    }

    public static final void c(khd khdVar, ygd ygdVar, m45 m45Var, x12 x12Var, int i) {
        int i2;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-2040393164);
        if ((i & 6) == 0) {
            i2 = ((i & 8) == 0 ? p65Var.f(khdVar) : p65Var.h(khdVar) ? 4 : 2) | i;
        } else {
            i2 = i;
        }
        if ((i & 48) == 0) {
            i2 |= (i & 64) == 0 ? p65Var.f(ygdVar) : p65Var.h(ygdVar) ? 32 : 16;
        }
        if ((i & 384) == 0) {
            i2 |= p65Var.h(m45Var) ? 256 : 128;
        }
        boolean z = false;
        if (p65Var.P(i2 & 1, (i2 & 147) != 146)) {
            boolean z2 = (i2 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32 || ((i2 & 64) != 0 && p65Var.f(ygdVar));
            Object objM = p65Var.M();
            uob uobVar = w12.a;
            if (z2 || objM == uobVar) {
                objM = new tg7(new olb(9, new gf2(ygdVar, 23, m45Var)));
                p65Var.j0(objM);
            }
            tg7 tg7Var = (tg7) objM;
            if ((i2 & 14) == 4 || ((i2 & 8) != 0 && p65Var.h(khdVar))) {
                z = true;
            }
            Object objM2 = p65Var.M();
            if (z || objM2 == uobVar) {
                objM2 = new nh2(5, khdVar);
                p65Var.j0(objM2);
            }
            tr.a(tg7Var, (m45) objM2, a, pxf.E(1315155414, new ag1(ygdVar, 11, khdVar), p65Var), p65Var, 3456, 0);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new ac(i, 13, khdVar, ygdVar, m45Var);
        }
    }

    public static final void d(r28 r28Var, mz1 mz1Var, x12 x12Var, int i) {
        int i2;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(1392105195);
        int i3 = 2;
        if ((i & 6) == 0) {
            i2 = (p65Var.f(r28Var) ? 4 : 2) | i;
        } else {
            i2 = i;
        }
        if ((i & 48) == 0) {
            i2 |= p65Var.h(mz1Var) ? 32 : 16;
        }
        if (p65Var.P(i2 & 1, (i2 & 19) != 18)) {
            gsa.z(r28Var, ihd.a, mz1Var, p65Var, ((i2 << 6) & 7168) | (i2 & 14) | 432);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new us(r28Var, mz1Var, i, i3);
        }
    }
}
