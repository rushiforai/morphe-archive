package s9;

import android.util.FloatProperty;
import android.util.IntProperty;
import android.view.View;
import android.view.animation.Interpolator;

/* loaded from: classes.dex */
public interface o {

    /* renamed from: a, reason: collision with root package name */
    public static final n f86814a = new n();

    default void a(Object obj, FloatProperty floatProperty, float f11, Interpolator interpolator) {
        floatProperty.setValue(obj, f11);
    }

    default void b(Object obj, IntProperty intProperty, int i5, Interpolator interpolator) {
        intProperty.setValue(obj, i5);
    }

    default void c(View view, float f11, Interpolator interpolator) {
        if (view != null) {
            view.setAlpha(f11);
            a.a(view);
        }
    }

    default void d(View view, int i5, Interpolator interpolator) {
        if (view != null) {
            view.setBackgroundColor(i5);
        }
    }
}
