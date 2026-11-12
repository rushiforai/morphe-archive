package io.github.bryceaspringfield.morphe.extension.youtube;

import android.app.AlertDialog;
import android.content.Context;
import android.graphics.Typeface;
import android.text.InputType;
import android.util.TypedValue;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.AutoCompleteTextView;
import android.widget.Button;
import android.widget.CheckBox;
import android.widget.EditText;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.Spinner;
import android.widget.TextView;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import app.morphe.extension.shared.Logger;

/**
 * The channel filters as a list of channels, each edited with checkboxes, length menus, and word fields, in place of
 * typed rules. The rules stay saved as text in {@link XSettings#CHANNEL_RULES} (one line a channel, read by
 * {@link ChannelRules}), so rules typed before keep working and "Edit as text" still shows them; lines starting with #
 * are kept. The channels of the older "Channels to hide" list join the list as "Every video" at the first save.
 */
@SuppressWarnings("deprecation")
final class ChannelFilterUi {

    /** Length menu choices in seconds (0 is Off). */
    private static final int[] SHORTER = {0, 60, 120, 180, 300, 600, 900, 1200, 1800, 2700, 3600};
    private static final int[] LONGER = {0, 300, 600, 900, 1200, 1800, 2700, 3600, 5400, 7200, 10800};

    private ChannelFilterUi() {
    }

    /** One channel's filters. */
    static final class Entry {
        String channel = "";
        boolean all, live, shorts, playlists;
        int shorter, longer;
        final List<String> words = new ArrayList<>();
        final List<String> comments = new ArrayList<>();
    }

    // ---- The text format.

    static List<Entry> read(String text, List<String> notes) {
        Map<String, Entry> byChannel = new LinkedHashMap<>();
        for (String line : text.split("\n")) if (line.trim().startsWith("#")) notes.add(line.trim());
        for (ChannelRules.Rule r : ChannelRules.parse(text)) {
            String key = r.channel.label().toLowerCase(Locale.ROOT);
            Entry e = byChannel.get(key);
            if (e == null) {
                e = new Entry();
                e.channel = r.channel.label();
                byChannel.put(key, e);
            }
            String kw = r.keyword == null ? null : r.wholeWord ? "\"" + r.keyword + "\"" : r.keyword;
            switch (r.kind) {
                case ALL -> e.all = true;
                case LIVE -> e.live = true;
                case SHORTS -> e.shorts = true;
                case PLAYLISTS -> e.playlists = true;
                case SHORTER -> e.shorter = r.seconds;
                case LONGER -> e.longer = r.seconds;
                case KEYWORD -> e.words.add(kw);
                case COMMENT_KEYWORD -> e.comments.add(kw);
            }
        }
        for (String line : XSettings.HIDDEN_CHANNELS.get().split("[\n,]")) {
            if (line.trim().isEmpty()) continue;
            String label = new ChannelRules.Channel(line).label();
            Entry e = byChannel.get(label.toLowerCase(Locale.ROOT));
            if (e == null) {
                e = new Entry();
                e.channel = label;
                byChannel.put(label.toLowerCase(Locale.ROOT), e);
            }
            e.all = true;
        }
        return new ArrayList<>(byChannel.values());
    }

    static String write(List<Entry> entries, List<String> notes) {
        StringBuilder sb = new StringBuilder();
        for (String n : notes) sb.append(n).append('\n');
        for (Entry e : entries) {
            if (e.channel.trim().isEmpty()) continue;
            List<String> parts = new ArrayList<>();
            if (e.all) {
                parts.add("all");
            } else {
                if (e.live) parts.add("live");
                if (e.shorts) parts.add("shorts");
                if (e.playlists) parts.add("playlists");
                if (e.shorter > 0) parts.add("<" + time(e.shorter));
                if (e.longer > 0) parts.add(">" + time(e.longer));
                parts.addAll(e.words);
            }
            if (!parts.isEmpty()) sb.append(e.channel.trim()).append(": ").append(String.join(", ", parts)).append('\n');
            if (!e.comments.isEmpty()) {
                sb.append(e.channel.trim()).append(": comments: ").append(String.join(", ", e.comments)).append('\n');
            }
        }
        return sb.toString().trim();
    }

    private static String time(int s) {
        return s >= 3600 ? String.format(Locale.ROOT, "%d:%02d:%02d", s / 3600, s / 60 % 60, s % 60)
                : String.format(Locale.ROOT, "%d:%02d", s / 60, s % 60);
    }

    private static String lengthLabel(int s) {
        if (s == 0) return Strings.get("cf_off");
        if (s % 3600 == 0) return s / 3600 + " h";
        if (s >= 3600 && s % 1800 == 0) return String.format(Locale.ROOT, "%.1f h", s / 3600.0);
        return s % 60 == 0 ? s / 60 + " min" : time(s);
    }

