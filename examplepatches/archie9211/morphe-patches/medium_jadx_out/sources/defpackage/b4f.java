package defpackage;

import android.view.View;
import android.view.ViewGroup;
import android.view.animation.AccelerateInterpolator;
import android.view.animation.DecelerateInterpolator;
import android.view.animation.PathInterpolator;
import com.medium.reader.R;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class b4f extends e4f {
    public static final PathInterpolator e = new PathInterpolator(0.0f, 1.1f, 0.0f, 1.0f);
    public static final u94 f = new u94(0);
    public static final DecelerateInterpolator g = new DecelerateInterpolator(1.5f);
    public static final AccelerateInterpolator h = new AccelerateInterpolator(1.5f);

    public static void f(View view, f4f f4fVar) {
        up1 up1VarJ = j(view);
        if (up1VarJ != null) {
            up1VarJ.d(f4fVar);
            if (up1VarJ.b == 0) {
                return;
            }
        }
        if (view instanceof ViewGroup) {
            ViewGroup viewGroup = (ViewGroup) view;
            for (int i = 0; i < viewGroup.getChildCount(); i++) {
                f(viewGroup.getChildAt(i), f4fVar);
            }
        }
    }

    public static void g(View view, f4f f4fVar, z4f z4fVar, boolean z) {
        up1 up1VarJ = j(view);
        if (up1VarJ != null) {
            up1VarJ.c = z4fVar;
            if (!z) {
                up1VarJ.e(f4fVar);
                z = up1VarJ.b == 0;
            }
        }
        if (view instanceof ViewGroup) {
            ViewGroup viewGroup = (ViewGroup) view;
            for (int i = 0; i < viewGroup.getChildCount(); i++) {
                g(viewGroup.getChildAt(i), f4fVar, z4fVar, z);
            }
        }
    }

    public static void h(View view, z4f z4fVar, List list) {
        up1 up1VarJ = j(view);
        if (up1VarJ != null) {
            z4fVar = up1VarJ.f(z4fVar, list);
            if (up1VarJ.b == 0) {
                return;
            }
        }
        if (view instanceof ViewGroup) {
            ViewGroup viewGroup = (ViewGroup) view;
            for (int i = 0; i < viewGroup.getChildCount(); i++) {
                h(viewGroup.getChildAt(i), z4fVar, list);
            }
        }
    }

    public static void i(View view, f4f f4fVar, mya myaVar) {
        up1 up1VarJ = j(view);
        if (up1VarJ != null) {
            up1VarJ.g(f4fVar, myaVar);
            if (up1VarJ.b == 0) {
                return;
            }
        }
        if (view instanceof ViewGroup) {
            ViewGroup viewGroup = (ViewGroup) view;
            for (int i = 0; i < viewGroup.getChildCount(); i++) {
                i(viewGroup.getChildAt(i), f4fVar, myaVar);
            }
        }
    }

    public static up1 j(View view) {
        Object tag = view.getTag(R.id.tag_window_insets_animation_callback);
        if (tag instanceof a4f) {
            return ((a4f) tag).a;
        }
        return null;
    }
}
