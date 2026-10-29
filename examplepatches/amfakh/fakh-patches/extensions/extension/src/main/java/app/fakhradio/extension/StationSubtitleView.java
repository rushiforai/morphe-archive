package app.fakhradio.extension;

import android.content.Context;
import android.util.AttributeSet;
import android.widget.ImageView;
import android.widget.TextView;

/**
 * The station subtitle, which the player sets on every metadata update before it loads the track cover. Clearing the
 * cover here means a track with no cover, or the end of a song, does not keep the previous cover on screen.
 */
public class StationSubtitleView extends TextView {
    public StationSubtitleView(Context context, AttributeSet attrs) {
        super(context, attrs);
    }

    @Override
    public void setText(CharSequence text, BufferType type) {
        super.setText(text, type);
        ImageView artwork = Views.image(this, "iv_sp_artwork");
        if (artwork != null) {
            artwork.setImageDrawable(null);
        }
    }
}