    static String summary(Entry e) {
        if (e.all) return Strings.get("cf_all");
        List<String> p = new ArrayList<>();
        if (e.live) p.add(Strings.get("cf_live"));
        if (e.shorts) p.add(Strings.get("cf_shorts"));
        if (e.playlists) p.add(Strings.get("cf_playlists"));
        if (e.shorter > 0) p.add(Strings.get("cf_shorter") + " " + lengthLabel(e.shorter));
        if (e.longer > 0) p.add(Strings.get("cf_longer") + " " + lengthLabel(e.longer));
        if (!e.words.isEmpty()) p.add(Strings.get("cf_words_short") + " " + String.join(", ", e.words));
        if (!e.comments.isEmpty()) p.add(Strings.get("cf_comments_short") + " " + String.join(", ", e.comments));
        return p.isEmpty() ? Strings.get("cf_nothing") : String.join(" · ", p);
    }

    /** The channel's name and handle when a feed showed them, for the list's titles. */
    private static String display(String channel) {
        String c = channel.trim();
        for (String[] s : Channels.seen()) {
            boolean same = (s[0] != null && s[0].equals(c)) || (s[1] != null && c.equalsIgnoreCase("@" + s[1]))
                    || (s[2] != null && c.equalsIgnoreCase(s[2]));
            if (same && s[2] != null && !c.equalsIgnoreCase(s[2])) return s[2] + "  (" + c + ")";
        }
        return c;
    }

    // ---- The dialogs.

    private static int dp(Context ctx, float v) {
        return Math.round(TypedValue.applyDimension(TypedValue.COMPLEX_UNIT_DIP, v, ctx.getResources().getDisplayMetrics()));
    }

    /** The list of channels, with Add channel and Edit as text. */
    static void showList(Context ctx, Runnable onChange) {
        try {
            List<String> notes = new ArrayList<>();
            List<Entry> entries = read(XSettings.CHANNEL_RULES.get(), notes);
            LinearLayout list = new LinearLayout(ctx);
            list.setOrientation(LinearLayout.VERTICAL);
            list.setPadding(dp(ctx, 8), dp(ctx, 8), dp(ctx, 8), dp(ctx, 8));
            ScrollView scroll = new ScrollView(ctx);
            scroll.addView(list);
            AlertDialog dialog = new AlertDialog.Builder(ctx)
                    .setTitle(Strings.get("channel_rules"))
                    .setView(scroll)
                    .setPositiveButton(Strings.get("cf_add"), null)
                    .setNeutralButton(Strings.get("cf_text"), null)
                    .setNegativeButton(Strings.get("cf_close"), null)
                    .create();
            Runnable[] fill = new Runnable[1];
            Runnable save = () -> {
                XSettings.CHANNEL_RULES.save(write(entries, notes));
                if (!XSettings.HIDDEN_CHANNELS.get().isEmpty()) XSettings.HIDDEN_CHANNELS.save("");
                onChange.run();
                fill[0].run();
            };
            fill[0] = () -> {
                list.removeAllViews();
                if (entries.isEmpty()) {
                    TextView empty = new TextView(ctx);
                    empty.setText(Strings.get("cf_empty"));
                    empty.setPadding(dp(ctx, 16), dp(ctx, 12), dp(ctx, 16), dp(ctx, 12));
                    list.addView(empty);
                }
                for (Entry e : entries) {
                    LinearLayout row = new LinearLayout(ctx);
                    row.setOrientation(LinearLayout.VERTICAL);
                    row.setPadding(dp(ctx, 16), dp(ctx, 10), dp(ctx, 16), dp(ctx, 10));
                    TypedValue ripple = new TypedValue();
                    ctx.getTheme().resolveAttribute(android.R.attr.selectableItemBackground, ripple, true);
                    row.setBackgroundResource(ripple.resourceId);
                    TextView title = new TextView(ctx);
                    title.setText(display(e.channel));
                    title.setTypeface(Typeface.DEFAULT_BOLD);
                    title.setTextSize(16);
                    TextView sub = new TextView(ctx);
                    sub.setText(summary(e));
                    sub.setTextSize(13);
                    row.addView(title);
                    row.addView(sub);
                    row.setOnClickListener(v -> showEditor(ctx, e, false, () -> save.run(), () -> {
                        entries.remove(e);
                        save.run();
                    }));
                    list.addView(row);
                }
            };
            fill[0].run();
            dialog.setOnShowListener(d -> {
                dialog.getButton(AlertDialog.BUTTON_POSITIVE).setOnClickListener(v -> {
                    Entry e = new Entry();
                    showEditor(ctx, e, true, () -> {
                        entries.add(e);
                        save.run();
                    }, null);
                });
                dialog.getButton(AlertDialog.BUTTON_NEUTRAL).setOnClickListener(v -> showText(ctx, () -> {
                    entries.clear();
                    notes.clear();
                    entries.addAll(read(XSettings.CHANNEL_RULES.get(), notes));
                    onChange.run();
                    fill[0].run();
                }));
            });
            dialog.show();
        } catch (Throwable t) {
            Logger.printException(() -> "YouTube Extras: channel filter list failed", t);
        }
    }

