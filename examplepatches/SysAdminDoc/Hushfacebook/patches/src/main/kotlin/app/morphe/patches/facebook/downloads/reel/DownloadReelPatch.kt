/*
 * Forked from:
 * https://github.com/andrewliang25/morphe-patches/blob/5db2e57e133aede5297c48b419168cf30fd89953/patches/src/main/kotlin/app/andrewliang/patches/facebook/downloadreel/DownloadReelPatch.kt
 * Copyright 2026 Andrew Liang (GPL-3.0).
 *
 * Modified for Hushfacebook (Facebook), 2026.
 */
package app.morphe.patches.facebook.downloads.reel

import app.morphe.patches.facebook.shared.reportedFieldNames
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.patches.facebook.misc.extension.facebookExtensionPatch
import app.morphe.patches.facebook.misc.extension.enableStatus
import app.morphe.patches.facebook.misc.extension.liveAcrossInjection
import app.morphe.patches.facebook.misc.extension.localRegisterCount
import app.morphe.patches.facebook.misc.extension.patchLog
import app.morphe.patches.facebook.misc.extension.requireFreeAt
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import app.morphe.util.singleOrPatchException
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.Field
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import app.morphe.patches.facebook.misc.settings.settingsPatch

private const val HANDLER = "Lapp/morphe/extension/facebook/download/ReelDownload;"

private const val VIDEO_DATA_SOURCE = "Lcom/facebook/video/engine/api/VideoDataSource;"
private const val VIDEO_PLAYER_PARAMS = "Lcom/facebook/video/engine/api/VideoPlayerParams;"
private const val FB_USER_SESSION = "Lcom/facebook/auth/usersession/FbUserSession;"
private const val CONTEXT = "Landroid/content/Context;"
private const val FUNCTION1 = "Lkotlin/jvm/functions/Function1;"
private const val LIST = "Ljava/util/List;"
private const val ARRAY_LIST = "Ljava/util/ArrayList;"
private const val OBJECT = "Ljava/lang/Object;"

/**
 * How the injection adds to the sidebar's lists: through the List interface.
 *
 * The assembly call declares the button list only as a `java.util.List`, and where it comes from
 * already changed once: 577 makes it with `new ArrayList`, 580 gets it from a helper declared to
 * return an ArrayList. A class method such as `AbstractCollection.add` needs the verifier to know
 * the register holds one, so a helper declared to return a plain List would make ART reject the
 * whole sidebar class. An interface call verifies for any List.
 */
private const val LIST_ADD = "$LIST->add(Ljava/lang/Object;)Z"

private const val PATCH = "Download any reel"

/** The name the sidebar component reports for itself, inside the method that builds it. */
private const val SIDEBAR = "UDDSideBarComponent"

/**
 * The other component Facebook draws a reel's buttons with. It builds them from a list the viewer's
 * config hands it, through no factory this button could go in, so its reels get no Download button.
 */
private const val OTHER_SIDEBAR = "FbShortsSideBarComponent"

/** The row Facebook shows on your own video. Its icon is the one this button borrows. */
private const val DOWNLOAD_ROW = "fds_control_download_video"

/** What this button is called in the slot the sidebar fills with `share_button`. */
private const val TEST_ID = "download_button"

/**
 * The label, read at run time in the phone's language. The factory takes it as a plain string, so
 * no resource is needed, and a string written into the patch was English on every phone.
 */
private const val LABEL = "$HANDLER->label()Ljava/lang/String;"

/**
 * What is written under the icon.
 *
 * The other buttons of the strip put a count here, so it is sized for three or four characters and
 * a word wraps across two lines. The icon already says what the button does.
 */
private const val CAPTION = ""

/**
 * Which of the factory's handlers is the tap.
 *
 * Measured, not guessed. Every slot got a handler that reported the event it received. The touch
 * slot fires twice per press with a `MotionEvent`. A visibility slot fires by itself. This one
 * fires once per press with an event holding only the `View`, which is a click.
 */
