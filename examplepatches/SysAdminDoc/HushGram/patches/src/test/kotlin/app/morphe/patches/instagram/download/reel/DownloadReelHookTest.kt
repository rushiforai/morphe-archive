/*
 * Copyright 2026 HushGram contributors
 * https://github.com/SysAdminDoc/HushGram
 */
package app.morphe.patches.instagram.download.reel

import app.morphe.ExtensionDex
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patches.instagram.FixtureDex
import app.morphe.patches.instagram.download.INSTAGRAM_MEDIA
import app.morphe.patches.instagram.download.MEDIA
import app.morphe.patches.instagram.download.PANDO_VIDEO_VERSION
import app.morphe.patches.instagram.download.USER
import app.morphe.patches.instagram.download.VIDEO_VERSION
import app.morphe.patches.instagram.misc.extension.PURGE_MARKER
import app.morphe.patches.instagram.misc.extension.markers
import app.morphe.patches.shared.compat.AppCompatibilities
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.formats.Instruction35c
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import com.android.tools.smali.dexlib2.immutable.ImmutableField
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import org.junit.Assert.assertEquals
import org.junit.Assert.assertThrows
import org.junit.Assert.assertTrue
import org.junit.Test

class DownloadReelHookTest {
    private val helper = "Lfixture/ClipsHelper;"
    private val controller = "Lfixture/MoreOptionsController;"
    private val feedSheet = "Lfixture/FeedSheet;"
    private val util = "Lfixture/DownloadUtil;"
    private val session = "Lcom/instagram/common/session/UserSession;"
    private val activity = "Landroidx/fragment/app/FragmentActivity;"
    private val check = "$util->A08($session$MEDIA)Z"

    /** The hooks the patch writes are in the extension the bundle ships, public and static. */
    @Test
    fun theHooksAreInTheExtension() {
        for (hook in listOf(OFFER, WITHHOLD, SAVE, ADD_TO)) {
            val declared = ExtensionDex.classDef(hook.substringBefore("->")).methods
                .filter { AccessFlags.PUBLIC.isSet(it.accessFlags) && AccessFlags.STATIC.isSet(it.accessFlags) }
                .map { "${it.name}(${it.parameterTypes.joinToString("")})${it.returnType}" }
            assertTrue("$hook is not in the extension: $declared", hook.substringAfter("->") in declared)
        }
    }

    /**
     * Both reel menu builders let Download in with the switch on: the legacy one past the download
     * check, the redesigned one past the check and the flag. The feed's menu, which isn't the reel
     * menu's, stays Instagram's.
     */
    @Test
    fun theReelMenusOfferDownload() {
        val context = PatchContexts.of(classes())

        context.offerDownloadOnEveryReel()

        val legacy = context.method(helper, "A06").code()
        assertFiltered(legacy, check, OFFER)
        val redesign = context.method(controller, "A08").code()
        assertFiltered(redesign, check, OFFER)
        assertFiltered(redesign, "Lfixture/MobileConfig;->A1A(Ljava/lang/Object;J)Z", WITHHOLD)
        assertEquals("the feed's menu was touched", feedSheetCode().size, context.method(feedSheet, "invoke").code().size)
    }

    /**
     * The reduced menu's list goes through addTo() with Download where it returns. The return is
     * replaced, so the jump that used to land on it runs the call too.
     */
    @Test
    fun theReducedMenuListsDownload() {
        val context = PatchContexts.of(classes())

        context.offerDownloadOnEveryReel()

        val code = context.method(controller, "A03").code()
        val end = code.size - 3
        assertEquals(listOf(Opcode.SGET_OBJECT, Opcode.INVOKE_STATIC, Opcode.RETURN_OBJECT), code.drop(end).map { it.opcode })
        assertEquals(DOWNLOAD, code[end].referenceText())
        assertEquals("Download's register", 0, (code[end] as OneRegisterInstruction).registerA)
        assertEquals(ADD_TO, code[end + 1].referenceText())
        val call = code[end + 1] as Instruction35c
        assertEquals("addTo()'s arguments", listOf(1, 0), listOf(call.registerC, call.registerD))
        assertEquals("the list returned", 1, (code[end + 2] as OneRegisterInstruction).registerA)
        assertEquals("the jump to the return", end, code.target(code.indexOfFirst { it.opcode == Opcode.IF_EQZ }))
    }

