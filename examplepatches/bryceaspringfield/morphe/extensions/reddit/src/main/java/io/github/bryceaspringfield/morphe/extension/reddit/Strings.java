package io.github.bryceaspringfield.morphe.extension.reddit;

import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

/**
 * The text of this bundle's settings in the app's language: each English string is its own key, and a language
 * without a translation of a string shows the English. Spanish comes from the pairs below; every other Morphe locale
 * from {@link Translations}, chosen by the language, script, and region of the default locale.
 */
final class Strings {

    private static final Map<String, String> ES = new HashMap<>();

    private static void es(String english, String spanish) {
        ES.put(english, spanish);
    }

    static {
        // Rows and screens.
        es("Keyword filter", "Filtro de palabras clave");
        es("Keywords to hide", "Palabras clave para ocultar");
        es("Keywords apply to", "Dónde buscar las palabras clave");
        es("Post types", "Tipos de publicación");
        es("Score", "Puntuación");
        es("Number of comments", "Número de comentarios");
        es("Hide communities by topic", "Ocultar comunidades por tema");
        es("Subreddit filters", "Filtros por comunidad");
        es("Profile filters", "Filtros por perfil");
        es("Where post filters apply", "Dónde se aplican los filtros de publicaciones");
        es("Comment keywords to hide", "Palabras clave de comentarios para ocultar");
        es("Comment score", "Puntuación de comentarios");
        es("Navigation bar", "Barra de navegación");
        es("Sidebar", "Barra lateral");
        es("Profiles", "Perfiles");
        es("Search", "Búsqueda");
        es("Hide duplicate posts", "Ocultar publicaciones duplicadas");
        es("Hides a post with the same title, text, or media as one already shown since Reddit started, such as the same post shared to several communities.",
                "Oculta una publicación con el mismo título, texto o contenido multimedia que otra ya mostrada desde que se abrió Reddit, como la misma publicación compartida en varias comunidades.");
        es("Hide the content caution", "Ocultar el aviso de contenido");
        es("Shows media Reddit marks with a caution without the blur and the tap to view.", "Muestra el contenido que Reddit marca con un aviso sin difuminado ni toque para ver.");
        es("Default", "Predeterminado");
        es("Profile in use", "Perfil en uso");
        es("New profile", "Nuevo perfil");
        es("Copies the settings in use and switches to the copy.", "Copia los ajustes en uso y cambia a la copia.");
        es("In use", "En uso");
        es("Use", "Usar");
        es("Rename", "Cambiar el nombre");
        es("Assign to an account", "Asignar a una cuenta");
        es("Assign %s to an account", "Asignar %s a una cuenta");
        es("Delete", "Eliminar");
        es("Delete the profile %s?", "¿Eliminar el perfil %s?");
        es("Switch to another profile before deleting this one", "Cambia a otro perfil antes de eliminar este");
        es("More options", "Más opciones");
        es("New profile from these settings", "Nuevo perfil con estos ajustes");
        es("Copies the settings in force and switches to the copy.", "Copia los ajustes actuales y cambia a la copia.");
        es("Name", "Nombre");
        es("That name is empty or taken", "Ese nombre está vacío o ya existe");
        es("Rename this profile", "Cambiar el nombre de este perfil");
        es("The Default profile keeps its name", "El perfil Predeterminado conserva su nombre");
        es("Delete a profile", "Eliminar un perfil");
        es("No profile to delete; the one in use and Default stay", "No hay perfiles para eliminar; el perfil en uso y Predeterminado se conservan");
        es("Profile for each account", "Perfil de cada cuenta");
        es("No Reddit account is signed in", "No hay ninguna cuenta de Reddit iniciada");
        es("No profile", "Sin perfil");
        es("Each account keeps the profile in use.", "Cada cuenta usa el perfil en uso.");
        es("Profile %s in use", "Perfil %s en uso");
        es("Profile %s in use for u/%s", "Perfil %s en uso para u/%s");
        es("Profile %s in use for u/%s; restart Reddit to apply its Morphe settings", "Perfil %s en uso para u/%s; reinicia Reddit para aplicar sus ajustes de Morphe");
        es("Hide Inbox button", "Ocultar botón Bandeja de entrada");
        es("Keep bars shown while scrolling", "Mantener las barras visibles al desplazarse");
        es("Hide sidebar button badge", "Ocultar el punto del botón de la barra lateral");
        es("Hide %s", "Ocultar %s");
        es("Hide Popular", "Ocultar Popular");
        es("Hide News", "Ocultar Noticias");
        es("Hide Latest", "Ocultar Recientes");
        es("Hide Discover communities", "Ocultar Descubrir comunidades");
        es("Hide Start a community", "Ocultar Crear una comunidad");
        es("Hide Custom feeds", "Ocultar Feeds personalizados");
        es("Hide Recently Visited shelf", "Ocultar Visitados recientemente");
        es("Your own list", "Tu propia lista");
        es("Add a subreddit", "Añadir una comunidad");
        es("Add a profile", "Añadir un perfil");
        es("Hide all posts", "Ocultar todas las publicaciones");
        es("Hide all posts and comments", "Ocultar todas las publicaciones y comentarios");
        es("Flairs", "Flairs");
        es("Add a flair", "Añadir un flair");
        es("Flair", "Flair");
        es("Remove all filters", "Quitar todos los filtros");
        es("Remove all filters for %s?", "¿Quitar todos los filtros de %s?");
        es("Back", "Atrás");

        // Off, On, and Only.
        es("Off", "Desactivado");
        es("On", "Activado");
        es("Only", "Solo");

        // Fields, post types, places, and topics.
        es("Post title", "Título de la publicación");
        es("Post text", "Texto de la publicación");
        es("Poster (u/name)", "Autor (u/nombre)");
        es("Community (r/name)", "Comunidad (r/nombre)");
        es("Link domain", "Dominio del enlace");
        es("Text-only posts", "Publicaciones solo de texto");
        es("Photo posts", "Publicaciones con fotos");
        es("Video posts", "Publicaciones con vídeo");
        es("Reposts (crossposts)", "Publicaciones compartidas (crossposts)");
        es("18+ posts", "Publicaciones +18");
        es("Home", "Inicio");
        es("Popular", "Popular");
        es("News", "Noticias");
        es("Latest", "Recientes");
        es("Following", "Siguiendo");
        es("Custom feeds", "Feeds personalizados");
        es("Community pages", "Páginas de comunidades");
        es("Search results", "Resultados de búsqueda");
        es("Explore and topic feeds", "Explorar y feeds de temas");
        es("Games", "Juegos");
        es("18+ feed", "Feed +18");
        es("Full-screen video player", "Reproductor de vídeo a pantalla completa");
        es("Others' profiles", "Perfiles de otros");
        es("Your profile", "Tu perfil");
        es("Saved", "Guardado");
        es("Media", "Multimedia");
        es("Play media links inside Reddit", "Reproducir enlaces multimedia dentro de Reddit");
        es("Opens image and video links, such as imgur, Streamable, and Giphy, in a player, for older posts Reddit shows as plain links.",
                "Abre enlaces de imágenes y videos, como imgur, Streamable y Giphy, en un reproductor, para publicaciones antiguas que Reddit muestra como enlaces.");
        es("Loading media", "Cargando contenido multimedia");
        es("The media is no longer available; opening the link", "El contenido ya no está disponible; abriendo el enlace");
        es("Captions on by default", "Subtítulos activados por defecto");
        es("Turns captions on each time Reddit starts; turning them off holds until Reddit restarts.",
                "Activa los subtítulos cada vez que se inicia Reddit; si los desactivas, quedan desactivados hasta que Reddit se reinicie.");
        es("History", "Historial");
        es("Posts", "Publicaciones");
        es("Subreddits and profiles", "Comunidades y perfiles");
        es("Comments", "Comentarios");
        es("Any other feed", "Cualquier otro feed");
        es("Zionism", "Sionismo");
        es("Fascism, Nazism, and white supremacy", "Fascismo, nazismo y supremacismo blanco");
        es("Incels", "Incels");
        es("Other", "Otros");
        es("18+ (NSFW)", "+18 (NSFW)");
        es("Hide all 18+ content", "Ocultar todo el contenido +18");
        es("Hides every post Reddit marks 18+, in every place, and turns off every 18+ setting below.",
                "Oculta en todas partes cada publicación que Reddit marca como +18 y desactiva todos los ajustes +18 de abajo.");
        es("Made by Bryce Springfield", "Creado por Bryce Springfield");
        es("Circlejerk (-jerk) subreddits", "Subreddits circlejerk (-jerk)");

        // Summaries.
        es("None", "Ninguno");
        es("All", "Todos");
        es("Nothing", "Nada");
        es("Nowhere", "En ningún sitio");
        es("All on", "Todos activados");
        es("Any", "Cualquiera");
        es("%s or more", "%s o más");
        es("%s or fewer", "%s o menos");
        es("%s to %s", "De %s a %s");
        es("rule", "regla");
        es("rules", "reglas");
        es("community", "comunidad");
        es("communities", "comunidades");
        es("post type", "tipo de publicación");
        es("post types", "tipos de publicación");
        es("flair", "flair");
        es("flairs", "flairs");
        es("your list", "tu lista");
        es("all hidden", "todo oculto");
        es("score", "puntuación");
        es("comments", "comentarios");
        es("No filters", "Sin filtros");
        es("%s, and %s more", "%s y %s más");

        // Dialogs.
        es("One rule a line: r/name, u/name, flair:Meme, !flair:Meme, mention:r/name, mention:u/name, \"whole phrase\", or any text. A mention rule hides text naming the subreddit or account, wherever it is posted.",
                "Una regla por línea: r/nombre, u/nombre, flair:Meme, !flair:Meme, mention:r/nombre, mention:u/nombre, \"frase exacta\" o cualquier texto. Una regla mention oculta el texto que nombra el subreddit o la cuenta, dondequiera que se publique.");
        es("One rule a line: u/name, mention:r/name, mention:u/name, \"whole phrase\", or any text. A mention rule hides text naming the subreddit or account.",
                "Una regla por línea: u/nombre, mention:r/nombre, mention:u/nombre, \"frase exacta\" o cualquier texto. Una regla mention oculta el texto que nombra el subreddit o la cuenta.");
        es("Communities to hide, one a line.", "Comunidades para ocultar, una por línea.");
        es("Recently visited", "Visitadas recientemente");
        es("Branding", "Marca");
        es("Morphe loading animation", "Animación de carga de Morphe");
        es("Shows Morphe's animation in place of Reddit's while pages load.", "Muestra la animación de Morphe en lugar de la de Reddit mientras cargan las páginas.");
        es("Morphe logo", "Logotipo de Morphe");
        es("Shows the Morphe logo in place of Reddit's Snoo, as in the search bar.", "Muestra el logotipo de Morphe en lugar del Snoo de Reddit, como en la barra de búsqueda.");
        es("Morphe launcher icon", "Icono de inicio de Morphe");
        es("Shows the Morphe icon for Reddit on the home screen and in the app list.", "Muestra el icono de Morphe para Reddit en la pantalla de inicio y en la lista de aplicaciones.");
        es("Wording", "Vocabulario");
        es("Say subreddits", "Decir subreddits");
        es("Uses the word subreddit throughout Reddit's text, in English and Spanish.", "Usa la palabra subreddit en todo el texto de Reddit, en inglés y en español.");
        es("Hide deleted accounts", "Ocultar cuentas eliminadas");
        es("Hide accounts flagged as bots", "Ocultar cuentas marcadas como bots");
        es("Hide likely karma farmers", "Ocultar probables granjeros de karma");
        es("Hides posts and comments by accounts Bot Bouncer, a Reddit moderation bot, has banned as bots or karma farmers. The list downloads once a day.",
                "Oculta publicaciones y comentarios de cuentas que Bot Bouncer, un bot de moderación de Reddit, ha prohibido como bots o granjeros de karma. La lista se descarga una vez al día.");
        es("Hides posts and comments by accounts with a name Reddit generated (two words and a number) which repost a post or copy a comment already shown since Reddit started. A guess: some such accounts are people.",
                "Oculta publicaciones y comentarios de cuentas con un nombre generado por Reddit (dos palabras y un número) que vuelven a publicar una publicación o copian un comentario ya mostrado desde que se abrió Reddit. Es una suposición: algunas de esas cuentas son personas.");
        es("%s accounts, updated %s.", "%s cuentas, actualizada el %s.");
        es("Hides posts and comments by deleted accounts.", "Oculta publicaciones y comentarios de cuentas eliminadas.");
        es("Hide Trending in search", "Ocultar Tendencias en la búsqueda");
        es("Hides trending searches and communities in search suggestions.", "Oculta las búsquedas y comunidades en tendencia de las sugerencias de búsqueda.");
        es("Hide Trending in feeds", "Ocultar Tendencias en los feeds");
        es("Hides the Trending shelf among a feed's posts.", "Oculta la estantería Tendencias entre las publicaciones de un feed.");
        es("Layout", "Diseño");
        es("Lowest shown", "Mínimo mostrado");
        es("Highest shown", "Máximo mostrado");
        es("Clear", "Borrar");
        es("name", "nombre");
        es("r/name", "r/nombre");
    }

