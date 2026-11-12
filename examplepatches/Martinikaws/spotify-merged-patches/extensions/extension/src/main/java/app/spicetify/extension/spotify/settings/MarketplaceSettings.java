package app.spicetify.extension.spotify.settings;

import android.annotation.SuppressLint;
import android.content.ActivityNotFoundException;
import android.content.Context;
import android.content.Intent;
import android.graphics.BitmapFactory;
import android.graphics.Color;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.GradientDrawable;
import android.net.Uri;
import android.os.Handler;
import android.os.Looper;
import android.text.Editable;
import android.text.InputType;
import android.text.TextUtils;
import android.text.TextWatcher;
import android.util.Base64;
import android.util.Log;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.ListView;
import android.widget.ScrollView;
import android.widget.Switch;
import android.widget.TextView;
import app.spicetify.extension.spotify.extensions.Extensions;
import app.spicetify.extension.spotify.theme.ThemeBackground;
import app.spicetify.extension.spotify.theme.ThemeException;
import app.spicetify.extension.spotify.theme.ThemeRuntime;
import app.spicetify.extension.spotify.theme.ThemeState;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Map;
import java.util.concurrent.Executor;
import java.util.concurrent.LinkedBlockingQueue;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;

/**
 * The Spicetify Marketplace page: Galaxy V2, then the community themes the desktop Marketplace lists,
 * with their previews, and its extensions, on two tabs with a search. A tapped theme's color.ini
 * downloads, with the background image it shows on desktop, if any, and its color scheme, chosen in a
 * sheet when there's more than one, applies like a theme on Appearance. An extension with an Android
 * version has a switch; any other opens its GitHub page.
 */
// Built in code by its page host, with English text like every Spicetify page.
@SuppressLint({"ViewConstructor", "SetTextI18n"})
final class MarketplaceSettings extends LinearLayout {
    // The network and threads behind the page. Tests replace them, as they replace SpotifyRestart.terminate.
    static Marketplace.Fetcher fetcher = Marketplace.HTTP;
    static Executor loads = pool("Spicetify Marketplace", 1);
    static Executor downloads = pool("Spicetify theme download", 1);
    /** The manifest and color.ini requests of a load. */
    static Executor requests = pool("Spicetify Marketplace requests", 4);
    /** One for the process, so reopening the Marketplace shows the previews it already has. */
    static PreviewImages previews = new PreviewImages(PreviewImages.HTTP, pool("Spicetify previews", 2));
    /** Background images, which download whole, under the same 8 MB cap as previews. */
    static PreviewImages.Downloader backgrounds = PreviewImages.HTTP;
    /** The load in flight, which a page opened while it runs takes over; main thread only. */
    static Load running;
    private static final Handler MAIN = new Handler(Looper.getMainLooper());
    /**
     * A theme's own image smaller than this on either side is a texture tile, like Spotify Dark's
     * 70x70 ones, not a background; the real ones start at Galaxy's 1200x675.
     */
    private static final int MIN_BACKGROUND_PX = 480;

    private final SpicetifySettingsScreen screen;
    private final MarketplaceLoader loader;
    private final Adapter adapter = new Adapter();
    private final TextView themesTab;
    private final TextView extensionsTab;
    private final EditText search;
    private final TextView status;
    private final Button refresh;
    private final ListView list;
    /** The Extensions tab is showing. */
    private boolean extensions;
    /** Themes and extensions. */
    private List<Marketplace.Theme> themes = Collections.emptyList();
    private String error;
    /** From the start of a load until its last call. */
    private boolean loading;
    /** Set when a load starts with a list on screen: that list stays until the load is done. */
    private boolean keepList;
    /** The theme whose color.ini is downloading, or null. */
    private Marketplace.Theme downloading;

    /**
     * A load and the page it reports to. A page closed during the load lets go of it, so the load
     * never holds a closed page, and a page opened during it takes it over and shows its last list.
     */
    static final class Load implements MarketplaceLoader.Listener {
        private MarketplaceSettings page;
        private List<Marketplace.Theme> last;

        @Override public void onThemes(List<Marketplace.Theme> themes, boolean done) {
            MAIN.post(() -> {
                last = themes;
                if (done && running == this) running = null;
                if (page != null) page.showThemes(themes, done);
            });
        }

        @Override public void onError(String message) {
            MAIN.post(() -> {
                if (running == this) running = null;
                if (page != null) page.showError(message);
            });
        }
    }

