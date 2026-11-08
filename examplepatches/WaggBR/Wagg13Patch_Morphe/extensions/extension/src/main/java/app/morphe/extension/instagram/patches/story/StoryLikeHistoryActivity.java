/*
 * Story like history screen (Morphe): a native grid of the stories the user liked in the
 * last 24h. Built with plain android.widget views, no XML and no extra dependencies.
 * The entries come from StoryLikeHistory (local JSON), loaded off the UI thread.
 */

package app.morphe.extension.instagram.patches.story;

import android.app.Activity;
import android.content.ClipData;
import android.content.ClipboardManager;
import android.content.Context;
import android.content.Intent;
import android.graphics.Color;
import android.graphics.drawable.GradientDrawable;
import android.net.Uri;
import android.os.Build;
import android.os.Bundle;
import android.text.Editable;
import android.text.TextWatcher;
import android.util.Log;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.view.WindowInsets;
import android.widget.EditText;
import android.widget.FrameLayout;
import android.widget.GridView;
import android.widget.LinearLayout;
import android.widget.PopupMenu;
import android.widget.ProgressBar;
import android.widget.TextView;
import android.widget.Toast;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

@SuppressWarnings({"unused", "deprecation"})
public final class StoryLikeHistoryActivity extends Activity implements StoryLikeHistoryAdapter.Listener {
    private static final String TAG = "StoryLikeHistory";

    private static final int TAB_RECENT = 0;
    private static final int TAB_EXPIRED = 1;

    private static final int BG = 0xFF0B0B0C;
    private static final int BAR_BG = 0xFF141416;
    private static final int CARD_BG = 0xFF1B1C1F;
    private static final int TEXT_PRIMARY = Color.WHITE;
    private static final int TEXT_SECONDARY = 0xFF9AA3AE;
    private static final int ACCENT = 0xFFE1306C;

    private static final ExecutorService LOADER = Executors.newSingleThreadExecutor(runnable -> {
        Thread thread = new Thread(runnable, "wagg13-story-likes-ui");
        thread.setDaemon(true);
        return thread;
    });

    private final List<StoryLikeHistoryEntry> all = new ArrayList<>();
    private StoryLikeHistoryAdapter adapter;
    private GridView grid;
    private LinearLayout emptyState;
    private TextView emptyTitle;
    private TextView emptySubtitle;
    private ProgressBar loading;
    private TextView errorView;
    private EditText searchInput;
    private View searchBox;
    private final TextView[] tabs = new TextView[2];
    private int tab = TAB_RECENT;
    private String query = "";

