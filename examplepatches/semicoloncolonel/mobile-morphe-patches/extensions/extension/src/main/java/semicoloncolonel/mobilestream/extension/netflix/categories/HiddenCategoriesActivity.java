package semicoloncolonel.mobilestream.extension.netflix.categories;

import android.app.Activity;
import android.content.Intent;
import android.graphics.Color;
import android.net.Uri;
import android.os.Bundle;
import android.text.Editable;
import android.text.TextWatcher;
import android.view.Gravity;
import android.view.ViewGroup;
import android.view.inputmethod.EditorInfo;
import android.widget.ArrayAdapter;
import android.widget.EditText;
import android.widget.LinearLayout;
import android.widget.ListView;
import android.widget.TextView;
import android.widget.Toast;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.List;

/**
 * Netflix — "Browse hidden categories".
 *
 * A self-contained screen that lists Netflix's hidden genre codes (bundled as
 * an asset, assets/netflix_hidden_genres.tsv). Typing filters the list; tapping
 * a category opens it inside Netflix through the app's own deep-link handler
 * (netflix.com/browse/genre/ID), which the manifest already registers. No part
 * of Netflix's own UI is touched. The list is the set that resolved against a
 * US account, so a handful may be empty in other regions.
 */
@SuppressWarnings("unused")
public final class HiddenCategoriesActivity extends Activity {

    private static final String ASSET = "netflix_hidden_genres.tsv";
    private static final String GENRE_URL = "https://www.netflix.com/browse/genre/";
    private static final String NETFLIX_PKG = "com.netflix.mediaclient";

    private final List<String> allIds = new ArrayList<>();
    private final List<String> allNames = new ArrayList<>();
    private final List<String> shownIds = new ArrayList<>();
    private ArrayAdapter<String> adapter;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setTitle("Hidden Categories");

        int pad = (int) (12 * getResources().getDisplayMetrics().density);

        LinearLayout root = new LinearLayout(this);
        root.setOrientation(LinearLayout.VERTICAL);
        root.setBackgroundColor(Color.BLACK);
        // Pad for the status and navigation bars (edge-to-edge is the default
        // from Android 15), so the header and search box are not drawn under
        // the system bars.
        root.setFitsSystemWindows(true);
        root.setLayoutParams(new ViewGroup.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT));

        final TextView header = new TextView(this);
        header.setText("Hidden Categories");
        header.setTextColor(Color.WHITE);
        header.setTextSize(22);
        header.setPadding(pad, pad, pad, pad / 2);
        root.addView(header, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));

        final EditText search = new EditText(this);
        search.setHint("Search hidden categories");
        search.setSingleLine(true);
        search.setTextColor(Color.WHITE);
        search.setHintTextColor(Color.GRAY);
        search.setImeOptions(EditorInfo.IME_FLAG_NO_EXTRACT_UI);
        search.setPadding(pad, pad, pad, pad);
        root.addView(search, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));

        final TextView count = new TextView(this);
        count.setTextColor(Color.GRAY);
        count.setPadding(pad, 0, pad, pad);
        root.addView(count, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));

        final ListView list = new ListView(this);
        list.setCacheColorHint(Color.BLACK);
        root.addView(list, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, 0, 1f));

        setContentView(root);

        loadGenres();
        adapter = new ArrayAdapter<String>(this, android.R.layout.simple_list_item_1, new ArrayList<String>()) {
            @Override
            public android.view.View getView(int position, android.view.View convertView, ViewGroup parent) {
                TextView tv = (TextView) super.getView(position, convertView, parent);
                tv.setTextColor(Color.WHITE);
                return tv;
            }
        };
        list.setAdapter(adapter);

        applyFilter("", count);

        search.addTextChangedListener(new TextWatcher() {
            @Override public void beforeTextChanged(CharSequence s, int a, int b, int c) {}
            @Override public void onTextChanged(CharSequence s, int a, int b, int c) {}
            @Override public void afterTextChanged(Editable s) { applyFilter(s.toString(), count); }
        });

        list.setOnItemClickListener((parent, view, position, id) -> openGenre(shownIds.get(position)));
    }

    private void loadGenres() {
        try (InputStream in = getAssets().open(ASSET);
             BufferedReader r = new BufferedReader(new InputStreamReader(in, StandardCharsets.UTF_8))) {
            String line;
            while ((line = r.readLine()) != null) {
                int tab = line.indexOf('\t');
                if (tab <= 0) continue;
                allIds.add(line.substring(0, tab));
                allNames.add(line.substring(tab + 1));
            }
        } catch (Exception ex) {
            Toast.makeText(this, "Could not load the category list.", Toast.LENGTH_LONG).show();
        }
    }

    private void applyFilter(String query, TextView count) {
        String q = query.trim().toLowerCase();
        List<String> names = new ArrayList<>();
        shownIds.clear();
        for (int i = 0; i < allNames.size(); i++) {
            String name = allNames.get(i);
            if (q.isEmpty() || name.toLowerCase().contains(q) || allIds.get(i).contains(q)) {
                names.add(name + "  (" + allIds.get(i) + ")");
                shownIds.add(allIds.get(i));
            }
        }
        adapter.clear();
        adapter.addAll(names);
        adapter.notifyDataSetChanged();
        count.setText(shownIds.size() + " categories");
    }

    private void openGenre(String id) {
        try {
            Intent intent = new Intent(Intent.ACTION_VIEW, Uri.parse(GENRE_URL + id));
            intent.setPackage(NETFLIX_PKG);
            intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
            startActivity(intent);
        } catch (Exception ex) {
            Toast.makeText(this, "Could not open that category.", Toast.LENGTH_SHORT).show();
        }
    }
}