    @Test
    fun aMissingReducedMenuFailsBeforeAnythingChanges() {
        val context = PatchContexts.of(classes(reducedMarker = "ClipsOrganicMediaItemViewMoreOptionsController_somethingElse"))
        val failure = assertThrows(PatchException::class.java) { context.offerDownloadOnEveryReel() }
        assertTrue(failure.message!!, failure.message!!.contains(REDUCED_MARKER))
        assertUntouched(context)
    }

    /** A tap on Download asks save() first, with the menu's media and activity; any other option goes on. */
    @Test
    fun theHandlerAsksSaveFirst() {
        val context = PatchContexts.of(classes())

        context.offerDownloadOnEveryReel()

        val code = context.method(helper, "A0T").code()
        assertEquals(
            listOf(
                Opcode.MOVE_OBJECT_FROM16, Opcode.SGET_OBJECT, Opcode.IF_NE, Opcode.MOVE_OBJECT_FROM16, Opcode.IGET_OBJECT,
                Opcode.IGET_OBJECT, Opcode.INVOKE_STATIC, Opcode.MOVE_RESULT, Opcode.IF_EQZ, Opcode.RETURN_VOID,
            ),
            code.take(10).map { it.opcode },
        )
        assertEquals(DOWNLOAD, code[1].referenceText())
        assertEquals("$helper->media:$MEDIA", code[4].referenceText())
        assertEquals("$helper->activity:$activity", code[5].referenceText())
        assertEquals(SAVE, code[6].referenceText())
        assertEquals("the original code moved", Opcode.CONST_STRING, code[10].opcode)
        for (branch in listOf(2, 8)) assertEquals("the branch at $branch", 10, code.target(branch))
    }

    /** Each bridge casts its argument and calls the getter that reads its field. */
    @Test
    fun theBridgesCallTheGetters() {
        val context = PatchContexts.of(classes())

        context.offerDownloadOnEveryReel()

        val expected = mapOf(
            "videoVersions" to "$MEDIA->AAh()Ljava/util/List;",
            "dashManifest" to "$MEDIA->A8P()Ljava/lang/String;",
            "mediaId" to "$MEDIA->getId()Ljava/lang/String;",
            "owner" to "$MEDIA->A3Q()$USER",
            "takenAt" to "$MEDIA->A6v()Ljava/lang/Long;",
            "username" to "$USER->A89()Ljava/lang/String;",
            "versionUrl" to "$VIDEO_VERSION->getUrl()Ljava/lang/String;",
            "versionWidth" to "$VIDEO_VERSION->DvO()Ljava/lang/Integer;",
            "versionHeight" to "$VIDEO_VERSION->CK7()Ljava/lang/Integer;",
        )
        expected.forEach { (bridge, getter) ->
            val code = context.method(INSTAGRAM_MEDIA, bridge).code()
            assertEquals(bridge, listOf(Opcode.CHECK_CAST, if (getter.startsWith(VIDEO_VERSION)) Opcode.INVOKE_INTERFACE else Opcode.INVOKE_VIRTUAL,
                Opcode.MOVE_RESULT_OBJECT, Opcode.RETURN_OBJECT), code.take(4).map { it.opcode })
            assertEquals(bridge, getter, code[1].referenceText())
        }
    }

    /** A flag that lets Download in only when it's on is a gate this patch doesn't know, and nothing changes. */
    @Test
    fun anUnknownGateFailsBeforeAnythingChanges() {
        val context = PatchContexts.of(classes(flagSkipsWhen = "if-eqz"))
        assertThrows(PatchException::class.java) { context.offerDownloadOnEveryReel() }
        assertUntouched(context)
    }