    MarketplaceSettings(SpicetifySettingsScreen screen, boolean extensions) {
        super(screen);
        this.screen = screen;
        setOrientation(VERTICAL);
        // With the extensions patch, a file of its own, so a list cached without extensions can't hide
        // them; without it, the themes-only file of earlier versions. Never the file the
        // IPedrax/spicetify-android fork kept.
        boolean listsExtensions = InstalledPatches.extensions();
        loader = new MarketplaceLoader(fetcher, requests, new File(screen.getCacheDir(),
                listsExtensions ? "spicetify_marketplace_listing.json" : "spicetify_marketplace_themes.json"),
                System::currentTimeMillis);

        LinearLayout tabs = new LinearLayout(screen);
        tabs.setPadding(dp(16), dp(8), dp(16), 0);
        themesTab = tab(tabs, "Themes", false);
        extensionsTab = tab(tabs, "Extensions", true);
        // Without the extensions patch, the page lists themes alone, as it did before.
        tabs.setVisibility(listsExtensions ? VISIBLE : GONE);
        addView(tabs, new LayoutParams(LayoutParams.MATCH_PARENT, LayoutParams.WRAP_CONTENT));

        search = new EditText(screen);
        search.setSingleLine(true);
        search.setInputType(InputType.TYPE_CLASS_TEXT);
        SpotifyStyle.style(search);
        search.setTypeface(SpotifyStyle.font(screen, SpotifyStyle.Font.REGULAR));
        Drawable magnifier = SpotifyStyle.icon(screen, "encore_icon_search_16");
        if (magnifier != null) {
            search.setCompoundDrawablesRelativeWithIntrinsicBounds(magnifier, null, null, null);
            search.setCompoundDrawablePadding(dp(8));
        }
        search.addTextChangedListener(new TextWatcher() {
            @Override public void beforeTextChanged(CharSequence text, int start, int count, int after) {}
            @Override public void onTextChanged(CharSequence text, int start, int before, int count) { show(); }
            @Override public void afterTextChanged(Editable text) {}
        });
        LayoutParams searchParams = new LayoutParams(LayoutParams.MATCH_PARENT, LayoutParams.WRAP_CONTENT);
        searchParams.setMargins(dp(16), dp(8), dp(16), 0);
        addView(search, searchParams);

        // What the page is doing, and Refresh, which also tries again after a failure.
        LinearLayout bar = new LinearLayout(screen);
        bar.setGravity(Gravity.CENTER_VERTICAL | Gravity.END);
        bar.setPadding(dp(16), 0, dp(16), 0);
        status = SpotifyStyle.body(screen, "");
        status.setAccessibilityLiveRegion(ACCESSIBILITY_LIVE_REGION_POLITE);
        bar.addView(status, new LayoutParams(0, LayoutParams.WRAP_CONTENT, 1));
        refresh = new Button(screen);
        SpotifyStyle.style(refresh, false);
        refresh.setOnClickListener(view -> load(true));
        LayoutParams refreshParams = new LayoutParams(LayoutParams.WRAP_CONTENT, dp(48));
        refreshParams.setMargins(dp(12), dp(8), 0, dp(8));
        bar.addView(refresh, refreshParams);
        addView(bar, new LayoutParams(LayoutParams.MATCH_PARENT, LayoutParams.WRAP_CONTENT));

        list = new ListView(screen);
        list.setDivider(null);
        list.setSelector(android.R.color.transparent);
        list.setClipToPadding(false);
        list.setPadding(0, 0, 0, dp(24));
        list.setAdapter(adapter);
        list.setOnItemClickListener((parent, view, position, id) -> open(adapter.getItem(position)));
        addView(list, new LayoutParams(LayoutParams.MATCH_PARENT, 0, 1));

        select(extensions);
        load(false);
    }

    /** A tab like Spotify's filter chips. */
    private TextView tab(LinearLayout tabs, String label, boolean extensions) {
        TextView tab = SpotifyStyle.text(screen, label, 14, Color.WHITE, SpotifyStyle.Font.REGULAR);
        tab.setGravity(Gravity.CENTER);
        tab.setMinHeight(dp(32));
        tab.setPadding(dp(16), 0, dp(16), 0);
        tab.setOnClickListener(view -> select(extensions));
        LayoutParams params = new LayoutParams(LayoutParams.WRAP_CONTENT, LayoutParams.WRAP_CONTENT);
        params.setMarginEnd(dp(8));
        tabs.addView(tab, params);
        return tab;
    }

