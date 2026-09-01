package defpackage;

import androidx.compose.ui.input.pointer.PointerInputEventHandler;
import com.drew.lang.RandomAccessStreamReader;
import com.drew.metadata.exif.makernotes.NikonType2MakernoteDirectory;
import com.drew.metadata.exif.makernotes.OlympusMakernoteDirectory;
import com.drew.metadata.exif.makernotes.PanasonicMakernoteDirectory;
import com.drew.metadata.exif.makernotes.ReconyxUltraFireMakernoteDirectory;
import com.medium.reader.R;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class t18 {
    public static final long a = mq7.r(0.5f, 0.0f);

    /* JADX WARN: Removed duplicated region for block: B:102:0x018c  */
    /* JADX WARN: Removed duplicated region for block: B:105:0x01b1  */
    /* JADX WARN: Removed duplicated region for block: B:116:0x01d7  */
    /* JADX WARN: Removed duplicated region for block: B:117:0x01da  */
    /* JADX WARN: Removed duplicated region for block: B:120:0x01e3 A[ADDED_TO_REGION] */
    /* JADX WARN: Removed duplicated region for block: B:121:0x01e5  */
    /* JADX WARN: Removed duplicated region for block: B:128:0x0201  */
    /* JADX WARN: Removed duplicated region for block: B:131:0x020a  */
    /* JADX WARN: Removed duplicated region for block: B:134:0x0211  */
    /* JADX WARN: Removed duplicated region for block: B:135:0x0214  */
    /* JADX WARN: Removed duplicated region for block: B:138:0x021d A[ADDED_TO_REGION] */
    /* JADX WARN: Removed duplicated region for block: B:139:0x021f  */
    /* JADX WARN: Removed duplicated region for block: B:142:0x0232  */
    /* JADX WARN: Removed duplicated region for block: B:153:0x025f  */
    /* JADX WARN: Removed duplicated region for block: B:154:0x0262  */
    /* JADX WARN: Removed duplicated region for block: B:157:0x026b A[ADDED_TO_REGION] */
    /* JADX WARN: Removed duplicated region for block: B:160:0x0274  */
    /* JADX WARN: Removed duplicated region for block: B:163:0x02d8  */
    /* JADX WARN: Removed duplicated region for block: B:177:0x0313  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final void a(final defpackage.m45 r31, final defpackage.r28 r32, defpackage.v7c r33, final float r34, boolean r35, final defpackage.m3c r36, final long r37, long r39, long r41, final defpackage.mz1 r43, defpackage.b55 r44, defpackage.u18 r45, final defpackage.mz1 r46, defpackage.x12 r47, final int r48, final int r49) {
        /*
            Method dump skipped, instruction units count: 857
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.t18.a(m45, r28, v7c, float, boolean, m3c, long, long, long, mz1, b55, u18, mz1, x12, int, int):void");
    }

    public static final void b(final ou ouVar, final sb2 sb2Var, final m45 m45Var, final x45 x45Var, final r28 r28Var, final v7c v7cVar, final float f, final boolean z, final m3c m3cVar, final long j, final long j2, final float f2, final mz1 mz1Var, final b55 b55Var, final mz1 mz1Var2, x12 x12Var, final int i) {
        p65 p65Var;
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(-37400432);
        int i2 = i | (p65Var2.h(ouVar) ? 32 : 16) | (p65Var2.h(sb2Var) ? 256 : 128) | (p65Var2.h(m45Var) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024) | (p65Var2.h(x45Var) ? OlympusMakernoteDirectory.TAG_MAIN_INFO : 8192);
        boolean zF = p65Var2.f(r28Var);
        int i3 = ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID;
        int i4 = i2 | (zF ? 131072 : 65536) | (p65Var2.f(v7cVar) ? 1048576 : 524288) | (p65Var2.c(f) ? 8388608 : 4194304) | (p65Var2.g(z) ? 67108864 : 33554432) | (p65Var2.f(m3cVar) ? 536870912 : 268435456);
        int i5 = (p65Var2.e(j) ? 4 : 2) | (p65Var2.e(j2) ? 32 : 16) | (p65Var2.c(f2) ? 256 : 128) | (p65Var2.h(mz1Var) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024) | (p65Var2.h(b55Var) ? OlympusMakernoteDirectory.TAG_MAIN_INFO : 8192);
        if (p65Var2.h(mz1Var2)) {
            i3 = 131072;
        }
        int i6 = i5 | i3;
        if (p65Var2.P(i4 & 1, ((i4 & 306783379) == 306783378 && (i6 & 74899) == 74898) ? false : true)) {
            p65Var2.U();
            if ((i & 1) != 0 && !p65Var2.z()) {
                p65Var2.S();
            }
            p65Var2.q();
            String strV = ep7.v(p65Var2, R.string.m3c_bottom_sheet_pane_title);
            r28 r28VarD = jfc.d(jfc.q(iy0.a.a(r28Var, z46.e), 0.0f, f, 1), 1.0f);
            r28 r28VarJ = o28.b;
            uob uobVar = w12.a;
            if (z) {
                p65Var2.Y(-1582035383);
                boolean z2 = (((i4 & 3670016) ^ 1572864) > 1048576 && p65Var2.f(v7cVar)) || (i4 & 1572864) == 1048576;
                Object objM = p65Var2.M();
                if (z2 || objM == uobVar) {
                    hw8 hw8Var = hw8.Vertical;
                    cud cudVar = s7c.a;
                    objM = new q7c(v7cVar, x45Var, hw8Var);
                    p65Var2.j0(objM);
                }
                r28VarJ = rv8.J(r28VarJ, (zc8) objM, null);
                p65Var2.p(false);
            } else {
                p65Var2.Y(-1582020872);
                p65Var2.p(false);
            }
            r28 r28VarB = r28VarD.b(r28VarJ);
            tl tlVar = v7cVar.e;
            tl tlVar2 = v7cVar.e;
            hw8 hw8Var2 = hw8.Vertical;
            int i7 = (i4 & 3670016) ^ 1572864;
            boolean z3 = (i7 > 1048576 && p65Var2.f(v7cVar)) || (i4 & 1572864) == 1048576;
            Object objM2 = p65Var2.M();
            if (z3 || objM2 == uobVar) {
                objM2 = new v08(2, v7cVar);
                p65Var2.j0(objM2);
            }
            r28 r28VarL = rx0.L(r28VarB, tlVar, hw8Var2, (b55) objM2);
            rl rlVar = (rl) tlVar2.f;
            boolean z4 = z && v7cVar.e();
            boolean z5 = ((k49) tlVar2.h).getValue() != null;
            boolean z6 = (i4 & 57344) == 16384;
            Object objM3 = p65Var2.M();
            if (z6 || objM3 == uobVar) {
                objM3 = new o18(x45Var, null);
                p65Var2.j0(objM3);
            }
            r28 r28VarA = pl3.a(r28VarL, rlVar, hw8Var2, z4, null, z5, (c55) objM3, false, NikonType2MakernoteDirectory.TAG_FLASH_INFO);
            boolean zF2 = p65Var2.f(strV);
            Object objM4 = p65Var2.M();
            int i8 = 6;
            if (zF2 || objM4 == uobVar) {
                objM4 = new ov5(strV, i8);
                p65Var2.j0(objM4);
            }
            r28 r28VarA2 = wxb.a(r28VarA, false, (x45) objM4);
            int iG = (int) ((g49) tlVar2.k).g();
            if (iG < 0) {
                iG = 0;
            }
            r28 r28VarN = op8.N(r28VarA2, new hl4(iG));
            boolean z7 = ((i7 > 1048576 && p65Var2.f(v7cVar)) || (i4 & 1572864) == 1048576) | ((i4 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32 || p65Var2.h(ouVar));
            Object objM5 = p65Var2.M();
            if (z7 || objM5 == uobVar) {
                objM5 = new si3(v7cVar, 27, ouVar);
                p65Var2.j0(objM5);
            }
            int i9 = i6 << 6;
            p65Var = p65Var2;
            g3d.a(xz5.W(xz5.W(r28VarN, (x45) objM5), new hw0(v7cVar, 1)), m3cVar, j, j2, f2, 0.0f, null, pxf.E(728743275, new r18(b55Var, ouVar, v7cVar, mz1Var, mz1Var2, m45Var, sb2Var, z), p65Var2), p65Var, ((i4 >> 24) & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) | 12582912 | (i9 & 896) | (i9 & 7168) | (i9 & 57344), 96);
        } else {
            p65Var = p65Var2;
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new b55(sb2Var, m45Var, x45Var, r28Var, v7cVar, f, z, m3cVar, j, j2, f2, mz1Var, b55Var, mz1Var2, i) { // from class: k18
                public final /* synthetic */ sb2 b;
                public final /* synthetic */ m45 c;
                public final /* synthetic */ x45 d;
                public final /* synthetic */ r28 e;
                public final /* synthetic */ v7c f;
                public final /* synthetic */ float g;
                public final /* synthetic */ boolean h;
                public final /* synthetic */ m3c i;
                public final /* synthetic */ long j;
                public final /* synthetic */ long k;
                public final /* synthetic */ float l;
                public final /* synthetic */ mz1 m;
                public final /* synthetic */ b55 n;
                public final /* synthetic */ mz1 o;

                @Override // defpackage.b55
                public final Object invoke(Object obj, Object obj2) {
                    ((Integer) obj2).getClass();
                    int iY = tr7.y(71);
                    t18.b(this.a, this.b, this.c, this.d, this.e, this.f, this.g, this.h, this.i, this.j, this.k, this.l, this.m, this.n, this.o, (x12) obj, iY);
                    return c1e.a;
                }
            };
        }
    }

    public static final void c(long j, m45 m45Var, boolean z, x12 x12Var, int i) {
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-391613911);
        int i2 = i | (p65Var.e(j) ? 4 : 2) | (p65Var.h(m45Var) ? 32 : 16) | (p65Var.g(z) ? 256 : 128) | (p65Var.g(true) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024);
        if (!p65Var.P(i2 & 1, (i2 & 1171) != 1170)) {
            p65Var.S();
        } else if (j != 16) {
            p65Var.Y(-1438582326);
            upc upcVarB = zu.b(z ? 1.0f : 0.0f, ek7.N(i48.DefaultEffects, p65Var), null, p65Var, 0, 28);
            String strV = ep7.v(p65Var, R.string.close_sheet);
            p65Var.Y(-1438283579);
            int i3 = i2 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION;
            boolean z2 = i3 == 32;
            Object objM = p65Var.M();
            uob uobVar = w12.a;
            if (z2 || objM == uobVar) {
                objM = new dp(3, m45Var);
                p65Var.j0(objM);
            }
            q4d q4dVar = new q4d(m45Var, null, (PointerInputEventHandler) objM, 6);
            boolean zF = (i3 == 32) | p65Var.f(strV);
            Object objM2 = p65Var.M();
            if (zF || objM2 == uobVar) {
                objM2 = new si3(strV, 28, m45Var);
                p65Var.j0(objM2);
            }
            r28 r28VarA = wxb.a(q4dVar, true, (x45) objM2);
            p65Var.p(false);
            r28 r28VarB = jfc.c.b(r28VarA);
            boolean zF2 = p65Var.f(upcVarB) | ((i2 & 14) == 4);
            Object objM3 = p65Var.M();
            if (zF2 || objM3 == uobVar) {
                objM3 = new lt6(j, upcVarB);
                p65Var.j0(objM3);
            }
            pxf.a(r28VarB, (x45) objM3, p65Var, 0);
            p65Var.p(false);
        } else {
            p65Var.Y(-1437676103);
            p65Var.p(false);
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new kt0(j, m45Var, z, i);
        }
    }

    public static final float d(tjb tjbVar, float f) {
        float fIntBitsToFloat = Float.intBitsToFloat((int) (tjbVar.r >> 32));
        if (Float.isNaN(fIntBitsToFloat) || fIntBitsToFloat == 0.0f) {
            return 1.0f;
        }
        return 1.0f - (mk7.E(0.0f, Math.min(tjbVar.s.b() * 48.0f, fIntBitsToFloat), f) / fIntBitsToFloat);
    }

    public static final float e(tjb tjbVar, float f) {
        float fIntBitsToFloat = Float.intBitsToFloat((int) (tjbVar.r & 4294967295L));
        if (Float.isNaN(fIntBitsToFloat) || fIntBitsToFloat == 0.0f) {
            return 1.0f;
        }
        return 1.0f - (mk7.E(0.0f, Math.min(tjbVar.s.b() * 24.0f, fIntBitsToFloat), f) / fIntBitsToFloat);
    }

    public static final v7c f(int i, int i2, x12 x12Var) {
        boolean z = (i2 & 1) == 0;
        p65 p65Var = (p65) x12Var;
        Object objM = p65Var.M();
        if (objM == w12.a) {
            objM = new nx(19);
            p65Var.j0(objM);
        }
        return s7c.b(z, (x45) objM, w7c.Hidden, false, x12Var, (i & 14) | 384, 56);
    }
}
