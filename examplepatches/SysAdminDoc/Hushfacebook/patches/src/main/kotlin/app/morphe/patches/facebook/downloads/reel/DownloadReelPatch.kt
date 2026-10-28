/*
 * Forked from:
 * https://github.com/andrewliang25/morphe-patches/blob/5db2e57e133aede5297c48b419168cf30fd89953/patches/src/main/kotlin/app/andrewliang/patches/facebook/downloadreel/DownloadReelPatch.kt
 * Copyright 2026 Andrew Liang (GPL-3.0).
 *
 * Modified for Hushfacebook (Facebook), 2026.
 */
package app.morphe.patches.facebook.downloads.reel

import app.morphe.patcher.StringComparisonType
import app.morphe.patches.facebook.feed.aidetected.EXTENSION_CLASSES
import app.morphe.patches.facebook.feed.holdsString
import app.morphe.patches.facebook.feed.resolveStatic
import app.morphe.patches.facebook.media.resume.TRACK_START
import app.morphe.patches.facebook.media.resume.paramsGetters
import app.morphe.patches.facebook.media.resume.reportedValues
import app.morphe.patches.facebook.media.resume.trackers
import app.morphe.patches.facebook.media.taptoplay.FB_SHORTS
import app.morphe.patches.facebook.media.taptoplay.GROOT_PLAY
import app.morphe.patches.facebook.media.taptoplay.grootPlays
import app.morphe.patches.facebook.shared.reportedFieldNames
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.patches.facebook.misc.extension.facebookExtensionPatch
import app.morphe.patches.facebook.misc.extension.enableStatus
import app.morphe.patches.facebook.misc.extension.liveAcrossInjection
import app.morphe.patches.facebook.misc.extension.localRegisterCount
import app.morphe.patches.facebook.misc.extension.parameterRegisterNumber
import app.morphe.patches.facebook.misc.extension.patchLog
import app.morphe.patches.facebook.misc.extension.requireFreeAt
import app.morphe.patches.facebook.misc.extension.requireParameterIntact
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import app.morphe.util.ControlFlow
import app.morphe.util.addInstructionsAtControlFlowLabel
import app.morphe.util.classDefForEachReferencing
import app.morphe.util.singleOrPatchException
import app.morphe.util.findMutableMethodOf
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
import java.util.BitSet

