package mz;

import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.drawable.Drawable;
import kotlin.NotImplementedError;

/* loaded from: classes4.dex */
public final class a extends Drawable {
    public a(int i5, o oVar) {
        new b(i5, oVar);
    }

    @Override // android.graphics.drawable.Drawable
    public final void draw(Canvas canvas) {
        canvas.translate(getBounds().exactCenterX(), getBounds().exactCenterY());
    }

    @Override // android.graphics.drawable.Drawable
    public final int getOpacity() {
        return -2;
    }

    @Override // android.graphics.drawable.Drawable
    public final void setAlpha(int i5) {
        throw new NotImplementedError("An operation is not implemented: Not yet implemented");
    }

    @Override // android.graphics.drawable.Drawable
    public final void setColorFilter(ColorFilter colorFilter) {
        throw new NotImplementedError("An operation is not implemented: Not yet implemented");
    }
}