    /** Shows the Extensions tab, or the Themes tab, from the top. */
    private void select(boolean extensions) {
        this.extensions = extensions;
        for (TextView tab : new TextView[] {themesTab, extensionsTab}) {
            boolean selected = (tab == extensionsTab) == extensions;
            GradientDrawable chip = new GradientDrawable();
            chip.setCornerRadius(dp(16));
            chip.setColor(selected ? SpotifyStyle.accent() : SpotifyStyle.field());
            tab.setBackground(chip);
            tab.setTextColor(selected ? SpotifyStyle.onColor(SpotifyStyle.accent()) : Color.WHITE);
            tab.setSelected(selected);
        }
        search.setHint(extensions ? "Search extensions" : "Search themes");
        show();
        list.setSelection(0);
    }

    /** Named threads that end after a minute idle, so a closed Marketplace leaves none behind. */
    private static ThreadPoolExecutor pool(String name, int threads) {
        ThreadPoolExecutor pool = new ThreadPoolExecutor(threads, threads, 1, TimeUnit.MINUTES,
                new LinkedBlockingQueue<>(), task -> new Thread(task, name));
        pool.allowCoreThreadTimeOut(true);
        return pool;
    }

    /**
     * Starts a load, from the cache when it's fresh unless {@code fresh}, or takes over the load in
     * flight. Does nothing while this page is loading.
     */
    private void load(boolean fresh) {
        if (loading) return;
        loading = true;
        error = null;
        keepList = !themes.isEmpty();
        show();
        if (running != null) {
            // A page closed while its load ran: this one takes it over, with the list it has so far.
            running.page = this;
            if (running.last != null) showThemes(running.last, false);
            return;
        }
        Load load = new Load();
        load.page = this;
        // A page that takes over this refresh keeps showing this list until the refresh is done.
        if (keepList) load.last = themes;
        running = load;
        // Through a local, so the task holds the loader and not this page.
        MarketplaceLoader loader = this.loader;
        loads.execute(() -> loader.load(fresh, load));
    }

    private void showThemes(List<Marketplace.Theme> found, boolean done) {
        if (done || !keepList) themes = found;
        if (done) loading = false;
        show();
    }

    private void showError(String message) {
        error = message;
        loading = false;
        show();
    }

    /**
     * Lists the tab's items that match the search, Galaxy V2 above the themes where themes apply and
     * Android's own extensions above the others, and says what the page is doing.
     */
    private void show() {
        List<Marketplace.Theme> found = new ArrayList<>();
        for (Marketplace.Theme item : themes) if ((item.extension != null) == extensions) found.add(item);
        List<Marketplace.Theme> listed = new ArrayList<>(found.size() + 1);
        if (!extensions && themesApply()) listed.add(Marketplace.GALAXY_V2);
        if (extensions) for (String id : Extensions.androidOnly()) listed.add(androidOnly(id));
        listed.addAll(found);
        List<Marketplace.Theme> shown = Marketplace.filter(listed, search.getText().toString());
        adapter.setThemes(shown);
        String kind = extensions ? "extensions" : "themes";
        String message = downloading != null ? "Downloading " + downloading.title + "…"
                : loading ? "Loading " + kind + "…"
                : error != null ? error
                : found.isEmpty() ? "No " + kind + " found"
                : shown.isEmpty() ? "No " + kind + " match"
                : null;
        status.setText(message);
        status.setVisibility(message == null ? GONE : VISIBLE);
        refresh.setText(error != null ? "Retry" : "Refresh");
        refresh.setVisibility(loading ? GONE : VISIBLE);
    }

    /** An extension only Android has, as an item of the Extensions tab: its {@code extension} is its id. */
    private static Marketplace.Theme androidOnly(String id) {
        return new Marketplace.Theme(Extensions.title(id), Extensions.description(id), "Spicetify", null, null, null, -1, -1,
                Collections.emptyList(), null, null, Collections.emptyList(), id);
    }

    /** Whether a theme can apply here: Theme colors is installed, on Android 11 or later. */
    private static boolean themesApply() {
        return InstalledPatches.themeColors() && ThemeRuntime.supported();
    }

    /** Why a theme can't apply here, for its card; null when it can. */
    private static String themesNeed() {
        return !InstalledPatches.themeColors() ? "Needs the Theme colors patch"
                : !ThemeRuntime.supported() ? "Themes need Android 11 or later" : null;
    }

