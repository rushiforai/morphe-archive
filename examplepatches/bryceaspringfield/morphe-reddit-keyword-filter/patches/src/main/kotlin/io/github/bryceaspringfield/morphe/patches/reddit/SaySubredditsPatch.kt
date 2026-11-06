package io.github.bryceaspringfield.morphe.patches.reddit

import app.morphe.patcher.patch.resourcePatch
import io.github.bryceaspringfield.morphe.patches.reddit.Constants.COMPATIBILITY_REDDIT
import org.w3c.dom.Node
import java.util.logging.Logger

private val subredditsLogger = Logger.getLogger("SaySubredditsPatch")

/** The values folders renamed: English (the default) and every Spanish one. */
private val RENAMED_FOLDERS = Regex("""res/values(-es(-r[A-Z]{2})?|-b\+es\+\d+)?/(strings|plurals|arrays)\.xml""")

/** A Spanish feminine word before comunidad, and its masculine form before subreddit. */
private val SPANISH_BEFORE = mapOf(
    "la" to "el", "las" to "los", "una" to "un", "unas" to "unos", "varias" to "varios", "esta" to "este", "estas" to "estos",
    "esa" to "ese", "esas" to "esos", "aquella" to "aquel", "otra" to "otro", "otras" to "otros",
    "ninguna" to "ningún", "alguna" to "algún", "algunas" to "algunos", "nuestra" to "nuestro",
    "nuestras" to "nuestros", "vuestra" to "vuestro", "nueva" to "nuevo", "nuevas" to "nuevos", "toda" to "todo",
    "todas" to "todos", "misma" to "mismo", "mismas" to "mismos", "propia" to "propio", "propias" to "propios",
    "primera" to "primer", "última" to "último", "cuya" to "cuyo", "dicha" to "dicho",
    "tu" to "tu", "tus" to "tus", "su" to "su", "sus" to "sus", "mi" to "mi", "mis" to "mis",
)

/** Words after comunidad that agree with it, besides participles (-ada, -ida). */
private val SPANISH_AFTER = mapOf(
    "pública" to "público", "públicas" to "públicos", "nueva" to "nuevo", "nuevas" to "nuevos",
    "propia" to "propio", "activa" to "activo", "activas" to "activos", "favorita" to "favorito",
    "favoritas" to "favoritos", "seleccionada" to "seleccionado", "aptas" to "aptos", "apta" to "apto",
    "nsfw" to "nsfw", "misma" to "mismo", "mismas" to "mismos", "oficial" to "oficial",
)

/** Verbs between comunidad and a participle agreeing with it ("la comunidad está restringida"). */
private val SPANISH_LINKS = setOf("está", "están", "es", "son", "fue", "fueron", "será", "estará", "ha", "han", "sido", "sea", "queda", "quedó", "parece", "no", "ya")

/** Words ending in -ada or -ida which are nouns or pronouns, never a participle. */
private val NOT_PARTICIPLES = setOf("nada", "cada", "vida", "salida", "medida", "partida", "llegada", "entrada", "comida", "ida", "nadie")

private val SPANISH_NOUN = Regex("""\b([Cc]omunidad|COMUNIDAD)(es|ES)?\b""")
private val ENGLISH_NOUN = Regex("""\b([Cc]ommunit|COMMUNIT)(y|ies|Y|IES)\b""")

private fun sameCase(model: String, word: String) = when {
    model.length > 1 && model == model.uppercase() -> word.uppercase()
    model.firstOrNull()?.isUpperCase() == true -> word.replaceFirstChar { it.uppercase() }
    else -> word
}

private fun english(text: String) = ENGLISH_NOUN.replace(text) { m ->
    val plural = m.groupValues[2].lowercase() == "ies"
    sameCase(m.value, if (plural) "subreddits" else "subreddit")
}

/** Renames comunidad to subreddit, with the words agreeing with it turned masculine. */
internal fun spanishSubreddits(text: String): String {
    if (!SPANISH_NOUN.containsMatchIn(text)) return text
    val words = Regex("""[\p{L}]+|[^\p{L}]+""").findAll(text).map { it.value }.toMutableList()
    for (i in words.indices) {
        val noun = SPANISH_NOUN.matchEntire(words[i]) ?: continue
        val plural = noun.groupValues[2].isNotEmpty()
        words[i] = sameCase(words[i], if (plural) "subreddits" else "subreddit")
        // The determiners before the noun, nearest first: "todas las", "esta nueva".
        var j = i - 2
        while (j >= 0 && words[j + 1].isBlank()) {
            val masculine = SPANISH_BEFORE[words[j].lowercase()] ?: break
            words[j] = sameCase(words[j], masculine)
            j -= 2
        }
        // De el and a el contract to del and al.
        val article = i - 2
        if (article >= 2 && words[article].lowercase() == "el" && words[article - 1].isBlank()) {
            val preposition = words[article - 2].lowercase()
            if (preposition == "de" || preposition == "a") {
                words[article - 2] = sameCase(words[article - 2], if (preposition == "de") "del" else "al")
                words[article] = ""
                words[article - 1] = ""
            }
        }
        // The participles and adjectives after it, across linking verbs.
        var k = i + 2
        while (k < words.size && words[k - 1].isBlank()) {
            val word = words[k].lowercase()
            val masculine = SPANISH_AFTER[word] ?: when {
                word in NOT_PARTICIPLES -> null
                Regex("""\p{L}{2,}[ai]das?""").matches(word) ->
                    if (word.endsWith("s")) word.dropLast(2) + "os" else word.dropLast(1) + "o"
                else -> null
            }
            if (masculine != null) {
                words[k] = sameCase(words[k], masculine)
                k += 2
            } else if (word in SPANISH_LINKS) {
                k += 2
            } else break
        }
    }
    return words.joinToString("")
}

@Suppress("unused")
val saySubredditsPatch = resourcePatch(
    name = "Say subreddits",
    description = "Renames communities to subreddits throughout Reddit's own text, in English and Spanish, " +
            "and in the keyword filter's settings.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_REDDIT)

    execute {
        var changed = 0
        val paths = decode("res/values*/strings.xml", "res/values*/plurals.xml", "res/values*/arrays.xml")
            .filter { RENAMED_FOLDERS.matches(it) }
        paths.forEach { path ->
            val spanish = "-es" in path || "+es+" in path
            document(path).use { document ->
                fun walk(node: Node) {
                    if (node.nodeType == Node.TEXT_NODE) {
                        val text = node.nodeValue ?: return
                        val renamed = if (spanish) spanishSubreddits(text) else english(text)
                        if (renamed != text) {
                            node.nodeValue = renamed
                            changed++
                        }
                        return
                    }
                    val children = node.childNodes
                    for (i in 0 until children.length) walk(children.item(i))
                }
                walk(document.documentElement)
            }
        }
        // A flag the extension reads to rename its own settings text too. A new values entry gets no resource ID
        // from the patcher, while a new raw file does.
        get("res/raw/morphe_say_subreddits.txt", copy = false).apply { parentFile.mkdirs() }.writeText("on\n")
        subredditsLogger.info("Say subreddits: renamed $changed texts in ${paths.size} files")
    }
}
