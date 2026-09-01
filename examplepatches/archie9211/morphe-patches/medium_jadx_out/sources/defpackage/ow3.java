package defpackage;

import android.content.Context;
import com.medium.reader.R;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ow3 {
    public static final int f = (int) Math.round(5.1000000000000005d);
    public final boolean a;
    public final int b;
    public final int c;
    public final int d;
    public final float e;

    public ow3(Context context) {
        boolean zV = sgg.V(context.getTheme(), R.attr.elevationOverlayEnabled, false);
        int iB = hlg.B(context, R.attr.elevationOverlayColor, 0);
        int iB2 = hlg.B(context, R.attr.elevationOverlayAccentColor, 0);
        int iB3 = hlg.B(context, R.attr.colorSurface, 0);
        float f2 = context.getResources().getDisplayMetrics().density;
        this.a = zV;
        this.b = iB;
        this.c = iB2;
        this.d = iB3;
        this.e = f2;
    }
}
