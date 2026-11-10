package io.github.bryceaspringfield.morphe.extension.youtube;

import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

/** The bundle's texts in English and Spanish, chosen by the app's language. */
final class Strings {

    private static final Map<String, String[]> T = new HashMap<>();

    private static void put(String key, String en, String es) {
        T.put(key, new String[]{en, es});
    }

    static {
        put("screen", "YouTube Extras", "YouTube Extras");
        put("screen_summary", "Channel filters, video length, categories, topics, automatic feedback, and fixes",
                "Filtros por canal, duración, categorías, temas, comentarios automáticos y correcciones");
        put("cat_filters", "Filters", "Filtros");
        put("cat_where", "Where the filters apply", "Dónde se aplican los filtros");
        put("cat_auto", "Automatic actions", "Acciones automáticas");
        put("cat_layout", "Layout", "Diseño");
        put("cat_fixes", "Fixes", "Correcciones");
        put("channel_rules", "Channel filters", "Filtros por canal");
        put("channel_rules_summary",
                "One rule a line, CHANNEL: RULE. The channel is an @handle, a channel ID, or its name. Rules: all, live, shorts, playlists, <5:00, >1:00:00, a word or \"phrase\" of the title, or comments: word. Example: @channel: live, shorts",
                "Una regla por línea, CANAL: REGLA. El canal es un @identificador, un ID de canal o su nombre. Reglas: all, live, shorts, playlists, <5:00, >1:00:00, una palabra o \"frase\" del título, o comments: palabra. Ejemplo: @canal: live, shorts");
        put("min_length", "Hide videos shorter than", "Ocultar videos de menos de");
        put("max_length", "Hide videos longer than", "Ocultar videos de más de");
        put("length_summary", "m:ss, h:mm:ss, or minutes; blank shows every length",
                "m:ss, h:mm:ss o minutos; en blanco muestra todas las duraciones");
        put("home_playlists", "Hide playlists on Home", "Ocultar playlists en Inicio");
        put("home_playlists_summary", "Playlists and courses in the home feed (mixes: Morphe's Hide mix playlists)",
                "Playlists y cursos del feed de Inicio (las mezclas: Ocultar playlists mix de Morphe)");
        put("topics", "Hide by topic", "Ocultar por tema");
        put("topics_summary", "Videos and channels whose titles or names promote the topics chosen",
                "Videos y canales cuyos títulos o nombres promueven los temas elegidos");
        put("hidden_channels", "Channels to hide", "Canales para ocultar");
        put("hidden_channels_summary", "One channel a line (@handle, channel ID, or name); every video is hidden",
                "Un canal por línea (@identificador, ID de canal o nombre); se ocultan todos sus videos");
        put("categories", "Hide by category", "Ocultar por categoría");
        put("categories_summary", "YouTube's category of each video, looked up once a video",
                "La categoría de YouTube de cada video, consultada una vez por video");
        put("apply_home", "Home", "Inicio");
        put("apply_subscriptions", "Subscriptions", "Suscripciones");
        put("apply_search", "Search results", "Resultados de búsqueda");
        put("apply_related", "Videos under the player", "Videos debajo del reproductor");
        put("auto_dislike", "Mark hidden videos as not liked",
                "Marcar los videos ocultos como no me gusta");
        put("auto_dislike_summary", "Each video the filters hide gets Not interested > Tell us why > I don't like the video",
                "Cada video que ocultan los filtros recibe No me interesa > Dinos el motivo > No me gusta el video");
        put("auto_watched", "Mark watched videos", "Marcar videos vistos");
        put("auto_watched_summary", "Videos with the red progress bar get Not interested > Tell us why > I've already watched the video",
                "Los videos con la barra roja de progreso reciben No me interesa > Dinos el motivo > Ya miré el video");
        put("auto_watched_off", "Off", "Desactivado");
        put("auto_watched_partly", "Partly watched (any progress bar)", "Vistos en parte (cualquier barra)");
        put("auto_watched_fully", "Fully watched (90% or more)", "Vistos por completo (90% o más)");
        put("auto_like", "Like every video watched", "Dar Me gusta a cada video que mires");
        put("auto_like_summary", "When a video opens; an existing like or dislike stays",
                "Al abrir un video; un Me gusta o No me gusta existente se mantiene");
        put("save_chooser", "Save button opens the playlist list", "El botón Guardar abre la lista de playlists");
        put("save_chooser_summary", "In place of saving to Watch later or the last playlist",
                "En vez de guardar en Ver más tarde o en la última playlist");
        put("hide_community", "Hide the community panel of comments", "Ocultar el panel de comunidad de los comentarios");
        put("hide_community_summary", "The panel reached by swiping in a comment section (Community ... Visit)",
                "El panel que aparece al deslizar en los comentarios (Comunidad de ... Visitar)");
        put("hide_dots", "Hide dots on the subscribed channels bar", "Ocultar los puntos de la barra de canales suscritos");
        put("live_chat_all", "Live chat opens on all messages", "El chat en vivo abre en Todos los mensajes");
        put("live_chat_all_summary", "In place of Top chat", "En vez de Mensajes principales");
        put("fix_nav", "Fix bottom bar buttons needing two taps", "Corregir los botones de la barra inferior que requieren dos toques");
        put("fix_network", "Recover playback after the connection changes",
                "Recuperar la reproducción cuando cambia la conexión");
        put("fix_network_summary", "Reloads a video stuck loading once the internet connection returns",
                "Recarga un video que se queda cargando cuando vuelve la conexión a internet");
        put("debug", "Log feed items", "Registrar los elementos del feed");
        put("debug_summary", "Each item's channel, length, and type in the log (Morphe's Debug logging)",
                "El canal, la duración y el tipo de cada elemento en el registro (registro de depuración de Morphe)");
    }

    private Strings() {
    }

    static boolean spanish() {
        try {
            return "es".equals(app.morphe.extension.shared.Utils.getContext().getResources().getConfiguration()
                    .getLocales().get(0).getLanguage());
        } catch (Throwable t) {
            return "es".equals(Locale.getDefault().getLanguage());
        }
    }

    static String get(String key) {
        String[] v = T.get(key);
        if (v == null) return key;
        return spanish() ? v[1] : v[0];
    }
}