    @Test
    fun aMissingGetterFailsBeforeAnythingChanges() {
        val context = PatchContexts.of(classes(leaveOutField = "taken_at"))
        val failure = assertThrows(PatchException::class.java) { context.offerDownloadOnEveryReel() }
        assertTrue(failure.message!!, failure.message!!.contains("taken_at"))
        assertUntouched(context)
    }

    @Test
    fun aSecondMediaFieldFailsThePatch() {
        val context = PatchContexts.of(classes(secondMedia = true))
        assertThrows(PatchException::class.java) { context.offerDownloadOnEveryReel() }
        assertUntouched(context)
    }

    @Test
    fun aMissingHandlerFailsThePatch() {
        val context = PatchContexts.of(classes(handlerMarker = "ClipsOrganicMoreOptionsHelper_somethingElse"))
        val failure = assertThrows(PatchException::class.java) { context.offerDownloadOnEveryReel() }
        assertTrue(failure.message!!, failure.message!!.contains(HANDLER_MARKER))
    }

    /**
     * In each declared build, every builder of the reel menu gets the download check's filter once
     * and the flag's at most once, at least one has the flag, the reduced menu's list passes through
     * addTo() at each return and no jump skips that, the handler asks save() first, and every
     * bridge is written.
     */
    @Test
    fun eachDeclaredBuildOffersDownloadOnEveryReel() {
        val versions = AppCompatibilities.instagram().single().targets.mapNotNull { it.version }.toSet()
        val types = setOf(MEDIA, USER, VIDEO_VERSION, PANDO_VIDEO_VERSION)
        val markers = setOf(HANDLER_MARKER, ELIGIBLE_MARKER, REDUCED_MARKER)
        val checked = mutableSetOf<String>()
        for (version in versions) {
            for (bundle in Fixtures.files { it.extension == "apks" && it.name.contains("-$version-") }) {
                val classes = mutableListOf<ClassDef>(ExtensionDex.classDef(INSTAGRAM_MEDIA))
                FixtureDex.forEach(bundle) { dex ->
                    val marked = dex.stringSection.any { it.startsWith("android_purge_") && PURGE_MARKER.find(it)?.groupValues?.get(1) in markers }
                    val loads = dex.fieldSection.any { it.toString() == DOWNLOAD }
                    if (!marked && !loads && dex.classes.none { it.type in types }) return@forEach
                    for (classDef in dex.classes) {
                        val wanted = classDef.type in types || classDef.methods.any { method ->
                            method.markers().any { it in markers } || method.code().any { it.referenceText() == DOWNLOAD }
                        }
                        if (wanted) classes += ImmutableClassDef.of(classDef)
                    }
                }
                val context = PatchContexts.of(classes)

                context.offerDownloadOnEveryReel()

                val all = classes.flatMap { it.methods }
                val handler = all.single { HANDLER_MARKER in it.markers() }
                val menu = context.method(handler.definingClass, handler.name).code()
                assertEquals("${bundle.name}: the handler's first call", SAVE,
                    menu.first { it.opcode == Opcode.INVOKE_STATIC }.referenceText())
                val eligible = all.single { ELIGIBLE_MARKER in it.markers() }
                val check = "${eligible.definingClass}->${eligible.name}(${eligible.parameterTypes.joinToString("")})${eligible.returnType}"
                val builders = all.filter { method ->
                    val code = method.code()
                    code.any { it.referenceText() == DOWNLOAD } && code.any { it.referenceText() == check } &&
                        (method.definingClass == handler.definingClass ||
                            code.any { it.referenceText()?.startsWith("${handler.definingClass}->") == true })
                }
                assertTrue("${bundle.name}: no reel menu builder", builders.isNotEmpty())
                var flags = 0
                builders.forEach { builder ->
                    val code = context.method(builder.definingClass, builder.name, builder.parameterTypes.map(Any::toString)).code()
                    assertEquals("${bundle.name}: ${builder.definingClass}->${builder.name} offers", 1, code.count { it.referenceText() == OFFER })
                    val withheld = code.count { it.referenceText() == WITHHOLD }
                    assertTrue("${bundle.name}: ${builder.definingClass}->${builder.name} withholds $withheld times", withheld <= 1)
                    flags += withheld
                }
                assertTrue("${bundle.name}: no builder read the flag", flags > 0)
                val reduced = all.single { REDUCED_MARKER in it.markers() }
                val list = context.method(reduced.definingClass, reduced.name, reduced.parameterTypes.map(Any::toString)).code()
                val returns = list.indices.filter { list[it].opcode == Opcode.RETURN_OBJECT }
                assertTrue("${bundle.name}: the reduced menu doesn't return", returns.isNotEmpty())
                returns.forEach { at ->
                    assertEquals("${bundle.name}: before the reduced menu's return at $at", listOf(DOWNLOAD, ADD_TO),
                        listOf(list[at - 2].referenceText(), list[at - 1].referenceText()))
                }
                // Opcode.name is the smali name, "if-eqz" or "goto/16".
                list.indices.filter { index -> list[index] is OffsetInstruction && list[index].opcode.name.let { it.startsWith("if-") || it.startsWith("goto") } }
                    .forEach { jump -> assertTrue("${bundle.name}: the jump at $jump skips addTo()", list.target(jump) !in returns) }
                val bridges = context.classDefBy(INSTAGRAM_MEDIA).methods.filter { it.name in videoBridges }
                assertEquals("${bundle.name}: the video bridges", videoBridges.size, bridges.size)
                bridges.forEach { assertEquals("${bundle.name}: ${it.name}", Opcode.CHECK_CAST, it.code().first().opcode) }
                checked += version
            }
        }
        assertEquals("a declared build has no fixture", versions, checked)
    }