    /** The rules as text, for typing many at once. */
    private static void showText(Context ctx, Runnable onSaved) {
        EditText edit = new EditText(ctx);
        edit.setText(XSettings.CHANNEL_RULES.get());
        edit.setInputType(InputType.TYPE_CLASS_TEXT | InputType.TYPE_TEXT_FLAG_MULTI_LINE | InputType.TYPE_TEXT_FLAG_NO_SUGGESTIONS);
        edit.setMinLines(6);
        edit.setTextSize(14);
        TextView help = new TextView(ctx);
        help.setText(Strings.get("channel_rules_summary"));
        help.setTextSize(12);
        LinearLayout box = new LinearLayout(ctx);
        box.setOrientation(LinearLayout.VERTICAL);
        box.setPadding(dp(ctx, 20), dp(ctx, 8), dp(ctx, 20), 0);
        box.addView(help);
        box.addView(edit);
        ScrollView scroll = new ScrollView(ctx);
        scroll.addView(box);
        new AlertDialog.Builder(ctx)
                .setTitle(Strings.get("cf_text"))
                .setView(scroll)
                .setPositiveButton(Strings.get("cf_save"), (d, w) -> {
                    XSettings.CHANNEL_RULES.save(edit.getText().toString().trim());
                    onSaved.run();
                })
                .setNegativeButton(Strings.get("cf_cancel"), null)
                .show();
    }

    private static TextView label(Context ctx, String key) {
        TextView t = new TextView(ctx);
        t.setText(Strings.get(key));
        t.setTextSize(14);
        t.setTypeface(Typeface.DEFAULT_BOLD);
        t.setPadding(0, dp(ctx, 14), 0, dp(ctx, 2));
        return t;
    }

