package defpackage;

import com.drew.metadata.exif.makernotes.PanasonicMakernoteDirectory;
import com.medium.android.core.navigation.ResponsesReference;
import com.medium.reader.R;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public abstract class xf1 {
    public static final void a(final vf1 vf1Var, final ek8 ek8Var, x12 x12Var, int i) {
        String str = vf1Var.d;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-1374670141);
        int i2 = (p65Var.f(vf1Var) ? 4 : 2) | i | (p65Var.f(ek8Var) ? 32 : 16);
        if (p65Var.P(i2 & 1, (i2 & 19) != 18)) {
            String str2 = vf1Var.e;
            boolean z = vf1Var.a;
            kx kxVarW = ho2.w(p65Var, 1791933639);
            String strA = af1.a(vf1Var.g, p65Var);
            String strQ = vo7.Q(R.string.notification_type_catalog_response_created, new Object[]{str, strA}, p65Var);
            sn3 sn3Var = kt7.b;
            int iH = kxVarW.h(new skc(((zo7) p65Var.j(sn3Var)).o, 0L, (d05) null, (zz4) null, (a05) null, (az4) null, (String) null, 0L, (lo0) null, (xid) null, (h67) null, 0L, (ohd) null, (i3c) null, 65534));
            try {
                kxVarW.d(strQ);
                kxVarW.f(iH);
                int iZ = muc.Z(strQ, str, 0, false, 6);
                kxVarW.b(new skc(((zo7) p65Var.j(sn3Var)).n, 0L, (d05) null, (zz4) null, (a05) null, (az4) null, (String) null, 0L, (lo0) null, (xid) null, (h67) null, 0L, (ohd) null, (i3c) null, 65534), iZ, str.length() + iZ);
                int iZ2 = muc.Z(strQ, strA, 0, false, 6);
                mx mxVarC = ka1.c(strA, iZ2, kxVarW, new skc(((zo7) p65Var.j(sn3Var)).n, 0L, (d05) null, (zz4) null, (a05) null, (az4) null, (String) null, 0L, (lo0) null, (xid) null, (h67) null, 0L, (ohd) null, (i3c) null, 65534), iZ2);
                p65Var.p(false);
                long j = vf1Var.b;
                Integer numValueOf = Integer.valueOf(R.drawable.ic_notifications_response);
                int i3 = i2 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION;
                int i4 = i2 & 14;
                boolean z2 = (i3 == 32) | (i4 == 4);
                Object objM = p65Var.M();
                uob uobVar = w12.a;
                if (z2 || objM == uobVar) {
                    objM = new m45() { // from class: wf1
                        @Override // defpackage.m45
                        public final Object invoke() {
                            int i5 = i;
                            c1e c1eVar = c1e.a;
                            vf1 vf1Var2 = vf1Var;
                            ek8 ek8Var2 = ek8Var;
                            switch (i5) {
                                case 0:
                                    ek8Var2.p(new ResponsesReference.Catalog(vf1Var2.f, vf1Var2.h), vf1Var2.i);
                                    break;
                                default:
                                    ek8Var2.k(vf1Var2.c, vf1Var2.i);
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
                    objM2 = new m45() { // from class: wf1
                        @Override // defpackage.m45
                        public final Object invoke() {
                            int i52 = i6;
                            c1e c1eVar = c1e.a;
                            vf1 vf1Var2 = vf1Var;
                            ek8 ek8Var2 = ek8Var;
                            switch (i52) {
                                case 0:
                                    ek8Var2.p(new ResponsesReference.Catalog(vf1Var2.f, vf1Var2.h), vf1Var2.i);
                                    break;
                                default:
                                    ek8Var2.k(vf1Var2.c, vf1Var2.i);
                                    break;
                            }
                            return c1eVar;
                        }
                    };
                    p65Var.j0(objM2);
                }
                rv8.f(z, str2, numValueOf, mxVarC, j, 0, m45Var, (m45) objM2, p65Var, 0, 32);
            } catch (Throwable th) {
                kxVarW.f(iH);
                throw th;
            }
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new r(vf1Var, ek8Var, i, 29);
        }
    }
}
