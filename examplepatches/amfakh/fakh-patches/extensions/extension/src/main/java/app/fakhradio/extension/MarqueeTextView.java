package app.fakhradio.extension;

import android.content.Context;
import android.text.TextUtils;
import android.util.AttributeSet;

/**
 * A single line that scrolls sideways when it is too long. The player sets the same text again and again while
 * playing, so an unchanged text is ignored.
 */
public class MarqueeTextView extends MarqueeLabel {

    public MarqueeTextView(Context context, AttributeSet attrs) {
        super(context, attrs);
    }

    @Override
    public void setText(CharSequence text, BufferType type) {
        if (!TextUtils.equals(getText(), text)) {
            super.setText(text, type);
            if (marquee != null) {
                marquee.restart();
            }
        }
    }
}
