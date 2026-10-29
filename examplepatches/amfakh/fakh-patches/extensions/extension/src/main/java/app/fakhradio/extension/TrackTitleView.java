package app.fakhradio.extension;

import android.content.Context;
import android.graphics.Color;
import android.graphics.Typeface;
import android.util.AttributeSet;
import android.util.TypedValue;
import android.view.ViewGroup;
import android.widget.LinearLayout;

/**
 * The player's track line: "Title — Artist" shown as a bold title with the artist on a smaller, dimmer line below.
 * Both lines scroll sideways when they are too long. The artist line is a second text view that this view adds right
 * after itself, since a marquee needs a line of its own.
 */
public class TrackTitleView extends MarqueeLabel {
    private static final String SEPARATOR = " — ";
    private static final String EMPTY_TITLE = "—";

    private MarqueeLabel artistView;
    private String artist = "";

    public TrackTitleView(Context context, AttributeSet attrs) {
        super(context, attrs);
    }

    @Override
    protected void onAttachedToWindow() {
        super.onAttachedToWindow();
        if (artistView == null && getParent() instanceof LinearLayout) {
            LinearLayout parent = (LinearLayout) getParent();
            artistView = new MarqueeLabel(getContext(), null);
            artistView.setTextSize(TypedValue.COMPLEX_UNIT_PX, getTextSize() * 0.7f);
            artistView.setTypeface(Typeface.DEFAULT);
            artistView.setGravity(getGravity());
            artistView.setPadding(getPaddingLeft(), 0, getPaddingRight(), getPaddingBottom());
            int color = getCurrentTextColor();
            artistView.setTextColor(Color.argb(0xB3, Color.red(color), Color.green(color), Color.blue(color)));
            parent.addView(artistView, parent.indexOfChild(this) + 1,
                    new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));
            showArtist();
        }
    }

    @Override
    public void setText(CharSequence text, BufferType type) {
        String value = text == null ? "" : text.toString();
        if (value.equals(EMPTY_TITLE)) {
            // The app shows a dash while it has no track; nothing is better than a stray line.
            setTitleAndArtist("", "");
            return;
        }
        int split = value.indexOf(SEPARATOR);
        if (split > 0) {
            setTitleAndArtist(value.substring(0, split), value.substring(split + SEPARATOR.length()));
        } else {
            setTitleAndArtist(value, "");
        }
    }

    /** Shows [title] on this view and [artist] on the line below it. */
    protected void setTitleAndArtist(String title, String artist) {
        // The player sets the same text over and over while playing; a marquee restarts on every set, so only change it
        // when it is different.
        if (!title.contentEquals(getText())) {
            super.setText(title, BufferType.NORMAL);
            if (marquee != null) {
                marquee.restart();
            }
        }
        if (!artist.equals(this.artist)) {
            this.artist = artist;
        }
        showArtist();
    }

    @Override
    public void setVisibility(int visibility) {
        super.setVisibility(visibility);
        showArtist();
    }

    private void showArtist() {
        if (artistView != null) {
            if (!artist.contentEquals(artistView.getText())) {
                artistView.setText(artist);
                artistView.marquee.restart();
            }
            int visibility = artist.isEmpty() ? GONE : getVisibility();
            if (artistView.getVisibility() != visibility) {
                artistView.setVisibility(visibility);
            }
        }
    }
}