    /** An extension with an Android version turns on or off; any other opens its GitHub page. */
    private void openExtension(Marketplace.Theme extension, Switch toggle) {
        if (toggle.getVisibility() == VISIBLE) {
            toggle.toggle();
            return;
        }
        try {
            screen.startActivity(new Intent(Intent.ACTION_VIEW, Uri.parse(extension.repoUrl)));
        } catch (ActivityNotFoundException noBrowser) {
            new SpotifySheet(screen, "Couldn't open GitHub", "Nothing on this phone opens " + extension.repoUrl + ".")
                    .primary("OK", () -> true).show();
        }
    }

    /** Downloads a theme's color.ini on its own thread, one theme at a time, so a tap never waits for a load. */
    private void open(Marketplace.Theme theme) {
        if (downloading != null || !themesApply()) return;
        downloading = theme;
        show();
        downloads.execute(() -> {
            Runnable result = download(theme);
            post(() -> {
                downloading = null;
                show();
                // Nothing to show once the Marketplace is closed.
                if (isAttachedToWindow()) result.run();
            });
        });
    }

    /**
     * Reads a theme's color.ini on the download thread, then the background image it comes with or
     * shows on desktop, if any, and returns what to show for it: its schemes Spotify can use, or why
     * they can't apply. Never throws. An image that fails to download or decode stops the theme from
     * applying, as a color.ini that fails does.
     */
    private Runnable download(Marketplace.Theme theme) {
        try {
            Map<String, ThemeState.Selection> schemes = Marketplace.schemes(theme.title, fetcher.get(theme.schemesUrl));
            if (schemes.isEmpty()) return () -> problem(theme.title + " has no colors Spotify can use.");
            byte[] image;
            try {
                // Galaxy V2's image is the point of it; another theme's is the one it shows on desktop, if any.
                byte[] found = theme.backgroundUrl != null ? backgrounds.get(theme.backgroundUrl) : ownImage(theme);
                // At about screen size, here, off the main thread, so Spotify's start only reads that.
                image = found == null ? null : ThemeBackground.fit(screen, found);
            } catch (Exception | OutOfMemoryError e) {
                // Exception: Base64 throws IllegalArgumentException for a data URI that isn't one. Nothing
                // applies, so the theme in use and its image stay.
                Log.w("Spicetify", "Marketplace background image failed for " + theme.title, e);
                String reason = imageProblem(e);
                return () -> problem("Couldn't load " + theme.title + "'s background image: " + reason);
            }
            byte[] background = image;
            return () -> choose(theme, schemes, background);
        } catch (FileNotFoundException | ThemeException missing) {
            return () -> problem(theme.title + " has no color schemes to use on Android.");
        } catch (Throwable e) {
            // Anything that escapes a pool thread ends Spotify's process.
            Log.w("Spicetify", "Marketplace theme download failed: " + theme.schemesUrl, e);
            String reason = e instanceof Marketplace.RateLimitException
                    ? MarketplaceLoader.RATE_LIMITED : MarketplaceLoader.describe(e);
            return () -> problem("Couldn't download " + theme.title + ": " + reason);
        }
    }

    /** Why an image couldn't be had, in words for the "Theme not applied" sheet. */
    private static String imageProblem(Throwable e) {
        if (e instanceof Marketplace.RateLimitException) return MarketplaceLoader.RATE_LIMITED;
        if (e instanceof OutOfMemoryError) return "It's too large to load.";
        return MarketplaceLoader.describe(e);
    }

    /**
     * The image a theme shows on desktop: the first its include scripts name, in manifest order, then
     * its user.css's. Null when none does, when a file isn't there (a 404), or when the image is a
     * texture tile rather than a background. Any other failure, such as a timeout, GitHub's rate limit
     * or bytes Android can't read, throws.
     */
    private static byte[] ownImage(Marketplace.Theme theme) throws IOException {
        String url = null;
        for (int i = 0; url == null && i < theme.includeUrls.size(); i++) {
            String js = text(theme.includeUrls.get(i));
            if (js != null) url = ThemeImages.fromJs(js);
        }
        if (url == null && theme.usercssUrl != null) {
            String css = text(theme.usercssUrl);
            if (css != null) url = ThemeImages.fromCss(css, theme.usercssUrl);
        }
        if (url == null) return null;
        byte[] image;
        if (url.startsWith("data:")) {
            image = Base64.decode(url.substring(url.indexOf(',') + 1), Base64.DEFAULT);
        } else {
            try {
                image = backgrounds.get(url);
            } catch (FileNotFoundException gone) {
                return null;
            }
        }
        BitmapFactory.Options bounds = ThemeBackground.bounds(image);
        if (bounds.outWidth >= MIN_BACKGROUND_PX && bounds.outHeight >= MIN_BACKGROUND_PX) return image;
        Log.i("Spicetify", theme.title + "'s " + bounds.outWidth + "x" + bounds.outHeight
                + " image is a texture tile, not a background");
        return null;
    }

