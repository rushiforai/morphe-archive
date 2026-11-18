package patches.nrc

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch

@Suppress("unused")
val hideAds = bytecodePatch(name = "Hide ads", description = "Hides evidenced web ad slots and their reserved space, and removes wholly advertising replica pages while preserving mixed editorial pages and media.") {
    compatibleWith(nrc)
    dependsOn(originalInput, webContent)
    execute {
        val match = exact(READER, "<init>", "V", "Ljava/util/List;")
        check(match.classDef.methods.none { it.name == "morpheEditorialPages" }) { "NRC page filter already present" }
        match.classDef.methods.add(helper(READER, "morpheEditorialPages", "Ljava/util/List;", listOf("Ljava/util/List;"), 6, """
            new-instance v0, Ljava/util/ArrayList;
            invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V
            invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;
            move-result-object v1
            :next
            invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z
            move-result v2
            if-eqz v2, :done
            invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;
            move-result-object v2
            check-cast v2, Lnl/pinch/nrc/data/model/readerdata/NRCReaderPage;
            invoke-interface {v2}, Lnl/pinch/nrc/data/model/readerdata/NRCReaderPage;->getPage()Lnl/pinch/nrc/data/model/metadata/Page;
            move-result-object v3
            if-eqz v3, :keep
            invoke-virtual {v3}, Lnl/pinch/nrc/data/model/metadata/Page;->getFrames()Ljava/util/List;
            move-result-object v3
            invoke-interface {v3}, Ljava/util/List;->isEmpty()Z
            move-result v4
            if-nez v4, :keep
            invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;
            move-result-object v3
            :frame
            invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z
            move-result v4
            if-eqz v4, :next
            invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;
            move-result-object v4
            check-cast v4, Lnl/pinch/nrc/data/model/metadata/PageFrame;
            invoke-virtual {v4}, Lnl/pinch/nrc/data/model/metadata/PageFrame;->isAdvertisement()Z
            move-result v5
            if-nez v5, :frame
            :keep
            invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
            goto :next
            :done
            return-object v0
        """))
        // Pre-constructor argument normalization leaves the receiver untouched.
        match.method.addInstructions(0, "invoke-static {p1}, $READER->morpheEditorialPages(Ljava/util/List;)Ljava/util/List;\nmove-result-object p1")
        enable("Ads")
    }
}
