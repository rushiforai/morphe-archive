package patches.ad

import app.morphe.patcher.StringComparisonType
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.formats.Instruction35c
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

private const val NIEUWS = "Lnl/johninnl/ad/CarNieuws;"
private const val SERVICE = "Lnl/dpgmedia/mcdpg/amalia/player/audio/player/audio/service/AmaliaAudioPlayerService;"
private const val RESPONSE = "Lnl/dpgmedia/mcdpg/amalia/car/data/model/dto/CarTabSdUiResponse;"
private const val QUEUE = "Lnl/dpgmedia/mcdpg/amalia/car/data/model/CarAudioQueue;"
private const val QUEUE_DECODER = "Lnl/dpgmedia/mcdpg/amalia/car/data/model/CarAudioQueue\$Companion;->fromJsonString(Ljava/lang/String;)Lnl/dpgmedia/mcdpg/amalia/car/data/model/CarAudioQueue;"
private const val FEED_ADAPTER = "Lcom/kubus/module/network/model/AudioBundleTeaserJsonAdapter;"
private const val START_ROUTE = "/start"
private const val TAB_TITLE = "Nieuws"
private const val STRING = "Ljava/lang/String;"
/** True when the method body holds the exact string constant. */
private fun Method.holds(constant: String): Boolean {
    val body = implementation ?: return false
    return body.instructions.any { instruction ->
        val reference = (instruction as? ReferenceInstruction)?.reference
        reference is StringReference && reference.string == constant
    }
}

/** The method's declared parameter type descriptors. */
private fun Method.descriptors(): List<String> = parameterTypes.map { it.toString() }

private fun Method.hookedBy(owner: String): Boolean {
    val body = implementation ?: return false
    return body.instructions.any { instruction ->
        val reference = (instruction as? ReferenceInstruction)?.reference
        reference is MethodReference && reference.definingClass == owner
    }
}

private fun Method.references(signature: String): Boolean {
    val body = implementation ?: return false
    return body.instructions.any { instruction ->
        (instruction as? ReferenceInstruction)?.reference?.toString() == signature
    }
}

/**
 * Rewrites the Android Auto start-tab pipeline of the minified AD build. Every
 * anchor is resolved structurally — string constants, kept serialization
 * models and shape contracts — because AD 9.x renames the car browse stack;
 * see docs/ad-android-auto-fingerprint-strategy.md. No hook below mentions a
 * minified name, and every discovery fails closed when its contract changes.
 */
