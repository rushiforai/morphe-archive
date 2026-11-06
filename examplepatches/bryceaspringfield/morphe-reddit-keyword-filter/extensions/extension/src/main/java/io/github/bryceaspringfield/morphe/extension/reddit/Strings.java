package io.github.bryceaspringfield.morphe.extension.reddit;

import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

/**
 * The text of this bundle's settings in the device's language: each English string is its own key, and a language
 * without a translation of a string shows the English.
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
        es("Hide posts and comments by deleted accounts", "Ocultar publicaciones y comentarios de cuentas eliminadas");
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
        es("Hide the 18+ caution", "Ocultar el aviso +18");
        es("Shows 18+ posts' images and videos without the blur and the tap to view.", "Muestra las imágenes y videos de publicaciones +18 sin difuminado ni toque para ver.");
        es("Default", "Predeterminado");
        es("Profile in use", "Perfil en uso");
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
        es("Mature feed", "Feed para adultos");
        es("Full-screen video player", "Reproductor de vídeo a pantalla completa");
        es("Others' profiles", "Perfiles de otros");
        es("Your profile", "Tu perfil");
        es("Saved", "Guardado");
        es("Media", "Multimedia");
        es("Play media links inside Reddit", "Reproducir enlaces multimedia dentro de Reddit");
        es("Opens imgur, Streamable, RedGIFs, Gfycat, Giphy, and direct image or video links in a player, for older posts Reddit shows as plain links.",
                "Abre enlaces de imgur, Streamable, RedGIFs, Gfycat, Giphy e imágenes o videos directos en un reproductor, para publicaciones antiguas que Reddit muestra como enlaces.");
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
        es("One rule a line: r/name, u/name, flair:Meme, !flair:Meme, \"whole phrase\", or any text.",
                "Una regla por línea: r/nombre, u/nombre, flair:Meme, !flair:Meme, \"frase exacta\" o cualquier texto.");
        es("One rule a line: u/name, \"whole phrase\", or any text.",
                "Una regla por línea: u/nombre, \"frase exacta\" o cualquier texto.");
        es("Communities to hide, one a line.", "Comunidades para ocultar, una por línea.");
        es("Recently visited", "Visitadas recientemente");
        es("Branding", "Marca");
        es("Morphe loading animation", "Animación de carga de Morphe");
        es("Shows Morphe's animation in place of Reddit's while pages load.", "Muestra la animación de Morphe en lugar de la de Reddit mientras cargan las páginas.");
        es("Morphe logo", "Logotipo de Morphe");
        es("Shows the Morphe logo in place of Reddit's Snoo, as in the search bar.", "Muestra el logotipo de Morphe en lugar del Snoo de Reddit, como en la barra de búsqueda.");
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
        if ("es".equals(Locale.getDefault().getLanguage())) {
            String spanish = ES.get(english);
            if (spanish != null) return Subreddits.rename(spanish);
        }
        return Subreddits.rename(english);
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
        return n + " " + t(n == 1 ? one : many);
    }
}
