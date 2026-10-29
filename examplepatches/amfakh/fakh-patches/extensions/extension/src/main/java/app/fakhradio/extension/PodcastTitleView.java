package app.fakhradio.extension;

import android.content.Context;
import android.util.AttributeSet;
import android.view.View;
import android.view.ViewTreeObserver;
import android.widget.TextView;

/**
 * The episode title and podcast name under the artwork, laid out like a track and its artist. The player keeps them in
 * its header, so while it is in its podcast layout this shows what the header holds and hides the header; otherwise it
 * stays out of the way.
 */
public class PodcastTitleView extends TrackTitleView {
    private final ViewTreeObserver.OnPreDrawListener sync = () -> {
        sync();
        return true;
    };
    private View volume;
    private View header;
    private View trackLine;
    private TextView title;
    private TextView podcast;
    private String shownTitle = "";
    private String shownPodcast = "";

    public PodcastTitleView(Context context, AttributeSet attrs) {
        super(context, attrs);
    }

    @Override
    protected void onAttachedToWindow() {
        super.onAttachedToWindow();
        // The player hides the volume row for podcasts and for nothing else; the progress row comes and goes while playing.
        volume = Views.view(this, "ll_volume_controls");
        header = Views.view(this, "ll_title_subtitle");
        trackLine = Views.view(this, "song_info_wrapper");
        View titleView = Views.view(this, "tv_sp_detail_title");
        View podcastView = Views.view(this, "tv_sp_detail_subtitle");
        title = titleView instanceof TextView ? (TextView) titleView : null;
        podcast = podcastView instanceof TextView ? (TextView) podcastView : null;
        getViewTreeObserver().addOnPreDrawListener(sync);
    }

    @Override
    protected void onDetachedFromWindow() {
        getViewTreeObserver().removeOnPreDrawListener(sync);
        super.onDetachedFromWindow();
    }

    private void sync() {
        boolean podcastLayout = volume != null && volume.getVisibility() == View.GONE;

        int own = podcastLayout ? View.VISIBLE : View.GONE;
        if (getVisibility() != own) {
            setVisibility(own);
        }
        // The track line shows the same episode title; two marquees on top of each other is what it looked like.
        if (podcastLayout && trackLine != null && trackLine.getVisibility() != View.GONE) {
            trackLine.setVisibility(View.GONE);
        }
        if (header != null) {
            int shown = podcastLayout ? View.INVISIBLE : View.VISIBLE;
            if (header.getVisibility() != shown) {
                header.setVisibility(shown);
            }
        }
        if (podcastLayout && title != null && podcast != null) {
            String newTitle = title.getText().toString();
            String newPodcast = podcast.getText().toString();
            // Ignore the header's transient states (empty, or the previous episode while it reloads).
            if (!newTitle.isEmpty() && (!newTitle.equals(shownTitle) || !newPodcast.equals(shownPodcast))) {
                shownTitle = newTitle;
                shownPodcast = newPodcast;
                setTitleAndArtist(newTitle, newPodcast);
            }
        }
    }
}
