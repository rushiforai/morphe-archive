package defpackage;

import android.view.View;
import android.view.translation.ViewTranslationCallback;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class xn implements ViewTranslationCallback {
    public static final xn a = new xn();

    public final boolean onClearTranslation(View view) {
        m45 m45Var;
        view.getClass();
        mo contentCaptureManager$ui = ((mn) view).getContentCaptureManager$ui();
        contentCaptureManager$ui.getClass();
        contentCaptureManager$ui.e = fo.SHOW_ORIGINAL;
        i46 i46VarD = contentCaptureManager$ui.d();
        Object[] objArr = i46VarD.c;
        long[] jArr = i46VarD.a;
        int length = jArr.length - 2;
        if (length < 0) {
            return true;
        }
        int i = 0;
        while (true) {
            long j = jArr[i];
            if ((((~j) << 7) & j & (-9187201950435737472L)) != -9187201950435737472L) {
                int i2 = 8 - ((~(i - length)) >>> 31);
                for (int i3 = 0; i3 < i2; i3++) {
                    if ((255 & j) < 128) {
                        f78 f78Var = ((byb) objArr[(i << 3) + i3]).a.d.a;
                        Object objG = f78Var.g(eyb.E);
                        if (objG == null) {
                            objG = null;
                        }
                        if (objG != null) {
                            Object objG2 = f78Var.g(sxb.n);
                            i4 i4Var = (i4) (objG2 != null ? objG2 : null);
                            if (i4Var != null && (m45Var = (m45) i4Var.b) != null) {
                            }
                        }
                    }
                    j >>= 8;
                }
                if (i2 != 8) {
                    return true;
                }
            }
            if (i == length) {
                return true;
            }
            i++;
        }
    }

    public final boolean onHideTranslation(View view) {
        x45 x45Var;
        view.getClass();
        mo contentCaptureManager$ui = ((mn) view).getContentCaptureManager$ui();
        contentCaptureManager$ui.getClass();
        contentCaptureManager$ui.e = fo.SHOW_ORIGINAL;
        i46 i46VarD = contentCaptureManager$ui.d();
        Object[] objArr = i46VarD.c;
        long[] jArr = i46VarD.a;
        int length = jArr.length - 2;
        if (length < 0) {
            return true;
        }
        int i = 0;
        while (true) {
            long j = jArr[i];
            if ((((~j) << 7) & j & (-9187201950435737472L)) != -9187201950435737472L) {
                int i2 = 8 - ((~(i - length)) >>> 31);
                for (int i3 = 0; i3 < i2; i3++) {
                    if ((255 & j) < 128) {
                        f78 f78Var = ((byb) objArr[(i << 3) + i3]).a.d.a;
                        Object objG = f78Var.g(eyb.E);
                        if (objG == null) {
                            objG = null;
                        }
                        if (g76.L(objG, Boolean.TRUE)) {
                            Object objG2 = f78Var.g(sxb.m);
                            i4 i4Var = (i4) (objG2 != null ? objG2 : null);
                            if (i4Var != null && (x45Var = (x45) i4Var.b) != null) {
                            }
                        }
                    }
                    j >>= 8;
                }
                if (i2 != 8) {
                    return true;
                }
            }
            if (i == length) {
                return true;
            }
            i++;
        }
    }

    public final boolean onShowTranslation(View view) {
        x45 x45Var;
        view.getClass();
        mo contentCaptureManager$ui = ((mn) view).getContentCaptureManager$ui();
        contentCaptureManager$ui.getClass();
        contentCaptureManager$ui.e = fo.SHOW_TRANSLATED;
        i46 i46VarD = contentCaptureManager$ui.d();
        Object[] objArr = i46VarD.c;
        long[] jArr = i46VarD.a;
        int length = jArr.length - 2;
        if (length < 0) {
            return true;
        }
        int i = 0;
        while (true) {
            long j = jArr[i];
            if ((((~j) << 7) & j & (-9187201950435737472L)) != -9187201950435737472L) {
                int i2 = 8 - ((~(i - length)) >>> 31);
                for (int i3 = 0; i3 < i2; i3++) {
                    if ((255 & j) < 128) {
                        f78 f78Var = ((byb) objArr[(i << 3) + i3]).a.d.a;
                        Object objG = f78Var.g(eyb.E);
                        if (objG == null) {
                            objG = null;
                        }
                        if (g76.L(objG, Boolean.FALSE)) {
                            Object objG2 = f78Var.g(sxb.m);
                            i4 i4Var = (i4) (objG2 != null ? objG2 : null);
                            if (i4Var != null && (x45Var = (x45) i4Var.b) != null) {
                            }
                        }
                    }
                    j >>= 8;
                }
                if (i2 != 8) {
                    return true;
                }
            }
            if (i == length) {
                return true;
            }
            i++;
        }
    }
}
