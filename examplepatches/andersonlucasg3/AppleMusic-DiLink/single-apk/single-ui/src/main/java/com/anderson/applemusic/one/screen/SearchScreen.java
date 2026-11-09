package com.anderson.applemusic.one.screen;

import android.app.Activity;
import android.content.Context;
import android.content.SharedPreferences;
import android.os.Bundle;
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
import com.anderson.applemusic.one.media.MediaClient;
import com.anderson.applemusic.one.theme.Inter;
import com.anderson.applemusic.one.theme.Shapes;
import com.anderson.applemusic.one.theme.Tokens;
import com.anderson.applemusic.one.widget.CircleButton;
import com.anderson.applemusic.one.widget.EmptyState;
import com.anderson.applemusic.one.widget.IconView;
import com.anderson.applemusic.one.widget.Icons;
import com.anderson.applemusic.one.widget.ListRow;
import com.anderson.applemusic.one.widget.Pill;
import com.anderson.applemusic.one.widget.ScrollMemory;
import com.anderson.applemusic.one.widget.SectionHeader;
import com.anderson.applemusic.one.widget.Skeleton;

import java.text.Normalizer;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

/**
 * Search panel with two scopes: the catalogue (amp-api, one GET per submit) and the
 * locally loaded library (no request at all). The last terms are persisted and offered
 * when the field is empty; results keep the loading/empty/error/retry states.
 */
public final class SearchScreen {

    private static final String[] GROUP_ORDER = {"Música", "Álbum", "Artista", "Playlist"};
    private static final String[] GROUP_TITLES = {"Músicas", "Álbuns", "Artistas", "Playlists"};

    private static final int SCOPE_CATALOG = 0;
    private static final int SCOPE_LIBRARY = 1;

    private static final String PREFS = "one-search";
    private static final String KEY_RECENT = "recent";
    private static final int MAX_RECENT = 10;

    private final Activity activity;
    private final ScreenHost host;
    private final ArtworkLoader artwork;
    private final CatalogSearch catalog;
    private final SharedPreferences prefs;
    private final FrameLayout root;
    private final EditText input;
    private final LinearLayout scopeRow;
    private final LinearLayout results;
    private final ScrollView scroll;
    private final TextView status;
    private final List<String> recents = new ArrayList<String>();
    private Skeleton skeleton;
    /** Bumped for every request; responses from an older one are dropped. */
    private int generation;
    /** Term of the request running right now, so a double submit issues one GET. */
    private String inFlightTerm;
    /** Query and scroll kept across a rotation; {@link #openRestored} replays them. */
    private String pendingTerm;
    private int pendingScope = -1;
    private float pendingScroll;
    /** Scope of the next search, kept in memory and across a rotation. */
    private int scope = SCOPE_CATALOG;
    /** Last catalogue answer, so toggling scopes does not repeat the GET for the same term. */
    private String lastCatalogTerm;
    private List<CatalogSearch.Result> lastCatalogResults = new ArrayList<CatalogSearch.Result>();

    public SearchScreen(Context context, ScreenHost host, ArtworkLoader artwork,
                        CatalogSearch catalog) {
        this.activity = (Activity) context;
        this.host = host;
        this.artwork = artwork;
        this.catalog = catalog;
        this.prefs = context.getSharedPreferences(PREFS, Context.MODE_PRIVATE);
        loadRecents();

        root = new FrameLayout(context);
        root.setBackgroundColor(Tokens.BG);
        root.setVisibility(View.GONE);
        // Consume touches that miss the field/results so they do not reach the screen below.
        root.setOnTouchListener(new View.OnTouchListener() {
            @Override
            public boolean onTouch(View v, android.view.MotionEvent event) {
                return true;
            }
        });

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
        close.setContentDescription("Fechar busca");
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
        input.setContentDescription("Buscar no Apple Music");
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
        clear.setContentDescription("Limpar busca");
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

        scopeRow = new LinearLayout(context);
        scopeRow.setOrientation(LinearLayout.HORIZONTAL);
        scopeRow.setGravity(Gravity.CENTER_VERTICAL);
        scopeRow.setPadding(0, Tokens.dp(10), 0, 0);
        page.addView(scopeRow, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));
        renderScope();

