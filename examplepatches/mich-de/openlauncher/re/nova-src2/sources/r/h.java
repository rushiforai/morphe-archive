package r;

import android.content.Context;
import android.graphics.drawable.Drawable;
import androidx.appcompat.widget.AppCompatImageView;

/* loaded from: classes2.dex */
public final class h extends AppCompatImageView implements j {

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ i f84722d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public h(i iVar, Context context) {
        super(context, null, 2130968611);
        this.f84722d = iVar;
        setClickable(true);
        setFocusable(true);
        setVisibility(0);
        setEnabled(true);
        m2.a(this, getContentDescription());
        setOnTouchListener(new q.b(this, this));
    }

    @Override // r.j
    public final boolean a() {
        return false;
    }

    @Override // r.j
    public final boolean b() {
        return false;
    }

    @Override // android.view.View
    public final boolean performClick() {
        if (super.performClick()) {
            return true;
        }
        playSoundEffect(0);
        this.f84722d.l();
        return true;
    }

    @Override // android.widget.ImageView
    public final boolean setFrame(int i5, int i11, int i12, int i13) {
        boolean frame = super.setFrame(i5, i11, i12, i13);
        Drawable drawable = getDrawable();
        Drawable background = getBackground();
        if (drawable != null && background != null) {
            int width = getWidth();
            int height = getHeight();
            int iMax = Math.max(width, height) / 2;
            int paddingLeft = (width + (getPaddingLeft() - getPaddingRight())) / 2;
            int paddingTop = (height + (getPaddingTop() - getPaddingBottom())) / 2;
            background.setHotspotBounds(paddingLeft - iMax, paddingTop - iMax, paddingLeft + iMax, paddingTop + iMax);
        }
        return frame;
    }
}