private const val TAP_SLOT = 1

/** The helper this patch adds to the component. */
private const val HELPER = "hushfacebookDownloadButton"

/**
 * Adds a download button beside every reel.
 *
 * Facebook has a download row and builds it only for a video that you posted. Ownership chooses
 * the whole viewer rather than a flag inside one. So for anybody else's reel the sheet that holds
 * that row is never asked for, and there is nothing to force. `docs/facebook-ads-map.md` records
 * the four device rounds that established this, and the two readings of it that were wrong.
 *
 * So this adds a button to the sidebar beside the reel, which every reel has. Nothing is invented.
 * The sidebar builds all of its own buttons through one factory. That factory takes the label as a
 * plain string and the icon as an enum constant, so no resource and no downloaded string pack is
 * involved. This calls the same factory, with the icon Facebook's own download row draws.
 *
 * The handler holds the player of that one item, read off a field of the component, so the file
 * saved is the reel on the screen. The app prepares the reels that come next, so a handler that
 * reads a shared place saves the wrong one.
 */
@Suppress("unused")
val downloadReelPatch = bytecodePatch(
    name = "Download any reel",
    description = "Adds a Download button beside every reel. Videos save at the Download quality " +
        "you set, best by default.",
    default = true,
) {
    category("Downloads")
    dependsOn(settingsPatch)
    compatibleWith(*AppCompatibilities.facebook())
    dependsOn(facebookExtensionPatch)

    execute {
        // ---- the Kotlin type the handler runs on ------------------------------------------------
        //
        // The handler is a Java class implementing Function1, and the extension carries no Kotlin
        // standard library of its own: Function1 resolves against Facebook's copy at run time. The
        // sidebar factory's own signature names it, so Facebook keeps that name; kotlin.Unit it
        // renames, which is why the handler answers null instead. A build that renamed Function1
        // would load the handler into a NoClassDefFoundError on the first reel, so it is refused.
        check(classDefByOrNull(FUNCTION1) != null) {
            "This Facebook build does not carry $FUNCTION1 under that name, which the download handler needs"
        }

        // ---- the real names of the address fields ---------------------------------------------
        //
        // The source keeps a debug dump that pairs each field with the name it reports for it.
        // So the patch reads those names out of the app, rather than writing down letters that
        // change every release. It matters: the third address on that object is the subtitles, so
        // "the first Uri" saves the wrong thing without a word.
        val names = reportedFieldNames(VIDEO_DATA_SOURCE, marker = "videoHdUri")
        val hdField = names["videoHdUri"]
        val sdField = names["videoUri"]
        val manifestField = names["abrManifestContent"]

        check(hdField != null && sdField != null && manifestField != null) {
            "Expected videoHdUri, videoUri and abrManifestContent on the source, found ${names.keys}"
        }

        // ---- the sidebar ------------------------------------------------------------------------
        val sidebars = mutableListOf<Pair<String, String>>()
        val otherRenders = mutableListOf<Pair<String, Method>>()

        classDefForEach { classDef ->
            classDef.methods.forEach { method ->
                val list = method.instructions()

                if (method.parameterTypes.size == 1 && list.any { it.stringReference() == OTHER_SIDEBAR }) {
                    otherRenders += classDef.type to method
                }

                // The name alone is in a dozen places: state helpers, lambdas, update calls. The
                // one wanted is the method that both names the sidebar and builds a button, which
                // is the call taking four handlers.
                val namesSidebar = list.any { it.stringReference() == SIDEBAR }
                val buildsButton = list.any { instruction ->
                    instruction.methodReference()?.parameterTypes
                        ?.count { it.toString() == FUNCTION1 } == 4
                }

                if (namesSidebar && buildsButton) sidebars += classDef.type to method.name
            }
        }

        check(sidebars.size == 1) {
            "Expected 1 sidebar builder, found ${sidebars.size}: " +
                sidebars.joinToString { "${it.first}->${it.second}" }
        }

        val (sidebarClass, sidebarName) = sidebars.single()
        val component = mutableClassDefBy(sidebarClass)
        val sidebar = component.methods.filter { it.name == sidebarName }
            .singleOrPatchException("$PATCH: the one method named $sidebarName on $sidebarClass")
        val instructions = sidebar.instructions()

        val scopedType = sidebar.parameterTypes
            .singleOrPatchException("$PATCH: the one parameter of the sidebar builder $sidebarClass->$sidebarName")
            .toString()

        // ---- the other sidebar --------------------------------------------------------------------
        //
        // The Reels viewer draws its buttons with this sidebar or with FbShortsSideBarComponent, as
        // a server-side MobileConfig flag decides, and several other viewers draw the FbShorts one
        // too. That one gets no Download button (#18), and nothing said so. Its render, the same
        // Litho method with the same scoped context as the builder above, now counts itself in Hook
        // status first thing, so a report says which of the two a phone draws. The call takes no
        // register and changes nothing on the screen. A build without exactly one such render keeps
        // the button and only loses the count, so it's a warning, not a refusal.
        val others = otherRenders.filter { (type, method) ->
            type != sidebarClass && method.name == sidebarName && method.returnType == sidebar.returnType &&
                method.parameterTypes.single().toString() == scopedType
        }
        if (others.size == 1) {
            val (otherClass, otherRender) = others.single()
            mutableClassDefBy(otherClass).methods.single {
                it.name == otherRender.name && it.returnType == otherRender.returnType &&
                    it.parameterTypes.map(CharSequence::toString) == listOf(scopedType)
            }.addInstructions(0, "invoke-static { }, $HANDLER->otherSidebarBuilt()V")
        } else {
            patchLog.warning(
                "$PATCH: found ${others.size} $OTHER_SIDEBAR renders rather than one, so the diagnostic report " +
                    "can't count the reels drawn without the button.",
            )
        }

        // ---- the button factory -----------------------------------------------------------------
        //
        // One call here takes four handlers. That is the factory, and its own parameter list then
        // names every wrapper the button needs, so none of them has to be searched for separately.
        val factories = instructions.mapNotNull { it.methodReference() }
            .filter { reference ->
                reference.parameterTypes.count { it.toString() == FUNCTION1 } == 4 &&
                    reference.parameterTypes.firstOrNull()?.toString() == FB_USER_SESSION
            }
            .distinctBy { "${it.definingClass}->${it.name}" }

        check(factories.size == 1) {
            "Expected 1 button factory in $sidebarClass->$sidebarName, found ${factories.size}"
        }

        val factory = factories.single()
        val parameters = factory.parameterTypes.map(CharSequence::toString)

        // 577 takes 19 parameters, 580 one boolean more (a MobileConfig flag Facebook reads for
        // its own buttons). Everything up to the int keeps its place, and the booleans after it
        // are filled in order, so the shape is checked rather than one count.
        check(parameters.size in 19..20 && parameters[15] == "I" && parameters.drop(16).all { it == "Z" }) {
            "The button factory takes ${parameters.size} parameters ending ${parameters.drop(15)}, " +
                "expected the int and three or four booleans"
        }

        val modeType = parameters[1]
        val primaryType = parameters[2]
        val labelType = parameters[3]
        val iconType = parameters[5]

        // The mode constant this method already uses for its own buttons.
        val mode = instructions.firstNotNullOfOrNull { instruction ->
            instruction.fieldReference()?.takeIf {
                instruction.opcode == Opcode.SGET_OBJECT && it.type == modeType
            }
        }

        check(mode != null) { "No constant of $modeType is used in $sidebarName" }

        // The icon is wrapped by a class that extends the icon parameter and takes the enum.
        val iconWrapper = instructions.firstNotNullOfOrNull { instruction ->
            instruction.methodReference()?.takeIf {
                it.name == "<init>" &&
                    it.parameterTypes.size == 1 &&
                    mutableClassDefByOrNull(it.definingClass)?.superclass == iconType
            }
        }

        check(iconWrapper != null) { "No wrapper of $iconType is built in $sidebarName" }

        val iconEnumType = iconWrapper.parameterTypes.single().toString()

        // The icon itself is whichever constant Facebook's own download row draws, so the button
        // looks like the one Facebook draws itself.
        var icon: FieldReference? = null

        classDefForEach { classDef ->
            classDef.methods.forEach { method ->
                val list = method.instructions()
                if (list.none { it.stringReference() == DOWNLOAD_ROW }) return@forEach

                list.forEach { instruction ->
                    val field = instruction.fieldReference() ?: return@forEach
                    if (instruction.opcode == Opcode.SGET_OBJECT && field.type == iconEnumType) {
                        if (icon == null) icon = field
                    }
                }
            }
        }

        check(icon != null) { "The download row of Facebook draws no icon of $iconEnumType" }

        // ---- what the component holds --------------------------------------------------------
        //
        // Both by type. The player params are the field whose own type holds the player, and the
        // session is the only field of its kind.
        val playerField = component.fields.filter { field ->
            mutableClassDefByOrNull(field.type.toString())?.fields?.any {
                it.type.toString() == VIDEO_PLAYER_PARAMS
            } == true
        }.singleOrPatchException("$PATCH: the one field of $sidebarClass whose class holds VideoPlayerParams")

        val sessionField = fieldOfType(component.fields, FB_USER_SESSION, "the one FbUserSession field of $sidebarClass")
        val contextField = fieldOfType(
            mutableClassDefBy(scopedType).fields,
            CONTEXT,
            "the one Context field of the sidebar's scoped context $scopedType",
        )

        // ---- the helper -------------------------------------------------------------------------
        //
        // Its own method, so it has a fresh set of registers. The sidebar runs with more than
        // ninety and every one of them is live somewhere.
        val helper = ImmutableMethod(
            sidebarClass,
            HELPER,
            listOf(
                ImmutableMethodParameter(FB_USER_SESSION, null, null),
                ImmutableMethodParameter(scopedType, null, null),
                ImmutableMethodParameter(playerField.type.toString(), null, null),
                ImmutableMethodParameter(OBJECT, null, null),
            ),
            factory.returnType.toString(),
            AccessFlags.PUBLIC.value or AccessFlags.STATIC.value,
            null,
            null,
            MutableMethodImplementation(64),
        ).toMutable().apply {
            addInstructions(
                0,
                buildButton(
                    factory = factory,
                    parameters = parameters,
                    trailingBooleans = parameters.size - 16,
                    mode = mode,
                    icon = icon!!,
                    iconWrapperClass = iconWrapper.definingClass,
                    iconEnumType = iconEnumType,
                    primaryType = primaryType,
                    labelType = labelType,
                    scopedType = scopedType,
                    contextField = contextField.name,
                    hdField = hdField,
                    sdField = sdField,
                    manifestField = manifestField,
                ),
            )
        }

        component.methods.add(helper)

        // ---- the injection ----------------------------------------------------------------------
        //
        // The sidebar hands three lists to the call that assembles it: one of buttons, one of a
        // marker for each, one of a name for each. The injection goes before that call. There the
        // low registers have been copied into the argument block and are free again, and the list
        // is still the same object that the call receives.
        val assemblyIndex = instructions.indexOfFirst { instruction ->
            instruction.methodReference()?.parameterTypes?.count { it.toString() == ARRAY_LIST } == 2
        }

        check(assemblyIndex > 0) { "$sidebarName does not assemble a sidebar" }

        val assembly = instructions[assemblyIndex]
        val assemblyReference = assembly.methodReference()!!
        val start = (assembly as RegisterRangeInstruction).startRegister

        // The buttons are the list, not either of the two marker arrays.
        val listParameter = assemblyReference.parameterTypes
            .indexOfFirst { it.toString() == LIST }

        check(listParameter >= 0) { "The sidebar assembly takes no list of buttons" }

        val listRegister = start + listParameter

        // That argument register is filled from a local a few instructions earlier. Adding to the
        // local adds to the same object, so the search is for where it was copied from.
        val sourceRegister = traceSource(instructions, assemblyIndex, listRegister)

        check(sourceRegister != null) { "Could not trace the button list of $sidebarName" }

        // The session and the scoped context are two of the arguments this very call receives.
        // So their registers come from its own parameter list, and it states their types.
        //
        // The parameter registers of the method itself cannot be used. This method reuses them as
        // locals long before the end. So a read of `p0` here answers with whatever was last put
        // there, which is how the first attempt earned a VerifyError.
        fun argumentRegister(type: String): Int {
            val at = assemblyReference.parameterTypes.indexOfFirst { it.toString() == type }
            check(at >= 0) { "The sidebar assembly takes no $type" }
            return start + at
        }

        // The player of this item is read once in the prologue and parked, because the register
        // holding the component is overwritten soon after. Follow it to where it was parked.
        val playerRegister = instructions.withIndex().firstNotNullOfOrNull { (index, instruction) ->
            val field = instruction.fieldReference() ?: return@firstNotNullOfOrNull null

            if (field.definingClass != sidebarClass || field.name != playerField.name) {
                return@firstNotNullOfOrNull null
            }

            val read = instruction as? TwoRegisterInstruction ?: return@firstNotNullOfOrNull null
            val next = instructions.getOrNull(index + 1) as? TwoRegisterInstruction

            next?.takeIf {
                instructions[index + 1].opcode == Opcode.MOVE_OBJECT_FROM16 &&
                    it.registerB == read.registerA
            }?.registerA
        }

        check(playerRegister != null) { "The player of the item is not parked in $sidebarName" }

        // It has to survive the whole method, because the button is built at the end of it.
        val parkedOnce = instructions.count { instruction ->
            (instruction as? TwoRegisterInstruction)?.registerA == playerRegister &&
                instruction.opcode == Opcode.MOVE_OBJECT_FROM16
        }

        check(parkedOnce == 1) {
            "v$playerRegister is written $parkedOnce times, so it does not hold the player throughout"
        }

        // The reel's own story is the props the sidebar was built from, and the assembly call
        // receives it too: the one argument, besides the session, whose type is also the type of
        // one of the component's fields. Its class is a GraphQL tree, and Facebook reads the
        // reel's creation_time off it for the reel's time label. The handler reads that and the
        // first actor's name for the file name. (The component's own tree field is the reel's
        // feedback, which knows neither.)
        val storyType = assemblyReference.parameterTypes.map(CharSequence::toString)
            .filter { type ->
                type.startsWith("L") && type != FB_USER_SESSION &&
                    component.fields.any { it.type.toString() == type }
            }
            .singleOrPatchException("$PATCH: the one argument of the sidebar assembly, besides the session, the component also holds")

        // Each button of the strip is registered twice: the component in one list, and a marker
        // for what kind of button it is in another. A component added without its marker draws
        // but does not answer a tap.
        val markers = instructions.mapNotNull { it.methodReference() }
            .filter {
                it.parameterTypes.size == 1 &&
                    it.parameterTypes.single().toString() == iconEnumType &&
                    it.returnType != "V"
            }
            .distinctBy { "${it.definingClass}->${it.name}" }

        check(markers.size == 1) {
            "Expected 1 marker for an icon, found ${markers.size}"
        }

        val marker = markers.single()
        val markerRegister = traceSource(instructions, assemblyIndex, argumentRegister(ARRAY_LIST))

        check(markerRegister != null) { "Could not trace the marker list of $sidebarName" }

        // Three instructions before the call the object moves are done, so v0 to v2 hold nothing
        // that is still wanted. That was true when this was written and it is not self-evident,
        // so it is proved rather than trusted: an earlier version of this patch read `p0` here,
        // which is live nowhere near the end of this method, and the app died with a VerifyError
        // on every reel. A build that fails with a message below is the same fault found early.
        // The story takes a fourth local, found the same way.
        val injectAt = assemblyIndex - 3
        val reads = listOf(
            argumentRegister(FB_USER_SESSION),
            argumentRegister(scopedType),
            playerRegister,
            argumentRegister(storyType),
            sourceRegister,
            markerRegister,
        )
        val storyScratch = sidebar.storyScratchRegister(injectAt, reads)
        sidebar.requireSidebarBlockFits(injectAt, assemblyIndex, SIDEBAR_BLOCK_SCRATCH + storyScratch, reads)

        // The switch is asked first, every time a reel's sidebar is built. Off, paused, or before the
        // settings are ready, the branch goes straight to the instruction the block was put in
        // front of, so the sidebar is Facebook's own and none of the button's code runs. That
        // keeps a paused or safe-mode start clear of this injection, and a Download button that
        // crashed a start away from the next one.
        sidebar.addInstructionsWithLabels(
            injectAt,
            sidebarButtonBlock(
                session = argumentRegister(FB_USER_SESSION),
                scoped = argumentRegister(scopedType),
                player = playerRegister,
                story = argumentRegister(storyType),
                storyScratch = storyScratch,
                helper = "$sidebarClass->$HELPER($FB_USER_SESSION$scopedType${playerField.type}$OBJECT)${factory.returnType}",
                buttons = sourceRegister,
                icon = "${icon!!.definingClass}->${icon!!.name}:$iconEnumType",
                marker = "${marker.definingClass}->${marker.name}($iconEnumType)${marker.returnType}",
                markers = markerRegister,
            ),
            // Bound to the instruction the block goes in front of. A label written inside an
            // injected block is resolved against the block's own addresses.
            ExternalLabel("facebooks_own", sidebar.getInstruction(injectAt)),
        )

        enableStatus("reelDownload")
    }
}

