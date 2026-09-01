package defpackage;

import android.content.Context;
import android.graphics.drawable.Drawable;
import androidx.appcompat.widget.AppCompatImageView;
import com.medium.reader.R;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class g6 extends AppCompatImageView implements i6 {
    public final /* synthetic */ h6 d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public g6(h6 h6Var, Context context) {
        super(context, null, R.attr.actionOverflowButtonStyle);
        this.d = h6Var;
        setClickable(true);
        setFocusable(true);
        setVisibility(0);
        setEnabled(true);
        ep7.A(this, getContentDescription());
        setOnTouchListener(new c6(this, this));
    }

    @Override // defpackage.i6
    public final boolean b() {
        return false;
    }

    @Override // defpackage.i6
    public final boolean c() {
        return false;
    }

    @Override // android.view.View
    public final boolean performClick() {
        if (super.performClick()) {
            return true;
        }
        playSoundEffect(0);
        this.d.l();
        return true;
    }

    @Override // android.widget.ImageView
    public final boolean setFrame(int i, int i2, int i3, int i4) {
        boolean frame = super.setFrame(i, i2, i3, i4);
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
