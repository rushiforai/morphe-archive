package app.morphe.extension.syncforreddit.translate;

import android.content.Context;
import android.widget.ImageView;

import com.laurencedawson.reddit_sync.ui.views.buttons.AbstractRedditButton;

import app.morphe.extension.shared.ResourceType;
import app.morphe.extension.shared.ResourceUtils;

/**
 * The button for translating, in the row that appears under a comment.
 *
 * <p>One of the app's own buttons rather than something that merely sits among them: it gives
 * itself its background, its picture and its colour where each of the others does, so it is
 * themed with them and changes when they change.
 *
 * @noinspection unused
 */
public class TranslateButton extends AbstractRedditButton {
    /** What Sync's own settings row for translating is drawn with. */
    private static final String THE_PICTURE = "outline_translate_24";

    public TranslateButton(Context context) {
        super(context, null);
        c();
    }

    @Override
    protected void c() {
        super.c();
        setImageResource(ResourceUtils.getIdentifier(ResourceType.DRAWABLE, THE_PICTURE));
        setScaleType(ImageView.ScaleType.CENTER_INSIDE);
        setColorFilter(k9.a.a(a()));
    }
}