        status = Inter.text(context, "", Tokens.CAPTION, Inter.REGULAR, Tokens.TEXT_DIM);
        status.setPadding(0, Tokens.dp(8), 0, Tokens.dp(4));
        page.addView(status);

        scroll = new ScrollView(context);
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

    /** Query, scope and scroll, kept across a rotation; the host reopens the panel itself. */
    public void saveState(Bundle out) {
        out.putBoolean("one.search.open", isOpen());
        out.putString("one.search.term", input.getText().toString());
        out.putInt("one.search.scope", scope);
        ScrollMemory.save(out, "one.search.scroll", scroll);
    }

    public void restoreState(Bundle in) {
        if (in == null) return;
        pendingTerm = in.getString("one.search.term", "");
        pendingScope = in.getInt("one.search.scope", SCOPE_CATALOG);
        pendingScroll = in.getFloat("one.search.scroll", 0f);
    }

    /** Reopens the panel where it was and re-runs the last query in the same scope. */
    public void openRestored() {
        root.setVisibility(View.VISIBLE);
        if (pendingScope >= 0) {
            scope = pendingScope;
            pendingScope = -1;
            renderScope();
        }
        String term = pendingTerm == null ? "" : pendingTerm.trim();
        input.setText(term);
        input.clearFocus();
        if (term.length() == 0) {
            showInitial();
            applyPendingScroll();
        } else {
            runSearch(term);
        }
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
        // ENTER and IME_ACTION_SEARCH both arrive for one tap; while the same term is in
        // flight the second submit is a duplicate, not a new query.
        if (term.equals(inFlightTerm)) return;
        hideKeyboard();
        runSearch(term);
    }

    private void runSearch(final String term) {
        final String cleaned = term == null ? "" : term.trim();
        if (cleaned.length() == 0) {
            showInitial();
            return;
        }
        rememberTerm(cleaned);
        if (scope == SCOPE_LIBRARY) {
            runLibrarySearch(cleaned);
        } else {
            runCatalogSearch(cleaned);
        }
    }

    // --- scope ---------------------------------------------------------------------

    private void renderScope() {
        scopeRow.removeAllViews();
        scopeRow.addView(scopePill("Catálogo", SCOPE_CATALOG, Icons.NOTE), scopePillParams());
        scopeRow.addView(scopePill("Biblioteca", SCOPE_LIBRARY, Icons.LIBRARY),
                scopePillParams());
    }

