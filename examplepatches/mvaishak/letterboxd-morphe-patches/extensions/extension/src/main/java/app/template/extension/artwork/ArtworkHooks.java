package app.template.extension.artwork;

import android.content.Context;
import android.os.Handler;
import android.os.Looper;
import android.view.View;
import android.widget.Button;
import android.widget.ImageView;

import androidx.fragment.app.DialogFragment;
import androidx.fragment.app.Fragment;

import app.template.extension.artwork.ArtworkStore.Film;
import app.template.extension.artwork.ArtworkStore.Type;
import app.template.extension.settings.ArtworkUi;
import app.template.extension.settings.Prefs;

import java.lang.ref.WeakReference;
import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.net.URL;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.WeakHashMap;

/** Adapts the pinned Letterboxd models without mutating objects used by its API layer. */
public final class ArtworkHooks {
    private static final String MODEL = "com.letterboxd.api.model.";
    private static final String MEMBER_MANAGER = "com.letterboxd.letterboxd.services.CurrentMemberManager";
    private static final Map<View, PosterBinding> POSTERS = new WeakHashMap<>();
    private static final Map<View, Header> FILM_POSTERS = new WeakHashMap<>();
    private static final Map<View, Header> FILM_BACKDROPS = new WeakHashMap<>();
    private static final Map<View, Header> PROFILES = new WeakHashMap<>();
    private static final Map<String, Film> RECENT = new LinkedHashMap<>(24, 0.75f, true);
    private static final Handler MAIN = new Handler(Looper.getMainLooper());

    private static ArtworkStore store;
    private static Boolean preferNativeArtwork;

    private ArtworkHooks() {}

    public static void initialize(Context context) {
        store = new ArtworkStore(context.getApplicationContext());
    }

    public static boolean available() {
        return store != null;
    }

    public static boolean localEnabled() {
        if (store == null) return false;
        String mode = Prefs.getString(Prefs.KEY_ARTWORK_MODE, "automatic");
        return ArtworkRules.useLocalArtwork(mode, "automatic".equals(mode) && prefersNativeArtwork());
    }

    private static boolean prefersNativeArtwork() {
        if (preferNativeArtwork == null) {
            Object manager = memberManager();
            Object member = call(manager, "getCurrentMemberAccount");
            if (manager == null) return true;
            if (member == null) {
                // A persisted sign-in can precede the loaded account. Wait for its capabilities.
                return account() != null;
            }
            preferNativeArtwork = Boolean.TRUE.equals(call(member, "getCanHaveCustomPosters"))
                    || Boolean.TRUE.equals(call(member, "getCanHaveCustomBackdrops"));
        }
        return preferNativeArtwork;
    }

    private static String filmUrl(String id, Type type) {
        return localEnabled() ? store.url(id, type) : null;
    }

    private static String profileUrl(String viewed) {
        return localEnabled() && ArtworkRules.ownsProfile(viewed, account()) ? store.profile(viewed) : null;
    }

    public static Object boundPoster(View view, Object state) {
        Object original = call(state, "getPoster");
        Object summary = call(call(state, "getFilmContext"), "getFilmSummary");
        String id = id(summary);
        if (id == null || store == null) {
            POSTERS.remove(view);
            return original;
        }
        String url = filmUrl(id, Type.POSTER);
        POSTERS.put(view, new PosterBinding(id, url));
        return image(original, url, Type.POSTER, false);
    }

    public static void rebindPoster(View view, Object filmContext) {
        PosterBinding old = POSTERS.get(view);
        if (old == null || filmContext == null) return;
        String next = id(call(filmContext, "getFilmSummary"));
        if (equal(old.id, next)) return;
        POSTERS.remove(view);
        if (old.url != null || filmUrl(next, Type.POSTER) != null) {
            Object target = field(view, "imageView");
            if (target instanceof ImageView) ArtworkImages.clear((ImageView) target);
        }
    }

    /** Both native zoom-viewer builders call this before selecting their display URL. */
    public static Object viewerPoster(Object summary) {
        Object original = call(summary, "getPoster");
        return image(original, filmUrl(id(summary), Type.POSTER), Type.POSTER, true);
    }

    public static void viewerLoad(Object request, ImageView view) {
        if (!localEnabled()) return;
        try {
            if (view != null) view.setContentDescription("Enlarged poster");
            ArtworkImages.feedback(request, success -> {
                if (view != null && !success) view.setContentDescription("Poster failed to load");
            });
        } catch (ReflectiveOperationException ignored) {
            // Glide still loads the request even when error styling is unavailable.
        }
    }

