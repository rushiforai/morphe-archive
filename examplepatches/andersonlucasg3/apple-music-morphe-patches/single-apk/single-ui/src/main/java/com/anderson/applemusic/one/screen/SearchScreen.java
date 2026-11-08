package com.anderson.applemusic.one.screen;

import android.app.Activity;
import android.content.Context;
import android.text.TextUtils;
import android.view.Gravity;
import android.view.KeyEvent;
import android.view.View;
import android.view.ViewGroup;
import android.view.inputmethod.EditorInfo;
import android.view.inputmethod.InputMethodManager;
import android.widget.EditText;
import android.widget.FrameLayout;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.TextView;

import com.anderson.applemusic.one.media.ArtworkLoader;
import com.anderson.applemusic.one.media.CatalogSearch;
import com.anderson.applemusic.one.theme.Inter;
import com.anderson.applemusic.one.theme.Shapes;
import com.anderson.applemusic.one.theme.Tokens;
import com.anderson.applemusic.one.widget.CircleButton;
import com.anderson.applemusic.one.widget.EmptyState;
import com.anderson.applemusic.one.widget.IconView;
import com.anderson.applemusic.one.widget.Icons;
import com.anderson.applemusic.one.widget.ListRow;
import com.anderson.applemusic.one.widget.Pill;
import com.anderson.applemusic.one.widget.SectionHeader;
import com.anderson.applemusic.one.widget.Skeleton;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

/**
 * Search panel over the catalogue (amp-api): rounded field, results grouped by type with
 * covers, skeleton while querying and a proper offline state with the engine-search
 * fallback. On TV the field opens the IME; on touch it is the normal soft keyboard.
 */
public final class SearchScreen {

    private static final String[] GROUP_ORDER = {"Música", "Álbum", "Artista", "Playlist"};
    private static final String[] GROUP_TITLES = {"Músicas", "Álbuns", "Artistas", "Playlists"};

    private final Activity activity;
    private final ScreenHost host;
    private final ArtworkLoader artwork;
    private final CatalogSearch catalog;
    private final FrameLayout root;
    private final EditText input;
    private final LinearLayout results;
    private final TextView status;
    private Skeleton skeleton;

    public SearchScreen(Context context, ScreenHost host, ArtworkLoader artwork,
                        CatalogSearch catalog) {
        this.activity = (Activity) context;
        this.host = host;
        this.artwork = artwork;
        this.catalog = catalog;

        root = new FrameLayout(context);
        root.setBackgroundColor(Tokens.BG);
        root.setVisibility(View.GONE);
        root.setClickable(true);

        LinearLayout page = new LinearLayout(context);
        page.setOrientation(LinearLayout.VERTICAL);
        page.setPadding(Tokens.dp(16), Tokens.dp(12), Tokens.dp(16), 0);
        root.addView(page, new FrameLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT));

