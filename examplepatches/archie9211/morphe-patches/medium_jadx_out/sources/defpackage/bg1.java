package defpackage;

import com.drew.metadata.exif.makernotes.PanasonicMakernoteDirectory;
import com.medium.android.core.navigation.ResponsesReference;
import com.medium.reader.R;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public abstract class bg1 {
    public static final void a(final yf1 yf1Var, final ek8 ek8Var, x12 x12Var, int i) {
        p65 p65Var = (p65) x12Var;
        p65Var.a0(122984920);
        int i2 = (p65Var.f(yf1Var) ? 4 : 2) | i | (p65Var.f(ek8Var) ? 32 : 16);
        final int i3 = 0;
        if (p65Var.P(i2 & 1, (i2 & 19) != 18)) {
            boolean z = yf1Var.a;
            String str = yf1Var.c;
            kx kxVarW = ho2.w(p65Var, -2070548540);
            kxVarW.d(yf1Var.d);
            p65Var.Y(-2070546349);
            int iH = kxVarW.h(new skc(((zo7) p65Var.j(kt7.b)).o, 0L, (d05) null, (zz4) null, (a05) null, (az4) null, (String) null, 0L, (lo0) null, (xid) null, (h67) null, 0L, (ohd) null, (i3c) null, 65534));
            try {
                kxVarW.d(" ");
                kxVarW.d(vo7.R(p65Var, R.string.notification_type_catalog_response_created_rollup));
                kxVarW.f(iH);
                p65Var.p(false);
                mx mxVarI = kxVarW.i();
                p65Var.p(false);
                Integer numValueOf = Integer.valueOf(R.drawable.ic_notifications_response);
                mz1 mz1VarE = pxf.E(-931856783, new so1(7, yf1Var), p65Var);
                int i4 = i2 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION;
                int i5 = i2 & 14;
                boolean z2 = (i4 == 32) | (i5 == 4);
                Object objM = p65Var.M();
                uob uobVar = w12.a;
                if (z2 || objM == uobVar) {
                    objM = new m45() { // from class: zf1
                        @Override // defpackage.m45
                        public final Object invoke() {
                            int i6 = i3;
                            c1e c1eVar = c1e.a;
                            yf1 yf1Var2 = yf1Var;
                            ek8 ek8Var2 = ek8Var;
                            switch (i6) {
                                case 0:
                                    ek8Var2.p(new ResponsesReference.Catalog(yf1Var2.e, yf1Var2.f), yf1Var2.h);
                                    break;
                                default:
                                    ek8Var2.k(yf1Var2.b, yf1Var2.h);
                                    break;
                            }
                            return c1eVar;
                        }
                    };
                    p65Var.j0(objM);
                }
                m45 m45Var = (m45) objM;
                boolean z3 = (i5 == 4) | (i4 == 32);
                Object objM2 = p65Var.M();
                if (z3 || objM2 == uobVar) {
                    final int i6 = 1;
                    objM2 = new m45() { // from class: zf1
                        @Override // defpackage.m45
                        public final Object invoke() {
                            int i62 = i6;
                            c1e c1eVar = c1e.a;
                            yf1 yf1Var2 = yf1Var;
                            ek8 ek8Var2 = ek8Var;
                            switch (i62) {
                                case 0:
                                    ek8Var2.p(new ResponsesReference.Catalog(yf1Var2.e, yf1Var2.f), yf1Var2.h);
                                    break;
                                default:
                                    ek8Var2.k(yf1Var2.b, yf1Var2.h);
                                    break;
                            }
                            return c1eVar;
                        }
                    };
                    p65Var.j0(objM2);
                }
                rv8.g(z, str, numValueOf, mxVarI, mz1VarE, 2, m45Var, (m45) objM2, p65Var, 221184, 0);
            } catch (Throwable th) {
                kxVarW.f(iH);
                throw th;
            }
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new ag1(yf1Var, ek8Var, i, 0);
        }
    }
}
