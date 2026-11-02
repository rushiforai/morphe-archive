package app.spicetify.extension.spotify.settings;

import android.graphics.drawable.Drawable;
import android.os.Build;
import android.text.Editable;
import android.text.InputType;
import android.text.TextWatcher;
import android.view.View;
import android.view.ViewGroup;
import android.view.WindowInsets;
import android.view.WindowManager;
import android.widget.BaseAdapter;
import android.widget.CheckBox;
import android.widget.EditText;
import android.widget.LinearLayout;
import android.widget.ListView;
import android.widget.TextView;
import app.spicetify.extension.spotify.extensions.Library;
import app.spicetify.extension.spotify.home.HomePins;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;

/**
 * The Home shortcuts rows of the Home and navigation page: the picker, and Show only my pins. The
 * picker is a sheet listing the pins, Home's tiles and Your Library, which HomePins orders, as
 * checkbox rows, with a search field. It opens with the pins and Home's tiles, and the library joins
 * them once the player bridge reads it. The list makes rows only for what's on screen and reuses
 * them, so a large library and each search stay quick. Picks are kept by uri in the order they were
 * ticked, after the pins in theirs, and a ticked row shows its place, so a search never loses or
 * reorders one. Save pins them in that order.
 */
final class HomePinsSettings {
    private static final String LOADING = "Loading your library";
    private static final String UNAVAILABLE = "Your library isn't available yet";

    private final SpicetifySettingsScreen screen;
    private final List<HomePins.Choice> choices = new ArrayList<>(HomePins.choices());
    private final Set<String> picked = new LinkedHashSet<>();
    /** How many choices have each name, so that a name two share can show each one's uri too. */
    private final Map<String, Integer> named = new HashMap<>();
    private final EditText search;
    private final TextView note;
    private final ListView list;
    private final Rows rows = new Rows();

    static void build(SpicetifySettingsScreen screen, LinearLayout content) {
        SpotifyStyle.actionRow(content, "Pinned Home shortcuts",
                "Choose playlists, albums or Liked Songs to show first on Home, in the order you pick them.",
                view -> new HomePinsSettings(screen).open());
        SpotifyStyle.toggleRow(content, "Show only my pins", "Hide Spotify's other shortcuts on Home.",
                HomePins.onlyPins(), (button, enabled) -> {
                    HomePins.setOnlyPins(enabled);
                    screen.refreshRestartBar();
                });
    }

    private HomePinsSettings(SpicetifySettingsScreen screen) {
        this.screen = screen;
        for (HomePins.Choice choice : choices) if (choice.pinned) picked.add(choice.id);
        search = new EditText(screen);
        search.setSingleLine(true);
        search.setHint("Search");
        search.setInputType(InputType.TYPE_CLASS_TEXT);
        SpotifyStyle.style(search);
        search.setTypeface(SpotifyStyle.font(screen, SpotifyStyle.Font.REGULAR));
        Drawable magnifier = SpotifyStyle.icon(screen, "encore_icon_search_16");
        if (magnifier != null) {
            search.setCompoundDrawablesRelativeWithIntrinsicBounds(magnifier, null, null, null);
            search.setCompoundDrawablePadding(SpotifyStyle.dp(screen, 8));
        }
        search.addTextChangedListener(new TextWatcher() {
            @Override public void beforeTextChanged(CharSequence text, int start, int count, int after) {}
            @Override public void onTextChanged(CharSequence text, int start, int before, int count) { list(); }
            @Override public void afterTextChanged(Editable text) {}
        });
        note = SpotifyStyle.body(screen, LOADING);
        note.setAccessibilityLiveRegion(View.ACCESSIBILITY_LIVE_REGION_POLITE);
        list = new ListView(screen);
        list.setDivider(null);
        // The list keeps each row's tick, and a tap toggles it, so the rows only show it.
        list.setChoiceMode(ListView.CHOICE_MODE_MULTIPLE);
        list.setAdapter(rows);
        list.setOnItemClickListener((parent, view, position, id) -> {
            String choice = rows.getItem(position).id;
            if (list.isItemChecked(position)) picked.add(choice);
            else picked.remove(choice);
            rows.notifyDataSetChanged(); // the places after it change
        });
    }