        LinearLayout header = new LinearLayout(context);
        header.setOrientation(LinearLayout.HORIZONTAL);
        header.setGravity(Gravity.CENTER_VERTICAL);
        CircleButton close = new CircleButton(context, Icons.CLOSE, 44f, Tokens.SURFACE,
                Tokens.TEXT, 20f);
        close.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                host.closeSearch();
            }
        });
        LinearLayout.LayoutParams closeParams =
                new LinearLayout.LayoutParams(Tokens.dp(44), Tokens.dp(44));
        closeParams.rightMargin = Tokens.dp(12);
        header.addView(close, closeParams);

        LinearLayout field = new LinearLayout(context);
        field.setOrientation(LinearLayout.HORIZONTAL);
        field.setGravity(Gravity.CENTER_VERTICAL);
        field.setBackground(Shapes.rounded(Tokens.SURFACE, Tokens.RADIUS_CONTROL));
        field.setPadding(Tokens.dp(14), 0, Tokens.dp(8), 0);
        field.setMinimumHeight(Tokens.dp(52));
        LinearLayout.LayoutParams fieldParams = new LinearLayout.LayoutParams(0,
                Tokens.dp(52), 1f);
        header.addView(field, fieldParams);

        IconView fieldIcon = new IconView(context, Icons.SEARCH, Tokens.TEXT_DIM);
        LinearLayout.LayoutParams iconParams =
                new LinearLayout.LayoutParams(Tokens.dp(20), Tokens.dp(20));
        iconParams.rightMargin = Tokens.dp(10);
        field.addView(fieldIcon, iconParams);

        input = new EditText(context);
        input.setHint("Músicas, álbuns, artistas");
        input.setHintTextColor(Tokens.TEXT_DIM);
        input.setTextColor(Tokens.TEXT);
        input.setTextSize(16f);
        input.setSingleLine(true);
        input.setBackground(null);
        input.setPadding(0, 0, 0, 0);
        input.setInputType(android.text.InputType.TYPE_CLASS_TEXT);
        input.setImeOptions(EditorInfo.IME_ACTION_SEARCH);
        Inter.style(input, 16f, Inter.REGULAR, Tokens.TEXT);
        input.setHintTextColor(Tokens.TEXT_DIM);
        input.setOnEditorActionListener(new TextView.OnEditorActionListener() {
            @Override
            public boolean onEditorAction(TextView v, int actionId, KeyEvent event) {
                if (actionId == EditorInfo.IME_ACTION_SEARCH
                        || (event != null && event.getKeyCode() == KeyEvent.KEYCODE_ENTER
                        && event.getAction() == KeyEvent.ACTION_DOWN)) {
                    submit();
                    return true;
                }
                return false;
            }
        });
        field.addView(input, new LinearLayout.LayoutParams(0,
                ViewGroup.LayoutParams.WRAP_CONTENT, 1f));

        CircleButton clear = new CircleButton(context, Icons.CLOSE, 36f, 0x00000000,
                Tokens.TEXT_DIM, 16f);
        clear.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                input.setText("");
                showInitial();
            }
        });
        field.addView(clear, new LinearLayout.LayoutParams(Tokens.dp(36), Tokens.dp(36)));

        Pill submit = Pill.accent(context, Icons.SEARCH, "Buscar");
        submit.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                submit();
            }
        });
        LinearLayout.LayoutParams submitParams = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        submitParams.leftMargin = Tokens.dp(10);
        header.addView(submit, submitParams);

        page.addView(header, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));

        status = Inter.text(context, "", Tokens.CAPTION, Inter.REGULAR, Tokens.TEXT_DIM);
        status.setPadding(0, Tokens.dp(10), 0, Tokens.dp(4));
        page.addView(status);

        ScrollView scroll = new ScrollView(context);
        scroll.setFillViewport(true);
        results = new LinearLayout(context);
        results.setOrientation(LinearLayout.VERTICAL);
        results.setPadding(0, Tokens.dp(4), 0, Tokens.dp(104));
        scroll.addView(results, new ScrollView.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));
        page.addView(scroll, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, 0, 1f));

        showInitial();
    }

    public View view() {
        return root;
    }

    public boolean isOpen() {
        return root.getVisibility() == View.VISIBLE;
    }

    public void open() {
        root.setVisibility(View.VISIBLE);
        input.requestFocus();
        input.post(new Runnable() {
            @Override
            public void run() {
                InputMethodManager imm = (InputMethodManager)
                        activity.getSystemService(Context.INPUT_METHOD_SERVICE);
                if (imm != null) imm.showSoftInput(input, InputMethodManager.SHOW_IMPLICIT);
            }
        });
        if (input.getText().length() == 0) showInitial();
    }

    public void close() {
        hideKeyboard();
        root.setVisibility(View.GONE);
    }

    private void hideKeyboard() {
        InputMethodManager imm = (InputMethodManager)
                activity.getSystemService(Context.INPUT_METHOD_SERVICE);
        if (imm != null) imm.hideSoftInputFromWindow(input.getWindowToken(), 0);
    }

    private void submit() {
        String term = input.getText().toString().trim();
        if (term.length() == 0) return;
        hideKeyboard();
        runSearch(term);
    }

    private void runSearch(final String term) {
        stopSkeleton();
        results.removeAllViews();
        status.setText("Buscando \"" + term + "\"…");
        skeleton = Skeleton.rows(activity, 4);
        results.addView(skeleton, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));
        catalog.search(term, new CatalogSearch.Callback() {
            @Override
            public void onResults(List<CatalogSearch.Result> found) {
                stopSkeleton();
                results.removeAllViews();
                if (found.isEmpty()) {
                    status.setText("Nenhum resultado");
                    EmptyState empty = new EmptyState(activity, Icons.SEARCH,
                            "Nenhum resultado para \"" + term + "\"",
                            "Tente o nome de uma música, álbum, artista ou playlist.");
                    results.addView(empty, new LinearLayout.LayoutParams(
                            ViewGroup.LayoutParams.MATCH_PARENT,
                            ViewGroup.LayoutParams.WRAP_CONTENT));
                    return;
                }
                status.setText(found.size() + " resultado(s)");
                addGroups(found);
            }

            @Override
            public void onFailure(String message, boolean tokenMissing) {
                stopSkeleton();
                results.removeAllViews();
                status.setText(message);
                EmptyState failure = new EmptyState(activity, Icons.CLOSE,
                        tokenMissing ? "Conta necessária" : "Sem conexão",
                        message);
                Pill retry = Pill.surface(activity, Icons.REFRESH, "Tentar de novo");
                retry.setOnClickListener(new View.OnClickListener() {
                    @Override
                    public void onClick(View v) {
                        runSearch(term);
                    }
                });
                failure.addAction(retry);
                Pill fallback = Pill.surface(activity, Icons.NOTE, "Abrir a busca do Apple Music");
                fallback.setOnClickListener(new View.OnClickListener() {
                    @Override
                    public void onClick(View v) {
                        CatalogSearch.openEngineSearch(activity);
                    }
                });
                failure.addAction(fallback);
                results.addView(failure, new LinearLayout.LayoutParams(
                        ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));
            }
        });
    }

    private void addGroups(List<CatalogSearch.Result> found) {
        Map<String, List<CatalogSearch.Result>> groups =
                new LinkedHashMap<String, List<CatalogSearch.Result>>();
        for (CatalogSearch.Result result : found) {
            List<CatalogSearch.Result> group = groups.get(result.kind);
            if (group == null) {
                group = new ArrayList<CatalogSearch.Result>();
                groups.put(result.kind, group);
            }
            group.add(result);
        }
        for (int i = 0; i < GROUP_ORDER.length; i++) {
            List<CatalogSearch.Result> group = groups.get(GROUP_ORDER[i]);
            if (group == null || group.isEmpty()) continue;
            SectionHeader header = new SectionHeader(activity, GROUP_TITLES[i]);
            header.setCount(group.size());
            LinearLayout.LayoutParams headerParams = new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
            headerParams.topMargin = Tokens.dp(14);
            headerParams.bottomMargin = Tokens.dp(6);
            results.addView(header, headerParams);
            for (CatalogSearch.Result result : group) addResult(result);
        }
    }

    private void addResult(final CatalogSearch.Result result) {
        String subtitle = result.artist;
        if (subtitle == null || subtitle.length() == 0) subtitle = result.kind;
        ListRow row = new ListRow(activity, artwork, result.title, subtitle,
                result.artworkUrl, true);
        row.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                open(result);
                status.setText("Abrindo " + result.title);
            }
        });
        // Long press keeps the old "play this result" behaviour; a tap now opens the
        // artist/album/playlist/song level of the result.
        row.setOnLongClickListener(new View.OnLongClickListener() {
            @Override
            public boolean onLongClick(View v) {
                host.playId(result.id, result.title);
                status.setText("Tocando " + result.title);
                return true;
            }
        });
        LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        params.bottomMargin = Tokens.dp(8);
        results.addView(row, params);
    }

    private void open(CatalogSearch.Result result) {
        if ("Artista".equals(result.kind)) {
            host.openArtist(result.id, result.title, result.artworkUrl);
        } else if ("Álbum".equals(result.kind)) {
            host.openAlbum(result.id, result.title, result.artist, result.artworkUrl);
        } else if ("Playlist".equals(result.kind)) {
            host.openPlaylist(result.id, result.title, result.artist, result.artworkUrl);
        } else {
            host.openSong(result.id, result.title, result.artist, result.artworkUrl);
        }
    }

    private void showInitial() {
        stopSkeleton();
        results.removeAllViews();
        status.setText("");
        EmptyState state = new EmptyState(activity, Icons.SEARCH, "Busque no Apple Music",
                "Músicas, álbuns, artistas e playlists do catálogo.");
        results.addView(state, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));
    }

    private void stopSkeleton() {
        if (skeleton != null) {
            skeleton.stop();
            results.removeView(skeleton);
            skeleton = null;
        }
    }

    public void dispose() {
        stopSkeleton();
        hideKeyboard();
    }
}