/** The locals [sidebarButtonBlock] writes besides the story's: v0 to v2. */
internal val SIDEBAR_BLOCK_SCRATCH = listOf(0, 1, 2)

/**
 * The local the block borrows for the reel's story in front of instruction [index]: the lowest one
 * above v2, and v15 or below since the helper call names it, that nothing reads from [index] on and
 * that isn't one of [reads], the registers the block reads.
 */
internal fun Method.storyScratchRegister(index: Int, reads: Collection<Int>): Int {
    val live = liveAcrossInjection(index)
    return (SIDEBAR_BLOCK_SCRATCH.size until minOf(localRegisterCount(), 16))
        .firstOrNull { it !in live && it !in reads }
        ?: throw PatchException(
            "$PATCH: $definingClass->$name has no local from v3 to v15 that nothing reads after instruction $index, " +
                "for the reel's story",
        )
}

/**
 * Proves [sidebarButtonBlock] can go in front of instruction [index] of the sidebar builder, whose
 * assembly call is at [assemblyIndex]. Nothing the builder reads from [index] on may sit in one of
 * [borrowed], which the block writes. Each of [reads], which the block reads, has to be none of
 * those, and nothing between [index] and the call may write it, so the block sees the very
 * session, scoped context, player, story and lists the call gets.
 */
