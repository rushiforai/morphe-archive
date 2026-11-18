package app.mypois.extension;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.ActivityNotFoundException;
import android.content.DialogInterface;
import android.content.Intent;
import android.graphics.Color;
import android.net.Uri;
import android.os.Bundle;
import android.text.Editable;
import android.text.InputType;
import android.text.TextWatcher;
import android.util.Log;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.Button;
import android.widget.EditText;
import android.widget.LinearLayout;
import android.widget.ListView;
import android.widget.ScrollView;
import android.widget.TextView;
import android.widget.Toast;

import java.io.PrintWriter;
import java.io.StringWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * "My POIs": named folders of saved places, kept separate from TomTom's "My Places".
 * Built from plain views so it needs no resources of its own.
 */
public class MyPoisActivity extends Activity {

    private static final String TAG = "MyPois";

    public static final String ACTION_ADD = "app.mypois.ADD";
    public static final String EXTRA_NAME = "name";
    public static final String EXTRA_LAT = "lat";
    public static final String EXTRA_LON = "lon";

    private static final int BG = Color.parseColor("#14181F");
    private static final int BAR = Color.parseColor("#1D232D");
    private static final int TEXT = Color.WHITE;
    private static final int SUBTEXT = Color.parseColor("#9AA5B4");
    private static final int ACCENT = Color.parseColor("#2F80ED");

    private LinearLayout page;
    private TextView titleView;
    private LinearLayout body;

    /** Folder being shown, or null for the folder list. */
    private String openFolder;
    private boolean addMode;
    private PoiStore.Place pendingPlace;

