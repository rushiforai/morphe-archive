package patches.ed

import app.morphe.patcher.util.proxy.mutableTypes.MutableClass

/** Tokenize real HTML tags before matching the first src attribute. Quoted
 * examples, raw script/style text and srcdoc content remain editorial input. */
internal fun addVacancyWidgetFilter(owner: MutableClass) {
    owner.methods.add(helper("morpheVacancyHtml", "Z", listOf("Ljava/lang/String;"), 3, """
        if-eqz p0, :keep
        const-string v0, "(?is)<!--.*?(?:-->|\\z)|<!\\[CDATA\\[.*?(?:\\]\\]>|\\z)|<(?:!|\\?)(?:\"[^\"]*(?:\"|\\z)|'[^']*(?:'|\\z)|[^'\">])*(?:>|\\z)|<plaintext\\b(?:\"[^\"]*(?:\"|\\z)|'[^']*(?:'|\\z)|[^'\">])*>.*\\z|<(script|style|textarea|title|iframe|xmp|noembed|noframes|noscript)\\b(?:\"[^\"]*(?:\"|\\z)|'[^']*(?:'|\\z)|[^'\">])*>.*?(?:</\\1\\s*>|\\z)|<[a-z][a-z0-9:-]*(?:\"[^\"]*(?:\"|\\z)|'[^']*(?:'|\\z)|[^'\">])*(?:>|\\z)"
        invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;
        move-result-object v0
        invoke-virtual {v0, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;
        move-result-object v0
        :nextTag
        invoke-virtual {v0}, Ljava/util/regex/Matcher;->find()Z
        move-result v1
        if-eqz v1, :keep
        invoke-virtual {v0}, Ljava/util/regex/Matcher;->group()Ljava/lang/String;
        move-result-object v1
        const-string v2, "(?is)<iframe(?=\\s|/?>)(?:\\s+(?!src(?:\\s|=|/?>)|srcdoc(?:\\s|=|/?>))[a-z_:][a-z0-9_:.\\-]*(?:\\s*=\\s*(?:\"[^\"]*\"|'[^']*'|[^\\s\"'=<>`]+))?)*\\s+src\\s*=\\s*([\"']?)https://mobileapi\\.ed\\.nl/static/widgets/nationalevacaturebank-blue\\.html(?:[?#][^\"'<>\\s]*)?\\1(?:\\s+(?!srcdoc(?:\\s|=|/?>))[a-z_:][a-z0-9_:.\\-]*(?:\\s*=\\s*(?:\"[^\"]*\"|'[^']*'|[^\\s\"'=<>`]+))?)*\\s*/?>.*"
        invoke-virtual {v1, v2}, Ljava/lang/String;->matches(Ljava/lang/String;)Z
        move-result v1
        if-eqz v1, :nextTag
        const/4 v0, 0x1
        return v0
        :keep
        const/4 v0, 0x0
        return v0
    """))
}