internal fun Method.requireSidebarBlockFits(index: Int, assemblyIndex: Int, borrowed: Collection<Int>, reads: Collection<Int>) {
    requireFreeAt(PATCH, index, borrowed)
    val clash = reads.filter { it in borrowed }.distinct().sorted()
    if (clash.isNotEmpty()) {
        throw PatchException(
            "$PATCH: $definingClass->$name keeps ${clash.joinToString { "v$it" }} for the assembly call, " +
                "which the block overwrites before reading",
        )
    }
    val instructions = implementation!!.instructions.toList()
    for (at in index until assemblyIndex) {
        val stale = reads.filter { it in writtenRegisters(instructions[at]) }.distinct().sorted()
        if (stale.isNotEmpty()) {
            throw PatchException(
                "$PATCH: $definingClass->$name writes ${stale.joinToString { "v$it" }} at instruction $at, " +
                    "after the block at $index reads it for the call at $assemblyIndex",
            )
        }
    }
}

/** The registers [instruction] writes: its destination, and the one above for a wide value. */
private fun writtenRegisters(instruction: Instruction): Set<Int> {
    val destination = (instruction as? OneRegisterInstruction)?.registerA
    if (destination == null || !instruction.opcode.setsRegister()) return emptySet()
    return if (instruction.opcode.setsWideRegister()) setOf(destination, destination + 1) else setOf(destination)
}

