package app.template.extension.artwork;

import android.content.Context;
import android.os.Handler;
import android.os.Looper;
import android.util.LruCache;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.TextView;

import androidx.fragment.app.Fragment;
import androidx.lifecycle.Lifecycle;
import androidx.lifecycle.LifecycleEventObserver;
import androidx.lifecycle.LifecycleOwner;

import app.template.extension.artwork.ArtworkStore.Film;
import app.template.extension.settings.Prefs;

import java.lang.ref.WeakReference;
import java.util.Objects;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.Future;

/** Replaces only the main title in the native film header. */
final class TitleLogo implements LifecycleEventObserver {
    private static final int BINDING_TAG = 0x7e000210;
    private static final ExecutorService NETWORK = Executors.newFixedThreadPool(2);
    private static final Handler MAIN = new Handler(Looper.getMainLooper());
    // An empty value records a successful lookup that returned no suitable logo.
    private static final LruCache<String, String> URLS = new LruCache<>(64);

    private final TextView title;
    private final Film film;
    private final Lifecycle lifecycle;
    private Future<?> lookup;
    private ImageView logo;
    private int generation;

    private TitleLogo(Fragment fragment, TextView title, Film film) {
        this.title = title;
        this.film = film;
        lifecycle = fragment.getViewLifecycleOwner().getLifecycle();
    }

    static void bind(Fragment fragment, TextView title, Film film) {
        TitleLogo previous = (TitleLogo) title.getTag(BINDING_TAG);
        if (previous != null) {
            if (film != null && previous.film.id.equals(film.id)
                    && Objects.equals(previous.film.tmdb, film.tmdb)
                    && Objects.equals(previous.film.imdb, film.imdb)) return;
            previous.dispose();
        }
        if (film == null || (film.tmdb == null && film.imdb == null) || fragment.getView() == null) return;
        TitleLogo binding = new TitleLogo(fragment, title, film);
        title.setTag(BINDING_TAG, binding);
        binding.lifecycle.addObserver(binding);
    }

    @Override public void onStateChanged(LifecycleOwner owner, Lifecycle.Event event) {
        if (event == Lifecycle.Event.ON_RESUME) load();
        else if (event == Lifecycle.Event.ON_PAUSE) reset();
        else if (event == Lifecycle.Event.ON_DESTROY) dispose();
    }

    private void load() {
        if (!Prefs.getBoolean(Prefs.KEY_TMDB_TITLE_LOGOS, false)) return;
        Context context = title.getContext().getApplicationContext();
        String language = title.getResources().getConfiguration().getLocales().get(0).getLanguage();
        WeakReference<TitleLogo> target = new WeakReference<>(this);
        Film movie = film;
        int request = generation;
        lookup = NETWORK.submit(() -> {
            if (Thread.currentThread().isInterrupted()) return;
            String key = TmdbCredential.get(context);
            if (key == null) return;
            String cacheKey = (movie.tmdb != null ? "tmdb:" + movie.tmdb : "imdb:" + movie.imdb) + ":" + language;
            String url = URLS.get(cacheKey);
            if (url == null) {
                try {
                    String found = new TmdbClient(key).titleLogo(movie, language);
                    url = found == null ? "" : found;
                    if (Thread.currentThread().isInterrupted()) return;
                    URLS.put(cacheKey, url);
                } catch (TmdbClient.Failure ignored) {
                    return;
                }
            }
            if (url.isEmpty() || Thread.currentThread().isInterrupted()) return;
            String result = url;
            MAIN.post(() -> {
                TitleLogo binding = target.get();
                if (binding != null && binding.generation == request
                        && binding.lifecycle.getCurrentState() == Lifecycle.State.RESUMED) {
                    binding.show(result);
                }
            });
        });
    }

    private void show(String url) {
        if (!(title.getParent() instanceof ViewGroup) || logo != null) return;
        ViewGroup parent = (ViewGroup) title.getParent();
        ImageView image = new ImageView(title.getContext());
        image.setScaleType(ImageView.ScaleType.FIT_START);
        image.setAccessibilityHeading(true);
        int height = Math.min(Math.round(title.getTextSize() * 1.8f),
                Math.round(88 * title.getResources().getDisplayMetrics().density));
        logo = image;
        ArtworkImages.load(image, url, 500, height, success -> MAIN.post(() -> {
            if (logo != image) return;
            if (!success || title.getParent() != parent) {
                reset();
                return;
            }
            image.setContentDescription(title.getText());
            parent.addView(image, parent.indexOfChild(title), new ViewGroup.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT, height));
            title.setVisibility(View.GONE);
        }));
    }

    private void reset() {
        generation++;
        if (lookup != null) {
            lookup.cancel(true);
            lookup = null;
        }
        if (logo != null) {
            ArtworkImages.clear(logo);
            if (logo.getParent() instanceof ViewGroup) ((ViewGroup) logo.getParent()).removeView(logo);
            logo = null;
            title.setVisibility(View.VISIBLE);
        }
    }

    private void dispose() {
        reset();
        lifecycle.removeObserver(this);
        title.setTag(BINDING_TAG, null);
    }
}