    /** The bridges this patch writes. The picture's and the story's are Download any story's. */
    private val videoBridges = setOf(
        "videoVersions", "dashManifest", "mediaId", "owner", "takenAt", "username", "versionUrl", "versionWidth", "versionHeight",
    )

    private fun assertFiltered(code: List<Instruction>, call: String, hook: String) {
        val at = code.indexOfFirst { it.referenceText() == call }
        assertTrue("$call is not called", at >= 0)
        val register = (code[at + 1] as OneRegisterInstruction).registerA
        assertEquals("$call: after the move-result", Opcode.MOVE_RESULT, code[at + 1].opcode)
        assertEquals("$call: the filter", hook, code[at + 2].referenceText())
        assertEquals("$call: the filter's argument", register, (code[at + 2] as Instruction35c).registerC)
        assertEquals("$call: the filtered answer", register, (code[at + 3] as OneRegisterInstruction).registerA)
        assertEquals(Opcode.MOVE_RESULT, code[at + 3].opcode)
    }

    private fun assertUntouched(context: BytecodePatchContext) {
        assertTrue("a builder changed", context.method(helper, "A06").code().none { it.referenceText() == OFFER })
        assertTrue("a builder changed", context.method(controller, "A08").code().none { it.referenceText() == OFFER })
        assertTrue("the reduced menu changed", context.method(controller, "A03").code().none { it.referenceText() == ADD_TO })
        assertEquals("the handler changed", Opcode.CONST_STRING, context.method(helper, "A0T").code().first().opcode)
        assertEquals("a bridge was written", Opcode.CONST_4, context.method(INSTAGRAM_MEDIA, "videoVersions").code().first().opcode)
    }

    private fun BytecodePatchContext.method(type: String, name: String, parameters: List<String>? = null): Method =
        classDefBy(type).methods.single { it.name == name && (parameters == null || it.parameterTypes.map(Any::toString) == parameters) }

    private fun Instruction.referenceText(): String? = (this as? ReferenceInstruction)?.reference?.toString()