    private View scopePill(String label, final int value, int icon) {
        boolean active = scope == value;
        Pill pill = active
                ? Pill.accent(activity, icon, label)
                : Pill.surface(activity, icon, label);
        pill.setContentDescription(label + (active ? ", selecionado" : ""));
        pill.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                setScope(value);
            }
        });
        return pill;
    }

    private LinearLayout.LayoutParams scopePillParams() {
        LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        params.rightMargin = Tokens.dp(8);
        return params;
    }

    private void setScope(int value) {
        if (scope == value) return;
        scope = value;
        renderScope();
        String term = input.getText().toString().trim();
        if (term.length() == 0) {
            showInitial();
            return;
        }
        if (scope == SCOPE_LIBRARY) {
            runLibrarySearch(term);
            return;
        }
        if (term.equals(inFlightTerm)) return;
        if (term.equals(lastCatalogTerm)) {
            generation++;
            inFlightTerm = null;
            renderCatalog(term, lastCatalogResults);
        } else {
            runCatalogSearch(term);
        }
    }

    // --- catalogue scope -----------------------------------------------------------

    private void runCatalogSearch(final String term) {
        final int token = ++generation;
        inFlightTerm = term;
        stopSkeleton();
        results.removeAllViews();
        status.setText("Buscando \"" + term + "\"…");
        skeleton = Skeleton.rows(activity, 4);
        results.addView(skeleton, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));
        catalog.search(term, new CatalogSearch.Callback() {
            @Override
            public void onResults(List<CatalogSearch.Result> found) {
                if (token != generation) return;
                inFlightTerm = null;
                lastCatalogTerm = term;
                lastCatalogResults = found;
                renderCatalog(term, found);
            }

            @Override
            public void onFailure(String message, boolean tokenMissing) {
                if (token != generation) return;
                inFlightTerm = null;
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

    private void renderCatalog(final String term, List<CatalogSearch.Result> found) {
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
        applyPendingScroll();
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

    // --- library scope -------------------------------------------------------------

    private void runLibrarySearch(final String term) {
        generation++;
        inFlightTerm = null;
        stopSkeleton();
        results.removeAllViews();
        final List<ScreenHost.LibrarySection> sections = host.librarySections();
        if (sections == null) {
            status.setText("Biblioteca ainda não carregada");
            EmptyState state = new EmptyState(activity, Icons.LIBRARY,
                    "Abra a Biblioteca uma vez",
                    "A busca local usa as categorias já carregadas de /library "
                            + "(artistas, álbuns e playlists), sem nenhuma requisição.");
            Pill open = Pill.accent(activity, Icons.LIBRARY, "Abrir Biblioteca");
            open.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View v) {
                    host.openLibrary();
                }
            });
            state.addAction(open);
            results.addView(state, new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));
            return;
        }
        String needle = normalize(term);
        int total = 0;
        for (ScreenHost.LibrarySection section : sections) {
            List<MediaClient.Item> matches = new ArrayList<MediaClient.Item>();
            for (MediaClient.Item item : section.items) {
                if (matches(item, needle)) matches.add(item);
            }
            if (matches.isEmpty()) continue;
            SectionHeader header = new SectionHeader(activity, section.title);
            header.setCount(matches.size());
            LinearLayout.LayoutParams headerParams = new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
            headerParams.topMargin = Tokens.dp(14);
            headerParams.bottomMargin = Tokens.dp(6);
            results.addView(header, headerParams);
            for (MediaClient.Item item : matches) addLibraryResult(item);
            total += matches.size();
        }
        if (total == 0) {
            status.setText("Nenhum resultado");
            EmptyState empty = new EmptyState(activity, Icons.SEARCH,
                    "Nenhum resultado para \"" + term + "\"",
                    "Nada na Biblioteca carregada corresponde a esse termo.");
            results.addView(empty, new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));
            return;
        }
        status.setText(total + (total == 1 ? " resultado" : " resultados") + " na Biblioteca");
        applyPendingScroll();
    }

    private void addLibraryResult(final MediaClient.Item item) {
        String subtitle = item.subtitle;
        if (subtitle == null || subtitle.length() == 0) subtitle = libraryLabel(item.id);
        ListRow row = new ListRow(activity, artwork, item.title, subtitle, item.artworkUri,
                true);
        row.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                LibraryOpener.open(host, catalog, item);
                status.setText("Abrindo " + item.title);
            }
        });
        row.setOnLongClickListener(new View.OnLongClickListener() {
            @Override
            public boolean onLongClick(View v) {
                host.itemActions(item);
                return true;
            }
        });
        LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        params.bottomMargin = Tokens.dp(8);
        results.addView(row, params);
    }

    // --- recent terms --------------------------------------------------------------

    private void loadRecents() {
        recents.clear();
        String raw = prefs.getString(KEY_RECENT, "");
        if (raw.length() == 0) return;
        String[] terms = raw.split("\n");
        for (String term : terms) {
            String value = term.trim();
            if (value.length() > 0 && !recents.contains(value)) recents.add(value);
        }
    }

    private void rememberTerm(String term) {
        for (int i = recents.size() - 1; i >= 0; i--) {
            if (recents.get(i).equalsIgnoreCase(term)) recents.remove(i);
        }
        recents.add(0, term);
        while (recents.size() > MAX_RECENT) recents.remove(recents.size() - 1);
        saveRecents();
    }

    private void saveRecents() {
        StringBuilder builder = new StringBuilder();
        for (int i = 0; i < recents.size(); i++) {
            if (i > 0) builder.append('\n');
            builder.append(recents.get(i));
        }
        prefs.edit().putString(KEY_RECENT, builder.toString()).apply();
    }

    private void addRecents() {
        LinearLayout header = new LinearLayout(activity);
        header.setOrientation(LinearLayout.HORIZONTAL);
        header.setGravity(Gravity.CENTER_VERTICAL);
        SectionHeader title = new SectionHeader(activity, "Buscas recentes");
        title.setCount(recents.size());
        header.addView(title, new LinearLayout.LayoutParams(0,
                ViewGroup.LayoutParams.WRAP_CONTENT, 1f));
        Pill clear = Pill.surface(activity, Icons.CLOSE, "Limpar");
        clear.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                recents.clear();
                saveRecents();
                showInitial();
            }
        });
        header.addView(clear);
        LinearLayout.LayoutParams headerParams = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        headerParams.topMargin = Tokens.dp(4);
        headerParams.bottomMargin = Tokens.dp(8);
        results.addView(header, headerParams);
        for (String term : recents) addRecentRow(term);
    }

    private void addRecentRow(final String term) {
        ListRow row = new ListRow(activity, artwork, term, "Busca recente", null, false);
        row.cover().setImageDrawable(new Icons.IconDrawable(Icons.SEARCH, Tokens.TEXT_DIM));
        int pad = Tokens.dp(15);
        row.cover().setPadding(pad, pad, pad, pad);
        row.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                input.setText(term);
                input.setSelection(term.length());
                hideKeyboard();
                runSearch(term);
            }
        });
        LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        params.bottomMargin = Tokens.dp(8);
        results.addView(row, params);
    }

    private void showInitial() {
        generation++;
        inFlightTerm = null;
        stopSkeleton();
        results.removeAllViews();
        status.setText("");
        if (!recents.isEmpty()) {
            addRecents();
            return;
        }
        EmptyState state = scope == SCOPE_LIBRARY
                ? new EmptyState(activity, Icons.LIBRARY, "Filtre a Biblioteca",
                        "Artistas, álbuns e playlists já carregados, sem rede.")
                : new EmptyState(activity, Icons.SEARCH, "Busque no Apple Music",
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

    /** Puts the scroll back where it was before the rotation, once the results are in. */
    private void applyPendingScroll() {
        if (pendingScroll <= 0f) return;
        ScrollMemory.restore(scroll, pendingScroll);
        pendingScroll = 0f;
    }

    public void dispose() {
        stopSkeleton();
        hideKeyboard();
    }

    // --- helpers -------------------------------------------------------------------

    private static boolean matches(MediaClient.Item item, String needle) {
        return normalize(item.title).contains(needle)
                || normalize(item.subtitle).contains(needle);
    }

    /** Case/diacritic-insensitive comparison, same normalisation as the Biblioteca filter. */
    private static String normalize(String value) {
        String text = value == null ? "" : value;
        text = Normalizer.normalize(text, Normalizer.Form.NFD)
                .replaceAll("\\p{M}+", "");
        return text.toLowerCase(Locale.ROOT).replaceAll("\\s+", " ").trim();
    }

    private static String lastSegment(String id) {
        if (id == null) return "";
        int slash = id.lastIndexOf('/');
        return slash < 0 ? id : id.substring(slash + 1);
    }

    private static String libraryLabel(String id) {
        String last = lastSegment(id).toLowerCase(Locale.ROOT);
        if (last.startsWith("6-")) return "Artista";
        if (last.startsWith("3-")) return "Álbum";
        if (last.startsWith("4-")) return "Playlist";
        return "Biblioteca";
    }
}
