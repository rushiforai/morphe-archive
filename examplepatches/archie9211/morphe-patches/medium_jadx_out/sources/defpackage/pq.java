package defpackage;

import com.drew.lang.RandomAccessStreamReader;
import com.drew.metadata.exif.makernotes.OlympusMakernoteDirectory;
import com.drew.metadata.exif.makernotes.PanasonicMakernoteDirectory;
import com.drew.metadata.exif.makernotes.ReconyxUltraFireMakernoteDirectory;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class pq {
    public static final hd9 a = new hd9(true);

    public static final void a(boolean z, m45 m45Var, r28 r28Var, long j, yrb yrbVar, hd9 hd9Var, mz1 mz1Var, x12 x12Var, int i) {
        int i2;
        hd9 hd9Var2;
        hd9 hd9Var3;
        hd9 hd9Var4;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(1275450738);
        if ((i & 6) == 0) {
            i2 = (p65Var.g(z) ? 4 : 2) | i;
        } else {
            i2 = i;
        }
        if ((i & 48) == 0) {
            i2 |= p65Var.h(m45Var) ? 32 : 16;
        }
        if ((i & 384) == 0) {
            i2 |= p65Var.f(r28Var) ? 256 : 128;
        }
        if ((i & 3072) == 0) {
            i2 |= p65Var.e(j) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024;
        }
        if ((i & 24576) == 0) {
            i2 |= p65Var.f(yrbVar) ? OlympusMakernoteDirectory.TAG_MAIN_INFO : 8192;
        }
        int i3 = i2 | 196608;
        if ((1572864 & i) == 0) {
            i3 |= p65Var.h(mz1Var) ? 1048576 : 524288;
        }
        if (p65Var.P(i3 & 1, (599187 & i3) != 599186)) {
            p65Var.U();
            if ((i & 1) == 0 || p65Var.z()) {
                hd9Var3 = a;
            } else {
                p65Var.S();
                hd9Var3 = hd9Var;
            }
            p65Var.q();
            Object objM = p65Var.M();
            uob uobVar = w12.a;
            if (objM == uobVar) {
                objM = new m78(Boolean.FALSE);
                p65Var.j0(objM);
            }
            m78 m78Var = (m78) objM;
            m78Var.d.setValue(Boolean.valueOf(z));
            if (((Boolean) m78Var.c.getValue()).booleanValue() || ((Boolean) m78Var.d.getValue()).booleanValue()) {
                p65Var.Y(-622294666);
                Object objM2 = p65Var.M();
                if (objM2 == uobVar) {
                    objM2 = qo7.u(new nrd(nrd.b));
                    p65Var.j0(objM2);
                }
                l78 l78Var = (l78) objM2;
                m73 m73Var = (m73) p65Var.j(z22.h);
                Object objM3 = p65Var.M();
                if (objM3 == uobVar) {
                    objM3 = new hq(l78Var, 1);
                    p65Var.j0(objM3);
                }
                hd9Var4 = hd9Var3;
                tr.a(new gn3(j, m73Var, (b55) objM3), m45Var, hd9Var4, pxf.E(1788768427, new jq(m78Var, l78Var, yrbVar, r28Var, mz1Var), p65Var), p65Var, (i3 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) | 3072 | ((i3 >> 9) & 896), 0);
                p65Var.p(false);
            } else {
                p65Var.Y(-621500880);
                p65Var.p(false);
                hd9Var4 = hd9Var3;
            }
            hd9Var2 = hd9Var4;
        } else {
            p65Var.S();
            hd9Var2 = hd9Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new lq(z, m45Var, r28Var, j, yrbVar, hd9Var2, mz1Var, i);
        }
    }

    public static final void b(m45 m45Var, r28 r28Var, boolean z, hy8 hy8Var, mz1 mz1Var, x12 x12Var, int i) {
        int i2;
        boolean z2;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(670540513);
        if ((i & 6) == 0) {
            i2 = (p65Var.h(m45Var) ? 4 : 2) | i;
        } else {
            i2 = i;
        }
        if ((i & 48) == 0) {
            i2 |= p65Var.f(r28Var) ? 32 : 16;
        }
        int i3 = i2 | 384;
        if ((i & 3072) == 0) {
            i3 |= p65Var.f(hy8Var) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024;
        }
        int i4 = i3 | 24576;
        if ((196608 & i) == 0) {
            i4 |= p65Var.h(mz1Var) ? 131072 : ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID;
        }
        if (p65Var.P(i4 & 1, (74899 & i4) != 74898)) {
            yo7.c(m45Var, r28Var, hy8Var, mz1Var, p65Var, i4 & 524286);
            z2 = true;
        } else {
            p65Var.S();
            z2 = z;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new mq(m45Var, r28Var, z2, hy8Var, mz1Var, i, 0);
        }
    }
}
