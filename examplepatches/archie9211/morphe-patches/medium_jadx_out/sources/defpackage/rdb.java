package defpackage;

import com.drew.metadata.exif.makernotes.PanasonicMakernoteDirectory;
import com.medium.android.core.navigation.ResponsesReference;
import com.medium.reader.R;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public abstract class rdb {
    public static final void a(final pdb pdbVar, final ek8 ek8Var, x12 x12Var, int i) {
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-1321894113);
        int i2 = (p65Var.f(pdbVar) ? 4 : 2) | i | (p65Var.f(ek8Var) ? 32 : 16);
        if (p65Var.P(i2 & 1, (i2 & 19) != 18)) {
            boolean z = pdbVar.a;
            String str = pdbVar.c;
            kx kxVarW = ho2.w(p65Var, 970103907);
            kxVarW.d(pdbVar.d);
            p65Var.Y(970106098);
            int iH = kxVarW.h(new skc(((zo7) p65Var.j(kt7.b)).o, 0L, (d05) null, (zz4) null, (a05) null, (az4) null, (String) null, 0L, (lo0) null, (xid) null, (h67) null, 0L, (ohd) null, (i3c) null, 65534));
            try {
                kxVarW.d(" ");
                kxVarW.d(vo7.R(p65Var, R.string.notification_type_response_created_rollup));
                kxVarW.f(iH);
                p65Var.p(false);
                mx mxVarI = kxVarW.i();
                p65Var.p(false);
                Integer numValueOf = Integer.valueOf(R.drawable.ic_notifications_response);
                mz1 mz1VarE = pxf.E(966479078, new nra(3, pdbVar), p65Var);
                int i3 = i2 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION;
                int i4 = i2 & 14;
                boolean z2 = (i3 == 32) | (i4 == 4);
                Object objM = p65Var.M();
                uob uobVar = w12.a;
                if (z2 || objM == uobVar) {
                    objM = new m45() { // from class: qdb
                        @Override // defpackage.m45
                        public final Object invoke() {
                            int i5 = i;
                            c1e c1eVar = c1e.a;
                            pdb pdbVar2 = pdbVar;
                            ek8 ek8Var2 = ek8Var;
                            switch (i5) {
                                case 0:
                                    ek8Var2.p(new ResponsesReference.Post(pdbVar2.e, null, pdbVar2.f, null, null, 26, null), pdbVar2.i);
                                    break;
                                default:
                                    ek8Var2.k(pdbVar2.b, pdbVar2.i);
                                    break;
                            }
                            return c1eVar;
                        }
                    };
                    p65Var.j0(objM);
                }
                m45 m45Var = (m45) objM;
                int i5 = (i3 == 32 ? 1 : 0) | (i4 == 4 ? 1 : 0);
                Object objM2 = p65Var.M();
                if (i5 != 0 || objM2 == uobVar) {
                    final int i6 = 1;
                    objM2 = new m45() { // from class: qdb
                        @Override // defpackage.m45
                        public final Object invoke() {
                            int i52 = i6;
                            c1e c1eVar = c1e.a;
                            pdb pdbVar2 = pdbVar;
                            ek8 ek8Var2 = ek8Var;
                            switch (i52) {
                                case 0:
                                    ek8Var2.p(new ResponsesReference.Post(pdbVar2.e, null, pdbVar2.f, null, null, 26, null), pdbVar2.i);
                                    break;
                                default:
                                    ek8Var2.k(pdbVar2.b, pdbVar2.i);
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
            mwaVarS.d = new pma(pdbVar, ek8Var, i, 17);
        }
    }
}
