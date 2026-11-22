package app.bardo.letterboxd.extension;

import android.app.Activity;
import android.content.Context;
import android.content.ContextWrapper;
import android.content.Intent;
import android.content.res.ColorStateList;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.Outline;
import android.graphics.drawable.GradientDrawable;
import android.net.Uri;
import android.util.Base64;
import android.util.Log;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewOutlineProvider;
import android.view.ViewParent;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;
import android.widget.Toast;

import java.lang.reflect.Method;
import java.util.List;
import java.util.Locale;

/**
 * Código que se inyecta dentro de Letterboxd.
 *
 * Los parches solo añaden dos llamadas a esta clase; todo lo demás (crear las vistas,
 * sacar el TMDB id, lanzar los intents) se hace aquí en tiempo de ejecución.
 *
 * Las clases de Letterboxd se tocan por reflexión y las vistas se buscan por el nombre de
 * su id, así que esta clase no depende de ningún tipo de la app y compila sola.
 */
@SuppressWarnings("unused")
public final class BardoPatch {

    private static final String TAG = "BardoPatch";

    /** Esquema que debe registrar Bardo en su AndroidManifest. */
    private static final String BARDO_SCHEME = "bardo";

    private static final String TAG_LOGO = "bardo_logo";
    private static final String TAG_SERVICE = "bardo_service";
    private static final String TAG_SERVICE_ROW = "bardo_service_row";

    /**
     * LID → película, apuntada al pintar «Dónde verlo». La pantalla de servicios solo trae
     * el LID: así sabe la película sin preguntar nada a la red.
     */
    private static final java.util.Map<String, FilmRef> REFS =
            new java.util.concurrent.ConcurrentHashMap<>();

    /** Icono cuadrado de Bardo (ic_launcher 192 px) en PNG/base64. */
    private static final String LOGO_PNG_BASE64 =
            "iVBORw0KGgoAAAANSUhEUgAAAMAAAADACAAAAAB3tzPbAAAFAklEQVR42u3db0hWVxwH8POow2yaiGZzNtzwkdSsB32GbY35YrrJrKBBxUIkiN5ZxKBexAbS/m+MjTYaLITG05sNRAZjztGCiIKoaaXO/pklpWX/VqmVpD17FXh/9z7Puefc8ztu9D2vPFfv9X48f7/3PmBorvh/lxQBAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAIC1pAc9ft9xZ7+yUnNBW7qg+mLg/ca+/58T1WQKkLnHW438pXiAjQwixTIjRP2OXZ6MLlWQ560M3ZWeEvA8vaPz9u+gsAKpI/USA0Vi774dc24D0pc76VFegy73esdoyYPEcZ31gXHpKPNk3sz79xi6gktS75aeEkn+7/ivFOwo0C2WWOesPTwWf1xvE9ri1FogQfv+kgZWpocleF6o0NwfNKJvzbAHyikkP6jcCyNxhCxAhA7Jn2sz25u0CSwC6ih0ztUFbYQeQX+isjw2YAjTYmUar1BcBIUTf2IxfvjDf82dKi4ZsAKJaPajFWQ0v3+Qx6USGLHShF+c766PDOlcZiNV87j6aa2MMGFsEYj+6J2gLYyC1ykeUqchwVC/c9rzUl6+UkiM5FgC+osxHixzVbR3e1/q5ZRZCvcEoI67RA6P8ABpl4n6iTKJt5h2pyDyARpkL4z5OSpQFiuiB4/yASpPbiEWkfnaQHZBOosxUkCiTvooc+I1/ENMoczpIlNlCpv07P/EDqrV60GPvnc9GcuDjcYU70VsHMvWijNdf69nmRjqCO/hDfTRplFlSk2BP8+ZLBDQvO7uCrrqD71l4KpG8B1U0J3pmUi+/9GDTP/wrMV+UEb+sV7t/vRaQRJm49u2PtBxRPUULEE2+Dwpp3v7VPe2PhA0AjTI3LhlpgVurxyztRuk2oksYaYHc/e8X2wHI0rzuGJjX+OveUguAMIkyw9fNtIAQQixr25nDDpBuI/RnISFS1na+xgxIlUaZAC0ghMj6vo4XUK4TZVTKM7vWsAL0NqIqJfShQi9SXgd8RJm+3U++ete5m7vo2mfmPFeQ7/EU67OV99gAPqJMb++Tr+qcNze02+uKC7c20FGT98kWti5UHeBxinegubL9HVc3rK3hAriizN8GBty5Ta5+uJYL4IoyJt7rianmW+RITQ4TQOPNsJ9yO0bn0lU8gDzyDGrsvKGps0s21gwBXiY9qNvQez1xinbF53kAwV4KPE78rWk6jAtYAIULkkeZAL+MDtrsORyAalnPTV6SbFMzSoReE6gB9F5M+tmmlrmOTDIApFFGv7gfJd1lAFTzLAJCiOZXXd1twjzAFWVUn6knnIXq3Q1wkWE36ooyNxUB3n+tlLc2RDwWBgZA4DfD7hZ4IVxcEvVcsw6ZB6SXS6OMpLzh/wNFDw+aX8gipAedNh2GZ5YDk+YBJt8MS0vMfB7IDAeIMqrlcK95QDSNI8okKN8yPFZhijKe5YM+8wC2KONRWtuFeQD9iGLvNNv9//G1YABUWetB3dtUftrvQlZI3uvdGGC6/cnW1mkOAG2AHq75c6fiR+/8ApZa6UEjX+xXPcUnIEze6w0PM9z+mX0d6mtL2n9kCI+f7D56UufEEP4HBwAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA8BQA/gV/hwupSvp3uwAAAABJRU5ErkJggg==";

