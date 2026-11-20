package app.parchefacemoji.extension.facemoji.settings;

import android.content.Context;
import android.content.Intent;
import android.preference.Preference;
import android.preference.PreferenceFragment;
import android.preference.PreferenceGroup;
import android.preference.PreferenceScreen;
import android.util.Log;

import android.graphics.drawable.Drawable;
import android.view.View;
import android.view.ViewGroup;

import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.List;

/**
 * Añade la fila "Ajustes de Minecraco" dentro de los ajustes de Facemoji.
 *
 * El parche inyecta una llamada a {@link #agregarEntrada(Object)} al principio de
 * `SettingsAdvancedFragment.onResume()`, que es un `android.preference.PreferenceFragment`:
 * a esas alturas la pantalla de preferencias ya esta creada, asi que basta con anadir una
 * `Preference` mas a la lista.
 *
 * Todo va envuelto en `try/catch`: si una version futura cambia esa pantalla, la app tiene
 * que seguir abriendo los ajustes con normalidad aunque nuestra fila no aparezca.
 */
@SuppressWarnings("deprecation")
public final class SettingsEntry {

    private static final String TAG = "ParcheFacemoji";

    /** Clave de la preferencia, para no anadirla dos veces. */
    public static final String CLAVE = "parche_facemoji_ajustes";

    /** Clave de la fila de la lista nueva (la que se ve en la pantalla de Ajustes). */
    public static final String CLAVE_FILA = "ajustes_minecraco";

    /** Tipo que se le da a nuestra fila; no coincide con ninguno de Facemoji. */
    private static final int TIPO_PROPIO = 7777;

    /** La instancia exacta de nuestra fila, para reconocerla cuando el usuario la toca. */
    private static volatile Object filaPropia;

    private SettingsEntry() {
    }

    /**
     * Punto de inyeccion: anade la fila a la pantalla de ajustes recibida.
     *
     * Se llama desde los dos fragments de ajustes de Facemoji que usan preferencias: el
     * principal (`SettingsMainFragment`, el que se ve al abrir Ajustes) y el avanzado.
     *
     * @param fragmento el fragment de Facemoji (se recibe como `Object` para no obligar al
     *                  parche a conocer su tipo exacto).
     */
    public static void agregarEntrada(Object fragmento) {
        if (!(fragmento instanceof PreferenceFragment)) return;

        try {
            PreferenceFragment ajustes = (PreferenceFragment) fragmento;
            PreferenceScreen pantalla = ajustes.getPreferenceScreen();
            if (pantalla == null) return;

            // Si ya esta puesta, no se duplica (onResume se llama varias veces).
            if (pantalla.findPreference(CLAVE) != null) return;

            final Context contexto = ajustes.getActivity();
            if (contexto == null) return;

            PatchPreferences.iniciar(contexto);

            Preference fila = new Preference(contexto);
            fila.setKey(CLAVE);
            fila.setTitle("Ajustes Minecraco");
            fila.setSummary("Anuncios, VIP y rastreo");
            fila.setOnPreferenceClickListener(new Preference.OnPreferenceClickListener() {
                @Override
                public boolean onPreferenceClick(Preference preferencia) {
                    try {
                        Intent intento = new Intent(
                                preferencia.getContext(),
                                SettingsActivity.class
                        );
                        intento.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
                        preferencia.getContext().startActivity(intento);
                    } catch (Throwable error) {
                        Log.w(TAG, "No se pudieron abrir los ajustes del parche", error);
                    }
                    return true;
                }
            });

            insertarLaPrimera(pantalla, fila);
        } catch (Throwable error) {
            Log.w(TAG, "No se pudo anadir la entrada de ajustes del parche", error);
        }
    }

