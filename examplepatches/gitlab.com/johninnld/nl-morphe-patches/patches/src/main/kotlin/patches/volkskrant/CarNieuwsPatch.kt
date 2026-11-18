package patches.volkskrant

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.removeInstructions
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.formats.Instruction35c
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val NIEUWS = "Lnl/johninnl/volkskrant/CarNieuws;"
private const val SERVICE = "Lnl/dpgmedia/mcdpg/amalia/player/audio/player/audio/service/AmaliaAudioPlayerService;"
private const val START_LAMBDA = "Lnl/dpgmedia/mcdpg/amalia/car/data/network/CarApi\$getTabStart\$\$inlined\$get\$default\$1;"
private const val ROOT = "Lnl/dpgmedia/mcdpg/amalia/car/ui/controller/RootController;"
private const val SUCCESS_INIT = "Lnl/dpgmedia/mcdpg/amalia/util/kotlin/result/AmaliaResult\$Success;-><init>(Ljava/lang/Object;)V"
private const val START_TAB_KEY = "Lnl/dpgmedia/mcdpg/amalia/assets/strings/StringKey\$Car\$Tab\$Start;->INSTANCE:Lnl/dpgmedia/mcdpg/amalia/assets/strings/StringKey\$Car\$Tab\$Start;"
private const val TAB_MAPPER_CREATE_TAB = "Lnl/dpgmedia/mcdpg/amalia/car/ui/mediaitem/CarMediaItemTabMapper;->createTab(ILjava/lang/String;Ljava/lang/String;)Landroidx/media3/common/MediaItem;"
private const val MAPPER = "Lnl/dpgmedia/mcdpg/amalia/car/ui/mediaitem/CarMediaItemMapper;"
private const val TO_LANE_ITEM_QUEUES = "Lnl/dpgmedia/mcdpg/amalia/car/ui/mediaitem/CarMediaItemQueueMapper;->toLaneItemQueues(Ljava/util/List;)Ljava/util/List;"
private const val QUEUE = "Lnl/dpgmedia/mcdpg/amalia/car/data/model/CarAudioQueue;"
private const val QUEUE_DECODER = "Lnl/dpgmedia/mcdpg/amalia/car/data/model/CarAudioQueue\$Companion;->fromJsonString(Ljava/lang/String;)Lnl/dpgmedia/mcdpg/amalia/car/data/model/CarAudioQueue;"
private const val CALLBACK = "Lnl/dpgmedia/mcdpg/amalia/car/ui/browser/CarMediaSessionCallbackDelegate;"
private const val BRIDGE = "Lnl/johninnl/volkskrant/NewsQueueBridge;"
private const val QUEUE_PLAYER = "Lnl/dpgmedia/mcdpg/amalia/audio/queue/player/AmaliaAudioQueuePlayer;"
private const val QUEUE_HOLDER = "Lnl/dpgmedia/mcdpg/amalia/audio/queue/holder/AudioQueueHolder;"
private const val PLAYER_FACTORY = "Lnl/dpgmedia/mcdpg/amalia/player/audio/player/audio/exoplayer/Media3PlayerFactory;"
private const val PLAYER_COMMANDS = "Landroidx/media3/common/Player\$Commands;"
private const val TAB_TITLE = "Nieuws"

/**
 * Rewrites the Android Auto start-tab pipeline instead of adding a parallel
 * one. Every synthesized row is a spoken_article of the app's own car SDK, so
 * browsing, queue construction, history, tracking, premium handling and
 * playback resolution all run through unmodified Amalia code paths.
 */