    /** Shows the picker, then asks for the library. */
    private void open() {
        SpotifySheet sheet = new SpotifySheet(screen, "Pinned Home shortcuts", null)
                .view(search)
                .view(note)
                .view(list)
                .primary("Save", this::save)
                .secondary("Cancel");
        list();
        sheet.create();
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.R) {
            // The sheet sits above the keyboard rather than under it, so the list and Save stay in reach while searching.
            WindowManager.LayoutParams attributes = sheet.getWindow().getAttributes();
            attributes.setFitInsetsTypes(WindowInsets.Type.ime() | WindowInsets.Type.statusBars());
            sheet.getWindow().setAttributes(attributes);
        }
        sheet.show();
        Library.fetch(screen, new Library.Callback() {
            @Override
            public void loaded(List<Library.Item> items) {
                choices.clear();
                choices.addAll(HomePins.choices(items));
                // A Home tile that Home dropped meanwhile can't be pinned, so its pick goes too.
                Set<String> listed = new HashSet<>();
                for (HomePins.Choice choice : choices) listed.add(choice.id);
                picked.retainAll(listed);
                note.setVisibility(View.GONE);
                list();
            }

            @Override
            public void failed(String reason) {
                note.setText(UNAVAILABLE);
            }
        });
    }

    /**
     * Lists the choices whose name has the search in it, each ticked when picked. The list takes half
     * the screen once all the choices would be taller, so the sheet keeps its size while searching,
     * and gives way to the keyboard.
     */
    private void list() {
        named.clear();
        for (HomePins.Choice choice : choices) named.merge(choice.label, 1, Integer::sum);
        String query = search.getText().toString().trim().toLowerCase(Locale.ROOT);
        List<HomePins.Choice> shown = new ArrayList<>();
        for (HomePins.Choice choice : choices) {
            if (choice.label.toLowerCase(Locale.ROOT).contains(query)) shown.add(choice);
        }
        rows.show(shown);
        // The list keeps ticks by position, which a search moves.
        list.clearChoices();
        for (int i = 0; i < shown.size(); i++) if (picked.contains(shown.get(i).id)) list.setItemChecked(i, true);
        int half = Math.round(screen.getResources().getDisplayMetrics().heightPixels * 0.5f);
        LinearLayout.LayoutParams params = (LinearLayout.LayoutParams) list.getLayoutParams();
        params.height = choices.size() * SpotifyStyle.dp(screen, 48) > half ? half : ViewGroup.LayoutParams.WRAP_CONTENT;
        params.weight = 1;
        list.setLayoutParams(params);
    }

    /** Pins the picks in the order they were ticked, and offers a restart. */
    private boolean save() {
        try {
            HomePins.setPinned(new ArrayList<>(picked));
        } catch (IllegalArgumentException refused) {
            note.setText(refused.getMessage());
            note.setVisibility(View.VISIBLE);
            return false;
        }
        PatchSettings.markRestartRequired();
        screen.refreshRestartBar();
        SpotifyRestart.prompt(screen, "Restart Spotify to update Home?");
        return true;
    }

    /** The listed choices as the sheet's checkbox rows. The list asks only for the rows on screen, and reuses them. */
    private final class Rows extends BaseAdapter {
        private List<HomePins.Choice> shown = Collections.emptyList();

        void show(List<HomePins.Choice> choices) {
            shown = choices;
            notifyDataSetChanged();
        }

        @Override public int getCount() { return shown.size(); }
        @Override public HomePins.Choice getItem(int position) { return shown.get(position); }
        @Override public long getItemId(int position) { return position; }

        @Override public View getView(int position, View reusable, ViewGroup parent) {
            CheckBox box = (CheckBox) reusable;
            if (box == null) {
                box = new CheckBox(screen);
                SpotifyStyle.style(box);
                // The list's row takes the tap.
                box.setClickable(false);
                box.setFocusable(false);
            }
            HomePins.Choice choice = shown.get(position);
            String text = named.get(choice.label) > 1 ? choice.label + "\n" + choice.id : choice.label;
            int place = new ArrayList<>(picked).indexOf(choice.id);
            box.setText(place < 0 ? text : (place + 1) + ". " + text);
            return box;
        }
    }
}
