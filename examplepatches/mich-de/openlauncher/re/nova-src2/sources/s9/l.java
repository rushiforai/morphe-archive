package s9;

import a5.f0;
import android.view.View;
import android.view.WindowInsets;
import android.view.WindowInsetsAnimation;
import android.view.WindowInsetsAnimation$Callback;
import java.util.List;
import java.util.regex.Pattern;
import o9.g3;

/* loaded from: classes.dex */
public final class l extends WindowInsetsAnimation$Callback {

    /* renamed from: a, reason: collision with root package name */
    public final View f86808a;

    /* renamed from: b, reason: collision with root package name */
    public float f86809b;

    /* renamed from: c, reason: collision with root package name */
    public float f86810c;

    public l(View view) {
        super(0);
        this.f86808a = view;
    }

    public final void onPrepare(WindowInsetsAnimation windowInsetsAnimation) {
        this.f86809b = this.f86808a.getTranslationY();
    }

    public final WindowInsets onProgress(WindowInsets windowInsets, List list) {
        int size = list.size();
        View view = this.f86808a;
        if (size == 0) {
            view.setTranslationY(this.f86809b);
            return windowInsets;
        }
        float interpolatedFraction = f0.k(list.get(0)).getInterpolatedFraction();
        float f11 = this.f86809b;
        float f12 = this.f86810c;
        Pattern pattern = g3.f79846a;
        view.setTranslationY(((f12 - f11) * interpolatedFraction) + f11);
        return windowInsets;
    }

    public final WindowInsetsAnimation.Bounds onStart(WindowInsetsAnimation windowInsetsAnimation, WindowInsetsAnimation.Bounds bounds) {
        this.f86810c = this.f86808a.getTranslationY();
        return super.onStart(windowInsetsAnimation, bounds);
    }
}
