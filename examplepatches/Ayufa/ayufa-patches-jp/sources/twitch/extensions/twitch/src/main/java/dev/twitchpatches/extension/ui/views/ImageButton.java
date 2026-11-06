package dev.twitchpatches.extension.ui.views;

import android.content.Context;
import android.util.AttributeSet;
import dev.twitchpatches.extension.ui.UiViewPolicy;

public final class ImageButton extends android.widget.ImageButton {
    public ImageButton(Context context, AttributeSet attributes) {
        super(context, attributes);
        UiViewPolicy.bind(this);
    }
    @Override public void setVisibility(int visibility) { super.setVisibility(UiViewPolicy.visibility(this, visibility)); }
}
