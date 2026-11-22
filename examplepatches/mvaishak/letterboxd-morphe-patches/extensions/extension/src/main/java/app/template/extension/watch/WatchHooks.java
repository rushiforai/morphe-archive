package app.template.extension.watch;

import android.os.Bundle;
import android.content.Context;
import android.content.ComponentName;
import android.content.pm.PackageManager;
import android.util.LruCache;
import android.view.View;

import androidx.fragment.app.Fragment;

import java.net.URL;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import static app.template.extension.watch.WatchAvailability.Film;

public final class WatchHooks {
    private static final String SAVED_FILM = "morphe.watch.film";
    private static final LruCache<String, Film> FILMS = new LruCache<>(16);
    private static final Pattern IMDB = Pattern.compile("/title/(tt[0-9]+)(?:/|$)");
    private static final Pattern TMDB = Pattern.compile("/movie/([0-9]+)(?:[-/]|$)");

    private WatchHooks() {}

    public static void resume(Context context) {
        if (!WatchAlerts.prefs(context).getAll().isEmpty()) WatchAlerts.schedule(context);
    }

    public static void restoreSchedule(Context context) {
        try {
            context.getPackageManager().getServiceInfo(new ComponentName(context, WatchAlertJob.class), 0);
        } catch (PackageManager.NameNotFoundException ignored) {
            // The saved alerts will be scheduled when Where to Watch is installed.
            return;
        }
        if (!WatchAlerts.schedule(context)) throw new IllegalStateException("Couldn’t schedule streaming alerts");
    }

    public static void bindRow(View row, Object stockFilm) {
        Film film = film(stockFilm);
        if (film == null) return;
        FILMS.put(film.id(), film);
        WatchScreen.attachRow(row, film);
        RatingsRow.bind(row, film);
    }

    public static boolean bindDetail(Fragment fragment, View root, String filmId) {
        Film film = filmId == null ? null : FILMS.get(filmId);
        Bundle args = fragment.getArguments();
        if (args != null) {
            if (film != null) {
                Bundle saved = new Bundle();
                saved.putString("id", film.id());
                saved.putString("title", film.title());
                saved.putInt("year", film.year());
                saved.putString("imdb", film.imdb());
                saved.putString("tmdb", film.tmdb());
                saved.putString("justWatch", film.justWatch());
                args.putBundle(SAVED_FILM, saved);
            } else {
                Bundle saved = args.getBundle(SAVED_FILM);
                if (saved != null && filmId != null && filmId.equals(saved.getString("id"))) {
                    film = new Film(filmId, saved.getString("title", ""), saved.getInt("year"),
                            saved.getString("imdb"), saved.getString("tmdb"), saved.getString("justWatch"));
                }
            }
        }
        return WatchScreen.attachDetail(fragment, root, film);
    }

    private static Film film(Object stockFilm) {
        if (stockFilm == null) return null;
        String id = (String) call(stockFilm, "getId");
        String title = (String) call(stockFilm, "getName");
        Object year = call(stockFilm, "getReleaseYear");
        if (id == null || title == null || title.isEmpty()) return null;
        String imdb = null;
        String tmdb = null;
        String justWatch = null;
        Object links = call(stockFilm, "getLinks");
        if (links instanceof Iterable) {
            for (Object link : (Iterable<?>) links) {
                Object type = call(link, "getType");
                Object value = call(link, "getUrl");
                if (type == null || !(value instanceof URL)) continue;
                URL url = (URL) value;
                switch (type.getClass().getSimpleName()) {
                    case "Imdb":
                        imdb = match(IMDB, url);
                        break;
                    case "Tmdb":
                        tmdb = match(TMDB, url);
                        break;
                    case "Justwatch":
                        justWatch = url.toString();
                        break;
                    default:
                        break;
                }
            }
        }
        return new Film(id, title, year instanceof Integer ? (int) year : 0, imdb, tmdb, justWatch);
    }

    private static String match(Pattern pattern, URL url) {
        Matcher matcher = pattern.matcher(url.getPath());
        return matcher.find() ? matcher.group(1) : null;
    }

    private static Object call(Object receiver, String method) {
        if (receiver == null) return null;
        try {
            return receiver.getClass().getMethod(method).invoke(receiver);
        } catch (ReflectiveOperationException ignored) {
            return null;
        }
    }
}