    // ---- Lifecycle ---------------------------------------------------------------------------

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        Log.i(TAG, "onCreate");
        try {
            buildFrame();

            Intent intent = getIntent();
            if (intent != null && ACTION_ADD.equals(intent.getAction())) {
                addMode = true;
                pendingPlace = new PoiStore.Place(
                        intent.getStringExtra(EXTRA_NAME) == null ? "" : intent.getStringExtra(EXTRA_NAME),
                        intent.getDoubleExtra(EXTRA_LAT, 0), intent.getDoubleExtra(EXTRA_LON, 0));
                showAddFlow();
            } else {
                showFolders();
            }
        } catch (Throwable t) {
            // Show the problem instead of taking the whole navigation app down with it.
            Log.e(TAG, "onCreate failed", t);
            showError(t);
        }
    }

    private void showError(Throwable t) {
        StringWriter trace = new StringWriter();
        t.printStackTrace(new PrintWriter(trace));
        TextView text = new TextView(this);
        text.setText("My POIs failed to start:\n\n" + trace);
        text.setTextColor(Color.WHITE);
        text.setPadding(dp(16), dp(48), dp(16), dp(16));
        ScrollView scroll = new ScrollView(this);
        scroll.setBackgroundColor(BG);
        scroll.addView(text);
        setContentView(scroll);
    }

    @Override
    public void onBackPressed() {
        if (!addMode && openFolder != null) {
            showFolders();
        } else {
            super.onBackPressed();
        }
    }

    // ---- Frame -------------------------------------------------------------------------------

    private void buildFrame() {
        page = new LinearLayout(this);
        page.setOrientation(LinearLayout.VERTICAL);
        page.setBackgroundColor(BG);
        page.setOnApplyWindowInsetsListener((v, insets) -> {
            v.setPadding(insets.getSystemWindowInsetLeft(), insets.getSystemWindowInsetTop(),
                    insets.getSystemWindowInsetRight(), insets.getSystemWindowInsetBottom());
            return insets.consumeSystemWindowInsets();
        });

        LinearLayout bar = new LinearLayout(this);
        bar.setOrientation(LinearLayout.HORIZONTAL);
        bar.setGravity(Gravity.CENTER_VERTICAL);
        bar.setBackgroundColor(BAR);
        bar.setPadding(dp(8), dp(4), dp(16), dp(4));

        Button back = flatButton("←");
        back.setTextSize(TypedValue.COMPLEX_UNIT_SP, 24);
        back.setOnClickListener(v -> onBackPressed());
        bar.addView(back, new LinearLayout.LayoutParams(dp(56), dp(56)));

        titleView = new TextView(this);
        titleView.setTextColor(TEXT);
        titleView.setTextSize(TypedValue.COMPLEX_UNIT_SP, 20);
        titleView.setSingleLine(true);
        bar.addView(titleView, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));

        page.addView(bar, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));

        body = new LinearLayout(this);
        body.setOrientation(LinearLayout.VERTICAL);
        page.addView(body, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, 0, 1f));

        setContentView(page);
    }

    private void setPage(String title) {
        titleView.setText(title);
        body.removeAllViews();
    }

    // ---- Folder list -------------------------------------------------------------------------

    private void showFolders() {
        openFolder = null;
        setPage("My POIs");

        final List<PoiStore.Folder> folders = PoiStore.load(this);
        if (folders.isEmpty()) {
            body.addView(message("No folders yet.\nCreate one, then add places from My Places or from the map."),
                    new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, 0, 1f));
        } else {
            List<Row> rows = new ArrayList<>();
            for (PoiStore.Folder folder : folders) {
                rows.add(new Row(folder.name, count(folder.places.size())));
            }
            ListView list = listView(rows);
            list.setOnItemClickListener((p, v, position, id) -> showFolder(folders.get(position).name));
            list.setOnItemLongClickListener((p, v, position, id) -> {
                folderMenu(folders.get(position));
                return true;
            });
            body.addView(list, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, 0, 1f));
        }

        Button add = primaryButton("New folder");
        add.setOnClickListener(v -> promptText("New folder", "Folder name", "", name -> {
            if (PoiStore.find(PoiStore.load(this), name) != null) {
                toast("A folder with that name already exists");
                return;
            }
            List<PoiStore.Folder> all = PoiStore.load(this);
            all.add(new PoiStore.Folder(name));
            PoiStore.save(this, all);
            showFolder(name);
        }));
        body.addView(add, buttonParams());
    }

    private void folderMenu(final PoiStore.Folder folder) {
        new AlertDialog.Builder(this, android.R.style.Theme_DeviceDefault_Dialog_Alert)
                .setTitle(folder.name)
                .setItems(new CharSequence[]{"Rename", "Delete folder"}, (d, which) -> {
                    if (which == 0) {
                        promptText("Rename folder", "Folder name", folder.name, name -> {
                            List<PoiStore.Folder> all = PoiStore.load(this);
                            PoiStore.Folder other = PoiStore.find(all, name);
                            PoiStore.Folder target = PoiStore.find(all, folder.name);
                            if (target == null) return;
                            if (other != null && other != target) {
                                toast("A folder with that name already exists");
                                return;
                            }
                            target.name = name;
                            PoiStore.save(this, all);
                            showFolders();
                        });
                    } else {
                        new AlertDialog.Builder(this, android.R.style.Theme_DeviceDefault_Dialog_Alert)
                                .setTitle("Delete \"" + folder.name + "\"?")
                                .setMessage("This removes the folder and the " + count(folder.places.size())
                                        + " saved in it. My Places is not affected.")
                                .setNegativeButton("Cancel", null)
                                .setPositiveButton("Delete", (d2, w) -> {
                                    List<PoiStore.Folder> all = PoiStore.load(this);
                                    PoiStore.Folder target = PoiStore.find(all, folder.name);
                                    if (target != null) all.remove(target);
                                    PoiStore.save(this, all);
                                    showFolders();
                                }).show();
                    }
                }).show();
    }

    // ---- Folder contents ---------------------------------------------------------------------

    private void showFolder(final String folderName) {
        openFolder = folderName;
        setPage(folderName);

        PoiStore.Folder folder = PoiStore.find(PoiStore.load(this), folderName);
        if (folder == null) {
            showFolders();
            return;
        }
        final List<PoiStore.Place> all = new ArrayList<>(folder.places);
        PoiStore.sortPlaces(all);
        final List<PoiStore.Place> shown = new ArrayList<>(all);

        final EditText filter = new EditText(this);
        styleInput(filter, "Search this folder");
        if (all.size() > 6) {
            body.addView(filter, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));
        }

        final List<Row> rows = new ArrayList<>();
        final ListView list;
        if (all.isEmpty()) {
            body.addView(message("This folder is empty.\nAdd places from My Places, or use \"Add to My POIs\" on a point on the map."),
                    new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, 0, 1f));
            list = null;
        } else {
            fillRows(rows, shown);
            list = listView(rows);
            list.setOnItemClickListener((p, v, position, id) -> navigate(shown.get(position)));
            list.setOnItemLongClickListener((p, v, position, id) -> {
                placeMenu(folderName, shown.get(position));
                return true;
            });
            body.addView(list, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, 0, 1f));

            filter.addTextChangedListener(new SimpleWatcher() {
                @Override
                public void afterTextChanged(Editable s) {
                    String q = s.toString().trim().toLowerCase(Locale.ROOT);
                    shown.clear();
                    for (PoiStore.Place place : all) {
                        if (q.isEmpty() || place.name.toLowerCase(Locale.ROOT).contains(q)) shown.add(place);
                    }
                    fillRows(rows, shown);
                    ((BaseAdapter) list.getAdapter()).notifyDataSetChanged();
                }
            });
        }

        LinearLayout buttons = new LinearLayout(this);
        buttons.setOrientation(LinearLayout.HORIZONTAL);
        Button fromMyPlaces = primaryButton("Add from My Places");
        fromMyPlaces.setOnClickListener(v -> pickFromMyPlaces(folderName));
        Button fromCoords = secondaryButton("Add by coordinates");
        fromCoords.setOnClickListener(v -> addByCoordinates(folderName));
        buttons.addView(fromMyPlaces, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));
        buttons.addView(fromCoords, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));
        LinearLayout.LayoutParams bp = new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        bp.setMargins(dp(8), dp(4), dp(8), dp(8));
        body.addView(buttons, bp);
    }

    private void fillRows(List<Row> rows, List<PoiStore.Place> places) {
        rows.clear();
        for (PoiStore.Place place : places) {
            rows.add(new Row(place.name, String.format(Locale.US, "%.5f, %.5f", place.lat, place.lon)));
        }
    }

    private void placeMenu(final String folderName, final PoiStore.Place place) {
        new AlertDialog.Builder(this, android.R.style.Theme_DeviceDefault_Dialog_Alert)
                .setTitle(place.name)
                .setItems(new CharSequence[]{"Navigate", "Rename", "Copy to another folder", "Move to another folder", "Remove from folder"},
                        (d, which) -> {
                            switch (which) {
                                case 0:
                                    navigate(place);
                                    break;
                                case 1:
                                    promptText("Rename place", "Name", place.name, name -> {
                                        mutateFolder(folderName, f -> {
                                            for (int i = 0; i < f.places.size(); i++) {
                                                if (f.places.get(i).sameSpot(place)) {
                                                    f.places.set(i, new PoiStore.Place(name, place.lat, place.lon));
                                                    break;
                                                }
                                            }
                                        });
                                        showFolder(folderName);
                                    });
                                    break;
                                case 2:
                                    chooseFolder(folderName, target -> {
                                        boolean added = PoiStore.addPlace(this, target, place);
                                        toast(added ? "Copied to " + target : "Already in " + target);
                                    });
                                    break;
                                case 3:
                                    chooseFolder(folderName, target -> {
                                        PoiStore.addPlace(this, target, place);
                                        removeFrom(folderName, place);
                                        toast("Moved to " + target);
                                        showFolder(folderName);
                                    });
                                    break;
                                default:
                                    removeFrom(folderName, place);
                                    showFolder(folderName);
                            }
                        }).show();
    }

    private void removeFrom(String folderName, final PoiStore.Place place) {
        mutateFolder(folderName, f -> {
            for (int i = 0; i < f.places.size(); i++) {
                if (f.places.get(i).sameSpot(place)) {
                    f.places.remove(i);
                    break;
                }
            }
        });
    }

    private interface FolderEdit {
        void apply(PoiStore.Folder folder);
    }

    private void mutateFolder(String folderName, FolderEdit edit) {
        List<PoiStore.Folder> all = PoiStore.load(this);
        PoiStore.Folder folder = PoiStore.find(all, folderName);
        if (folder == null) return;
        edit.apply(folder);
        PoiStore.save(this, all);
    }

    // ---- Adding places -----------------------------------------------------------------------

    private void pickFromMyPlaces(final String folderName) {
        PoiStore.Folder folder = PoiStore.find(PoiStore.load(this), folderName);
        if (folder == null) return;

        final List<PoiStore.Place> candidates = new ArrayList<>();
        for (PoiStore.Place place : PoiStore.loadMyPlacesCache(this)) {
            boolean already = false;
            for (PoiStore.Place existing : folder.places) {
                if (existing.sameSpot(place)) {
                    already = true;
                    break;
                }
            }
            if (!already) candidates.add(place);
        }

        if (candidates.isEmpty()) {
            new AlertDialog.Builder(this, android.R.style.Theme_DeviceDefault_Dialog_Alert)
                    .setTitle("Add from My Places")
                    .setMessage("No places to add yet.\n\nOpen My Places in the app once so it can be read, "
                            + "then come back here. (Places already in this folder are not listed.)")
                    .setPositiveButton("OK", null).show();
            return;
        }

        final List<PoiStore.Place> shown = new ArrayList<>(candidates);
        final List<Row> rows = new ArrayList<>();
        fillRows(rows, shown);

        LinearLayout content = new LinearLayout(this);
        content.setOrientation(LinearLayout.VERTICAL);
        final EditText filter = new EditText(this);
        styleInput(filter, "Search My Places");
        content.addView(filter);
        final ListView list = listView(rows);
        list.setChoiceMode(ListView.CHOICE_MODE_NONE);
        content.addView(list, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, dp(360)));

        // Selection is tracked by place so it survives filtering.
        final List<PoiStore.Place> selected = new ArrayList<>();
        final BaseAdapter adapter = (BaseAdapter) list.getAdapter();
        ((RowAdapter) adapter).selection = selected;
        ((RowAdapter) adapter).places = shown;
        list.setOnItemClickListener((p, v, position, id) -> {
            PoiStore.Place place = shown.get(position);
            if (selected.contains(place)) selected.remove(place);
            else selected.add(place);
            adapter.notifyDataSetChanged();
        });
        filter.addTextChangedListener(new SimpleWatcher() {
            @Override
            public void afterTextChanged(Editable s) {
                String q = s.toString().trim().toLowerCase(Locale.ROOT);
                shown.clear();
                for (PoiStore.Place place : candidates) {
                    if (q.isEmpty() || place.name.toLowerCase(Locale.ROOT).contains(q)) shown.add(place);
                }
                fillRows(rows, shown);
                adapter.notifyDataSetChanged();
            }
        });

        new AlertDialog.Builder(this, android.R.style.Theme_DeviceDefault_Dialog_Alert)
                .setTitle("Add from My Places")
                .setView(content)
                .setNegativeButton("Cancel", null)
                .setPositiveButton("Add", (d, w) -> {
                    int added = 0;
                    for (PoiStore.Place place : selected) {
                        if (PoiStore.addPlace(this, folderName, place)) added++;
                    }
                    toast(added + " added to " + folderName);
                    showFolder(folderName);
                }).show();
    }

    private static final Pattern COORDS = Pattern.compile("(-?\\d{1,3}(?:\\.\\d+)?)\\s*[,;\\s]\\s*(-?\\d{1,3}(?:\\.\\d+)?)");

    private void addByCoordinates(final String folderName) {
        promptText("Add by coordinates", "e.g. 51.5074, -0.1278  (or paste a map link)", "", text -> {
            // Accepts "lat, lon", "geo:lat,lon" and map links containing "@lat,lon" or "ll=lat,lon".
            Matcher m = COORDS.matcher(text);
            while (m.find()) {
                double lat = Double.parseDouble(m.group(1));
                double lon = Double.parseDouble(m.group(2));
                if (Math.abs(lat) <= 90 && Math.abs(lon) <= 180) {
                    final double flat = lat, flon = lon;
                    promptText("Name this place", "Name", String.format(Locale.US, "%.5f, %.5f", lat, lon), name -> {
                        boolean added = PoiStore.addPlace(this, folderName, new PoiStore.Place(name, flat, flon));
                        toast(added ? "Added" : "Already in this folder");
                        showFolder(folderName);
                    });
                    return;
                }
            }
            toast("Couldn't find coordinates in that text");
        });
    }

    // ---- "Add to My POIs" from the map -------------------------------------------------------

    private void showAddFlow() {
        setPage("Save to My POIs");

        final EditText name = new EditText(this);
        styleInput(name, "Name");
        name.setText(pendingPlace.name);
        body.addView(name, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));

        TextView hint = new TextView(this);
        hint.setText("Choose a folder");
        hint.setTextColor(SUBTEXT);
        hint.setPadding(dp(16), dp(12), dp(16), dp(4));
        body.addView(hint);

        final List<PoiStore.Folder> folders = PoiStore.load(this);
        List<Row> rows = new ArrayList<>();
        for (PoiStore.Folder folder : folders) rows.add(new Row(folder.name, count(folder.places.size())));
        ListView list = listView(rows);
        list.setOnItemClickListener((p, v, position, id) -> finishAdd(folders.get(position).name, name.getText().toString()));
        body.addView(list, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, 0, 1f));

        Button create = primaryButton("New folder");
        create.setOnClickListener(v -> promptText("New folder", "Folder name", "", folderName -> {
            if (PoiStore.find(PoiStore.load(this), folderName) != null) {
                toast("A folder with that name already exists");
                return;
            }
            finishAdd(folderName, name.getText().toString());
        }));
        body.addView(create, buttonParams());
    }

    private void finishAdd(String folderName, String name) {
        String clean = name.trim().isEmpty()
                ? String.format(Locale.US, "%.5f, %.5f", pendingPlace.lat, pendingPlace.lon) : name.trim();
        boolean added = PoiStore.addPlace(this, folderName, new PoiStore.Place(clean, pendingPlace.lat, pendingPlace.lon));
        toast(added ? "Saved to " + folderName : "Already in " + folderName);
        finish();
    }

    // ---- Navigation --------------------------------------------------------------------------

    private void navigate(PoiStore.Place place) {
        // The app's own handler for navigation links turns this into "plan a route to this point".
        Uri uri = Uri.parse(String.format(Locale.US, "google.navigation:///?ll=%.6f,%.6f", place.lat, place.lon));
        Intent intent = new Intent(Intent.ACTION_VIEW, uri).setPackage(getPackageName())
                .addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
        try {
            startActivity(intent);
            if (!addMode) finish();
        } catch (ActivityNotFoundException e) {
            toast("Couldn't start navigation");
        }
    }

    // ---- Folder chooser / text prompt ---------------------------------------------------------

    private interface Choice {
        void chosen(String value);
    }

    private void chooseFolder(String excluding, final Choice choice) {
        final List<String> names = new ArrayList<>();
        for (PoiStore.Folder folder : PoiStore.load(this)) {
            if (!folder.name.equalsIgnoreCase(excluding)) names.add(folder.name);
        }
        if (names.isEmpty()) {
            toast("Create another folder first");
            return;
        }
        new AlertDialog.Builder(this, android.R.style.Theme_DeviceDefault_Dialog_Alert)
                .setTitle("Choose folder")
                .setItems(names.toArray(new CharSequence[0]), (d, which) -> choice.chosen(names.get(which)))
                .show();
    }

    private void promptText(String title, String hint, String initial, final Choice onOk) {
        final EditText input = new EditText(this);
        styleInput(input, hint);
        input.setText(initial);
        input.setSelectAllOnFocus(true);
        input.setInputType(InputType.TYPE_CLASS_TEXT);
        AlertDialog dialog = new AlertDialog.Builder(this, android.R.style.Theme_DeviceDefault_Dialog_Alert)
                .setTitle(title)
                .setView(input)
                .setNegativeButton("Cancel", null)
                .setPositiveButton("OK", (DialogInterface d, int w) -> {
                    String value = input.getText().toString().trim();
                    if (!value.isEmpty()) onOk.chosen(value);
                }).create();
        dialog.show();
    }

    // ---- Views -------------------------------------------------------------------------------

    private static final class Row {
        final String title;
        final String subtitle;

        Row(String title, String subtitle) {
            this.title = title;
            this.subtitle = subtitle;
        }
    }

    private final class RowAdapter extends BaseAdapter {
        final List<Row> rows;
        /** When set, rows whose place is in {@link #selection} get a tick (multi-select picker). */
        List<PoiStore.Place> selection;
        List<PoiStore.Place> places;

        RowAdapter(List<Row> rows) {
            this.rows = rows;
        }

        @Override
        public int getCount() {
            return rows.size();
        }

        @Override
        public Object getItem(int position) {
            return rows.get(position);
        }

        @Override
        public long getItemId(int position) {
            return position;
        }

        @Override
        public View getView(int position, View convertView, ViewGroup parent) {
            LinearLayout cell = new LinearLayout(MyPoisActivity.this);
            cell.setOrientation(LinearLayout.VERTICAL);
            cell.setPadding(dp(16), dp(12), dp(16), dp(12));
            Row row = rows.get(position);

            boolean ticked = selection != null && places != null && position < places.size()
                    && selection.contains(places.get(position));
            if (ticked) cell.setBackgroundColor(Color.parseColor("#26406B"));

            TextView title = new TextView(MyPoisActivity.this);
            title.setText((ticked ? "✓  " : "") + row.title);
            title.setTextColor(TEXT);
            title.setTextSize(TypedValue.COMPLEX_UNIT_SP, 17);
            cell.addView(title);

            TextView sub = new TextView(MyPoisActivity.this);
            sub.setText(row.subtitle);
            sub.setTextColor(SUBTEXT);
            sub.setTextSize(TypedValue.COMPLEX_UNIT_SP, 13);
            cell.addView(sub);
            return cell;
        }
    }

    private ListView listView(List<Row> rows) {
        ListView list = new ListView(this);
        list.setAdapter(new RowAdapter(rows));
        list.setDivider(new android.graphics.drawable.ColorDrawable(Color.parseColor("#262D39")));
        list.setDividerHeight(dp(1));
        return list;
    }

    private TextView message(String text) {
        TextView view = new TextView(this);
        view.setText(text);
        view.setTextColor(SUBTEXT);
        view.setGravity(Gravity.CENTER);
        view.setTextSize(TypedValue.COMPLEX_UNIT_SP, 16);
        view.setPadding(dp(32), dp(32), dp(32), dp(32));
        return view;
    }

    private void styleInput(EditText input, String hint) {
        input.setHint(hint);
        input.setTextColor(TEXT);
        input.setHintTextColor(SUBTEXT);
        input.setSingleLine(true);
        input.setPadding(dp(16), dp(12), dp(16), dp(12));
    }

    private Button flatButton(String text) {
        Button button = new Button(this);
        button.setText(text);
        button.setTextColor(TEXT);
        button.setBackgroundColor(Color.TRANSPARENT);
        return button;
    }

    private Button primaryButton(String text) {
        Button button = new Button(this);
        button.setText(text);
        button.setAllCaps(false);
        button.setTextColor(Color.WHITE);
        button.setBackgroundColor(ACCENT);
        return button;
    }

    private Button secondaryButton(String text) {
        Button button = new Button(this);
        button.setText(text);
        button.setAllCaps(false);
        button.setTextColor(TEXT);
        button.setBackgroundColor(BAR);
        return button;
    }

    private LinearLayout.LayoutParams buttonParams() {
        LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        params.setMargins(dp(8), dp(4), dp(8), dp(8));
        return params;
    }

    private int dp(int value) {
        return (int) TypedValue.applyDimension(TypedValue.COMPLEX_UNIT_DIP, value, getResources().getDisplayMetrics());
    }

    private void toast(String text) {
        Toast.makeText(this, text, Toast.LENGTH_SHORT).show();
    }

    private static String count(int n) {
        return n == 1 ? "1 place" : n + " places";
    }

    private abstract static class SimpleWatcher implements TextWatcher {
        @Override
        public void beforeTextChanged(CharSequence s, int start, int count, int after) {
        }

        @Override
        public void onTextChanged(CharSequence s, int start, int before, int count) {
        }
    }
}
