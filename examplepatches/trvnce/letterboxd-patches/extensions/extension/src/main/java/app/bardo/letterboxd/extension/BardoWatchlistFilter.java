package app.bardo.letterboxd.extension;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.PorterDuff;
import android.graphics.PorterDuffXfermode;
import android.graphics.RectF;
import android.graphics.drawable.Drawable;
import android.os.Handler;
import android.os.Looper;
import android.util.Log;
import android.view.View;
import android.widget.ImageView;
import android.widget.Toast;

import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.net.URL;
import java.util.ArrayList;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;

/**
 * Filtro «Bardo» de las watchlists: un servicio más en el filtro «Service» que deja solo las
 * películas que están en el servidor de Bardo.
 *
 * <p>Para Letterboxd es un servicio como otro cualquiera (se elige, se guarda con el resto de
 * filtros y la etiqueta dice «on Bardo»). Antes de pedir cada página, {@link #onRequest} cambia
 * ese servicio por la lista de películas de la watchlist que están en el servidor (el parámetro
 * {@code filmId} de la API): Letterboxd sigue ordenando, combinando con los otros filtros y
 * paginando él. La API admite hasta 100 ids, así que se usan las 100 primeras.
 *
 * <p>Sale el primero de los servicios, debajo de «Any Favorite Service», con el logo de Bardo
 * ({@link #onBindService}). Solo en watchlists: en el resto de listas no sale.
 */
@SuppressWarnings("unused")
public final class BardoWatchlistFilter {

    private static final String TAG = "BardoFilter";

    /** Id del servicio falso. Nunca llega a la API: {@link #onRequest} lo quita antes. */
    static final String SERVICE_ID = "bardo";

    /** Los servicios «de mentira» de Letterboxd («my-services-all» = Any Favorite Service). */
    private static final String FAVORITES_PREFIX = "my-services";

    private static final int MAX_IDS = 100;

    /** Un LID que no existe: con la lista vacía la API devolvería la watchlist ENTERA. */
    private static final String NO_FILM = "bardo-none";

    private static volatile Object service;
    private static volatile Bitmap icon;

    private BardoWatchlistFilter() {
    }

    /**
     * Punto de inyección: el return de {@code FilterViewModel.getFilteredServices()}.
     *
     * @param services   la lista de servicios que va a enseñar el filtro
     * @param viewModel  el FilterViewModel (su petición dice si es una watchlist)
     */
    public static List<?> onServices(List<?> services, Object viewModel) {
        try {
            Object request = viewModel.getClass().getMethod("getRequest").invoke(viewModel);
            if (request == null || !request.getClass().getName().endsWith(".WatchlistRequestBuilder")) {
                return services;
            }
            Object bardo = bardoService();
            if (bardo == null) return services;
            // Debajo de los «my-services-*» de la cabeza de la lista («Any Favorite Service»):
            // el primero de los servicios de verdad.
            List<Object> out = new ArrayList<>();
            int at = 0;
            for (Object s : services) {
                String id = idOf(s);
                if (SERVICE_ID.equals(id)) continue;
                out.add(s);
                if (id != null && id.startsWith(FAVORITES_PREFIX)) at = out.size();
            }
            out.add(at, bardo);
            return out;
        } catch (Throwable t) {
            Log.w(TAG, "onServices falló", t);
            return services;
        }
    }

    /**
     * Punto de inyección: inicio de {@code WatchlistRequester$getObservableRequest$1.invokeSuspend}.
     * Corre en el hilo de la corrutina (no el principal): aquí se puede leer la watchlist.
     */
    public static void onRequest(Object coroutine) {
        try {
            Object params = field(coroutine, "$request");
            if (params == null || !SERVICE_ID.equals(field(params, "service"))) return;
            Object memberId = field(params, "id");

            List<String> lids;
            if (Looper.myLooper() == Looper.getMainLooper()) {
                // No debería pasar (la corrutina va en Dispatchers.Default); sin red en el
                // hilo principal, mejor una lista vacía que un bloqueo.
                Log.w(TAG, "onRequest en el hilo principal: sin filtrar");
                lids = new ArrayList<>();
            } else {
                lids = BardoBridgeProvider.watchlistOnServer(
                        memberId == null ? null : memberId.toString(), MAX_IDS + 1);
            }
            boolean truncated = lids.size() > MAX_IDS;
            Set<String> ids = new LinkedHashSet<>(truncated ? lids.subList(0, MAX_IDS) : lids);
            if (ids.isEmpty()) ids.add(NO_FILM);

            setField(params, "service", null);
            setField(params, "availabilityType", null);
            setField(params, "filmId", ids);
            if (truncated && field(params, "cursor") == null) {
                toast(isSpanish()
                        ? "En Bardo: se muestran las 100 primeras de tu watchlist"
                        : "On Bardo: showing the first 100 of the watchlist");
            }
        } catch (Throwable t) {
            Log.w(TAG, "onRequest falló", t);
        }
    }

    // ---------------------------------------------------------------------------------------------

