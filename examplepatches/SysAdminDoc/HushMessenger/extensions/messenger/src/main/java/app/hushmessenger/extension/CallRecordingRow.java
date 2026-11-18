package app.hushmessenger.extension;

import android.content.Intent;
import android.net.Uri;
import android.view.View;
import android.widget.Button;
import android.widget.LinearLayout;
import android.widget.RadioButton;
import android.widget.RadioGroup;
import android.widget.TextView;
import android.widget.Toast;
import java.util.ArrayList;
import java.util.List;

/**
 * The rows under Record calls (#193): which calls record themselves, and how long their files are kept. A folder of
 * calls grows on its own and nobody goes back through it, so the keeping offers a week, a month or three months, and
 * the tidy-up runs after the next recording is saved rather than on a timer of its own.
 */
final class CallRecordingRow {
    private final SettingsActivity page;
    private final List<RadioButton> choices = new ArrayList<>();
    private final List<RadioButton> scopes = new ArrayList<>();
    private final List<RadioButton> formats = new ArrayList<>();
    private final List<RadioButton> trackChoices = new ArrayList<>();
    private TextView folder;
    private Button useDefault;

    CallRecordingRow(SettingsActivity page) {
        this.page = page;
    }

    /** Which calls record themselves, with the chosen chats underneath when that's the one picked. */
    void addScopeTo(LinearLayout content) {
        page.ui.add(content, page.ui.text(page.text.get(CallRecordings.SCOPE), 15, page.ui.text, true), 8);
        RadioGroup group = new RadioGroup(page);
        group.setTag("call_recording_scope_choices");
        group.setOrientation(LinearLayout.VERTICAL);
        for (String scope : CallRecordings.SCOPES) {
            RadioButton choice = page.radio(CallRecordings.SCOPE + "_" + scope, page.text.get(CallRecordings.SCOPE + "_" + scope));
            choice.setOnClickListener(clicked -> pickScope(scope));
            group.addView(choice, new RadioGroup.LayoutParams(-1, -2));
            scopes.add(choice);
        }
        page.ui.add(content, group, 4);
        page.ui.add(content, page.ui.text(page.text.get("call_recording_scope_help"), 13, page.ui.muted, false), 8);
        fill();
    }

    /** Where recordings are written: the phone's own Recordings folder, or one the person picks. */
    void addFolderTo(LinearLayout content) {
        page.ui.add(content, page.ui.text(page.text.get(CallRecordings.FOLDER), 15, page.ui.text, true), 8);
        folder = page.ui.text("", 13, page.ui.muted, false);
        folder.setTag("call_recording_folder_name");
        folder.setAccessibilityLiveRegion(View.ACCESSIBILITY_LIVE_REGION_POLITE);
        page.ui.add(content, folder, 4);
        Button choose = page.ui.button(page.text.get("call_recording_folder_choose"));
        choose.setTag("call_recording_folder_choose");
        choose.setOnClickListener(clicked -> pickFolder());
        page.ui.add(content, choose, 8);
        useDefault = page.ui.button(page.text.get("call_recording_folder_reset"));
        useDefault.setTag("call_recording_folder_reset");
        useDefault.setOnClickListener(clicked -> folderChosen(null));
        page.ui.add(content, useDefault, 8);
        page.ui.add(content, page.ui.text(page.text.get("call_recording_folder_help"), 13, page.ui.muted, false), 8);
        fill();
    }

    /** What a recording is written as. Opus is only worth offering on a phone that can encode it. */
    void addFormatTo(LinearLayout content) {
        page.ui.add(content, page.ui.text(page.text.get(CallRecordings.FORMAT), 15, page.ui.text, true), 8);
        RadioGroup group = new RadioGroup(page);
        group.setTag("call_recording_format_choices");
        group.setOrientation(LinearLayout.VERTICAL);
        for (String format : CallRecordings.FORMATS) {
            RadioButton choice = page.radio(CallRecordings.FORMAT + "_" + format,
                page.text.get(CallRecordings.FORMAT + "_" + format));
            choice.setOnClickListener(clicked -> pickFormat(format));
            group.addView(choice, new RadioGroup.LayoutParams(-1, -2));
            formats.add(choice);
        }
        page.ui.add(content, group, 4);
        if (!CallOpus.available()) {
            TextView without = page.ui.text(page.text.get("call_recording_format_unavailable"), 13, page.ui.muted, false);
            without.setTag("call_recording_format_unavailable");
            page.ui.add(content, without, 4);
        }
        page.ui.add(content, page.ui.text(page.text.get("call_recording_format_help"), 13, page.ui.muted, false), 8);
        fill();
    }

