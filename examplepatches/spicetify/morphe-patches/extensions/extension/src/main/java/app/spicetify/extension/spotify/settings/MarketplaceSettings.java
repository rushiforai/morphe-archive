package app.spicetify.extension.spotify.settings;

import android.annotation.SuppressLint;
import android.content.Context;
import android.graphics.BitmapFactory;
import android.graphics.Color;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.GradientDrawable;
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
import android.widget.TextView;
import app.spicetify.extension.spotify.theme.ThemeBackground;
import app.spicetify.extension.spotify.theme.ThemeException;
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
 * with their previews and a search. A tapped theme's color.ini downloads, with the background image
 * it shows on desktop, if any, and its color scheme, chosen in a sheet when there's more than one,
 * applies like a theme on Appearance.
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
    private final EditText search;
    private final TextView status;
    private final Button refresh;
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

    MarketplaceSettings(SpicetifySettingsScreen screen) {
        super(screen);
        this.screen = screen;
        setOrientation(VERTICAL);
        // Not the file the IPedrax/spicetify-android fork kept its themes and extensions in.
        loader = new MarketplaceLoader(fetcher, requests, new File(screen.getCacheDir(), "spicetify_marketplace_themes.json"),
                System::currentTimeMillis);

        search = new EditText(screen);
        search.setSingleLine(true);
        search.setHint("Search themes");
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

        ListView list = new ListView(screen);
        list.setDivider(null);
        list.setSelector(android.R.color.transparent);
        list.setClipToPadding(false);
        list.setPadding(0, 0, 0, dp(24));
        list.setAdapter(adapter);
        list.setOnItemClickListener((parent, view, position, id) -> open(adapter.getItem(position)));
        addView(list, new LayoutParams(LayoutParams.MATCH_PARENT, 0, 1));

        load(false);
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

    /** Lists the themes that match the search, Galaxy V2 above the rest, and says what the page is doing. */
    private void show() {
        List<Marketplace.Theme> listed = new ArrayList<>(themes.size() + 1);
        listed.add(Marketplace.GALAXY_V2);
        listed.addAll(themes);
        List<Marketplace.Theme> shown = Marketplace.filter(listed, search.getText().toString());
        adapter.setThemes(shown);
        String message = downloading != null ? "Downloading " + downloading.title + "…"
                : loading ? "Loading themes…"
                : error != null ? error
                : themes.isEmpty() ? "No themes found"
                : shown.isEmpty() ? "No themes match"
                : null;
        status.setText(message);
        status.setVisibility(message == null ? GONE : VISIBLE);
        refresh.setText(error != null ? "Retry" : "Refresh");
        refresh.setVisibility(loading ? GONE : VISIBLE);
    }

    /** Downloads a theme's color.ini on its own thread, one theme at a time, so a tap never waits for a load. */
    private void open(Marketplace.Theme theme) {
        if (downloading != null) return;
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

        @Override public View getView(int position, View reusable, ViewGroup parent) {
            Card card = reusable == null ? new Card() : (Card) reusable.getTag();
            Marketplace.Theme theme = shown.get(position);
            // Galaxy V2's stars aren't known.
            String stars = theme.stars < 0 ? null : theme.stars + (theme.stars == 1 ? " star" : " stars");
            card.title.setText(theme.title);
            card.byline.setText(stars == null ? theme.author : theme.author + " • " + stars);
            card.description.setText(theme.description);
            card.view.setContentDescription(theme.title + ", " + theme.author + (stars == null ? "" : ", " + stars));
            previews.load(theme.previewUrl, card.preview, getResources().getDisplayMetrics().widthPixels);
            return card.view;
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
