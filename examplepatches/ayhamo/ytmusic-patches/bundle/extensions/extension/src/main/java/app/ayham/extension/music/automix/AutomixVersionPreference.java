package app.ayham.extension.music.automix;

import android.content.Context;
import android.preference.ListPreference;
import android.preference.Preference;
import android.util.AttributeSet;

/**
 * The settings' Automix lists, as in the extension's popup. "Automix version" (Classic / Automix v2
 * (test); Original is retired and a saved 1 shows as Classic): the key-clash toggle is Classic's own,
 * so it is greyed out (its setting kept) under Automix v2, which always checks keys. "Blend length"
 * (Auto / Up to N bars). The entries are set here, by key.
 */
@SuppressWarnings("deprecation")
public class AutomixVersionPreference extends ListPreference {
    public AutomixVersionPreference(Context context, AttributeSet attrs, int defStyleAttr, int defStyleRes) {
        super(context, attrs, defStyleAttr, defStyleRes);
        entries(attrs);
    }

    public AutomixVersionPreference(Context context, AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
        entries(attrs);
    }

    public AutomixVersionPreference(Context context, AttributeSet attrs) {
        super(context, attrs);
        entries(attrs);
    }

    public AutomixVersionPreference(Context context) {
        super(context);
        entries(null);
    }

    private void entries(AttributeSet attrs) {
        String key = attrs == null ? null : attrs.getAttributeValue("http://schemas.android.com/apk/res/android", "key");
        if ("ayham_eq_preset".equals(key)) {
            setEntries(new CharSequence[]{"Bass Boost", "Clear Vocals", "Night Mode", "Room", "Flat"});
            setEntryValues(new CharSequence[]{"bass", "vocals", "night", "room", "flat"});
        } else if (app.ayham.extension.music.addons.AddonSettings.KEY_SLACK.equals(key)) {
            setEntries(new CharSequence[]{"Exact length only", "Up to 2 s apart", "Up to 5 s apart (default)", "Up to 10 s apart"});
            setEntryValues(new CharSequence[]{"0", "2", "5", "10"});
        } else if (app.ayham.extension.music.features.CanvasSettings.KEY_APPLE_QUALITY.equals(key)
                || "ayham_artist_video_quality".equals(key)) {
            setEntries(new CharSequence[]{"360p", "720p (default)", "1080p", "Original"});
            setEntryValues(new CharSequence[]{"360", "720", "1080", "orig"});
        } else if ("ayham_artist_videos".equals(key)) {
            setEntries(new CharSequence[]{"Follow Artist images (default)", "On: the artist's moving picture, muted", "Off"});
            setEntryValues(new CharSequence[]{"follow", "on", "off"});
        } else if (app.ayham.extension.music.features.CanvasSettings.KEY_YT_QUALITY.equals(key)) {
            setEntries(new CharSequence[]{"Auto (sized for the art)", "2160p", "1440p", "1080p", "720p", "480p (default)"});
            setEntryValues(new CharSequence[]{"auto", "2160", "1440", "1080", "720", "480"});
        } else if (app.ayham.extension.music.features.CanvasSettings.KEY_YT_MODE.equals(key)) {
            setEntries(new CharSequence[]{"Clips (the song's best part, looped)", "Full video (the whole music video, muted)"});
            setEntryValues(new CharSequence[]{"clips", "full"});
        } else if (Automix.KEY_BARS.equals(key)) {
            setEntries(new CharSequence[]{"Auto (picks per song, like BitChord phone)", "Up to 4 bars", "Up to 8 bars",
                    "Up to 16 bars (BitChord web default)", "Up to 32 bars"});
            setEntryValues(new CharSequence[]{"auto", "4", "8", "16", "32"});
        } else {
            setEntries(new CharSequence[]{"Classic", "Automix v2 (test)"});
            setEntryValues(new CharSequence[]{"2", "3"});
        }
    }

    /**
     * The choices drawn in the dialog's own text colour: YT's theme gives list items a dark colour,
     * which on the dark dialog left every row blank but the highlighted one.
     */
    @Override
    protected void onPrepareDialogBuilder(android.app.AlertDialog.Builder builder) {
        super.onPrepareDialogBuilder(builder);
        CharSequence[] entries = getEntries(), values = getEntryValues();
        if (entries == null || values == null) return;
        Context c = builder.getContext();
        android.content.res.TypedArray ta = c.obtainStyledAttributes(new int[]{android.R.attr.textColorPrimary});
        final int color = ta.getColor(0, 0xFFFFFFFF);
        ta.recycle();
        android.widget.ArrayAdapter<CharSequence> items = new android.widget.ArrayAdapter<CharSequence>(
                c, android.R.layout.select_dialog_singlechoice, android.R.id.text1, entries) {
            @Override
            public android.view.View getView(int position, android.view.View convert, android.view.ViewGroup parent) {
                android.view.View v = super.getView(position, convert, parent);
                if (v instanceof android.widget.TextView) {
                    ((android.widget.TextView) v).setTextColor(color);
                    ((android.widget.TextView) v).setTextSize(android.util.TypedValue.COMPLEX_UNIT_SP, 16);
                }
                return v;
            }
        };
        builder.setSingleChoiceItems(items, findIndexOfValue(getValue()), (dialog, which) -> {
            String value = values[which].toString();
            if (callChangeListener(value)) setValue(value);
            dialog.dismiss();
        });
        builder.setPositiveButton(null, null);
    }

    @Override
    protected void onAttachedToActivity() {
        super.onAttachedToActivity();
        keyAware(getValue());
    }

    @Override
    public void setValue(String value) {
        // Original (1) is retired: a saved 1 is Classic
        if (Automix.KEY_VERSION.equals(getKey()) && !"3".equals(value)) value = "2";
        super.setValue(value);
        keyAware(value);
    }

    private void keyAware(String value) {
        if (!Automix.KEY_VERSION.equals(getKey())) return;
        try {
            if (getPreferenceManager() == null) return;
            Preference p = getPreferenceManager().findPreference(Automix.KEY_KEY_AWARE);
            if (p != null) p.setEnabled(!"3".equals(value));
        } catch (Throwable ignored) {
        }
    }
}