    private static volatile Bitmap logoBitmap;

    private BardoPatch() {
    }

    // ---------------------------------------------------------------------------------------------
    // Enganche 1: cabecera de la ficha de película
    // ---------------------------------------------------------------------------------------------

    /**
     * Punto de inyección: inicio de FilmHeaderFragment.configurePoster(Film, FragmentFilmHeaderBinding).
     *
     * @param film    com.letterboxd.api.model.Film
     * @param binding com.letterboxd.letterboxd.databinding.FragmentFilmHeaderBinding
     */
    public static void onFilmHeader(Object film, Object binding) {
        try {
            if (film == null || binding == null) return;

            View root = (View) call(binding, "getRoot");
            if (root == null) return;

            View trailer = findByName(root, "trailer_button");
            if (trailer == null || !(trailer.getParent() instanceof LinearLayout)) {
                Log.w(TAG, "No se encuentra trailer_button o su fila no es un LinearLayout");
                return;
            }
            LinearLayout row = (LinearLayout) trailer.getParent();
            Context context = row.getContext();
            FilmRef ref = FilmRef.from(film);

            // La app puede volver a configurar la cabecera con la misma vista:
            // si ya está el logo, solo se actualiza la película a la que apunta.
            View existingLogo = row.findViewWithTag(TAG_LOGO);
            if (existingLogo != null) {
                bind(existingLogo, ref, false);
                return;
            }

            // Logo de Bardo, justo a la derecha del botón de tráiler.
            int logoSize = dp(context, 30);
            ImageView logo = logoView(context, logoSize, dp(context, 7));
            logo.setTag(TAG_LOGO);
            logo.setContentDescription(isSpanish() ? "Abrir en Bardo" : "Open in Bardo");
            LinearLayout.LayoutParams logoParams = new LinearLayout.LayoutParams(logoSize, logoSize);
            logoParams.setMarginEnd(dp(context, 12));
            bind(logo, ref, false);
            row.addView(logo, row.indexOfChild(trailer) + 1, logoParams);

            // Sin tráiler la app oculta el botón (GONE) y su margen desaparece con él,
            // así que el logo queda alineado al inicio sin más ajustes.
            ViewGroup.LayoutParams trailerParams = trailer.getLayoutParams();
            if (trailerParams instanceof ViewGroup.MarginLayoutParams) {
                ((ViewGroup.MarginLayoutParams) trailerParams).setMarginEnd(dp(context, 8));
                trailer.setLayoutParams(trailerParams);
            }

            // Sin botón «+ Añadir»: el logo basta. Bardo decide solo si abre la ficha del
            // servidor (la película está en Plex) o la de Descubrir, desde la que se solicita.
        } catch (Throwable t) {
            Log.e(TAG, "onFilmHeader falló", t);
        }
    }

