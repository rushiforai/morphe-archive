package androidx.cardview.widget;

import android.content.Context;
import android.content.res.ColorStateList;
import android.widget.FrameLayout;

/** Test stand-in for AndroidX's card view: only its background color accessors are read. */
public class CardView extends FrameLayout {
    private ColorStateList color = ColorStateList.valueOf(0);

    public CardView(Context context) {
        super(context);
    }

    public ColorStateList getCardBackgroundColor() {
        return color;
    }

    public void setCardBackgroundColor(int value) {
        color = ColorStateList.valueOf(value);
    }
}