    private Strings() {
    }

    /**
     * The string in the device's language, or the English given.
     */
    static String t(String english) {
        if (english == null) return null;
        String language = language(Locale.getDefault());
        if ("es".equals(language)) {
            String spanish = ES.get(english);
            if (spanish != null) return Subreddits.rename(spanish);
        } else if (!"en".equals(language)) {
            String other = lookup(english);
            if (other != null) return Subreddits.rename(other);
        }
        return Subreddits.rename(english);
    }

    private static Locale cachedFor;
    private static String[] cached;
    private static Map<String, Integer> index;

    /** The translation of {@code english} in the current locale's Morphe folder, or null. */
    private static synchronized String lookup(String english) {
        Locale now = Locale.getDefault();
        if (!now.equals(cachedFor)) {
            cachedFor = now;
            String folder = folder(now);
            cached = folder == null ? null : Translations.of(folder);
        }
        if (cached == null) return null;
        if (index == null) {
            index = new HashMap<>();
            for (int i = 0; i < Translations.EN.length; i++) index.put(Translations.EN[i], i);
        }
        Integer i = index.get(english);
        return i == null || i >= cached.length ? null : cached[i];
    }

    /** Android's legacy codes, which Morphe's folders use (in, iw, ji), for a language tag's code. */
    static String language(Locale locale) {
        String language = locale.getLanguage();
        switch (language) {
            case "id":
                return "in";
            case "he":
                return "iw";
            case "yi":
                return "ji";
            default:
                return language;
        }
    }

