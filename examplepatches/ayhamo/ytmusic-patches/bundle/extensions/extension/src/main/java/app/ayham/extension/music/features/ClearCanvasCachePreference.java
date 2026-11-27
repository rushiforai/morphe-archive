package app.ayham.extension.music.features;

import android.content.Context;
import android.preference.Preference;
import android.util.AttributeSet;
import android.util.Log;
import android.widget.Toast;

import java.io.File;
import java.util.Locale;

/**
 * The "Clear animated art cache" setting: a row added by our patch to
 * Morphe's own settings screen. Shows the size of the canvas clip cache; a tap deletes it.
 */
@SuppressWarnings("deprecation")
public class ClearCanvasCachePreference extends Preference {
    public ClearCanvasCachePreference(Context context, AttributeSet attrs, int defStyleAttr, int defStyleRes) {
        super(context, attrs, defStyleAttr, defStyleRes);
        init();
    }

    public ClearCanvasCachePreference(Context context, AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
        init();
    }

    public ClearCanvasCachePreference(Context context, AttributeSet attrs) {
        super(context, attrs);
        init();
    }

    public ClearCanvasCachePreference(Context context) {
        super(context);
        init();
    }

    private void init() {
        setTitle("Clear animated art cache");
        refresh();
        Log.i("Ayham", "settings: clear-cache row inflated in Morphe's settings");
    }

    private File dir() {
        return new File(getContext().getCacheDir(), "canvas");
    }

    private void refresh() {
        setSummary(String.format(Locale.ROOT, "%.1f MB (the oldest clips go past 80 MB)", size(dir()) / 1048576.0));
    }

    @Override
    protected void onClick() {
        long freed = size(dir());
        File[] files = dir().listFiles();
        if (files != null) for (File f : files) //noinspection ResultOfMethodCallIgnored
            f.delete();
        refresh();
        Log.i("Ayham", "settings: canvas cache cleared, " + freed + " bytes");
        Toast.makeText(getContext(), String.format(Locale.ROOT, "Freed %.1f MB", freed / 1048576.0), Toast.LENGTH_SHORT).show();
    }

    private static long size(File d) {
        long n = 0;
        File[] files = d.listFiles();
        if (files != null) for (File f : files) n += f.length();
        return n;
    }
}