    /** The index [branch] at [index] lands on. */
    private fun List<Instruction>.target(index: Int): Int {
        val address = IntArray(size + 1)
        forEachIndexed { i, instruction -> address[i + 1] = address[i] + instruction.codeUnits }
        return address.indexOf(address[index] + (this[index] as OffsetInstruction).codeOffset)
    }

    // ---- stand-ins shaped like Instagram 449's -------------------------------------------------

    private fun classes(
        flagSkipsWhen: String = "if-nez",
        leaveOutField: String? = null,
        secondMedia: Boolean = false,
        handlerMarker: String = HANDLER_MARKER,
        reducedMarker: String = REDUCED_MARKER,
    ): List<ClassDef> {
        val helperFields = listOfNotNull(
            field(helper, "media", MEDIA),
            field(helper, "activity", activity),
            if (secondMedia) field(helper, "previous", MEDIA) else null,
        )
        val helperClass = classDef(
            helper,
            listOf(
                method(helper, "A0T", listOf(OPTION), "V", 5, static = false, body = """
                    const-string v0, "android_purge_26_q3_$handlerMarker"
                    return-void
                """),
                method(helper, "A06", listOf("Lfixture/Tree;", helper, "Ljava/util/List;", "I"), "V", 8, static = true, body = """
                    const-string v0, "android_purge_26_q3_ClipsDownloadUtil_shouldShowProducerDownloadControls"
                    iget-object v1, p1, $helper->media:$MEDIA
                    const/4 v2, 0x0
                    invoke-virtual { v2, v2, v1 }, $check
                    move-result v1
                    if-eqz v1, :skip
                    sget-object v1, $DOWNLOAD
                    invoke-interface { p2, v1 }, Ljava/util/List;->add(Ljava/lang/Object;)Z
                    :skip
                    return-void
                """),
                method(helper, "A0P", listOf(OPTION), "V", 2, static = false, body = "return-void"),
            ),
            helperFields,
        )
        val controllerClass = classDef(
            controller,
            listOf(
                method(controller, "A08", emptyList(), "V", 7, static = false, body = """
                    const-string v0, "android_purge_26_q3_ClipsOrganicMediaItemViewMoreOptionsController_showRedesignBottomSheet_2"
                    iget-object v1, p0, $controller->helper:$helper
                    const/4 v2, 0x0
                    invoke-virtual { v2, v2, v2 }, $check
                    move-result v3
                    if-eqz v3, :skip
                    const-wide v4, 0x81034200060c62L
                    invoke-static { v2, v4, v5 }, Lfixture/MobileConfig;->A1A(Ljava/lang/Object;J)Z
                    move-result v3
                    $flagSkipsWhen v3, :skip
                    sget-object v3, $DOWNLOAD
                    invoke-virtual { v1, v3 }, $helper->A0P($OPTION)V
                    :skip
                    return-void
                """),
                // The reduced menu's list, which never had Download. Its return is also a jump's target.
                method(controller, "A03", listOf("Lfixture/ClipsItem;", MEDIA), "Ljava/util/ArrayList;", 6, static = false, body = """
                    const-string v0, "android_purge_26_q3_$reducedMarker"
                    new-instance v1, Ljava/util/ArrayList;
                    invoke-direct { v1 }, Ljava/util/ArrayList;-><init>()V
                    sget-object v0, $OPTION->PLAYBACK_CONTROLS:$OPTION
                    invoke-virtual { v1, v0 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
                    const/4 v2, 0x0
                    if-eqz v2, :done
                    sget-object v0, $OPTION->REPORT:$OPTION
                    invoke-virtual { v1, v0 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
                    :done
                    return-object v1
                """),
            ),
            listOf(field(controller, "helper", helper)),
        )
        val feed = classDef(feedSheet, listOf(feedSheetMethod()))
        val eligible = classDef(util, listOf(method(util, "A08", listOf(session, MEDIA), "Z", 4, static = false, body = """
            const-string v0, "android_purge_26_q3_$ELIGIBLE_MARKER"
            const/4 v0, 0x0
            return v0
        """)))
        val mediaGetters = listOf(
            "AAh" to ("video_versions" to "Ljava/util/List;"),
            "A8P" to ("video_dash_manifest" to "Ljava/lang/String;"),
            "A3Q" to ("user" to USER),
            "A6v" to ("taken_at" to "Ljava/lang/Long;"),
            // Another getter of the user field, answering whether it's there: the answer's type tells them apart.
            "ALu" to ("user" to "Z"),
        ).filter { it.second.first != leaveOutField }.map { (name, field) -> getter(MEDIA, name, field.first, field.second) } +
            method(MEDIA, "getId", emptyList(), "Ljava/lang/String;", 1, static = false, body = """
                const/4 v0, 0x0
                return-object v0
            """)
        val versionGetters = listOf("getUrl" to ("url" to "Ljava/lang/String;"), "DvO" to ("width" to "Ljava/lang/Integer;"),
            "CK7" to ("height" to "Ljava/lang/Integer;"))
        return listOf(
            helperClass, controllerClass, feed, eligible,
            classDef(MEDIA, mediaGetters),
            classDef(USER, listOf(getter(USER, "A89", "username", "Ljava/lang/String;"))),
            ImmutableClassDef(
                VIDEO_VERSION, AccessFlags.PUBLIC.value or AccessFlags.INTERFACE.value or AccessFlags.ABSTRACT.value,
                "Ljava/lang/Object;", null, null, null, null,
                versionGetters.map { (name, field) ->
                    ImmutableMethod(VIDEO_VERSION, name, emptyList(), field.second,
                        AccessFlags.PUBLIC.value or AccessFlags.ABSTRACT.value, null, null, null)
                },
            ),
            classDef(PANDO_VIDEO_VERSION, versionGetters.map { (name, field) -> getter(PANDO_VIDEO_VERSION, name, field.first, field.second) }),
            ExtensionDex.classDef(INSTAGRAM_MEDIA),
        )
    }