    /**
     * The Morphe folder (language-REGION) for a locale: the exact one, else the language's variant for the script or
     * region (Traditional Chinese for Hant, Taiwan, Hong Kong, and Macau; European Portuguese outside Brazil; Latin
     * Serbian for Latn; Nepali of India for IN), else the language's only folder.
     */
    static String folder(Locale locale) {
        String language = language(locale);
        String region = locale.getCountry();
        String script = locale.getScript();
        String exact = language + "-" + region;
        for (String folder : Translations.LOCALES) if (folder.equals(exact)) return folder;
        switch (language) {
            case "zh":
                return "Hant".equals(script) || region.equals("TW") || region.equals("HK") || region.equals("MO")
                        ? "zh-TW" : "zh-CN";
            case "pt":
                return region.isEmpty() || region.equals("BR") ? "pt-BR" : "pt-PT";
            case "sr":
                return "Latn".equals(script) ? "sr-CS" : "sr-SP";
            case "ne":
                return region.equals("IN") ? "ne-IN" : "ne-NP";
            default:
                for (String folder : Translations.LOCALES) if (folder.startsWith(language + "-")) return folder;
                return null;
        }
    }

    static String t(CharSequence english) {
        return english == null ? null : t(english.toString());
    }

    static String[] t(String[] english) {
        String[] out = new String[english.length];
        for (int i = 0; i < english.length; i++) out[i] = t(english[i]);
        return out;
    }

    /**
     * A translated pattern with %s slots, filled with the values given.
     */
    static String f(String pattern, Object... values) {
        return String.format(t(pattern), values);
    }

    /**
     * A count and its noun: "1 rule", "3 rules".
     */
    static String count(long n, String one, String many) {
        String language = language(Locale.getDefault());
        if (!"en".equals(language) && !"es".equals(language)) {
            // Other languages give an ICU plural pattern under "one|many", with the forms their grammar needs.
            String pattern = lookup(one + "|" + many);
            if (pattern != null) {
                try {
                    return new android.icu.text.MessageFormat(pattern, Locale.getDefault()).format(new Object[]{n});
                } catch (Exception ignored) {
                    // A malformed pattern falls back to the noun alone.
                }
            }
        }
        return n + " " + t(n == 1 ? one : many);
    }
}