    /**
     * Coloca la fila como la primera de la lista.
     *
     * `PreferenceGroup` solo ofrece `addPreference`, que anyade al final. Para que aparezca arriba
     * del todo se anyade primero (asi el grupo la engancha y se registra bien) y despues se mueve
     * al principio de su lista interna por reflexion. Si algo de eso falla, la fila se queda al
     * final en vez de perderse.
     */
    private static void insertarLaPrimera(PreferenceGroup grupo, Preference fila) {
        grupo.addPreference(fila);

        try {
            Field campoLista = PreferenceGroup.class.getDeclaredField("mPreferenceList");
            campoLista.setAccessible(true);

            Object valor = campoLista.get(grupo);
            if (!(valor instanceof List)) return;

            @SuppressWarnings("unchecked")
            List<Preference> lista = (List<Preference>) valor;

            if (lista.remove(fila)) {
                lista.add(0, fila);

                // Avisar al grupo de que la lista ha cambiado para que se vuelva a pintar.
                Method avisar = Preference.class.getDeclaredMethod("notifyChanged");
                avisar.setAccessible(true);
                avisar.invoke(grupo);
            }
        } catch (Throwable error) {
            Log.w(TAG, "No se pudo poner la entrada la primera; se queda al final", error);
        }
    }

    // ----------------------------------------------------------------------------------
    // Pantalla de ajustes de la app (RecyclerView)
    // ----------------------------------------------------------------------------------

    /**
     * Punto de inyeccion para la pantalla de ajustes que se ve en la app.
     *
     * Esa lista no usa preferencias: `SettingFragment` monta un `RecyclerView` con filas del
     * modelo `La9/b` metidas en un `ArrayList`. El parche llama a este metodo al final del
     * metodo que construye la lista, y aqui se cuela nuestra fila en el primer puesto.
     *
     * Para no depender de los nombres ofuscados se busca la lista por su contenido: el primer
     * campo de la clase que sea una `List` llena de objetos del mismo tipo que las filares de
     * la app. Si algo no encaja, se sale sin tocar nada.
     *
     * @param fragmento el `SettingFragment` de Facemoji (se recibe como `Object`).
     */
    public static void agregarFilaEnLista(Object fragmento) {
        if (fragmento == null) return;

        try {
            List<Object> filas = buscarListaDeFilas(fragmento);
            if (filas == null || filas.isEmpty()) {
                Log.w(TAG, "No se ha encontrado la lista de ajustes de la app");
                return;
            }

            if (CLAVE_FILA.equals(claveDe(filas.get(0))) && filas.get(0) == filaPropia) return;

            Context contexto = contextoDe(fragmento);
            if (contexto == null) return;

            PatchPreferences.iniciar(contexto);

            Class<?> modelo = filas.get(0).getClass();
            Object fila = crearFila(modelo, contexto);
            if (fila == null) {
                Log.w(TAG, "No se ha podido crear la fila: " + modelo.getName());
                return;
            }

            // Si ya estaba puesta (el fragment se recrea), se quita antes de volver a ponerla.
            quitarFilasPrevias(filas);

            filas.add(0, fila);
            filaPropia = fila;

            avisarAlAdaptador(fragmento);
            Log.i(TAG, "Fila \"Ajustes Minecraco\" puesta la primera de la lista");
        } catch (Throwable error) {
            Log.w(TAG, "No se pudo anadir la fila a la lista de ajustes", error);
        }
    }

    /**
     * Dice si el elemento que se ha pulsado es nuestra fila.
     *
     * @param fila el modelo de la fila pulsada.
     * @return `true` solo para la fila que hemos creado nosotros.
     */
    public static boolean esNuestraFila(Object fila) {
        Object nuestra = filaPropia;
        return nuestra != null && nuestra == fila;
    }

    /**
     * Abre la pantalla de ajustes del parche desde una vista de Facemoji.
     *
     * @param vista cualquier vista de la app (se usa su contexto).
     */
    public static void abrirDesde(View vista) {
        if (vista == null) return;

        try {
            Intent intento = new Intent(vista.getContext(), SettingsActivity.class);
            intento.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
            vista.getContext().startActivity(intento);
        } catch (Throwable error) {
            Log.w(TAG, "No se pudieron abrir los ajustes del parche", error);
        }
    }

