package app.ayham.extension.music.automix;

import android.content.Context;
import android.preference.Preference;
import android.util.AttributeSet;
import android.widget.Toast;

import java.util.Locale;

/** The settings' "Saved song analyses": how many, and a tap clears them (the extension's Clear). */
@SuppressWarnings("deprecation")
public class AnalysedSongsPreference extends Preference {
    public AnalysedSongsPreference(Context context, AttributeSet attrs, int defStyleAttr, int defStyleRes) {
        super(context, attrs, defStyleAttr, defStyleRes);
        refresh();
    }

    public AnalysedSongsPreference(Context context, AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
        refresh();
    }

    public AnalysedSongsPreference(Context context, AttributeSet attrs) {
        super(context, attrs);
        refresh();
    }

    public AnalysedSongsPreference(Context context) {
        super(context);
        refresh();
    }

    private void refresh() {
        long[] s = Analyzer.saved(getContext());
        setTitle("Saved song analyses");
        setSummary(String.format(Locale.US, "%d %s (%.1f MB). Each analysed song is kept so it is never analysed twice; "
                + "tap to clear, songs are analysed again as they play.", s[0], s[0] == 1 ? "song" : "songs", s[1] / 1048576.0));
    }

    @Override
    protected void onClick() {
        long[] s = Analyzer.saved(getContext());
        Analyzer.clear(getContext());
        refresh();
        Toast.makeText(getContext(), String.format(Locale.US, "Cleared %d saved analyses", s[0]), Toast.LENGTH_SHORT).show();
    }
}