    public static Object headerPoster(Fragment fragment, Object binding, Object model, Object original) {
        Object poster = field(binding, "posterImageView");
        if (!(poster instanceof View) || store == null) return original;
        View view = (View) poster;
        String id = id(model);
        String url = filmUrl(id, Type.POSTER);
        Header old = FILM_POSTERS.put(view, new Header(fragment, binding, model, id, url));
        if (url != null || (old != null && old.url != null && original != null)) {
            view.setVisibility(View.VISIBLE);
        }
        return image(original, url, Type.POSTER, false);
    }

    public static Object filmBackdrop(Fragment fragment, Object binding, Object model, Object original) {
        Object target = field(binding, "headerImageView");
        if (!(target instanceof ImageView) || store == null) return original;
        ImageView view = (ImageView) target;
        String id = id(model);
        remember(metadata(model, original));
        String url = filmUrl(id, Type.BACKDROP);
        Header old = FILM_BACKDROPS.put(view, new Header(fragment, binding, model, id, url));
        if (old != null && (old.url != null || url != null)
                && (!equal(old.id, id) || !equal(old.url, url))) {
            disposeCoil(view);
            view.setImageDrawable(null);
        }
        return image(original, url, Type.BACKDROP, false);
    }

    public static Object profileBackdrop(Fragment fragment, String viewed, Object original,
                                          Object favorite, Object binding) {
        Object target = field(binding, "userBackdrop");
        if (!(target instanceof ImageView) || store == null) return original;
        ImageView view = (ImageView) target;
        String url = profileUrl(viewed);
        Header old = PROFILES.get(view);
        Header next = new Header(fragment, binding, original, viewed, url);
        next.favorite = favorite;
        next.minHeight = old != null && old.url != null ? old.minHeight : view.getMinimumHeight();
        next.maxHeight = old != null && old.url != null ? old.maxHeight : view.getMaxHeight();
        PROFILES.put(view, next);
        if (old != null && (old.url != null || url != null)
                && (!equal(old.id, viewed) || !equal(old.url, url))) {
            ArtworkImages.clear(view);
            if (original == null) {
                view.setMinimumHeight(old.minHeight);
                view.setMaxHeight(old.maxHeight);
            }
        }
        return image(original, url, Type.BACKDROP, false);
    }

    public static void filmAction(DialogFragment fragment) {
        if (!localEnabled()) return;
        Film film = filmForActions(fragment);
        Button button = actionButton(fragment, "buttonChangePoster");
        if (film == null || button == null) return;

        int label = button.getResources().getIdentifier(
                "change_poster_and_backdrop", "string", button.getContext().getPackageName());
        if (label != 0) button.setText(label);
        LocalArtworkBadge.mark(button);
        button.setOnClickListener(view -> {
            Context context = fragment.getActivity();
            if (context == null || !localEnabled()) return;
            fragment.dismissAllowingStateLoss();
            ArtworkUi.openFilm(context, film);
        });
        button.setVisibility(View.VISIBLE);
    }

    public static String imdbIdForFilm(Object film) {
        Film metadata = metadata(film, null);
        return metadata == null ? null : metadata.imdb;
    }

    private static Film filmForActions(DialogFragment fragment) {
        Object summary = call(fragment, "getFilmSummary");
        String id = id(summary);
        if (id == null) return null;
        Film cached = RECENT.get(id);
        return cached != null ? cached : metadata(summary, null);
    }

    public static void profileAction(DialogFragment fragment) {
        if (!localEnabled()) return;
        Button button = actionButton(fragment, "buttonChangeBackdrop");
        if (button == null) return;
        String viewed = id(call(fragment, "getMemberSummary"));
        if (!ArtworkRules.ownsProfile(viewed, account())) {
            button.setVisibility(View.GONE);
            return;
        }
        LocalArtworkBadge.mark(button);
        button.setOnClickListener(view -> {
            Context context = fragment.getActivity();
            if (context == null || !localEnabled() || !ArtworkRules.ownsProfile(viewed, account())) return;
            fragment.dismissAllowingStateLoss();
            ArtworkUi.openProfile(context, viewed);
        });
        button.setVisibility(View.VISIBLE);
    }

    public static void clearCache() {
        RECENT.clear();
    }

