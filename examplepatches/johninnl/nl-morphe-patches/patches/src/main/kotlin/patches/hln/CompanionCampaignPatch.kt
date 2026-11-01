package patches.hln

import app.morphe.patcher.patch.bytecodePatch

/** Remove the observed publisher companion-banner family before WebView load.
 * Keep unrelated editorial HTML, including other Valley embeds. */
internal val suppressCompanionCampaigns = bytecodePatch {
    dependsOn(originalInput, contentFilters)
    execute {
        exact("Lcom/kubus/module/network/model/HtmlEmbedDataTeaser;", "<init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Integer;Ljava/util/List;)V")
        val cls = exact(FILTER, "<init>(Ljava/util/List;Ljava/util/List;Ljava/util/List;Ljava/lang/String;)V").classDef
        check(cls.methods.none { it.name.startsWith("morpheCompanion") }) { "HLN companion filter already installed" }
        cls.methods.add(helper("morpheCompanionText", "Z", listOf("Ljava/lang/String;"), 2, """
            if-eqz p0, :keep
            const-string v0, "(?is)<!--.*?-->|<script\\b[^>]*>.*?</script\\s*>|<style\\b[^>]*>.*?</style\\s*>"
            const-string v1, ""
            invoke-virtual {p0, v0, v1}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
            move-result-object p0
            const-string v0, "(?s)(?:(?>[^<]+|<(?:[^\"'<>]|\"[^\"]*\"|'[^']*')*>))*<[A-Za-z][A-Za-z0-9:-]*(?:\\s+[A-Za-z_:][A-Za-z0-9_.:-]*(?:\\s*=\\s*(?:\"[^\"]*\"|'[^']*'|[^\\s\"'=<>\\x60]+))?)*\\s+(?i:class)\\s*=\\s*(?:\"\\s*(?:[^\"\\s]+\\s+)*widget-companion-banner(?:\\s+[^\"\\s]+)*\\s*\"|'\\s*(?:[^'\\s]+\\s+)*widget-companion-banner(?:\\s+[^'\\s]+)*\\s*')(?:\\s+[A-Za-z_:][A-Za-z0-9_.:-]*(?:\\s*=\\s*(?:\"[^\"]*\"|'[^']*'|[^\\s\"'=<>\\x60]+))?)*\\s*/?>.*"
            invoke-virtual {p0, v0}, Ljava/lang/String;->matches(Ljava/lang/String;)Z
            move-result v0
            if-nez v0, :drop
            const-string v0, "(?i)https://valley\\.hln\\.be/custom-build/hln/[0-9]{8}-companionbanner-[a-z0-9-]+/?(?:[?#][^\\s\"'<>]*)?"
            invoke-virtual {p0, v0}, Ljava/lang/String;->matches(Ljava/lang/String;)Z
            move-result v0
            if-nez v0, :drop
            const-string v0, "(?is)(?:(?>[^<]+|<(?:[^\"'<>]|\"[^\"]*\"|'[^']*')*>))*<iframe(?:\\s+[A-Za-z_:][A-Za-z0-9_.:-]*(?:\\s*=\\s*(?:\"[^\"]*\"|'[^']*'|[^\\s\"'=<>\\x60]+))?)*\\s+src\\s*=\\s*([\"'])(?:https:)?//valley\\.hln\\.be/custom-build/hln/[0-9]{8}-companionbanner-[a-z0-9-]+/?(?:[?#][^\\s\"'<>]*)?\\1(?:\\s+[A-Za-z_:][A-Za-z0-9_.:-]*(?:\\s*=\\s*(?:\"[^\"]*\"|'[^']*'|[^\\s\"'=<>\\x60]+))?)*\\s*/?>.*"
            invoke-virtual {p0, v0}, Ljava/lang/String;->matches(Ljava/lang/String;)Z
            move-result v0
            return v0
            :keep
            const/4 v0, 0x0
            return v0
            :drop
            const/4 v0, 0x1
            return v0
        """))
        cls.methods.add(helper("morpheCompanion", "Z", listOf("Ljava/lang/Object;"), 1, """
            invoke-static {}, $FILTER->morpheAds()Z
            move-result v0
            if-eqz v0, :keep
            instance-of v0, p0, Lcom/kubus/module/network/model/HtmlEmbedDataTeaser;
            if-eqz v0, :keep
            check-cast p0, Lcom/kubus/module/network/model/HtmlEmbedDataTeaser;
            iget-object v0, p0, Lcom/kubus/module/network/model/HtmlEmbedDataTeaser;->d:Ljava/lang/String;
            invoke-static {v0}, $FILTER->morpheCompanionText(Ljava/lang/String;)Z
            move-result v0
            if-nez v0, :drop
            iget-object v0, p0, Lcom/kubus/module/network/model/HtmlEmbedDataTeaser;->e:Ljava/lang/String;
            invoke-static {v0}, $FILTER->morpheCompanionText(Ljava/lang/String;)Z
            move-result v0
            if-nez v0, :drop
            iget-object v0, p0, Lcom/kubus/module/network/model/HtmlEmbedDataTeaser;->f:Ljava/lang/String;
            invoke-static {v0}, $FILTER->morpheCompanionText(Ljava/lang/String;)Z
            move-result v0
            return v0
            :keep
            const/4 v0, 0x0
            return v0
            :drop
            const/4 v0, 0x1
            return v0
        """))
        // Keep every original branch intact. A separate wrapper avoids moving
        // labels in the already assembled, recursively called normalizer.
        val normalizer = cls.methods.single { it.name == "morpheNormalize" &&
            it.parameterTypes == listOf("Ljava/lang/Object;") && it.returnType == "Ljava/lang/Object;" }
        check(cls.methods.remove(normalizer)) { "HLN original normalizer missing" }
        normalizer.setName("morpheNormalizeOriginal")
        cls.methods.add(normalizer)
        cls.methods.add(helper("morpheNormalize", "Ljava/lang/Object;", listOf("Ljava/lang/Object;"), 1, """
            invoke-static {p0}, $FILTER->morpheCompanion(Ljava/lang/Object;)Z
            move-result v0
            if-eqz v0, :existingHlnFilter
            const/4 v0, 0x0
            return-object v0
            :existingHlnFilter
            invoke-static {p0}, $FILTER->morpheNormalizeOriginal(Ljava/lang/Object;)Ljava/lang/Object;
            move-result-object v0
            return-object v0
        """))
    }
}
