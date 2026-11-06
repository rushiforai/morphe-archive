package dev.twitchpatches.extension.ui.views;

import android.content.Context;
import android.util.AttributeSet;
import dev.twitchpatches.extension.ui.UiViewPolicy;

// The patch binds the superclass and super calls to Twitch's ComposeView.
public final class ComposeView extends android.widget.FrameLayout {
    public ComposeView(Context context, AttributeSet attributes) {
        super(context, attributes);
        UiViewPolicy.bind(this);
    }
    @Override public void setVisibility(int visibility) { super.setVisibility(UiViewPolicy.visibility(this, visibility)); }
}
