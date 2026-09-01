package defpackage;

import android.content.ClipData;
import android.content.Intent;
import android.net.Uri;
import android.util.TypedValue;
import android.view.View;
import com.drew.lang.RandomAccessStreamReader;
import com.drew.metadata.exif.makernotes.OlympusMakernoteDirectory;
import com.drew.metadata.exif.makernotes.PanasonicMakernoteDirectory;
import com.drew.metadata.exif.makernotes.ReconyxUltraFireMakernoteDirectory;
import com.google.android.gms.internal.p000firebaseauthapi.zzale;
import com.medium.android.admin.admininternalstatus.jO.ziYqbdHrAXvj;
import com.medium.android.core.models.EntityType;
import com.medium.android.data.catalog.KnyB.uvlZTF;
import com.medium.android.postpublishing.ui.TopicData;
import com.medium.reader.R;
import gen.model.SourceParameter;
import java.io.IOException;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.nio.MappedByteBuffer;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.EnumMap;
import java.util.concurrent.atomic.AtomicReferenceFieldUpdater;
import org.xmlpull.v1.XmlPullParserException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public abstract class fp7 implements k9f {
    public static final /* synthetic */ int a = 0;
    public static final /* synthetic */ int b = 0;
    public static final /* synthetic */ int c = 0;
    public static final /* synthetic */ int d = 0;
    public static final /* synthetic */ int e = 0;
    public static final /* synthetic */ int f = 0;
    public static final /* synthetic */ int g = 0;

    public static final void a(int i, x12 x12Var, m45 m45Var, r28 r28Var) {
        p65 p65Var;
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(-340985709);
        int i2 = (p65Var2.f(r28Var) ? 4 : 2) | i | (p65Var2.h(m45Var) ? 32 : 16);
        if (p65Var2.P(i2 & 1, (i2 & 19) != 18)) {
            p65Var = p65Var2;
            rr7.d(r28Var, false, null, pxf.E(1842531950, new c60(10, m45Var), p65Var2), null, null, null, 0, false, null, 0.0f, 0L, 0L, 0L, 0L, 0L, vx0.d, p65Var, (i2 & 14) | 3072, 262134);
        } else {
            p65Var = p65Var2;
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new va(r28Var, m45Var, i, 3);
        }
    }

    public static final void b(TopicData topicData, eb8 eb8Var, x12 x12Var, int i) {
        topicData.getClass();
        p65 p65Var = (p65) x12Var;
        p65Var.a0(96556817);
        int i2 = 16;
        int i3 = (p65Var.f(topicData) ? 4 : 2) | i | (p65Var.h(eb8Var) ? 32 : 16);
        int i4 = 0;
        if (p65Var.P(i3 & 1, (i3 & 19) != 18)) {
            boolean z = ((i3 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32) | ((i3 & 14) == 4);
            Object objM = p65Var.M();
            if (z || objM == w12.a) {
                objM = new zod(eb8Var, topicData, i4);
                p65Var.j0(objM);
            }
            w2g.d((m45) objM, null, false, null, pxf.i(((zo7) p65Var.j(kt7.b)).c, p65Var, 62), pxf.E(-509721112, new dyc(topicData, 5, eb8Var), p65Var), p65Var, 100663296);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new l6c(topicData, eb8Var, i, i2);
        }
    }

    public static final void c(final int i, final boolean z, final r28 r28Var, final mz1 mz1Var, x12 x12Var, final int i2) {
        p65 p65Var = (p65) x12Var;
        p65Var.a0(1491527793);
        int i3 = (i2 & 6) == 0 ? (p65Var.d(i) ? 4 : 2) | i2 : i2;
        if ((i2 & 48) == 0) {
            i3 |= p65Var.g(z) ? 32 : 16;
        }
        if ((i2 & 384) == 0) {
            i3 |= p65Var.f(r28Var) ? 256 : 128;
        }
        if ((i2 & 3072) == 0) {
            i3 |= p65Var.h(mz1Var) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024;
        }
        if (p65Var.P(i3 & 1, (i3 & 1171) != 1170)) {
            r28 r28VarP = pwd.P(jfc.d(r28Var, 1.0f), a76.Min);
            omb ombVarA = nmb.a(qb8.a, z46.m, p65Var, 0);
            long j = p65Var.T;
            int i4 = (int) (j ^ (j >>> 32));
            i89 i89VarL = p65Var.l();
            r28 r28VarR = gx1.R(p65Var, r28VarP);
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
            tp7.B(p65Var, q12.g, Integer.valueOf(i4));
            tp7.y(p65Var, q12.h);
            tp7.B(p65Var, q12.d, r28VarR);
            p65Var.Y(-1797989069);
            for (int i5 = 0; i5 < i; i5++) {
                tp7.e(2.0f, 384, 0, ((zo7) p65Var.j(kt7.b)).z, p65Var, jfc.c(w2g.G(o28.b, 24.0f, 0.0f, 0.0f, z ? 18.0f : 0.0f, 6), 1.0f));
            }
            p65Var.p(false);
            mz1Var.f(qmb.a, p65Var, Integer.valueOf(((i3 >> 6) & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) | 6));
            p65Var.p(true);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new b55() { // from class: ueb
                @Override // defpackage.b55
                public final Object invoke(Object obj, Object obj2) {
                    ((Integer) obj2).getClass();
                    fp7.c(i, z, r28Var, mz1Var, (x12) obj, tr7.y(i2 | 1));
                    return c1e.a;
                }
            };
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:106:0x012c  */
    /* JADX WARN: Removed duplicated region for block: B:107:0x012f  */
    /* JADX WARN: Removed duplicated region for block: B:110:0x0139  */
    /* JADX WARN: Removed duplicated region for block: B:176:0x0262  */
    /* JADX WARN: Removed duplicated region for block: B:179:0x0277  */
    /* JADX WARN: Removed duplicated region for block: B:181:? A[RETURN, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:26:0x004b  */
    /* JADX WARN: Removed duplicated region for block: B:28:0x0050  */
    /* JADX WARN: Removed duplicated region for block: B:37:0x0066  */
    /* JADX WARN: Removed duplicated region for block: B:39:0x006b  */
    /* JADX WARN: Removed duplicated region for block: B:48:0x0081  */
    /* JADX WARN: Removed duplicated region for block: B:53:0x0090  */
    /* JADX WARN: Removed duplicated region for block: B:56:0x0098  */
    /* JADX WARN: Removed duplicated region for block: B:58:0x009c  */
    /* JADX WARN: Removed duplicated region for block: B:67:0x00b4  */
    /* JADX WARN: Removed duplicated region for block: B:74:0x00c8  */
    /* JADX WARN: Removed duplicated region for block: B:77:0x00d0  */
    /* JADX WARN: Removed duplicated region for block: B:85:0x00e7  */
    /* JADX WARN: Removed duplicated region for block: B:88:0x00f3  */
    /* JADX WARN: Removed duplicated region for block: B:96:0x0109  */
    /* JADX WARN: Removed duplicated region for block: B:99:0x0113  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final void d(defpackage.r28 r27, defpackage.b55 r28, defpackage.b55 r29, defpackage.b55 r30, defpackage.b55 r31, int r32, long r33, long r35, defpackage.y3f r37, defpackage.mz1 r38, defpackage.x12 r39, int r40, int r41) {
        /*
            Method dump skipped, instruction units count: 649
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.fp7.d(r28, b55, b55, b55, b55, int, long, long, y3f, mz1, x12, int, int):void");
    }

    public static final void e(int i, b55 b55Var, mz1 mz1Var, b55 b55Var2, b55 b55Var3, y3f y3fVar, b55 b55Var4, x12 x12Var, int i2) {
        int i3;
        int i4;
        int i5;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-280287501);
        int i6 = i2 | (p65Var.d(i) ? 4 : 2) | (p65Var.h(b55Var) ? 32 : 16) | (p65Var.h(mz1Var) ? 256 : 128) | (p65Var.h(b55Var2) ? 2048 : 1024) | (p65Var.h(b55Var3) ? OlympusMakernoteDirectory.TAG_MAIN_INFO : 8192) | (p65Var.f(y3fVar) ? 131072 : ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID) | (p65Var.h(b55Var4) ? 1048576 : 524288);
        if (p65Var.P(i6 & 1, (599187 & i6) != 599186)) {
            Object objM = p65Var.M();
            uob uobVar = w12.a;
            if (objM == uobVar) {
                objM = new xpb();
                p65Var.j0(objM);
            }
            xpb xpbVar = (xpb) objM;
            boolean z = (i6 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32;
            Object objM2 = p65Var.M();
            if (z || objM2 == uobVar) {
                objM2 = new mz1(new jd(7, b55Var), true, 605195056);
                p65Var.j0(objM2);
            }
            b55 b55Var5 = (b55) objM2;
            boolean z2 = (i6 & 7168) == 2048;
            Object objM3 = p65Var.M();
            if (z2 || objM3 == uobVar) {
                objM3 = new mz1(new jd(6, b55Var2), true, 418899191);
                p65Var.j0(objM3);
            }
            b55 b55Var6 = (b55) objM3;
            boolean z3 = (57344 & i6) == 16384;
            Object objM4 = p65Var.M();
            if (z3 || objM4 == uobVar) {
                objM4 = new mz1(new jd(5, b55Var3), true, 338600263);
                p65Var.j0(objM4);
            }
            b55 b55Var7 = (b55) objM4;
            boolean z4 = (i6 & 896) == 256;
            Object objM5 = p65Var.M();
            if (z4 || objM5 == uobVar) {
                i3 = i6;
                objM5 = new mz1(new kd(mz1Var, 10, xpbVar), true, -1776388365);
                p65Var.j0(objM5);
            } else {
                i3 = i6;
            }
            b55 b55Var8 = (b55) objM5;
            boolean z5 = (i3 & 3670016) == 1048576;
            Object objM6 = p65Var.M();
            if (z5 || objM6 == uobVar) {
                objM6 = new mz1(new jd(4, b55Var4), true, -1731662488);
                p65Var.j0(objM6);
            }
            b55 b55Var9 = (b55) objM6;
            boolean zF = ((i3 & 458752) == 131072) | p65Var.f(b55Var5) | p65Var.f(b55Var6) | p65Var.f(b55Var7) | ((i3 & 14) == 4) | p65Var.f(b55Var9) | p65Var.f(b55Var8);
            Object objM7 = p65Var.M();
            if (zF || objM7 == uobVar) {
                i4 = 0;
                i5 = 1;
                kz1 kz1Var = new kz1(y3fVar, b55Var5, b55Var6, b55Var7, i, b55Var9, xpbVar, b55Var8);
                p65Var.j0(kz1Var);
                objM7 = kz1Var;
            } else {
                i4 = 0;
                i5 = 1;
            }
            f76.u(null, (b55) objM7, p65Var, i4, i5);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new iu0(i, b55Var, mz1Var, b55Var2, b55Var3, y3fVar, b55Var4, i2, 13);
        }
    }

    public static final void f(TopicData topicData, x12 x12Var, int i) {
        topicData.getClass();
        p65 p65Var = (p65) x12Var;
        p65Var.a0(427555587);
        int i2 = (p65Var.f(topicData) ? 4 : 2) | i;
        if (p65Var.P(i2 & 1, (i2 & 3) != 2)) {
            long j = ((zo7) p65Var.j(kt7.b)).c;
            amb ambVar = ((x4c) p65Var.j(a5c.a)).a;
            b89 b89Var = new b89(50.0f);
            amb ambVar2 = new amb(b89Var, b89Var, b89Var, b89Var);
            o28 o28Var = o28.b;
            r28 r28VarA0 = flb.a0(o28Var, j, ambVar2);
            zk7 zk7VarC = dy0.c(z46.d, false);
            long j2 = p65Var.T;
            int i3 = (int) (j2 ^ (j2 >>> 32));
            i89 i89VarL = p65Var.l();
            r28 r28VarR = gx1.R(p65Var, r28VarA0);
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
            tp7.B(p65Var, q12.g, Integer.valueOf(i3));
            tp7.y(p65Var, q12.h);
            tp7.B(p65Var, q12.d, r28VarR);
            kjd.b(topicData.getDisplayTitle(), w2g.D(o28Var, 16.0f, 8.0f), 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, ((eu7) p65Var.j(kt7.c)).n, p65Var, 0, 0, 65532);
            p65Var = p65Var;
            p65Var.p(true);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new h9b(i, 27, topicData);
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r1v12 */
    /* JADX WARN: Type inference failed for: r1v8 */
    /* JADX WARN: Type inference failed for: r1v9, types: [boolean, int] */
    public static final void g(yne yneVar, ek8 ek8Var, obe obeVar, x12 x12Var, int i) {
        p65 p65Var;
        char c2;
        SourceParameter sourceParameter;
        int i2;
        String str;
        String str2;
        cu cuVar;
        cu cuVar2;
        cu cuVar3;
        cu cuVar4;
        ?? r1;
        zq0 zq0Var;
        fn fnVar;
        boolean z;
        p65 p65Var2;
        o28 o28Var;
        p65 p65Var3;
        String str3 = yneVar.e;
        String str4 = yneVar.d;
        SourceParameter sourceParameter2 = yneVar.h;
        obeVar.getClass();
        p65 p65Var4 = (p65) x12Var;
        p65Var4.a0(-2122814027);
        int i3 = i | (p65Var4.f(yneVar) ? 4 : 2) | (p65Var4.f(ek8Var) ? 32 : 16) | (p65Var4.f(obeVar) ? 256 : 128);
        if (p65Var4.P(i3 & 1, (i3 & 147) != 146)) {
            obeVar.y(yneVar.b, sourceParameter2);
            boolean z2 = ((i3 & 14) == 4) | ((i3 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32);
            Object objM = p65Var4.M();
            if (z2 || objM == w12.a) {
                objM = new ube(ek8Var, 13, yneVar);
                p65Var4.j0(objM);
            }
            m45 m45Var = (m45) objM;
            o28 o28Var2 = o28.b;
            r28 r28VarP = pwd.P(jfc.d(hlg.r(o28Var2, false, null, null, m45Var, 15), 1.0f), a76.Min);
            fa4 fa4Var = qb8.a;
            zq0 zq0Var2 = z46.m;
            omb ombVarA = nmb.a(fa4Var, zq0Var2, p65Var4, 0);
            long j = p65Var4.T;
            int i4 = (int) (j ^ (j >>> 32));
            i89 i89VarL = p65Var4.l();
            r28 r28VarR = gx1.R(p65Var4, r28VarP);
            r12.W.getClass();
            m45 m45Var2 = q12.b;
            p65Var4.c0();
            if (p65Var4.S) {
                p65Var4.k(m45Var2);
            } else {
                p65Var4.m0();
            }
            cu cuVar5 = q12.f;
            tp7.B(p65Var4, cuVar5, ombVarA);
            cu cuVar6 = q12.e;
            tp7.B(p65Var4, cuVar6, i89VarL);
            Integer numValueOf = Integer.valueOf(i4);
            cu cuVar7 = q12.g;
            tp7.B(p65Var4, cuVar7, numValueOf);
            fn fnVar2 = q12.h;
            tp7.y(p65Var4, fnVar2);
            cu cuVar8 = q12.d;
            tp7.B(p65Var4, cuVar8, r28VarR);
            if (yneVar.a) {
                p65Var4.Y(-459162031);
                p65 p65Var5 = p65Var4;
                c2 = ' ';
                sourceParameter = sourceParameter2;
                i2 = i3;
                cuVar2 = cuVar7;
                str = str3;
                str2 = str4;
                fnVar = fnVar2;
                zq0Var = zq0Var2;
                cuVar3 = cuVar6;
                cuVar = cuVar8;
                cuVar4 = cuVar5;
                r1 = 0;
                z = true;
                tp7.e(2.0f, 384, 1, ((zo7) p65Var4.j(kt7.b)).A, p65Var5, null);
                p65Var2 = p65Var5;
            } else {
                c2 = ' ';
                sourceParameter = sourceParameter2;
                i2 = i3;
                str = str3;
                str2 = str4;
                cuVar = cuVar8;
                cuVar2 = cuVar7;
                cuVar3 = cuVar6;
                cuVar4 = cuVar5;
                r1 = 0;
                zq0Var = zq0Var2;
                fnVar = fnVar2;
                z = true;
                p65 p65Var6 = p65Var4;
                p65Var6.Y(-461996175);
                p65Var2 = p65Var6;
            }
            p65Var2.p(r1);
            p65 p65Var7 = p65Var2;
            pr7.e(yneVar.c, w2g.G(o28Var2, 18.0f, 18.0f, 0.0f, 18.0f, 4), Integer.valueOf(R.drawable.ic_notifications_follow), m45Var, p65Var7, 48);
            r28 r28VarF = w2g.F(new sq6(1.0f, z), 18.0f, 18.0f, 18.0f, 18.0f);
            wv1 wv1VarA = uv1.a(qb8.c, z46.p, p65Var7, r1);
            long j2 = p65Var7.T;
            int i5 = (int) (j2 ^ (j2 >>> c2));
            i89 i89VarL2 = p65Var7.l();
            r28 r28VarR2 = gx1.R(p65Var7, r28VarF);
            p65Var7.c0();
            if (p65Var7.S) {
                p65Var7.k(m45Var2);
            } else {
                p65Var7.m0();
            }
            tp7.B(p65Var7, cuVar4, wv1VarA);
            tp7.B(p65Var7, cuVar3, i89VarL2);
            ka1.z(i5, p65Var7, cuVar2, p65Var7, fnVar);
            tp7.B(p65Var7, cuVar, r28VarR2);
            d8a d8aVar = jt7.c;
            String str5 = str2;
            jjd.b(str5, null, 0L, 0L, 0L, null, new jgd(5), 0L, 2, false, 2, 0, null, ((bu7) p65Var7.j(d8aVar)).m, p65Var7, 0, 24960, 109566);
            if (muc.b0(str)) {
                p65 p65Var8 = p65Var7;
                o28Var = o28Var2;
                p65Var8.Y(472016039);
                p65Var3 = p65Var8;
            } else {
                p65Var7.Y(475760250);
                mkd mkdVar = ((bu7) p65Var7.j(d8aVar)).o;
                o28Var = o28Var2;
                jjd.b(str, w2g.G(o28Var2, 0.0f, 4.0f, 0.0f, 0.0f, 13), 0L, 0L, 0L, null, new jgd(5), 0L, 0, false, 0, 0, null, mkdVar, p65Var7, 48, 0, 130044);
                p65Var3 = p65Var7;
            }
            p65Var3.p(r1);
            p65Var3.p(z);
            n01.x(new wu4(yneVar.b, str5, EntityType.AUTHOR, yneVar.f, yneVar.g, sourceParameter), it4.S, obeVar, w2g.G(jfc.b(o28Var, 90.0f, 0.0f, 2).b(new qse(zq0Var)), 0.0f, 10.0f, 18.0f, 18.0f, 1), null, null, null, 0L, p65Var3, (i2 & 896) | 48, 240);
            p65 p65Var9 = p65Var3;
            p65Var9.p(z);
            p65Var = p65Var9;
        } else {
            p65 p65Var10 = p65Var4;
            p65Var10.S();
            p65Var = p65Var10;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new h5d(i, 28, yneVar, ek8Var, obeVar);
        }
    }

    public static int h(boolean[] zArr, int i, int[] iArr, boolean z) {
        int i2 = 0;
        for (int i3 : iArr) {
            int i4 = 0;
            while (i4 < i3) {
                zArr[i] = z;
                i4++;
                i++;
            }
            i2 += i3;
            z = !z;
        }
        return i2;
    }

    public static final iy6 k(View view) {
        view.getClass();
        while (view != null) {
            Object tag = view.getTag(R.id.view_tree_lifecycle_owner);
            iy6 iy6Var = tag instanceof iy6 ? (iy6) tag : null;
            if (iy6Var != null) {
                return iy6Var;
            }
            Object objU = ep7.u(view);
            view = objU instanceof View ? (View) objU : null;
        }
        return null;
    }

    public static void n(Intent intent, ArrayList arrayList) {
        ClipData clipData = new ClipData(null, new String[]{intent.getType()}, new ClipData.Item(intent.getCharSequenceExtra("android.intent.extra.TEXT"), intent.getStringExtra("android.intent.extra.HTML_TEXT"), null, (Uri) arrayList.get(0)));
        int size = arrayList.size();
        for (int i = 1; i < size; i++) {
            clipData.addItem(new ClipData.Item((Uri) arrayList.get(i)));
        }
        intent.setClipData(clipData);
        intent.addFlags(1);
    }

    public static vz7 o(MappedByteBuffer mappedByteBuffer) throws IOException {
        long j;
        ByteBuffer byteBufferDuplicate = mappedByteBuffer.duplicate();
        byteBufferDuplicate.order(ByteOrder.BIG_ENDIAN);
        byteBufferDuplicate.position(byteBufferDuplicate.position() + 4);
        int i = byteBufferDuplicate.getShort() & 65535;
        if (i > 100) {
            ik4.g("Cannot read metadata.");
            return null;
        }
        byteBufferDuplicate.position(byteBufferDuplicate.position() + 6);
        int i2 = 0;
        while (true) {
            if (i2 >= i) {
                j = -1;
                break;
            }
            int i3 = byteBufferDuplicate.getInt();
            byteBufferDuplicate.position(byteBufferDuplicate.position() + 4);
            j = ((long) byteBufferDuplicate.getInt()) & 4294967295L;
            byteBufferDuplicate.position(byteBufferDuplicate.position() + 4);
            if (1835365473 == i3) {
                break;
            }
            i2++;
        }
        if (j != -1) {
            byteBufferDuplicate.position(byteBufferDuplicate.position() + ((int) (j - ((long) byteBufferDuplicate.position()))));
            byteBufferDuplicate.position(byteBufferDuplicate.position() + 12);
            long j2 = ((long) byteBufferDuplicate.getInt()) & 4294967295L;
            for (int i4 = 0; i4 < j2; i4++) {
                int i5 = byteBufferDuplicate.getInt();
                long j3 = ((long) byteBufferDuplicate.getInt()) & 4294967295L;
                byteBufferDuplicate.getInt();
                if (1164798569 == i5 || 1701669481 == i5) {
                    byteBufferDuplicate.position((int) (j3 + j));
                    vz7 vz7Var = new vz7();
                    byteBufferDuplicate.order(ByteOrder.LITTLE_ENDIAN);
                    int iPosition = byteBufferDuplicate.position() + byteBufferDuplicate.getInt(byteBufferDuplicate.position());
                    vz7Var.d = byteBufferDuplicate;
                    vz7Var.a = iPosition;
                    int i6 = iPosition - byteBufferDuplicate.getInt(iPosition);
                    vz7Var.b = i6;
                    vz7Var.c = ((ByteBuffer) vz7Var.d).getShort(i6);
                    return vz7Var;
                }
            }
        }
        ik4.g("Cannot read metadata.");
        return null;
    }

    public static final void p(y70 y70Var, x45 x45Var) {
        y70 y70Var2 = new y70(999);
        int i = y70Var.c;
        int i2 = 0;
        int i3 = 0;
        while (i2 < i) {
            y70Var2.put(y70Var.f(i2), y70Var.i(i2));
            i2++;
            i3++;
            if (i3 == 999) {
                x45Var.invoke(y70Var2);
                y70Var2.clear();
                i3 = 0;
            }
        }
        if (i3 > 0) {
            x45Var.invoke(y70Var2);
        }
    }

    public static int q(String str) {
        int length = str.length();
        int i = 0;
        while (i < length && str.charAt(i) < 128) {
            i++;
        }
        int i2 = length;
        while (true) {
            if (i >= length) {
                break;
            }
            char cCharAt = str.charAt(i);
            if (cCharAt < 2048) {
                i2 += (127 - cCharAt) >>> 31;
                i++;
            } else {
                try {
                    int length2 = str.length();
                    int i3 = 0;
                    while (i < length2) {
                        char cCharAt2 = str.charAt(i);
                        if (cCharAt2 < 2048) {
                            i3 += (127 - cCharAt2) >>> 31;
                        } else {
                            i3 += 2;
                            if (55296 <= cCharAt2 && cCharAt2 <= 57343) {
                                if (Character.codePointAt(str, i) < 65536) {
                                    throw new bvf("Unpaired surrogate at index " + i + " of " + length2);
                                }
                                i++;
                            }
                        }
                        i++;
                    }
                    i2 += i3;
                } catch (bvf unused) {
                    return str.getBytes(StandardCharsets.UTF_8).length;
                }
            }
        }
        if (i2 >= length) {
            return i2;
        }
        ay0.e(ho2.D(((long) i2) + 4294967296L, "UTF-8 length does not fit in int: "));
        return 0;
    }

    public static int r(String str, byte[] bArr, int i, int i2) {
        int i3;
        int length;
        int i4;
        char cCharAt;
        int length2 = str.length();
        int i5 = i + i2;
        int i6 = 0;
        while (i6 < length2 && (i4 = i6 + i) < i5 && (cCharAt = str.charAt(i6)) < 128) {
            bArr[i4] = (byte) cCharAt;
            i6++;
        }
        if (i6 == length2) {
            return i + length2;
        }
        int i7 = i + i6;
        while (i6 < length2) {
            char cCharAt2 = str.charAt(i6);
            if (cCharAt2 < 128 && i7 < i5) {
                bArr[i7] = (byte) cCharAt2;
                i7++;
            } else if (cCharAt2 < 2048 && i7 <= i5 - 2) {
                int i8 = i7 + 1;
                bArr[i7] = (byte) ((cCharAt2 >>> 6) | 960);
                i7 += 2;
                bArr[i8] = (byte) ((cCharAt2 & '?') | 128);
            } else {
                if ((cCharAt2 >= 55296 && 57343 >= cCharAt2) || i7 > i5 - 3) {
                    if (i7 <= i5 - 4) {
                        i6++;
                        if (i6 != str.length()) {
                            char cCharAt3 = str.charAt(i6);
                            if (Character.isSurrogatePair(cCharAt2, cCharAt3)) {
                                int codePoint = Character.toCodePoint(cCharAt2, cCharAt3);
                                bArr[i7] = (byte) ((codePoint >>> 18) | 240);
                                bArr[i7 + 1] = (byte) (((codePoint >>> 12) & 63) | 128);
                                int i9 = i7 + 3;
                                bArr[i7 + 2] = (byte) (((codePoint >>> 6) & 63) | 128);
                                i7 += 4;
                                bArr[i9] = (byte) ((codePoint & 63) | 128);
                            }
                        }
                        byte[] bytes = str.getBytes(StandardCharsets.UTF_8);
                        if (bytes.length - i > i2) {
                            throw new ArrayIndexOutOfBoundsException("Not enough space in output buffer to encode UTF-8 string");
                        }
                        System.arraycopy(bytes, 0, bArr, i, bytes.length);
                        length = bytes.length;
                    } else {
                        if (55296 > cCharAt2 || cCharAt2 > 57343 || ((i3 = i6 + 1) != str.length() && Character.isSurrogatePair(cCharAt2, str.charAt(i3)))) {
                            throw new ArrayIndexOutOfBoundsException("Not enough space in output buffer to encode UTF-8 string");
                        }
                        byte[] bytes2 = str.getBytes(StandardCharsets.UTF_8);
                        if (bytes2.length - i > i2) {
                            throw new ArrayIndexOutOfBoundsException("Not enough space in output buffer to encode UTF-8 string");
                        }
                        System.arraycopy(bytes2, 0, bArr, i, bytes2.length);
                        length = bytes2.length;
                    }
                    return i + length;
                }
                bArr[i7] = (byte) ((cCharAt2 >>> '\f') | 480);
                int i10 = i7 + 2;
                bArr[i7 + 1] = (byte) (((cCharAt2 >>> 6) & 63) | 128);
                i7 += 3;
                bArr[i10] = (byte) ((cCharAt2 & '?') | 128);
            }
            i6++;
        }
        return i7;
    }

    public static /* synthetic */ boolean t(AtomicReferenceFieldUpdater atomicReferenceFieldUpdater, ggg gggVar, Object obj, Object obj2) {
        while (!atomicReferenceFieldUpdater.compareAndSet(gggVar, obj, obj2)) {
            if (atomicReferenceFieldUpdater.get(gggVar) != obj && atomicReferenceFieldUpdater.get(gggVar) != obj) {
                return false;
            }
        }
        return true;
    }

    public static boolean u(byte[] bArr, int i, int i2) {
        while (i < i2 && bArr[i] >= 0) {
            i++;
        }
        if (i >= i2) {
            return true;
        }
        while (i < i2) {
            int i3 = i + 1;
            byte b2 = bArr[i];
            if (b2 >= 0) {
                i = i3;
            } else if (b2 < -32) {
                if (i3 >= i2 || b2 < -62) {
                    return false;
                }
                i += 2;
                if (bArr[i3] > -65) {
                    return false;
                }
            } else if (b2 < -16) {
                if (i3 >= i2 - 1) {
                    return false;
                }
                int i4 = i + 2;
                byte b3 = bArr[i3];
                if (b3 > -65) {
                    return false;
                }
                if (b2 == -32 && b3 < -96) {
                    return false;
                }
                if (b2 == -19 && b3 >= -96) {
                    return false;
                }
                i += 3;
                if (bArr[i4] > -65) {
                    return false;
                }
            } else {
                if (i3 >= i2 - 2) {
                    return false;
                }
                int i5 = i + 2;
                byte b4 = bArr[i3];
                if (b4 > -65) {
                    return false;
                }
                if ((((b4 + 112) + (b2 << 28)) >> 30) != 0) {
                    return false;
                }
                int i6 = i + 3;
                if (bArr[i5] > -65) {
                    return false;
                }
                i += 4;
                if (bArr[i6] > -65) {
                    return false;
                }
            }
        }
        return true;
    }

    public abstract boolean[] j(String str);

    @Override // defpackage.k9f
    public sr0 l(String str, xm0 xm0Var, EnumMap enumMap) {
        if (str.isEmpty()) {
            ay0.e("Found empty contents");
            return null;
        }
        int iM = m();
        py3 py3Var = py3.MARGIN;
        if (enumMap.containsKey(py3Var)) {
            iM = Integer.parseInt(enumMap.get(py3Var).toString());
        }
        boolean[] zArrJ = j(str);
        int length = zArrJ.length;
        int i = iM + length;
        int iMax = Math.max(200, i);
        int iMax2 = Math.max(1, 200);
        int i2 = iMax / i;
        int i3 = (iMax - (length * i2)) / 2;
        sr0 sr0Var = new sr0(iMax, iMax2);
        int i4 = 0;
        while (i4 < length) {
            if (zArrJ[i4]) {
                sr0Var.c(i3, 0, i2, iMax2);
            }
            i4++;
            i3 += i2;
        }
        return sr0Var;
    }

    public int m() {
        return 10;
    }

    public static wb8 i(TypedValue typedValue, wb8 wb8Var, wb8 wb8Var2, String str, String str2) throws XmlPullParserException {
        if (wb8Var == null || wb8Var == wb8Var2) {
            return wb8Var == null ? wb8Var2 : wb8Var;
        }
        StringBuilder sbU = y30.u("Type is ", str, uvlZTF.vbV, str2, ": ");
        sbU.append(typedValue.data);
        throw new XmlPullParserException(sbU.toString());
    }

    public static String s(byte[] bArr, int i, int i2) {
        if (i2 == 0) {
            return ziYqbdHrAXvj.PMi;
        }
        if ((i | i2 | ((bArr.length - i) - i2)) < 0) {
            throw new ArrayIndexOutOfBoundsException(String.format("buffer length=%d, index=%d, size=%d", Integer.valueOf(bArr.length), Integer.valueOf(i), Integer.valueOf(i2)));
        }
        int i3 = i + i2;
        char[] cArr = new char[i2];
        int i4 = 0;
        while (i < i3) {
            byte b2 = bArr[i];
            if (b2 < 0) {
                break;
            }
            i++;
            cArr[i4] = (char) b2;
            i4++;
        }
        while (i < i3) {
            int i5 = i + 1;
            byte b3 = bArr[i];
            if (b3 >= 0) {
                int i6 = i4 + 1;
                cArr[i4] = (char) b3;
                while (i5 < i3) {
                    byte b4 = bArr[i5];
                    if (b4 < 0) {
                        break;
                    }
                    i5++;
                    cArr[i6] = (char) b4;
                    i6++;
                }
                i4 = i6;
                i = i5;
            } else if (b3 < -32) {
                if (i5 >= i3) {
                    throw zzale.c();
                }
                i += 2;
                byte b5 = bArr[i5];
                int i7 = i4 + 1;
                if (b3 < -62 || gp7.y(b5)) {
                    throw zzale.c();
                }
                cArr[i4] = (char) ((b5 & 63) | ((b3 & 31) << 6));
                i4 = i7;
            } else if (b3 < -16) {
                if (i5 >= i3 - 1) {
                    throw zzale.c();
                }
                int i8 = i + 2;
                byte b6 = bArr[i5];
                i += 3;
                byte b7 = bArr[i8];
                int i9 = i4 + 1;
                if (gp7.y(b6) || ((b3 == -32 && b6 < -96) || ((b3 == -19 && b6 >= -96) || gp7.y(b7)))) {
                    throw zzale.c();
                }
                cArr[i4] = (char) (((b6 & 63) << 6) | ((b3 & 15) << 12) | (b7 & 63));
                i4 = i9;
            } else {
                if (i5 >= i3 - 2) {
                    throw zzale.c();
                }
                byte b8 = bArr[i5];
                int i10 = i + 3;
                byte b9 = bArr[i + 2];
                i += 4;
                byte b10 = bArr[i10];
                int i11 = i4 + 1;
                if (gp7.y(b8) || (((b8 + 112) + (b3 << 28)) >> 30) != 0 || gp7.y(b9) || gp7.y(b10)) {
                    throw zzale.c();
                }
                int i12 = ((b8 & 63) << 12) | ((b3 & 7) << 18) | ((b9 & 63) << 6) | (b10 & 63);
                cArr[i4] = (char) ((i12 >>> 10) + 55232);
                cArr[i11] = (char) ((i12 & 1023) + 56320);
                i4 += 2;
            }
        }
        return new String(cArr, 0, i4);
    }
}
