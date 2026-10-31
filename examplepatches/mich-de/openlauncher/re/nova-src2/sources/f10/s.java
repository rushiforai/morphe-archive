package f10;

import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.InsetDrawable;

/* loaded from: classes4.dex */
public final class s extends InsetDrawable {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f54210a;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ s(Drawable drawable, int i5, int i11, int i12, int i13, int i14) {
        super(drawable, i5, i11, i12, i13);
        this.f54210a = i14;
    }

    @Override // android.graphics.drawable.Drawable
    public int getMinimumHeight() {
        switch (this.f54210a) {
            case 1:
                return -1;
            default:
                return super.getMinimumHeight();
        }
    }

    @Override // android.graphics.drawable.Drawable
    public int getMinimumWidth() {
        switch (this.f54210a) {
            case 1:
                return -1;
            default:
                return super.getMinimumWidth();
        }
    }

    @Override // android.graphics.drawable.InsetDrawable, android.graphics.drawable.DrawableWrapper, android.graphics.drawable.Drawable
    public final boolean getPadding(Rect rect) {
        switch (this.f54210a) {
        }
        return false;
    }
}
