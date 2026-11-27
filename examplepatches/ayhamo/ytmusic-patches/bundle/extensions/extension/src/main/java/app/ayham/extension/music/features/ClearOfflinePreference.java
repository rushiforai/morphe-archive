package app.ayham.extension.music.features;

import android.content.Context;
import android.preference.Preference;
import android.util.AttributeSet;
import android.widget.Toast;

import java.util.Locale;

/**
 * The "Clear downloaded lyrics / animated art / canvas" rows of Fork settings: the kind comes from
 * the row's key. Shows the size; a tap deletes that kind for every downloaded song (the songs stay).
 */
@SuppressWarnings("deprecation")
public class ClearOfflinePreference extends Preference {
    public ClearOfflinePreference(Context context, AttributeSet attrs, int defStyleAttr, int defStyleRes) {
        super(context, attrs, defStyleAttr, defStyleRes);
    }

    public ClearOfflinePreference(Context context, AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
    }

    public ClearOfflinePreference(Context context, AttributeSet attrs) {
        super(context, attrs);
    }

    public ClearOfflinePreference(Context context) {
        super(context);
    }

    private String kind() {
        String k = getKey() == null ? "" : getKey();
        return k.endsWith("lyrics") ? OfflineIndex.LYRICS : k.endsWith("art") ? OfflineIndex.ART : OfflineIndex.CANVAS;
    }

    private String name() {
        String k = kind();
        return k.equals(OfflineIndex.LYRICS) ? "lyrics" : k.equals(OfflineIndex.ART) ? "animated art" : "canvas";
    }

    @Override
    protected void onAttachedToActivity() {
        super.onAttachedToActivity();
        setTitle("Clear downloaded " + name());
        refresh();
    }

    private void refresh() {
        setSummary(String.format(Locale.ROOT, "%.1f MB saved with downloaded songs", OfflineIndex.size(getContext(), kind()) / 1048576.0));
    }

    @Override
    protected void onClick() {
        long freed = OfflineIndex.clear(getContext(), kind());
        refresh();
        Toast.makeText(getContext(), String.format(Locale.ROOT, "Freed %.1f MB", freed / 1048576.0), Toast.LENGTH_SHORT).show();
    }
}
