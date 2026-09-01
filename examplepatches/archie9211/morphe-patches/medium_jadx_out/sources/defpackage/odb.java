package defpackage;

import com.drew.metadata.exif.makernotes.PanasonicMakernoteDirectory;
import com.medium.android.core.navigation.ResponsesReference;
import com.medium.reader.R;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public abstract class odb {
    public static final void a(final mdb mdbVar, final ek8 ek8Var, x12 x12Var, int i) {
        int i2;
        final int i3;
        String str = mdbVar.g;
        String str2 = mdbVar.d;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(854455572);
        int i4 = (p65Var.f(mdbVar) ? 4 : 2) | i | (p65Var.f(ek8Var) ? 32 : 16);
        if (p65Var.P(i4 & 1, (i4 & 19) != 18)) {
            boolean z = mdbVar.a;
            String str3 = mdbVar.e;
            Integer numValueOf = Integer.valueOf(R.drawable.ic_notifications_response);
            kx kxVarW = ho2.w(p65Var, 793062618);
            final int i5 = 1;
            String strQ = vo7.Q(R.string.notification_type_response_created, new Object[]{str2, str}, p65Var);
            sn3 sn3Var = kt7.b;
            int iH = kxVarW.h(new skc(((zo7) p65Var.j(sn3Var)).o, 0L, (d05) null, (zz4) null, (a05) null, (az4) null, (String) null, 0L, (lo0) null, (xid) null, (h67) null, 0L, (ohd) null, (i3c) null, 65534));
            try {
                kxVarW.d(strQ);
                kxVarW.f(iH);
                int iZ = muc.Z(strQ, str2, 0, false, 6);
                kxVarW.b(new skc(((zo7) p65Var.j(sn3Var)).n, 0L, (d05) null, (zz4) null, (a05) null, (az4) null, (String) null, 0L, (lo0) null, (xid) null, (h67) null, 0L, (ohd) null, (i3c) null, 65534), iZ, str2.length() + iZ);
                int iZ2 = muc.Z(strQ, str, 0, false, 6);
                mx mxVarC = ka1.c(str, iZ2, kxVarW, new skc(((zo7) p65Var.j(sn3Var)).n, 0L, (d05) null, (zz4) null, (a05) null, (az4) null, (String) null, 0L, (lo0) null, (xid) null, (h67) null, 0L, (ohd) null, (i3c) null, 65534), iZ2);
                p65Var.p(false);
                mz1 mz1VarE = pxf.E(176245019, new nra(2, mdbVar), p65Var);
                int i6 = i4 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION;
                int i7 = i4 & 14;
                boolean z2 = (i7 == 4) | (i6 == 32);
                Object objM = p65Var.M();
                uob uobVar = w12.a;
                if (z2 || objM == uobVar) {
                    i3 = 0;
                    objM = new m45() { // from class: ndb
                        @Override // defpackage.m45
                        public final Object invoke() {
                            int i8 = i3;
                            c1e c1eVar = c1e.a;
                            mdb mdbVar2 = mdbVar;
                            ek8 ek8Var2 = ek8Var;
                            switch (i8) {
                                case 0:
                                    ek8Var2.p(new ResponsesReference.Post(mdbVar2.f, null, mdbVar2.h, null, null, 26, null), mdbVar2.j);
                                    break;
                                default:
                                    ek8Var2.k(mdbVar2.c, mdbVar2.j);
                                    break;
                            }
                            return c1eVar;
                        }
                    };
                    p65Var.j0(objM);
                } else {
                    i3 = 0;
                }
                m45 m45Var = (m45) objM;
                int i8 = i6 == 32 ? 1 : i3;
                if (i7 == 4) {
                    i3 = 1;
                }
                int i9 = i8 | i3;
                Object objM2 = p65Var.M();
                if (i9 != 0 || objM2 == uobVar) {
                    objM2 = new m45() { // from class: ndb
                        @Override // defpackage.m45
                        public final Object invoke() {
                            int i82 = i5;
                            c1e c1eVar = c1e.a;
                            mdb mdbVar2 = mdbVar;
                            ek8 ek8Var2 = ek8Var;
                            switch (i82) {
                                case 0:
                                    ek8Var2.p(new ResponsesReference.Post(mdbVar2.f, null, mdbVar2.h, null, null, 26, null), mdbVar2.j);
                                    break;
                                default:
                                    ek8Var2.k(mdbVar2.c, mdbVar2.j);
                                    break;
                            }
                            return c1eVar;
                        }
                    };
                    p65Var.j0(objM2);
                }
                i2 = 16;
                rv8.g(z, str3, numValueOf, mxVarC, mz1VarE, 0, m45Var, (m45) objM2, p65Var, 24576, 32);
            } catch (Throwable th) {
                kxVarW.f(iH);
                throw th;
            }
        } else {
            i2 = 16;
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new pma(mdbVar, ek8Var, i, i2);
        }
    }
}
