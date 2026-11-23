package dev.ytmruskippper.skipper;

import android.text.SpannableStringBuilder;
import android.text.TextUtils;
import android.widget.TextView;

import java.lang.ref.WeakReference;
import java.util.Arrays;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Locale;
import java.util.Map;
import java.util.Set;

/** Formats only the full player's existing artist TextView, on the main thread. */
public final class ArtistFlags {
    private static final Set<String> COUNTRY_CODES = new HashSet<>(Arrays.asList(Locale.getISOCountries()));
    private static final Map<String, String> flags = new HashMap<>();
    private static WeakReference<TextView> artistView = new WeakReference<>(null);
    private static CharSequence original;
    private static String lastRendered;
    private static NotificationTrack current;

    private ArtistFlags() {}

    public static void onArtistTextBound(TextView view) {
        artistView = new WeakReference<>(view);
        original = TextUtils.stringOrSpannedString(view.getText());
        lastRendered = null;
        render();
    }

    static void onTrack(NotificationTrack track) {
        if (current == track) return;
        current = track;
        flags.clear();
        render();
    }

    /** Countries that are not ISO codes, such as MusicBrainz area names, get no flag. */
    static void onCountry(NotificationTrack track, String name, String country) {
        if (track != current || !COUNTRY_CODES.contains(country)) return;
        // A flag emoji is the code's two letters as regional indicator symbols.
        int first = 0x1F1E6 + country.charAt(0) - 'A';
        int second = 0x1F1E6 + country.charAt(1) - 'A';
        flags.put(name, new String(new int[]{first, second}, 0, 2));
        render();
    }

    static void render() {
        TextView view = artistView.get();
        if (view == null || original == null) return;
        CharSequence actual = view.getText();
        // A late lookup can only update the text from the binding we captured.
        if (!TextUtils.equals(actual, lastRendered == null ? original : lastRendered)) return;

        CharSequence result = original;
        if (SkipperSettings.flagsEnabled() && current != null && !flags.isEmpty()
                && TextUtils.equals(original, current.artistCredit)) {
            result = withFlags(original, current);
        }
        if (!TextUtils.equals(actual, result)) view.setText(result);
        lastRendered = TextUtils.equals(result, original) ? null : result.toString();
    }

    /**
     * Inserts each flag after its artist. The displayed credit is the concatenation of the byline
     * runs, so the runs are matched from the end of the text. Returns the text unchanged when it
     * does not line up with the runs. Inserting into the spanned text keeps the artist links.
     */
    private static CharSequence withFlags(CharSequence text, NotificationTrack track) {
        String raw = text.toString();
        int end = raw.length();
        SpannableStringBuilder decorated = new SpannableStringBuilder(text);
        for (int i = track.runs.size() - 1; i >= 0; i--) {
            NotificationTrack.CreditRun run = track.runs.get(i);
            if (run.text == null) return text;
            int start = end - run.text.length();
            if (start < 0 || !raw.startsWith(run.text, start)) return text;
            String flag = run.linked ? flags.get(run.text.trim()) : null;
            if (flag != null) decorated.insert(end, " " + flag);
            end = start;
        }
        return end == 0 ? decorated : text;
    }
}