@Suppress("unused")
val carNieuws = bytecodePatch(
    name = "Android Auto nieuws",
    description = "Makes Nieuws the primary Android Auto tab with publisher-supplied spoken audio from the audio bundles the app itself renders. Selecting a headline restores the full ordered feed inside the app, so playback, Up next and premium entitlement follow the app's own player. The replaced Start content is never shown.",
) {
    compatibleWith(ad)
    dependsOn(originalInput)
    extendWith("extensions/ad.mpe")

    execute {
        // 1. Capture the application context from the media browser service
        //    the car connects to, before any browse request can arrive. The
        //    service class survives minification because the manifest
        //    references it.
        val onCreate = exact(SERVICE, "onCreate()V").method
        check(!onCreate.hookedBy(NIEUWS)) { "AD car service init hook already present" }
        onCreate.addInstruction(0, "invoke-static/range {p0 .. p0}, $NIEUWS->init(Landroid/content/Context;)V")

        // 2. Replace the fetched start-tab response with the Nieuws component.
        //    The fetch coroutine is found by its endpoint constant; the result
        //    wrapper type is minified, so it is learned from the construction
        //    that wraps the deserialized CarTabSdUiResponse.
        val startTabClasses = classDefByStrings("/v4/car/tabs/start", StringComparisonType.CONTAINS)
        check(startTabClasses.size == 1) {
            "AD start-tab anchor is not unique: ${startTabClasses.map { it.type }}"
        }
        val invokeSuspend = mutableClassDefBy(startTabClasses.single().type)
            .methods.singleOrNull { it.name == "invokeSuspend" && it.descriptors() == listOf("Ljava/lang/Object;") }
            ?: throw PatchException("AD start-tab coroutine contract changed")
        check(!invokeSuspend.hookedBy(NIEUWS)) { "AD start-tab hook already present" }
        val wrapped = invokeSuspend.instructions.withIndex().singleOrNull { (_, instruction) ->
            val reference = (instruction as? ReferenceInstruction)?.reference
            reference is MethodReference && reference.name == "<init>" &&
                reference.parameterTypes.map { it.toString() } in listOf(listOf(RESPONSE), listOf("Ljava/lang/Object;"))
        } ?: throw PatchException("AD start-tab wrapper construction contract changed")
        val resultRegister = (wrapped.value as Instruction35c).registerC
        invokeSuspend.addInstructions(wrapped.index + 1, """
            invoke-static/range {v$resultRegister .. v$resultRegister}, $NIEUWS->withNieuws(Ljava/lang/Object;)Ljava/lang/Object;
            move-result-object v$resultRegister
        """.trimIndent())

        // 3. Advertise the tab as Nieuws: the root browse method is the route
        //    dispatcher whose first parameter is the route string and whose
        //    body builds all three route entries. The start title is the
        //    string resolution directly preceding the /start route constant.
        //    (The URI router holds the same constants but takes no route.)
        val rootClasses = classDefByStrings("/podcast", StringComparisonType.CONTAINS).filter { clazz ->
            clazz.methods.any { it.holds(START_ROUTE) && it.holds("/radio") && it.holds("/podcast") && it.descriptors().firstOrNull() == STRING }
        }
        check(rootClasses.size == 1) {
            "AD root browse anchor is not unique: ${rootClasses.map { it.type }}"
        }
        val root = mutableClassDefBy(rootClasses.single().type).methods.singleOrNull {
            it.holds(START_ROUTE) && it.holds("/radio") && it.descriptors().firstOrNull() == STRING
        } ?: throw PatchException("AD root browse method contract changed")
        val startConstant = root.instructions.withIndex().singleOrNull { (_, instruction) ->
            val reference = (instruction as? ReferenceInstruction)?.reference
            reference is StringReference && reference.string == START_ROUTE
        } ?: throw PatchException("AD root browse start route contract changed")
        val titleIndex = root.instructions.take(startConstant.index)
            .indexOfLast { it.opcode == Opcode.MOVE_RESULT_OBJECT }
        check(titleIndex >= 0) { "AD root browse tab title contract changed" }
        val titleRegister = (root.instructions.get(titleIndex) as OneRegisterInstruction).registerA
        root.addInstruction(titleIndex + 1, "const-string v$titleRegister, \"$TAB_TITLE\"")

        // 3b. Match the other news patches' presentation: the Nieuws tab
        //     renders its feed as list rows (title, small artwork, duration).
        //     The tab builder is the three-argument route/title call inside
        //     the root browse method; its returned tab item carries the route
        //     in its extras, so the runtime only restyles the start tab.
        val tabBuilderClasses = root.instructions.withIndex().mapNotNull { (index, instruction) ->
            val reference = (instruction as? ReferenceInstruction)?.reference
            if (reference is MethodReference &&
                reference.parameterTypes.map { it.toString() } == listOf("I", STRING, STRING) &&
                root.instructions.getOrNull(index + 1)?.opcode == Opcode.MOVE_RESULT_OBJECT) {
                reference.definingClass
            } else null
        }.distinct()
        check(tabBuilderClasses.size == 1) {
            "AD tab builder anchor is not unique: $tabBuilderClasses"
        }
        val tabBuilder = mutableClassDefBy(tabBuilderClasses.single()).methods.singleOrNull {
            it.descriptors() == listOf("I", STRING, STRING)
        } ?: throw PatchException("AD tab builder method contract changed")
        tabBuilder.instructions.withIndex().filter { it.value.opcode == Opcode.RETURN_OBJECT }
            .sortedByDescending { it.index }.forEach { (index, instruction) ->
                val register = (instruction as OneRegisterInstruction).registerA
                tabBuilder.addInstruction(index,
                    "invoke-static/range {v$register .. v$register}, $NIEUWS->styleTab(Ljava/lang/Object;)V")
            }

        // 4. Keep the full feed deliverable: the playable-row builder attaches
        //    the whole lane queue to every row. It is identified by carrying
        //    the queue model parameter and the browse delivery extra in the
        //    same method; every row is windowed and the full queue retained.
        val laneClasses = classDefByStrings("LANE_QUEUE_ITEMS", StringComparisonType.CONTAINS)
        val writerClasses = laneClasses.filter { clazz ->
            clazz.methods.any { it.descriptors().contains(QUEUE) && it.holds("LANE_QUEUE_ITEMS") }
        }
        check(writerClasses.size == 1) {
            "AD row-builder anchor is not unique: ${writerClasses.map { it.type }}"
        }
        val rowMethod = mutableClassDefBy(writerClasses.single().type)
            .methods.singleOrNull { it.descriptors().contains(QUEUE) && it.holds("LANE_QUEUE_ITEMS") }
            ?: throw PatchException("AD row-builder method contract changed")
        val rowParams = rowMethod.descriptors()
        check(rowParams.firstOrNull() == STRING && rowParams.getOrNull(1) == QUEUE) {
            "AD row-builder route/queue parameter contract changed: $rowParams"
        }
        check(rowParams.size == 8 && rowParams[6] == STRING) {
            "AD row-builder group-title parameter contract changed: $rowParams"
        }
        rowMethod.addInstructions(0, """
            invoke-static/range {p1 .. p2}, $NIEUWS->slimQueue(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;
            move-result-object p2
            check-cast p2, $QUEUE
            invoke-static/range {p7 .. p7}, $NIEUWS->groupTitle(Ljava/lang/Object;)Ljava/lang/Object;
            move-result-object p7
            check-cast p7, $STRING
        """.trimIndent())

        // 5. Restore the complete queue inside the app when a row is selected:
        //    the browse callback decodes the window through the kept queue
        //    codec; the retained full queue replaces it before playback, so
        //    native next/previous and Up next follow the whole feed.
        val readerClasses = laneClasses.filter { clazz ->
            clazz.methods.any { it.references(QUEUE_DECODER) }
        }
        check(readerClasses.size == 1) {
            "AD queue-reader anchor is not unique: ${readerClasses.map { it.type }}"
        }
        val readMethod = mutableClassDefBy(readerClasses.single().type)
            .methods.singleOrNull { it.references(QUEUE_DECODER) }
            ?: throw PatchException("AD queue-reader method contract changed")
        val decoderCall = readMethod.instructions.withIndex().singleOrNull { (_, instruction) ->
            (instruction as? ReferenceInstruction)?.reference?.toString() == QUEUE_DECODER
        } ?: throw PatchException("AD queue decode site contract changed")
        val decoded = readMethod.instructions.get(decoderCall.index + 1)
        check(decoded.opcode == Opcode.MOVE_RESULT_OBJECT) { "AD queue decoder contract changed" }
        val decodedRegister = (decoded as OneRegisterInstruction).registerA
        readMethod.addInstructions(decoderCall.index + 2, """
            invoke-static/range {v$decodedRegister .. v$decodedRegister}, $NIEUWS->restoreQueue(Ljava/lang/Object;)Ljava/lang/Object;
            move-result-object v$decodedRegister
            check-cast v$decodedRegister, $QUEUE
        """.trimIndent())

        // 6. Observe accepted queue commits. The current-queue model is
        //    minified, but its toString template survives; the holder is the
        //    only class with a single-argument commit method for that model.
        val currentQueueClasses = classDefByStrings("CurrentQueue(currentItemQueueUid=", StringComparisonType.CONTAINS)
        check(currentQueueClasses.size == 1) {
            "AD current-queue anchor is not unique: ${currentQueueClasses.map { it.type }}"
        }
        val currentQueueType = currentQueueClasses.single().type
        val commit = classDefBy { clazz ->
            clazz.type != currentQueueType && clazz.methods.any { method ->
                method.returnType.toString() == "V" && method.descriptors() == listOf(currentQueueType)
            }
        }
        val commitMethod = mutableClassDefBy(commit.type)
            .methods.singleOrNull { it.returnType.toString() == "V" && it.descriptors() == listOf(currentQueueType) }
            ?: throw PatchException("AD queue commit method contract changed")
        commitMethod.addInstruction(0, "invoke-static/range {p1 .. p1}, $NIEUWS->onQueueChanged(Ljava/lang/Object;)V")

        // 7. Feed capture: every audio bundle the app's own Moshi adapter
        //    parses becomes a Nieuws candidate. The adapter class name
        //    survives; the reader parameter type is minified, so fromJson is
        //    resolved by name within the adapter and its result remembered
        //    before every return.
        val adapterClass = mutableClassDefBy(FEED_ADAPTER)
        val fromJson = adapterClass.methods.singleOrNull { it.name == "fromJson" && it.descriptors().size == 1 }
            ?: throw PatchException("AD feed adapter fromJson contract changed")
        check(!fromJson.hookedBy(NIEUWS)) { "AD feed capture hook already present" }
        fromJson.instructions.withIndex().filter { it.value.opcode == Opcode.RETURN_OBJECT }
            .sortedByDescending { it.index }.forEach { (index, instruction) ->
                val register = (instruction as OneRegisterInstruction).registerA
                fromJson.addInstruction(index, "invoke-static/range {v$register .. v$register}, $NIEUWS->rememberAudioBundle(Ljava/lang/Object;)V")
            }
    }
}