    /**
     * {@code Service("bardo", "Bardo", null, null)}. Sin icono a propósito: el adapter del
     * filtro lo carga con Glide desde una {@code java.net.URL}, que solo sabe de http(s) (un
     * {@code file://} acaba en un ClassCastException de HttpUrlFetcher y no pinta nada). El
     * logo lo pone {@link #onBindService} directamente en la fila.
     */
    private static Object bardoService() throws Throwable {
        Object cached = service;
        if (cached != null) return cached;
        Class<?> type = Class.forName("com.letterboxd.api.model.Service");
        Constructor<?> ctor = type.getConstructor(String.class, String.class, URL.class, URL.class);
        Object created = ctor.newInstance(SERVICE_ID, "Bardo", null, null);
        service = created;
        return created;
    }

    /**
     * Punto de inyección: {@code FilterServiceListAdapter.onBindViewHolder}, en la rama de
     * {@code ServiceRow.ServiceItem}, justo antes de que mire el icono del servicio (el nombre,
     * el toque y la marca de elegido ya están puestos).
     *
     * @param holder el {@code CheckmarkViewHolder} de la fila
     * @param item   el {@code ServiceRow.ServiceItem}
     * @return true si era la fila de Bardo y ya tiene su logo (el adapter no sigue con Glide)
     */
    public static boolean onBindService(Object holder, Object item) {
        try {
            Object rowService = item.getClass().getMethod("getService").invoke(item);
            if (!SERVICE_ID.equals(idOf(rowService))) return false;
            Object binding = holder.getClass().getMethod("getBinding").invoke(holder);
            Object view = BardoPatch.field(binding, "icStartImageview");
            if (!(view instanceof ImageView)) return false;
            ImageView image = (ImageView) view;
            cancelGlide(image);
            image.setImageBitmap(icon(image.getContext()));
            image.setVisibility(View.VISIBLE);
            return true;
        } catch (Throwable t) {
            Log.w(TAG, "onBindService falló", t);
            return false;
        }
    }

    /**
     * La fila es reciclada: si traía a medias la carga del icono de otro servicio, Glide lo
     * pintaría encima del logo al terminar. {@code Glide.with(context).clear(view)} la anula.
     */
    private static void cancelGlide(ImageView image) {
        try {
            Class<?> glide = Class.forName("com.bumptech.glide.Glide");
            Object manager = glide.getMethod("with", Context.class).invoke(null, image.getContext());
            manager.getClass().getMethod("clear", View.class).invoke(manager, image);
        } catch (Throwable t) {
            Log.w(TAG, "No se pudo anular la carga anterior del icono", t);
        }
    }

    /**
     * El logo de Bardo con la misma silueta que los iconos de los demás servicios: Letterboxd
     * les aplica {@code MaskTransformation(R.drawable.mask_service)} (pinta la máscara y, encima
     * y solo donde hay máscara, el icono). La vista mide 24 dp ({@code item_check_row}).
     */
    private static Bitmap icon(Context context) {
        Bitmap cached = icon;
        if (cached != null) return cached;
        Bitmap logo = BardoPatch.logo();
        int size = BardoPatch.dp(context, 24);
        Bitmap out = Bitmap.createBitmap(size, size, Bitmap.Config.ARGB_8888);
        Canvas canvas = new Canvas(out);
        Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG | Paint.FILTER_BITMAP_FLAG);
        RectF bounds = new RectF(0, 0, size, size);
        Drawable mask = null;
        try {
            int id = context.getResources().getIdentifier(
                    "mask_service", "drawable", context.getPackageName());
            if (id != 0) mask = context.getDrawable(id);
        } catch (Throwable ignored) {
        }
        if (mask != null) {
            mask.setBounds(0, 0, size, size);
            mask.draw(canvas);
        } else {
            float radius = size / 5f;
            canvas.drawRoundRect(bounds, radius, radius, paint);
        }
        paint.setXfermode(new PorterDuffXfermode(PorterDuff.Mode.SRC_IN));
        canvas.drawBitmap(logo, null, bounds, paint);
        icon = out;
        return out;
    }

    private static String idOf(Object service) {
        try {
            Object id = service.getClass().getMethod("getId").invoke(service);
            return id == null ? null : id.toString();
        } catch (Throwable t) {
            return null;
        }
    }

    private static Object field(Object target, String name) throws Exception {
        Field f = target.getClass().getDeclaredField(name);
        f.setAccessible(true);
        return f.get(target);
    }

    private static void setField(Object target, String name, Object value) throws Exception {
        Field f = target.getClass().getDeclaredField(name);
        f.setAccessible(true);
        f.set(target, value);
    }

    private static boolean isSpanish() {
        return "es".equals(java.util.Locale.getDefault().getLanguage());
    }

    private static void toast(final String message) {
        new Handler(Looper.getMainLooper()).post(new Runnable() {
            @Override
            public void run() {
                try {
                    Context context = (Context) Class.forName("android.app.ActivityThread")
                            .getMethod("currentApplication").invoke(null);
                    if (context != null) Toast.makeText(context, message, Toast.LENGTH_SHORT).show();
                } catch (Throwable ignored) {
                }
            }
        });
    }
}
