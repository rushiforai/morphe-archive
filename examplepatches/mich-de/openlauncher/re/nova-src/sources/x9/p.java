package x9;

import android.graphics.Rect;
import android.view.View;
import ya.j0;

/* loaded from: classes.dex */
public interface p {
    default void d(Rect rect) {
    }

    default j0 e() {
        return new o9.o(1);
    }

    default void k(Rect rect) {
        d(rect);
    }

    /* JADX WARN: Multi-variable type inference failed */
    default float l() {
        return ((View) this).getScaleX();
    }

    int m();
}
