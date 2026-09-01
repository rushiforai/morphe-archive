package defpackage;

import android.content.Context;
import android.content.res.Resources;
import android.view.View;
import android.view.ViewParent;
import android.view.inputmethod.EditorInfo;
import android.view.inputmethod.InputConnection;
import android.widget.TextView;
import com.drew.imaging.riff.pvS.uuLAxLN;
import com.drew.lang.RandomAccessStreamReader;
import com.drew.metadata.exif.makernotes.OlympusMakernoteDirectory;
import com.drew.metadata.exif.makernotes.PanasonicMakernoteDirectory;
import com.drew.metadata.exif.makernotes.ReconyxHyperFire2MakernoteDirectory;
import com.drew.metadata.exif.makernotes.ReconyxUltraFireMakernoteDirectory;
import com.drew.metadata.photoshop.PhotoshopDirectory;
import com.medium.reader.R;
import gen.model.SourceParameter;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Collection;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.RejectedExecutionException;
import javax.net.ssl.SSLPeerUnverifiedException;
import javax.net.ssl.SSLSession;
import kotlinx.serialization.SerializationException;
import org.json.JSONArray;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public abstract /* synthetic */ class flb implements kw2, f22 {
    public static final mz1 a = new mz1(new yz1(8), false, -785057477);
    public static final mz1 b = new mz1(new yz1(9), false, -1921537993);
    public static final mz1 c = new mz1(new yz1(10), false, 1157886629);
    public static final mz1 d = new mz1(new yz1(11), false, -1319559308);
    public static final mz1 e = new mz1(new f02(18), false, -1598844483);
    public static final mz1 f = new mz1(new n02(24), false, -408336200);
    public static final p73 g = new p73(1.0f, 1.0f);
    public static final q84 h = new q84(Boolean.TRUE);
    public static final d1g i;
    public static final d1g j;
    public static final d1g k;
    public static final d1g l;
    public static final /* synthetic */ int m = 0;
    public static boolean n;
    public static final /* synthetic */ int o = 0;
    public static by5 p;

    static {
        boolean z = false;
        int i2 = 16;
        i = new d1g(i2, "NULL", z);
        j = new d1g(i2, "UNINITIALIZED", z);
        k = new d1g(i2, "DONE", z);
        l = new d1g(15, "ResolutionAnchorProvider", z);
    }

    public static ArrayList A0(ArrayList arrayList, Calendar calendar) {
        int i2;
        Calendar calendarG = pwd.G(null);
        if (calendar.get(1) == calendarG.get(1)) {
            i2 = calendarG.get(2);
            if (i2 < 2) {
                i2 = 2;
            }
        } else {
            i2 = 11;
        }
        int iP = ei7.P(cu1.k0(arrayList, 10));
        if (iP < 16) {
            iP = 16;
        }
        LinkedHashMap linkedHashMap = new LinkedHashMap(iP);
        for (Object obj : arrayList) {
            linkedHashMap.put(Integer.valueOf(pwd.G(Long.valueOf(((kb9) obj).b)).get(2)), obj);
        }
        n46 n46Var = new n46(0, i2, 1);
        ArrayList arrayList2 = new ArrayList(cu1.k0(n46Var, 10));
        Iterator it2 = n46Var.iterator();
        while (((m46) it2).c) {
            int iNextInt = ((g46) it2).nextInt();
            Calendar calendarG2 = pwd.G(null);
            calendarG2.set(1, calendar.get(1));
            calendarG2.set(2, iNextInt);
            calendarG2.set(5, 1);
            kb9 kb9Var = (kb9) linkedHashMap.get(Integer.valueOf(iNextInt));
            if (kb9Var == null) {
                kb9Var = new kb9(null, calendarG2.getTimeInMillis(), null);
            }
            arrayList2.add(kb9Var);
        }
        return arrayList2;
    }

    public static void B0(ne8 ne8Var, xua xuaVar) {
        xuaVar.y0(ne8Var.a);
        xuaVar.writeByte(10);
        xuaVar.y0(ne8Var.b);
        xuaVar.writeByte(10);
        xuaVar.y0(ne8Var.c);
        xuaVar.writeByte(10);
        Set<Map.Entry> setEntrySet = ne8Var.d.a.entrySet();
        Iterator it2 = setEntrySet.iterator();
        int size = 0;
        while (it2.hasNext()) {
            size += ((List) ((Map.Entry) it2.next()).getValue()).size();
        }
        xuaVar.y0(size);
        xuaVar.writeByte(10);
        for (Map.Entry entry : setEntrySet) {
            for (String str : (List) entry.getValue()) {
                xuaVar.Y((String) entry.getKey());
                xuaVar.Y(":");
                xuaVar.Y(str);
                xuaVar.writeByte(10);
            }
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:104:0x0128  */
    /* JADX WARN: Removed duplicated region for block: B:107:0x0131  */
    /* JADX WARN: Removed duplicated region for block: B:141:0x0215  */
    /* JADX WARN: Removed duplicated region for block: B:144:0x0224  */
    /* JADX WARN: Removed duplicated region for block: B:148:0x022f  */
    /* JADX WARN: Removed duplicated region for block: B:152:0x024a  */
    /* JADX WARN: Removed duplicated region for block: B:157:0x02a5  */
    /* JADX WARN: Removed duplicated region for block: B:160:0x02b4  */
    /* JADX WARN: Removed duplicated region for block: B:166:? A[RETURN, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:69:0x00c2  */
    /* JADX WARN: Removed duplicated region for block: B:76:0x00d5  */
    /* JADX WARN: Removed duplicated region for block: B:77:0x00da  */
    /* JADX WARN: Removed duplicated region for block: B:86:0x00f3  */
    /* JADX WARN: Removed duplicated region for block: B:87:0x00f6  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final void C(final defpackage.mx r21, final defpackage.r28 r22, final defpackage.mkd r23, final defpackage.x45 r24, final int r25, final boolean r26, final int r27, int r28, final java.util.Map r29, defpackage.dv1 r30, defpackage.oh0 r31, defpackage.x12 r32, final int r33, final int r34, final int r35) {
        /*
            Method dump skipped, instruction units count: 722
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.flb.C(mx, r28, mkd, x45, int, boolean, int, int, java.util.Map, dv1, oh0, x12, int, int, int):void");
    }

    /* JADX WARN: Removed duplicated region for block: B:105:0x012f  */
    /* JADX WARN: Removed duplicated region for block: B:106:0x0131  */
    /* JADX WARN: Removed duplicated region for block: B:109:0x013a  */
    /* JADX WARN: Removed duplicated region for block: B:160:0x027f  */
    /* JADX WARN: Removed duplicated region for block: B:163:0x0293  */
    /* JADX WARN: Removed duplicated region for block: B:172:? A[RETURN, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:38:0x006a  */
    /* JADX WARN: Removed duplicated region for block: B:40:0x006f  */
    /* JADX WARN: Removed duplicated region for block: B:49:0x0087  */
    /* JADX WARN: Removed duplicated region for block: B:51:0x008b  */
    /* JADX WARN: Removed duplicated region for block: B:60:0x00a2  */
    /* JADX WARN: Removed duplicated region for block: B:62:0x00a6  */
    /* JADX WARN: Removed duplicated region for block: B:71:0x00be  */
    /* JADX WARN: Removed duplicated region for block: B:73:0x00c5  */
    /* JADX WARN: Removed duplicated region for block: B:82:0x00e0  */
    /* JADX WARN: Removed duplicated region for block: B:84:0x00e7  */
    /* JADX WARN: Removed duplicated region for block: B:93:0x0102 A[PHI: r19
      0x0102: PHI (r19v15 int) = (r19v4 int), (r19v10 int), (r19v11 int) binds: [B:92:0x0100, B:102:0x011d, B:101:0x011a] A[DONT_GENERATE, DONT_INLINE]] */
    /* JADX WARN: Removed duplicated region for block: B:94:0x0105  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final void D(final java.lang.String r21, final defpackage.r28 r22, final defpackage.mkd r23, defpackage.x45 r24, int r25, boolean r26, int r27, int r28, defpackage.dv1 r29, defpackage.oh0 r30, defpackage.x12 r31, final int r32, final int r33) {
        /*
            Method dump skipped, instruction units count: 677
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.flb.D(java.lang.String, r28, mkd, x45, int, boolean, int, int, dv1, oh0, x12, int, int):void");
    }

    public static final void E(lj3 lj3Var, m45 m45Var, r28 r28Var, float f2, x12 x12Var, int i2) {
        r28 r28Var2;
        float f3;
        float f4;
        lj3Var.getClass();
        m45Var.getClass();
        p65 p65Var = (p65) x12Var;
        p65Var.a0(1692855209);
        int i3 = i2 | (p65Var.d(lj3Var.ordinal()) ? 4 : 2) | (p65Var.h(m45Var) ? 32 : 16) | 3456;
        if (p65Var.P(i3 & 1, (i3 & 1171) != 1170)) {
            o28 o28Var = o28.b;
            r28 r28VarL = jfc.l(o28Var, 18.0f);
            fr5 fr5Var = g56.a;
            r28 r28VarB = r28VarL.b(w08.b);
            boolean z = lj3Var == lj3.DOWNLOADING;
            boolean z2 = !d46.R(lj3.NOT_DOWNLOADED_DISABLED, lj3.DOWNLOADED_DISABLED).contains(lj3Var);
            if (z) {
                p65Var.Y(344036046);
                f4 = 18.0f;
                xz5.o(bgf.N(w2g.C(r28VarB, 1.0f), "download_button_downloading"), ((Boolean) p65Var.j(l36.a)).booleanValue() ? Float.valueOf(0.75f) : null, 2.0f, 0L, 0L, 0, p65Var, 384, 120);
                p65Var.p(false);
            } else {
                f4 = 18.0f;
                p65Var.Y(344323323);
                f49.l(m45Var, bgf.N(r28VarB, "download_button"), z2, null, null, pxf.E(-269714905, new l23(9, lj3Var), p65Var), p65Var, ((i3 >> 3) & 14) | 1572864, 56);
                p65Var = p65Var;
                p65Var.p(false);
            }
            r28Var2 = o28Var;
            f3 = f4;
        } else {
            p65Var.S();
            r28Var2 = r28Var;
            f3 = f2;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new dj3(lj3Var, m45Var, r28Var2, f3, i2, 0);
        }
    }

    public static final void F(SourceParameter sourceParameter, ddf ddfVar, r28 r28Var, x12 x12Var, int i2) {
        r28 r28Var2;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-1606485534);
        int i3 = 4;
        int i4 = i2 | (p65Var.f(sourceParameter) ? 4 : 2) | (p65Var.f(ddfVar) ? 32 : 16) | 384;
        if (p65Var.P(i4 & 1, (i4 & 147) != 146)) {
            mz1 mz1Var = vx0.r;
            String strR = vo7.R(p65Var, R.string.your_following_feed_entity_end_of_feed_title);
            String strR2 = vo7.R(p65Var, R.string.your_following_feed_entity_end_of_feed_content);
            String strR3 = vo7.R(p65Var, R.string.your_following_feed_entity_end_of_feed_action);
            boolean z = ((i4 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32) | ((i4 & 14) == 4);
            Object objM = p65Var.M();
            if (z || objM == w12.a) {
                objM = new scf(ddfVar, sourceParameter, i3);
                p65Var.j0(objM);
            }
            r28Var2 = o28.b;
            gq7.a(r28Var2, mz1Var, strR, strR2, 0L, null, null, strR3, (m45) objM, 0.0f, 0.0f, p65Var, 54, 0, 1648);
        } else {
            p65Var.S();
            r28Var2 = r28Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new rcf(sourceParameter, ddfVar, r28Var2, i2, 0);
        }
    }

    public static final void G(final m45 m45Var, final r28 r28Var, final m3c m3cVar, final long j2, final long j3, final rn4 rn4Var, final mz1 mz1Var, x12 x12Var, final int i2) {
        int i3;
        p65 p65Var;
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(748201188);
        if ((i2 & 6) == 0) {
            i3 = (p65Var2.h(m45Var) ? 4 : 2) | i2;
        } else {
            i3 = i2;
        }
        if ((i2 & 48) == 0) {
            i3 |= p65Var2.f(r28Var) ? 32 : 16;
        }
        if ((i2 & 384) == 0) {
            i3 |= p65Var2.f(m3cVar) ? 256 : 128;
        }
        if ((i2 & 3072) == 0) {
            i3 |= p65Var2.e(j2) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024;
        }
        if ((i2 & 24576) == 0) {
            i3 |= p65Var2.e(j3) ? OlympusMakernoteDirectory.TAG_MAIN_INFO : 8192;
        }
        if ((196608 & i2) == 0) {
            i3 |= p65Var2.f(rn4Var) ? 131072 : ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID;
        }
        if ((1572864 & i2) == 0) {
            i3 |= p65Var2.f(null) ? 1048576 : 524288;
        }
        if ((12582912 & i2) == 0) {
            i3 |= p65Var2.h(mz1Var) ? 8388608 : 4194304;
        }
        if (p65Var2.P(i3 & 1, (4793491 & i3) != 4793490)) {
            p65Var2.U();
            if ((i2 & 1) != 0 && !p65Var2.z()) {
                p65Var2.S();
            }
            p65Var2.q();
            int i4 = i3 << 9;
            p65Var = p65Var2;
            H(m45Var, pyd.a(j74.a, p65Var2), s84.a, r28Var, m3cVar, j2, j3, rn4Var, mz1Var, p65Var, (i3 & 14) | 3456 | (i4 & 57344) | (i4 & 458752) | (i4 & 3670016) | (i4 & 29360128) | (i4 & 234881024) | (i4 & 1879048192), (i3 >> 21) & 14);
        } else {
            p65Var = p65Var2;
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new b55() { // from class: vn4
                @Override // defpackage.b55
                public final Object invoke(Object obj, Object obj2) {
                    ((Integer) obj2).getClass();
                    flb.G(m45Var, r28Var, m3cVar, j2, j3, rn4Var, mz1Var, (x12) obj, tr7.y(i2 | 1));
                    return c1e.a;
                }
            };
        }
    }

    public static final void H(final m45 m45Var, final mkd mkdVar, final float f2, final r28 r28Var, final m3c m3cVar, final long j2, final long j3, final rn4 rn4Var, final mz1 mz1Var, x12 x12Var, final int i2, final int i3) {
        int i4;
        m3c m3cVar2;
        mz1 mz1Var2;
        int i5;
        p65 p65Var;
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(121669932);
        if ((i2 & 6) == 0) {
            i4 = (p65Var2.h(m45Var) ? 4 : 2) | i2;
        } else {
            i4 = i2;
        }
        if ((i2 & 48) == 0) {
            i4 |= p65Var2.f(mkdVar) ? 32 : 16;
        }
        if ((i2 & 384) == 0) {
            i4 |= p65Var2.c(f2) ? 256 : 128;
        }
        if ((i2 & 3072) == 0) {
            i4 |= p65Var2.c(56.0f) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024;
        }
        if ((i2 & 24576) == 0) {
            i4 |= p65Var2.f(r28Var) ? OlympusMakernoteDirectory.TAG_MAIN_INFO : 8192;
        }
        if ((196608 & i2) == 0) {
            m3cVar2 = m3cVar;
            i4 |= p65Var2.f(m3cVar2) ? 131072 : ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID;
        } else {
            m3cVar2 = m3cVar;
        }
        if ((1572864 & i2) == 0) {
            i4 |= p65Var2.e(j2) ? 1048576 : 524288;
        }
        if ((12582912 & i2) == 0) {
            i4 |= p65Var2.e(j3) ? 8388608 : 4194304;
        }
        if ((100663296 & i2) == 0) {
            i4 |= p65Var2.f(rn4Var) ? 67108864 : 33554432;
        }
        if ((805306368 & i2) == 0) {
            i4 |= p65Var2.f(null) ? 536870912 : 268435456;
        }
        if ((i3 & 6) == 0) {
            mz1Var2 = mz1Var;
            i5 = i3 | (p65Var2.h(mz1Var2) ? 4 : 2);
        } else {
            mz1Var2 = mz1Var;
            i5 = i3;
        }
        int i6 = i4;
        boolean z = true;
        if (p65Var2.P(i6 & 1, ((i4 & 306783379) == 306783378 && (i5 & 3) == 2) ? false : true)) {
            p65Var2.U();
            if ((i2 & 1) != 0 && !p65Var2.z()) {
                p65Var2.S();
            }
            p65Var2.q();
            p65Var2.Y(-282833393);
            Object objM = p65Var2.M();
            uob uobVar = w12.a;
            if (objM == uobVar) {
                objM = ka1.k(p65Var2);
            }
            m68 m68Var = (m68) objM;
            p65Var2.p(false);
            Object objM2 = p65Var2.M();
            if (objM2 == uobVar) {
                objM2 = new iz2(29);
                p65Var2.j0(objM2);
            }
            r28 r28VarA = wxb.a(r28Var, false, (x45) objM2);
            float f3 = rn4Var.a;
            int i7 = i6 >> 21;
            int i8 = i7 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION;
            boolean zF = p65Var2.f(m68Var);
            Object objM3 = p65Var2.M();
            if (zF || objM3 == uobVar) {
                objM3 = new un4(rn4Var.a, rn4Var.b, rn4Var.d, rn4Var.c);
                p65Var2.j0(objM3);
            }
            un4 un4Var = (un4) objM3;
            boolean zH = p65Var2.h(un4Var);
            if (((i8 ^ 48) <= 32 || !p65Var2.f(rn4Var)) && (i7 & 48) != 32) {
                z = false;
            }
            boolean z2 = zH | z;
            Object objM4 = p65Var2.M();
            int i9 = 6;
            if (z2 || objM4 == uobVar) {
                objM4 = new xs3(un4Var, rn4Var, null, i9);
                p65Var2.j0(objM4);
            }
            kyd.k(p65Var2, (b55) objM4, rn4Var);
            boolean zF2 = p65Var2.f(m68Var) | p65Var2.h(un4Var);
            Object objM5 = p65Var2.M();
            if (zF2 || objM5 == uobVar) {
                objM5 = new ku2(m68Var, un4Var, null, 20);
                p65Var2.j0(objM5);
            }
            kyd.k(p65Var2, (b55) objM5, m68Var);
            int i10 = i6 >> 6;
            p65Var = p65Var2;
            g3d.b(m45Var, r28VarA, false, m3cVar2, j2, j3, f3, ((vj3) un4Var.e.c.b.getValue()).a, null, m68Var, pxf.E(-1779603465, new xn4(j3, mkdVar, f2, mz1Var2), p65Var2), p65Var, (i6 & 14) | (i10 & 7168) | (57344 & i10) | (i10 & 458752), 260);
        } else {
            p65Var = p65Var2;
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new b55() { // from class: wn4
                @Override // defpackage.b55
                public final Object invoke(Object obj, Object obj2) {
                    ((Integer) obj2).getClass();
                    int iY = tr7.y(i2 | 1);
                    int iY2 = tr7.y(i3);
                    flb.H(m45Var, mkdVar, f2, r28Var, m3cVar, j2, j3, rn4Var, mz1Var, (x12) obj, iY, iY2);
                    return c1e.a;
                }
            };
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:157:0x0202  */
    /* JADX WARN: Type inference failed for: r0v11, types: [p65] */
    /* JADX WARN: Type inference failed for: r0v12, types: [p65] */
    /* JADX WARN: Type inference failed for: r0v28, types: [p65, x12] */
    /* JADX WARN: Type inference failed for: r0v60 */
    /* JADX WARN: Type inference failed for: r0v61 */
    /* JADX WARN: Type inference failed for: r21v1 */
    /* JADX WARN: Type inference failed for: r2v4, types: [boolean] */
    /* JADX WARN: Type inference failed for: r3v2, types: [java.lang.Object, l78] */
    /* JADX WARN: Type inference failed for: r4v12 */
    /* JADX WARN: Type inference failed for: r4v3 */
    /* JADX WARN: Type inference failed for: r4v4, types: [java.lang.Object, vjd] */
    /* JADX WARN: Type inference failed for: r7v1, types: [p65, x12] */
    /* JADX WARN: Type inference failed for: r8v13 */
    /* JADX WARN: Type inference failed for: r8v14, types: [java.lang.Object, l78] */
    /* JADX WARN: Type inference failed for: r8v49 */
    /* JADX WARN: Type inference failed for: r9v14, types: [ey3] */
    /* JADX WARN: Type inference failed for: r9v15, types: [java.util.Collection] */
    /* JADX WARN: Type inference failed for: r9v16, types: [java.util.List] */
    /* JADX WARN: Type inference failed for: r9v18 */
    /* JADX WARN: Type inference failed for: r9v19, types: [java.util.ArrayList] */
    /* JADX WARN: Type inference failed for: r9v20 */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final void I(final defpackage.r28 r30, defpackage.mx r31, final defpackage.x45 r32, final boolean r33, final java.util.Map r34, final defpackage.mkd r35, final int r36, final boolean r37, final int r38, final int r39, final defpackage.yy4 r40, final defpackage.dv1 r41, final defpackage.x45 r42, final defpackage.oh0 r43, defpackage.x12 r44, final int r45, final int r46) {
        /*
            Method dump skipped, instruction units count: 1164
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.flb.I(r28, mx, x45, boolean, java.util.Map, mkd, int, boolean, int, int, yy4, dv1, x45, oh0, x12, int, int):void");
    }

    public static final void J(stc stcVar, r28 r28Var, x12 x12Var, int i2) {
        int i3;
        r28 r28Var2;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(904954087);
        if ((i2 & 6) == 0) {
            i3 = (p65Var.d(stcVar.ordinal()) ? 4 : 2) | i2;
        } else {
            i3 = i2;
        }
        if ((i2 & 48) == 0) {
            i3 |= p65Var.f(r28Var) ? 32 : 16;
        }
        if (p65Var.P(i3 & 1, (i3 & 19) != 18)) {
            boolean z = ((i3 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32) | ((i3 & 14) == 4);
            Object objM = p65Var.M();
            if (z || objM == w12.a) {
                objM = new pda(r28Var, 21, stcVar);
                p65Var.j0(objM);
            }
            r28Var2 = r28Var;
            k40.t(r28Var2, null, null, null, null, null, false, null, (x45) objM, p65Var, ((i3 >> 3) & 14) | 12582912, 382);
        } else {
            r28Var2 = r28Var;
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new meb(stcVar, r28Var2, i2, 7);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:77:0x012b  */
    /* JADX WARN: Removed duplicated region for block: B:81:0x0135  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final void K(defpackage.kv6 r22, defpackage.z9d r23, defpackage.stc r24, defpackage.t9d r25, defpackage.sh9 r26, defpackage.r28 r27, defpackage.x12 r28, int r29) {
        /*
            Method dump skipped, instruction units count: 356
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.flb.K(kv6, z9d, stc, t9d, sh9, r28, x12, int):void");
    }

    public static final void L(aw4 aw4Var, SourceParameter sourceParameter, ddf ddfVar, r28 r28Var, x12 x12Var, int i2) {
        r28 r28Var2;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(363386180);
        int i3 = i2 | (p65Var.f(aw4Var) ? 4 : 2) | (p65Var.f(sourceParameter) ? 32 : 16) | (p65Var.f(ddfVar) ? 256 : 128) | 3072;
        if (p65Var.P(i3 & 1, (i3 & 1171) != 1170)) {
            boolean z = ((i3 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32) | ((i3 & 14) == 4) | ((i3 & 896) == 256);
            Object objM = p65Var.M();
            if (z || objM == w12.a) {
                objM = new ukd(ddfVar, aw4Var, sourceParameter, 9);
                p65Var.j0(objM);
            }
            o28 o28Var = o28.b;
            r28 r28VarN = bgf.N(w2g.F(hlg.r(o28Var, false, null, null, (m45) objM, 15), 24.0f, 12.0f, 24.0f, 12.0f), "selected_publication");
            omb ombVarA = nmb.a(qb8.a, z46.n, p65Var, 48);
            long j2 = p65Var.T;
            int i4 = (int) ((j2 >>> 32) ^ j2);
            i89 i89VarL = p65Var.l();
            r28 r28VarR = gx1.R(p65Var, r28VarN);
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
            hp7.o(aw4Var.c, hl0.XXXS, null, null, null, 0.0f, 0, null, null, p65Var, 48, 2044);
            String str = aw4Var.b;
            r28 r28VarU = km4.u(1.0f, w2g.G(o28Var, 8.0f, 0.0f, 8.0f, 0.0f, 10), true);
            sn3 sn3Var = jt7.c;
            jjd.b(str, r28VarU, 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, ((bu7) p65Var.j(sn3Var)).n, p65Var, 0, 0, 131068);
            String strR = vo7.R(p65Var, R.string.your_following_feed_publication);
            mkd mkdVar = ((bu7) p65Var.j(sn3Var)).n;
            sn3 sn3Var2 = kt7.b;
            jjd.b(strR, null, 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, mkd.a(mkdVar, ((zo7) p65Var.j(sn3Var2)).o, 0L, null, null, null, 0L, 0L, null, 0, 0L, null, null, 16777214), p65Var, 0, 0, 131070);
            p65Var = p65Var;
            qv5.b(vn7.J(R.drawable.ic_chevron_right_16, 0, p65Var), null, w2g.G(o28Var, 8.0f, 0.0f, 0.0f, 0.0f, 14), ((zo7) p65Var.j(sn3Var2)).o, p65Var, 440, 0);
            p65Var.p(true);
            r28Var2 = o28Var;
        } else {
            p65Var.S();
            r28Var2 = r28Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new adf(aw4Var, sourceParameter, ddfVar, r28Var2, i2);
        }
    }

    public static final void M(jw4 jw4Var, SourceParameter sourceParameter, ddf ddfVar, r28 r28Var, x12 x12Var, int i2) {
        r28 r28Var2;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-2136043956);
        int i3 = i2 | (p65Var.f(jw4Var) ? 4 : 2) | (p65Var.f(sourceParameter) ? 32 : 16) | (p65Var.f(ddfVar) ? 256 : 128) | 3072;
        if (p65Var.P(i3 & 1, (i3 & 1171) != 1170)) {
            boolean z = ((i3 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32) | ((i3 & 14) == 4) | ((i3 & 896) == 256);
            Object objM = p65Var.M();
            if (z || objM == w12.a) {
                objM = new ukd(ddfVar, jw4Var, sourceParameter, 7);
                p65Var.j0(objM);
            }
            o28 o28Var = o28.b;
            r28 r28VarN = bgf.N(w2g.F(hlg.r(o28Var, false, null, null, (m45) objM, 15), 24.0f, 12.0f, 24.0f, 12.0f), "selected_writer");
            omb ombVarA = nmb.a(qb8.a, z46.n, p65Var, 48);
            long j2 = p65Var.T;
            int i4 = (int) (j2 ^ (j2 >>> 32));
            i89 i89VarL = p65Var.l();
            r28 r28VarR = gx1.R(p65Var, r28VarN);
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
            d46.a(jw4Var.c, hl0.XXXS, null, null, null, null, null, 0.0f, 0, null, null, p65Var, 48, 0, 4092);
            String strW = jw4Var.b;
            if (strW == null) {
                strW = km4.w(p65Var, 2080699252, R.string.common_unknown_user, p65Var, false);
            } else {
                p65Var.Y(2080698787);
                p65Var.p(false);
            }
            r28 r28VarU = km4.u(1.0f, w2g.G(o28Var, 8.0f, 0.0f, 8.0f, 0.0f, 10), true);
            sn3 sn3Var = jt7.c;
            jjd.b(strW, r28VarU, 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, ((bu7) p65Var.j(sn3Var)).n, p65Var, 0, 0, 131068);
            String strR = vo7.R(p65Var, R.string.your_following_feed_profile);
            mkd mkdVar = ((bu7) p65Var.j(sn3Var)).n;
            sn3 sn3Var2 = kt7.b;
            jjd.b(strR, null, 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, mkd.a(mkdVar, ((zo7) p65Var.j(sn3Var2)).o, 0L, null, null, null, 0L, 0L, null, 0, 0L, null, null, 16777214), p65Var, 0, 0, 131070);
            p65Var = p65Var;
            qv5.b(vn7.J(R.drawable.ic_chevron_right_16, 0, p65Var), null, w2g.G(o28Var, 8.0f, 0.0f, 0.0f, 0.0f, 14), ((zo7) p65Var.j(sn3Var2)).o, p65Var, 440, 0);
            p65Var.p(true);
            r28Var2 = o28Var;
        } else {
            p65Var.S();
            r28Var2 = r28Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new g9b(i2, 29, jw4Var, sourceParameter, ddfVar, r28Var2);
        }
    }

    public static final void N(SourceParameter sourceParameter, ddf ddfVar, r28 r28Var, x12 x12Var, int i2) {
        r28 r28Var2;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-2037287257);
        int i3 = i2 | (p65Var.f(sourceParameter) ? 4 : 2) | (p65Var.f(ddfVar) ? 32 : 16) | 384;
        int i4 = 0;
        if (p65Var.P(i3 & 1, (i3 & 147) != 146)) {
            mz1 mz1Var = vx0.s;
            String strR = vo7.R(p65Var, R.string.your_following_feed_tag_empty_feed_title);
            String strR2 = vo7.R(p65Var, R.string.your_following_feed_tag_empty_feed_content);
            String strR3 = vo7.R(p65Var, R.string.your_following_feed_tag_empty_feed_action);
            boolean z = ((i3 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32) | ((i3 & 14) == 4);
            Object objM = p65Var.M();
            if (z || objM == w12.a) {
                objM = new scf(ddfVar, sourceParameter, i4);
                p65Var.j0(objM);
            }
            m45 m45Var = (m45) objM;
            r28Var2 = o28.b;
            gq7.a(r28Var2, mz1Var, strR, strR2, 0L, null, null, strR3, m45Var, 0.0f, 0.0f, p65Var, 54, 0, 1648);
        } else {
            p65Var.S();
            r28Var2 = r28Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new rcf(sourceParameter, ddfVar, r28Var2, i2, 1);
        }
    }

    public static final void O(kv6 kv6Var, cad cadVar, t9d t9dVar, sh9 sh9Var, r28 r28Var, x12 x12Var, int i2) {
        stc stcVar;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-1413485143);
        int i3 = (p65Var.f(kv6Var) ? 4 : 2) | i2 | (p65Var.f(cadVar) ? 32 : 16) | (p65Var.f(t9dVar) ? 256 : 128) | (p65Var.f(sh9Var) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024) | (p65Var.f(r28Var) ? OlympusMakernoteDirectory.TAG_MAIN_INFO : 8192);
        if (p65Var.P(i3 & 1, (i3 & 9363) != 9362)) {
            ((jp7) p65Var.j(kt7.a)).getClass();
            int i4 = v9d.a[jp7.a(p65Var).ordinal()];
            if (i4 == 1 || i4 == 2) {
                stcVar = stc.M;
            } else {
                if (i4 != 3) {
                    ygf.a();
                    return;
                }
                stcVar = stc.L;
            }
            stc stcVar2 = stcVar;
            if (cadVar instanceof z9d) {
                p65Var.Y(-1275916845);
                int i5 = i3 & ReconyxHyperFire2MakernoteDirectory.TAG_SERIAL_NUMBER;
                int i6 = i3 << 3;
                K(kv6Var, (z9d) cadVar, stcVar2, t9dVar, sh9Var, r28Var, p65Var, (i6 & 7168) | i5 | (57344 & i6) | (i6 & 458752));
                p65Var.p(false);
            } else if (cadVar instanceof aad) {
                p65Var.Y(-1275536692);
                P(((aad) cadVar).a, t9dVar, r28Var, p65Var, ((i3 >> 6) & 896) | ((i3 >> 3) & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION));
                p65Var.p(false);
            } else {
                if (!(cadVar instanceof bad)) {
                    throw ho2.L(p65Var, -1149539309, false);
                }
                p65Var.Y(-1275273099);
                J(stcVar2, r28Var, p65Var, (i3 >> 9) & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION);
                p65Var.p(false);
            }
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new exc(kv6Var, cadVar, t9dVar, sh9Var, r28Var, i2, 6);
        }
    }

    public static final void Q(cad cadVar, nhc nhcVar, kv6 kv6Var, o9d o9dVar, t9d t9dVar, sh9 sh9Var, r28 r28Var, uod uodVar, x12 x12Var, int i2) {
        int i3;
        p65 p65Var;
        uod uodVar2;
        int i4;
        uod uodVarA;
        String strQ;
        Object jocVar;
        boolean z;
        cadVar.getClass();
        nhcVar.getClass();
        kv6Var.getClass();
        t9dVar.getClass();
        sh9Var.getClass();
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(1695954658);
        if ((i2 & 6) == 0) {
            i3 = (p65Var2.f(cadVar) ? 4 : 2) | i2;
        } else {
            i3 = i2;
        }
        if ((i2 & 48) == 0) {
            i3 |= p65Var2.f(nhcVar) ? 32 : 16;
        }
        if ((i2 & 384) == 0) {
            i3 |= p65Var2.f(kv6Var) ? 256 : 128;
        }
        if ((i2 & 3072) == 0) {
            i3 |= p65Var2.f(o9dVar) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024;
        }
        if ((i2 & 24576) == 0) {
            i3 |= p65Var2.f(t9dVar) ? 16384 : 8192;
        }
        if ((196608 & i2) == 0) {
            i3 |= p65Var2.f(sh9Var) ? 131072 : ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID;
        }
        if ((1572864 & i2) == 0) {
            i3 |= p65Var2.f(r28Var) ? 1048576 : 524288;
        }
        if ((12582912 & i2) == 0) {
            i3 |= 4194304;
        }
        if (p65Var2.P(i3 & 1, (4793491 & i3) != 4793490)) {
            p65Var2.U();
            if ((i2 & 1) == 0 || p65Var2.z()) {
                i4 = i3 & (-29360129);
                uodVarA = rod.a(p65Var2);
            } else {
                p65Var2.S();
                i4 = i3 & (-29360129);
                uodVarA = uodVar;
            }
            int i5 = i4;
            p65Var2.q();
            if (cadVar instanceof z9d) {
                p65Var2.Y(-194018741);
                strQ = vo7.Q(R.string.tag_recommended_posts_title, new Object[]{((z9d) cadVar).a}, p65Var2);
                p65Var2.p(false);
            } else {
                if (!(cadVar instanceof aad) && !(cadVar instanceof bad)) {
                    throw ho2.L(p65Var2, -194021222, false);
                }
                p65Var2.Y(-1719429255);
                p65Var2.p(false);
                strQ = null;
            }
            String str = strQ;
            boolean z2 = true;
            upc upcVarA = zu.a(nk7.o0(kv6Var), null, "elevation", p65Var2, 384, 10);
            npa npaVarJ = vo7.J(p65Var2);
            boolean zA = cadVar.a();
            if ((i5 & 57344) != 16384) {
                z2 = false;
            }
            Object objM = p65Var2.M();
            uob uobVar = w12.a;
            if (z2 || objM == uobVar) {
                z = false;
                jocVar = new joc(0, t9dVar, t9d.class, "refresh", "refresh()V", 0, 27);
                p65Var2.j0(jocVar);
            } else {
                jocVar = objM;
                z = false;
            }
            m45 m45Var = (m45) ((qh6) jocVar);
            Object objM2 = p65Var2.M();
            if (objM2 == uobVar) {
                objM2 = new d3d(12);
                p65Var2.j0(objM2);
            }
            r28 r28VarN = bgf.N(wxb.a(r28Var, z, (x45) objM2), "tag_recommended_posts");
            p65Var = p65Var2;
            uod uodVar3 = uodVarA;
            er7.d(zA, m45Var, r28VarN, npaVarJ, 0L, 0L, false, 0.0f, null, null, pxf.E(-648538000, new s9d(uodVar3, str, o9dVar, upcVarA, nhcVar, kv6Var, cadVar, t9dVar, sh9Var, 0), p65Var), p65Var, 0, PhotoshopDirectory.TAG_CAPTION);
            uodVar2 = uodVar3;
        } else {
            p65Var = p65Var2;
            p65Var.S();
            uodVar2 = uodVar;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new ey4(cadVar, nhcVar, kv6Var, o9dVar, t9dVar, sh9Var, r28Var, uodVar2, i2);
        }
    }

    public static final void R(String str, String str2, o9d o9dVar, r28 r28Var, had hadVar, x12 x12Var, int i2) {
        had hadVar2;
        int i3;
        had hadVar3;
        str.getClass();
        str2.getClass();
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-1100711546);
        int i4 = i2 | (p65Var.f(str) ? 4 : 2) | (p65Var.f(str2) ? 32 : 16) | (p65Var.f(o9dVar) ? 256 : 128) | (p65Var.f(r28Var) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024) | 8192;
        if (p65Var.P(i4 & 1, (i4 & 9363) != 9362)) {
            p65Var.U();
            int i5 = i2 & 1;
            uob uobVar = w12.a;
            if (i5 == 0 || p65Var.z()) {
                boolean z = ((i4 & 14) == 4) | ((i4 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32);
                Object objM = p65Var.M();
                if (z || objM == uobVar) {
                    objM = new bb0(str, str2, 21);
                    p65Var.j0(objM);
                }
                x45 x45Var = (x45) objM;
                wue wueVarA = e67.a(p65Var);
                if (wueVarA == null) {
                    ygf.f("No ViewModelStoreOwner was provided via LocalViewModelStoreOwner");
                    return;
                } else {
                    i3 = i4 & (-57345);
                    hadVar3 = (had) to7.z(n1b.a.b(had.class), wueVarA, t40.E(wueVarA, p65Var), wueVarA instanceof pi5 ? r40.N(((pi5) wueVarA).getDefaultViewModelCreationExtras(), x45Var) : r40.N(og2.b, x45Var), p65Var);
                }
            } else {
                p65Var.S();
                i3 = i4 & (-57345);
                hadVar3 = hadVar;
            }
            p65Var.q();
            l78 l78VarZ = guc.z(hadVar3.l, p65Var, 0);
            nhc nhcVarF = mk7.F(p65Var);
            kv6 kv6VarA = pv6.a(p65Var);
            boolean zF = p65Var.f(hadVar3) | ((i3 & 896) == 256);
            Object objM2 = p65Var.M();
            if (zF || objM2 == uobVar) {
                objM2 = new u9d(o9dVar, hadVar3);
                p65Var.j0(objM2);
            }
            u9d u9dVar = (u9d) objM2;
            boolean zF2 = p65Var.f(hadVar3);
            Object objM3 = p65Var.M();
            if (zF2 || objM3 == uobVar) {
                objM3 = new t9d(hadVar3);
                p65Var.j0(objM3);
            }
            Q((cad) l78VarZ.getValue(), nhcVarF, kv6VarA, o9dVar, (t9d) objM3, u9dVar, r28Var, null, p65Var, ((i3 << 3) & 7168) | ((i3 << 9) & 3670016));
            Resources resources = (Resources) p65Var.j(eo.c);
            boolean zH = p65Var.h(hadVar3) | p65Var.f(nhcVarF) | p65Var.h(resources) | p65Var.f(u9dVar);
            Object objM4 = p65Var.M();
            if (zH || objM4 == uobVar) {
                rna rnaVar = new rna(hadVar3, nhcVarF, resources, u9dVar, null, 26);
                p65Var.j0(rnaVar);
                objM4 = rnaVar;
            }
            kyd.k(p65Var, (b55) objM4, c1e.a);
            hadVar2 = hadVar3;
        } else {
            p65Var.S();
            hadVar2 = hadVar;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new exc(str, str2, o9dVar, r28Var, hadVar2, i2, 5);
        }
    }

    public static final void S(String str, o9d o9dVar, uod uodVar, float f2, x12 x12Var, int i2) {
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-1498838558);
        int i3 = i2 | (p65Var.f(str) ? 4 : 2) | (p65Var.f(o9dVar) ? 32 : 16) | (p65Var.f(uodVar) ? 256 : 128) | (p65Var.c(f2) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024);
        if (p65Var.P(i3 & 1, (i3 & 1171) != 1170)) {
            boolean z = (i3 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32;
            Object objM = p65Var.M();
            if (z || objM == w12.a) {
                joc jocVar = new joc(0, o9dVar, q9d.class, "onBackPressed", "onBackPressed()V", 0, 28);
                p65Var.j0(jocVar);
                objM = jocVar;
            }
            qk7.e(pxf.E(637706656, new ba1(str, 5), p65Var), wo7.w(o28.b, f2, null, 0L, 0L, 30), (m45) ((qh6) objM), null, null, null, 0L, null, uodVar, p65Var, ((i3 << 18) & 234881024) | 6);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new dj3(str, o9dVar, uodVar, f2, i2, 6);
        }
    }

    public static final void T(wdf wdfVar, ddf ddfVar, r28 r28Var, x12 x12Var, int i2) {
        r28 r28Var2;
        boolean z;
        int i3;
        int i4;
        l78 l78Var;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(1753635734);
        int i5 = i2 | (p65Var.d(wdfVar.ordinal()) ? 4 : 2) | (p65Var.f(ddfVar) ? 32 : 16) | 384;
        if (p65Var.P(i5 & 1, (i5 & 147) != 146)) {
            zk7 zk7VarC = dy0.c(z46.d, false);
            long j2 = p65Var.T;
            int i6 = (int) (j2 ^ (j2 >>> 32));
            i89 i89VarL = p65Var.l();
            o28 o28Var = o28.b;
            r28 r28VarR = gx1.R(p65Var, o28Var);
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
            Integer numValueOf = Integer.valueOf(i6);
            cu cuVar3 = q12.g;
            tp7.B(p65Var, cuVar3, numValueOf);
            fn fnVar = q12.h;
            tp7.y(p65Var, fnVar);
            cu cuVar4 = q12.d;
            tp7.B(p65Var, cuVar4, r28VarR);
            Object objM = p65Var.M();
            uob uobVar = w12.a;
            if (objM == uobVar) {
                objM = qo7.u(Boolean.FALSE);
                p65Var.j0(objM);
            }
            l78 l78Var2 = (l78) objM;
            amb ambVar = bmb.a;
            r28 r28VarF = jfc.f(o28Var, 38.0f, 0.0f, 2);
            sn3 sn3Var = kt7.b;
            r28 r28VarY = r40.y(bo.B(r28VarF, 1.0f, ((zo7) p65Var.j(sn3Var)).z, ambVar), ambVar);
            vkb vkbVar = new vkb(0);
            Object objM2 = p65Var.M();
            if (objM2 == uobVar) {
                objM2 = new z7b(l78Var2, 24);
                p65Var.j0(objM2);
            }
            r28 r28VarF2 = w2g.F(hlg.r(r28VarY, false, null, vkbVar, (m45) objM2, 11), 16.0f, 8.0f, 12.0f, 10.0f);
            omb ombVarA = nmb.a(qb8.a, z46.n, p65Var, 48);
            long j3 = p65Var.T;
            int i7 = (int) (j3 ^ (j3 >>> 32));
            i89 i89VarL2 = p65Var.l();
            r28 r28VarR2 = gx1.R(p65Var, r28VarF2);
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, cuVar, ombVarA);
            tp7.B(p65Var, cuVar2, i89VarL2);
            ka1.z(i7, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR2);
            int i8 = bdf.a[wdfVar.ordinal()];
            if (i8 == 1) {
                z = false;
                i3 = -2078864085;
                i4 = R.string.common_sort_latest;
            } else {
                if (i8 != 2) {
                    throw ho2.L(p65Var, -2078868627, false);
                }
                i3 = -2078858384;
                i4 = R.string.common_sort_recommended;
                z = false;
            }
            jjd.b(km4.w(p65Var, i3, i4, p65Var, z), null, 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, ((bu7) p65Var.j(jt7.c)).m, p65Var, 0, 0, 131070);
            p65Var = p65Var;
            qv5.b(vn7.J(R.drawable.ic_chevron_down_16, 0, p65Var), null, w2g.G(o28Var, 8.0f, 0.0f, 0.0f, 0.0f, 14), ((zo7) p65Var.j(sn3Var)).n, p65Var, 440, 0);
            p65Var.p(true);
            boolean zBooleanValue = ((Boolean) l78Var2.getValue()).booleanValue();
            Object objM3 = p65Var.M();
            if (objM3 == uobVar) {
                l78Var = l78Var2;
                objM3 = new z7b(l78Var, 25);
                p65Var.j0(objM3);
            } else {
                l78Var = l78Var2;
            }
            xp7.b(zBooleanValue, (m45) objM3, null, 0L, null, null, null, 0L, 0.0f, pxf.E(1669964439, new gab(12, ddfVar, l78Var, wdfVar, false), p65Var), p65Var, 48, 2044);
            p65Var.p(true);
            r28Var2 = o28Var;
        } else {
            p65Var.S();
            r28Var2 = r28Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new n2f(i2, 4, r28Var2, wdfVar, ddfVar);
        }
    }

    public static final void U(aef aefVar, kv6 kv6Var, ddf ddfVar, sh9 sh9Var, r28 r28Var, x12 x12Var, int i2) {
        ddf ddfVar2;
        r28 r28Var2;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(1100912953);
        int i3 = i2 | (p65Var.f(aefVar) ? 4 : 2) | (p65Var.f(kv6Var) ? 32 : 16) | (p65Var.f(ddfVar) ? 256 : 128) | (p65Var.f(sh9Var) ? 2048 : 1024) | 24576;
        if (p65Var.P(i3 & 1, (i3 & 9363) != 9362)) {
            ((jp7) p65Var.j(kt7.a)).getClass();
            stc stcVar = jp7.a(p65Var) == ip7.COMPACT ? stc.M : stc.L;
            rh4 rh4Var = jfc.c;
            int i4 = i3 & 896;
            boolean zD = ((i3 & 14) == 4) | (i4 == 256) | p65Var.d(stcVar.ordinal()) | ((i3 & 7168) == 2048);
            Object objM = p65Var.M();
            uob uobVar = w12.a;
            if (zD || objM == uobVar) {
                iu iuVar = new iu(aefVar, ddfVar, stcVar, sh9Var, 28);
                p65Var.j0(iuVar);
                objM = iuVar;
            }
            int i5 = i3 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION;
            ddfVar2 = ddfVar;
            k40.t(rh4Var, kv6Var, null, null, null, null, false, null, (x45) objM, p65Var, i5, 508);
            boolean z = (i5 == 32) | (i4 == 256);
            Object objM2 = p65Var.M();
            if (z || objM2 == uobVar) {
                objM2 = new cdf(kv6Var, ddfVar2, null, 0);
                p65Var.j0(objM2);
            }
            kyd.k(p65Var, (b55) objM2, kv6Var);
            r28Var2 = o28.b;
        } else {
            ddfVar2 = ddfVar;
            p65Var.S();
            r28Var2 = r28Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new exc(aefVar, kv6Var, ddfVar2, sh9Var, r28Var2, i2, 19);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:51:0x008d  */
    /* JADX WARN: Removed duplicated region for block: B:52:0x008f  */
    /* JADX WARN: Removed duplicated region for block: B:55:0x0097  */
    /* JADX WARN: Removed duplicated region for block: B:64:0x0108  */
    /* JADX WARN: Removed duplicated region for block: B:67:0x0114  */
    /* JADX WARN: Removed duplicated region for block: B:69:? A[RETURN, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final void V(defpackage.aef r24, defpackage.nhc r25, defpackage.kv6 r26, defpackage.ddf r27, defpackage.sh9 r28, defpackage.r28 r29, defpackage.x12 r30, int r31, int r32) {
        /*
            Method dump skipped, instruction units count: 288
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.flb.V(aef, nhc, kv6, ddf, sh9, r28, x12, int, int):void");
    }

    public static final void W(String str, bo4 bo4Var, acf acfVar, r28 r28Var, ref refVar, x12 x12Var, int i2) {
        ref refVar2;
        int i3;
        ref refVar3;
        str.getClass();
        bo4Var.getClass();
        p65 p65Var = (p65) x12Var;
        p65Var.a0(1043540399);
        int i4 = i2 | (p65Var.f(str) ? 4 : 2) | (p65Var.h(bo4Var) ? 32 : 16) | (p65Var.f(acfVar) ? 256 : 128) | (p65Var.f(r28Var) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024) | 8192;
        if (p65Var.P(i4 & 1, (i4 & 9363) != 9362)) {
            p65Var.U();
            int i5 = i2 & 1;
            uob uobVar = w12.a;
            if (i5 == 0 || p65Var.z()) {
                Object objJ = p65Var.j(r57.a);
                objJ.getClass();
                xy1 xy1Var = (xy1) objJ;
                boolean z = (i4 & 14) == 4;
                Object objM = p65Var.M();
                if (z || objM == uobVar) {
                    objM = new nmc(str, 28);
                    p65Var.j0(objM);
                }
                i3 = i4 & (-57345);
                refVar3 = (ref) to7.z(n1b.a.b(ref.class), xy1Var, t40.E(xy1Var, p65Var), r40.N(xy1Var.getDefaultViewModelCreationExtras(), (x45) objM), p65Var);
            } else {
                p65Var.S();
                i3 = i4 & (-57345);
                refVar3 = refVar;
            }
            p65Var.q();
            Resources resources = (Resources) p65Var.j(eo.c);
            Object objM2 = p65Var.M();
            if (objM2 == uobVar) {
                objM2 = y30.j(p65Var);
            }
            nhc nhcVar = (nhc) objM2;
            kv6 kv6VarA = pv6.a(p65Var);
            l78 l78VarZ = guc.z(refVar3.C, p65Var, 0);
            ddf ddfVar = new ddf(refVar3, acfVar);
            md3 md3Var = new md3(acfVar, 10, refVar3);
            V((aef) l78VarZ.getValue(), nhcVar, kv6VarA, ddfVar, md3Var, r28Var, p65Var, ((i3 << 6) & 458752) | 48, 0);
            boolean zH = p65Var.h(refVar3) | p65Var.h(resources) | p65Var.f(md3Var);
            Object objM3 = p65Var.M();
            if (zH || objM3 == uobVar) {
                gbd gbdVar = new gbd(refVar3, nhcVar, resources, md3Var, null, 24);
                p65Var.j0(gbdVar);
                objM3 = gbdVar;
            }
            c1e c1eVar = c1e.a;
            kyd.k(p65Var, (b55) objM3, c1eVar);
            boolean zH2 = p65Var.h(bo4Var) | p65Var.f(kv6VarA);
            Object objM4 = p65Var.M();
            if (zH2 || objM4 == uobVar) {
                objM4 = new wi1(bo4Var, kv6VarA, null, 12);
                p65Var.j0(objM4);
            }
            kyd.k(p65Var, (b55) objM4, c1eVar);
            refVar2 = refVar3;
        } else {
            p65Var.S();
            refVar2 = refVar;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new exc(str, bo4Var, acfVar, r28Var, refVar2, i2, 18);
        }
    }

    public static final void X(o78 o78Var, q28 q28Var) {
        o78 o78VarZ = v0(q28Var).z();
        int i2 = o78VarZ.c - 1;
        Object[] objArr = o78VarZ.a;
        if (i2 < objArr.length) {
            while (i2 >= 0) {
                o78Var.b((q28) ((aq6) objArr[i2]).F.g);
                i2--;
            }
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    public static final sp6 Y(q28 q28Var) {
        if ((q28Var.c & 2) != 0) {
            if (q28Var instanceof sp6) {
                return (sp6) q28Var;
            }
            if (q28Var instanceof b43) {
                q28 q28Var2 = ((b43) q28Var).p;
                while (q28Var2 != 0) {
                    if (q28Var2 instanceof sp6) {
                        return (sp6) q28Var2;
                    }
                    q28Var2 = (!(q28Var2 instanceof b43) || (q28Var2.c & 2) == 0) ? q28Var2.f : ((b43) q28Var2).p;
                }
            }
        }
        return null;
    }

    public static r28 Z(r28 r28Var, oz6 oz6Var) {
        return r28Var.b(new rm0(0L, oz6Var, rv8.r, 1));
    }

    public static final r28 a0(r28 r28Var, long j2, m3c m3cVar) {
        return r28Var.b(new rm0(j2, null, m3cVar, 2));
    }

    public static final Object b0(n92 n92Var, do4 do4Var, m45 m45Var, c55 c55Var, bo4[] bo4VarArr) throws Throwable {
        zv1 zv1Var = new zv1(null, do4Var, m45Var, c55Var, bo4VarArr);
        fo4 fo4Var = new fo4(n92Var, n92Var.getContext());
        Object objU = mo7.U(fo4Var, true, fo4Var, zv1Var);
        return objU == tb2.COROUTINE_SUSPENDED ? objU : c1e.a;
    }

    public static final Object c0(elb elbVar, x45 x45Var, n92 n92Var) {
        s10 s10Var;
        if (elbVar.k() && elbVar.o() && elbVar.l()) {
            return x45Var.invoke(n92Var);
        }
        if (n92Var.getContext().o0(d61.c) == null) {
            return x45Var.invoke(n92Var);
        }
        nx9 nx9Var = new nx9(x45Var, null, 28);
        hrd hrdVar = (hrd) n92Var.getContext().o0(hrd.b);
        kb2 kb2Var = hrdVar != null ? hrdVar.a : null;
        if (kb2Var != null) {
            return vx0.m0(kb2Var, nx9Var, n92Var);
        }
        x51 x51Var = new x51(1, pwd.Q(n92Var));
        x51Var.s();
        try {
            s10Var = elbVar.d;
        } catch (RejectedExecutionException e2) {
            x51Var.l(new IllegalStateException("Unable to acquire a thread to perform the database transaction.", e2));
        }
        if (s10Var != null) {
            s10Var.execute(new pa6(x51Var, elbVar, nx9Var, 3));
            return x51Var.q();
        }
        g76.g0("internalTransactionExecutor");
        throw null;
    }

    public static final boolean d0(zwa zwaVar, float f2, float f3) {
        float f4 = zwaVar.a;
        if (f2 > zwaVar.c || f4 > f2) {
            return false;
        }
        return f3 <= zwaVar.d && zwaVar.b <= f3;
    }

    public static ev7 e0(String str, List list) {
        dv7 dv7Var;
        wgc wgcVar = new wgc();
        Iterator it2 = list.iterator();
        while (true) {
            boolean zHasNext = it2.hasNext();
            dv7Var = dv7.b;
            if (!zHasNext) {
                break;
            }
            ev7 ev7Var = (ev7) it2.next();
            if (ev7Var != dv7Var) {
                if (ev7Var instanceof sj1) {
                    ev7[] ev7VarArr = ((sj1) ev7Var).c;
                    ev7VarArr.getClass();
                    List listAsList = Arrays.asList(ev7VarArr);
                    listAsList.getClass();
                    wgcVar.addAll(listAsList);
                } else {
                    wgcVar.add(ev7Var);
                }
            }
        }
        int i2 = wgcVar.a;
        return i2 != 0 ? i2 != 1 ? new sj1(str, (ev7[]) wgcVar.toArray(new ev7[0])) : (ev7) wgcVar.get(0) : dv7Var;
    }

    public static final void g0(Throwable th) {
        HashMap map;
        ka4 ka4Var;
        if (n) {
            HashSet hashSet = new HashSet();
            StackTraceElement[] stackTrace = th.getStackTrace();
            stackTrace.getClass();
            for (StackTraceElement stackTraceElement : stackTrace) {
                String className = stackTraceElement.getClassName();
                className.getClass();
                synchronized (na4.a) {
                    map = na4.b;
                    if (map.isEmpty()) {
                        map.put(ka4.AAM, new String[]{"com.facebook.appevents.aam."});
                        map.put(ka4.CodelessEvents, new String[]{"com.facebook.appevents.codeless."});
                        map.put(ka4.CloudBridge, new String[]{"com.facebook.appevents.cloudbridge."});
                        map.put(ka4.ErrorReport, new String[]{"com.facebook.internal.instrument.errorreport."});
                        map.put(ka4.AnrReport, new String[]{"com.facebook.internal.instrument.anrreport."});
                        map.put(ka4.PrivacyProtection, new String[]{"com.facebook.appevents.ml."});
                        map.put(ka4.SuggestedEvents, new String[]{"com.facebook.appevents.suggestedevents."});
                        map.put(ka4.RestrictiveDataFiltering, new String[]{"com.facebook.appevents.restrictivedatafilter.RestrictiveDataManager"});
                        map.put(ka4.IntelligentIntegrity, new String[]{"com.facebook.appevents.integrity.IntegrityManager"});
                        map.put(ka4.ProtectedMode, new String[]{"com.facebook.appevents.integrity.ProtectedModeManager"});
                        map.put(ka4.MACARuleMatching, new String[]{"com.facebook.appevents.integrity.MACARuleMatchingManager"});
                        map.put(ka4.BlocklistEvents, new String[]{"com.facebook.appevents.integrity.BlocklistEventsManager"});
                        map.put(ka4.FilterRedactedEvents, new String[]{"com.facebook.appevents.integrity.RedactedEventsManager"});
                        map.put(ka4.FilterSensitiveParams, new String[]{"com.facebook.appevents.integrity.SensitiveParamsManager"});
                        map.put(ka4.EventDeactivation, new String[]{"com.facebook.appevents.eventdeactivation."});
                        map.put(ka4.OnDeviceEventProcessing, new String[]{"com.facebook.appevents.ondeviceprocessing."});
                        map.put(ka4.IapLogging, new String[]{"com.facebook.appevents.iap."});
                        map.put(ka4.Monitoring, new String[]{"com.facebook.internal.logging.monitor"});
                        map.put(ka4.GPSARATriggers, new String[]{"com.facebook.appevents.gps.ara.GpsARAManager"});
                        map.put(ka4.GPSPACAProcessing, new String[]{"com.facebook.appevents.gps.pa.PACustomAudienceClient"});
                        map.put(ka4.GPSTopicsObservation, new String[]{"com.facebook.appevents.gps.topics.GpsTopicsManager"});
                    }
                }
                Iterator it2 = map.entrySet().iterator();
                while (true) {
                    if (!it2.hasNext()) {
                        ka4Var = ka4.Unknown;
                        break;
                    }
                    Map.Entry entry = (Map.Entry) it2.next();
                    ka4Var = (ka4) entry.getKey();
                    for (String str : (String[]) entry.getValue()) {
                        if (tuc.N(className, str, false)) {
                            break;
                        }
                    }
                }
                if (ka4Var != ka4.Unknown) {
                    ka4Var.getClass();
                    f94.a().getSharedPreferences("com.facebook.internal.FEATURE_MANAGER", 0).edit().putString(ka4Var.toKey(), "18.2.3").apply();
                    hashSet.add(ka4Var.toString());
                }
            }
            f94 f94Var = f94.a;
            if (!mme.c() || hashSet.isEmpty()) {
                return;
            }
            JSONArray jSONArray = new JSONArray((Collection) hashSet);
            z36 z36Var = new z36();
            z36Var.b = x36.Analysis;
            Long lValueOf = Long.valueOf(System.currentTimeMillis() / 1000);
            z36Var.g = lValueOf;
            z36Var.c = jSONArray;
            StringBuffer stringBuffer = new StringBuffer("analysis_log_");
            stringBuffer.append(String.valueOf(lValueOf));
            stringBuffer.append(".json");
            String string = stringBuffer.toString();
            string.getClass();
            z36Var.a = string;
            z36Var.b();
        }
    }

    public static final h1b h0(zm7 zm7Var, mn1 mn1Var, zz7 zz7Var) {
        mn1Var.getClass();
        zz7Var.getClass();
        rz2 rz2VarX = zm7Var.x(mn1Var, zz7Var);
        if (rz2VarX != null) {
            return (h1b) rz2VarX.b;
        }
        return null;
    }

    public static gb2 i0(gb2 gb2Var, hb2 hb2Var) {
        hb2Var.getClass();
        if (g76.L(gb2Var.getKey(), hb2Var)) {
            return gb2Var;
        }
        return null;
    }

    public static ji5 j0(SSLSession sSLSession) throws IOException {
        List listK;
        String cipherSuite = sSLSession.getCipherSuite();
        if (cipherSuite == null) {
            ygf.f("cipherSuite == null");
            return null;
        }
        if (cipherSuite.equals("TLS_NULL_WITH_NULL_NULL") || cipherSuite.equals("SSL_NULL_WITH_NULL_NULL")) {
            ik4.g("cipherSuite == ".concat(cipherSuite));
            return null;
        }
        zl1 zl1VarA = zl1.b.A(cipherSuite);
        String protocol = sSLSession.getProtocol();
        if (protocol == null) {
            ygf.f("tlsVersion == null");
            return null;
        }
        if ("NONE".equals(protocol)) {
            ik4.g("tlsVersion == NONE");
            return null;
        }
        nmd.Companion.getClass();
        nmd nmdVarA = mmd.a(protocol);
        try {
            listK = ggf.k(sSLSession.getPeerCertificates());
        } catch (SSLPeerUnverifiedException unused) {
            listK = ey3.a;
        }
        return new ji5(nmdVarA, zl1VarA, ggf.k(sSLSession.getLocalCertificates()), new c13(listK, 1));
    }

    public static final gr5 k0(x12 x12Var) {
        p65 p65Var = (p65) x12Var;
        p65Var.Y(849924301);
        float fN = ((m73) p65Var.j(z22.h)).N(((Context) p65Var.j(eo.b)).getResources().getDisplayMetrics().widthPixels);
        p65Var.p(false);
        return vj3.a(fN, 400.0f) < 0 ? gr5.f : gr5.d;
    }

    public static final String l0(xqc xqcVar, x12 x12Var) {
        p65 p65Var;
        int i2;
        int i3;
        xqcVar.getClass();
        switch (gf7.a[xqcVar.ordinal()]) {
            case 1:
                p65Var = (p65) x12Var;
                i2 = R.string.stats_oldest;
                i3 = 1461507043;
                break;
            case 2:
                p65Var = (p65) x12Var;
                i2 = R.string.stats_latest;
                i3 = 1461509315;
                break;
            case 3:
                p65Var = (p65) x12Var;
                i2 = R.string.stats_least_viewed;
                i3 = 1461511497;
                break;
            case 4:
                p65Var = (p65) x12Var;
                i2 = R.string.stats_most_viewed;
                i3 = 1461513896;
                break;
            case 5:
                p65Var = (p65) x12Var;
                i2 = R.string.stats_least_read;
                i3 = 1461516231;
                break;
            case 6:
                p65Var = (p65) x12Var;
                i2 = R.string.stats_most_read;
                i3 = 1461518566;
                break;
            case 7:
                p65Var = (p65) x12Var;
                i2 = R.string.stats_lowest_earnings;
                i3 = 1461521068;
                break;
            case 8:
                p65Var = (p65) x12Var;
                i2 = R.string.stats_highest_earnings;
                i3 = 1461523789;
                break;
            default:
                throw ho2.L((p65) x12Var, 1461506152, false);
        }
        return km4.w(p65Var, i3, i2, p65Var, false);
    }

    public static final ArrayList m0(List list, m45 m45Var) {
        u11 u11Var;
        if (!((Boolean) m45Var.invoke()).booleanValue()) {
            return null;
        }
        ArrayList arrayList = new ArrayList(list.size());
        int size = list.size();
        for (int i2 = 0; i2 < size; i2++) {
            tk7 tk7Var = (tk7) list.get(i2);
            Object objW = tk7Var.w();
            objW.getClass();
            lt ltVar = ((ckd) objW).b;
            vjd vjdVar = (vjd) ltVar.b;
            lx lxVar = (lx) ltVar.c;
            qjd qjdVar = (qjd) vjdVar.a.getValue();
            if (qjdVar == null) {
                u11Var = new u11(0, 0, new tkc(7));
            } else {
                lx lxVarC = vjd.c(lxVar, qjdVar);
                if (lxVarC == null) {
                    u11Var = new u11(0, 0, new tkc(8));
                } else {
                    o46 o46VarC0 = g76.c0(qjdVar.i(lxVarC.b, lxVarC.c).b());
                    u11Var = new u11(o46VarC0.d(), o46VarC0.b(), new doc(14, o46VarC0));
                }
            }
            int i3 = u11Var.b;
            int i4 = u11Var.c;
            arrayList.add(new f09(tk7Var.s(g01.Q(i3, i3, i4, i4)), (m45) u11Var.d));
        }
        return arrayList;
    }

    public static ib2 n0(gb2 gb2Var, hb2 hb2Var) {
        hb2Var.getClass();
        return g76.L(gb2Var.getKey(), hb2Var) ? zx3.a : gb2Var;
    }

    public static void o0(InputConnection inputConnection, EditorInfo editorInfo, TextView textView) {
        if (inputConnection == null || editorInfo.hintText != null) {
            return;
        }
        for (ViewParent parent = textView.getParent(); parent instanceof View; parent = parent.getParent()) {
        }
    }

    public static ib2 p0(gb2 gb2Var, ib2 ib2Var) {
        ib2Var.getClass();
        return ib2Var == zx3.a ? gb2Var : (ib2) ib2Var.N(new v02(16, (byte) 0), gb2Var);
    }

    public static final q28 q0(o78 o78Var) {
        int i2;
        if (o78Var == null || (i2 = o78Var.c) == 0) {
            return null;
        }
        return (q28) o78Var.m(i2 - 1);
    }

    public static ne8 r0(yua yuaVar) {
        int i2 = Integer.parseInt(yuaVar.I(Long.MAX_VALUE));
        long j2 = Long.parseLong(yuaVar.I(Long.MAX_VALUE));
        long j3 = Long.parseLong(yuaVar.I(Long.MAX_VALUE));
        LinkedHashMap linkedHashMap = new LinkedHashMap();
        int i3 = Integer.parseInt(yuaVar.I(Long.MAX_VALUE));
        for (int i4 = 0; i4 < i3; i4++) {
            String strI = yuaVar.I(Long.MAX_VALUE);
            int iY = muc.Y(strI, ':', 0, 6);
            if (iY == -1) {
                ywb.g("Unexpected header: ".concat(strI));
                return null;
            }
            String string = muc.y0(strI.substring(0, iY)).toString();
            String strSubstring = strI.substring(iY + 1);
            String lowerCase = string.toLowerCase(Locale.ROOT);
            lowerCase.getClass();
            Object arrayList = linkedHashMap.get(lowerCase);
            if (arrayList == null) {
                arrayList = new ArrayList();
                linkedHashMap.put(lowerCase, arrayList);
            }
            ((List) arrayList).add(strSubstring);
        }
        return new ne8(i2, j2, j3, new ce8(ei7.W(linkedHashMap)), null, null);
    }

    public static final void s0(a43 a43Var) {
        lm lmVar;
        aq6 aq6VarV0 = v0(a43Var);
        if (aq6VarV0.t) {
            return;
        }
        mn mnVar = (mn) dq6.a(aq6VarV0);
        if (!mn.g() || (lmVar = mnVar.N) == null) {
            return;
        }
        lmVar.d.b.G(aq6VarV0.b, new km(lmVar, aq6VarV0));
    }

    public static final eh8 t0(a43 a43Var, int i2) {
        eh8 eh8Var = ((q28) a43Var).a.h;
        eh8Var.getClass();
        if (eh8Var.O0() != a43Var || !fh8.g(i2)) {
            return eh8Var;
        }
        eh8 eh8Var2 = eh8Var.p;
        eh8Var2.getClass();
        return eh8Var2;
    }

    public static final eh8 u0(a43 a43Var) {
        if (!((q28) a43Var).a.n) {
            b26.b("Cannot get LayoutCoordinates, Modifier.Node is not attached.");
        }
        eh8 eh8VarT0 = t0(a43Var, 2);
        if (!eh8VarT0.O0().n) {
            b26.b("LayoutCoordinates is not attached.");
        }
        return eh8VarT0;
    }

    public static final aq6 v0(a43 a43Var) {
        eh8 eh8Var = ((q28) a43Var).a.h;
        if (eh8Var != null) {
            return eh8Var.o;
        }
        throw lv8.v("Cannot obtain node coordinator. Is the Modifier.Node attached?");
    }

    public static final mx8 w0(a43 a43Var) {
        mx8 mx8Var = v0(a43Var).n;
        if (mx8Var != null) {
            return mx8Var;
        }
        throw lv8.v("This node does not have an owner.");
    }

    public static Object x0(m45 m45Var, p92 p92Var) {
        return vx0.m0(zx3.a, new rc0(m45Var, null, 20), p92Var);
    }

    public static final r28 y0(r28 r28Var, mx mxVar, mkd mkdVar, x45 x45Var, int i2, boolean z, int i3, int i4, yy4 yy4Var, List list, x45 x45Var2, dv1 dv1Var, x45 x45Var3, oh0 oh0Var) {
        return r28Var.b(o28.b).b(new mgd(mxVar, mkdVar, yy4Var, x45Var, i2, z, i3, i4, list, x45Var2, dv1Var, oh0Var, x45Var3));
    }

    public static ArrayList z0(List list, Calendar calendar) {
        int actualMaximum;
        calendar.getClass();
        pwd.C(calendar);
        Calendar calendarG = pwd.G(null);
        if (calendar.get(1) == calendarG.get(1) && calendar.get(2) == calendarG.get(2)) {
            actualMaximum = calendarG.get(5);
            if (actualMaximum < 7) {
                actualMaximum = 7;
            }
        } else {
            actualMaximum = calendar.getActualMaximum(5);
        }
        int iP = ei7.P(cu1.k0(list, 10));
        if (iP < 16) {
            iP = 16;
        }
        LinkedHashMap linkedHashMap = new LinkedHashMap(iP);
        for (Object obj : list) {
            linkedHashMap.put(Integer.valueOf(pwd.G(Long.valueOf(((kb9) obj).b)).get(5)), obj);
        }
        n46 n46Var = new n46(1, actualMaximum, 1);
        ArrayList arrayList = new ArrayList(cu1.k0(n46Var, 10));
        Iterator it2 = n46Var.iterator();
        while (((m46) it2).c) {
            int iNextInt = ((g46) it2).nextInt();
            Object objClone = calendar.clone();
            objClone.getClass();
            Calendar calendar2 = (Calendar) objClone;
            calendar2.set(5, iNextInt);
            kb9 kb9Var = (kb9) linkedHashMap.get(Integer.valueOf(iNextInt));
            if (kb9Var == null) {
                kb9Var = new kb9(null, calendar2.getTimeInMillis(), null);
            }
            arrayList.add(kb9Var);
        }
        return arrayList;
    }

    @Override // defpackage.f22
    public long A(xzb xzbVar, int i2) {
        xzbVar.getClass();
        return t();
    }

    @Override // defpackage.kw2
    public double B() {
        f0();
        throw null;
    }

    @Override // defpackage.kw2
    public Object a(pj6 pj6Var) {
        pj6Var.getClass();
        return pj6Var.d(this);
    }

    @Override // defpackage.f22
    public kw2 b(p0a p0aVar, int i2) {
        return o(p0aVar.h(i2));
    }

    @Override // defpackage.kw2
    public boolean c() {
        f0();
        throw null;
    }

    @Override // defpackage.kw2
    public char d() {
        f0();
        throw null;
    }

    @Override // defpackage.f22
    public double f(p0a p0aVar, int i2) {
        return B();
    }

    public void f0() {
        throw new SerializationException(n1b.a.b(getClass()) + " can't retrieve untyped values");
    }

    @Override // defpackage.f22
    public char g(p0a p0aVar, int i2) {
        return d();
    }

    @Override // defpackage.f22
    public float h(p0a p0aVar, int i2) {
        return z();
    }

    @Override // defpackage.f22
    public byte i(p0a p0aVar, int i2) {
        return x();
    }

    @Override // defpackage.f22
    public String j(xzb xzbVar, int i2) {
        xzbVar.getClass();
        return r();
    }

    @Override // defpackage.kw2
    public abstract int k();

    @Override // defpackage.f22
    public short l(p0a p0aVar, int i2) {
        return y();
    }

    @Override // defpackage.f22
    public void m(xzb xzbVar) {
        xzbVar.getClass();
    }

    @Override // defpackage.kw2
    public kw2 o(xzb xzbVar) {
        xzbVar.getClass();
        return this;
    }

    @Override // defpackage.f22
    public Object p(xzb xzbVar, int i2, pj6 pj6Var, Object obj) {
        xzbVar.getClass();
        pj6Var.getClass();
        return a(pj6Var);
    }

    @Override // defpackage.f22
    public int q(xzb xzbVar, int i2) {
        xzbVar.getClass();
        return k();
    }

    @Override // defpackage.kw2
    public String r() {
        f0();
        throw null;
    }

    @Override // defpackage.kw2
    public f22 s(xzb xzbVar) {
        xzbVar.getClass();
        return this;
    }

    @Override // defpackage.kw2
    public abstract long t();

    @Override // defpackage.kw2
    public boolean u() {
        return true;
    }

    @Override // defpackage.f22
    public Object v(xzb xzbVar, int i2, pj6 pj6Var, Object obj) {
        xzbVar.getClass();
        pj6Var.getClass();
        if (pj6Var.a().c() || u()) {
            return a(pj6Var);
        }
        return null;
    }

    @Override // defpackage.f22
    public boolean w(p0a p0aVar, int i2) {
        return c();
    }

    @Override // defpackage.kw2
    public abstract byte x();

    @Override // defpackage.kw2
    public abstract short y();

    @Override // defpackage.kw2
    public float z() {
        f0();
        throw null;
    }

    public static final void P(b24 b24Var, t9d t9dVar, r28 r28Var, x12 x12Var, int i2) {
        int i3;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-1494694672);
        if ((i2 & 6) == 0) {
            i3 = (p65Var.f(b24Var) ? 4 : 2) | i2;
        } else {
            i3 = i2;
        }
        if ((i2 & 48) == 0) {
            i3 |= p65Var.f(t9dVar) ? 32 : 16;
        }
        if ((i2 & 384) == 0) {
            i3 |= p65Var.f(r28Var) ? 256 : 128;
        }
        if (p65Var.P(i3 & 1, (i3 & 147) != 146)) {
            r28 r28VarB = r28Var.b(jfc.c);
            zk7 zk7VarC = dy0.c(z46.h, false);
            long j2 = p65Var.T;
            int i4 = (int) (j2 ^ (j2 >>> 32));
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
            tp7.B(p65Var, q12.g, Integer.valueOf(i4));
            tp7.y(p65Var, q12.h);
            tp7.B(p65Var, q12.d, r28VarR);
            boolean z = (i3 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32;
            Object objM = p65Var.M();
            if (z || objM == w12.a) {
                joc jocVar = new joc(0, t9dVar, t9d.class, uuLAxLN.zGHJ, "refresh()V", 0, 26);
                p65Var.j0(jocVar);
                objM = jocVar;
            }
            iq7.a(b24Var, jfc.d(o28.b, 1.0f), null, null, null, null, (m45) ((qh6) objM), null, p65Var, (i3 & 14) | 48, 188);
            p65Var.p(true);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new y5c(i2, 13, b24Var, t9dVar, r28Var);
        }
    }
}
