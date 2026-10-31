package o9;

import android.graphics.Rect;
import android.graphics.drawable.LevelListDrawable;

/* loaded from: classes2.dex */
public final class z3 extends LevelListDrawable {
    @Override // android.graphics.drawable.DrawableContainer, android.graphics.drawable.Drawable
    public final boolean getPadding(Rect rect) {
        rect.set(0, 0, 0, 0);
        return true;
    }
}
