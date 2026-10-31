package androidx.appcompat.widget;

import android.content.Context;
import android.util.AttributeSet;
import android.widget.ImageButton;

/**
 * Only named so that the app's own button can be subclassed. The app carries the real one.
 *
 * <p>Compile only.
 */
public class AppCompatImageButton extends ImageButton {
    public AppCompatImageButton(Context context, AttributeSet attributes) {
        super(context, attributes);
    }
}
