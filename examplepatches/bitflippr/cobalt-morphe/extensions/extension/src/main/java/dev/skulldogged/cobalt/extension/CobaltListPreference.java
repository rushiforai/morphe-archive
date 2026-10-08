package dev.skulldogged.cobalt.extension;

import android.content.Context;
import android.preference.ListPreference;
import android.util.AttributeSet;

@SuppressWarnings("deprecation")
public final class CobaltListPreference extends ListPreference {
    private static final String ANDROID_NAMESPACE =
            "http://schemas.android.com/apk/res/android";

    public CobaltListPreference(Context context, AttributeSet attributes) {
        super(context, attributes);

        String key = attributes.getAttributeValue(ANDROID_NAMESPACE, "key");
        if ("cobalt_download_mode".equals(key)) {
            setEntries(new CharSequence[] {"Video", "Audio only (MP3)"});
            setEntryValues(new CharSequence[] {"auto", "audio"});
        } else if ("cobalt_video_quality".equals(key)) {
            setEntries(new CharSequence[] {
                    "Maximum available", "8K", "4K", "1440p", "1080p",
                    "720p", "480p", "360p", "240p", "144p"
            });
            setEntryValues(new CharSequence[] {
                    "max", "4320", "2160", "1440", "1080",
                    "720", "480", "360", "240", "144"
            });
        } else if ("cobalt_video_codec".equals(key)) {
            setEntries(new CharSequence[] {"AV1", "VP9", "H.264 (best compatibility)"});
            setEntryValues(new CharSequence[] {"av1", "vp9", "h264"});
        } else if ("cobalt_filename_style".equals(key)) {
            setEntries(new CharSequence[] {"Pretty", "Classic", "Basic", "Nerdy"});
            setEntryValues(new CharSequence[] {"pretty", "classic", "basic", "nerdy"});
        } else {
            throw new IllegalArgumentException("Unsupported cobalt list preference: " + key);
        }
    }

    @Override
    public CharSequence getSummary() {
        CharSequence entry = getEntry();
        return entry == null ? "Not set" : entry;
    }
}