    private static void bind(View view, final FilmRef ref, final boolean request) {
        view.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                openInBardo(v.getContext(), ref, request);
            }
        });
    }

    // ---------------------------------------------------------------------------------------------
    // Enganche 2: Bardo en la fila «Dónde verlo»
    // ---------------------------------------------------------------------------------------------

    /**
     * Punto de inyección: inicio de WhereToWatchFragment.updateServicesIcons(boolean, List).
     *
     * El distintivo OWN sigue siendo el de Letterboxd (tus listas de propiedad). Aquí solo se
     * añade el logo de Bardo, el primero de la fila, cuando la película está en el servidor de
     * Bardo (lo último que Bardo dejó con setLibrary; no se le pregunta nada). Se aplica en un
     * post: así corre después de que la app haya colocado sus iconos y decidido la visibilidad
     * (sin servicios ni OWN oculta la fila entera; con Bardo se vuelve a mostrar).
     *
     * @param fragment com.letterboxd.letterboxd.ui.fragments.film.WhereToWatchFragment
     */
    public static void onServicesIcons(final Object fragment) {
        try {
            final Object binding = field(fragment, "binding");
            if (binding == null) return;
            final View root = (View) call(binding, "getRoot");
            if (root == null) return;
            root.post(new Runnable() {
                @Override
                public void run() {
                    applyBardoService(fragment, root);
                }
            });
        } catch (Throwable t) {
            Log.e(TAG, "onServicesIcons falló", t);
        }
    }

    private static void applyBardoService(Object fragment, View root) {
        try {
            View firstIcon = findByName(root, "ic_start_imageview_0");
            if (firstIcon == null) firstIcon = findByName(root, "own_badge_label");
            if (firstIcon == null || !(firstIcon.getParent() instanceof LinearLayout)) {
                Log.w(TAG, "No se encuentra la fila de servicios de «Dónde verlo»");
                return;
            }
            LinearLayout row = (LinearLayout) firstIcon.getParent();
            View existing = row.findViewWithTag(TAG_SERVICE);

            Object viewModel = callDeclared(fragment, "getViewModel");
            Object liveData = viewModel == null ? null : call(viewModel, "getFilm");
            Object film = liveData == null ? null : call(liveData, "getValue");
            FilmRef ref = film == null ? null : FilmRef.from(film);
            // Para la pantalla de servicios, a la que se llega desde aquí con el LID.
            if (ref != null) {
                Object lid = call(film, "getId");
                if (lid != null) REFS.put(lid.toString(), ref);
            }
            boolean onServer = ref != null && BardoBridgeProvider.isOnServer(ref.tmdbId);

            if (!onServer) {
                if (existing != null) row.removeView(existing);
                return;
            }
            Context context = row.getContext();
            if (existing == null) {
                int size = dp(context, 24);
                ImageView logo = logoView(context, size, dp(context, 6));
                logo.setTag(TAG_SERVICE);
                logo.setContentDescription(isSpanish() ? "Ver en Bardo" : "Watch in Bardo");
                LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(size, size);
                params.setMarginEnd(dp(context, 6));
                row.addView(logo, 0, params);
                existing = logo;
            }
            bind(existing, ref, false);
            root.setVisibility(View.VISIBLE);
        } catch (Throwable t) {
            Log.e(TAG, "applyBardoService falló", t);
        }
    }

    // ---------------------------------------------------------------------------------------------
    // Enganche 3: Bardo en la pantalla de servicios («Dónde verlo» completa)
    // ---------------------------------------------------------------------------------------------

    /**
     * Punto de inyección: inicio de FilmAvailabilityFragment.onViewCreated(View, Bundle).
     *
     * Añade bajo el título una fila «Ver en Bardo · En tu servidor» si la película está en el
     * servidor. Va dentro del AppBarLayout de la barra (un LinearLayout vertical) y la lista,
     * anclada debajo de él, baja sola: no se toca nada de las filas de Letterboxd.
     *
     * @param fragment com.letterboxd.letterboxd.ui.fragments.film.FilmAvailabilityFragment
     */
    public static void onAvailability(Object fragment) {
        try {
            Object binding = field(fragment, "binding");
            if (binding == null) return;
            Object toolbarInclude = field(binding, "toolbarInclude");
            View appBar = toolbarInclude == null ? null : (View) call(toolbarInclude, "getRoot");
            if (!(appBar instanceof LinearLayout)) {
                Log.w(TAG, "La barra de la pantalla de servicios no es un LinearLayout");
                return;
            }
            LinearLayout bar = (LinearLayout) appBar;
            if (bar.findViewWithTag(TAG_SERVICE_ROW) != null) return;

            android.os.Bundle args = (android.os.Bundle) call(fragment, "getArguments");
            String lid = args == null ? null : args.getString("filmId");
            FilmRef ref = lid == null ? null : REFS.get(lid);
            if (ref == null || !BardoBridgeProvider.isOnServer(ref.tmdbId)) return;

            bar.addView(serviceRow(bar.getContext(), ref),
                    new LinearLayout.LayoutParams(
                            ViewGroup.LayoutParams.MATCH_PARENT,
                            ViewGroup.LayoutParams.WRAP_CONTENT));
        } catch (Throwable t) {
            Log.e(TAG, "onAvailability falló", t);
        }
    }

    /** Logo de Bardo, «Ver en Bardo» y «En tu servidor», con una flecha al final. */
    private static View serviceRow(Context context, FilmRef ref) {
        LinearLayout row = new LinearLayout(context);
        row.setTag(TAG_SERVICE_ROW);
        row.setOrientation(LinearLayout.HORIZONTAL);
        row.setGravity(Gravity.CENTER_VERTICAL);
        row.setPadding(dp(context, 16), dp(context, 12), dp(context, 16), dp(context, 12));
        row.setMinimumHeight(dp(context, 64));
        TypedValue ripple = new TypedValue();
        if (context.getTheme().resolveAttribute(
                android.R.attr.selectableItemBackground, ripple, true)) {
            row.setBackgroundResource(ripple.resourceId);
        }
        boolean es = isSpanish();
        row.setContentDescription(es ? "Ver en Bardo: está en tu servidor"
                : "Watch in Bardo: it's on your server");

        int size = dp(context, 40);
        ImageView logo = logoView(context, size, dp(context, 9));
        LinearLayout.LayoutParams logoParams = new LinearLayout.LayoutParams(size, size);
        logoParams.setMarginEnd(dp(context, 14));
        row.addView(logo, logoParams);

        LinearLayout texts = new LinearLayout(context);
        texts.setOrientation(LinearLayout.VERTICAL);
        TextView title = new TextView(context);
        title.setText(es ? "Ver en Bardo" : "Watch in Bardo");
        title.setTextColor(0xFFFFFFFF);
        title.setTextSize(TypedValue.COMPLEX_UNIT_SP, 16);
        title.setTypeface(android.graphics.Typeface.DEFAULT_BOLD);
        TextView subtitle = new TextView(context);
        subtitle.setText(es ? "En tu servidor" : "On your server");
        subtitle.setTextColor(0xFF9AB0C4);
        subtitle.setTextSize(TypedValue.COMPLEX_UNIT_SP, 13);
        texts.addView(title);
        texts.addView(subtitle);
        row.addView(texts, new LinearLayout.LayoutParams(
                0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));

        TextView chevron = new TextView(context);
        chevron.setText("›");
        chevron.setTextColor(0xFF9AB0C4);
        chevron.setTextSize(TypedValue.COMPLEX_UNIT_SP, 24);
        chevron.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO);
        row.addView(chevron);

        bind(row, ref, false);
        return row;
    }

    // ---------------------------------------------------------------------------------------------
    // Intents hacia Bardo
    // ---------------------------------------------------------------------------------------------

    /**
     * Enlaces que debe aceptar Bardo:
     * <pre>
     *   bardo://tmdb/movie/{tmdbId}?lb={urlLetterboxd}                  abrir la ficha
     *   bardo://tmdb/movie/{tmdbId}?lb={urlLetterboxd}&action=request   solicitar por Seerr
     *   bardo://letterboxd?lb={urlLetterboxd}[&action=request]          si no hay TMDB id
     * </pre>
     */
    static void openInBardo(Context context, FilmRef ref, boolean request) {
        try {
            Uri.Builder uri = new Uri.Builder().scheme(BARDO_SCHEME);
            if (ref.tmdbId != null) {
                uri.authority("tmdb").appendPath("movie").appendPath(ref.tmdbId);
            } else if (ref.letterboxdUrl != null) {
                uri.authority("letterboxd");
            } else {
                toast(context, isSpanish()
                        ? "Esta ficha no trae identificador de TMDB"
                        : "This film has no TMDB id");
                return;
            }
            if (ref.letterboxdUrl != null) uri.appendQueryParameter("lb", ref.letterboxdUrl);
            if (request) uri.appendQueryParameter("action", "request");

            Intent intent = new Intent(Intent.ACTION_VIEW, uri.build());
            intent.addCategory(Intent.CATEGORY_BROWSABLE);
            // Sin NEW_TASK Bardo se abre sobre Letterboxd y «atrás» vuelve a la ficha.
            if (activityOf(context) == null) intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
            context.startActivity(intent);
        } catch (Throwable t) {
            // ActivityNotFoundException: Bardo no está instalado o aún no registra bardo://
            Log.w(TAG, "No se pudo abrir Bardo", t);
            toast(context, isSpanish()
                    ? "Bardo no está instalado o aún no admite este enlace"
                    : "Bardo is not installed or cannot handle this link yet");
        }
    }

    /** Datos mínimos de la película, leídos una vez del modelo de Letterboxd. */
    static final class FilmRef {
        final String tmdbId;
        final String letterboxdUrl;

        FilmRef(String tmdbId, String letterboxdUrl) {
            this.tmdbId = tmdbId;
            this.letterboxdUrl = letterboxdUrl;
        }

        static FilmRef from(Object film) {
            String tmdbId = null;
            String url = null;
            try {
                // Film.getLinks(): List<Link>; Link.getType().getValue() == "tmdb"; Link.getId()
                Object links = call(film, "getLinks");
                if (links instanceof List) {
                    for (Object link : (List<?>) links) {
                        if (link == null) continue;
                        Object type = call(link, "getType");
                        Object value = type == null ? null : call(type, "getValue");
                        if ("tmdb".equals(value)) {
                            Object id = call(link, "getId");
                            if (id != null && isNumeric(id.toString())) tmdbId = id.toString();
                            break;
                        }
                    }
                }
            } catch (Throwable t) {
                Log.w(TAG, "No se pudo leer el enlace de TMDB", t);
            }
            try {
                Object link = call(film, "getLink"); // java.net.URL de letterboxd.com/film/…
                if (link != null) url = link.toString();
            } catch (Throwable t) {
                Log.w(TAG, "No se pudo leer la URL de Letterboxd", t);
            }
            return new FilmRef(tmdbId, url);
        }
    }

    // ---------------------------------------------------------------------------------------------
    // Utilidades
    // ---------------------------------------------------------------------------------------------

    private static ImageView logoView(Context context, int size, final int radius) {
        ImageView view = new ImageView(context);
        view.setImageBitmap(logo());
        view.setScaleType(ImageView.ScaleType.FIT_CENTER);
        view.setOutlineProvider(new ViewOutlineProvider() {
            @Override
            public void getOutline(View v, Outline outline) {
                outline.setRoundRect(0, 0, v.getWidth(), v.getHeight(), radius);
            }
        });
        view.setClipToOutline(true);
        return view;
    }

    static Bitmap logo() {
        Bitmap bitmap = logoBitmap;
        if (bitmap == null) {
            byte[] bytes = Base64.decode(LOGO_PNG_BASE64, Base64.DEFAULT);
            bitmap = BitmapFactory.decodeByteArray(bytes, 0, bytes.length);
            logoBitmap = bitmap;
        }
        return bitmap;
    }

    /** Busca una vista por el nombre de su id (p. ej. "trailer_button"), sin depender de R. */
    static View findByName(View root, String idName) {
        Context context = root.getContext();
        int id = context.getResources().getIdentifier(idName, "id", context.getPackageName());
        return id == 0 ? null : root.findViewById(id);
    }

    private static Object call(Object target, String method) throws Exception {
        Method m = target.getClass().getMethod(method);
        m.setAccessible(true);
        return m.invoke(target);
    }

    /** Como {@link #call} pero también para métodos privados de la propia clase. */
    private static Object callDeclared(Object target, String method) throws Exception {
        Method m = target.getClass().getDeclaredMethod(method);
        m.setAccessible(true);
        return m.invoke(target);
    }

    static Object field(Object target, String name) throws Exception {
        java.lang.reflect.Field f = target.getClass().getDeclaredField(name);
        f.setAccessible(true);
        return f.get(target);
    }

    private static Activity activityOf(Context context) {
        while (context instanceof ContextWrapper) {
            if (context instanceof Activity) return (Activity) context;
            context = ((ContextWrapper) context).getBaseContext();
        }
        return null;
    }

    private static boolean isNumeric(String value) {
        if (value.isEmpty()) return false;
        for (int i = 0; i < value.length(); i++) {
            if (!Character.isDigit(value.charAt(i))) return false;
        }
        return true;
    }

    static boolean isSpanish() {
        return "es".equals(Locale.getDefault().getLanguage());
    }

    static int dp(Context context, int value) {
        return Math.round(TypedValue.applyDimension(
                TypedValue.COMPLEX_UNIT_DIP, value, context.getResources().getDisplayMetrics()));
    }

    private static void toast(Context context, String message) {
        Toast.makeText(context.getApplicationContext(), message, Toast.LENGTH_SHORT).show();
    }
}
