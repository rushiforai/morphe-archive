package app.parchefacemoji.extension.facemoji.settings;

import android.content.Context;
import android.content.SharedPreferences;

import java.lang.reflect.Method;

/**
 * Preferencias del parche, compartidas entre los hooks del DEX y la pantalla de ajustes.
 *
 * Cada interruptor de la pantalla escribe aqui, y los metodos que inyectan los parches leen
 * de aqui para decidir si actuan o dejan pasar el codigo original. Asi se pueden activar y
 * desactivar sin volver a parchear la app.
 *
 * Los valores se cachean en memoria: los hooks se llaman muchas veces por segundo (cada vez
 * que se pinta el catalogo de fuentes, por ejemplo) y no conviene tocar el disco en cada
 * llamada.
 */
public final class PatchPreferences {

    /** Nombre del fichero de preferencias dentro de la app. */
    public static final String NOMBRE = "parche_facemoji";

    public static final String CLAVE_ANUNCIOS = "bloquear_anuncios";
    public static final String CLAVE_VIP = "desbloquear_vip";
    public static final String CLAVE_RASTREO = "desactivar_rastreo";

    private static volatile Context contexto;
    private static volatile SharedPreferences preferencias;

    private static volatile Boolean cacheAnuncios;
    private static volatile Boolean cacheVip;
    private static volatile Boolean cacheRastreo;

    private PatchPreferences() {
    }

    /**
     * Guarda el contexto de la app. La llama la pantalla de ajustes al abrirse.
     *
     * @param contextoApp cualquier contexto valido (se usa el de la aplicacion).
     */
    public static void iniciar(Context contextoApp) {
        if (contextoApp == null) return;
        contexto = contextoApp.getApplicationContext();
        limpiarCache();
    }

    /** Indica si el parche de anuncios debe actuar. */
    public static boolean anuncios() {
        Boolean cacheado = cacheAnuncios;
        if (cacheado != null) return cacheado;
        boolean valor = leer(CLAVE_ANUNCIOS, true);
        cacheAnuncios = valor;
        return valor;
    }

    /** Indica si el parche de VIP debe actuar. */
    public static boolean vip() {
        Boolean cacheado = cacheVip;
        if (cacheado != null) return cacheado;
        boolean valor = leer(CLAVE_VIP, true);
        cacheVip = valor;
        return valor;
    }

    /** Indica si el parche de rastreo debe actuar. */
    public static boolean rastreo() {
        Boolean cacheado = cacheRastreo;
        if (cacheado != null) return cacheado;
        boolean valor = leer(CLAVE_RASTREO, true);
        cacheRastreo = valor;
        return valor;
    }

    /**
     * Cambia un interruptor y lo guarda.
     *
     * @param clave una de las constantes CLAVE_*.
     * @param valor nuevo estado.
     */
    public static void guardar(String clave, boolean valor) {
        SharedPreferences prefs = preferencias();
        if (prefs != null) {
            prefs.edit().putBoolean(clave, valor).apply();
        }
        limpiarCache();
    }

    private static boolean leer(String clave, boolean porDefecto) {
        SharedPreferences prefs = preferencias();
        if (prefs == null) {
            // Sin contexto todavia (la app aun no ha abierto los ajustes): se asume que el
            // parche esta activo, que es el comportamiento clasico del bundle.
            return porDefecto;
        }
        try {
            return prefs.getBoolean(clave, porDefecto);
        } catch (Throwable ignorado) {
            return porDefecto;
        }
    }

    private static SharedPreferences preferencias() {
        SharedPreferences prefs = preferencias;
        if (prefs != null) return prefs;

        synchronized (PatchPreferences.class) {
            if (preferencias != null) return preferencias;

            Context ctx = contexto;
            if (ctx == null) ctx = contextoDeLaApp();
            if (ctx == null) return null;

            contexto = ctx;
            preferencias = ctx.getSharedPreferences(NOMBRE, Context.MODE_PRIVATE);
            return preferencias;
        }
    }

    /**
     * Consigue el contexto de la aplicacion sin depender de que la pantalla de ajustes se
     * haya abierto alguna vez.
     */
    private static Context contextoDeLaApp() {
        try {
            Class<?> activityThread = Class.forName("android.app.ActivityThread");
            Method currentApplication = activityThread.getMethod("currentApplication");
            Object aplicacion = currentApplication.invoke(null);
            if (aplicacion instanceof Context) {
                return ((Context) aplicacion).getApplicationContext();
            }
        } catch (Throwable ignorado) {
            // En algunos dispositivos el metodo esconde la llamada; se usa el valor por defecto.
        }
        return null;
    }

    private static void limpiarCache() {
        cacheAnuncios = null;
        cacheVip = null;
        cacheRastreo = null;
    }
}
