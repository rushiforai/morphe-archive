package app.wordfeudwordfinder.extension.ui;

import app.wordfeudwordfinder.extension.core.WfError;
import java.util.EnumMap;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

/**
 * UI texts (spec section 9). English is the fallback language.
 *
 * NOTE: the language list (en, nl, da, sv, nb, es, fr, de) is an assumption (controller ruling R7);
 * it must be verified against the APK's config.* splits / flutter_assets (V12 / Task 16).
 * Non-English texts are translated by the author; improvements are welcome.
 * Non-ASCII characters are written as unicode escapes (encoding-independent).
 *
 * Placeholders (use String.format on the result):
 *  USES "%s" = the tiles the word uses from the rack; ENDS_ON "%s" = bonus-square label;
 *  PTS "%d" = score; REJECTED_WORDS "%s" = the rejected words (comma separated); REJECTED_ONE_OF "%s" = all words
 *  of a refused move when the server did not say which one was wrong (comma separated); DOWNLOAD_PCT "%d" = download
 *  progress 0..100 (a literal percent sign is written "%%"); ERROR_CODE "%s" = the error code (e.g. WL-NET).
 *  All other keys have no placeholders.
 *  GAME_LOADING: shown in the overlay for a game that is not in the GameStore yet (a new game, before Wordfeud's
 *  next games/detail poll).
 *
 * BONUS_DL/TL/DW/TW are the short bonus-square labels (board squares, list detail line). Assumption (like R7):
 * Wordfeud shows DL/TL/DW/TW in every language, so all languages use those values for now; to be verified
 * against the app's own board per language (V12 / Task 16).
 */
public final class Strings {
    private Strings() {}

    public enum Key {
        TITLE, YOUR_TILES, SORT_SCORE, SORT_LENGTH, SORT_ALPHA, PLAY,
        NOT_YOUR_TURN, DIR_DOWN, DIR_ACROSS, USES, ENDS_ON,
        REJECTED, RETRY, COPY_DETAILS, DOWNLOADING, PTS,
        ERR_WL_NET, ERR_WL_HTTP, ERR_WL_HASH, ERR_WL_DISK, ERR_WL_NONE,
        ERR_GS_EVENT, ERR_GS_DATA, ERR_MV_SESSION, ERR_MV_NET, ERR_MV_SERVER,
        BONUS_DL, BONUS_TL, BONUS_DW, BONUS_TW,
        CLOSE,
        REJECTED_WORDS, DOWNLOAD_PCT, ERROR_CODE,
        GAME_LOADING,
        REJECTED_ONE_OF
    }

    private static final Map<String, Map<Key, String>> TEXTS = new HashMap<>();

    /** Supported language codes. */
    public static java.util.Set<String> languages() {
        return java.util.Collections.unmodifiableSet(TEXTS.keySet());
    }

    public static String get(String lang, Key key) {
        Map<Key, String> m = TEXTS.get(normalize(lang));
        String s = m == null ? null : m.get(key);
        if (s == null || s.isEmpty()) s = TEXTS.get("en").get(key);
        return s;
    }

    static String normalize(String lang) {
        if (lang == null) return "en";
        String l = lang.trim().toLowerCase(Locale.ROOT).replace('_', '-');
        int i = l.indexOf('-');
        if (i > 0) l = l.substring(0, i);
        if (l.equals("no") || l.equals("nn")) l = "nb";
        return TEXTS.containsKey(l) ? l : "en";
    }