    /** A script or stylesheet to look for an image in; null when it isn't there. Other failures throw. */
    private static String text(String url) throws IOException {
        try {
            return fetcher.get(url);
        } catch (FileNotFoundException gone) {
            return null;
        }
    }

    /**
     * Applies a theme's only scheme, or asks which one in a sheet that shows each one's colors, with
     * the theme's background image, or none.
     */
    private void choose(Marketplace.Theme theme, Map<String, ThemeState.Selection> schemes, byte[] image) {
        if (schemes.size() == 1) {
            apply(schemes.values().iterator().next(), image);
            return;
        }
        SpotifySheet sheet = new SpotifySheet(screen, theme.title, "Choose a color scheme.");
        LinearLayout rows = SpotifyStyle.column(screen);
        for (Map.Entry<String, ThemeState.Selection> scheme : schemes.entrySet()) {
            SpotifyStyle.themeRow(rows, scheme.getKey(), null, ThemeSettings.colors(screen, scheme.getValue()), false, view -> {
                sheet.dismiss();
                apply(scheme.getValue(), image);
            });
        }
        ScrollView scroll = new ScrollView(screen);
        scroll.addView(rows);
        sheet.view(scroll).secondary("Cancel");
        // Some themes have dozens of schemes, so the list scrolls within half the screen.
        int half = getResources().getDisplayMetrics().heightPixels / 2;
        if (schemes.size() * dp(64) > half) scroll.getLayoutParams().height = half;
        sheet.show();
    }

    /** Applies a scheme as Appearance applies a theme: the restart prompt, or why it can't. */
    private void apply(ThemeState.Selection scheme, byte[] image) {
        ThemeSettings.apply(screen, scheme.label, scheme, image);
    }

    private void problem(String message) {
        new SpotifySheet(screen, "Theme not applied", message).primary("OK", () -> true).show();
    }

    @Override protected void onDetachedFromWindow() {
        // The load in flight lets go of this page, and previews still queued are for rows nobody will see.
        if (running != null && running.page == this) running.page = null;
        previews.cancelQueued();
        super.onDetachedFromWindow();
    }

    private int dp(int value) {
        return SpotifyStyle.dp(getContext(), value);
    }

    private final class Adapter extends BaseAdapter {
        private List<Marketplace.Theme> shown = Collections.emptyList();

        void setThemes(List<Marketplace.Theme> themes) {
            shown = themes;
            notifyDataSetChanged();
        }

        @Override public int getCount() { return shown.size(); }
        @Override public Marketplace.Theme getItem(int position) { return shown.get(position); }
        @Override public long getItemId(int position) { return position; }
        @Override public int getViewTypeCount() { return 2; }
        @Override public int getItemViewType(int position) { return shown.get(position).extension != null ? 1 : 0; }
        /** A theme card can't be tapped where themes don't apply; an extension row handles its own taps. */
        @Override public boolean isEnabled(int position) { return shown.get(position).extension == null && themesApply(); }
        @Override public boolean areAllItemsEnabled() { return false; }

        @Override public View getView(int position, View reusable, ViewGroup parent) {
            Marketplace.Theme item = shown.get(position);
            if (item.extension != null) {
                ExtensionRow row = reusable == null ? new ExtensionRow() : (ExtensionRow) reusable.getTag();
                row.bind(item);
                return row.view;
            }
            Card card = reusable == null ? new Card() : (Card) reusable.getTag();
            // Galaxy V2's stars aren't known.
            String stars = item.stars < 0 ? null : item.stars + (item.stars == 1 ? " star" : " stars");
            String need = themesNeed();
            card.title.setText(item.title);
            card.byline.setText(need != null ? need : stars == null ? item.author : item.author + " • " + stars);
            card.description.setText(item.description);
            card.view.setContentDescription(item.title + ", "
                    + (need != null ? need : item.author + (stars == null ? "" : ", " + stars)));
            previews.load(item.previewUrl, card.preview, getResources().getDisplayMetrics().widthPixels);
            return card.view;
        }
    }

