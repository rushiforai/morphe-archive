package app.bardo.letterboxd.extension;

import android.content.Context;
import android.content.res.Resources;
import android.os.Handler;
import android.os.Looper;
import android.util.Log;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.LinearLayout;
import android.widget.TextView;

import java.lang.reflect.Constructor;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

/**
 * Fila «Recién llegado a Bardo» del inicio de Letterboxd.
 *
 * <p>Va justo después del carrusel del Video Store (que el parche «Hide Video Store» deja
 * oculto) y es una fila NATIVA más: la misma cabecera que «Popular with friends» (márgenes y
 * estilo de texto) y el mismo {@code RecyclerView} con el {@code FilmSummaryListAdapter} de la
 * app, su {@code setShelfSpacing} y su {@code FilmSelectionListener}. Así el póster mide lo
 * mismo, se pinta igual (PosterView) y se comporta igual: tocar abre la ficha y mantener
 * pulsado hace lo que en cualquier otro póster de esas filas.
 *
 * <p>Bardo solo deja ids de TMDB en el puente ({@code setLibrary} con «recent»); las películas
 * ({@code FilmSummary}) se piden a la API de Letterboxd en un hilo de fondo. Sin recientes
 * (Bardo antiguo, o nunca los mandó) la fila no aparece.
 *
 * <p>No lleva chevron: el de las otras filas abre un listado («ver todo») hecho con un
 * {@code FilmsRequestBuilder}, que no admite una lista concreta de películas.
 */
@SuppressWarnings("unused")
public final class BardoHome {

    private static final String TAG = "BardoHome";
    private static final String TAG_SECTION = "bardo_recent_section";
    private static final int MAX_FILMS = 20;
    private static final long REFRESH_MS = 6 * 60 * 60 * 1000L;

    private static final String PKG_ITEM = "com.letterboxd.letterboxd.ui.item.";
    private static final String RECYCLER = "androidx.recyclerview.widget.RecyclerView";

    private static final ExecutorService IO = Executors.newSingleThreadExecutor();
    private static final Handler MAIN = new Handler(Looper.getMainLooper());

    /** Las películas ya resueltas y para qué biblioteca (sello) y cuándo. */
    private static volatile List<Object> films;
    private static volatile long filmsStamp = -1;
    private static volatile long filmsAt;

    private BardoHome() {
    }

    /**
     * Punto de inyección: inicio de
     * {@code SignedInPopularFilmsFragment.configureVideoStoreProducts(binding)}, una vez por vista.
     */
    public static void onHome(Object fragment, Object binding) {
        try {
            Object scrollContent = BardoPatch.field(binding, "scrollViewLinearLayout");
            Object anchor = BardoPatch.field(binding, "videoStoreProductsLayout");
            if (!(scrollContent instanceof LinearLayout) || !(anchor instanceof View)) {
                Log.w(TAG, "El inicio ya no tiene la estructura esperada");
                return;
            }
            LinearLayout content = (LinearLayout) scrollContent;
            View existing = content.findViewWithTag(TAG_SECTION);
            final Section section;
            if (existing != null) {
                section = (Section) existing.getTag(R_KEY);
            } else {
                section = new Section(content.getContext(), fragment, binding);
                int at = content.indexOfChild((View) anchor);
                content.addView(section.root, at < 0 ? content.getChildCount() : at + 1,
                        new LinearLayout.LayoutParams(
                                ViewGroup.LayoutParams.MATCH_PARENT,
                                ViewGroup.LayoutParams.WRAP_CONTENT));
            }
            load(section);
        } catch (Throwable t) {
            Log.e(TAG, "onHome falló", t);
        }
    }

    /** Clave de la etiqueta con la que la vista raíz recuerda su {@link Section}. */
    private static final int R_KEY = 0x7f_ba_7d_01;