    public static String account() {
        Object value = call(memberManager(), "getMemberId");
        return value instanceof String && ArtworkRules.validId((String) value) ? (String) value : null;
    }

    private static Object memberManager() {
        try {
            return Class.forName(MEMBER_MANAGER).getField("INSTANCE").get(null);
        } catch (ReflectiveOperationException ignored) {
            return null;
        }
    }

    public static List<Film> recentFilms() {
        List<Film> films = new ArrayList<>(RECENT.values());
        java.util.Collections.reverse(films);
        return films;
    }

    public static void accountChanged() {
        MAIN.post(() -> {
            preferNativeArtwork = null;
            refreshArtwork();
        });
    }

    public static void refreshArtwork() {
        if (store == null) return;
        refreshFilm(null, null);
        refreshProfiles();
    }

    static void refreshFilm(String id, Type type) {
        if (type == null || type == Type.POSTER) {
            for (Map.Entry<View, Header> entry : new WeakHashMap<>(FILM_POSTERS).entrySet()) {
                Header header = entry.getValue();
                if (id == null || equal(id, header.id)) {
                    Object binding = header.binding.get();
                    Fragment fragment = header.fragment.get();
                    if (live(fragment, binding)
                            && !equal(header.url, filmUrl(header.id, Type.POSTER))) {
                        invokeDeclared(fragment, "configurePoster", header.model, binding);
                    }
                }
            }
            for (Map.Entry<View, PosterBinding> entry : new WeakHashMap<>(POSTERS).entrySet()) {
                View view = entry.getKey();
                PosterBinding poster = entry.getValue();
                if (view == null || !view.isAttachedToWindow() || (id != null && !id.equals(poster.id))
                        || equal(poster.url, filmUrl(poster.id, Type.POSTER))) continue;
                // Use the view's current StateFlow value. A recycled view may already be bound
                // to a different film while its collector still has the previous state.
                Object flow = field(view, "filmState");
                Object state = call(flow, "getValue");
                String current = id(call(call(state, "getFilmContext"), "getFilmSummary"));
                if (poster.id.equals(current)) invokeDeclared(view, "applyState", state);
            }
        }
        if (type == null || type == Type.BACKDROP) {
            for (Header header : new ArrayList<>(FILM_BACKDROPS.values())) {
                if (id != null && !equal(id, header.id)) continue;
                Fragment fragment = header.fragment.get();
                Object binding = header.binding.get();
                if (live(fragment, binding) && !equal(header.url, filmUrl(header.id, Type.BACKDROP))) {
                    invokeDeclared(fragment, "configureBackdrop", binding, header.model);
                }
            }
        }
    }

    static void refreshProfiles() {
        if (store == null) return;
        for (Header header : new ArrayList<>(PROFILES.values())) {
            Fragment fragment = header.fragment.get();
            Object binding = header.binding.get();
            String url = profileUrl(header.id);
            if (live(fragment, binding) && !equal(header.url, url)) {
                invokeDeclared(fragment, "configureBackdrop", header.id, header.model, header.favorite, binding);
            }
        }
    }

    private static boolean live(Fragment fragment, Object binding) {
        return fragment != null && fragment.getActivity() != null && fragment.getView() != null
                && binding != null && call(binding, "getRoot") == fragment.getView();
    }

    private static Object image(Object original, String url, Type type, boolean viewer) {
        if (url == null) return original;
        try {
            Class<?> size = Class.forName(MODEL + "ImageSize");
            Constructor<?> dimensions = size.getConstructor(int.class, int.class, URL.class);
            List<Object> sizes = new ArrayList<>();
            if (viewer) {
                sizes.add(dimensions.newInstance(4096, 6144, new URL(url)));
            } else if (type == Type.POSTER) {
                sizes.add(dimensions.newInstance(342, 513, new URL(TmdbClient.sized(url, "w342"))));
                sizes.add(dimensions.newInstance(780, 1170, new URL(TmdbClient.sized(url, "w780"))));
            } else {
                sizes.add(dimensions.newInstance(1280, 720, new URL(TmdbClient.sized(url, "w1280"))));
            }
            return Class.forName(MODEL + "Image").getConstructor(List.class).newInstance(sizes);
        } catch (Exception incompatible) {
            return original;
        }
    }

