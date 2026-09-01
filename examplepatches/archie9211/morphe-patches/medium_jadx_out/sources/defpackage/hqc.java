package defpackage;

import android.graphics.Bitmap;
import android.graphics.ImageDecoder;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class hqc implements jw2 {
    public final oyb a;

    public hqc(oyb oybVar) {
        this.a = oybVar;
    }

    @Override // defpackage.jw2
    public final lw2 a(kkc kkcVar, ew8 ew8Var) {
        ImageDecoder.Source sourceL;
        Bitmap.Config configA = wx5.a(ew8Var);
        if ((configA == Bitmap.Config.ARGB_8888 || configA == Bitmap.Config.HARDWARE) && (sourceL = nm.L(kkcVar.a, ew8Var, false)) != null) {
            return new jqc(sourceL, kkcVar.a, ew8Var, this.a);
        }
        return null;
    }
}