    private static void load(final Section section) {
        final List<String> recent = BardoBridgeProvider.recentOnServer();
        if (recent.isEmpty()) {
            section.root.setVisibility(View.GONE);
            return;
        }
        final long stamp = BardoBridgeProvider.libraryStamp();
        List<Object> ready = films;
        boolean fresh = ready != null && filmsStamp == stamp
                && System.currentTimeMillis() - filmsAt < REFRESH_MS;
        if (ready != null) section.show(ready);
        if (fresh) return;
        // La API bloquea: siempre en el hilo de fondo, nunca en el principal.
        IO.execute(new Runnable() {
            @Override
            public void run() {
                try {
                    List<String> ids = recent.size() > MAX_FILMS ? recent.subList(0, MAX_FILMS) : recent;
                    final List<Object> loaded = BardoBridgeProvider.filmsByTmdb(new ArrayList<>(ids));
                    films = loaded;
                    filmsStamp = stamp;
                    filmsAt = System.currentTimeMillis();
                    MAIN.post(new Runnable() {
                        @Override
                        public void run() {
                            section.show(loaded);
                        }
                    });
                } catch (Throwable t) {
                    Log.w(TAG, "No se pudieron cargar los recientes de Bardo", t);
                }
            }
        });
    }

    /**
     * La sección, calcada de las del layout {@code fragment_signed_in_popular_films}:
     *
     * <pre>
     * LinearLayout vertical
     *   LinearLayout horizontal (cabecera): marginTop activity_vertical_margin,
     *       marginBottom item_margin, paddingHorizontal activity_horizontal_margin
     *     LinearLayout vertical (peso 1) › TextView TextAppearance.Letterboxd.DisplaySmall
     *   RecyclerView horizontal + setShelfSpacing + allowHorizontalNestedScrolling
     * </pre>
     */
    private static final class Section {
        final LinearLayout root;
        /** El {@code FilmSummaryListAdapter} de la app. */
        final Object adapter;
        final View recycler;

        Section(Context context, Object fragment, Object binding) throws Throwable {
            root = new LinearLayout(context);
            root.setOrientation(LinearLayout.VERTICAL);
            root.setTag(TAG_SECTION);
            root.setTag(R_KEY, this);
            root.setVisibility(View.GONE);

            root.addView(header(context, binding));

            // El mismo RecyclerView que «Popular with friends» (configurePopularWithFriends).
            Class<?> recyclerClass = Class.forName(RECYCLER);
            recycler = (View) recyclerClass.getConstructor(Context.class).newInstance(context);
            Class<?> listenerClass = Class.forName(
                    "com.letterboxd.letterboxd.ui.interaction.FilmSelectionListener");
            adapter = Class.forName(PKG_ITEM + "FilmSummaryListAdapter")
                    .getConstructor(listenerClass)
                    .newInstance(listener(fragment, context, listenerClass));
            recyclerClass.getMethod("setAdapter", Class.forName(RECYCLER + "$Adapter"))
                    .invoke(recycler, adapter);
            Object layoutManager = Class.forName("androidx.recyclerview.widget.LinearLayoutManager")
                    .getConstructor(Context.class, int.class, boolean.class)
                    .newInstance(context, 0 /* HORIZONTAL */, false);
            recyclerClass.getMethod("setLayoutManager", Class.forName(RECYCLER + "$LayoutManager"))
                    .invoke(recycler, layoutManager);
            recyclerClass.getMethod("setHasFixedSize", boolean.class).invoke(recycler, true);
            Class<?> recyclerKt = Class.forName("com.letterboxd.letterboxd.ui.extensions.RecyclerViewKt");
            recyclerKt.getMethod("setShelfSpacing", recyclerClass).invoke(null, recycler);
            recyclerKt.getMethod("allowHorizontalNestedScrolling", recyclerClass).invoke(null, recycler);
            root.addView(recycler, new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));
        }

        /**
         * Quien atiende el toque y la pulsación larga de los pósters: el mismo
         * {@code FilmSelectionListener} que usan las otras filas (el del fragmento, que es su
         * actividad).
         */
        private static Object listener(Object fragment, Context context, Class<?> type) {
            try {
                Object own = BardoPatch.field(fragment, "filmSelectionListener");
                if (type.isInstance(own)) return own;
            } catch (Throwable ignored) {
            }
            Object activity = callOrNull(fragment, "getActivity");
            if (type.isInstance(activity)) return activity;
            if (type.isInstance(context)) return context;
            Log.w(TAG, "Sin FilmSelectionListener: los pósters no responderán");
            return null;
        }