    private static Film metadata(Object film, Object backdrop) {
        String id = id(film);
        if (id == null) return null;
        String name = (String) call(film, "getName");
        Object year = call(film, "getReleaseYear");
        String imdb = null;
        String tmdb = null;
        Object links = call(film, "getLinks");
        if (links instanceof Iterable) {
            for (Object link : (Iterable<?>) links) {
                Object type = call(link, "getType");
                String kind = type == null ? "" : type.getClass().getSimpleName();
                String linkId = (String) call(link, "getId");
                Object value = call(link, "getUrl");
                URL url = value instanceof URL ? (URL) value : null;
                if ("Imdb".equals(kind)) {
                    if (linkId != null && linkId.matches("tt[0-9]{5,15}")) imdb = linkId;
                    else if (url != null) {
                        java.util.regex.Matcher match = java.util.regex.Pattern.compile("/title/(tt[0-9]+)").matcher(url.getPath());
                        if (match.find()) imdb = match.group(1);
                    }
                }
                if ("Tmdb".equals(kind) && url != null) {
                    java.util.regex.Matcher match = java.util.regex.Pattern.compile("/movie/([0-9]+)(?:[-/]|$)").matcher(url.getPath());
                    if (match.find()) tmdb = match.group(1);
                }
            }
        }
        String language = (String) call(call(film, "getOriginalLanguage"), "getCode");
        return new Film(id, name == null ? "" : name, year instanceof Integer ? (int) year : 0,
                imdb, tmdb, language, largestUrl(backdrop));
    }

    private static String largestUrl(Object image) {
        int max = 0;
        String result = null;
        Object sizes = call(image, "getSizes");
        if (!(sizes instanceof Iterable)) return null;
        for (Object size : (Iterable<?>) sizes) {
            Object width = call(size, "getWidth");
            Object url = call(size, "getUrl");
            if (width instanceof Integer && (int) width > max && url instanceof URL) {
                max = (int) width;
                result = ArtworkRules.imageUrl(url.toString());
            }
        }
        return result;
    }

    private static void remember(Film film) {
        if (film == null) return;
        RECENT.put(film.id, film);
        if (RECENT.size() > 24) RECENT.remove(RECENT.keySet().iterator().next());
    }

    private static String id(Object model) {
        Object value = call(model, "getId");
        return value instanceof String && ArtworkRules.validId((String) value) ? (String) value : null;
    }

    private static Button actionButton(DialogFragment fragment, String fieldName) {
        Object button = field(field(fragment, "binding"), fieldName);
        return button instanceof Button ? (Button) button : null;
    }

    private static void disposeCoil(View view) {
        try {
            Class.forName("coil.util.CoilUtils").getMethod("dispose", View.class).invoke(null, view);
        } catch (ReflectiveOperationException ignored) {
        }
    }

    private static boolean equal(Object first, Object second) {
        return java.util.Objects.equals(first, second);
    }

    static Object call(Object instance, String name) {
        if (instance == null) return null;
        try {
            Method method = instance.getClass().getMethod(name);
            method.setAccessible(true);
            return method.invoke(instance);
        } catch (ReflectiveOperationException ignored) {
            return invokeDeclared(instance, name);
        }
    }

    private static Object field(Object instance, String name) {
        if (instance == null) return null;
        try {
            Field field = instance.getClass().getDeclaredField(name);
            field.setAccessible(true);
            return field.get(instance);
        } catch (ReflectiveOperationException ignored) {
            return null;
        }
    }

    private static Object invokeDeclared(Object instance, String name, Object... arguments) {
        if (instance == null) return null;
        for (Method method : instance.getClass().getDeclaredMethods()) {
            if (!name.equals(method.getName()) || method.getParameterTypes().length != arguments.length) continue;
            try {
                method.setAccessible(true);
                return method.invoke(instance, arguments);
            } catch (ReflectiveOperationException | IllegalArgumentException ignored) {
                return null;
            }
        }
        return null;
    }

    private static final class PosterBinding {
        final String id;
        final String url;

        PosterBinding(String id, String url) {
            this.id = id;
            this.url = url;
        }
    }

    private static final class Header {
        final WeakReference<Fragment> fragment;
        final WeakReference<Object> binding;
        final Object model;
        final String id;
        final String url;
        Object favorite;
        int minHeight;
        int maxHeight;

        Header(Fragment fragment, Object binding, Object model, String id, String url) {
            this.fragment = new WeakReference<>(fragment);
            this.binding = new WeakReference<>(binding);
            this.model = model;
            this.id = id;
            this.url = url;
        }
    }
}
