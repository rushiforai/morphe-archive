package app.ais.patches

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

/**
 * Site search results (both phone and TV) are scraped through the ad-tracker
 * flow, and the parsed list contains the ad-tile entries (img/title = the
 * porn-app.com tracker URL) — one at the start, one at the end. They render
 * as broken "Image could not be loaded" cards.
 *
 * te4.c(Object) is the scrape→state callback: it fetches SiteUIState
 * .getVideoList() and pushes it into the shared LiveData the phone list and
 * the TV grid both observe. Filter ad tiles (VideoInformation.quality == 0;
 * real scraped videos always carry a quality value) out of that list in
 * place, before the update.
 *
 * te4.c has only .locals 2, and both locals are live at the natural insert
 * point, so the filter runs on values it fetches itself: list+iterator in
 * v0, scratch in v1, and the ad test is the int quality field (no string
 * constant needs a third register). Afterwards the original code re-fetches
 * v0/v1 itself, so nothing else changes.
 *
 * 6.7.2 renders the TV UI in Compose (TvComposeActivity); the old leanback
 * adapters below are no longer in the TV path, so its feed showed the ad
 * tiles again (issue #7). Every feed list — phone and TV Compose — is built
 * from SiteUIState.contentList, so the same quality test runs there too.
 * The instance-of guard keeps the AlbumInformation/ImageInformation entries
 * (both convert to VideoInformation with quality 0) intact.
 */
object SearchAdTileFingerprint : Fingerprint(
    definingClass = "Ljs4;",
    name = "c",
    parameters = listOf("Ljava/lang/Object;")
)

object SiteVideoListFingerprint : Fingerprint(
    definingClass = "Lcom/streamdev/aiostreamer/datatypes/ui/SiteUIState;",
    name = "getVideoList",
    returnType = "Ljava/util/List;"
)

@Suppress("unused")
val removeSearchAdTilesPatch = bytecodePatch(
    name = "Remove search ad tiles",
    description = "Removes the ad-tracker tiles (porn-app.com/nat1, /midad) from site search results and video feeds.",
    default = true
) {
    compatibleWith(Constants.COMPATIBILITY_APP)

    execute {
        val method = SearchAdTileFingerprint.method
        val instrs = method.implementation!!.instructions
        val logIdx = instrs.indexOfFirst { instr ->
            val ref = (instr as? ReferenceInstruction)?.reference as? MethodReference
            ref?.definingClass == "Landroid/util/Log;" && ref.name == "d"
        }
        check(logIdx >= 0) { "js4.c: videoList Log.d not found" }
        // Insert right after the Log.d call: v0 (toString result) and v1
        // ("videoList" const) are both dead here; the original code below
        // re-fetches them, so the whole block is self-contained.
        method.addInstructionsWithLabels(
            logIdx + 1,
            """
                invoke-virtual {p1}, Lcom/streamdev/aiostreamer/datatypes/ui/SiteUIState;->getVideoList()Ljava/util/List;
                move-result-object v0
                invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;
                move-result-object v0
                :ais_loop
                invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z
                move-result v1
                if-eqz v1, :ais_done
                invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;
                move-result-object v1
                check-cast v1, Lcom/streamdev/aiostreamer/datatypes/sites/VideoInformation;
                invoke-virtual {v1}, Lcom/streamdev/aiostreamer/datatypes/sites/VideoInformation;->getQuality()I
                move-result v1
                if-nez v1, :ais_loop
                invoke-interface {v0}, Ljava/util/Iterator;->remove()V
                goto :ais_loop
            """,
            ExternalLabel("ais_done", instrs[logIdx + 1])
        )

        // TV: the video grids are RecyclerView adapters fed through bn.h(List,
        // DiffUtil-callback). The TV grid has no hidden ad-row type (unlike the
        // phone's p81), so the tracker items render as broken video cards.
        // Filter them in the submit hook; instance-of guards the adapters that
        // carry non-VideoInformation items. .locals 3 gives exactly the three
        // registers the loop needs (iterator, item, scratch).
        val bnMethod = BnSubmitFingerprint.method
        bnMethod.addInstructionsWithLabels(
            0,
            """
                invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;
                move-result-object v0
                :ais_bn_loop
                invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z
                move-result v2
                if-eqz v2, :ais_bn_done
                invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;
                move-result-object v1
                instance-of v2, v1, Lcom/streamdev/aiostreamer/datatypes/sites/VideoInformation;
                if-eqz v2, :ais_bn_loop
                invoke-virtual {v1}, Lcom/streamdev/aiostreamer/datatypes/sites/VideoInformation;->getQuality()I
                move-result v2
                if-nez v2, :ais_bn_loop
                invoke-interface {v0}, Ljava/util/Iterator;->remove()V
                goto :ais_bn_loop
            """,
            ExternalLabel("ais_bn_done", bnMethod.implementation!!.instructions[0]),
        )

        // 6.7.2 TV: the Compose feed (TvComposeStandardActivity via the ps4
        // view model) is fed straight from SiteUIState.contentList, not through
        // the adapters above. Filter the source list once, in place, so every
        // consumer (phone lists, TV Compose rows) sees the same clean list.
        // getVideoList has .locals 3: iterator in v0, item in v1, scratch in v2.
        val listMethod = SiteVideoListFingerprint.method
        listMethod.addInstructionsWithLabels(
            0,
            """
                iget-object v0, p0, Lcom/streamdev/aiostreamer/datatypes/ui/SiteUIState;->contentList:Ljava/util/List;
                if-eqz v0, :ais_feed_done
                invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;
                move-result-object v0
                :ais_feed_loop
                invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z
                move-result v1
                if-eqz v1, :ais_feed_done
                invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;
                move-result-object v1
                instance-of v2, v1, Lcom/streamdev/aiostreamer/datatypes/sites/VideoInformation;
                if-eqz v2, :ais_feed_loop
                invoke-virtual {v1}, Lcom/streamdev/aiostreamer/datatypes/sites/VideoInformation;->getQuality()I
                move-result v2
                if-nez v2, :ais_feed_loop
                invoke-interface {v0}, Ljava/util/Iterator;->remove()V
                goto :ais_feed_loop
                :ais_feed_done
                nop
            """
        )
    }
}

object BnSubmitFingerprint : Fingerprint(
    definingClass = "Lpq;",
    name = "h",
    parameters = listOf("Ljava/util/List;", "Lxw1;")
)
