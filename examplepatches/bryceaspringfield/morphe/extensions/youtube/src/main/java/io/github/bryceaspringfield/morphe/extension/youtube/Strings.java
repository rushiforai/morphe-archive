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
        put("dearrow_tap", "Tap the DeArrow icon to switch titles", "Tocar el icono de DeArrow para cambiar el título");
        put("dearrow_tap_summary", "A tap on the icon before a DeArrow title shows the video's own title, and a second tap the DeArrow title (needs Morphe's DeArrow titles and their icon)",
                "Un toque en el icono que precede a un título de DeArrow muestra el título propio del video, y un segundo toque el de DeArrow (requiere los títulos de DeArrow de Morphe y su icono)");
        put("dearrow_suggest", "Suggest DeArrow titles", "Sugerir títulos de DeArrow");
        put("dearrow_suggest_summary", "A pencil before the open video's title sends a title to DeArrow",
                "Un lápiz antes del título del video abierto envía un título a DeArrow");
        put("dearrow_suggest_title", "Suggest a DeArrow title", "Sugerir un título de DeArrow");
        put("dearrow_suggest_message", "Describe the video plainly, in sentence case, with no clickbait. DeArrow shows a title once enough users vote for it.",
                "Describe el video con claridad, con mayúscula solo al inicio y sin clickbait. DeArrow muestra un título cuando suficientes usuarios lo votan.");
        put("dearrow_send", "Send", "Enviar");
        put("dearrow_sent", "Title sent to DeArrow", "Título enviado a DeArrow");
        put("dearrow_refused", "DeArrow refused the title", "DeArrow rechazó el título");
        put("dearrow_failed", "The title was not sent (no connection to DeArrow)", "No se envió el título (sin conexión con DeArrow)");
        put("dearrow_no_original", "The video's own title was not found", "No se encontró el título propio del video");
        put("live_catch_up", "Catch up to live streams", "Alcanzar el directo");
        put("live_catch_up_summary", "A live stream more than 12 s behind its live edge plays faster until it is within 5 s, then returns to its speed",
                "Un directo con más de 12 s de retraso respecto al momento en vivo se reproduce más rápido hasta quedar a menos de 5 s, y luego vuelve a su velocidad");
        put("live_catch_up_speed", "Catch-up speed", "Velocidad para alcanzar el directo");
        put("live_catch_up_speed_summary", "From 1.25 to 4; 2 by default", "De 1.25 a 4; 2 por defecto");
        put("cat_playback", "Playback", "Reproducción");
        put("keep_playing", "Keep playing when the screen turns off", "Seguir reproduciendo al apagar la pantalla");
        put("keep_playing_summary", "A video playing when the screen turns off, which pauses within 8 s, plays again (in picture in picture too)",
                "Un video que se pausa en los 8 s después de apagar la pantalla vuelve a reproducirse (también en imagen en imagen)");
        put("audio_only_off", "Lowest quality while the screen is off", "Calidad mínima con la pantalla apagada");
        put("audio_only_off_summary", "The video switches to its lowest quality when the screen turns off and back when it turns on",
                "El video pasa a su calidad mínima al apagar la pantalla y vuelve a la anterior al encenderla");
        put("vote_format", "Like and dislike counts", "Recuentos de me gusta y no me gusta");
        put("vote_format_summary", "Return YouTube Dislike's counts as numbers, percentages of all votes, or both",
                "Los recuentos de Return YouTube Dislike como números, porcentajes del total de votos o ambos");
        put("vote_format_count", "Numbers", "Números");
        put("vote_format_percent", "Percentages", "Porcentajes");
        put("vote_format_both", "Numbers and percentages", "Números y porcentajes");
        put("chat_avatar", "Live chat profile pictures open the channel", "Las fotos de perfil del chat en directo abren el canal");
        put("chat_avatar_summary", "A tap on a message's profile picture opens its author's channel",
                "Tocar la foto de perfil de un mensaje abre el canal de su autor");
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