    /** Opens the history screen from anywhere inside Instagram. */
    public static void open(Context context) {
        try {
            Intent intent = new Intent(context, StoryLikeHistoryActivity.class);
            if (!(context instanceof Activity)) {
                intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
            }
            context.startActivity(intent);
        } catch (Throwable t) {
            Log.e(TAG, "open failed", t);
            Toast.makeText(context, pt() ? "Não foi possível abrir o histórico" : "Could not open the history",
                    Toast.LENGTH_SHORT).show();
        }
    }

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP) {
            getWindow().setStatusBarColor(BG);
            getWindow().setNavigationBarColor(BG);
        }
        setContentView(buildRoot());
        load();
    }

    @Override
    protected void onResume() {
        super.onResume();
        load();
    }

    // ---- loading -------------------------------------------------------------------------

    /** Reads the history off the UI thread; the screen never blocks on the file. */
    private void load() {
        loading.setVisibility(View.VISIBLE);
        errorView.setVisibility(View.GONE);
        LOADER.execute(() -> {
            List<StoryLikeHistoryEntry> entries;
            try {
                entries = StoryLikeHistory.entries(getApplicationContext());
            } catch (Throwable t) {
                Log.e(TAG, "load failed", t);
                runOnUiThread(this::showError);
                return;
            }
            List<StoryLikeHistoryEntry> copy = new ArrayList<>(entries);
            Log.i(TAG, "loaded " + copy.size() + " entries");
            runOnUiThread(() -> {
                if (isFinishing()) return;
                all.clear();
                all.addAll(copy);
                render();
            });
        });
    }

    private void showError() {
        if (isFinishing()) return;
        loading.setVisibility(View.GONE);
        grid.setVisibility(View.GONE);
        emptyState.setVisibility(View.GONE);
        errorView.setText(pt() ? "Não foi possível ler o histórico." : "Could not read the history.");
        errorView.setVisibility(View.VISIBLE);
    }

    // ---- layout --------------------------------------------------------------------------

    private View buildRoot() {
        LinearLayout root = new LinearLayout(this);
        root.setOrientation(LinearLayout.VERTICAL);
        root.setBackgroundColor(BG);

        root.addView(buildTopBar(), new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, dp(56)));

        searchBox = buildSearchBox();
        searchBox.setVisibility(View.GONE);
        root.addView(searchBox);

        root.addView(buildTabs(), new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, dp(44)));

        FrameLayout content = new FrameLayout(this);

        grid = new GridView(this);
        grid.setNumColumns(2);
        grid.setVerticalSpacing(dp(12));
        grid.setHorizontalSpacing(dp(12));
        grid.setStretchMode(GridView.STRETCH_COLUMN_WIDTH);
        grid.setPadding(dp(12), dp(12), dp(12), dp(12));
        grid.setClipToPadding(false);
        grid.setVerticalScrollBarEnabled(false);
        adapter = new StoryLikeHistoryAdapter(this, new ArrayList<StoryLikeHistoryEntry>(), this);
        grid.setAdapter(adapter);
        content.addView(grid, new FrameLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT));

        loading = new ProgressBar(this);
        content.addView(loading, centeredWrap());
        loading.setVisibility(View.GONE);

        emptyState = buildEmptyState();
        content.addView(emptyState, centeredWrap());
        emptyState.setVisibility(View.GONE);

        errorView = new TextView(this);
        errorView.setTextColor(TEXT_SECONDARY);
        errorView.setTextSize(TypedValue.COMPLEX_UNIT_SP, 13);
        errorView.setGravity(Gravity.CENTER);
        content.addView(errorView, centeredWrap());
        errorView.setVisibility(View.GONE);

        root.addView(content, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, 0, 1f));

        // Android 15+ draws edge to edge; keep our own bars out of the system bars.
        root.setOnApplyWindowInsetsListener((v, insets) -> {
            v.setPadding(0, insets.getSystemWindowInsetTop(), 0, insets.getSystemWindowInsetBottom());
            return insets;
        });
        return root;
    }

    private View buildTopBar() {
        FrameLayout bar = new FrameLayout(this);
        bar.setBackgroundColor(BAR_BG);

        TextView back = new TextView(this);
        back.setText("\u2190");
        back.setTextColor(TEXT_PRIMARY);
        back.setTextSize(TypedValue.COMPLEX_UNIT_SP, 22);
        back.setGravity(Gravity.CENTER);
        back.setContentDescription(pt() ? "Voltar" : "Back");
        back.setOnClickListener(v -> finish());
        bar.addView(back, new FrameLayout.LayoutParams(dp(56), dp(56), Gravity.START | Gravity.CENTER_VERTICAL));

        TextView title = new TextView(this);
        title.setText(pt() ? "Curtidas em Stories" : "Story likes");
        title.setTextColor(TEXT_PRIMARY);
        title.setTextSize(TypedValue.COMPLEX_UNIT_SP, 17);
        title.setTypeface(null, android.graphics.Typeface.BOLD);
        title.setGravity(Gravity.CENTER);
        title.setSingleLine(true);
        FrameLayout.LayoutParams titleLp = new FrameLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT,
                Gravity.CENTER);
        titleLp.leftMargin = dp(56);
        titleLp.rightMargin = dp(56);
        bar.addView(title, titleLp);

        TextView searchButton = new TextView(this);
        searchButton.setText("\uD83D\uDD0D");
        searchButton.setTextSize(TypedValue.COMPLEX_UNIT_SP, 16);
        searchButton.setGravity(Gravity.CENTER);
        searchButton.setContentDescription(pt() ? "Buscar" : "Search");
        searchButton.setOnClickListener(v -> toggleSearch());
        bar.addView(searchButton, new FrameLayout.LayoutParams(dp(56), dp(56), Gravity.END | Gravity.CENTER_VERTICAL));
        return bar;
    }

    private View buildSearchBox() {
        EditText input = new EditText(this);
        input.setSingleLine(true);
        input.setHint(pt() ? "Buscar por nome ou @usuário" : "Search name or @username");
        input.setHintTextColor(TEXT_SECONDARY);
        input.setTextColor(TEXT_PRIMARY);
        input.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14);
        input.setPadding(dp(14), dp(8), dp(14), dp(8));
        input.setBackground(rounded(CARD_BG, 10));
        input.addTextChangedListener(new TextWatcher() {
            @Override public void beforeTextChanged(CharSequence s, int start, int count, int after) { }

            @Override public void onTextChanged(CharSequence s, int start, int before, int count) { }

            @Override public void afterTextChanged(Editable s) {
                query = s == null ? "" : s.toString();
                render();
            }
        });
        searchInput = input;

        FrameLayout wrapper = new FrameLayout(this);
        wrapper.setPadding(dp(12), 0, dp(12), dp(8));
        wrapper.addView(input, new FrameLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, dp(40)));
        return wrapper;
    }

    private View buildTabs() {
        LinearLayout bar = new LinearLayout(this);
        bar.setOrientation(LinearLayout.HORIZONTAL);
        bar.setBackgroundColor(BG);

        String[] labels = {pt() ? "Recentes" : "Recent", pt() ? "Expirados" : "Expired"};
        for (int i = 0; i < labels.length; i++) {
            final int index = i;
            TextView tabView = new TextView(this);
            tabView.setText(labels[i]);
            tabView.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14);
            tabView.setGravity(Gravity.CENTER);
            tabView.setOnClickListener(v -> {
                tab = index;
                render();
            });
            tabs[i] = tabView;
            bar.addView(tabView, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.MATCH_PARENT, 1f));
        }
        return bar;
    }

    private LinearLayout buildEmptyState() {
        LinearLayout box = new LinearLayout(this);
        box.setOrientation(LinearLayout.VERTICAL);
        box.setGravity(Gravity.CENTER);
        box.setPadding(dp(32), dp(32), dp(32), dp(32));

        TextView heart = new TextView(this);
        heart.setText("\u2661");
        heart.setTextColor(ACCENT);
        heart.setTextSize(TypedValue.COMPLEX_UNIT_SP, 56);
        heart.setGravity(Gravity.CENTER);
        box.addView(heart);

        emptyTitle = new TextView(this);
        emptyTitle.setTextColor(TEXT_PRIMARY);
        emptyTitle.setTextSize(TypedValue.COMPLEX_UNIT_SP, 16);
        emptyTitle.setGravity(Gravity.CENTER);
        emptyTitle.setPadding(0, dp(12), 0, dp(6));
        box.addView(emptyTitle);

        emptySubtitle = new TextView(this);
        emptySubtitle.setTextColor(TEXT_SECONDARY);
        emptySubtitle.setTextSize(TypedValue.COMPLEX_UNIT_SP, 13);
        emptySubtitle.setGravity(Gravity.CENTER);
        box.addView(emptySubtitle);
        return box;
    }

    private FrameLayout.LayoutParams centeredWrap() {
        return new FrameLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT,
                Gravity.CENTER);
    }

    // ---- filtering / rendering -----------------------------------------------------------

    private void render() {
        long now = System.currentTimeMillis();

        // Opportunistic cleanup: entries past likedAt + 24h leave the panel for good.
        for (Iterator<StoryLikeHistoryEntry> it = all.iterator(); it.hasNext(); ) {
            if (it.next().shouldRemove(now)) it.remove();
        }

        String needle = query.trim().toLowerCase(Locale.ROOT);
        List<StoryLikeHistoryEntry> visible = new ArrayList<>();
        for (StoryLikeHistoryEntry entry : all) {
            if (tab == TAB_EXPIRED && !entry.isExpired(now)) continue;
            if (!matches(entry, needle)) continue;
            visible.add(entry);
        }
        Collections.sort(visible, new Comparator<StoryLikeHistoryEntry>() {
            @Override
            public int compare(StoryLikeHistoryEntry a, StoryLikeHistoryEntry b) {
                return Long.compare(b.likedAt, a.likedAt);
            }
        });

        adapter.submit(visible);
        loading.setVisibility(View.GONE);
        errorView.setVisibility(View.GONE);

        boolean empty = visible.isEmpty();
        grid.setVisibility(empty ? View.GONE : View.VISIBLE);
        emptyState.setVisibility(empty ? View.VISIBLE : View.GONE);
        if (empty) updateEmptyText(needle);

        for (int i = 0; i < tabs.length; i++) {
            boolean selected = i == tab;
            tabs[i].setTextColor(selected ? ACCENT : TEXT_SECONDARY);
            tabs[i].setTypeface(null, selected ? android.graphics.Typeface.BOLD : android.graphics.Typeface.NORMAL);
            tabs[i].setBackground(selected ? underline() : null);
        }
    }

    private void updateEmptyText(String needle) {
        if (!needle.isEmpty()) {
            emptyTitle.setText(pt() ? "Nenhum resultado" : "No results");
            emptySubtitle.setText(pt() ? "Tente outro nome ou @usuário." : "Try another name or @username.");
        } else if (tab == TAB_EXPIRED) {
            emptyTitle.setText(pt() ? "Nenhum Story expirado" : "No expired stories");
            emptySubtitle.setText(pt() ? "Os Stories que saírem do ar aparecem aqui." : "Stories that go offline show up here.");
        } else {
            emptyTitle.setText(pt() ? "Nenhuma curtida em Stories ainda" : "No story likes yet");
            emptySubtitle.setText(pt() ? "Os Stories que você curtir aparecerão aqui." : "Stories you like will show up here.");
        }
    }

    private boolean matches(StoryLikeHistoryEntry entry, String needle) {
        if (needle.isEmpty()) return true;
        return contains(entry.displayName, needle)
                || contains(entry.username, needle)
                || contains(entry.authorId, needle);
    }

    private static boolean contains(String value, String needle) {
        return value != null && value.toLowerCase(Locale.ROOT).contains(needle);
    }

    private void toggleSearch() {
        boolean show = searchBox.getVisibility() != View.VISIBLE;
        searchBox.setVisibility(show ? View.VISIBLE : View.GONE);
        if (show) {
            searchInput.requestFocus();
        } else {
            searchInput.setText("");
        }
    }

    // ---- cell callbacks ------------------------------------------------------------------

    @Override
    public void onThumbnail(StoryLikeHistoryEntry entry) {
        Toast.makeText(this, pt() ? "Story não está mais disponível" : "Story is no longer available",
                Toast.LENGTH_SHORT).show();
    }

    @Override
    public void onProfile(StoryLikeHistoryEntry entry) {
        if (entry.username == null || entry.username.isEmpty()) {
            onThumbnail(entry);
            return;
        }
        try {
            Intent intent = new Intent(Intent.ACTION_VIEW,
                    Uri.parse("instagram://user?username=" + Uri.encode(entry.username)));
            startActivity(intent);
        } catch (Throwable t) {
            Log.e(TAG, "openProfile failed", t);
            Toast.makeText(this, pt() ? "Não foi possível abrir o perfil" : "Could not open the profile",
                    Toast.LENGTH_SHORT).show();
        }
    }

    @Override
    public void onMenu(final StoryLikeHistoryEntry entry, View anchor) {
        PopupMenu popup = new PopupMenu(this, anchor);
        popup.getMenu().add(0, 1, 0, pt() ? "Copiar username" : "Copy username");
        popup.getMenu().add(0, 2, 1, pt() ? "Remover registro" : "Remove entry");
        popup.setOnMenuItemClickListener(item -> {
            if (item.getItemId() == 1) {
                copyUsername(entry);
            } else {
                StoryLikeHistory.remove(getApplicationContext(), entry.storyId);
                all.remove(entry);
                render();
            }
            return true;
        });
        popup.show();
    }

    private void copyUsername(StoryLikeHistoryEntry entry) {
        try {
            ClipboardManager clipboard = (ClipboardManager) getSystemService(Context.CLIPBOARD_SERVICE);
            if (clipboard == null || entry.username == null) return;
            clipboard.setPrimaryClip(ClipData.newPlainText("username", entry.username));
            Toast.makeText(this, pt() ? "Username copiado" : "Username copied", Toast.LENGTH_SHORT).show();
        } catch (Throwable t) {
            Log.e(TAG, "copyUsername failed", t);
        }
    }

    // ---- "..." menu hooks (called from the patched story options dialog) -----------------

    /** Label of the entry appended to the story "..." menu. */
    private static String menuLabel() {
        return pt() ? "Curtidas em Stories" : "Story likes";
    }

    /** Appends our entry to the labels of the story "..." menu and returns the new array. */
    public static CharSequence[] addButtons(CharSequence[] items) {
        try {
            Log.i(TAG, "addButtons items=" + (items == null ? "null" : items.length));
            if (items == null) {
                Log.e(TAG, "addButtons items was null");
                return null;
            }
            CharSequence[] out = new CharSequence[items.length + 1];
            System.arraycopy(items, 0, out, 0, items.length);
            out[items.length] = menuLabel();
            Log.i(TAG, "addButtons appended -> len=" + out.length + " label=" + menuLabel());
            return out;
        } catch (Throwable t) {
            Log.e(TAG, "addButtons failed", t);
            return items;
        }
    }

    /** Handles a tap on a story "..." menu entry; true when the entry was ours. */
    public static boolean buttonAction(CharSequence text, Context context) {
        try {
            Log.i(TAG, "menu action text=" + text);
            if (text == null || !menuLabel().contentEquals(text)) return false;
            Log.i(TAG, "opening story like history");
            open(context);
            return true;
        } catch (Throwable t) {
            Log.e(TAG, "buttonAction failed", t);
            return false;
        }
    }

    // ---- helpers -------------------------------------------------------------------------

    private static boolean pt() {
        return "pt".equals(Locale.getDefault().getLanguage());
    }

    private int dp(int value) {
        return Math.round(TypedValue.applyDimension(
                TypedValue.COMPLEX_UNIT_DIP, value, getResources().getDisplayMetrics()));
    }

    private GradientDrawable rounded(int color, int radiusDp) {
        GradientDrawable drawable = new GradientDrawable();
        drawable.setColor(color);
        drawable.setCornerRadius(dp(radiusDp));
        return drawable;
    }

    private GradientDrawable underline() {
        GradientDrawable drawable = new GradientDrawable();
        drawable.setColor(Color.TRANSPARENT);
        drawable.setStroke(dp(2), ACCENT);
        drawable.setCornerRadii(new float[]{0, 0, 0, 0, dp(6), dp(6), dp(6), dp(6)});
        return drawable;
    }
}
