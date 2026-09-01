package defpackage;

import android.text.Editable;
import android.text.TextUtils;
import com.drew.lang.RandomAccessStreamReader;
import com.drew.metadata.exif.ExifDirectoryBase;
import com.drew.metadata.exif.makernotes.NikonType2MakernoteDirectory;
import com.drew.metadata.exif.makernotes.OlympusMakernoteDirectory;
import com.drew.metadata.exif.makernotes.PanasonicMakernoteDirectory;
import com.drew.metadata.photoshop.PhotoshopDirectory;
import com.google.android.gms.internal.p000firebaseauthapi.zzabz;
import com.medium.android.donkey.main.Wv.MaAxRJinch;
import com.medium.reader.R;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public abstract class mk7 {
    public static final /* synthetic */ int a = 0;
    public static final /* synthetic */ int b = 0;

    public static boolean A(Editable editable, int i, char... cArr) {
        if (i >= 0 && i < editable.length()) {
            char cCharAt = editable.charAt(i);
            for (char c : cArr) {
                if (cCharAt == c) {
                    return true;
                }
            }
        }
        return false;
    }

    public static boolean B(int i) {
        int type = Character.getType(i);
        return type == 23 || type == 20 || type == 22 || type == 30 || type == 29 || type == 24 || type == 21;
    }

    public static final String C(Collection collection) {
        return nuc.A(bu1.F0(collection, ",", null, null, null, 62)).concat(nuc.A(" }"));
    }

    public static final String D(Collection collection) {
        return nuc.A(bu1.F0(collection, ",", null, null, null, 62)).concat(nuc.A("},"));
    }

    public static final float E(float f, float f2, float f3) {
        return (f3 * f2) + ((1.0f - f3) * f);
    }

    public static final nhc F(x12 x12Var) {
        p65 p65Var = (p65) x12Var;
        Object objM = p65Var.M();
        if (objM == w12.a) {
            objM = y30.j(p65Var);
        }
        return (nhc) objM;
    }

    public static final hre G(by5 by5Var, x12 x12Var) {
        p65 p65Var = (p65) x12Var;
        m73 m73Var = (m73) p65Var.j(z22.h);
        boolean zE = p65Var.e((((long) Float.floatToRawIntBits(m73Var.b())) & 4294967295L) | (((long) Float.floatToRawIntBits(by5Var.j)) << 32));
        Object objM = p65Var.M();
        if (zE || objM == w12.a) {
            wg5 wg5Var = new wg5();
            o(wg5Var, by5Var.f);
            long jFloatToRawIntBits = (((long) Float.floatToRawIntBits(m73Var.Z(by5Var.b))) << 32) | (((long) Float.floatToRawIntBits(m73Var.Z(by5Var.c))) & 4294967295L);
            float fIntBitsToFloat = by5Var.d;
            float fIntBitsToFloat2 = by5Var.e;
            if (Float.isNaN(fIntBitsToFloat)) {
                fIntBitsToFloat = Float.intBitsToFloat((int) (jFloatToRawIntBits >> 32));
            }
            if (Float.isNaN(fIntBitsToFloat2)) {
                fIntBitsToFloat2 = Float.intBitsToFloat((int) (jFloatToRawIntBits & 4294967295L));
            }
            long jFloatToRawIntBits2 = (((long) Float.floatToRawIntBits(fIntBitsToFloat)) << 32) | (4294967295L & ((long) Float.floatToRawIntBits(fIntBitsToFloat2)));
            hre hreVar = new hre(wg5Var);
            String str = by5Var.a;
            long j = by5Var.g;
            bs0 bs0Var = j != 16 ? new bs0(by5Var.h, j) : null;
            boolean z = by5Var.i;
            hreVar.f.setValue(new dfc(jFloatToRawIntBits));
            hreVar.g.setValue(Boolean.valueOf(z));
            rqe rqeVar = hreVar.h;
            rqeVar.g.setValue(bs0Var);
            rqeVar.i.setValue(new dfc(jFloatToRawIntBits2));
            rqeVar.c = str;
            p65Var.j0(hreVar);
            objM = hreVar;
        }
        return (hre) objM;
    }

    public static final zwa H(hp6 hp6Var) {
        zwa zwaVarB = sgg.B(hp6Var, true);
        long jV = hp6Var.v(zwaVarB.d());
        float f = zwaVarB.c;
        float f2 = zwaVarB.d;
        long jV2 = hp6Var.v((((long) Float.floatToRawIntBits(f)) << 32) | (((long) Float.floatToRawIntBits(f2)) & 4294967295L));
        return new zwa(Float.intBitsToFloat((int) (jV >> 32)), Float.intBitsToFloat((int) (jV & 4294967295L)), Float.intBitsToFloat((int) (jV2 >> 32)), Float.intBitsToFloat((int) (jV2 & 4294967295L)));
    }

    public static String I(String str) throws zzabz {
        if (str.isEmpty()) {
            return null;
        }
        try {
            d1g d1gVar = new d1g(17);
            d1gVar.a(str);
            if (TextUtils.isEmpty(d1gVar.b)) {
                throw new zzabz("No error message: ".concat(str));
            }
            return d1gVar.b;
        } catch (Exception e) {
            throw new zzabz(ka1.r("Json conversion failed! ", e.getMessage()), e);
        }
    }

    public static xnf J(String str, xnf xnfVar) throws zzabz {
        try {
            return xnfVar.a(str);
        } catch (Exception e) {
            throw new zzabz(ka1.r("Json conversion failed! ", e.getMessage()), e);
        }
    }

    public static byte[] M(byte[] bArr) {
        if (bArr.length != 16) {
            ay0.e("value must be a block.");
            return null;
        }
        byte[] bArr2 = new byte[16];
        for (int i = 0; i < 16; i++) {
            byte b2 = (byte) ((bArr[i] << 1) & ExifDirectoryBase.TAG_NEW_SUBFILE_TYPE);
            bArr2[i] = b2;
            if (i < 15) {
                bArr2[i] = (byte) (((byte) ((bArr[i + 1] >> 7) & 1)) | b2);
            }
        }
        bArr2[15] = (byte) (((byte) ((bArr[0] >> 7) & NikonType2MakernoteDirectory.TAG_FLASH_USED)) ^ bArr2[15]);
        return bArr2;
    }

    public static final void a(q8b q8bVar, p8b p8bVar, x12 x12Var, int i) {
        p65 p65Var = (p65) x12Var;
        p65Var.a0(381892979);
        int i2 = (p65Var.f(q8bVar) ? 4 : 2) | i | (p65Var.f(p8bVar) ? 32 : 16);
        if (p65Var.P(i2 & 1, (i2 & 19) != 18)) {
            String strR = vo7.R(p65Var, R.string.repost_menu_repost);
            int i3 = i2 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION;
            int i4 = i2 & 14;
            boolean z = (i4 == 4) | (i3 == 32);
            Object objM = p65Var.M();
            uob uobVar = w12.a;
            if (z || objM == uobVar) {
                objM = new n8b(p8bVar, q8bVar, i);
                p65Var.j0(objM);
            }
            o28 o28Var = o28.b;
            k(strR, R.drawable.ic_repost_24, (m45) objM, r40.y(bgf.N(o28Var, "repost_menu_repost"), bmb.c(16.0f, 16.0f, 0.0f, 0.0f, 12)), p65Var, 0);
            h(null, p65Var, 0);
            String strR2 = vo7.R(p65Var, R.string.repost_menu_repost_with_note);
            int i5 = (i3 == 32 ? 1 : 0) | (i4 == 4 ? 1 : 0);
            Object objM2 = p65Var.M();
            if (i5 != 0 || objM2 == uobVar) {
                objM2 = new n8b(p8bVar, q8bVar, 1);
                p65Var.j0(objM2);
            }
            k(strR2, R.drawable.ic_edit_repost_24, (m45) objM2, r40.y(bgf.N(o28Var, "repost_menu_repost_with_note"), bmb.c(0.0f, 0.0f, 16.0f, 16.0f, 3)), p65Var, 0);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new m8b(q8bVar, p8bVar, i, 1);
        }
    }

    public static final void b(final dr9 dr9Var, boolean z, sh9 sh9Var, m45 m45Var, r28 r28Var, x12 x12Var, int i) {
        int i2;
        final sh9 sh9Var2;
        m45 m45Var2;
        p65 p65Var;
        dr9Var.getClass();
        sh9Var.getClass();
        m45Var.getClass();
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(-1844710097);
        if ((i & 6) == 0) {
            i2 = (p65Var2.f(dr9Var) ? 4 : 2) | i;
        } else {
            i2 = i;
        }
        if ((i & 48) == 0) {
            i2 |= p65Var2.g(z) ? 32 : 16;
        }
        if ((i & 384) == 0) {
            sh9Var2 = sh9Var;
            i2 |= p65Var2.f(sh9Var2) ? 256 : 128;
        } else {
            sh9Var2 = sh9Var;
        }
        if ((i & 3072) == 0) {
            m45Var2 = m45Var;
            i2 |= p65Var2.h(m45Var2) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024;
        } else {
            m45Var2 = m45Var;
        }
        if ((i & 24576) == 0) {
            i2 |= p65Var2.f(r28Var) ? OlympusMakernoteDirectory.TAG_MAIN_INFO : 8192;
        }
        if (p65Var2.P(i2 & 1, (i2 & 9363) != 9362)) {
            final sq9 sq9Var = dr9Var.u;
            final g08 g08Var = dr9Var.x;
            final l78 l78VarX = guc.x(dr9Var.o, new n99(false), p65Var2, 0);
            final l78 l78VarX2 = guc.x(sq9Var.b, zf9.a, p65Var2, 0);
            bo4 bo4Var = sq9Var.c;
            bt4 bt4Var = bt4.CANT_FOLLOW;
            final l78 l78VarX3 = guc.x(bo4Var, bt4Var, p65Var2, 48);
            final l78 l78VarX4 = guc.x(sq9Var.d, bt4Var, p65Var2, 48);
            bo4 bo4Var2 = sq9Var.e;
            d88 d88Var = d88.CANT_MUTE;
            final l78 l78VarX5 = guc.x(bo4Var2, d88Var, p65Var2, 48);
            int i3 = i2;
            final l78 l78VarX6 = guc.x(sq9Var.f, d88Var, p65Var2, 48);
            final l78 l78VarX7 = guc.x(dr9Var.s, null, p65Var2, 48);
            final l78 l78VarX8 = guc.x(dr9Var.A, dk9.a, p65Var2, 0);
            final m45 m45Var3 = m45Var2;
            int i4 = i3 >> 6;
            p65Var = p65Var2;
            xp7.b(z, m45Var, r28Var, 0L, null, null, null, 0L, 0.0f, pxf.E(-1981891414, new c55() { // from class: vj9
                /* JADX WARN: Removed duplicated region for block: B:201:0x089d  */
                @Override // defpackage.c55
                /*
                    Code decompiled incorrectly, please refer to instructions dump.
                    To view partially-correct add '--show-bad-code' argument
                */
                public final java.lang.Object f(java.lang.Object r35, java.lang.Object r36, java.lang.Object r37) {
                    /*
                        Method dump skipped, instruction units count: 3980
                        To view this dump add '--comments-level debug' option
                    */
                    throw new UnsupportedOperationException("Method not decompiled: defpackage.vj9.f(java.lang.Object, java.lang.Object, java.lang.Object):java.lang.Object");
                }
            }, p65Var2), p65Var, ((i3 >> 3) & 14) | (i4 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) | (i4 & 896), 2040);
        } else {
            p65Var = p65Var2;
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new mq(dr9Var, z, sh9Var, m45Var, r28Var, i);
        }
    }

    public static final bt4 c(upc upcVar) {
        return (bt4) upcVar.getValue();
    }

    public static final void d(String str, m45 m45Var, r28 r28Var, x12 x12Var, int i) {
        p65 p65Var;
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(1899502678);
        int i2 = i | (p65Var2.f(str) ? 4 : 2) | (p65Var2.h(m45Var) ? 32 : 16);
        if (p65Var2.P(i2 & 1, (i2 & 147) != 146)) {
            boolean z = (i2 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32;
            Object objM = p65Var2.M();
            int i3 = 14;
            if (z || objM == w12.a) {
                objM = new z23(i3, m45Var);
                p65Var2.j0(objM);
            }
            r28 r28VarE = jfc.e(jfc.d(hlg.r(r28Var, false, null, null, (m45) objM, 15), 1.0f), 48.0f);
            zk7 zk7VarC = dy0.c(z46.g, false);
            long j = p65Var2.T;
            int i4 = (int) (j ^ (j >>> 32));
            i89 i89VarL = p65Var2.l();
            r28 r28VarR = gx1.R(p65Var2, r28VarE);
            r12.W.getClass();
            ot2 ot2Var = q12.b;
            p65Var2.c0();
            if (p65Var2.S) {
                p65Var2.k(ot2Var);
            } else {
                p65Var2.m0();
            }
            tp7.B(p65Var2, q12.f, zk7VarC);
            tp7.B(p65Var2, q12.e, i89VarL);
            tp7.B(p65Var2, q12.g, Integer.valueOf(i4));
            tp7.y(p65Var2, q12.h);
            tp7.B(p65Var2, q12.d, r28VarR);
            jjd.b(str, jfc.d(r28Var, 1.0f), 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, ((bu7) p65Var2.j(jt7.c)).m, p65Var2, i2 & 14, 0, 131068);
            p65Var = p65Var2;
            p65Var.p(true);
        } else {
            p65Var = p65Var2;
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new qb(str, m45Var, r28Var, i, 4);
        }
    }

    public static final void e(vpc vpcVar, bo4 bo4Var, gg5 gg5Var, r28 r28Var, x12 x12Var, int i) {
        r28 r28Var2;
        vpcVar.getClass();
        bo4Var.getClass();
        p65 p65Var = (p65) x12Var;
        p65Var.a0(2037808312);
        int i2 = i | (p65Var.h(vpcVar) ? 4 : 2) | (p65Var.h(bo4Var) ? 32 : 16) | (p65Var.f(gg5Var) ? 256 : 128) | 3072;
        int i3 = 1;
        if (p65Var.P(i2 & 1, (i2 & 1171) != 1170)) {
            l78 l78VarZ = guc.z(vpcVar, p65Var, i2 & 14);
            mz1 mz1VarE = pxf.E(-1569107148, new sn8(gg5Var, 21, l78VarZ), p65Var);
            mz1 mz1VarE2 = pxf.E(1552115529, new g4a(l78VarZ, gg5Var), p65Var);
            o28 o28Var = o28.b;
            pr7.b(o28Var, mz1VarE, null, null, null, 0, 0L, 0L, null, mz1VarE2, p65Var, 805306422, 508);
            boolean zH = p65Var.h(bo4Var) | ((i2 & 896) == 256);
            Object objM = p65Var.M();
            if (zH || objM == w12.a) {
                objM = new nx9(bo4Var, gg5Var, null, i3);
                p65Var.j0(objM);
            }
            kyd.k(p65Var, (b55) objM, c1e.a);
            r28Var2 = o28Var;
        } else {
            p65Var.S();
            r28Var2 = r28Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new kf3(i, 19, r28Var2, (Object) vpcVar, (Object) bo4Var, (Object) gg5Var);
        }
    }

    public static final void f(String str, uza uzaVar, nhc nhcVar, x12 x12Var, int i) {
        str.getClass();
        nhcVar.getClass();
        p65 p65Var = (p65) x12Var;
        p65Var.a0(1575573485);
        int i2 = i | (p65Var.f(str) ? 4 : 2) | (p65Var.f("customize_reading_history") ? 32 : 16) | (p65Var.f(uzaVar) ? 256 : 128) | (p65Var.f(nhcVar) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024);
        if (p65Var.P(i2 & 1, (i2 & 1171) != 1170)) {
            boolean z = (i2 & 896) == 256;
            Object objM = p65Var.M();
            if (z || objM == w12.a) {
                objM = new uya(uzaVar);
                p65Var.j0(objM);
            }
            op8.B((uya) objM, str, "customize_reading_history", cy3.a, null, nhcVar, null, p65Var, ((i2 << 3) & PhotoshopDirectory.TAG_CAPTION) | ((i2 << 6) & 458752), 80);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new se9(i, 23, str, uzaVar, nhcVar);
        }
    }

    public static final void g(q8b q8bVar, p8b p8bVar, r28 r28Var, x12 x12Var, int i) {
        r28 r28Var2;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(765990683);
        int i2 = i | (p65Var.f(q8bVar) ? 4 : 2) | (p65Var.f(p8bVar) ? 32 : 16) | 384;
        if (p65Var.P(i2 & 1, (i2 & 147) != 146)) {
            boolean z = (i2 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32;
            Object objM = p65Var.M();
            uob uobVar = w12.a;
            if (z || objM == uobVar) {
                uta utaVar = new uta(0, p8bVar, l8b.class, "onDismissed", "onDismissed()V", 0, 15);
                p65Var.j0(utaVar);
                objM = utaVar;
            }
            m45 m45Var = (m45) ((qh6) objM);
            Object objM2 = p65Var.M();
            if (objM2 == uobVar) {
                objM2 = new qna(14);
                p65Var.j0(objM2);
            }
            r28Var2 = o28.b;
            vv2.r(m45Var, bgf.N(wxb.a(r28Var2, false, (x45) objM2), "repost_menu"), pxf.E(1906833835, new qg9(q8bVar, 17, p8bVar), p65Var), p65Var, 384);
        } else {
            p65Var.S();
            r28Var2 = r28Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new q6b(i, 4, q8bVar, p8bVar, r28Var2);
        }
    }

    public static final void h(r28 r28Var, x12 x12Var, int i) {
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-2054974150);
        int i2 = i | 6;
        if (p65Var.P(i2 & 1, (i2 & 3) != 2)) {
            o28 o28Var = o28.b;
            tp7.c(0.0f, 0, 4, ((zo7) p65Var.j(kt7.b)).a, p65Var, w2g.E(o28Var, 20.0f, 0.0f, 2));
            r28Var = o28Var;
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new cx9(r28Var, i, 20);
        }
    }

    public static final void i(q8b q8bVar, l8b l8bVar, r28 r28Var, x12 x12Var, int i) {
        p65 p65Var;
        r28 r28Var2;
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(-94966515);
        int i2 = i | (p65Var2.f(q8bVar) ? 4 : 2) | (p65Var2.f(l8bVar) ? 32 : 16) | 384;
        if (p65Var2.P(i2 & 1, (i2 & 147) != 146)) {
            v7c v7cVarF = t18.f(6, 2, p65Var2);
            Object objM = p65Var2.M();
            uob uobVar = w12.a;
            if (objM == uobVar) {
                objM = kyd.M(p65Var2);
                p65Var2.j0(objM);
            }
            sb2 sb2Var = (sb2) objM;
            boolean zH = p65Var2.h(sb2Var) | p65Var2.f(v7cVarF) | ((i2 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32);
            Object objM2 = p65Var2.M();
            if (zH || objM2 == uobVar) {
                objM2 = new ks0(sb2Var, v7cVarF, l8bVar);
                p65Var2.j0(objM2);
            }
            mz1 mz1VarE = pxf.E(-1080934583, new ov2(q8bVar, sb2Var, v7cVarF, l8bVar, 21), p65Var2);
            p65Var = p65Var2;
            o28 o28Var = o28.b;
            qq7.a((m45) objM2, o28Var, v7cVarF, mz1VarE, p65Var, 3120, 0);
            r28Var2 = o28Var;
        } else {
            p65Var = p65Var2;
            p65Var.S();
            r28Var2 = r28Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new q6b(i, 3, q8bVar, l8bVar, r28Var2);
        }
    }

    public static final void j(sb2 sb2Var, v7c v7cVar, l8b l8bVar, m45 m45Var) {
        vx0.c0(sb2Var, null, null, new mw9(m45Var, v7cVar, l8bVar, (n92) null, 15), 3);
    }

    public static final void k(String str, int i, m45 m45Var, r28 r28Var, x12 x12Var, int i2) {
        p65 p65Var = (p65) x12Var;
        p65Var.a0(1793904715);
        int i3 = (p65Var.f(str) ? 4 : 2) | i2 | (p65Var.d(i) ? 32 : 16) | (p65Var.h(m45Var) ? 256 : 128);
        if ((i2 & 3072) == 0) {
            i3 |= p65Var.f(r28Var) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024;
        }
        if (p65Var.P(i3 & 1, (i3 & 1171) != 1170)) {
            r28 r28VarC = w2g.C(hlg.r(jfc.d(r28Var, 1.0f), false, null, new vkb(0), m45Var, 11), 20.0f);
            omb ombVarA = nmb.a(qb8.f, z46.n, p65Var, 54);
            long j = p65Var.T;
            int i4 = (int) (j ^ (j >>> 32));
            i89 i89VarL = p65Var.l();
            r28 r28VarR = gx1.R(p65Var, r28VarC);
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
            mkd mkdVar = ((bu7) p65Var.j(jt7.c)).j;
            sn3 sn3Var = kt7.b;
            jjd.b(str, null, ((zo7) p65Var.j(sn3Var)).n, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, mkdVar, p65Var, i3 & 14, 0, 131066);
            p65Var = p65Var;
            qv5.b(vn7.J(i, (i3 >> 3) & 14, p65Var), null, jfc.l(o28.b, 24.0f), ((zo7) p65Var.j(sn3Var)).n, p65Var, 440, 0);
            p65Var.p(true);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new oc0(str, i, m45Var, r28Var, i2, 10);
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r4v29 */
    /* JADX WARN: Type inference failed for: r4v6 */
    /* JADX WARN: Type inference failed for: r4v7, types: [int] */
    public static final void l(q8b q8bVar, p8b p8bVar, x12 x12Var, int i) {
        ?? r4;
        int i2;
        r28 r28Var;
        boolean z;
        boolean z2;
        String str = q8bVar.d;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-926753942);
        int i3 = 2;
        int i4 = (p65Var.f(q8bVar) ? 4 : 2) | i | (p65Var.f(p8bVar) ? 32 : 16);
        if (p65Var.P(i4 & 1, (i4 & 19) != 18)) {
            String strR = vo7.R(p65Var, R.string.repost_menu_undo_repost);
            int i5 = i4 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION;
            int i6 = i4 & 14;
            boolean z3 = (i6 == 4) | (i5 == 32);
            Object objM = p65Var.M();
            uob uobVar = w12.a;
            Object obj = objM;
            if (z3 || objM == uobVar) {
                n8b n8bVar = new n8b(p8bVar, q8bVar, i3);
                p65Var.j0(n8bVar);
                obj = n8bVar;
            }
            o28 o28Var = o28.b;
            k(strR, R.drawable.ic_repost_24, (m45) obj, r40.y(bgf.N(o28Var, "repost_menu_undo_repost"), bmb.c(16.0f, 16.0f, 0.0f, 0.0f, 12)), p65Var, 0);
            int i7 = 3;
            if (str != null) {
                p65Var.Y(-883073704);
                p65Var.p(false);
                i2 = 3;
                z = false;
                r28Var = null;
            } else {
                p65Var.Y(-876238576);
                h(null, p65Var, 0);
                String strR2 = vo7.R(p65Var, R.string.repost_menu_add_note);
                boolean z4 = (i6 == 4) | (i5 == 32);
                Object objM2 = p65Var.M();
                Object obj2 = objM2;
                if (z4 || objM2 == uobVar) {
                    n8b n8bVar2 = new n8b(p8bVar, q8bVar, i7);
                    p65Var.j0(n8bVar2);
                    obj2 = n8bVar2;
                }
                i2 = 3;
                r28Var = null;
                k(strR2, R.drawable.ic_edit_repost_24, (m45) obj2, r40.y(bgf.N(o28Var, "repost_menu_add_note"), bmb.c(0.0f, 0.0f, 16.0f, 16.0f, 3)), p65Var, 0);
                z = false;
                p65Var.p(false);
            }
            if (str != null) {
                p65Var.Y(-875616003);
                h(r28Var, p65Var, z ? 1 : 0);
                String strR3 = vo7.R(p65Var, R.string.repost_menu_edit_note);
                int i8 = 4;
                boolean z5 = (i5 == 32) | (i6 == 4);
                Object objM3 = p65Var.M();
                Object obj3 = objM3;
                if (z5 || objM3 == uobVar) {
                    n8b n8bVar3 = new n8b(p8bVar, q8bVar, i8);
                    p65Var.j0(n8bVar3);
                    obj3 = n8bVar3;
                }
                k(strR3, R.drawable.ic_edit_repost_24, (m45) obj3, bgf.N(o28Var, "repost_menu_edit_note"), p65Var, 3072);
                h(r28Var, p65Var, 0);
                String strR4 = vo7.R(p65Var, R.string.repost_menu_remove_note);
                boolean z6 = (i5 == 32) | (i6 == 4);
                Object objM4 = p65Var.M();
                Object obj4 = objM4;
                if (z6 || objM4 == uobVar) {
                    n8b n8bVar4 = new n8b(p8bVar, q8bVar, 5);
                    p65Var.j0(n8bVar4);
                    obj4 = n8bVar4;
                }
                k(strR4, R.drawable.ic_circle_cross_24, (m45) obj4, r40.y(bgf.N(o28Var, "repost_menu_remove_note"), bmb.c(0.0f, 0.0f, 16.0f, 16.0f, i2)), p65Var, 0);
                z2 = false;
            } else {
                p65Var.Y(-883073704);
                z2 = z;
            }
            p65Var.p(z2);
            r4 = z2;
        } else {
            r4 = 0;
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new m8b(q8bVar, p8bVar, i, r4);
        }
    }

    public static final void m(int i, x12 x12Var, m45 m45Var, r28 r28Var) {
        r28 r28Var2;
        m45Var.getClass();
        p65 p65Var = (p65) x12Var;
        p65Var.a0(1555953618);
        int i2 = i | 6 | (p65Var.h(m45Var) ? 32 : 16);
        if (p65Var.P(i2 & 1, (i2 & 19) != 18)) {
            String strR = vo7.R(p65Var, R.string.user_profile_account_suspended_title);
            String strR2 = vo7.R(p65Var, R.string.user_profile_account_suspended_content);
            String strR3 = vo7.R(p65Var, R.string.user_profile_account_suspended_primary_button);
            int i3 = 6 | ((i2 << 15) & 3670016);
            r28Var2 = o28.b;
            gq7.a(r28Var2, null, strR, strR2, 0L, strR3, m45Var, null, null, 0.0f, 0.0f, p65Var, i3, 0, 1938);
        } else {
            p65Var.S();
            r28Var2 = r28Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new va(r28Var2, m45Var, i, 8);
        }
    }

    public static final pxd n(pqe pqeVar) {
        int i = jxd.a[pqeVar.ordinal()];
        if (i == 1) {
            return pxd.INV;
        }
        if (i == 2) {
            return pxd.IN;
        }
        if (i == 3) {
            return pxd.OUT;
        }
        ygf.a();
        return null;
    }

    public static final void o(wg5 wg5Var, ere ereVar) {
        ArrayList arrayList = ereVar.j;
        int size = arrayList.size();
        for (int i = 0; i < size; i++) {
            gre greVar = (gre) arrayList.get(i);
            if (greVar instanceof ire) {
                k59 k59Var = new k59();
                ire ireVar = (ire) greVar;
                k59Var.d = ireVar.b;
                k59Var.n = true;
                k59Var.c();
                k59Var.s.g(ireVar.c);
                k59Var.c();
                k59Var.c();
                k59Var.b = ireVar.d;
                k59Var.c();
                k59Var.c = ireVar.e;
                k59Var.c();
                k59Var.g = ireVar.f;
                k59Var.c();
                k59Var.e = ireVar.g;
                k59Var.c();
                k59Var.f = ireVar.h;
                k59Var.o = true;
                k59Var.c();
                k59Var.h = ireVar.i;
                k59Var.o = true;
                k59Var.c();
                k59Var.i = ireVar.j;
                k59Var.o = true;
                k59Var.c();
                k59Var.j = ireVar.k;
                k59Var.o = true;
                k59Var.c();
                k59Var.k = ireVar.l;
                k59Var.p = true;
                k59Var.c();
                k59Var.l = ireVar.m;
                k59Var.p = true;
                k59Var.c();
                k59Var.m = ireVar.n;
                k59Var.p = true;
                k59Var.c();
                wg5Var.e(i, k59Var);
            } else if (greVar instanceof ere) {
                wg5 wg5Var2 = new wg5();
                ere ereVar2 = (ere) greVar;
                wg5Var2.k = ereVar2.a;
                wg5Var2.c();
                wg5Var2.l = ereVar2.b;
                wg5Var2.s = true;
                wg5Var2.c();
                wg5Var2.o = ereVar2.e;
                wg5Var2.s = true;
                wg5Var2.c();
                wg5Var2.p = ereVar2.f;
                wg5Var2.s = true;
                wg5Var2.c();
                wg5Var2.q = ereVar2.g;
                wg5Var2.s = true;
                wg5Var2.c();
                wg5Var2.r = ereVar2.h;
                wg5Var2.s = true;
                wg5Var2.c();
                wg5Var2.m = ereVar2.c;
                wg5Var2.s = true;
                wg5Var2.c();
                wg5Var2.n = ereVar2.d;
                wg5Var2.s = true;
                wg5Var2.c();
                wg5Var2.f = ereVar2.i;
                wg5Var2.g = true;
                wg5Var2.c();
                o(wg5Var2, ereVar2);
                wg5Var.e(i, wg5Var2);
            }
        }
    }

    public static final boolean p(String str, String str2) {
        str.getClass();
        if (str.equals(str2)) {
            return true;
        }
        if (str.length() != 0) {
            int i = 0;
            int i2 = 0;
            int i3 = 0;
            while (true) {
                if (i < str.length()) {
                    char cCharAt = str.charAt(i);
                    int i4 = i3 + 1;
                    if (i3 == 0 && cCharAt != '(') {
                        break;
                    }
                    if (cCharAt == '(') {
                        i2++;
                    } else if (cCharAt == ')' && i2 - 1 == 0 && i3 != str.length() - 1) {
                        break;
                    }
                    i++;
                    i3 = i4;
                } else if (i2 == 0) {
                    return g76.L(muc.y0(str.substring(1, str.length() - 1)).toString(), str2);
                }
            }
        }
        return false;
    }

    public static final float q(float f) {
        float fIntBitsToFloat = Float.intBitsToFloat(((int) ((((long) Float.floatToRawIntBits(f)) & 8589934591L) / 3)) + 709952852);
        float f2 = fIntBitsToFloat - ((fIntBitsToFloat - (f / (fIntBitsToFloat * fIntBitsToFloat))) * 0.33333334f);
        return f2 - ((f2 - (f / (f2 * f2))) * 0.33333334f);
    }

    public static final int r(int i, List list) {
        int i2;
        int i3 = ((y19) bu1.H0(list)).c;
        if (i > ((y19) bu1.H0(list)).c) {
            c26.a("Index " + i + " should be less or equal than last line's end " + i3);
        }
        int size = list.size() - 1;
        int i4 = 0;
        while (true) {
            if (i4 > size) {
                i2 = -(i4 + 1);
                break;
            }
            i2 = (i4 + size) >>> 1;
            y19 y19Var = (y19) list.get(i2);
            byte b2 = y19Var.b > i ? (byte) 1 : y19Var.c <= i ? (byte) -1 : (byte) 0;
            if (b2 >= 0) {
                if (b2 <= 0) {
                    break;
                }
                size = i2 - 1;
            } else {
                i4 = i2 + 1;
            }
        }
        if (i2 >= 0 && i2 < list.size()) {
            return i2;
        }
        StringBuilder sbC = ev6.C("Found paragraph index ", i2, " should be in range [0, ");
        sbC.append(list.size());
        sbC.append(").\nDebug info: index=");
        sbC.append(i);
        sbC.append(", paragraphs=[");
        sbC.append(z27.b(list, null, new ss7(13), 31));
        sbC.append(']');
        c26.a(sbC.toString());
        return i2;
    }

    public static final int s(int i, List list) {
        int size = list.size() - 1;
        int i2 = 0;
        while (i2 <= size) {
            int i3 = (i2 + size) >>> 1;
            y19 y19Var = (y19) list.get(i3);
            byte b2 = y19Var.d > i ? (byte) 1 : y19Var.e <= i ? (byte) -1 : (byte) 0;
            if (b2 < 0) {
                i2 = i3 + 1;
            } else {
                if (b2 <= 0) {
                    return i3;
                }
                size = i3 - 1;
            }
        }
        return -(i2 + 1);
    }

    public static final int t(ArrayList arrayList, float f) {
        if (f <= 0.0f) {
            return 0;
        }
        if (f >= ((y19) bu1.H0(arrayList)).g) {
            return arrayList.size() - 1;
        }
        int size = arrayList.size() - 1;
        int i = 0;
        while (i <= size) {
            int i2 = (i + size) >>> 1;
            y19 y19Var = (y19) arrayList.get(i2);
            byte b2 = y19Var.f > f ? (byte) 1 : y19Var.g <= f ? (byte) -1 : (byte) 0;
            if (b2 < 0) {
                i = i2 + 1;
            } else {
                if (b2 <= 0) {
                    return i2;
                }
                size = i2 - 1;
            }
        }
        return -(i + 1);
    }

    public static final void u(ArrayList arrayList, long j, x45 x45Var) {
        int size = arrayList.size();
        for (int iR = r(bkd.f(j), arrayList); iR < size; iR++) {
            y19 y19Var = (y19) arrayList.get(iR);
            if (y19Var.b >= bkd.e(j)) {
                return;
            }
            if (y19Var.b != y19Var.c) {
                x45Var.invoke(y19Var);
            }
        }
    }

    public static final el7 w(yt6 yt6Var, int i, long j, wy8 wy8Var, long j2, hw8 hw8Var, zq0 zq0Var, ip6 ip6Var, int i2, k68 k68Var) {
        List list;
        Object objC = wy8Var.c(i);
        List list2 = (List) k68Var.b(i);
        if (list2 != null) {
            list = list2;
        } else {
            List listA = yt6Var.a(i);
            int size = listA.size();
            ArrayList arrayList = new ArrayList(size);
            int iQ = 0;
            while (iQ < size) {
                iQ = km4.q((tk7) listA.get(iQ), j, arrayList, iQ, 1);
            }
            k68Var.i(i, arrayList);
            list = arrayList;
        }
        return new el7(i, i2, list, j2, objC, hw8Var, zq0Var, ip6Var);
    }

    public static final int x(dne dneVar) {
        dneVar.getClass();
        switch (gkd.a[dneVar.ordinal()]) {
            case 1:
                return R.style.UserTextSizePreference_Smallest;
            case 2:
                return R.style.UserTextSizePreference_Smaller;
            case 3:
                return R.style.UserTextSizePreference_Small;
            case 4:
                return R.style.UserTextSizePreference_Normal;
            case 5:
                return R.style.UserTextSizePreference_Large;
            case 6:
                return R.style.UserTextSizePreference_Larger;
            case 7:
                return R.style.UserTextSizePreference_Largest;
            default:
                ygf.a();
                return 0;
        }
    }

    public static final String y(Method method) {
        StringBuilder sb = new StringBuilder();
        sb.append(method.getName());
        Class<?>[] parameterTypes = method.getParameterTypes();
        parameterTypes.getClass();
        sb.append(k80.D0(parameterTypes, "", "(", ")", p79.s, 24));
        Class<?> returnType = method.getReturnType();
        returnType.getClass();
        sb.append(e0b.b(returnType));
        return sb.toString();
    }

    public static final Object z(fi8 fi8Var, fj6 fj6Var) {
        fi8Var.getClass();
        fj6Var.getClass();
        return fi8Var.invoke();
    }

    public abstract void K(meg megVar, meg megVar2);

    public abstract void L(meg megVar, Thread thread);

    public abstract boolean N(ggg gggVar, k6g k6gVar, k6g k6gVar2);

    public abstract boolean O(ggg gggVar, Object obj, Object obj2);

    public abstract boolean P(ggg gggVar, meg megVar, meg megVar2);

    public static final String v(Collection collection) {
        if (!collection.isEmpty()) {
            return nuc.A(bu1.F0(collection, ",\n", "\n", MaAxRJinch.JsPTHmKnfg, null, 56)).concat("},");
        }
        return " }";
    }
}