/**
 * What goes in front of the sidebar assembly: ask the switch, then build the button through the
 * helper and add it to the list of buttons, and its marker to the list of markers. Each number is
 * the register that holds that value at the insertion point; v0 to v2 are free there, and so is
 * [storyScratch], a fourth local for the story.
 *
 * Both adds go through [LIST_ADD], an interface call, so they verify whatever List the builder
 * hands the assembly.
 */
internal fun sidebarButtonBlock(
    session: Int,
    scoped: Int,
    player: Int,
    story: Int,
    storyScratch: Int,
    helper: String,
    buttons: Int,
    icon: String,
    marker: String,
    markers: Int,
): String = """
    invoke-static { }, $HANDLER->showsButton()Z
    move-result v0
    if-eqz v0, :facebooks_own
    move-object/from16 v0, v$session
    move-object/from16 v1, v$scoped
    move-object/from16 v2, v$player
    move-object/from16 v$storyScratch, v$story
    invoke-static { v0, v1, v2, v$storyScratch }, $helper
    move-result-object v1
    move-object/from16 v0, v$buttons
    invoke-interface { v0, v1 }, $LIST_ADD
    sget-object v2, $icon
    invoke-static { v2 }, $marker
    move-result-object v2
    move-object/from16 v0, v$markers
    invoke-interface { v0, v2 }, $LIST_ADD
"""