    /** Whether the two sides share a track or get one each. */
    void addTracksTo(LinearLayout content) {
        page.ui.add(content, page.ui.text(page.text.get(CallRecordings.TRACKS), 15, page.ui.text, true), 8);
        RadioGroup group = new RadioGroup(page);
        group.setTag("call_recording_tracks_choices");
        group.setOrientation(LinearLayout.VERTICAL);
        for (String tracks : CallRecordings.TRACK_CHOICES) {
            RadioButton choice = page.radio(CallRecordings.TRACKS + "_" + tracks,
                page.text.get(CallRecordings.TRACKS + "_" + tracks));
            choice.setOnClickListener(clicked -> pickTracks(tracks));
            group.addView(choice, new RadioGroup.LayoutParams(-1, -2));
            trackChoices.add(choice);
        }
        page.ui.add(content, group, 4);
        page.ui.add(content, page.ui.text(page.text.get("call_recording_tracks_help"), 13, page.ui.muted, false), 8);
        fill();
    }

    private void pickTracks(String tracks) {
        if (Settings.preferences != null) Settings.preferences.edit().putString(CallRecordings.TRACKS, tracks).apply();
        fill();
        page.feedback(page.text.get("call_recording_tracks_picked",
            page.text.format(CallRecordings.TRACKS + "_" + tracks)), Toast.LENGTH_SHORT);
    }

    private void pickFormat(String format) {
        if (Settings.preferences != null) Settings.preferences.edit().putString(CallRecordings.FORMAT, format).apply();
        fill();
        page.feedback(page.text.get("call_recording_format_picked",
            page.text.format(CallRecordings.FORMAT + "_" + format)), Toast.LENGTH_SHORT);
    }

    private void pickFolder() {
        Intent picker = new Intent(Intent.ACTION_OPEN_DOCUMENT_TREE).addFlags(CallRecordings.FOLDER_ACCESS);
        try {
            page.startActivityForResult(picker, SettingsActivity.PICK_RECORDING_FOLDER);
        } catch (RuntimeException noPicker) {
            page.feedback(page.text.get("call_recording_folder_refused"), Toast.LENGTH_LONG);
        }
    }

    /** Back from the picker, or from Use the default with nothing picked. */
    void folderChosen(Uri tree) {
        if (!CallRecordings.folderChosen(page, tree)) {
            page.feedback(page.text.get("call_recording_folder_refused"), Toast.LENGTH_LONG);
            return;
        }
        fill();
        page.feedback(page.text.get("call_recording_folder_picked", folderLabel()), Toast.LENGTH_SHORT);
    }

    private String folderLabel() {
        String name = CallRecordings.folderName(CallRecordings.folder());
        return name == null ? page.text.format("call_recording_folder_default") : name;
    }

    void addKeepTo(LinearLayout content) {
        page.ui.add(content, page.ui.text(page.text.get("call_recording_keep"), 15, page.ui.text, true), 8);
        RadioGroup group = new RadioGroup(page);
        group.setTag("call_recording_keep_choices");
        group.setOrientation(LinearLayout.VERTICAL);
        for (String days : CallRecordings.KEEP_CHOICES) {
            RadioButton choice = page.radio("call_recording_keep_" + days, label(days));
            choice.setOnClickListener(clicked -> pick(days));
            group.addView(choice, new RadioGroup.LayoutParams(-1, -2));
            choices.add(choice);
        }
        page.ui.add(content, group, 4);
        page.ui.add(content, page.ui.text(page.text.get("call_recording_keep_help"), 13, page.ui.muted, false), 8);
        fill();
    }

    /** Shows what's saved, so coming back to the page or a change made elsewhere reads right. */
    void fill() {
        if (folder != null) {
            folder.setText(folderLabel());
            useDefault.setVisibility(CallRecordings.folder() == null ? View.GONE : View.VISIBLE);
        }
        String now = String.valueOf(CallRecordings.keepDays());
        for (RadioButton choice : choices) choice.setChecked(choice.getTag().equals("call_recording_keep_" + now));
        String scope = CallRecordings.scope();
        for (RadioButton choice : scopes) choice.setChecked(choice.getTag().equals(CallRecordings.SCOPE + "_" + scope));
        String format = CallRecordings.formatPicked();
        for (RadioButton choice : formats) choice.setChecked(choice.getTag().equals(CallRecordings.FORMAT + "_" + format));
        String tracks = CallRecordings.tracksPicked();
        for (RadioButton choice : trackChoices)
            choice.setChecked(choice.getTag().equals(CallRecordings.TRACKS + "_" + tracks));
    }

    private String label(String days) {
        return page.text.get(id(days), days);
    }

    private static String id(String days) {
        return "0".equals(days) ? "call_recording_keep_all" : "call_recording_keep_days";
    }

    private void pick(String days) {
        if (Settings.preferences != null) Settings.preferences.edit().putString(CallRecordings.KEEP, days).apply();
        fill();
        // The label itself goes in untouched, since the toast's own text is what gets turned around for a right to left locale.
        page.feedback(page.text.get("call_recording_keep_picked", page.text.format(id(days), days)), Toast.LENGTH_SHORT);
    }

    private void pickScope(String scope) {
        if (Settings.preferences != null) Settings.preferences.edit().putString(CallRecordings.SCOPE, scope).apply();
        fill();
        page.fillRecordCallers();
        page.feedback(page.text.get("call_recording_scope_picked", page.text.format(CallRecordings.SCOPE + "_" + scope)),
            Toast.LENGTH_SHORT);
    }
}