    /** The feed's menu: Download after the same check, built through a class that isn't the reel menu's. */
    private fun feedSheetMethod() = method(feedSheet, "invoke", emptyList(), "Ljava/lang/Object;", 4, static = false, body = """
        const/4 v0, 0x0
        invoke-virtual { v0, v0, v0 }, $check
        move-result v1
        if-eqz v1, :skip
        sget-object v1, $DOWNLOAD
        :skip
        return-object v0
    """)

    private fun feedSheetCode() = feedSheetMethod().code()

    private fun getter(owner: String, name: String, field: String, returns: String) =
        method(owner, name, emptyList(), returns, 2, static = false, body = """
            const v0, ${field.hashCode()}
            const/4 v0, 0x0
            ${if (returns == "Z") "return v0" else "return-object v0"}
        """)

    private fun method(owner: String, name: String, parameters: List<String>, returns: String, registers: Int, static: Boolean, body: String): Method {
        val flags = AccessFlags.PUBLIC.value or (if (static) AccessFlags.STATIC.value else 0)
        val mutable = MutableMethod(
            ImmutableMethod(
                owner, name, parameters.map { ImmutableMethodParameter(it, null, null) }, returns, flags, null, null,
                ImmutableMethodImplementation(registers, emptyList(), null, null),
            ),
        )
        mutable.addInstructionsWithLabels(0, body.trimIndent())
        return ImmutableMethod.of(mutable)
    }

    private fun field(owner: String, name: String, type: String) =
        ImmutableField(owner, name, type, AccessFlags.PUBLIC.value, null, null, null)

    private fun classDef(type: String, methods: List<Method>, fields: List<ImmutableField> = emptyList()): ClassDef =
        ImmutableClassDef(type, AccessFlags.PUBLIC.value, "Ljava/lang/Object;", null, null, null, fields, methods)
}