        /** Cabecera con las medidas y el estilo de «Popular with friends». */
        private static View header(Context context, Object binding) {
            Resources res = context.getResources();
            String pkg = context.getPackageName();
            int side = dimen(res, pkg, "activity_horizontal_margin", BardoPatch.dp(context, 16));
            int top = dimen(res, pkg, "activity_vertical_margin", BardoPatch.dp(context, 16));
            int bottom = dimen(res, pkg, "item_margin", BardoPatch.dp(context, 8));

            TextView title = new TextView(context);
            title.setText(titleText(context));
            int appearance = res.getIdentifier("TextAppearance.Letterboxd.DisplaySmall", "style", pkg);
            if (appearance != 0) title.setTextAppearance(appearance);
            // Lo que el tema o el inflador de la app le pongan al título nativo, igual aquí.
            try {
                Object model = BardoPatch.field(binding, "popularWithFriendsTitle");
                if (model instanceof TextView) {
                    TextView source = (TextView) model;
                    title.setTextSize(TypedValue.COMPLEX_UNIT_PX, source.getTextSize());
                    title.setTextColor(source.getTextColors());
                    title.setTypeface(source.getTypeface());
                    title.setLetterSpacing(source.getLetterSpacing());
                    title.setAllCaps(source.isAllCaps());
                    title.setIncludeFontPadding(source.getIncludeFontPadding());
                }
            } catch (Throwable ignored) {
            }

            LinearLayout column = new LinearLayout(context);
            column.setOrientation(LinearLayout.VERTICAL);
            column.addView(title, new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT));

            LinearLayout header = new LinearLayout(context);
            header.setOrientation(LinearLayout.HORIZONTAL);
            header.setGravity(Gravity.START | Gravity.CENTER_VERTICAL);
            header.setPadding(side, 0, side, 0);
            header.addView(column, new LinearLayout.LayoutParams(
                    0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));
            LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
            params.topMargin = top;
            params.bottomMargin = bottom;
            header.setLayoutParams(params);
            return header;
        }

        /** Alimenta el adapter nativo: un {@code FilmSummaryListAdapter.Item} por película. */
        void show(List<Object> list) {
            try {
                Class<?> summary = Class.forName("com.letterboxd.api.model.FilmSummary");
                Constructor<?> item = Class.forName(PKG_ITEM + "FilmSummaryListAdapter$Item")
                        .getConstructor(summary, String.class, long.class);
                List<Object> items = new ArrayList<>();
                for (Object film : list) {
                    if (!summary.isInstance(film)) continue;
                    // Igual que los valores por defecto de Item: el id y su hash.
                    String id = String.valueOf(summary.getMethod("getId").invoke(film));
                    items.add(item.newInstance(film, id, (long) id.hashCode()));
                }
                adapter.getClass().getMethod("submitList", List.class).invoke(adapter, items);
                root.setVisibility(items.isEmpty() ? View.GONE : View.VISIBLE);
                // Con setHasFixedSize(true) la lista no se vuelve a medir sola al recibir datos.
                recycler.requestLayout();
            } catch (Throwable t) {
                Log.w(TAG, "No se pudo pintar la fila de Bardo", t);
                root.setVisibility(View.GONE);
            }
        }
    }

    /**
     * El título en el idioma en que la APP se está mostrando (sus Resources, no el del
     * sistema): si su «Popular this week» sale en inglés, inglés; si no y su configuración es
     * española, español. Con el estilo de las otras cabeceras (solo la primera en mayúscula).
     */
    private static String titleText(Context context) {
        try {
            Resources res = context.getResources();
            int id = res.getIdentifier("popular_this_week", "string", context.getPackageName());
            boolean english = id != 0 && "Popular this week".equals(res.getString(id));
            String language = res.getConfiguration().getLocales().get(0).getLanguage();
            if (!english && "es".equals(language)) return "Recién llegado a Bardo";
        } catch (Throwable ignored) {
        }
        return "New on Bardo";
    }

    private static int dimen(Resources res, String pkg, String name, int fallback) {
        int id = res.getIdentifier(name, "dimen", pkg);
        return id == 0 ? fallback : res.getDimensionPixelSize(id);
    }

    private static Object callOrNull(Object target, String method) {
        try {
            return target.getClass().getMethod(method).invoke(target);
        } catch (Throwable t) {
            return null;
        }
    }
}