/** The one field among [fields] whose type is [type], or a refusal naming [what]. */
internal fun <T : Field> fieldOfType(fields: Iterable<T>, type: String, what: String): T =
    fields.filter { it.type.toString() == type }.singleOrPatchException("$PATCH: $what")

/**
 * The body of the helper that builds one button.
 *
 * Register use here is dictated by the instruction formats, not by taste. An `invoke-direct` with
 * arguments and an `iget` both take **4-bit** registers, so everything they touch has to sit in
 * `v0` to `v15`. The factory takes nineteen arguments, and thus needs nineteen **consecutive**
 * registers, so its block sits high at `v40` and each value is moved up once it is built.
 * `new-instance` and `const-string` take 8-bit registers, so those can write high directly.
 *
 * The four parameters are the session, the scoped context, the player and the reel's story, and
 * the story goes to every handler beside the player, as `v3`.
 */
private fun buildButton(
    factory: MethodReference,
    parameters: List<String>,
    trailingBooleans: Int,
    mode: FieldReference,
    icon: FieldReference,
    iconWrapperClass: String,
    iconEnumType: String,
    primaryType: String,
    labelType: String,
    scopedType: String,
    contextField: String,
    hdField: String,
    sdField: String,
    manifestField: String,
): String {
    val signature = "${factory.definingClass}->${factory.name}" +
        parameters.joinToString("", "(", ")") + factory.returnType

    return """
        move-object/from16 v0, p1
        iget-object v0, v0, $scopedType->$contextField:$CONTEXT
        move-object/from16 v5, v0
        move-object/from16 v4, p2
        move-object/from16 v6, p0
        move-object/from16 v3, p3

${handlers(hdField, sdField, manifestField)}
        invoke-static { }, $LABEL
        move-result-object v1

        new-instance v2, $primaryType
        invoke-direct { v2, v1, v8 }, $primaryType-><init>(Ljava/lang/String;$FUNCTION1)V
        move-object/from16 v42, v2

        new-instance v2, $labelType
        invoke-direct { v2, v1, v9 }, $labelType-><init>(Ljava/lang/String;$FUNCTION1)V
        move-object/from16 v43, v2

        new-instance v2, $labelType
        invoke-direct { v2, v1, v10 }, $labelType-><init>(Ljava/lang/String;$FUNCTION1)V
        move-object/from16 v44, v2

        sget-object v7, ${icon.definingClass}->${icon.name}:$iconEnumType
        new-instance v2, $iconWrapperClass
        invoke-direct { v2, v7 }, $iconWrapperClass-><init>($iconEnumType)V
        move-object/from16 v45, v2

        move-object/from16 v40, v6
        sget-object v41, ${mode.definingClass}->${mode.name}:${mode.type}
        sget-object v46, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;
        sget-object v47, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;
        const-string v48, "$TEST_ID"
        const-string v49, "$CAPTION"
        const/16 v50, 0x0
        move-object/from16 v51, v11
        move-object/from16 v52, v12
        move-object/from16 v53, v13
        move-object/from16 v54, v14
        const/16 v55, 0x11
${trailingBooleanArguments(trailingBooleans)}

        invoke-static/range { v40 .. v${55 + trailingBooleans} }, $signature
        move-result-object v0
        return-object v0
    """
}

