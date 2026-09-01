package defpackage;

import android.content.Context;
import android.content.res.Resources;
import android.net.Uri;
import android.os.Bundle;
import android.os.ParcelFileDescriptor;
import android.os.Parcelable;
import android.view.View;
import com.drew.lang.RandomAccessStreamReader;
import com.drew.metadata.exif.makernotes.OlympusMakernoteDirectory;
import com.drew.metadata.exif.makernotes.PanasonicMakernoteDirectory;
import com.drew.metadata.exif.makernotes.ReconyxHyperFire2MakernoteDirectory;
import com.drew.metadata.exif.makernotes.ReconyxUltraFireMakernoteDirectory;
import com.facebook.FacebookException;
import com.medium.android.graphql.fragment.TagData;
import com.medium.android.graphql.type.PublicationSubmissionStatus;
import com.medium.android.postpublishing.ui.TopicData;
import com.medium.reader.R;
import com.squareup.wire.WireEnum;
import com.squareup.wire.WireField;
import gen.model.SourceParameter;
import java.io.File;
import java.io.IOException;
import java.io.Serializable;
import java.lang.ref.WeakReference;
import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.concurrent.Callable;
import java.util.concurrent.CopyOnWriteArraySet;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.regex.Pattern;
import java.util.zip.GZIPInputStream;
import java.util.zip.ZipInputStream;
import org.json.JSONObject;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public abstract class gp7 {
    public static final /* synthetic */ int a = 0;
    public static final /* synthetic */ int b = 0;
    public static final /* synthetic */ int c = 0;
    public static final /* synthetic */ int d = 0;
    public static final /* synthetic */ int e = 0;
    public static final /* synthetic */ int f = 0;

    public static final void a(x12 x12Var, int i) {
        p65 p65Var = (p65) x12Var;
        p65Var.a0(1444947183);
        if (p65Var.P(i & 1, i != 0)) {
            Object objM = p65Var.M();
            uob uobVar = w12.a;
            if (objM == uobVar) {
                objM = qo7.u(Boolean.FALSE);
                p65Var.j0(objM);
            }
            l78 l78Var = (l78) objM;
            wv1 wv1VarA = uv1.a(qb8.c, z46.p, p65Var, 0);
            long j = p65Var.T;
            int i2 = (int) (j ^ (j >>> 32));
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
            tp7.B(p65Var, q12.f, wv1VarA);
            tp7.B(p65Var, q12.e, i89VarL);
            tp7.B(p65Var, q12.g, Integer.valueOf(i2));
            tp7.y(p65Var, q12.h);
            tp7.B(p65Var, q12.d, r28VarR);
            Object objM2 = p65Var.M();
            if (objM2 == uobVar) {
                objM2 = new ei4(l78Var, 14);
                p65Var.j0(objM2);
            }
            fo7.r((m45) objM2, "Show dialog", xn7.M, null, false, p65Var, 438, 24);
            p65Var.p(true);
            if (((Boolean) l78Var.getValue()).booleanValue()) {
                p65Var.Y(-2035356033);
                Object objM3 = p65Var.M();
                if (objM3 == uobVar) {
                    objM3 = new ei4(l78Var, 15);
                    p65Var.j0(objM3);
                }
                b((m45) objM3, p65Var, 54);
            } else {
                p65Var.Y(-2036530189);
            }
            p65Var.p(false);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new wn7(i, 8);
        }
    }

    public static final void b(m45 m45Var, x12 x12Var, int i) {
        m45 m45Var2;
        m45Var.getClass();
        p65 p65Var = (p65) x12Var;
        p65Var.a0(1197201848);
        if (p65Var.P(i & 1, (i & 19) != 18)) {
            m45Var2 = m45Var;
            m40.h(m45Var2, null, pxf.E(728199439, new wn7(7), p65Var), p65Var, 390, 2);
        } else {
            m45Var2 = m45Var;
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new c60(i, 11, m45Var2);
        }
    }

    public static final void c(pq9 pq9Var, rq9 rq9Var, String str, boolean z, SourceParameter sourceParameter, b55 b55Var, b55 b55Var2, r28 r28Var, PublicationSubmissionStatus publicationSubmissionStatus, x12 x12Var, int i, int i2) {
        PublicationSubmissionStatus publicationSubmissionStatus2;
        boolean z2;
        boolean z3;
        sourceParameter.getClass();
        b55Var.getClass();
        b55Var2.getClass();
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-1050540026);
        int i3 = i | (p65Var.f(pq9Var) ? 4 : 2) | (p65Var.f(rq9Var) ? 32 : 16) | (p65Var.f(str) ? 256 : 128) | (p65Var.g(z) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024) | (p65Var.f(sourceParameter) ? OlympusMakernoteDirectory.TAG_MAIN_INFO : 8192) | (p65Var.h(b55Var) ? 131072 : ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID) | (p65Var.h(b55Var2) ? 1048576 : 524288);
        if ((i & 12582912) == 0) {
            i3 |= p65Var.f(r28Var) ? 8388608 : 4194304;
        }
        int i4 = i2 & 256;
        int i5 = i3 | (i4 != 0 ? 100663296 : p65Var.d(publicationSubmissionStatus == null ? -1 : publicationSubmissionStatus.ordinal()) ? 67108864 : 33554432);
        if (p65Var.P(i5 & 1, (38347923 & i5) != 38347922)) {
            PublicationSubmissionStatus publicationSubmissionStatus3 = i4 != 0 ? null : publicationSubmissionStatus;
            omb ombVarA = nmb.a(qb8.a, z46.n, p65Var, 48);
            long j = p65Var.T;
            int i6 = (int) (j ^ (j >>> 32));
            i89 i89VarL = p65Var.l();
            r28 r28VarR = gx1.R(p65Var, r28Var);
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
            tp7.B(p65Var, q12.g, Integer.valueOf(i6));
            tp7.y(p65Var, q12.h);
            tp7.B(p65Var, q12.d, r28VarR);
            sq6 sq6Var = new sq6(1.0f, false);
            int i7 = i5 & ReconyxHyperFire2MakernoteDirectory.TAG_SERIAL_NUMBER;
            int i8 = i5 >> 3;
            vc2.e(pq9Var, rq9Var, z, sourceParameter, b55Var, b55Var2, sq6Var, publicationSubmissionStatus3, p65Var, i7 | (i8 & 896) | (i8 & 7168) | (57344 & i8) | (458752 & i8) | (i8 & 29360128), 0);
            if (str != null) {
                p65Var.Y(-1245685581);
                StringBuilder sb = new StringBuilder(16);
                ArrayList arrayListV = wgd.v();
                new ArrayList();
                if (pq9Var.e || (rq9Var != null && rq9Var.d)) {
                    sb.append(" ·  ");
                }
                sb.append(str);
                String string = sb.toString();
                ArrayList arrayList = new ArrayList(arrayListV.size());
                for (int i9 = 0; i9 < arrayListV.size(); i9 = lv8.i(sb, (jx) arrayListV.get(i9), arrayList, i9, 1)) {
                }
                mx mxVar = new mx(string, arrayList);
                z2 = false;
                z3 = true;
                jjd.c(mxVar, w2g.G(w2g.i(o28.b, z ? 0.5f : 1.0f), 0.0f, 0.0f, 2.0f, 0.0f, 11), 0L, 0L, 0L, null, 0L, 2, false, 1, 0, null, null, mkd.a(((bu7) p65Var.j(jt7.c)).n, ((zo7) p65Var.j(kt7.b)).o, 0L, null, null, null, 0L, 0L, null, 0, 0L, null, null, 16777214), p65Var, 0, 24960, 241660);
            } else {
                z2 = false;
                z3 = true;
                p65Var.Y(-1247596328);
            }
            p65Var.p(z2);
            p65Var.p(z3);
            publicationSubmissionStatus2 = publicationSubmissionStatus3;
        } else {
            p65Var.S();
            publicationSubmissionStatus2 = publicationSubmissionStatus;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new ar6(pq9Var, rq9Var, str, z, sourceParameter, b55Var, b55Var2, r28Var, publicationSubmissionStatus2, i, i2);
        }
    }

    public static final void d(int i, int i2, x12 x12Var, r28 r28Var) {
        r28 r28Var2;
        int i3;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(1659960174);
        int i4 = i2 & 1;
        if (i4 != 0) {
            i3 = i | 6;
            r28Var2 = r28Var;
        } else {
            r28Var2 = r28Var;
            i3 = i | (p65Var.f(r28Var2) ? 4 : 2);
        }
        if (p65Var.P(i3 & 1, (i3 & 3) != 2)) {
            o28 o28Var = o28.b;
            if (i4 != 0) {
                r28Var2 = o28Var;
            }
            long j = ((zo7) p65Var.j(kt7.b)).o;
            amb ambVarA = bmb.a(2.0f);
            r28 r28VarF = w2g.F(jfc.d(r28Var2, 1.0f), 24.0f, 26.0f, 24.0f, 24.0f);
            rz5 rz5Var = qb8.c;
            yq0 yq0Var = z46.p;
            wv1 wv1VarA = uv1.a(rz5Var, yq0Var, p65Var, 0);
            r28 r28Var3 = r28Var2;
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
            cu cuVar = q12.f;
            tp7.B(p65Var, cuVar, wv1VarA);
            cu cuVar2 = q12.e;
            tp7.B(p65Var, cuVar2, i89VarL);
            Integer numValueOf = Integer.valueOf(i5);
            cu cuVar3 = q12.g;
            tp7.B(p65Var, cuVar3, numValueOf);
            fn fnVar = q12.h;
            tp7.y(p65Var, fnVar);
            cu cuVar4 = q12.d;
            tp7.B(p65Var, cuVar4, r28VarR);
            r28 r28VarD = jfc.d(o28Var, 1.0f);
            zq0 zq0Var = z46.n;
            fa4 fa4Var = qb8.a;
            omb ombVarA = nmb.a(fa4Var, zq0Var, p65Var, 48);
            long j3 = p65Var.T;
            int i6 = (int) (j3 ^ (j3 >>> 32));
            i89 i89VarL2 = p65Var.l();
            r28 r28VarR2 = gx1.R(p65Var, r28VarD);
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, cuVar, ombVarA);
            tp7.B(p65Var, cuVar2, i89VarL2);
            ka1.z(i6, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR2);
            dy0.a(flb.a0(jfc.e(jfc.p(o28Var, 32.0f), 32.0f), j, bmb.a), p65Var, 0);
            r28 r28VarE = w2g.E(o28Var, 12.0f, 0.0f, 2);
            wv1 wv1VarA2 = uv1.a(rz5Var, yq0Var, p65Var, 0);
            long j4 = p65Var.T;
            int i7 = (int) (j4 ^ (j4 >>> 32));
            i89 i89VarL3 = p65Var.l();
            r28 r28VarR3 = gx1.R(p65Var, r28VarE);
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, cuVar, wv1VarA2);
            tp7.B(p65Var, cuVar2, i89VarL3);
            ka1.z(i7, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR3);
            dy0.a(flb.a0(jfc.e(jfc.p(o28Var, 300.0f), 16.0f), j, ambVarA), p65Var, 0);
            hp7.t(p65Var, jfc.l(o28Var, 4.0f));
            dy0.a(flb.a0(jfc.e(jfc.p(o28Var, 100.0f), 12.0f), j, ambVarA), p65Var, 0);
            p65Var.p(true);
            p65Var.p(true);
            hp7.t(p65Var, jfc.l(o28Var, 24.0f));
            dy0.a(flb.a0(jfc.e(jfc.d(o28Var, 1.0f), 16.0f), j, ambVarA), p65Var, 0);
            hp7.t(p65Var, jfc.l(o28Var, 8.0f));
            dy0.a(flb.a0(jfc.e(jfc.d(o28Var, 1.0f), 16.0f), j, ambVarA), p65Var, 0);
            hp7.t(p65Var, jfc.l(o28Var, 8.0f));
            dy0.a(flb.a0(jfc.e(jfc.d(o28Var, 0.93f), 16.0f), j, ambVarA), p65Var, 0);
            hp7.t(p65Var, jfc.l(o28Var, 16.0f));
            r28 r28VarD2 = jfc.d(o28Var, 1.0f);
            omb ombVarA2 = nmb.a(fa4Var, z46.m, p65Var, 0);
            long j5 = p65Var.T;
            int i8 = (int) (j5 ^ (j5 >>> 32));
            i89 i89VarL4 = p65Var.l();
            r28 r28VarR4 = gx1.R(p65Var, r28VarD2);
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, cuVar, ombVarA2);
            tp7.B(p65Var, cuVar2, i89VarL4);
            ka1.z(i8, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR4);
            dy0.a(flb.a0(jfc.e(jfc.p(o28Var, 48.0f), 22.0f), j, ambVarA), p65Var, 0);
            hp7.t(p65Var, jfc.l(o28Var, 16.0f));
            dy0.a(flb.a0(jfc.e(jfc.p(o28Var, 48.0f), 22.0f), j, ambVarA), p65Var, 0);
            p65Var.p(true);
            p65Var.p(true);
            r28Var2 = r28Var3;
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new bc(r28Var2, i, i2, 13);
        }
    }

    public static final void e(final zne zneVar, final ek8 ek8Var, x12 x12Var, int i) {
        String strD = zneVar.f;
        int i2 = zneVar.g;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-297765829);
        int i3 = (p65Var.f(zneVar) ? 4 : 2) | i | (p65Var.f(ek8Var) ? 32 : 16);
        if (p65Var.P(i3 & 1, (i3 & 19) != 18)) {
            String str = zneVar.d;
            boolean z = zneVar.a;
            kx kxVarW = ho2.w(p65Var, 1609859206);
            if (i2 == 1) {
                p65Var.Y(737785254);
                p65Var.p(false);
            } else {
                p65Var.Y(737786718);
                int i4 = i2 - 1;
                strD = vo7.D(R.plurals.notification_rollup_plus, i4, new Object[]{strD, Integer.valueOf(i4)}, p65Var);
                p65Var.p(false);
            }
            String strQ = vo7.Q(R.string.notification_type_users_following_you, new Object[]{strD}, p65Var);
            sn3 sn3Var = kt7.b;
            int iH = kxVarW.h(new skc(((zo7) p65Var.j(sn3Var)).o, 0L, (d05) null, (zz4) null, (a05) null, (az4) null, (String) null, 0L, (lo0) null, (xid) null, (h67) null, 0L, (ohd) null, (i3c) null, 65534));
            try {
                kxVarW.d(strQ);
                kxVarW.f(iH);
                int iZ = muc.Z(strD, strD, 0, false, 6);
                mx mxVarC = ka1.c(strD, iZ, kxVarW, new skc(((zo7) p65Var.j(sn3Var)).n, 0L, (d05) null, (zz4) null, (a05) null, (az4) null, (String) null, 0L, (lo0) null, (xid) null, (h67) null, 0L, (ohd) null, (i3c) null, 65534), iZ);
                p65Var.p(false);
                long j = zneVar.b;
                Integer numValueOf = Integer.valueOf(R.drawable.ic_notifications_follow);
                int i5 = i3 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION;
                int i6 = i3 & 14;
                boolean z2 = (i5 == 32) | (i6 == 4);
                Object objM = p65Var.M();
                uob uobVar = w12.a;
                if (z2 || objM == uobVar) {
                    objM = new m45() { // from class: aoe
                        @Override // defpackage.m45
                        public final Object invoke() {
                            int i7 = i;
                            c1e c1eVar = c1e.a;
                            zne zneVar2 = zneVar;
                            ek8 ek8Var2 = ek8Var;
                            switch (i7) {
                                case 0:
                                    ek8Var2.n(zneVar2.c, zneVar2.h);
                                    break;
                                default:
                                    ek8Var2.k(zneVar2.e, zneVar2.h);
                                    break;
                            }
                            return c1eVar;
                        }
                    };
                    p65Var.j0(objM);
                }
                m45 m45Var = (m45) objM;
                int i7 = (i5 == 32 ? 1 : 0) | (i6 == 4 ? 1 : 0);
                Object objM2 = p65Var.M();
                if (i7 != 0 || objM2 == uobVar) {
                    final int i8 = 1;
                    objM2 = new m45() { // from class: aoe
                        @Override // defpackage.m45
                        public final Object invoke() {
                            int i72 = i8;
                            c1e c1eVar = c1e.a;
                            zne zneVar2 = zneVar;
                            ek8 ek8Var2 = ek8Var;
                            switch (i72) {
                                case 0:
                                    ek8Var2.n(zneVar2.c, zneVar2.h);
                                    break;
                                default:
                                    ek8Var2.k(zneVar2.e, zneVar2.h);
                                    break;
                            }
                            return c1eVar;
                        }
                    };
                    p65Var.j0(objM2);
                }
                rv8.f(z, str, numValueOf, mxVarC, j, 0, m45Var, (m45) objM2, p65Var, 0, 32);
            } catch (Throwable th) {
                kxVarW.f(iH);
                throw th;
            }
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new l6c(zneVar, ek8Var, i, 29);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:41:0x0087 A[RETURN] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final boolean f(defpackage.es4 r9, defpackage.vt r10) {
        /*
            zr4 r0 = r9.N0()
            int[] r1 = defpackage.rt8.a
            int r0 = r0.ordinal()
            r0 = r1[r0]
            r2 = 4
            r3 = 3
            r4 = 0
            r5 = 2
            r6 = 1
            if (r0 == r6) goto L3f
            if (r0 == r5) goto L3a
            if (r0 == r3) goto L3a
            if (r0 != r2) goto L36
            boolean r0 = q(r9, r10)
            if (r0 != 0) goto L88
            qr4 r0 = r9.K0()
            boolean r0 = r0.a
            if (r0 == 0) goto L32
            java.lang.Object r9 = r10.invoke(r9)
            java.lang.Boolean r9 = (java.lang.Boolean) r9
            boolean r9 = r9.booleanValue()
            goto L33
        L32:
            r9 = r4
        L33:
            if (r9 == 0) goto L87
            goto L88
        L36:
            defpackage.ygf.a()
            return r4
        L3a:
            boolean r9 = q(r9, r10)
            return r9
        L3f:
            es4 r0 = defpackage.rx0.O(r9)
            java.lang.String r7 = "ActiveParent must have a focusedChild"
            if (r0 == 0) goto L89
            zr4 r8 = r0.N0()
            int r8 = r8.ordinal()
            r1 = r1[r8]
            if (r1 == r6) goto L66
            if (r1 == r5) goto L61
            if (r1 == r3) goto L61
            if (r1 == r2) goto L5d
            defpackage.ygf.a()
            return r4
        L5d:
            defpackage.ygf.f(r7)
            return r4
        L61:
            boolean r9 = j(r9, r0, r5, r10)
            return r9
        L66:
            boolean r1 = f(r0, r10)
            if (r1 != 0) goto L88
            boolean r9 = j(r9, r0, r5, r10)
            if (r9 != 0) goto L88
            qr4 r9 = r0.K0()
            boolean r9 = r9.a
            if (r9 == 0) goto L87
            java.lang.Object r9 = r10.invoke(r0)
            java.lang.Boolean r9 = (java.lang.Boolean) r9
            boolean r9 = r9.booleanValue()
            if (r9 == 0) goto L87
            goto L88
        L87:
            return r4
        L88:
            return r6
        L89:
            defpackage.ygf.f(r7)
            return r4
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.gp7.f(es4, vt):boolean");
    }

    public static void g(JSONObject jSONObject) {
        Iterator<String> itKeys = jSONObject.keys();
        while (itKeys.hasNext()) {
            String next = itKeys.next();
            JSONObject jSONObjectOptJSONObject = jSONObject.optJSONObject(next);
            if (jSONObjectOptJSONObject != null) {
                String strOptString = jSONObjectOptJSONObject.optString("k");
                String strOptString2 = jSONObjectOptJSONObject.optString("v");
                strOptString.getClass();
                if (strOptString.length() != 0) {
                    CopyOnWriteArraySet copyOnWriteArraySetA = yz7.a();
                    next.getClass();
                    List listP0 = muc.p0(strOptString, new String[]{","}, 0, 6);
                    strOptString2.getClass();
                    copyOnWriteArraySetA.add(new yz7(next, listP0, strOptString2));
                }
            }
        }
    }

    public static final boolean h(es4 es4Var, vt vtVar) {
        int i = rt8.a[es4Var.N0().ordinal()];
        if (i == 1) {
            es4 es4VarO = rx0.O(es4Var);
            if (es4VarO != null) {
                return h(es4VarO, vtVar) || j(es4Var, es4VarO, 1, vtVar);
            }
            ygf.f("ActiveParent must have a focusedChild");
            return false;
        }
        if (i == 2 || i == 3) {
            return r(es4Var, vtVar);
        }
        if (i == 4) {
            return es4Var.K0().a ? ((Boolean) vtVar.invoke(es4Var)).booleanValue() : r(es4Var, vtVar);
        }
        ygf.a();
        return false;
    }

    public static wb8 i(String str, String str2) {
        boolean zEquals = "integer".equals(str);
        ot0 ot0Var = wb8.o;
        wb8 wb8Var = zEquals ? wb8.b : "integer[]".equals(str) ? wb8.d : "List<Int>".equals(str) ? wb8.e : "long".equals(str) ? wb8.f : "long[]".equals(str) ? wb8.g : "List<Long>".equals(str) ? wb8.h : "boolean".equals(str) ? wb8.l : "boolean[]".equals(str) ? wb8.m : "List<Boolean>".equals(str) ? wb8.n : "string".equals(str) ? ot0Var : "string[]".equals(str) ? wb8.p : "List<String>".equals(str) ? wb8.q : "float".equals(str) ? wb8.i : "float[]".equals(str) ? wb8.j : "List<Float>".equals(str) ? wb8.k : null;
        if (wb8Var != null) {
            return wb8Var;
        }
        if ("reference".equals(str)) {
            return wb8.c;
        }
        if (str.length() == 0) {
            return ot0Var;
        }
        try {
            String strConcat = (!tuc.N(str, ".", false) || str2 == null) ? str : str2.concat(str);
            boolean zF = tuc.F(str, "[]", false);
            if (zF) {
                strConcat = strConcat.substring(0, strConcat.length() - 2);
            }
            wb8 wb8VarP = p(Class.forName(strConcat), zF);
            if (wb8VarP != null) {
                return wb8VarP;
            }
            throw new IllegalArgumentException(strConcat.concat(" is not Serializable or Parcelable.").toString());
        } catch (ClassNotFoundException e2) {
            ik4.j(e2);
            return null;
        }
    }

    public static final boolean j(es4 es4Var, es4 es4Var2, int i, vt vtVar) {
        if (t(es4Var, es4Var2, i, vtVar)) {
            return true;
        }
        Boolean bool = (Boolean) kyd.g0(es4Var, i, new st8(((or4) ((mn) flb.w0(es4Var)).getFocusOwner()).f(), es4Var, es4Var2, i, vtVar, 0));
        if (bool != null) {
            return bool.booleanValue();
        }
        return false;
    }

    public static final hpb k(View view) {
        view.getClass();
        while (view != null) {
            Object tag = view.getTag(R.id.view_tree_saved_state_registry_owner);
            hpb hpbVar = tag instanceof hpb ? (hpb) tag : null;
            if (hpbVar != null) {
                return hpbVar;
            }
            Object objU = ep7.u(view);
            view = objU instanceof View ? (View) objU : null;
        }
        return null;
    }

    /* JADX WARN: Removed duplicated region for block: B:36:0x00f9  */
    /* JADX WARN: Removed duplicated region for block: B:41:0x011e A[RETURN] */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0017  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final java.lang.Object l(android.content.Context r16, defpackage.jc7 r17, java.lang.String r18, java.lang.String r19, java.lang.String r20, java.lang.String r21, defpackage.p92 r22) throws java.lang.Throwable {
        /*
            Method dump skipped, instruction units count: 287
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.gp7.l(android.content.Context, jc7, java.lang.String, java.lang.String, java.lang.String, java.lang.String, p92):java.lang.Object");
    }

    public static final xc7 m(Context context, jc7 jc7Var, final String str) {
        xc7 xc7Var;
        if (!(jc7Var instanceof jc7)) {
            ygf.a();
            return null;
        }
        final int i = 1;
        final int i2 = 0;
        if (g76.L(str, "__LottieInternalDefaultCacheKey__")) {
            final int i3 = jc7Var.a;
            HashMap map = fc7.a;
            final String strA = b09.A(new StringBuilder("rawRes"), i3, (context.getResources().getConfiguration().uiMode & 48) == 32 ? "_night_" : "_day_");
            final WeakReference weakReference = new WeakReference(context);
            final Context applicationContext = context.getApplicationContext();
            Callable callable = new Callable() { // from class: dc7
                @Override // java.util.concurrent.Callable
                public final Object call() {
                    int i4 = i3;
                    Context context2 = (Context) weakReference.get();
                    if (context2 == null) {
                        context2 = applicationContext;
                    }
                    String str2 = strA;
                    bc7 bc7VarA = str2 == null ? null : cc7.b.a(str2);
                    if (bc7VarA != null) {
                        return new vc7(bc7VarA);
                    }
                    try {
                        yua yuaVar = new yua(vo7.N(context2.getResources().openRawResource(i4)));
                        int i5 = 1;
                        if (fc7.c(yuaVar, fc7.c).booleanValue()) {
                            ZipInputStream zipInputStream = new ZipInputStream(new iz0(yuaVar, i5));
                            try {
                                return fc7.b(context2, zipInputStream, str2);
                            } finally {
                                gpe.b(zipInputStream);
                            }
                        }
                        if (!fc7.c(yuaVar, fc7.d).booleanValue()) {
                            String[] strArr = id6.e;
                            return fc7.a(new td6(yuaVar), str2, true);
                        }
                        try {
                            yua yuaVar2 = new yua(vo7.N(new GZIPInputStream(new iz0(yuaVar, i5))));
                            String[] strArr2 = id6.e;
                            return fc7.a(new td6(yuaVar2), str2, true);
                        } catch (IOException e2) {
                            return new vc7(e2);
                        }
                    } catch (Resources.NotFoundException e3) {
                        return new vc7(e3);
                    }
                    return new vc7(e3);
                }
            };
            HashMap map2 = fc7.a;
            bc7 bc7VarA = cc7.b.a(strA);
            xc7Var = bc7VarA != null ? new xc7(bc7VarA) : null;
            if (map2.containsKey(strA)) {
                xc7Var = (xc7) map2.get(strA);
            }
            if (xc7Var != null) {
                return xc7Var;
            }
            xc7 xc7Var2 = new xc7(callable);
            final AtomicBoolean atomicBoolean = new AtomicBoolean(false);
            xc7Var2.b(new uc7() { // from class: ec7
                @Override // defpackage.uc7
                public final void onResult(Object obj) {
                    int i4 = i2;
                    AtomicBoolean atomicBoolean2 = atomicBoolean;
                    String str2 = strA;
                    switch (i4) {
                        case 0:
                            HashMap map3 = fc7.a;
                            map3.remove(str2);
                            atomicBoolean2.set(true);
                            if (map3.size() == 0) {
                                fc7.d();
                            }
                            break;
                        default:
                            HashMap map4 = fc7.a;
                            map4.remove(str2);
                            atomicBoolean2.set(true);
                            if (map4.size() == 0) {
                                fc7.d();
                            }
                            break;
                    }
                }
            });
            xc7Var2.a(new uc7() { // from class: ec7
                @Override // defpackage.uc7
                public final void onResult(Object obj) {
                    int i4 = i;
                    AtomicBoolean atomicBoolean2 = atomicBoolean;
                    String str2 = strA;
                    switch (i4) {
                        case 0:
                            HashMap map3 = fc7.a;
                            map3.remove(str2);
                            atomicBoolean2.set(true);
                            if (map3.size() == 0) {
                                fc7.d();
                            }
                            break;
                        default:
                            HashMap map4 = fc7.a;
                            map4.remove(str2);
                            atomicBoolean2.set(true);
                            if (map4.size() == 0) {
                                fc7.d();
                            }
                            break;
                    }
                }
            });
            if (!atomicBoolean.get()) {
                map2.put(strA, xc7Var2);
                if (map2.size() == 1) {
                    fc7.d();
                }
            }
            return xc7Var2;
        }
        final int i4 = jc7Var.a;
        HashMap map3 = fc7.a;
        final WeakReference weakReference2 = new WeakReference(context);
        final Context applicationContext2 = context.getApplicationContext();
        Callable callable2 = new Callable() { // from class: dc7
            @Override // java.util.concurrent.Callable
            public final Object call() {
                int i42 = i4;
                Context context2 = (Context) weakReference2.get();
                if (context2 == null) {
                    context2 = applicationContext2;
                }
                String str2 = str;
                bc7 bc7VarA2 = str2 == null ? null : cc7.b.a(str2);
                if (bc7VarA2 != null) {
                    return new vc7(bc7VarA2);
                }
                try {
                    yua yuaVar = new yua(vo7.N(context2.getResources().openRawResource(i42)));
                    int i5 = 1;
                    if (fc7.c(yuaVar, fc7.c).booleanValue()) {
                        ZipInputStream zipInputStream = new ZipInputStream(new iz0(yuaVar, i5));
                        try {
                            return fc7.b(context2, zipInputStream, str2);
                        } finally {
                            gpe.b(zipInputStream);
                        }
                    }
                    if (!fc7.c(yuaVar, fc7.d).booleanValue()) {
                        String[] strArr = id6.e;
                        return fc7.a(new td6(yuaVar), str2, true);
                    }
                    try {
                        yua yuaVar2 = new yua(vo7.N(new GZIPInputStream(new iz0(yuaVar, i5))));
                        String[] strArr2 = id6.e;
                        return fc7.a(new td6(yuaVar2), str2, true);
                    } catch (IOException e2) {
                        return new vc7(e2);
                    }
                } catch (Resources.NotFoundException e3) {
                    return new vc7(e3);
                }
                return new vc7(e3);
            }
        };
        HashMap map4 = fc7.a;
        bc7 bc7VarA2 = str == null ? null : cc7.b.a(str);
        xc7Var = bc7VarA2 != null ? new xc7(bc7VarA2) : null;
        if (str != null && map4.containsKey(str)) {
            xc7Var = (xc7) map4.get(str);
        }
        if (xc7Var != null) {
            return xc7Var;
        }
        xc7 xc7Var3 = new xc7(callable2);
        if (str != null) {
            final AtomicBoolean atomicBoolean2 = new AtomicBoolean(false);
            xc7Var3.b(new uc7() { // from class: ec7
                @Override // defpackage.uc7
                public final void onResult(Object obj) {
                    int i42 = i2;
                    AtomicBoolean atomicBoolean22 = atomicBoolean2;
                    String str2 = str;
                    switch (i42) {
                        case 0:
                            HashMap map32 = fc7.a;
                            map32.remove(str2);
                            atomicBoolean22.set(true);
                            if (map32.size() == 0) {
                                fc7.d();
                            }
                            break;
                        default:
                            HashMap map42 = fc7.a;
                            map42.remove(str2);
                            atomicBoolean22.set(true);
                            if (map42.size() == 0) {
                                fc7.d();
                            }
                            break;
                    }
                }
            });
            xc7Var3.a(new uc7() { // from class: ec7
                @Override // defpackage.uc7
                public final void onResult(Object obj) {
                    int i42 = i;
                    AtomicBoolean atomicBoolean22 = atomicBoolean2;
                    String str2 = str;
                    switch (i42) {
                        case 0:
                            HashMap map32 = fc7.a;
                            map32.remove(str2);
                            atomicBoolean22.set(true);
                            if (map32.size() == 0) {
                                fc7.d();
                            }
                            break;
                        default:
                            HashMap map42 = fc7.a;
                            map42.remove(str2);
                            atomicBoolean22.set(true);
                            if (map42.size() == 0) {
                                fc7.d();
                            }
                            break;
                    }
                }
            });
            if (!atomicBoolean2.get()) {
                map4.put(str, xc7Var3);
                if (map4.size() == 1) {
                    fc7.d();
                }
            }
        }
        return xc7Var3;
    }

    public static final ArrayList n(List list) {
        list.getClass();
        ArrayList arrayList = new ArrayList();
        Iterator it2 = list.iterator();
        while (it2.hasNext()) {
            TagData tagData = (TagData) it2.next();
            String id = tagData.getId();
            Integer followerCount = tagData.getFollowerCount();
            TopicData topicData = null;
            if (followerCount != null) {
                int iIntValue = followerCount.intValue();
                String displayTitle = tagData.getDisplayTitle();
                if (displayTitle != null) {
                    topicData = new TopicData(id, iIntValue, displayTitle);
                }
            }
            if (topicData != null) {
                arrayList.add(topicData);
            }
        }
        return arrayList;
    }

    public static final ff5 o(w3 w3Var, Uri uri, j1f j1fVar) {
        String path = uri.getPath();
        if ("file".equalsIgnoreCase(uri.getScheme()) && path != null) {
            df5 df5Var = new df5(ParcelFileDescriptor.open(new File(path), 268435456));
            Bundle bundle = new Bundle(1);
            bundle.putParcelable("file", df5Var);
            return new ff5(w3Var, "me/staging_resources", bundle, dt5.POST, j1fVar);
        }
        if (!"content".equalsIgnoreCase(uri.getScheme())) {
            throw new FacebookException("The image Uri must be either a file:// or content:// Uri");
        }
        df5 df5Var2 = new df5(uri);
        Bundle bundle2 = new Bundle(1);
        bundle2.putParcelable("file", df5Var2);
        return new ff5(w3Var, "me/staging_resources", bundle2, dt5.POST, j1fVar);
    }

    public static wb8 p(Class cls, boolean z) {
        if (Parcelable.class.isAssignableFrom(cls)) {
            return z ? new sb8(cls) : new tb8(cls);
        }
        if (Enum.class.isAssignableFrom(cls) && !z) {
            return new rb8(cls);
        }
        if (Serializable.class.isAssignableFrom(cls)) {
            return z ? new ub8(cls) : new vb8(cls);
        }
        return null;
    }

    public static final boolean q(es4 es4Var, vt vtVar) {
        Object[] objArr = new es4[16];
        if (!es4Var.a.n) {
            b26.b("visitChildren called on an unattached node");
        }
        o78 o78Var = new o78(new q28[16]);
        q28 q28Var = es4Var.a;
        q28 q28Var2 = q28Var.f;
        if (q28Var2 == null) {
            flb.X(o78Var, q28Var);
        } else {
            o78Var.b(q28Var2);
        }
        int i = 0;
        while (true) {
            int i2 = o78Var.c;
            if (i2 == 0) {
                break;
            }
            q28 q28VarQ0 = (q28) o78Var.m(i2 - 1);
            if ((q28VarQ0.d & 1024) == 0) {
                flb.X(o78Var, q28VarQ0);
            } else {
                while (true) {
                    if (q28VarQ0 == null) {
                        break;
                    }
                    if ((q28VarQ0.c & 1024) != 0) {
                        o78 o78Var2 = null;
                        while (q28VarQ0 != null) {
                            if (q28VarQ0 instanceof es4) {
                                es4 es4Var2 = (es4) q28VarQ0;
                                int i3 = i + 1;
                                if (objArr.length < i3) {
                                    int length = objArr.length;
                                    Object[] objArr2 = new Object[Math.max(i3, length * 2)];
                                    System.arraycopy(objArr, 0, objArr2, 0, length);
                                    objArr = objArr2;
                                }
                                objArr[i] = es4Var2;
                                i = i3;
                            } else if ((q28VarQ0.c & 1024) != 0 && (q28VarQ0 instanceof b43)) {
                                int i4 = 0;
                                for (q28 q28Var3 = ((b43) q28VarQ0).p; q28Var3 != null; q28Var3 = q28Var3.f) {
                                    if ((q28Var3.c & 1024) != 0) {
                                        i4++;
                                        if (i4 == 1) {
                                            q28VarQ0 = q28Var3;
                                        } else {
                                            if (o78Var2 == null) {
                                                o78Var2 = new o78(new q28[16]);
                                            }
                                            if (q28VarQ0 != null) {
                                                o78Var2.b(q28VarQ0);
                                                q28VarQ0 = null;
                                            }
                                            o78Var2.b(q28Var3);
                                        }
                                    }
                                }
                                if (i4 == 1) {
                                }
                            }
                            q28VarQ0 = flb.q0(o78Var2);
                        }
                    } else {
                        q28VarQ0 = q28VarQ0.f;
                    }
                }
            }
        }
        Arrays.sort(objArr, 0, i, js4.b);
        int i5 = i - 1;
        if (i5 < objArr.length) {
            while (i5 >= 0) {
                es4 es4Var3 = (es4) objArr[i5];
                if (rx0.Q(es4Var3) && f(es4Var3, vtVar)) {
                    return true;
                }
                i5--;
            }
        }
        return false;
    }

    public static final boolean r(es4 es4Var, vt vtVar) {
        Object[] objArr = new es4[16];
        if (!es4Var.a.n) {
            b26.b("visitChildren called on an unattached node");
        }
        o78 o78Var = new o78(new q28[16]);
        q28 q28Var = es4Var.a;
        q28 q28Var2 = q28Var.f;
        if (q28Var2 == null) {
            flb.X(o78Var, q28Var);
        } else {
            o78Var.b(q28Var2);
        }
        int i = 0;
        while (true) {
            int i2 = o78Var.c;
            if (i2 == 0) {
                break;
            }
            q28 q28VarQ0 = (q28) o78Var.m(i2 - 1);
            if ((q28VarQ0.d & 1024) == 0) {
                flb.X(o78Var, q28VarQ0);
            } else {
                while (true) {
                    if (q28VarQ0 == null) {
                        break;
                    }
                    if ((q28VarQ0.c & 1024) != 0) {
                        o78 o78Var2 = null;
                        while (q28VarQ0 != null) {
                            if (q28VarQ0 instanceof es4) {
                                es4 es4Var2 = (es4) q28VarQ0;
                                int i3 = i + 1;
                                if (objArr.length < i3) {
                                    int length = objArr.length;
                                    Object[] objArr2 = new Object[Math.max(i3, length * 2)];
                                    System.arraycopy(objArr, 0, objArr2, 0, length);
                                    objArr = objArr2;
                                }
                                objArr[i] = es4Var2;
                                i = i3;
                            } else if ((q28VarQ0.c & 1024) != 0 && (q28VarQ0 instanceof b43)) {
                                int i4 = 0;
                                for (q28 q28Var3 = ((b43) q28VarQ0).p; q28Var3 != null; q28Var3 = q28Var3.f) {
                                    if ((q28Var3.c & 1024) != 0) {
                                        i4++;
                                        if (i4 == 1) {
                                            q28VarQ0 = q28Var3;
                                        } else {
                                            if (o78Var2 == null) {
                                                o78Var2 = new o78(new q28[16]);
                                            }
                                            if (q28VarQ0 != null) {
                                                o78Var2.b(q28VarQ0);
                                                q28VarQ0 = null;
                                            }
                                            o78Var2.b(q28Var3);
                                        }
                                    }
                                }
                                if (i4 == 1) {
                                }
                            }
                            q28VarQ0 = flb.q0(o78Var2);
                        }
                    } else {
                        q28VarQ0 = q28VarQ0.f;
                    }
                }
            }
        }
        Arrays.sort(objArr, 0, i, js4.b);
        for (int i5 = 0; i5 < i; i5++) {
            es4 es4Var3 = (es4) objArr[i5];
            if (rx0.Q(es4Var3) && h(es4Var3, vtVar)) {
                return true;
            }
        }
        return false;
    }

    public static final ic7 s(jc7 jc7Var, x12 x12Var) {
        p65 p65Var = (p65) x12Var;
        p65Var.Z(-1248473602);
        ol3 ol3Var = new ol3(3, 2, null);
        Context context = (Context) p65Var.j(eo.b);
        p65Var.Z(1388713953);
        boolean zF = p65Var.f(jc7Var);
        Object objM = p65Var.M();
        uob uobVar = w12.a;
        if (zF || objM == uobVar) {
            objM = qo7.u(new ic7());
            p65Var.j0(objM);
        }
        l78 l78Var = (l78) objM;
        p65Var.p(false);
        p65Var.Z(1388714244);
        boolean zF2 = p65Var.f(jc7Var) | p65Var.f("__LottieInternalDefaultCacheKey__");
        Object objM2 = p65Var.M();
        if (zF2 || objM2 == uobVar) {
            objM2 = m(context, jc7Var, "__LottieInternalDefaultCacheKey__");
            p65Var.j0(objM2);
        }
        p65Var.p(false);
        kyd.l(jc7Var, "__LottieInternalDefaultCacheKey__", new px2(ol3Var, context, jc7Var, l78Var, null), p65Var);
        ic7 ic7Var = (ic7) l78Var.getValue();
        p65Var.p(false);
        return ic7Var;
    }

    public static final String u(SourceParameter sourceParameter) {
        int i;
        String strValueOf;
        WireField wireField;
        sourceParameter.getClass();
        Collection collectionA = ((ah6) ((dh6) n1b.a.b(SourceParameter.class)).c.getValue()).a();
        ArrayList arrayList = new ArrayList();
        Iterator it2 = collectionA.iterator();
        while (true) {
            if (!it2.hasNext()) {
                break;
            }
            Object next = it2.next();
            vg6 vg6Var = (vg6) next;
            if ((vg6Var.y().P() != null ? 1 : 0) == 0 && (vg6Var instanceof xi6)) {
                arrayList.add(next);
            }
        }
        ArrayList arrayList2 = new ArrayList();
        Iterator it3 = arrayList.iterator();
        while (true) {
            f09 f09Var = null;
            if (!it3.hasNext()) {
                break;
            }
            xi6 xi6Var = (xi6) it3.next();
            Field fieldJ = fo7.J(xi6Var);
            if (fieldJ != null && (wireField = (WireField) fieldJ.getAnnotation(WireField.class)) != null) {
                f09Var = new f09(Integer.valueOf(wireField.tag()), xi6Var.b().call(sourceParameter));
            }
            if (f09Var != null) {
                arrayList2.add(f09Var);
            }
        }
        List<f09> listF1 = bu1.f1(arrayList2, new lva(3));
        int iIntValue = ((Number) ((f09) bu1.H0(listF1)).a).intValue();
        Object[] objArr = new Object[iIntValue];
        for (f09 f09Var2 : listF1) {
            objArr[((Number) f09Var2.a).intValue() - 1] = f09Var2.b;
        }
        ArrayList<String> arrayList3 = new ArrayList(iIntValue);
        while (i < iIntValue) {
            Object obj = objArr[i];
            if (obj instanceof String) {
                strValueOf = (String) obj;
            } else if (obj instanceof Number) {
                strValueOf = ((Number) obj).toString();
            } else if (obj instanceof WireEnum) {
                strValueOf = String.valueOf(((WireEnum) obj).getValue());
            } else if (obj instanceof Boolean) {
                strValueOf = ((Boolean) obj).booleanValue() ? "true" : "false";
            } else {
                if (obj != null) {
                    ay0.e(ka1.q("value not supported: ", obj));
                    return null;
                }
                strValueOf = "";
            }
            arrayList3.add(strValueOf);
            i++;
        }
        ArrayList arrayList4 = new ArrayList(cu1.k0(arrayList3, 10));
        for (String str : arrayList3) {
            Pattern patternCompile = Pattern.compile("-");
            patternCompile.getClass();
            str.getClass();
            String strReplaceAll = patternCompile.matcher(str).replaceAll("_");
            strReplaceAll.getClass();
            arrayList4.add(strReplaceAll);
        }
        ArrayList arrayList5 = new ArrayList(arrayList4);
        while (!arrayList5.isEmpty() && ((CharSequence) y30.m(1, arrayList5)).length() == 0) {
            arrayList5.remove(arrayList5.size() - 1);
        }
        return bu1.F0(arrayList5, "-", null, null, null, 62);
    }

    public static final qvc v(PublicationSubmissionStatus publicationSubmissionStatus) {
        publicationSubmissionStatus.getClass();
        switch (rvc.a[publicationSubmissionStatus.ordinal()]) {
            case 1:
                return qvc.ACCEPTED;
            case 2:
                return qvc.CHANGES_MADE;
            case 3:
                return qvc.CHANGES_REQUESTED;
            case 4:
                return qvc.IN_REVIEW;
            case 5:
                return qvc.OPEN;
            case 6:
                return qvc.TRIAGE;
            default:
                return null;
        }
    }

    public static long w(byte[] bArr, int i) {
        return ((long) (((bArr[i + 3] & 255) << 24) | (bArr[i] & 255) | ((bArr[i + 1] & 255) << 8) | ((bArr[i + 2] & 255) << 16))) & 4294967295L;
    }

    public static void x(byte[] bArr, long j, int i) {
        int i2 = 0;
        while (i2 < 4) {
            bArr[i + i2] = (byte) (255 & j);
            i2++;
            j >>= 8;
        }
    }

    public static boolean y(byte b2) {
        return b2 > -65;
    }

    public static byte[] z(byte[] bArr, byte[] bArr2) {
        if (bArr.length != 32) {
            ay0.e("The key length in bytes must be 32.");
            return null;
        }
        long jW = w(bArr, 0) & 67108863;
        int i = 3;
        long jW2 = (w(bArr, 3) >> 2) & 67108611;
        long jW3 = (w(bArr, 6) >> 4) & 67092735;
        long jW4 = (w(bArr, 9) >> 6) & 66076671;
        long jW5 = (w(bArr, 12) >> 8) & 1048575;
        long j = jW2 * 5;
        long j2 = jW3 * 5;
        long j3 = jW4 * 5;
        long j4 = jW5 * 5;
        byte[] bArr3 = new byte[17];
        long j5 = 0;
        long j6 = 0;
        long j7 = 0;
        long j8 = 0;
        long j9 = 0;
        int i2 = 0;
        while (i2 < bArr2.length) {
            int iMin = Math.min(16, bArr2.length - i2);
            System.arraycopy(bArr2, i2, bArr3, 0, iMin);
            bArr3[iMin] = 1;
            if (iMin != 16) {
                Arrays.fill(bArr3, iMin + 1, 17, (byte) 0);
            }
            long jW6 = j9 + (w(bArr3, 0) & 67108863);
            long jW7 = j5 + ((w(bArr3, i) >> 2) & 67108863);
            long jW8 = j6 + ((w(bArr3, 6) >> 4) & 67108863);
            long jW9 = j7 + ((w(bArr3, 9) >> 6) & 67108863);
            long j10 = jW2;
            long jW10 = j8 + (((w(bArr3, 12) >> 8) & 67108863) | ((long) (bArr3[16] << 24)));
            long j11 = (jW10 * j) + (jW9 * j2) + (jW8 * j3) + (jW7 * j4) + (jW6 * jW);
            long j12 = (jW10 * j2) + (jW9 * j3) + (jW8 * j4) + (jW7 * jW) + (jW6 * j10);
            long j13 = (jW10 * j3) + (jW9 * j4) + (jW8 * jW) + (jW7 * j10) + (jW6 * jW3);
            long j14 = (jW10 * j4) + (jW9 * jW) + (jW8 * j10) + (jW7 * jW3) + (jW6 * jW4);
            long j15 = jW9 * j10;
            long j16 = jW10 * jW;
            long j17 = j12 + (j11 >> 26);
            long j18 = j13 + (j17 >> 26);
            long j19 = j14 + (j18 >> 26);
            long j20 = j16 + j15 + (jW8 * jW3) + (jW7 * jW4) + (jW6 * jW5) + (j19 >> 26);
            long j21 = j20 >> 26;
            j8 = j20 & 67108863;
            long j22 = (j21 * 5) + (j11 & 67108863);
            i2 += 16;
            j6 = j18 & 67108863;
            j7 = j19 & 67108863;
            j9 = j22 & 67108863;
            j5 = (j17 & 67108863) + (j22 >> 26);
            jW2 = j10;
            i = 3;
        }
        long j23 = j6 + (j5 >> 26);
        long j24 = j23 & 67108863;
        long j25 = j7 + (j23 >> 26);
        long j26 = j25 & 67108863;
        long j27 = j8 + (j25 >> 26);
        long j28 = j27 & 67108863;
        long j29 = ((j27 >> 26) * 5) + j9;
        long j30 = j29 >> 26;
        long j31 = j29 & 67108863;
        long j32 = (j5 & 67108863) + j30;
        long j33 = j31 + 5;
        long j34 = j33 & 67108863;
        long j35 = j32 + (j33 >> 26);
        long j36 = j24 + (j35 >> 26);
        long j37 = j26 + (j36 >> 26);
        long j38 = j37 & 67108863;
        long j39 = (j28 + (j37 >> 26)) - 67108864;
        long j40 = j39 >> 63;
        long j41 = j31 & j40;
        long j42 = j32 & j40;
        long j43 = j24 & j40;
        long j44 = j26 & j40;
        long j45 = j28 & j40;
        long j46 = ~j40;
        long j47 = j42 | (j35 & 67108863 & j46);
        long j48 = j43 | (j36 & 67108863 & j46);
        long j49 = j44 | (j38 & j46);
        long j50 = (j41 | (j34 & j46) | (j47 << 26)) & 4294967295L;
        long j51 = ((j47 >> 6) | (j48 << 20)) & 4294967295L;
        long j52 = ((j48 >> 12) | (j49 << 14)) & 4294967295L;
        long j53 = ((j49 >> 18) | ((j45 | (j39 & j46)) << 8)) & 4294967295L;
        long jW11 = w(bArr, 16) + j50;
        long j54 = jW11 & 4294967295L;
        long jW12 = w(bArr, 20) + j51 + (jW11 >> 32);
        long jW13 = w(bArr, 24) + j52 + (jW12 >> 32);
        long jW14 = (w(bArr, 28) + j53 + (jW13 >> 32)) & 4294967295L;
        byte[] bArr4 = new byte[16];
        x(bArr4, j54, 0);
        x(bArr4, jW12 & 4294967295L, 4);
        x(bArr4, jW13 & 4294967295L, 8);
        x(bArr4, jW14, 12);
        return bArr4;
    }

    /* JADX WARN: Code restructure failed: missing block: B:75:0x00ff, code lost:
    
        return true;
     */
    /* JADX WARN: Removed duplicated region for block: B:129:0x019f  */
    /* JADX WARN: Removed duplicated region for block: B:157:0x019c A[EDGE_INSN: B:157:0x019c->B:127:0x019c BREAK  A[LOOP:5: B:89:0x012d->B:162:0x012d], SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:87:0x0120  */
    /* JADX WARN: Removed duplicated region for block: B:90:0x012f  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final boolean t(defpackage.es4 r12, defpackage.es4 r13, int r14, defpackage.vt r15) {
        /*
            Method dump skipped, instruction units count: 439
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.gp7.t(es4, es4, int, vt):boolean");
    }
}
