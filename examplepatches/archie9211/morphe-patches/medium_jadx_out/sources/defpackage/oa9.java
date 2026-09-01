package defpackage;

import android.view.View;
import android.widget.Magnifier;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class oa9 implements ma9 {
    public static final oa9 a = new oa9();

    @Override // defpackage.ma9
    public final boolean b() {
        return true;
    }

    @Override // defpackage.ma9
    public final la9 c(View view, boolean z, long j, float f, float f2, boolean z2, m73 m73Var, float f3) {
        if (z) {
            return new na9(new Magnifier(view));
        }
        long jM0 = m73Var.m0(j);
        float fZ = m73Var.Z(f);
        float fZ2 = m73Var.Z(f2);
        Magnifier.Builder builder = new Magnifier.Builder(view);
        if (jM0 != 9205357640488583168L) {
            builder.setSize(nk7.w0(Float.intBitsToFloat((int) (jM0 >> 32))), nk7.w0(Float.intBitsToFloat((int) (jM0 & 4294967295L))));
        }
        if (!Float.isNaN(fZ)) {
            builder.setCornerRadius(fZ);
        }
        if (!Float.isNaN(fZ2)) {
            builder.setElevation(fZ2);
        }
        if (!Float.isNaN(f3)) {
            builder.setInitialZoom(f3);
        }
        builder.setClippingEnabled(z2);
        return new na9(builder.build());
    }
}