/**
 * The booleans after the factory's int, from v56 up. The first three are what Andrew Liang
 * measured on 577 (off, on, off); a flag 580 added in front of the last is passed as off, the
 * value for an experiment Facebook has not turned on for the button.
 */
private fun trailingBooleanArguments(count: Int): String =
    (0 until count).joinToString("\n") { index ->
        val value = when {
            index == 1 -> 1
            else -> 0
        }
        "        const/16 v${56 + index}, 0x$value"
    }

/**
 * One handler for each slot the factory takes, each knowing which slot it is.
 *
 * Only the tap slot saves. The others are still given a handler rather than null, because the
 * factory is not documented to accept null, and a handler that returns without a word costs
 * nothing. Each gets the player (v4), the context (v5) and the reel's story (v3).
 */
private fun handlers(hd: String, sd: String, manifest: String) = (0..6).joinToString("\n") { slot ->
    val saves = if (slot == TAP_SLOT) 1 else 0

    """
        new-instance v20, $HANDLER
        move-object/from16 v21, v4
        move-object/from16 v22, v5
        const-string v23, "$hd"
        const-string v24, "$sd"
        const-string v25, "$manifest"
        const/16 v26, 0x$slot
        const/16 v27, 0x$saves
        move-object/from16 v28, v3
        invoke-direct/range { v20 .. v28 }, $HANDLER-><init>($OBJECT${CONTEXT}Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;IZ$OBJECT)V
        move-object/from16 v${8 + slot}, v20
    """
}

/** The local a call argument was copied from, so adding to it adds to the same object. */
private fun traceSource(instructions: List<Instruction>, callIndex: Int, argument: Int): Int? =
    (callIndex - 1 downTo maxOf(0, callIndex - 40))
        .asSequence()
        .mapNotNull { index ->
            val instruction = instructions[index]
            (instruction as? TwoRegisterInstruction)?.takeIf {
                instruction.opcode == Opcode.MOVE_OBJECT_FROM16 && it.registerA == argument
            }?.registerB
        }
        .firstOrNull()

private fun Instruction.methodReference() =
    (this as? ReferenceInstruction)?.reference as? MethodReference

private fun Instruction.fieldReference() =
    (this as? ReferenceInstruction)?.reference as? FieldReference

private fun Instruction.stringReference() =
    ((this as? ReferenceInstruction)?.reference as? StringReference)?.string

private fun MutableMethod.instructions(): List<Instruction> =
    implementation?.instructions?.toList() ?: emptyList()

private fun com.android.tools.smali.dexlib2.iface.Method.instructions(): List<Instruction> =
    implementation?.instructions?.toList() ?: emptyList()
