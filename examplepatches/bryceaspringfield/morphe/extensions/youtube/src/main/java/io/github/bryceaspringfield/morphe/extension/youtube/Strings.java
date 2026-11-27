package io.github.bryceaspringfield.morphe.extension.youtube;

import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

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
        put("cat_extras", "YouTube Extras", "YouTube Extras");
        put("channel_rules", "Channel filters", "Filtros por canal");
        put("channel_rules_summary",
                "One rule a line, CHANNEL: RULE. The channel is an @handle, a channel ID, or its name. Rules: all, live, shorts, playlists, <5:00, >1:00:00, a word or \"phrase\" of the title, or comments: word. Example: @channel: live, shorts",
                "Una regla por línea, CANAL: REGLA. El canal es un @identificador, un ID de canal o su nombre. Reglas: all, live, shorts, playlists, <5:00, >1:00:00, una palabra o \"frase\" del título, o comments: palabra. Ejemplo: @canal: live, shorts");
        put("min_length", "Hide videos shorter than", "Ocultar videos de menos de");
        put("max_length", "Hide videos longer than", "Ocultar videos de más de");
        put("length_summary", "m:ss, h:mm:ss, or minutes; blank shows every length",
                "m:ss, h:mm:ss o minutos; en blanco muestra todas las duraciones");
        put("min_views", "Hide videos with fewer views than", "Ocultar videos con menos visualizaciones que");
        put("min_views_summary", "5000, 5k, or 1.5m; blank shows every video",
                "5000, 5k o 1.5m; en blanco muestra todos");
        put("views_keep_new", "Keep new videos when filtering by views", "Conservar los videos nuevos al filtrar por visualizaciones");
        put("views_keep_new_summary", "Off: a video under a day old is hidden when it has fewer views than the number above. On: it stays, since it has had little time to gain views",
                "Desactivado: un video de menos de un día se oculta si tiene menos visualizaciones que el número de arriba. Activado: se queda, pues tuvo poco tiempo para sumar visualizaciones");
        put("resuggested_related", "Count suggestions under videos too", "Contar también las sugerencias bajo los videos");
        put("resuggested_related_summary", "Not interested after repeated suggestions also runs on the videos listed under the player",
                "No me interesa tras sugerencias repetidas también actúa en los videos de debajo del reproductor");
        put("dislike_channels", "Dislike every video of these channels", "No me gusta en cada video de estos canales");
        put("dislike_channels_summary", "One channel a line (a name, an @handle, or a channel link). Each video you open from one is disliked, unless it already is, and Like every video skips it",
                "Un canal por línea (un nombre, un @identificador o un enlace). Cada video que abras de uno recibe No me gusta, salvo que ya lo tenga, y Dar Me gusta a cada video lo omite");
        put("live_catch_up_delay", "Catch-up delay (seconds)", "Retraso para alcanzar el directo (segundos)");
        put("live_catch_up_delay_summary", "How far behind the live edge a stream must fall before the speed starts (5 by default, 0 to 15); the speed then runs until the edge is reached. 0 keeps it on at the edge too",
                "Cuánto debe retrasarse un directo respecto de su borde antes de acelerar (5 por defecto, de 0 a 15); la velocidad dura hasta llegar al borde. Con 0 también sigue en el borde");
        put("audio_only_low", "Lowest video quality while listening", "Calidad de video mínima al solo escuchar");
        put("audio_only_low_summary", "Audio only also asks for the lowest video quality, so the player fetches the least video it can; the quality returns when Audio only ends",
                "Solo audio también pide la calidad de video mínima, para que el reproductor descargue el mínimo de video; la calidad vuelve cuando termina Solo audio");
        put("auto_pip", "Picture in picture when leaving the app", "Imagen en imagen al salir de la app");
        put("auto_pip_summary", "A video playing in the watch player opens in picture in picture when you go home or to another app (Android 12 and later)",
                "Un video que se reproduce en el reproductor pasa a imagen en imagen al ir al inicio o a otra app (Android 12 y posteriores)");
        put("max_age", "Hide videos older than", "Ocultar videos de más de");
        put("max_age_summary", "Days (30), weeks (8w), months (6m), or years (2y); blank shows every age",
                "Días (30), semanas (8w), meses (6m) o años (2y); en blanco muestra todas las edades");
        put("members_only", "Hide members-only videos", "Ocultar videos solo para miembros");
        put("members_only_summary", "Videos only a channel's paying members can watch, in every feed",
                "Videos que solo pueden ver los miembros de pago de un canal, en todos los feeds");
        put("upcoming", "Hide upcoming premieres and scheduled streams", "Ocultar estrenos y directos programados");
        put("upcoming_summary", "Videos and streams which have not started yet (\"Premieres in 3 hours\", \"Scheduled for\"), in every feed",
                "Videos y directos que aún no empezaron (\"Se estrena en 3 horas\", \"Programado para\"), en todos los feeds");
        put("sleep_timer", "Stop playback after (minutes)", "Detener la reproducción tras (minutos)");
        put("sleep_timer_summary", "A sleep timer: the first playback starts the countdown, and a video still playing when it ends is paused; playing again starts a new one. Blank is off",
                "Un temporizador: la primera reproducción inicia la cuenta atrás y un video que sigue sonando al terminar se pausa; reproducir de nuevo inicia otra. En blanco está desactivado");
        put("home_playlists", "Hide playlists on Home", "Ocultar playlists en Inicio");
        put("home_live", "Hide live streams on Home", "Ocultar directos en Inicio");
        put("home_live_summary", "Live streams in the home feed; the Subscriptions feed keeps them",
                "Los directos del feed de Inicio; el feed de Suscripciones los conserva");
        put("resuggested", "Not interested after repeated suggestions", "No me interesa tras sugerencias repetidas");
        put("resuggested_summary", "Now %d: a video Home suggests this many times (visits 10 minutes or more apart) which you never opened gets Not interested and is hidden",
                "Ahora %d: un vídeo que Inicio sugiere estas veces (visitas con 10 minutos o más entre ellas) y que nunca abriste recibe No me interesa y se oculta");
        put("resuggested_off", "Off (0): type a number of suggestions to turn it on", "Desactivado (0): escribe un número de sugerencias para activarlo");
        put("resuggested_dialog", "Suggestions on Home before Not interested (0 turns it off)", "Sugerencias en Inicio antes de No me interesa (0 lo desactiva)");
        put("resuggested_invalid", "Type a whole number, such as 3", "Escribe un número entero, como 3");
        put("past_streams", "Hide past live streams", "Ocultar directos pasados");
        put("past_streams_summary", "Recordings of live streams which have ended (\"Streamed 2 days ago\"), in every feed; streams live now stay",
                "Grabaciones de directos ya terminados (\"Emitido hace 2 días\"), en todos los feeds; los directos en curso se quedan");
        put("home_playlists_summary", "Playlists, podcasts, and courses in the home feed (mixes: Morphe's Hide mix playlists)",
                "Playlists, podcasts y cursos del feed de Inicio (las mezclas: Ocultar playlists mix de Morphe)");
        put("topics", "Hide by topic", "Ocultar por tema");
        put("topics_summary", "Videos and channels whose titles or names promote the topics chosen",
                "Videos y canales cuyos títulos o nombres promueven los temas elegidos");
        put("cf_summary_none", "Hide a channel's videos, live streams, Shorts, playlists, or videos by length or words",
                "Oculta los videos, directos, Shorts, listas o videos por duración o palabras de un canal");
        put("cf_summary", "%d channels", "%d canales");
        put("comment_title", "Titles corrected in the comments", "Títulos corregidos en los comentarios");
        put("comment_title_summary", "When a top comment with 3 or more likes states the correct title (e.g., \"... correct title\"), that title is shown, marked ❝; tap ❝ for the video's own title. The ✎ suggestion to DeArrow starts from it.",
                "Cuando un comentario destacado con 3 o más me gusta indica el título correcto (p. ej., \"... correct title\"), se muestra ese título, marcado con ❝; toca ❝ para ver el título del video. La sugerencia ✎ a DeArrow parte de él.");
        put("cf_add", "Add channel", "Añadir canal");
        put("cf_edit", "Edit channel filter", "Editar filtro del canal");
        put("cf_text", "Edit as text", "Editar como texto");
        put("cf_close", "Close", "Cerrar");
        put("cf_save", "Save", "Guardar");
        put("cf_cancel", "Cancel", "Cancelar");
        put("cf_delete", "Delete", "Eliminar");
        put("cf_empty", "No channel filters yet. Tap Add channel to hide a channel's videos, live streams, Shorts, playlists, or its videos by length or words.",
                "Aún no hay filtros por canal. Toca Añadir canal para ocultar los videos, directos, Shorts o listas de un canal, o sus videos por duración o palabras.");
        put("cf_channel", "Channel", "Canal");
        put("cf_channel_hint", "Name, @handle, or channel link", "Nombre, @identificador o enlace del canal");
        put("cf_channel_needed", "Enter or pick a channel", "Escribe o elige un canal");
        put("cf_pick", "Pick a channel you've seen", "Elegir un canal visto");
        put("cf_hide", "Hide", "Ocultar");
        put("cf_all", "Every video", "Todos los videos");
        put("cf_live", "Live streams", "Directos");
        put("cf_shorts", "Shorts", "Shorts");
        put("cf_playlists", "Playlists and mixes", "Listas y mixes");
        put("cf_shorter", "shorter than", "de menos de");
        put("cf_longer", "longer than", "de más de");
        put("cf_shorter_label", "Videos shorter than", "Videos de menos de");
        put("cf_longer_label", "Videos longer than", "Videos de más de");
        put("cf_off", "Off", "No");
        put("cf_words", "Videos whose title has", "Videos cuyo título contiene");
        put("cf_words_hint", "Words, separated by commas; \"quotes\" for whole words",
                "Palabras separadas por comas; \"comillas\" para palabras completas");
        put("cf_words_short", "title:", "título:");
        put("cf_comments", "Comments under its videos that have", "Comentarios en sus videos que contienen");
        put("cf_comments_short", "comments:", "comentarios:");
        put("cf_nothing", "Nothing hidden yet", "Nada oculto aún");
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
        put("apply_channel", "Channel pages", "Páginas de canales");
        put("cat_watched_where", "Mark watched videos applies to", "Marcar videos vistos se aplica a");
        put("auto_dislike", "Mark hidden videos as not liked",
                "Marcar los videos ocultos como no me gusta");
        put("auto_dislike_summary", "Each video the filters hide gets Not interested > Tell us why > I don't like the video",
                "Cada video que ocultan los filtros recibe No me interesa > Dinos el motivo > No me gusta el video");
        put("auto_reason", "Give the reason after Not interested",
                "Dar el motivo después de No me interesa");
        put("auto_reason_summary", "When you choose Not interested on a video and pick no reason within 5 seconds, the app sends Tell us why > I don't like the video",
                "Cuando eliges No me interesa en un video y no indicas el motivo en 5 segundos, la app envía Dinos el motivo > No me gusta el video");
        put("auto_watched", "Mark watched videos", "Marcar videos vistos");
        put("auto_watched_summary", "Videos with the red progress bar get Not interested > Tell us why > I've already watched the video",
                "Los videos con la barra roja de progreso reciben No me interesa > Dinos el motivo > Ya miré el video");
        put("auto_watched_off", "Off", "Desactivado");
        put("auto_watched_partly", "Partly watched (any progress bar)", "Vistos en parte (cualquier barra)");
        put("auto_watched_fully", "Fully watched (90% or more)", "Vistos por completo (90% o más)");
        put("auto_like", "Like every video watched", "Dar Me gusta a cada video que mires");
        put("auto_like_summary", "When a video opens; an existing like or dislike stays",
                "Al abrir un video; un Me gusta o No me gusta existente se mantiene");
        put("save_style", "Style of the playlist list on feed cards", "Estilo de la lista de playlists en las tarjetas");
        put("save_style_sheet", "With thumbnails, as on the watch page", "Con miniaturas, como en la página del video");
        put("save_style_list", "Text list", "Lista de texto");
        put("save_style_summary", "What a feed card's Save opens when the option above is on", "Lo que abre Guardar en una tarjeta del feed con la opción de arriba activada");
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
        put("dearrow_vote_title", "Vote on this DeArrow title", "Votar este título de DeArrow");
        put("dearrow_vote_message", "Upvote the title as it is, edit it and send your own (the edit is a new suggestion), or downvote it. DeArrow shows a title once enough users vote for it.",
                "Vota a favor del título tal como está, edítalo y envía el tuyo (la edición es una sugerencia nueva), o vota en contra. DeArrow muestra un título cuando suficientes usuarios votan por él.");
        put("dearrow_upvote", "Upvote", "A favor");
        put("dearrow_downvote", "Downvote", "En contra");
        put("dearrow_downvoted", "Downvote sent to DeArrow", "Voto en contra enviado a DeArrow");
        put("dearrow_sent", "Title sent to DeArrow", "Título enviado a DeArrow");
        put("dearrow_refused", "DeArrow refused the title", "DeArrow rechazó el título");
        put("dearrow_failed", "The title was not sent (no connection to DeArrow)", "No se envió el título (sin conexión con DeArrow)");
        put("dearrow_no_original", "The video's own title was not found", "No se encontró el título propio del video");
        put("live_catch_up", "Catch up to live streams", "Alcanzar el directo");
        put("live_catch_up_summary", "A live stream which falls behind its live edge by the delay below (and by at most 15 s) plays faster until it reaches the edge; a stream more than 15 s behind (rewound on purpose) is left alone. Also in the player's settings menu",
                "Un directo que se retrasa respecto de su borde en vivo lo indicado abajo (y como máximo 15 s) se reproduce más rápido hasta llegar al borde; un directo a más de 15 s (retrocedido a propósito) no se toca. También en el menú de ajustes del reproductor");
        put("live_catch_up_speed", "Catch-up speed", "Velocidad para alcanzar el directo");
        put("live_catch_up_speed_summary", "From 1.25 to 4; 2 by default", "De 1.25 a 4; 2 por defecto");
        put("cat_playback", "Playback", "Reproducción");
        put("keep_playing", "Keep playing when the screen turns off", "Seguir reproduciendo al apagar la pantalla");
        put("keep_playing_summary", "A video playing when the screen turns off, which pauses within 8 s, plays again (in picture in picture too)",
                "Un video que se pausa en los 8 s después de apagar la pantalla vuelve a reproducirse (también en imagen en imagen)");
        put("audio_only", "Audio only", "Solo audio");
        put("audio_only_summary", "Videos play their sound without the picture, through YouTube's own audio-only mode",
                "Los videos reproducen el sonido sin la imagen, con el modo de solo audio de YouTube");
        put("audio_only_row", "Audio only in the quality menu", "Solo audio en el menú de calidad");
        put("audio_only_row_summary", "The video quality menu lists Audio only above the resolutions; picking a resolution turns it off",
                "El menú de calidad del video muestra Solo audio sobre las resoluciones; elegir una resolución lo desactiva");
        put("audio_only_off", "Audio only while the screen is off", "Solo audio con la pantalla apagada");
        put("audio_only_off_summary", "A video playing when the screen turns off plays its sound alone until the screen turns on",
                "Un video que se reproduce al apagar la pantalla reproduce solo el sonido hasta que se enciende");
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