    private static Spinner lengthMenu(Context ctx, int[] choices, int current) {
        List<Integer> values = new ArrayList<>();
        for (int c : choices) values.add(c);
        if (current > 0 && !values.contains(current)) {
            values.add(current);
            values.sort(Integer::compare);
        }
        List<String> labels = new ArrayList<>();
        for (int v : values) labels.add(lengthLabel(v));
        Spinner s = new Spinner(ctx);
        ArrayAdapter<String> a = new ArrayAdapter<>(ctx, android.R.layout.simple_spinner_item, labels);
        a.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);
        s.setAdapter(a);
        s.setSelection(values.indexOf(current));
        s.setTag(values);
        return s;
    }

    @SuppressWarnings("unchecked")
    private static int lengthValue(Spinner s) {
        return ((List<Integer>) s.getTag()).get(s.getSelectedItemPosition());
    }

    private static List<String> words(String text) {
        List<String> out = new ArrayList<>();
        for (String w : text.split(",")) if (!w.trim().isEmpty()) out.add(w.trim());
        return out;
    }

    /** One channel's editor: its name with suggestions, what to hide, and Save, Cancel, or Delete. */
    static void showEditor(Context ctx, Entry e, boolean isNew, Runnable onSave, Runnable onDelete) {
        LinearLayout box = new LinearLayout(ctx);
        box.setOrientation(LinearLayout.VERTICAL);
        box.setPadding(dp(ctx, 22), dp(ctx, 4), dp(ctx, 22), dp(ctx, 8));

        box.addView(label(ctx, "cf_channel"));
        AutoCompleteTextView channel = new AutoCompleteTextView(ctx);
        channel.setHint(Strings.get("cf_channel_hint"));
        channel.setSingleLine(true);
        channel.setText(e.channel);
        // Suggestions: the playing video's channel first, then channels the feeds showed, newest first.
        List<String> shown = new ArrayList<>();
        List<String> ids = new ArrayList<>();
        try {
            String name = app.morphe.extension.youtube.patches.VideoInformation.getChannelName();
            String id = app.morphe.extension.youtube.patches.VideoInformation.getChannelId();
            String handle = Channels.handleOf(id);
            if (name != null && !name.isEmpty()) {
                shown.add(name + (handle != null ? "  @" + handle : "") + "  ▶");
                ids.add(handle != null ? "@" + handle : name);
            }
        } catch (Throwable ignored) {
        }
        for (String[] s : Channels.seen()) {
            String id = s[1] != null ? "@" + s[1] : s[2] != null ? s[2] : s[0];
            if (id == null || ids.contains(id)) continue;
            shown.add((s[2] != null ? s[2] : id) + (s[1] != null ? "  @" + s[1] : ""));
            ids.add(id);
        }
        channel.setAdapter(new ArrayAdapter<>(ctx, android.R.layout.simple_dropdown_item_1line, shown));
        channel.setThreshold(1);
        channel.setOnItemClickListener((parent, view, pos, id) -> {
            String picked = (String) parent.getItemAtPosition(pos);
            int i = shown.indexOf(picked);
            if (i >= 0) channel.setText(ids.get(i));
            channel.setSelection(channel.getText().length());
        });
        box.addView(channel);
        if (!shown.isEmpty()) {
            Button pick = new Button(ctx, null, android.R.attr.borderlessButtonStyle);
            pick.setText(Strings.get("cf_pick"));
            pick.setAllCaps(false);
            pick.setOnClickListener(v -> new AlertDialog.Builder(ctx)
                    .setTitle(Strings.get("cf_pick"))
                    .setItems(shown.toArray(new String[0]), (d, w) -> channel.setText(ids.get(w)))
                    .show());
            box.addView(pick, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT));
        }

        box.addView(label(ctx, "cf_hide"));
        CheckBox all = new CheckBox(ctx);
        all.setText(Strings.get("cf_all"));
        all.setChecked(e.all);
        CheckBox live = new CheckBox(ctx);
        live.setText(Strings.get("cf_live"));
        live.setChecked(e.live);
        CheckBox shorts = new CheckBox(ctx);
        shorts.setText(Strings.get("cf_shorts"));
        shorts.setChecked(e.shorts);
        CheckBox playlists = new CheckBox(ctx);
        playlists.setText(Strings.get("cf_playlists"));
        playlists.setChecked(e.playlists);
        box.addView(all);
        box.addView(live);
        box.addView(shorts);
        box.addView(playlists);

        TextView shorterLabel = label(ctx, "cf_shorter_label");
        Spinner shorter = lengthMenu(ctx, SHORTER, e.shorter);
        TextView longerLabel = label(ctx, "cf_longer_label");
        Spinner longer = lengthMenu(ctx, LONGER, e.longer);
        box.addView(shorterLabel);
        box.addView(shorter);
        box.addView(longerLabel);
        box.addView(longer);

        TextView wordsLabel = label(ctx, "cf_words");
        EditText wordsEdit = new EditText(ctx);
        wordsEdit.setHint(Strings.get("cf_words_hint"));
        wordsEdit.setText(String.join(", ", e.words));
        box.addView(wordsLabel);
        box.addView(wordsEdit);

        box.addView(label(ctx, "cf_comments"));
        EditText commentsEdit = new EditText(ctx);
        commentsEdit.setHint(Strings.get("cf_words_hint"));
        commentsEdit.setText(String.join(", ", e.comments));
        box.addView(commentsEdit);

        // "Every video" covers the video options, which grey out while it is checked.
        View[] videoOptions = {live, shorts, playlists, shorterLabel, shorter, longerLabel, longer, wordsLabel, wordsEdit};
        Runnable greyOut = () -> {
            for (View v : videoOptions) {
                v.setEnabled(!all.isChecked());
                v.setAlpha(all.isChecked() ? 0.4f : 1f);
            }
        };
        all.setOnCheckedChangeListener((b, c) -> greyOut.run());
        greyOut.run();

        ScrollView scroll = new ScrollView(ctx);
        scroll.addView(box);
        AlertDialog.Builder b = new AlertDialog.Builder(ctx)
                .setTitle(Strings.get(isNew ? "cf_add" : "cf_edit"))
                .setView(scroll)
                .setPositiveButton(Strings.get("cf_save"), null)
                .setNegativeButton(Strings.get("cf_cancel"), null);
        if (onDelete != null) b.setNeutralButton(Strings.get("cf_delete"), (d, w) -> onDelete.run());
        AlertDialog dialog = b.create();
        dialog.setOnShowListener(d -> dialog.getButton(AlertDialog.BUTTON_POSITIVE).setOnClickListener(v -> {
            String c = channel.getText().toString().trim();
            if (c.isEmpty() || c.contains(":") && !c.contains("youtube.com")) {
                channel.setError(Strings.get("cf_channel_needed"));
                return;
            }
            // A link becomes its @handle or channel ID; a name keeps its case.
            e.channel = new ChannelRules.Channel(c).label();
            e.all = all.isChecked();
            e.live = live.isChecked();
            e.shorts = shorts.isChecked();
            e.playlists = playlists.isChecked();
            e.shorter = lengthValue(shorter);
            e.longer = lengthValue(longer);
            e.words.clear();
            e.words.addAll(words(wordsEdit.getText().toString().replace(":", " ")));
            e.comments.clear();
            e.comments.addAll(words(commentsEdit.getText().toString().replace(":", " ")));
            dialog.dismiss();
            onSave.run();
        }));
        dialog.show();
    }
}
