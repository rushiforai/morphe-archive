package arpit.morphe.patches.movieboxtv.quality

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import arpit.morphe.patches.movieboxtv.shared.Constants.COMPATIBILITY_MOVIEBOX_TV

private const val DETAIL_PLAYER_VIEW_MODEL = "Lcom/transsion/tvui/viewmodel/DetailPlayerViewModel;"

private const val PLAY_INFO = "Larpit/morphe/extension/movieboxtv/PlayInfo;"

private const val FLOW = "Lkotlinx/coroutines/flow/g1;"

/** `y0()`: the current subject id (falls back to the playback subject id). */
private const val SUBJECT_GETTER = "y0"

/** `currentSeason` (G0) and `currentEpisode` (C0) getters. */
private const val SEASON_GETTER = "G0"
private const val EPISODE_GETTER = "C0"

/** `m52077F0()`: the resources of the current play-info. */
private const val RESOURCES_GETTER = "F0"

/** `m52176x1(List<BffStreamInfo>)` and `m52174w1(List<BffResourceInfo>)`. */
private const val STREAM_MAPPER = "x1"
private const val RESOURCE_MAPPER = "w1"

/**
 * Replaces the TV progressive streams with the signed adaptive streams (DASH/HLS) of the mobile
 * BFF.
 *
 * The TV play-info endpoint describes every rendition of an episode with one progressive MP4
 * (`BffResourceInfo` / `BffStreamInfo`), often reusing the same 480p file for the 720p label and
 * never sending 1080p/4K at all. The settings panel therefore marks 720p/4K as selected while the
 * player keeps decoding the same low-resolution file.
 *
 * The mobile endpoint returns signed DASH manifests / HLS playlists with real 480p/720p/1080p/4K
 * renditions. Both stream mappers of the view model are hooked:
 *
 * - `x1` asks the extension for replacement streams. If the mobile answer is valid and at least
 *   as good as the TV answer, the list is replaced with `BffStreamInfo` objects whose format is
 *   `DASH` or `HLS`; the player then takes the track-switch or adaptive-source path instead of
 *   reloading the same MP4.
 * - `w1` drops the TV resources when the mobile streams replaced them, so the quality panel and
 *   the default-stream picker only see the real adaptive ladder.
 *
 * When the mobile endpoint is unavailable, the request fails, or the TV endpoint already offers a
 * higher resolution, both mappers return the original data untouched.
 */
@Suppress("unused")
val serveRequestedResolutionPatch = bytecodePatch(
    name = "Serve requested resolution",
    description = "Makes quality selection work: 480p, 720p, 1080p and 4K actually switch to " +
        "that resolution.",
) {
    compatibleWith(COMPATIBILITY_MOVIEBOX_TV)

    extendWith("extensions/movieboxtv.mpe")

    execute {
        val viewModel = mutableClassDefBy(DETAIL_PLAYER_VIEW_MODEL)

        for (getter in listOf(SUBJECT_GETTER, SEASON_GETTER, EPISODE_GETTER, RESOURCES_GETTER)) {
            if (viewModel.methods.none { it.name == getter && it.parameterTypes.isEmpty() }) {
                throw PatchException("Getter $getter() not found in $DETAIL_PLAYER_VIEW_MODEL.")
            }
        }

        val streamMapper = viewModel.methods.firstOrNull { method ->
            method.name == STREAM_MAPPER && method.returnType == "Ljava/util/List;" &&
                method.parameterTypes.map { it.toString() } == listOf("Ljava/util/List;")
        } ?: throw PatchException("Stream mapper $STREAM_MAPPER(List) not found in $DETAIL_PLAYER_VIEW_MODEL.")

        streamMapper.addInstructions(
            0,
            """
                move-object/from16 v5, p0
                move-object/from16 v4, p1
                invoke-virtual { v5 }, $DETAIL_PLAYER_VIEW_MODEL->$SUBJECT_GETTER()Ljava/lang/String;
                move-result-object v0
                invoke-virtual { v5 }, $DETAIL_PLAYER_VIEW_MODEL->$SEASON_GETTER()$FLOW
                move-result-object v1
                invoke-interface { v1 }, $FLOW->getValue()Ljava/lang/Object;
                move-result-object v1
                check-cast v1, Ljava/lang/Integer;
                invoke-virtual { v1 }, Ljava/lang/Integer;->intValue()I
                move-result v1
                invoke-virtual { v5 }, $DETAIL_PLAYER_VIEW_MODEL->$EPISODE_GETTER()$FLOW
                move-result-object v2
                invoke-interface { v2 }, $FLOW->getValue()Ljava/lang/Object;
                move-result-object v2
                check-cast v2, Ljava/lang/Integer;
                invoke-virtual { v2 }, Ljava/lang/Integer;->intValue()I
                move-result v2
                invoke-virtual { v5 }, $DETAIL_PLAYER_VIEW_MODEL->$RESOURCES_GETTER()Ljava/util/List;
                move-result-object v3
                invoke-static { v4, v3, v0, v1, v2 }, $PLAY_INFO->rewriteStreams(Ljava/util/List;Ljava/util/List;Ljava/lang/String;II)Ljava/util/List;
                move-result-object v4
                move-object/from16 p1, v4
            """.trimIndent(),
        )

        val resourceMapper = viewModel.methods.firstOrNull { method ->
            method.name == RESOURCE_MAPPER && method.returnType == "Ljava/util/List;" &&
                method.parameterTypes.map { it.toString() } == listOf("Ljava/util/List;")
        } ?: throw PatchException("Resource mapper $RESOURCE_MAPPER(List) not found in $DETAIL_PLAYER_VIEW_MODEL.")

        resourceMapper.addInstructions(
            0,
            """
                move-object/from16 v5, p0
                move-object/from16 v3, p1
                invoke-virtual { v5 }, $DETAIL_PLAYER_VIEW_MODEL->$SUBJECT_GETTER()Ljava/lang/String;
                move-result-object v0
                invoke-virtual { v5 }, $DETAIL_PLAYER_VIEW_MODEL->$SEASON_GETTER()$FLOW
                move-result-object v1
                invoke-interface { v1 }, $FLOW->getValue()Ljava/lang/Object;
                move-result-object v1
                check-cast v1, Ljava/lang/Integer;
                invoke-virtual { v1 }, Ljava/lang/Integer;->intValue()I
                move-result v1
                invoke-virtual { v5 }, $DETAIL_PLAYER_VIEW_MODEL->$EPISODE_GETTER()$FLOW
                move-result-object v2
                invoke-interface { v2 }, $FLOW->getValue()Ljava/lang/Object;
                move-result-object v2
                check-cast v2, Ljava/lang/Integer;
                invoke-virtual { v2 }, Ljava/lang/Integer;->intValue()I
                move-result v2
                invoke-static { v3, v0, v1, v2 }, $PLAY_INFO->rewriteResources(Ljava/util/List;Ljava/lang/String;II)Ljava/util/List;
                move-result-object v3
                move-object/from16 p1, v3
            """.trimIndent(),
        )
    }
}
