package app.parchefacemoji.extension.facemoji;

import android.util.Log;

import app.parchefacemoji.extension.facemoji.settings.PatchPreferences;

/**
 * Punto de entrada de la extension que se inyecta en Facemoji.
 *
 * Las clases de la extension se fusionan en el DEX de la app antes de aplicar los parches,
 * por lo que el codigo smali de los parches puede llamar a estos metodos.
 *
 * Aqui solo hay utilidades de diagnostico: todos los metodos son baratos y no
 * necesitan ningun contexto de Android, por lo que se pueden llamar desde
 * cualquier punto de entrada (incluso desde un hilo sin Looper).
 */
@SuppressWarnings("unused")
public final class PatchHooks {

    private static final String TAG = "ParcheFacemoji";

    private PatchHooks() {
    }

    /**
     * Registra en logcat que un anuncio se ha bloqueado.
     *
     * @param surface Identificador de la superficie bloqueada, por ejemplo "AdMob (banner)".
     */
    public static void logBlocked(String surface) {
        Log.d(TAG, "Anuncio bloqueado: " + surface);
    }

    /**
     * Registra en logcat que una llamada de rastreo se ha neutralizado.
     *
     * @param surface Identificador del rastreador, por ejemplo "Firebase Analytics (logEvent)".
     */
    public static void logTrackerBlocked(String surface) {
        Log.d(TAG, "Rastreo neutralizado: " + surface);
    }

    /**
     * Indica si el parche de anuncios debe actuar.
     *
     * El smali lo consulta al principio del metodo parcheado: si devuelve `false`, se deja
     * pasar el codigo original de la app (el parche queda desactivado sin desinstalar nada).
     */
    public static boolean esAnunciosActivo() {
        return PatchPreferences.anuncios();
    }

    /** Indica si el parche de VIP debe actuar. */
    public static boolean esVipActivo() {
        return PatchPreferences.vip();
    }

    /** Indica si el parche de rastreo debe actuar. */
    public static boolean esRastreoActivo() {
        return PatchPreferences.rastreo();
    }

    /**
     * Compatibilidad con los parches antiguos, que preguntaban por este nombre.
     *
     * @deprecated usa {@link #esAnunciosActivo()}.
     */
    @Deprecated
    public static boolean shouldBlockAds() {
        return esAnunciosActivo();
    }
}
