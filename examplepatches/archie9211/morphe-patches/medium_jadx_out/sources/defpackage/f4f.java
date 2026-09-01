package defpackage;

import android.os.Build;
import android.view.View;
import android.view.animation.Interpolator;
import android.view.animation.PathInterpolator;
import com.medium.reader.R;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class f4f {
    public e4f a;

    public f4f(int i, Interpolator interpolator, long j) {
        if (Build.VERSION.SDK_INT >= 30) {
            this.a = new d4f(wl.b(i, interpolator, j));
        } else {
            this.a = new b4f(i, interpolator, j);
        }
    }

    public static void a(View view, up1 up1Var) {
        if (Build.VERSION.SDK_INT >= 30) {
            d4f.h(view, up1Var);
            return;
        }
        PathInterpolator pathInterpolator = b4f.e;
        View.OnApplyWindowInsetsListener a4fVar = up1Var != null ? new a4f(view, up1Var) : null;
        view.setTag(R.id.tag_window_insets_animation_callback, a4fVar);
        if (view.getTag(R.id.tag_compat_insets_dispatch) == null && view.getTag(R.id.tag_on_apply_window_listener) == null) {
            view.setOnApplyWindowInsetsListener(a4fVar);
        }
    }
}