    /** Busca la lista de filas dentro del fragment. */
    @SuppressWarnings("unchecked")
    private static List<Object> buscarListaDeFilas(Object fragmento) {
        for (Class<?> tipo = fragmento.getClass(); tipo != null; tipo = tipo.getSuperclass()) {
            for (Field campo : tipo.getDeclaredFields()) {
                if (!List.class.isAssignableFrom(campo.getType())) continue;

                try {
                    campo.setAccessible(true);
                    Object valor = campo.get(fragmento);
                    if (!(valor instanceof List)) continue;

                    List<Object> lista = (List<Object>) valor;
                    if (lista.isEmpty()) continue;

                    // Nos quedamos con la lista que contiene filas de ajustes.
                    if (claveDe(lista.get(0)) != null) return lista;
                } catch (Throwable ignorado) {
                    // Campo inaccesible: se prueba con el siguiente.
                }
            }
        }
        return null;
    }

    /** Devuelve la clave de una fila, o `null` si no parece una fila de ajustes. */
    private static String claveDe(Object fila) {
        if (fila == null) return null;

        try {
            Method obtener = fila.getClass().getMethod("getKey");
            Object clave = obtener.invoke(fila);
            return clave instanceof String ? (String) clave : null;
        } catch (Throwable ignorado) {
            return null;
        }
    }

    /** Crea una fila con el mismo tipo que las de Facemoji, pero con nuestro texto. */
    private static Object crearFila(Class<?> modelo, Context contexto) {
        try {
            Constructor<?> constructor = modelo.getConstructor(
                    String.class,
                    Drawable.class,
                    int.class,
                    String.class
            );

            Drawable icono = contexto.getResources().getDrawable(android.R.drawable.ic_menu_manage);

            return constructor.newInstance("Ajustes Minecraco", icono, TIPO_PROPIO, CLAVE_FILA);
        } catch (Throwable error) {
            Log.w(TAG, "Constructor de fila no disponible en " + modelo.getName(), error);
            return null;
        }
    }

    /** Quita las filas nuestras de una pasada anterior. */
    private static void quitarFilasPrevias(List<Object> filas) {
        Object nuestra = filaPropia;
        if (nuestra == null) return;

        filas.remove(nuestra);
        filaPropia = null;
    }

    /** Avisa al RecyclerView de que la lista ha cambiado para que se repinte. */
    private static void avisarAlAdaptador(Object fragmento) {
        try {
            Method obtenerVista = fragmento.getClass().getMethod("getView");
            Object vista = obtenerVista.invoke(fragmento);
            if (!(vista instanceof View)) return;

            View reciclador = buscarReciclador((View) vista);
            if (reciclador == null) return;

            Object adaptador = reciclador.getClass()
                    .getMethod("getAdapter")
                    .invoke(reciclador);

            if (adaptador != null) {
                adaptador.getClass().getMethod("notifyDataSetChanged").invoke(adaptador);
            }
        } catch (Throwable ignorado) {
            // Si no se puede avisar, la lista se pintara al recrear la pantalla.
        }
    }

    /** Busca el RecyclerView dentro de un arbol de vistas. */
    private static View buscarReciclador(View vista) {
        if (vista.getClass().getName().endsWith("RecyclerView")) return vista;

        if (vista instanceof ViewGroup) {
            ViewGroup grupo = (ViewGroup) vista;
            for (int i = 0; i < grupo.getChildCount(); i++) {
                View encontrado = buscarReciclador(grupo.getChildAt(i));
                if (encontrado != null) return encontrado;
            }
        }
        return null;
    }

    /** Consigue un contexto a partir del fragment. */
    private static Context contextoDe(Object fragmento) {
        for (String metodo : new String[]{"getContext", "getActivity"}) {
            try {
                Object valor = fragmento.getClass().getMethod(metodo).invoke(fragmento);
                if (valor instanceof Context) return (Context) valor;
            } catch (Throwable ignorado) {
                // Se prueba con el siguiente.
            }
        }

        try {
            Object vista = fragmento.getClass().getMethod("getView").invoke(fragmento);
            if (vista instanceof View) return ((View) vista).getContext();
        } catch (Throwable ignorado) {
            // Sin contexto: no se puede continuar.
        }
        return null;
    }
}
