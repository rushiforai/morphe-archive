package defpackage;

import android.content.Context;
import android.view.View;
import android.view.animation.PathInterpolator;
import com.medium.reader.R;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class lj7 {
    public final PathInterpolator a = new PathInterpolator(0.1f, 0.1f, 0.0f, 1.0f);
    public final View b;
    public final int c;
    public final int d;
    public final int e;
    public sl0 f;

    public lj7(View view) {
        this.b = view;
        Context context = view.getContext();
        this.c = sgg.W(context, R.attr.motionDurationMedium2, 300);
        this.d = sgg.W(context, R.attr.motionDurationShort3, 150);
        this.e = sgg.W(context, R.attr.motionDurationShort2, 100);
    }
}
