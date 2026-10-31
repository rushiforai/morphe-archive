package com.feurstagram.extension;

import android.content.Context;
import android.graphics.drawable.Drawable;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewTreeObserver;
import android.widget.ImageView;
import android.widget.TextView;

import org.xmlpull.v1.XmlPullParser;
import org.xmlpull.v1.XmlPullParserFactory;

import java.io.StringReader;

/**
 * Repurposes the Home tab as a stories-only tab: the tab is shown, relabelled to
 * "Stories" and its home glyph swapped for a stories ring. The feed stays blocked
 * (block_feed), so tapping it lands on the stories tray above an empty timeline -
 * stories without the recommendation feed.
 *
 * Off by default; turned on with the "Stories tab" switch. Every pass re-applies the
 * decoration because Instagram re-binds the tab views on resume and paints its own
 * label and icon back over ours.
 */
public final class StoriesTab implements ViewTreeObserver.OnGlobalLayoutListener {

    private static final String LABEL = "Stories";

    /**
     * A stories ring: an even-odd ring plus a filled avatar dot. White, so the tab's
     * own image tint decides the colour like it does for every other nav icon.
     */
    private static final String ICON_XML =
            "<vector xmlns:android=\"http://schemas.android.com/apk/res/android\""
                    + " android:width=\"24dp\" android:height=\"24dp\""
                    + " android:viewportWidth=\"24\" android:viewportHeight=\"24\">"
                    + "<path android:fillColor=\"#FFFFFFFF\" android:fillType=\"evenOdd\""
                    + " android:pathData=\"M12,2 A10,10 0 1,1 11.99,2 Z M12,4.6 A7.4,7.4 0 1,0 12.01,4.6 Z\"/>"
                    + "<path android:fillColor=\"#FFFFFFFF\""
                    + " android:pathData=\"M12,8.5 A3.5,3.5 0 1,1 11.99,8.5 Z\"/>"
                    + "</vector>";

    private final ViewGroup root;
    private Drawable icon;
    private boolean iconResolved;

    public StoriesTab(ViewGroup root) {
        this.root = root;
    }

    @Override
    public void onGlobalLayout() {
        Context context = root.getContext();
        if (context == null) return;
        View searchRoot = root.getRootView();
        if (searchRoot == null) searchRoot = root;

        int id = Hiders.resolveId(context, "feed_tab");
        if (id == 0) return; // resource table not ready yet
        View tab = searchRoot.findViewById(id);
        if (tab == null) return;

        boolean enabled = Config.isStoriesTabEnabled();
        tab.setVisibility(enabled ? View.VISIBLE : View.GONE);
        if (!enabled) return;
        try {
            decorate(context, tab);
        } catch (Throwable t) {
            // This runs inside Instagram's layout pass: a throw here kills the app, so
            // an undecorated tab is always better than a crash.
        }
    }

    private void decorate(Context context, View view) {
        if (view instanceof TextView) {
            TextView text = (TextView) view;
            CharSequence current = text.getText();
            // getText()/getContentDescription() can both be null; contentEquals(null)
            // throws, which took the whole tab bar down (NPE in dispatchOnGlobalLayout).
            if (current == null || !LABEL.contentEquals(current)) text.setText(LABEL);
        } else if (view instanceof ImageView) {
            ImageView image = (ImageView) view;
            Drawable ring = icon(context);
            if (ring != null && image.getDrawable() != ring) image.setImageDrawable(ring);
        } else {
            CharSequence description = view.getContentDescription();
            if (description == null || !LABEL.contentEquals(description)) {
                view.setContentDescription(LABEL);
            }
        }

        if (view instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) view;
            for (int i = 0; i < group.getChildCount(); i++) {
                decorate(context, group.getChildAt(i));
            }
        }
    }

    /** Inflates the ring once; null when the platform refuses the vector XML. */
    private Drawable icon(Context context) {
        if (iconResolved) return icon;
        iconResolved = true;
        try {
            XmlPullParserFactory factory = XmlPullParserFactory.newInstance();
            XmlPullParser parser = factory.newPullParser();
            parser.setInput(new StringReader(ICON_XML));
            icon = Drawable.createFromXml(context.getResources(), parser);
        } catch (Throwable t) {
            icon = null; // keep Instagram's glyph rather than showing nothing
        }
        return icon;
    }
}