    public static Key errorKey(WfError e) {
        String c = e.code();
        if (c.startsWith("WL-HTTP")) return Key.ERR_WL_HTTP;
        if (c.startsWith("WL-NET")) return Key.ERR_WL_NET;
        if (c.startsWith("WL-HASH")) return Key.ERR_WL_HASH;
        if (c.startsWith("WL-DISK")) return Key.ERR_WL_DISK;
        if (c.startsWith("WL-NONE")) return Key.ERR_WL_NONE;
        if (c.startsWith("GS-EVENT")) return Key.ERR_GS_EVENT;
        if (c.startsWith("MV-SESSION")) return Key.ERR_MV_SESSION;
        if (c.startsWith("MV-NET")) return Key.ERR_MV_NET;
        if (c.startsWith("MV-SERVER")) return Key.ERR_MV_SERVER;
        return Key.ERR_GS_DATA;
    }

    private static void add(String lang, String... v) {
        Key[] keys = Key.values();
        if (v.length != keys.length) throw new IllegalStateException("texts for " + lang);
        Map<Key, String> m = new EnumMap<>(Key.class);
        for (int i = 0; i < keys.length; i++) m.put(keys[i], v[i]);
        TEXTS.put(lang, m);
    }

    static {
        // Order: see Key enum.
        add("en", "Word finder", "Your tiles", "Score", "Length", "A-Z", "Play",
            "Not your turn", "Down", "Across", "Uses: %s", "Ends on %s",
            "Move rejected", "Retry", "Copy details", "Downloading word list...", "%d pts",
            "No connection to download the word list.",
            "Word list download failed.",
            "Word list is corrupt. Please retry.",
            "Could not save the word list.",
            "No word list available for this game's rules.",
            "This game contains something unexpected.",
            "The game data is missing or unreadable.",
            "No valid session found. Try reopening Wordfeud.",
            "Connection failed. The move may or may not have been played.",
            "The server reported an error.",
            "DL", "TL", "DW", "TW",
            "Close",
            "Move rejected: %s", "%d%%", "Code: %s",
            "Loading game data\u2026 Wordfeud loads new games within about 20 seconds.",
            "Move rejected: one of %s");
        add("nl", "Woordzoeker", "Jouw letters", "Score", "Lengte", "A-Z", "Speel",
            "Je bent niet aan zet", "Verticaal", "Horizontaal", "Gebruikt: %s", "Eindigt op %s",
            "Zet afgewezen", "Opnieuw", "Kopieer details", "Woordenlijst downloaden...", "%d p",
            "Geen verbinding om de woordenlijst te downloaden.",
            "Downloaden van de woordenlijst mislukt.",
            "Woordenlijst is beschadigd. Probeer opnieuw.",
            "Woordenlijst kon niet worden opgeslagen.",
            "Geen woordenlijst beschikbaar voor de regels van dit potje.",
            "Dit potje bevat iets onverwachts.",
            "Gegevens van het potje ontbreken of zijn onleesbaar.",
            "Geen geldige sessie gevonden. Open Wordfeud opnieuw.",
            "Verbinding mislukt. De zet is mogelijk wel gespeeld.",
            "De server meldt een fout.",
            "DL", "TL", "DW", "TW",
            "Sluiten",
            "Zet afgewezen: %s", "%d%%", "Code: %s",
            "Gegevens van het potje worden geladen\u2026 Wordfeud laadt nieuwe potjes binnen ongeveer 20 seconden.",
            "Zet afgewezen: een van %s");
        add("da", "Ordfinder", "Dine brikker", "Point", "L\u00e6ngde", "A-Z", "Spil",
            "Det er ikke din tur", "Nedad", "Vandret", "Bruger: %s", "Slutter p\u00e5 %s",
            "Tr\u00e6k afvist", "Pr\u00f8v igen", "Kopi\u00e9r detaljer", "Henter ordliste...", "%d p",
            "Ingen forbindelse til at hente ordlisten.",
            "Hentning af ordlisten mislykkedes.",
            "Ordlisten er beskadiget. Pr\u00f8v igen.",
            "Ordlisten kunne ikke gemmes.",
            "Ingen ordliste til dette spils regler.",
            "Spillet indeholder noget uventet.",
            "Spildata mangler eller kan ikke l\u00e6ses.",
            "Ingen gyldig session fundet. Pr\u00f8v at \u00e5bne Wordfeud igen.",
            "Forbindelsen mislykkedes. Tr\u00e6kket er muligvis spillet.",
            "Serveren meldte en fejl.",
            "DL", "TL", "DW", "TW",
            "Luk",
            "Tr\u00e6k afvist: %s", "%d %%", "Kode: %s",
            "Henter spildata\u2026 Wordfeud henter nye spil inden for cirka 20 sekunder.",
            "Tr\u00e6k afvist: et af %s");
        add("sv", "Ords\u00f6kare", "Dina brickor", "Po\u00e4ng", "L\u00e4ngd", "A-Z", "Spela",
            "Det \u00e4r inte din tur", "Ned\u00e5t", "V\u00e5gr\u00e4tt", "Anv\u00e4nder: %s", "Slutar p\u00e5 %s",
            "Draget nekades", "F\u00f6rs\u00f6k igen", "Kopiera detaljer", "Laddar ner ordlista...", "%d p",
            "Ingen anslutning f\u00f6r att ladda ner ordlistan.",
            "Nedladdningen av ordlistan misslyckades.",
            "Ordlistan \u00e4r skadad. F\u00f6rs\u00f6k igen.",
            "Ordlistan kunde inte sparas.",
            "Ingen ordlista f\u00f6r det h\u00e4r spelets regler.",
            "Spelet inneh\u00e5ller n\u00e5got ov\u00e4ntat.",
            "Speldata saknas eller kan inte l\u00e4sas.",
            "Ingen giltig session hittades. Prova att \u00f6ppna Wordfeud igen.",
            "Anslutningen misslyckades. Draget kan ha spelats.",
            "Servern rapporterade ett fel.",
            "DL", "TL", "DW", "TW",
            "St\u00e4ng",
            "Draget nekades: %s", "%d %%", "Kod: %s",
            "Laddar speldata\u2026 Wordfeud laddar nya spel inom ungef\u00e4r 20 sekunder.",
            "Draget nekades: ett av %s");
        add("nb", "Ords\u00f8ker", "Brikkene dine", "Poeng", "Lengde", "A-Z", "Spill",
            "Det er ikke din tur", "Nedover", "Vannrett", "Bruker: %s", "Slutter p\u00e5 %s",
            "Trekket ble avvist", "Pr\u00f8v igjen", "Kopier detaljer", "Laster ned ordliste...", "%d p",
            "Ingen forbindelse for \u00e5 laste ned ordlisten.",
            "Nedlasting av ordlisten mislyktes.",
            "Ordlisten er skadet. Pr\u00f8v igjen.",
            "Ordlisten kunne ikke lagres.",
            "Ingen ordliste for reglene i dette spillet.",
            "Spillet inneholder noe uventet.",
            "Spilldata mangler eller er uleselige.",
            "Fant ingen gyldig sesjon. Pr\u00f8v \u00e5 \u00e5pne Wordfeud p\u00e5 nytt.",
            "Forbindelsen mislyktes. Trekket kan ha blitt spilt.",
            "Serveren meldte en feil.",
            "DL", "TL", "DW", "TW",
            "Lukk",
            "Trekket ble avvist: %s", "%d %%", "Kode: %s",
            "Laster inn spilldata\u2026 Wordfeud laster inn nye spill innen omtrent 20 sekunder.",
            "Trekket ble avvist: ett av %s");
        add("es", "Buscador de palabras", "Tus fichas", "Puntos", "Longitud", "A-Z", "Jugar",
            "No es tu turno", "Vertical", "Horizontal", "Usa: %s", "Termina en %s",
            "Jugada rechazada", "Reintentar", "Copiar detalles", "Descargando lista de palabras...", "%d pts",
            "Sin conexi\u00f3n para descargar la lista de palabras.",
            "Error al descargar la lista de palabras.",
            "La lista de palabras est\u00e1 da\u00f1ada. Vuelve a intentarlo.",
            "No se pudo guardar la lista de palabras.",
            "No hay lista de palabras para las reglas de esta partida.",
            "La partida contiene algo inesperado.",
            "Faltan datos de la partida o no se pueden leer.",
            "No se encontr\u00f3 una sesi\u00f3n v\u00e1lida. Prueba a reabrir Wordfeud.",
            "Fallo de conexi\u00f3n. Puede que la jugada se haya realizado.",
            "El servidor notific\u00f3 un error.",
            "DL", "TL", "DW", "TW",
            "Cerrar",
            "Jugada rechazada: %s", "%d %%", "C\u00f3digo: %s",
            "Cargando datos de la partida\u2026 Wordfeud carga las partidas nuevas en unos 20 segundos.",
            "Jugada rechazada: una de %s");
        add("fr", "Chercheur de mots", "Vos lettres", "Score", "Longueur", "A-Z", "Jouer",
            "Ce n'est pas votre tour", "Vertical", "Horizontal", "Lettres utilis\u00e9es : %s", "Fin sur %s",
            "Coup refus\u00e9", "R\u00e9essayer", "Copier les d\u00e9tails", "T\u00e9l\u00e9chargement de la liste de mots...", "%d pts",
            "Pas de connexion pour t\u00e9l\u00e9charger la liste de mots.",
            "\u00c9chec du t\u00e9l\u00e9chargement de la liste de mots.",
            "La liste de mots est corrompue. Veuillez r\u00e9essayer.",
            "Impossible d'enregistrer la liste de mots.",
            "Aucune liste de mots pour les r\u00e8gles de cette partie.",
            "La partie contient un \u00e9l\u00e9ment inattendu.",
            "Les donn\u00e9es de la partie sont absentes ou illisibles.",
            "Aucune session valide. Veuillez rouvrir Wordfeud.",
            "\u00c9chec de la connexion. Le coup a peut-\u00eatre \u00e9t\u00e9 jou\u00e9.",
            "Le serveur a signal\u00e9 une erreur.",
            "DL", "TL", "DW", "TW",
            "Fermer",
            "Coup refus\u00e9 : %s", "%d %%", "Code : %s",
            "Chargement de la partie\u2026 Wordfeud charge les nouvelles parties en 20 secondes environ.",
            "Coup refus\u00e9 : l\u2019un de %s");
        add("de", "Wortfinder", "Deine Buchstaben", "Punkte", "L\u00e4nge", "A-Z", "Spielen",
            "Du bist nicht am Zug", "Senkrecht", "Waagerecht", "Nutzt: %s", "Endet auf %s",
            "Zug abgelehnt", "Erneut versuchen", "Details kopieren", "Wortliste wird geladen...", "%d P.",
            "Keine Verbindung zum Laden der Wortliste.",
            "Laden der Wortliste fehlgeschlagen.",
            "Die Wortliste ist besch\u00e4digt. Bitte erneut versuchen.",
            "Die Wortliste konnte nicht gespeichert werden.",
            "Keine Wortliste f\u00fcr die Regeln dieses Spiels.",
            "Das Spiel enth\u00e4lt etwas Unerwartetes.",
            "Spieldaten fehlen oder sind nicht lesbar.",
            "Keine g\u00fcltige Sitzung gefunden. \u00d6ffne Wordfeud erneut.",
            "Verbindung fehlgeschlagen. Der Zug wurde eventuell gespielt.",
            "Der Server hat einen Fehler gemeldet.",
            "DL", "TL", "DW", "TW",
            "Schlie\u00dfen",
            "Zug abgelehnt: %s", "%d %%", "Code: %s",
            "Spieldaten werden geladen\u2026 Wordfeud l\u00e4dt neue Spiele innerhalb von etwa 20 Sekunden.",
            "Zug abgelehnt: eines von %s");
    }
}
