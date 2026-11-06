package app.xiondigital.tandemstudy.data

import java.util.Locale

/**
 * Word extraction for the frequency list.
 *
 * Surface forms only: no lemmatisation, because that needs a per-language model, and a naive
 * suffix stripper would produce plausible-looking wrong lemmas ("house" from "houses", but also
 * "thi" from "this"). Surface forms are honest; grouped-by-lemma is a separate decision.
 */
internal object Tokenizer {

    fun tokens(text: String, lang: String): List<String> {
        val stop = Stopwords.forLang(lang)
        val out = ArrayList<String>(text.length / 6 + 4)
        val current = StringBuilder()
        var i = 0
        while (i < text.length) {
            val cp = text.codePointAt(i)
            val width = Character.charCount(cp)
            val ch = text[i]
            val keep = Character.isLetterOrDigit(cp) || ch == '\'' || ch == '\u2019' || ch == '-'
            if (keep) {
                current.appendCodePoint(cp)
            } else {
                flush(current, out, stop)
            }
            i += width
        }
        flush(current, out, stop)
        return out
    }

    private fun flush(current: StringBuilder, out: MutableList<String>, stop: Set<String>) {
        if (current.isEmpty()) return
        val word = current.toString().lowercase(Locale.ROOT).trim('\'', '\u2019', '-')
        current.setLength(0)
        if (word.length < 2) return
        if (word.any { it.isDigit() }) return
        if (word in stop) return
        out += word
    }
}

internal object Stopwords {

    fun forLang(lang: String): Set<String> = when (lang.take(2).lowercase(Locale.ROOT)) {
        "en" -> EN
        "de" -> DE
        "es" -> ES
        "fr" -> FR
        "it" -> IT
        "pt" -> PT
        else -> emptySet()
    }

    private val EN = set(
        "a about above after again against all also am an and any are aren't as at be because been " +
            "before being below between both but by can can't cannot could couldn't did didn't do does " +
            "doesn't doing don't down during each few for from further had hadn't has hasn't have haven't " +
            "having he her here hers herself him himself his how i i'd i'll i'm i've if in into is isn't it " +
            "it's its itself just me more most my myself no nor not now of off on once only or other ought " +
            "our ours ourselves out over own same shan't she should shouldn't so some such than that that's " +
            "the their theirs them themselves then there these they they'd they'll they're they've this " +
            "those through to too under until up very was wasn't we were weren't what when where which while " +
            "who whom why will with won't would wouldn't you your yours yourself yourselves",
    )

    private val DE = set(            "aber als also am an auch auf aus bei beim bin bis bist da damit dann das dass dein deine dem den denn " +
            "der des dich die dies diese einem einen einer eines er es euch euer für gegen gewesen hab habe " +
            "haben hat hatte hatten hier hin hinter ich ihm ihn ihnen ihr ihre ihrem ihren ihrer ihres im in " +
            "indem ins ist jede jedem jeden jeder jedes jener jenes jetzt kann kannst kein keine können " +
            "macht mein meine mit muss nach nicht nichts noch nun nur ob oder ohne sehr sein seine seinem " +
            "seinen seiner seines selbst sich sie sind so solche soll sollen sondern sonst um und uns unser " +
            "unter vom von vor war waren warst was weg weil weiter welche welchem welcher welches wenn werde " +
            "werden wie wieder will wir wird wirst wo wohl zu zum zur zwar zwischen",
    )

    private val ES = set(
        "a al algo algunas algunos ante antes como con contra cual cuando de del desde donde dos el él ella " +
            "ellas ellos en entre era erais eran eras eres es esa esas ese eso esos esta estaba estado estas " +
            "este esto estos fue fueron fui ha habia había han has hasta hay la las le les lo los más me mi " +
            "mis mucho muchos muy nada ni no nos nosotros o os otra otro para pero poco por porque que qué " +
            "quien se sea sean según ser si sí sido siempre sin sobre sois somos son soy su sus también te " +
            "tiene tienen todo todos tu tus un una uno unos vosotros y ya yo",
    )

    private val FR = set(
        "à ai aie ainsi alors au aucun aussi autre aux avec avoir bon car ce ceci cela ces cet cette ceux " +
            "chaque ci comme comment dans de dedans dehors depuis des deux doit donc dos droit du elle elles " +
            "en encore est et etaient étaient être eu fait faire fois font hors ici il ils je juste la le " +
            "les leur leurs lui ma maintenant mais malgré me même mes mien moi mon ne ni non nos notamment " +
            "notre nous on ou où par parce pas peut peu plus plusieurs pour pourquoi quand que quel quelle " +
            "quelles quels qui sa sans se ses si sien soit son sont sous stop sur ta tandis tant te tel " +
            "telle tes toi ton tous tout toute très trop tu un une vers voici voilà vos votre vous",
    )

    private val IT = set(
        "a ad al alla alle allo anche che chi ci come con contro cosa cui da dal dalla dalle dallo dei del " +
            "della delle dello di e è ed era erano essere fa fanno fare fino già gli ha hai hanno ho i il in " +
            "io la le lei lo loro lui ma me mi mia mie mio miei ne negli nei nel nella nelle nello noi non " +
            "nostra nostro o ogni per perché più può poi qua quale quando quanto quello questa queste questi " +
            "questo se sei si sia siamo sono sopra sotto sta stata state stati stato su sua sue sui sul " +
            "sulla suo suoi te ti tra tu tua tue tuo tuoi tutto un una uno vi voi vostra vostro",
    )

    private val PT = set(
        "a à ao aos aquela aquele aquilo as até com como da das de dela dele deles demais depois do dos e é " +
            "ela elas ele eles em entre era eram essa essas esse esses esta estas este estes eu foi foram há " +
            "isso isto já lhe lhes mais mas me mesmo meu meus minha minhas muito muita muitos muitas na não " +
            "nas nem no nos nós nossa nosso numa nunca o os ou para pela pelas pelo pelos por qual quando que " +
            "quem se sem ser seu seus sob sobre sua suas também te tem tém têm tenho ter teu teus tu tua " +
            "tuas um uma umas uns você vocês vos",
    )

    private fun set(words: String): Set<String> =
        words.split(' ').filter { it.isNotBlank() }.toSet()
}
