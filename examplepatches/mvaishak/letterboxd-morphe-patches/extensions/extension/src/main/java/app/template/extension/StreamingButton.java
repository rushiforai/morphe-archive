package app.template.extension;

import android.content.ActivityNotFoundException;
import android.content.Intent;
import android.content.res.ColorStateList;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.PixelFormat;
import android.graphics.drawable.Drawable;
import android.net.Uri;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewTreeObserver;

import androidx.fragment.app.Fragment;

import com.google.android.material.button.MaterialButton;

import app.template.extension.settings.AccentPresets;
import app.template.extension.settings.Prefs;

import java.lang.reflect.Method;
import java.util.List;
import java.util.WeakHashMap;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * "Open in player" — adds a small, icon-only button next to Trailer on a film's page that opens
 * the film in Stremio or Nuvio (Mod settings' "Streaming app" choice), tinted with the current
 * accent colour. Injected at the top of {@code FilmHeaderFragment.onViewCreated}.
 *
 * <p>Deliberately icon-only and compact: an earlier text-labelled version ("STREMIO" as a full
 * pill, matching trailer_button's width) overflowed that row on real devices — the row's width is
 * fixed by a `ConstraintLayout` guide (not `wrap_content`), so an extra wide sibling squeezed the
 * runtime-minutes text into a single-character-per-line wrap. A small icon button leaves that row
 * as close to its original footprint as possible.
 *
 * <p>The IMDb id comes from {@code FilmViewModel.getFilm()} (a {@code StateFlow<Film>}) — the
 * same model Letterboxd's own "View on IMDb" links use — via {@code Film.getLinks()}, all by
 * reflection since none of it is a stable public API. Film data loads asynchronously, so this is
 * reactive like "Hide ratings until watched": a layout listener retries until the film is loaded
 * (or errors), then gives up either way — no button appears if the title has no IMDb link.
 */
public final class StreamingButton {

    private static final String TAG = "morphe_streaming_button";
    private static final Pattern IMDB_ID = Pattern.compile("(tt\\d+)");

    private static final WeakHashMap<View, Boolean> ATTACHED = new WeakHashMap<>();

    private static Method mGetViewModel;
    private static Method mGetFilm;
    private static Method mGetValue;
    private static Method mGetLinks;
    private static Method mGetType;
    private static Method mGetUrl;

    private StreamingButton() {}

    public static void enforce(final Fragment fragment) {
        try {
            if (!Prefs.openInPlayer()) return;

            final View wrapper = fragment.getView();
            if (wrapper == null || Boolean.TRUE.equals(ATTACHED.get(wrapper))) return;
            ATTACHED.put(wrapper, Boolean.TRUE);

            final ViewTreeObserver.OnGlobalLayoutListener[] self =
                    new ViewTreeObserver.OnGlobalLayoutListener[1];
            self[0] = new ViewTreeObserver.OnGlobalLayoutListener() {
                @Override
                public void onGlobalLayout() {
                    View trailer = byId(wrapper, "trailer_button");
                    if (trailer == null || !(trailer.getParent() instanceof ViewGroup)) return;
                    ViewGroup row = (ViewGroup) trailer.getParent();
                    if (row.findViewWithTag(TAG) != null) {
                        detach(wrapper, self[0]);
                        return;
                    }

                    Object film;
                    try {
                        film = readFilm(fragment);
                    } catch (Throwable t) {
                        detach(wrapper, self[0]);
                        return;
                    }
                    if (film == null) return; // still loading — try again next layout pass

                    String imdbId = findImdbId(film);
                    if (imdbId != null) addButton(row, trailer, imdbId);
                    detach(wrapper, self[0]); // film resolved either way — nothing more to wait for
                }
            };
            wrapper.getViewTreeObserver().addOnGlobalLayoutListener(self[0]);
            self[0].onGlobalLayout();
        } catch (Throwable ignored) {
        }
    }

    private static void detach(View v, ViewTreeObserver.OnGlobalLayoutListener l) {
        try {
            ViewTreeObserver vto = v.getViewTreeObserver();
            if (vto.isAlive()) vto.removeOnGlobalLayoutListener(l);
        } catch (Throwable ignored) {
        }
    }

    // --- film / IMDb id -----------------------------------------------------

    private static Object readFilm(Fragment fragment) throws Exception {
        Class<?> fragClass = fragment.getClass();
        if (mGetViewModel == null) mGetViewModel = fragClass.getMethod("access$getViewModel", fragClass);
        Object viewModel = mGetViewModel.invoke(null, fragment);
        if (viewModel == null) return null;

        if (mGetFilm == null) mGetFilm = viewModel.getClass().getMethod("getFilm");
        Object stateFlow = mGetFilm.invoke(viewModel);
        if (stateFlow == null) return null;

        if (mGetValue == null) mGetValue = stateFlow.getClass().getMethod("getValue");
        return mGetValue.invoke(stateFlow);
    }

    private static String findImdbId(Object film) {
        try {
            if (mGetLinks == null) mGetLinks = film.getClass().getMethod("getLinks");
            Object linksObj = mGetLinks.invoke(film);
            if (!(linksObj instanceof List)) return null;

            for (Object link : (List<?>) linksObj) {
                if (mGetType == null) mGetType = link.getClass().getMethod("getType");
                Object type = mGetType.invoke(link);
                if (type == null || !"Imdb".equals(type.getClass().getSimpleName())) continue;

                if (mGetUrl == null) mGetUrl = link.getClass().getMethod("getUrl");
                Object url = mGetUrl.invoke(link);
                if (url == null) continue;
                Matcher m = IMDB_ID.matcher(url.toString());
                if (m.find()) return m.group(1);
            }
        } catch (Throwable ignored) {
        }
        return null;
    }

    // --- button --------------------------------------------------------------

    private static void addButton(ViewGroup row, View trailer, final String imdbId) {
        try {
            android.content.Context ctx = row.getContext();
            int accent = AccentPresets.previewColor(ctx,
                    Prefs.getString(Prefs.KEY_THEME_ACCENT, AccentPresets.defaultAccent(ctx)),
                    Prefs.getString(Prefs.KEY_THEME_ACCENT_HEX, ""));
            int onAccent = AccentPresets.isLight(accent) ? 0xFF141414 : 0xFFFFFFFF;
            float density = ctx.getResources().getDisplayMetrics().density;
            int size = Math.round(40f * density);
            int iconSize = Math.round(18f * density);

            MaterialButton button = new MaterialButton(ctx);
            button.setTag(TAG);
            String app = Prefs.streamingApp();
            button.setContentDescription("nuvio".equals(app) ? "Open in Nuvio" : "Open in Stremio");
            button.setText(null);
            button.setInsetTop(0);
            button.setInsetBottom(0);
            button.setPadding(0, 0, 0, 0);
            button.setIconPadding(0);
            button.setMinWidth(size);
            button.setMinimumWidth(size);
            button.setMinHeight(size);
            button.setMinimumHeight(size);
            button.setCornerRadius(size / 2);

            button.setBackgroundTintList(ColorStateList.valueOf(accent));
            button.setIconTint(ColorStateList.valueOf(onAccent));
            button.setIcon(new PlayGlyph(iconSize, onAccent));
            button.setIconSize(iconSize);
            button.setIconGravity(MaterialButton.ICON_GRAVITY_TEXT_START);

            button.setOnClickListener(new View.OnClickListener() {
                @Override public void onClick(View v) {
                    launch(v, imdbId, app);
                }
            });

            int gap = Math.round(10f * density);
            ViewGroup.MarginLayoutParams lp = new ViewGroup.MarginLayoutParams(size, size);
            lp.setMarginStart(gap);
            lp.setMarginEnd(gap);
            row.addView(button, row.indexOfChild(trailer) + 1, lp);
        } catch (Throwable ignored) {
        }
    }

    private static void launch(View v, String imdbId, String app) {
        try {
            // Confirmed against each app's own deep-link parsing source:
            // - Stremio: stremio:///detail/movie/<imdbId>/<imdbId> (id doubled, its own convention).
            // - Nuvio: nuvio://movie/<imdbId> — its stremio:// filter is for addon installs only
            //   (host must look like a domain), never meta lookups, so Stremio's own URI silently
            //   no-ops there (opens the app, does nothing with the link).
            Uri uri = "nuvio".equals(app)
                    ? Uri.parse("nuvio://movie/" + imdbId)
                    : Uri.parse("stremio:///detail/movie/" + imdbId + "/" + imdbId);
            v.getContext().startActivity(new Intent(Intent.ACTION_VIEW, uri));
        } catch (ActivityNotFoundException ignored) {
        } catch (Throwable ignored) {
        }
    }

    private static View byId(View root, String name) {
        try {
            int id = root.getResources().getIdentifier(name, "id", root.getContext().getPackageName());
            return id == 0 ? null : root.findViewById(id);
        } catch (Throwable t) {
            return null;
        }
    }

    /** A simple filled play triangle — trailer_button has its own icon; this echoes its shape. */
    private static final class PlayGlyph extends Drawable {
        private final Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Path path = new Path();
        private final int size;

        PlayGlyph(int size, int color) {
            this.size = size;
            paint.setColor(color);
            paint.setStyle(Paint.Style.FILL);
        }

        @Override public void draw(Canvas canvas) {
            android.graphics.Rect b = getBounds();
            float w = b.width(), h = b.height();
            path.reset();
            path.moveTo(b.left + w * 0.22f, b.top + h * 0.12f);
            path.lineTo(b.left + w * 0.22f, b.top + h * 0.88f);
            path.lineTo(b.left + w * 0.86f, b.top + h * 0.5f);
            path.close();
            canvas.drawPath(path, paint);
        }

        @Override public int getIntrinsicWidth() { return size; }
        @Override public int getIntrinsicHeight() { return size; }
        @Override public void setAlpha(int alpha) { paint.setAlpha(alpha); }
        @Override public void setColorFilter(android.graphics.ColorFilter cf) { paint.setColorFilter(cf); }
        @Override public int getOpacity() { return PixelFormat.TRANSLUCENT; }
    }
}