    /**
     * An extension as one of the settings rows: a port has a switch, which the extensions patch
     * enables, and any other extension says it's desktop only and opens its GitHub page.
     */
    private final class ExtensionRow {
        final LinearLayout view = SpotifyStyle.row(getContext());
        final TextView title = SpotifyStyle.text(getContext(), "", 17, Color.WHITE, SpotifyStyle.Font.REGULAR);
        final TextView description = SpotifyStyle.text(getContext(), "", 14, SpotifyStyle.SUBDUED, SpotifyStyle.Font.REGULAR);
        final Switch toggle = new Switch(getContext());

        ExtensionRow() {
            LinearLayout labels = SpotifyStyle.column(getContext());
            labels.addView(title);
            description.setPadding(0, dp(4), 0, 0);
            labels.addView(description);
            LayoutParams labelParams = new LayoutParams(0, LayoutParams.WRAP_CONTENT, 1);
            labelParams.setMarginEnd(dp(16));
            view.addView(labels, labelParams);
            SpotifyStyle.style(toggle);
            view.addView(toggle, new LayoutParams(LayoutParams.WRAP_CONTENT, LayoutParams.WRAP_CONTENT));
            view.setTag(this);
        }

        void bind(Marketplace.Theme extension) {
            String port = Extensions.androidOnly().contains(extension.extension) ? extension.extension
                    : Extensions.port(extension.extension);
            String name = port != null ? Extensions.title(port) : extension.title;
            String about = port == null ? "Desktop only" + (extension.description.isEmpty() ? "" : " • " + extension.description)
                    : Extensions.description(port);
            title.setText(name);
            description.setText(about);
            toggle.setOnCheckedChangeListener(null); // a reused row's switch still has its last extension's listener
            toggle.setVisibility(port == null ? GONE : VISIBLE);
            if (port != null) {
                toggle.setChecked(Extensions.isOn(screen, port));
                toggle.setContentDescription(name + ". " + about);
                toggle.setOnCheckedChangeListener((button, on) -> Extensions.setOn(screen, port, on));
            }
            // As on a settings page, the switch speaks for a port's row; any other row is a link.
            view.setImportantForAccessibility(port == null ? IMPORTANT_FOR_ACCESSIBILITY_YES : IMPORTANT_FOR_ACCESSIBILITY_NO);
            view.setContentDescription(port == null ? name + ", " + about : null);
            view.setOnClickListener(row -> openExtension(extension, toggle));
        }
    }

    /** A theme's card: its preview, then its title, author and stars, and description, in the page's type. */
    private final class Card {
        final LinearLayout view = SpotifyStyle.column(getContext());
        final ImageView preview = new ImageView(getContext());
        final TextView title;
        final TextView byline;
        final TextView description;

        Card() {
            Context context = getContext();
            view.setPadding(dp(16), dp(12), dp(16), dp(12));
            view.setBackground(SpotifyStyle.selectable(context, false));
            GradientDrawable placeholder = new GradientDrawable();
            placeholder.setColor(SpotifyStyle.elevated());
            placeholder.setCornerRadius(dp(8));
            preview.setBackground(placeholder);
            preview.setClipToOutline(true);
            preview.setScaleType(ImageView.ScaleType.CENTER_CROP);
            preview.setImportantForAccessibility(IMPORTANT_FOR_ACCESSIBILITY_NO);
            LayoutParams previewParams = new LayoutParams(LayoutParams.MATCH_PARENT, dp(180));
            previewParams.bottomMargin = dp(12);
            view.addView(preview, previewParams);
            title = line(context, 17, Color.WHITE, 1);
            byline = line(context, 14, SpotifyStyle.SUBDUED, 1);
            byline.setPadding(0, dp(4), 0, 0);
            description = line(context, 14, SpotifyStyle.SUBDUED, 2);
            description.setPadding(0, dp(4), 0, 0);
            view.setTag(this);
        }

        private TextView line(Context context, int size, int color, int lines) {
            TextView text = SpotifyStyle.text(context, "", size, color, SpotifyStyle.Font.REGULAR);
            text.setMaxLines(lines);
            text.setEllipsize(TextUtils.TruncateAt.END);
            view.addView(text);
            return text;
        }
    }
}
