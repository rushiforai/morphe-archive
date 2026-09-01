package defpackage;

import com.drew.lang.RandomAccessStreamReader;
import com.drew.metadata.exif.makernotes.OlympusMakernoteDirectory;
import com.drew.metadata.exif.makernotes.ReconyxUltraFireMakernoteDirectory;
import com.drew.metadata.photoshop.PhotoshopDirectory;
import java.io.Serializable;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class vz1 implements h55 {
    @Override // defpackage.h55
    public final Object q(Object obj, Object obj2, Object obj3, Object obj4, Object obj5, Object obj6, Object obj7, Serializable serializable) {
        int i;
        r28 r28Var = (r28) obj;
        String str = (String) obj2;
        boolean zBooleanValue = ((Boolean) obj3).booleanValue();
        f92 f92Var = (f92) obj4;
        c55 c55Var = (c55) obj5;
        m45 m45Var = (m45) obj6;
        x12 x12Var = (x12) obj7;
        int iIntValue = ((Integer) serializable).intValue();
        if ((iIntValue & 6) == 0) {
            i = (((p65) x12Var).f(r28Var) ? 4 : 2) | iIntValue;
        } else {
            i = iIntValue;
        }
        if ((iIntValue & 48) == 0) {
            i |= ((p65) x12Var).f(str) ? 32 : 16;
        }
        if ((iIntValue & 384) == 0) {
            i |= ((p65) x12Var).g(zBooleanValue) ? 256 : 128;
        }
        if ((iIntValue & 3072) == 0) {
            i |= ((p65) x12Var).f(f92Var) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024;
        }
        if ((iIntValue & 24576) == 0) {
            i |= ((p65) x12Var).h(c55Var) ? OlympusMakernoteDirectory.TAG_MAIN_INFO : 8192;
        }
        if ((iIntValue & 196608) == 0) {
            i |= ((p65) x12Var).h(m45Var) ? 131072 : ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID;
        }
        p65 p65Var = (p65) x12Var;
        if (p65Var.P(i & 1, (599187 & i) != 599186)) {
            i92.c(str, zBooleanValue, f92Var, r28Var, c55Var, m45Var, p65Var, ((i >> 3) & PhotoshopDirectory.TAG_QUICK_MASK_INFORMATION) | ((i << 9) & 7168) | (57344 & i) | (i & 458752));
        } else {
            p65Var.S();
        }
        return c1e.a;
    }
}