@Suppress("unused")
val carNieuws = bytecodePatch(
    name = "Android Auto nieuws",
    description = "Makes Nieuws the primary Android Auto tab with publisher-supplied spoken audio. Selecting a headline starts the ordered feed at that article, with Previous, Next and Up next through the existing car player. Premium audio keeps its entitlement.",
) {
    compatibleWith(volkskrant)
    dependsOn(originalInput)
    extendWith("extensions/volkskrant.mpe")

    execute {
        // 1. Capture the application context from the media browser service the
        //    car connects to, before any browse request can arrive.
        val onCreate = exact(SERVICE, "onCreate").method
        check(onCreate.instructions.none { instruction ->
            val reference = (instruction as? ReferenceInstruction)?.reference
            reference is MethodReference && reference.definingClass == NIEUWS
        }) { "Volkskrant car service init hook already present" }
        onCreate.addInstruction(0, "invoke-static/range {p0 .. p0}, $NIEUWS->init(Landroid/content/Context;)V")

        // 2. Replace the fetched start-tab response with the Nieuws component.
        //    The start-tab coroutine builds exactly one AmaliaResult.Success
        //    from the deserialized CarTabSdUiResponse; rewrite that value.
        val startTab = exact(START_LAMBDA, "invokeSuspend", "Ljava/lang/Object;", "Ljava/lang/Object;").method
        check(startTab.instructions.none { instruction ->
            val reference = (instruction as? ReferenceInstruction)?.reference
            reference is MethodReference && reference.definingClass == NIEUWS
        }) { "Volkskrant start-tab hook already present" }
        val wrapped = startTab.instructions.withIndex().single { (_, instruction) ->
            (instruction as? ReferenceInstruction)?.reference?.toString() == SUCCESS_INIT
        }
        val resultRegister = (wrapped.value as Instruction35c).registerC
        startTab.addInstructions(wrapped.index + 1, """
            invoke-static/range {v$resultRegister .. v$resultRegister}, $NIEUWS->withNieuws(Ljava/lang/Object;)Ljava/lang/Object;
            move-result-object v$resultRegister
        """.trimIndent())

        // 3. Advertise the tab as Nieuws: replace the localized Start title
        //    right after it is resolved, keeping route and icon untouched.
        val root = exact(ROOT, "get", "Ljava/util/List;").method
        val startKey = root.instructions.withIndex().single { (_, instruction) ->
            (instruction as? ReferenceInstruction)?.reference?.toString() == START_TAB_KEY
        }
        val title = root.instructions.withIndex().drop(startKey.index).first { (_, instruction) ->
            instruction.opcode == Opcode.MOVE_RESULT_OBJECT
        }
        val titleRegister = (title.value as OneRegisterInstruction).registerA
        root.addInstruction(title.index + 1, "const-string v$titleRegister, \"$TAB_TITLE\"")

        // 4. Render the Nieuws tab's children as list rows: big title, small
        //    leading artwork, duration and date, exactly like the app's own
        //    episode rows in list mode.
        val startTabItem = root.instructions.withIndex().drop(title.index).first { (_, instruction) ->
            (instruction as? ReferenceInstruction)?.reference?.toString() == TAB_MAPPER_CREATE_TAB
        }
        val tabRegister = (root.instructions.get(startTabItem.index + 1) as OneRegisterInstruction).registerA
        root.addInstruction(startTabItem.index + 2,
            "invoke-static/range {v$tabRegister .. v$tabRegister}, $NIEUWS->styleTab(Ljava/lang/Object;)V")

        // 5. Keep the full feed deliverable: the mapper attaches the whole lane
        //    queue to every row, so a large spoken-news lane overflows the
        //    browse transaction. Article browse rows carry just their own item.
        val fromUiDto = exact(MAPPER, "fromUiDto", "Ljava/lang/Object;",
            "Lnl/dpgmedia/mcdpg/amalia/car/data/model/CarTabUi;",
            "Lnl/dpgmedia/mcdpg/amalia/car/data/model/CarItemTrackingArgs\$ScreenName;",
            "Lkotlin/coroutines/Continuation;").method
        val queueCall = fromUiDto.instructions.withIndex().single { (_, instruction) ->
            (instruction as? ReferenceInstruction)?.reference?.toString() == TO_LANE_ITEM_QUEUES
        }
        val queueRegister = (fromUiDto.instructions.get(queueCall.index + 1) as OneRegisterInstruction).registerA
        fromUiDto.addInstructions(queueCall.index + 2, """
            invoke-static/range {v$queueRegister .. v$queueRegister}, $NIEUWS->slimQueues(Ljava/lang/Object;)Ljava/lang/Object;
            move-result-object v$queueRegister
        """.trimIndent())

        // 6. Restore the complete queue inside the app when a row is selected.
        //    Browse delivery is linear in feed size; native next/previous and
        //    entitlement handling still receive the original full queue.
        val readQueue = exact(CALLBACK, "readLaneQueue", QUEUE, "Landroid/os/Bundle;").method
        val decoder = readQueue.instructions.withIndex().single { (_, instruction) ->
            (instruction as? ReferenceInstruction)?.reference?.toString() == QUEUE_DECODER
        }
        val decoded = readQueue.instructions.get(decoder.index + 1)
        check(decoded.opcode == Opcode.MOVE_RESULT_OBJECT) { "Volkskrant queue decoder contract changed" }
        check(readQueue.implementation!!.tryBlocks.isEmpty()) { "Volkskrant queue decoder gained a handler" }
        // Keep the original Bundle available for the compact durable feed ID.
        // The helper still uses this exact native JSON decoder before restoring
        // the selected sequence; it performs no playback authorization itself.
        readQueue.removeInstructions(0, readQueue.instructions.count())
        readQueue.addInstructions(0, """
            invoke-static/range {p1 .. p1}, $NIEUWS->readQueue(Landroid/os/Bundle;)Ljava/lang/Object;
            move-result-object p0
            check-cast p0, $QUEUE
            return-object p0
        """.trimIndent())

        // 7. Retain each original browse item for queue metadata. Its opaque
        //    occurrence ID and compact provider extras remain untouched.
        val buildItem = exact(MAPPER, "buildPlayableMediaItem-pcjo9SI", "Landroidx/media3/common/MediaItem;",
            "Ljava/lang/String;", QUEUE, "Ljava/lang/String;", "Ljava/lang/String;",
            "Lnl/dpgmedia/mcdpg/amalia/car/data/model/CarItemTrackingArgs;",
            "Ljava/lang/String;", "Ljava/lang/String;", "Lkotlin/jvm/functions/Function1;").method
        val itemReturn = buildItem.instructions.withIndex().single { it.value.opcode == Opcode.RETURN_OBJECT }
        val itemRegister = (itemReturn.value as OneRegisterInstruction).registerA
        buildItem.addInstruction(itemReturn.index,
            "invoke-static/range {v$itemRegister .. v$itemRegister}, $NIEUWS->rememberBrowseItem(Ljava/lang/Object;)V")

        // 8. Observe only accepted native queue commits. These may occur on IO;
        //    the extension marshals session notifications to the player looper.
        val commit = exact(QUEUE_HOLDER, "commit", "V",
            "Lnl/dpgmedia/mcdpg/amalia/audio/queue/holder/CurrentQueue;").method
        val queueMutation = commit.instructions.withIndex().single { (_, instruction) ->
            (instruction as? ReferenceInstruction)?.reference?.toString() ==
                "Lkotlinx/coroutines/flow/MutableStateFlow;->setValue(Ljava/lang/Object;)V"
        }
        // R8 reuses p0 for MutableStateFlow here; p1 still holds CurrentQueue.
        commit.addInstruction(queueMutation.index + 1,
            "invoke-static/range {p1 .. p1}, $BRIDGE->onQueueChanged(Ljava/lang/Object;)V")

        // 9. Use the native lazy queue player for all manual navigation. Its
        //    completion observer remains the sole owner of automatic advance.
        val queuePlayerInit = exact(QUEUE_PLAYER, "<init>", "V",
            "Lnl/dpgmedia/mcdpg/amalia/audio/queue/manipulator/AudioQueueManipulator;",
            "Lnl/dpgmedia/mcdpg/amalia/audio/launcher/AudioItemPlayer;").method
        val playerInitReturn = queuePlayerInit.instructions.withIndex().single { it.value.opcode == Opcode.RETURN_VOID }
        queuePlayerInit.addInstruction(playerInitReturn.index,
            "invoke-static/range {p0 .. p0}, $BRIDGE->capturePlayer(Ljava/lang/Object;)V")

        // 10. Publish that same queue through the existing session's Player.
        //     No second session or eagerly resolved article playlist is added.
        val createPlayer = exact(PLAYER_FACTORY, "create", "Landroidx/media3/common/Player;",
            "Landroid/content/Context;", "Lkotlin/jvm/functions/Function1;").method
        val playerReturn = createPlayer.instructions.withIndex().single { it.value.opcode == Opcode.RETURN_OBJECT }
        val playerRegister = (playerReturn.value as OneRegisterInstruction).registerA
        createPlayer.addInstructions(playerReturn.index, """
            invoke-static/range {v$playerRegister .. v$playerRegister}, Lnl/johninnl/volkskrant/NewsQueuePlayer;->wrap(Ljava/lang/Object;)Ljava/lang/Object;
            move-result-object v$playerRegister
            check-cast v$playerRegister, Landroidx/media3/common/Player;
        """.trimIndent())

        // R8 inlined Timeline's constructor out of this APK. The extension's
        // real Timeline subclass needs the ordinary Object constructor chain.
        val timeline = exact("Landroidx/media3/common/Timeline;", "getWindowCount", "I").classDef
        check(timeline.methods.none { it.name == "<init>" }) { "Volkskrant Timeline constructor contract changed" }
        timeline.methods.add(helper(timeline.type, "<init>", "V", emptyList(), 0, """
            invoke-direct {p0}, Ljava/lang/Object;-><init>()V
            return-void
        """.trimIndent(), static = false).apply {
            accessFlags = AccessFlags.PUBLIC.value or AccessFlags.CONSTRUCTOR.value
        })

        // The notification controller's grant becomes Media3's global legacy
        // allow-list. Keep timeline and queue selection permitted even when a
        // controller connects before the first news item is selected. The
        // player continues to determine actual navigation availability.
        val notificationCommands = exact(
            "Lnl/dpgmedia/mcdpg/amalia/player/audio/player/audio/service/command/MediaSessionAvailableCommandProvider;",
            "getPlayerCommandsForMediaNotification", PLAYER_COMMANDS).method
        notificationCommands.instructions.withIndex().filter { it.value.opcode == Opcode.RETURN_OBJECT }
            .sortedByDescending { it.index }.forEach { (index, instruction) ->
                val register = (instruction as OneRegisterInstruction).registerA
                notificationCommands.addInstructions(index, """
                    invoke-static/range {v$register .. v$register}, $BRIDGE->controllerCommands(Ljava/lang/Object;)Ljava/lang/Object;
                    move-result-object v$register
                    check-cast v$register, $PLAYER_COMMANDS
                """.trimIndent())
            }
    }
}