private const val HANDLER = "Lapp/morphe/extension/facebook/download/ReelDownload;"
internal const val REEL_SIDEBAR_DIAGNOSTICS = "Lapp/morphe/extension/facebook/download/ReelSidebarDiagnostics;"

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
internal const val SIDEBAR = "UDDSideBarComponent"

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
    description = "Adds a Download button beside every reel and a Download row to its More menu, so you can keep " +
        "reels on your phone. Videos save at the quality you set, best by default. The More menu also gets Copy " +
        "caption, which copies the reel's whole caption. On by default. Turn either off in " +
        "Hushfacebook settings > Reels and Watch.",
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

        // A sidebar builder names SIDEBAR ([isSidebarBuilder]).
        classDefForEachReferencing(strings = listOf(OTHER_SIDEBAR, SIDEBAR)) { classDef ->
            classDef.methods.forEach { method ->
                val list = method.instructions()

                if (method.parameterTypes.size == 1 && list.any { it.stringReference() == OTHER_SIDEBAR }) {
                    otherRenders += classDef.type to method
                }

                if (isSidebarBuilder(method, classDef.methods)) sidebars += classDef.type to method.name
            }
        }

        check(sidebars.size == 1) {
            "Expected 1 sidebar builder, found ${sidebars.size}: " +
                sidebars.joinToString { "${it.first}->${it.second}" }
        }

        val (sidebarClass, sidebarName) = sidebars.single()
        val builderClass = mutableClassDefBy(sidebarClass)
        val sidebar = builderClass.methods.filter { it.name == sidebarName }
            .singleOrPatchException("$PATCH: the one method named $sidebarName on $sidebarClass")
        val instructions = sidebar.instructions()

        // Up to 583 the builder calls the button factory itself. 584 calls it from a static of the
        // component instead (LX/AF0;->A01, which the render LX/AF0;->A0l calls before and in its
        // button loop), so the factory, its mode constant and the icon wrapper are read there.
        val factoryCaller = buttonFactoryCallers(sidebar, builderClass.methods)
            .singleOrPatchException("$PATCH: the one method of $sidebarClass calling the button factory for $sidebarName")
        val factoryCalls = factoryCaller.instructions()

        // ---- the render ---------------------------------------------------------------------------
        //
        // Up to 582 the builder is the component's own render, which takes the scoped context
        // alone and reads the component's fields. 583 leaves the body in the component's spec,
        // handed the scoped context, then the fields and the state, and the render only calls it.
        // The component, whose fields the player and the story are found by, is the render's class.
        val (renderClass, render) = if (sidebar.parameterTypes.size == 1) {
            sidebarClass to sidebar
        } else {
            val renders = mutableListOf<Pair<String, Method>>()
            classDefForEachReferencing(types = listOf(sidebar.definingClass)) { classDef ->
                classDef.methods.filter { rendersThrough(it, sidebar) }.forEach { renders += classDef.type to it }
            }
            renders.singleOrPatchException("$PATCH: the one render handing the scoped context to $sidebarClass->$sidebarName")
        }
        val component = mutableClassDefBy(renderClass)

        val scopedType = render.parameterTypes
            .singleOrPatchException("$PATCH: the one parameter of the sidebar's render $renderClass->${render.name}")
            .toString()

        // ---- the other sidebar --------------------------------------------------------------------
        //
        // The Reels viewer draws its buttons with this sidebar or with FbShortsSideBarComponent, as
        // a server-side MobileConfig flag decides, and several other viewers draw the FbShorts one
        // too. That one gets no Download button (#18), and nothing said so. Its render, the same
        // Litho method with the same scoped context as the render above, now counts itself in Hook
        // status first thing, so a report says which of the two a phone draws. The call takes no
        // register and changes nothing on the screen. A build without exactly one such render keeps
        // the button and only loses the count, so it's a warning, not a refusal.
        val others = otherRenders.filter { (type, method) ->
            type != renderClass && method.name == render.name && method.returnType == render.returnType &&
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
        // One call there takes four handlers. That is the factory, and its own parameter list then
        // names every wrapper the button needs, so none of them has to be searched for separately.
        val factories = factoryCalls.mapNotNull { it.methodReference() }
            .filter(::isButtonFactory)
            .distinctBy { "${it.definingClass}->${it.name}" }

        check(factories.size == 1) {
            "Expected 1 button factory in $sidebarClass->${factoryCaller.name}, found ${factories.size}"
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

        // The mode constant that method already uses for its own buttons.
        val mode = factoryCalls.firstNotNullOfOrNull { instruction ->
            instruction.fieldReference()?.takeIf {
                instruction.opcode == Opcode.SGET_OBJECT && it.type == modeType
            }
        }

        check(mode != null) { "No constant of $modeType is used in ${factoryCaller.name}" }

        // The icon is wrapped by a class that extends the icon parameter and takes the enum.
        val iconWrapper = factoryCalls.firstNotNullOfOrNull { instruction ->
            instruction.methodReference()?.takeIf {
                it.name == "<init>" &&
                    it.parameterTypes.size == 1 &&
                    mutableClassDefByOrNull(it.definingClass)?.superclass == iconType
            }
        }

        check(iconWrapper != null) { "No wrapper of $iconType is built in ${factoryCaller.name}" }

        val iconEnumType = iconWrapper.parameterTypes.single().toString()

        // The icon itself is whichever constant Facebook's own download row draws, so the button
        // looks like the one Facebook draws itself.
        var icon: FieldReference? = null

        classDefForEachReferencing(strings = listOf(DOWNLOAD_ROW)) { classDef ->
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

        builderClass.methods.add(helper)

        // ---- the injection ----------------------------------------------------------------------
        //
        // The sidebar hands three lists to the call that assembles it: one of buttons, one of a
        // marker for each, one of a name for each. The injection goes before that call, where the
        // lists are the same objects that the call receives.
        val assemblyIndex = instructions.indexOfFirst { instruction ->
            instruction.methodReference()?.parameterTypes?.count { it.toString() == ARRAY_LIST } == 2
        }

        check(assemblyIndex > 0) { "$sidebarName does not assemble a sidebar" }

        val assembly = instructions[assemblyIndex]
        val assemblyReference = assembly.methodReference()!!
        val start = (assembly as RegisterRangeInstruction).startRegister

        // The session, the scoped context, the story, the buttons (the List, not either of the two
        // marker arrays) and the markers (the first ArrayList) are arguments this very call
        // receives. So their registers come from its own parameter list, which states their types,
        // and they're followed back from there to where the block reads them (argumentAt).
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
        // holding the component is overwritten soon after. Follow it to where it was parked. On
        // 583 the render reads the field and the builder gets it as a parameter, which keeps its
        // own register to the end (arm64 LX/APP;->A02 only reads its LX/5DL in v113, and copies
        // it to v35 behind a branch, so the copy isn't set on every path). The block reads the
        // parameter there, once that's proved below.
        val playerParameter = if (sidebar === render) {
            null
        } else {
            sidebar.parameterTypes.indices
                .filter { sidebar.parameterTypes[it].toString() == playerField.type.toString() }
                .singleOrPatchException("$PATCH: the one parameter of $sidebarClass->$sidebarName typed as the player ${playerField.type}")
        }
        // Where it's parked: the move straight after the field read, and the register it fills.
        val parking = if (playerParameter != null) {
            null
        } else {
            instructions.withIndex().firstNotNullOfOrNull { (index, instruction) ->
                val field = instruction.fieldReference() ?: return@firstNotNullOfOrNull null

                if (field.definingClass != sidebarClass || field.name != playerField.name) {
                    return@firstNotNullOfOrNull null
                }

                val read = instruction as? TwoRegisterInstruction ?: return@firstNotNullOfOrNull null
                val next = instructions.getOrNull(index + 1) as? TwoRegisterInstruction

                next?.takeIf {
                    instructions[index + 1].opcode == Opcode.MOVE_OBJECT_FROM16 &&
                        it.registerB == read.registerA
                }?.let { index + 1 to it.registerA }
            }
        }

        check(playerParameter != null || parking != null) { "The player of the item is not parked in $sidebarName" }

        val playerRegister = parking?.second ?: sidebar.parameterRegisterNumber(playerParameter!!)

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
        val markers = iconMarkers(sidebar, iconEnumType) { call ->
            classDefByOrNull(call.definingClass)?.let { resolveStatic(it, call) }
        }

        check(markers.size == 1) {
            "Expected 1 marker for an icon, found ${markers.size}"
        }

        val marker = markers.single()

        // Up to 583, three instructions before the call the object moves are done, so v0 to v2
        // hold nothing that is still wanted. 583 copies three lambdas out of v0 to v2 last, so
        // there the block goes in nearer the call, after the last of them. 584 parks the scoped
        // context over the player while it makes the call's event handles (LX/AF0;->A0l writes
        // v29 at instruction 549 of 601), so there the block goes at the start of the call's
        // straight run, where the button loop ends, before the lambdas are made (sidebarBlockIndex).
        //
        // None of that is self-evident, so it is proved rather than trusted: an earlier version of
        // this patch read `p0` here, which is live nowhere near the end of this method, and the app
        // died with a VerifyError on every reel. A build that fails with a message below is the same
        // fault found early. Every path to the block has to bring the parked player, and every
        // argument it reads has to be what the call gets. The story goes to the helper in its own
        // register when that's v3 to v15, as in 582, whose assembly arguments start at v3 and fill
        // every local up to v19, and on 584, which keeps it in v14. Otherwise it takes a fourth
        // local, found the same way.
        val injectAt = sidebar.sidebarBlockIndex(assemblyIndex, parking?.second)
        parking?.let { (parkedAt, register) -> sidebar.requireParkedAt("$PATCH: the player", register, parkedAt, injectAt) }
        playerParameter?.let { sidebar.requireParameterIntact("$PATCH: the player", it, listOf(injectAt)) }
        fun heldAtBlock(type: String) = sidebar.argumentAt(injectAt, assemblyIndex, argumentRegister(type))
        val session = heldAtBlock(FB_USER_SESSION)
        val scoped = heldAtBlock(scopedType)
        val story = heldAtBlock(storyType)
        val buttons = heldAtBlock(LIST)
        val markerList = heldAtBlock(ARRAY_LIST)
        val reads = listOf(session, scoped, playerRegister, story, buttons, markerList)
        val storyScratch = sidebar.storyScratchRegister(injectAt, reads, story)
        val borrowed = if (storyScratch == story) SIDEBAR_BLOCK_SCRATCH else SIDEBAR_BLOCK_SCRATCH + storyScratch
        sidebar.requireSidebarBlockFits(injectAt, borrowed, reads)

        // The switch is asked first, every time a reel's sidebar is built. Off, paused, or before the
        // settings are ready, the branch goes straight to the instruction the block was put in
        // front of, so the sidebar is Facebook's own and none of the button's code runs. That
        // keeps a paused or safe-mode start clear of this injection, and a Download button that
        // crashed a start away from the next one. The block takes over that instruction's label,
        // so a jump to it, like 584's loop exit, runs the block first.
        sidebar.addInstructionsAtControlFlowLabel(
            injectAt,
            sidebarButtonBlock(
                session = session,
                scoped = scoped,
                player = playerRegister,
                story = story,
                storyScratch = storyScratch,
                helper = "$sidebarClass->$HELPER($FB_USER_SESSION$scopedType${playerField.type}$OBJECT)${factory.returnType}",
                buttons = buttons,
                icon = "${icon!!.definingClass}->${icon!!.name}:$iconEnumType",
                marker = "${marker.definingClass}->${marker.name}($iconEnumType)${marker.returnType}",
                markers = markerList,
            ),
        )

        // ---- the More sheet -----------------------------------------------------------------------
        //
        // Reels drawn without the UDD sidebar, like the ones some accounts get in a list inside the
        // main screen, show no button above (#18). Every reel's More sheet comes from one builder,
        // so a Download row goes there too. The fixture tests hold it on every declared build; on
        // another one the sidebar button is still worth having, so a miss here is a warning.
        //
        // Copy caption goes in first, so it runs after the Download row and lands below it (#240).
        // It needs the caption render too; either miss leaves the rest working, so each is a warning.
        try {
            rememberCaptions(PATCH)
            addCaptionRow(PATCH, moreSheet(PATCH))
        } catch (exception: PatchException) {
            patchLog.warning("${exception.message}, so reels get no Copy caption row in their More sheet.")
        }
        try {
            addDownloadRow(
                patch = PATCH,
                sheet = moreSheet(PATCH),
                scopedType = scopedType,
                contextField = contextField.name,
                storyType = storyType,
                hdField = hdField,
                sdField = sdField,
                manifestField = manifestField,
            )
        } catch (exception: PatchException) {
            patchLog.warning("${exception.message}, so reels get no Download row in their More sheet.")
        }

        try {
            addMissingSidebarDiagnostic()
        } catch (exception: PatchException) {
            patchLog.warning("${exception.message}, so the missing-sidebar layout diagnostic isn't added.")
        }

        enableStatus("reelDownload")
    }
}

/**
 * The kept start tracker and params getter used by the playback patches, without depending on
 * either optional patch. All anchors are proved before the stub or tracker changes. One range
 * call reads the player without borrowing a register, and the single predicate stub uses v0
 * throughout so its getter and boolean field read fit the 4-bit register formats.
 */
internal fun BytecodePatchContext.addMissingSidebarDiagnostic() {
    fun refuse(detail: String): Nothing = throw PatchException("$PATCH: missing-sidebar diagnostic: $detail")
    val plays = classDefByStrings(GROOT_PLAY, StringComparisonType.EQUALS)
        .filterNot { it.type.startsWith(EXTENSION_CLASSES) }.flatMap(::grootPlays)
    val play = plays.singleOrNull() ?: refuse("expected one player play holding $GROOT_PLAY, found ${plays.size}")
    val owner = classDefBy(play.definingClass)
    val starts = trackers(owner, TRACK_START, play.parameterTypes.single().toString())
    val start = starts.singleOrNull() ?: refuse("expected one $TRACK_START in ${owner.type}, found ${starts.size}")
    if (start.implementation!!.instructions.none()) refuse("$TRACK_START has no instructions")
    val getters = paramsGetters(owner)
    val getter = getters.singleOrNull() ?: refuse("expected one params getter in ${owner.type}, found ${getters.size}")
    val params = classDefByOrNull(VIDEO_PLAYER_PARAMS) ?: refuse("this build has no $VIDEO_PLAYER_PARAMS")
    val flags = params.methods.filter { holdsString(it, FB_SHORTS) }
        .mapNotNull { reportedValues(it)[FB_SHORTS] }.distinctBy(FieldReference::toString)
    val flag = flags.singleOrNull() ?: refuse("expected one field reported as $FB_SHORTS, found ${flags.size}")
    if (flag.type != "Z") refuse("the field reported as $FB_SHORTS isn't boolean")
    val declared = params.fields.singleOrNull {
        it.name == flag.name && it.type == "Z" && !AccessFlags.STATIC.isSet(it.accessFlags)
    } ?: refuse("$FB_SHORTS isn't an instance boolean field of $VIDEO_PLAYER_PARAMS")
    if (!AccessFlags.PUBLIC.isSet(declared.accessFlags)) refuse("the $FB_SHORTS field isn't public")
    if (!AccessFlags.PUBLIC.isSet(getter.accessFlags)) refuse("the params getter isn't public")
    listOf(owner, params).forEach { if (!AccessFlags.PUBLIC.isSet(it.accessFlags)) refuse("${it.type} isn't public") }
    if (classDefByOrNull(REEL_SIDEBAR_DIAGNOSTICS) == null) refuse("the extension has no $REEL_SIDEBAR_DIAGNOSTICS")
    val predicate = mutableClassDefBy(REEL_SIDEBAR_DIAGNOSTICS).methods.singleOrNull {
        it.name == "isReel" && it.returnType == "Z" && AccessFlags.STATIC.isSet(it.accessFlags) &&
            it.parameterTypes.map(CharSequence::toString) == listOf(OBJECT)
    } ?: refuse("the extension has no static boolean isReel(Object)")

    val body = predicate.implementation ?: refuse("isReel has no body")
    if (body.registerCount !in 1..16 || body.tryBlocks.isNotEmpty()) refuse("isReel has an unexpected body")
    repeat(body.instructions.size) { body.removeInstruction(0) }
    predicate.addInstructions(
        0,
        """
            if-eqz p0, :not_reel
            check-cast p0, ${owner.type}
            invoke-virtual/range { p0 .. p0 }, ${owner.type}->${getter.name}()$VIDEO_PLAYER_PARAMS
            move-result-object p0
            if-eqz p0, :not_reel
            iget-boolean p0, p0, $VIDEO_PLAYER_PARAMS->${flag.name}:Z
            return p0
            :not_reel
            const/4 p0, 0x0
            return p0
        """,
    )
    mutableClassDefBy(owner.type).findMutableMethodOf(start).addInstructions(
        0,
        "invoke-static/range { p0 .. p0 }, $REEL_SIDEBAR_DIAGNOSTICS->started($OBJECT)V",
    )
}

/** The locals [sidebarButtonBlock] writes besides the story's: v0 to v2. */
internal val SIDEBAR_BLOCK_SCRATCH = listOf(0, 1, 2)

/**
 * Where [sidebarButtonBlock] goes in front of the assembly call at [assemblyIndex]: three
 * instructions before it, as up to 582, or the first instruction after that from which nothing
 * reads v0 to v2 again. 583 moves three lambdas from v2, v1 and v0 into the call's argument range
 * in the three instructions before the last boolean (arm64 LX/APP;->A02), so its block goes in front
 * of that boolean. When none qualifies it's the old place, which [requireSidebarBlockFits] refuses.
 *
 * The block reads the player from [parked], the register the builder parked it in, when it has
 * one. If the call's straight run ([straightRunStart]) writes that register before the place
 * above, the block goes in front of the first such write instead, as late as v0 to v2 are free
 * there. 584's render (LX/AF0;->A0l) parks the scoped context over the player in v29 at
 * instruction 549, while it makes the call's event handles, and holds three lambdas for the call
 * in v0 to v2 from 532 on. So its block goes at 532, the start of the run, where the button loop
 * ends. When nothing in the run qualifies it's the place above, which [requireParkedAt] refuses.
 */
internal fun Method.sidebarBlockIndex(assemblyIndex: Int, parked: Int? = null): Int {
    fun free(index: Int) = liveAcrossInjection(index).none { it in SIDEBAR_BLOCK_SCRATCH }
    val near = (maxOf(0, assemblyIndex - 3)..assemblyIndex).firstOrNull(::free) ?: (assemblyIndex - 3)
    if (parked == null) return near
    val instructions = implementation!!.instructions.toList()
    val runStart = straightRunStart(assemblyIndex)
    val overwrite = (runStart until near).firstOrNull { parked in writtenRegisters(instructions[it]) } ?: return near
    return (overwrite downTo runStart).firstOrNull(::free) ?: near
}

/**
 * The first instruction of the straight run that ends at instruction [index]: from there to
 * [index] each instruction only falls through to the next, and nothing else jumps in.
 */
internal fun Method.straightRunStart(index: Int): Int {
    val flow = ControlFlow.of(this)
    val entries = IntArray(flow.instructions.size)
    flow.normal.forEach { next -> next.forEach { entries[it]++ } }
    var start = index
    while (start > 0 && flow.normal[start - 1] == listOf(start) && entries[start] == 1) start--
    return start
}

/**
 * The register that holds, at instruction [index], what the call at [callIndex] gets in its
 * argument register [argument]. That's [argument] itself when nothing in between writes it. When an
 * object move fills it in between, it's the register the move copies, found the same way up to the
 * move, as on 584, whose render copies the session, the story and both lists into the call's range
 * after the block. Anything else written there in between doesn't exist yet at [index], so it's
 * refused, and so is an [index] the call's straight run ([straightRunStart]) doesn't reach back to.
 */
internal fun Method.argumentAt(index: Int, callIndex: Int, argument: Int): Int {
    if (index < straightRunStart(callIndex)) {
        throw PatchException(
            "$PATCH: $definingClass->$name jumps between instruction $index and the call at $callIndex, " +
                "so the block there doesn't see what the call gets",
        )
    }
    val instructions = implementation!!.instructions.toList()
    val write = (callIndex - 1 downTo index).firstOrNull { argument in writtenRegisters(instructions[it]) }
        ?: return argument
    val move = instructions[write]
    if (move.opcode != Opcode.MOVE_OBJECT && move.opcode != Opcode.MOVE_OBJECT_FROM16 && move.opcode != Opcode.MOVE_OBJECT_16) {
        throw PatchException(
            "$PATCH: $definingClass->$name makes v$argument at instruction $write, after the block at $index " +
                "reads it for the call at $callIndex",
        )
    }
    return argumentAt(index, write, (move as TwoRegisterInstruction).registerB)
}

/**
 * Throws naming [what] unless [register] holds, at instruction [index], what instruction [parkedAt]
 * put there: no path from the method's start, nor from any other write of [register], reaches
 * [index] without going through [parkedAt]. A throw from an instruction leaves the register as it
 * was, so the handlers it can reach count as well.
 */
internal fun Method.requireParkedAt(what: String, register: Int, parkedAt: Int, index: Int) {
    val flow = ControlFlow.of(this)
    val writes = flow.instructions.indices.filter { it != parkedAt && register in writtenRegisters(flow.instructions[it]) }
    val reached = BitSet()
    val pending = ArrayDeque<Int>()
    fun visit(next: List<Int>) = next.forEach { if (!reached[it]) { reached.set(it); pending += it } }
    visit(listOf(0))
    writes.forEach { visit(flow.normal[it]) }
    while (pending.isNotEmpty()) {
        val at = pending.removeFirst()
        if (at != parkedAt) visit(flow.normal[at])
        visit(flow.exceptional[at])
    }
    if (reached[index]) {
        throw PatchException(
            "$what: $definingClass->$name reaches instruction $index with something other than what instruction " +
                "$parkedAt parks in v$register (it also writes v$register at ${writes.joinToString().ifEmpty { "no other instruction" }})",
        )
    }
}

/**
 * The calls that turn an icon of [iconEnumType] into its marker for the sidebar's marker list: one
 * parameter, that enum, and an answer. Read off [builder] itself, and when it names none, off the
 * static methods it hands an icon to, which [resolve] finds. 583's armeabi-v7a builder adds each
 * button, its marker and its name in a loop body Redex outlined into one static taking the icon and
 * the three lists (LX/AT6;->A04, which asks LX/AT6;->A00), while its arm64 one asks LX/ARN;->A00
 * itself.
 */
internal fun iconMarkers(builder: Method, iconEnumType: String, resolve: (MethodReference) -> Method?): List<MethodReference> {
    fun markersIn(method: Method) = method.instructions().mapNotNull { it.methodReference() }.filter {
        it.parameterTypes.size == 1 && it.parameterTypes.single().toString() == iconEnumType && it.returnType != "V"
    }
    val own = markersIn(builder)
    val found = own.ifEmpty {
        builder.instructions()
            .filter { it.opcode == Opcode.INVOKE_STATIC || it.opcode == Opcode.INVOKE_STATIC_RANGE }
            .mapNotNull { it.methodReference() }
            .filter { call -> call.returnType == "V" && call.parameterTypes.any { it.toString() == iconEnumType } }
            .distinctBy { it.toString() }
            .mapNotNull(resolve)
            .flatMap(::markersIn)
    }
    return found.distinctBy { "${it.definingClass}->${it.name}" }
}

/**
 * Whether [method] is a render handing everything to [builder], the sidebar's builder kept in its
 * spec: it takes one parameter, the scoped context [builder] takes first, and calls [builder]. On
 * 583 the builder (arm64 LX/APP;->A02, armeabi-v7a LX/AR8;->A02, 37 parameters) is handed the
 * scoped context, then the component's fields and its state, by the component's render
 * (LX/APO;->A1C, LX/AR7;->A1C).
 */
internal fun rendersThrough(method: Method, builder: Method): Boolean {
    val scoped = builder.parameterTypes.firstOrNull()?.toString() ?: return false
    if (method.parameterTypes.size != 1 || method.parameterTypes.single().toString() != scoped) return false
    val parameters = builder.parameterTypes.map(CharSequence::toString)
    return method.instructions().any { instruction ->
        instruction.methodReference()?.let {
            it.definingClass == builder.definingClass && it.name == builder.name &&
                it.parameterTypes.map(CharSequence::toString) == parameters
        } == true
    }
}

/**
 * The register the helper call names for the reel's story, which sits in [story] at instruction
 * [index]. The helper call names its registers in four bits, so it's [story] itself when that's
 * above v2 and v15 or below: the call only reads it, and the block writes nothing there. Otherwise
 * it's the local the block borrows for a copy: the lowest one above v2, and v15 or below, that
 * nothing reads from [index] on and that isn't one of [reads], the registers the block reads.
 */
internal fun Method.storyScratchRegister(index: Int, reads: Collection<Int>, story: Int): Int {
    if (story in SIDEBAR_BLOCK_SCRATCH.size until 16) return story
    val live = liveAcrossInjection(index)
    return (SIDEBAR_BLOCK_SCRATCH.size until minOf(localRegisterCount(), 16))
        .firstOrNull { it !in live && it !in reads }
        ?: throw PatchException(
            "$PATCH: $definingClass->$name has no local from v3 to v15 that nothing reads after instruction $index, " +
                "for the reel's story",
        )
}

/**
 * Proves [sidebarButtonBlock] can go in front of instruction [index] of the sidebar builder.
 * Nothing the builder reads from [index] on may sit in one of [borrowed], which the block writes.
 * Each of [reads], which the block reads, has to be none of those. That they hold the very session,
 * scoped context, story and lists the call gets is [argumentAt]'s to prove, and the player is
 * [requireParkedAt]'s or [requireParameterIntact]'s.
 */
internal fun Method.requireSidebarBlockFits(index: Int, borrowed: Collection<Int>, reads: Collection<Int>) {
    requireFreeAt(PATCH, index, borrowed)
    val clash = reads.filter { it in borrowed }.distinct().sorted()
    if (clash.isNotEmpty()) {
        throw PatchException(
            "$PATCH: $definingClass->$name keeps ${clash.joinToString { "v$it" }} for the assembly call, " +
                "which the block overwrites before reading",
        )
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
 * [storyScratch], a fourth local for the story, unless it's [story] itself, which is then named
 * as it is and not copied.
 *
 * Both adds go through [LIST_ADD], an interface call, so they verify whatever List the builder
 * hands the assembly. The switch's no jumps to the block's own last label, on a nop, which falls
 * through to the instruction the block goes in front of; the block takes over that instruction's
 * label (`addInstructionsAtControlFlowLabel`), so the jump can't name it.
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
    ${if (storyScratch == story) "" else "move-object/from16 v$storyScratch, v$story"}
    invoke-static { v0, v1, v2, v$storyScratch }, $helper
    move-result-object v1
    move-object/from16 v0, v$buttons
    invoke-interface { v0, v1 }, $LIST_ADD
    sget-object v2, $icon
    invoke-static { v2 }, $marker
    move-result-object v2
    move-object/from16 v0, v$markers
    invoke-interface { v0, v2 }, $LIST_ADD
    :facebooks_own
    nop
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

/**
 * Whether [method] is the reel sidebar's builder. The name alone is in a dozen places: state
 * helpers, lambdas, update calls. The one wanted both names the sidebar and builds a button, the
 * call taking the session and four handlers. 582 merges a lambda naming the sidebar with one
 * building an FDSBottomSheet (four handlers, no session first) into LX/VrR;->invoke, so the
 * session is what tells the button apart. On 583 it's the spec's method the render calls
 * (arm64 LX/APP;->A02, armeabi-v7a LX/AR8;->A02), not the render; see [rendersThrough]. On 584
 * it's the render again (LX/AF0;->A0l), which builds its buttons through a static of its own
 * class; see [buttonFactoryCallers]. [siblings] are the methods of [method]'s class.
 */
internal fun isSidebarBuilder(method: Method, siblings: Iterable<Method>): Boolean =
    method.instructions().any { it.stringReference() == SIDEBAR } && buttonFactoryCallers(method, siblings).isNotEmpty()

/**
 * The methods that call the button factory for [builder]: [builder] itself up to 583, or the
 * statics among [siblings], the methods of its own class, that it calls and that call the factory.
 * 584's render (LX/AF0;->A0l) builds some of its buttons through LX/AF0;->A01, which takes the
 * button's kind and calls the factory (LX/2Uj;->A00) for it, and leaves the rest to a builder
 * shared with the FbShorts sidebar (LX/93I;->A06), which makes the button component (LX/93B)
 * itself.
 */
internal fun buttonFactoryCallers(builder: Method, siblings: Iterable<Method>): List<Method> {
    if (callsButtonFactory(builder)) return listOf(builder)
    val called = builder.instructions()
        .filter { it.opcode == Opcode.INVOKE_STATIC || it.opcode == Opcode.INVOKE_STATIC_RANGE }
        .mapNotNull { it.methodReference() }
        .filter { it.definingClass == builder.definingClass }
    return siblings.filter { sibling ->
        AccessFlags.STATIC.isSet(sibling.accessFlags) &&
            called.any { call ->
                call.name == sibling.name && call.returnType == sibling.returnType &&
                    call.parameterTypes.map(CharSequence::toString) == sibling.parameterTypes.map(CharSequence::toString)
            } &&
            callsButtonFactory(sibling)
    }
}

/** The button factory: a call taking the session first and four handlers. */
private fun isButtonFactory(reference: MethodReference): Boolean =
    reference.parameterTypes.count { it.toString() == FUNCTION1 } == 4 &&
        reference.parameterTypes.firstOrNull()?.toString() == FB_USER_SESSION

private fun callsButtonFactory(method: Method): Boolean =
    method.instructions().any { instruction -> instruction.methodReference()?.let(::isButtonFactory) == true }

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
