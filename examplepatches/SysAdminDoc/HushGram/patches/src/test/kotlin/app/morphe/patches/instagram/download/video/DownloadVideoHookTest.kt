/*
 * Copyright 2026 HushGram contributors
 * https://github.com/SysAdminDoc/HushGram
 */
package app.morphe.patches.instagram.download.video

import app.morphe.ExtensionDex
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patches.instagram.FixtureDex
import app.morphe.patches.instagram.download.IMAGE_INFO
import app.morphe.patches.instagram.download.IMAGE_URL
import app.morphe.patches.instagram.download.INSTAGRAM_MEDIA
import app.morphe.patches.instagram.download.MEDIA
import app.morphe.patches.instagram.download.PANDO_IMAGE_INFO
import app.morphe.patches.instagram.download.PANDO_VIDEO_VERSION
import app.morphe.patches.instagram.download.USER
import app.morphe.patches.instagram.download.VIDEO_VERSION
import app.morphe.patches.instagram.download.reel.DOWNLOAD
import app.morphe.patches.instagram.download.reel.ELIGIBLE_MARKER
import app.morphe.patches.instagram.download.reel.OPTION
import app.morphe.patches.instagram.misc.extension.PURGE_MARKER
import app.morphe.patches.instagram.misc.extension.markers
import app.morphe.patches.instagram.misc.extension.originalName
import app.morphe.patches.shared.compat.AppCompatibilities
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.formats.Instruction35c
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import com.android.tools.smali.dexlib2.immutable.ImmutableField
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import com.android.tools.smali.dexlib2.immutable.value.ImmutableStringEncodedValue
import org.junit.Assert.assertEquals
import org.junit.Assert.assertThrows
import org.junit.Assert.assertTrue
import org.junit.Test

class DownloadVideoHookTest {
    private val helper = "Lfixture/FeedMenu;"
    private val lambda = "Lfixture/MergedLambda;"
    private val util = "Lfixture/DownloadUtil;"
    private val session = "Lcom/instagram/common/session/UserSession;"
    private val activity = "Landroidx/fragment/app/FragmentActivity;"
    private val check = "$util->A08($session$MEDIA)Z"
    private val flag = "Lfixture/MobileConfig;->A1A(Ljava/lang/Object;J)Z"
    private val state = "Lfixture/State;"
    private val kind = "Lfixture/Kind;"
    private val contextType = "Landroid/content/Context;"
    private val mine = "Lfixture/Owner;->mine(Ljava/lang/Object;)Z"
    private val adder = "$state->A00($kind$OPTION${state}Ljava/lang/CharSequence;Ljava/util/ArrayList;Z)V"
    private val shortMenu = "Lfixture/ShortMenu;"
    private val itemState = "Lfixture/ItemState;"
    private val pager = "Lfixture/Pager;"
    private val elsewhere = "Lfixture/Elsewhere;"
    private val pageLookup = "$MEDIA_EXT->A0Q($MEDIA" + "I)$MEDIA"

    /** The hooks the patch writes are in the extension the bundle ships, public and static. */
    @Test
    fun theHooksAreInTheExtension() {
        for (hook in listOf(OFFER_VIDEO, SAVE_VIDEO, ALLOW_VIDEO)) {
            val declared = ExtensionDex.classDef(hook.substringBefore("->")).methods
                .filter { AccessFlags.PUBLIC.isSet(it.accessFlags) && AccessFlags.STATIC.isSet(it.accessFlags) }
                .map { "${it.name}(${it.parameterTypes.joinToString("")})${it.returnType}" }
            assertTrue("$hook is not in the extension: $declared", hook.substringAfter("->") in declared)
        }
    }

    /**
     * Anyone else's rows start with offer(), handed the state and the row list, and the jump that
     * went to those rows goes to it. Your own rows are as Instagram builds them.
     */
    @Test
    fun anyoneElsesRowsStartWithOffer() {
        val context = PatchContexts.of(classes())

        context.offerDownloadOnEveryVideo()

        val code = context.method(lambda, "invoke").code()
        val offer = code.indexOfFirst { it.referenceText() == OFFER_VIDEO }
        val call = code[offer] as Instruction35c
        assertEquals("offer()'s arguments", listOf(0, 3), listOf(call.registerC, call.registerD))
        assertEquals("anyone else's first row follows", "$state->other:Ljava/lang/Object;", code[offer + 1].referenceText())
        val owner = code.indexOfFirst { it.referenceText() == mine }
        assertEquals("the owner check's jump", offer, code.target(owner + 2))
        assertEquals("one hook in the builder", 1, code.count { it.referenceText()?.startsWith("Lapp/hushgram/") == true })
    }

    /**
     * The row bridge adds Instagram's Download row the way the builder does: the row kind, the
     * option, the state, the label read by its resource id and the list, in the adder's order, and
     * false last. The post bridge reads the state's post.
     */
    @Test
    fun theBridgesAddInstagramsDownloadRow() {
        val context = PatchContexts.of(classes())

        context.offerDownloadOnEveryVideo()

        val bridge = context.method(INSTAGRAM_MEDIA, "addDownloadRow")
        assertEquals("registers", 9, bridge.implementation!!.registerCount)
        val code = bridge.code()
        assertEquals(Opcode.CHECK_CAST, code.first().opcode)
        assertEquals(listOf("$kind->A05:$kind", DOWNLOAD), code.filter { it.opcode == Opcode.SGET_OBJECT }.map { it.referenceText() })
        assertEquals("$state->context:$contextType", code.single { it.opcode == Opcode.IGET_OBJECT }.referenceText())
        assertEquals("the label", 0x7f131703, code.filterIsInstance<NarrowLiteralInstruction>().single { it.narrowLiteral != 0 }.narrowLiteral)
        val add = code.single { it.referenceText() == adder } as RegisterRangeInstruction
        assertEquals("the range", 0 to 6, add.startRegister to add.registerCount)
        assertEquals(Opcode.RETURN_VOID, code.last().opcode)

        val media = context.method(INSTAGRAM_MEDIA, "feedMenuMedia").code()
        assertEquals(listOf(Opcode.CHECK_CAST, Opcode.IGET_OBJECT, Opcode.RETURN_OBJECT), media.take(3).map { it.opcode })
        assertEquals("$state->media:$MEDIA", media[1].referenceText())
    }

    /**
     * The carousel bridges read the post's feed state off the builder's state, the page that state
     * keeps (the field most calls to the page lookup are handed) and a Media's pages.
     */
    @Test
    fun theCarouselBridgesReadThePageOnScreen() {
        val context = PatchContexts.of(classes())

        context.offerDownloadOnEveryVideo()

        val item = context.method(INSTAGRAM_MEDIA, "feedMenuItemState").code()
        assertEquals(listOf(Opcode.CHECK_CAST, Opcode.IGET_OBJECT, Opcode.RETURN_OBJECT), item.take(3).map { it.opcode })
        assertEquals("$state->item:$itemState", item[1].referenceText())
        val index = context.method(INSTAGRAM_MEDIA, "carouselIndex").code()
        assertEquals(listOf(Opcode.CHECK_CAST, Opcode.IGET, Opcode.RETURN), index.take(3).map { it.opcode })
        assertEquals(itemState, index[0].referenceText())
        assertEquals("the page, not the field read less often", "$itemState->page:I", index[1].referenceText())
        val pages = context.method(INSTAGRAM_MEDIA, "carouselMedia").code()
        assertEquals(listOf(Opcode.CHECK_CAST, Opcode.INVOKE_VIRTUAL, Opcode.MOVE_RESULT_OBJECT, Opcode.RETURN_OBJECT), pages.take(4).map { it.opcode })
        assertEquals("$MEDIA->A8k()Ljava/util/List;", pages[1].referenceText())
    }

    /** A photo post's picture is read through the same bridges Download stories writes. */
    @Test
    fun thePictureBridgesAreWritten() {
        val context = PatchContexts.of(classes())

        context.offerDownloadOnEveryVideo()

        assertEquals("$MEDIA->A3F()$IMAGE_INFO", context.method(INSTAGRAM_MEDIA, "imageVersions").code()[1].referenceText())
        assertEquals("$IMAGE_INFO->Bd1()Ljava/util/List;", context.method(INSTAGRAM_MEDIA, "imageCandidates").code()[1].referenceText())
        assertEquals("$IMAGE_URL->getWidth()I", context.method(INSTAGRAM_MEDIA, "candidateWidth").code()[1].referenceText())
    }

    /**
     * A tap on Download asks save() first, with the post, the post's feed state and the menu's
     * activity; any other option goes on.
     */
    @Test
    fun theHandlerAsksSaveFirst() {
        val context = PatchContexts.of(classes())

        context.offerDownloadOnEveryVideo()

        val code = context.method(helper, "A09").code()
        assertEquals(
            listOf(
                Opcode.MOVE_OBJECT_FROM16, Opcode.SGET_OBJECT, Opcode.IF_NE, Opcode.MOVE_OBJECT_FROM16, Opcode.INVOKE_STATIC,
                Opcode.MOVE_RESULT_OBJECT, Opcode.IGET_OBJECT, Opcode.IGET_OBJECT, Opcode.INVOKE_STATIC, Opcode.MOVE_RESULT,
                Opcode.IF_EQZ, Opcode.RETURN_VOID,
            ),
            code.take(12).map { it.opcode },
        )
        assertEquals(DOWNLOAD, code[1].referenceText())
        assertEquals("the getter that reads the post", "$helper->A01($helper)$MEDIA", code[4].referenceText())
        assertEquals("$helper->activity:$activity", code[6].referenceText())
        assertEquals("the post's feed state", "$helper->item:$itemState", code[7].referenceText())
        val save = code[8] as Instruction35c
        assertEquals(SAVE_VIDEO, save.referenceText())
        assertEquals("save()'s arguments", listOf(1, 0, 2), listOf(save.registerC, save.registerD, save.registerE))
        assertEquals("the original code moved", Opcode.CONST_STRING, code[12].opcode)
        for (branch in listOf(2, 10)) assertEquals("the branch at $branch", 12, code.target(branch))
    }

    /**
     * A carousel page the patch can't place fails it before anything changes: two fields read as
     * often, no page lookup reading a carousel's pages, or the feed state missing from the menu.
     */
    @Test
    fun aPageItCantPlaceFailsBeforeAnythingChanges() {
        for ((case, classes) in listOf(
            "two fields as often" to classes(pageReads = 2 to 2),
            "no page lookup" to classes(lookupReadsPages = false),
            "no feed state on the menu" to classes(menuHoldsItem = false),
        )) {
            val context = PatchContexts.of(classes)
            assertThrows(case, PatchException::class.java) { context.offerDownloadOnEveryVideo() }
            assertUntouched(context)
            assertEquals("$case: the page bridge was written", Opcode.CONST_4, context.method(INSTAGRAM_MEDIA, "carouselIndex").code().first().opcode)
        }
    }

    /**
     * Each return of the short menu's list hands the list to allow() first, with Download in a
     * register the list isn't in, and takes back what it answers. A jump that went to a return goes
     * to its hook.
     */
    @Test
    fun theShortMenuListAsksAllowAtEachReturn() {
        val context = PatchContexts.of(classes())

        context.offerDownloadOnEveryVideo()

        val code = context.method(shortMenu, "A01").code()
        val returns = code.indices.filter { code[it].opcode == Opcode.RETURN_OBJECT }
        assertEquals("the returns", 2, returns.size)
        for ((at, list) in returns.zip(listOf(1, 0))) {
            val spare = if (list == 0) 1 else 0
            assertEquals("the option at $at", DOWNLOAD, code[at - 3].referenceText())
            assertEquals("its register", spare, (code[at - 3] as OneRegisterInstruction).registerA)
            val call = code[at - 2] as Instruction35c
            assertEquals(ALLOW_VIDEO, call.referenceText())
            assertEquals("allow()'s arguments at $at", listOf(list, spare), listOf(call.registerC, call.registerD))
            assertEquals(Opcode.MOVE_RESULT_OBJECT, code[at - 1].opcode)
            assertEquals("the list taken back at $at", list, (code[at - 1] as OneRegisterInstruction).registerA)
            assertEquals("the list returned at $at", list, (code[at] as OneRegisterInstruction).registerA)
        }
        val jump = code.indexOfFirst { it.opcode == Opcode.IF_EQZ }
        assertEquals("the jump to the last return", returns.last() - 3, code.target(jump))
        assertEquals("allow() calls", 2, code.count { it.referenceText() == ALLOW_VIDEO })
    }

    /** A short menu list the patch can't tell apart or can't hook fails the patch before anything changes. */
    @Test
    fun aShortMenuListItCantHookFailsBeforeAnythingChanges() {
        for ((case, classes) in listOf(
            "no list" to classes(shortLists = 0),
            "two lists" to classes(shortLists = 2),
            "one local register" to classes(shortListRegisters = 2),
        )) {
            val context = PatchContexts.of(classes)
            assertThrows(case, PatchException::class.java) { context.offerDownloadOnEveryVideo() }
            assertUntouched(context)
            if (case != "no list") {
                assertTrue("$case: the list changed", context.method(shortMenu, "A01").code().none { it.referenceText() == ALLOW_VIDEO })
            }
        }
    }

    /** Rows after Download that the download check can reach aren't anyone else's for sure, and nothing changes. */
    @Test
    fun aJumpAfterTheCheckFailsBeforeAnythingChanges() {
        val context = PatchContexts.of(classes(lateJump = true))
        assertThrows(PatchException::class.java) { context.offerDownloadOnEveryVideo() }
        assertUntouched(context)
    }

    @Test
    fun aMissingMenuClassFailsThePatch() {
        val context = PatchContexts.of(classes(name = "SomethingElse"))
        val failure = assertThrows(PatchException::class.java) { context.offerDownloadOnEveryVideo() }
        assertTrue(failure.message!!, failure.message!!.contains(FEED_HELPER_NAME))
    }

    @Test
    fun aHandlerWithoutLocalsFailsBeforeAnythingChanges() {
        val context = PatchContexts.of(classes(handlerRegisters = 3))
        assertThrows(PatchException::class.java) { context.offerDownloadOnEveryVideo() }
        assertUntouched(context)
    }

    /**
     * In each declared build, the feed menu's class is found by its kept name, its builder calls
     * offer() once, where a jump from before the download check lands after the Download row, the
     * handler asks save() first, and the post, row, video and picture bridges are written.
     */
    @Test
    fun eachDeclaredBuildOffersDownloadOnEveryVideo() {
        val versions = AppCompatibilities.instagram().single().targets.mapNotNull { it.version }.toSet()
        val types = setOf(MEDIA, USER, VIDEO_VERSION, PANDO_VIDEO_VERSION, IMAGE_INFO, PANDO_IMAGE_INFO, IMAGE_URL, MEDIA_EXT)
        val checked = mutableSetOf<String>()
        for (version in versions) {
            for (bundle in Fixtures.files { it.extension == "apks" && it.name.contains("-$version-") }) {
                val classes = mutableListOf<ClassDef>(ExtensionDex.classDef(INSTAGRAM_MEDIA))
                FixtureDex.forEach(bundle) { dex ->
                    val marked = dex.stringSection.any { it.startsWith("android_purge_") && PURGE_MARKER.find(it)?.groupValues?.get(1) == ELIGIBLE_MARKER }
                    val loads = dex.fieldSection.any { it.toString() == DOWNLOAD }
                    val named = dex.stringSection.any { it == FEED_HELPER_NAME }
                    val options = dex.fieldSection.any { it.toString() == WHY_OPTION }
                    val pages = dex.methodSection.any { it.definingClass == MEDIA_EXT }
                    if (!marked && !loads && !named && !options && !pages && dex.classes.none { it.type in types }) return@forEach
                    for (classDef in dex.classes) {
                        val wanted = classDef.type in types || classDef.originalName() == FEED_HELPER_NAME || classDef.methods.any { method ->
                            ELIGIBLE_MARKER in method.markers() || method.code().any { it.referenceText() == DOWNLOAD } ||
                                method.isShortMenuList() || method.pageReads().isNotEmpty()
                        }
                        if (wanted) classes += ImmutableClassDef.of(classDef)
                    }
                }
                val context = PatchContexts.of(classes)

                context.offerDownloadOnEveryVideo()

                val menu = classes.single { it.originalName() == FEED_HELPER_NAME }
                val handler = menu.methods.single { !AccessFlags.STATIC.isSet(it.accessFlags) && it.parameterTypes.map(Any::toString) == listOf(OPTION) && it.returnType == "V" }
                val handled = context.method(menu.type, handler.name, listOf(OPTION)).code()
                val save = handled.indexOfFirst { it.opcode == Opcode.INVOKE_STATIC && it.referenceText()?.startsWith("Lapp/hushgram/") == true }
                assertEquals("${bundle.name}: the handler's first call", SAVE_VIDEO, handled[save].referenceText())
                // The menu hands save() the feed state whose page the index bridge reads.
                val itemType = handled[save - 1].referenceText()!!.substringAfterLast(':')
                val index = context.method(INSTAGRAM_MEDIA, "carouselIndex").code()
                assertEquals("${bundle.name}: the page's class", itemType, index[0].referenceText())
                assertEquals("${bundle.name}: the page", Opcode.IGET, index[1].opcode)
                assertTrue("${bundle.name}: the page is on the feed state", index[1].referenceText()!!.startsWith("$itemType->"))
                val item = context.method(INSTAGRAM_MEDIA, "feedMenuItemState").code()
                assertTrue("${bundle.name}: the builder's feed state", item[1].referenceText()!!.endsWith(":$itemType"))
                assertEquals("${bundle.name}: the carousel bridge", Opcode.INVOKE_VIRTUAL, context.method(INSTAGRAM_MEDIA, "carouselMedia").code()[1].opcode)
                val builders = classes.flatMap { it.methods }.filter { method ->
                    context.method(method.definingClass, method.name, method.parameterTypes.map(Any::toString)).code().any { it.referenceText() == OFFER_VIDEO }
                }
                assertEquals("${bundle.name}: the builders offering Download", 1, builders.size)
                val code = context.method(builders.single().definingClass, builders.single().name, builders.single().parameterTypes.map(Any::toString)).code()
                assertEquals("${bundle.name}: offer() calls", 1, code.count { it.referenceText() == OFFER_VIDEO })
                val offer = code.indexOfFirst { it.referenceText() == OFFER_VIDEO }
                assertTrue("${bundle.name}: offer() follows the Download row's jump", code[offer - 1].opcode.name.startsWith("goto"))
                assertTrue("${bundle.name}: a jump reaches offer()", code.indices.any { it < offer && code[it].opcode == Opcode.IF_EQZ && code.target(it) == offer })
                val row = context.method(INSTAGRAM_MEDIA, "addDownloadRow").code()
                assertTrue("${bundle.name}: the row bridge", row.any { it.referenceText() == DOWNLOAD } && row.any { it.opcode == Opcode.INVOKE_STATIC_RANGE })
                assertEquals("${bundle.name}: the post bridge", Opcode.CHECK_CAST, context.method(INSTAGRAM_MEDIA, "feedMenuMedia").code().first().opcode)
                val lists = classes.flatMap { it.methods }.filter { it.isShortMenuList() }
                assertEquals("${bundle.name}: the short menu's lists", 1, lists.size)
                val list = context.method(lists.single().definingClass, lists.single().name, listOf("Z")).code()
                val returns = list.indices.filter { list[it].opcode == Opcode.RETURN_OBJECT }
                assertEquals("${bundle.name}: allow() calls", returns.size, list.count { it.referenceText() == ALLOW_VIDEO })
                returns.forEach { at ->
                    assertEquals("${bundle.name}: allow() before the return at $at", ALLOW_VIDEO, list[at - 2].referenceText())
                    assertEquals("${bundle.name}: Download handed to it", DOWNLOAD, list[at - 3].referenceText())
                }
                val bridges = context.classDefBy(INSTAGRAM_MEDIA).methods.filter { it.name in videoBridges }
                assertEquals("${bundle.name}: the video bridges", videoBridges.size, bridges.size)
                bridges.forEach { assertEquals("${bundle.name}: ${it.name}", Opcode.CHECK_CAST, it.code().first().opcode) }
                checked += version
            }
        }
        assertEquals("a declared build has no fixture", versions, checked)
    }

    private val videoBridges = setOf(
        "videoVersions", "dashManifest", "mediaId", "owner", "takenAt", "username", "versionUrl", "versionWidth", "versionHeight",
        "imageVersions", "imageCandidates", "candidateUrl", "candidateWidth", "candidateHeight",
    )

    private fun assertUntouched(context: BytecodePatchContext) {
        assertTrue("the builder changed", context.method(lambda, "invoke").code().none { it.referenceText()?.startsWith("Lapp/hushgram/") == true })
        assertEquals("the handler changed", Opcode.CONST_STRING, context.method(helper, "A09").code().first().opcode)
        assertEquals("a bridge was written", Opcode.CONST_4, context.method(INSTAGRAM_MEDIA, "videoVersions").code().first().opcode)
        assertEquals("the row bridge was written", Opcode.RETURN_VOID, context.method(INSTAGRAM_MEDIA, "addDownloadRow").code().first().opcode)
    }

    private fun BytecodePatchContext.method(type: String, name: String, parameters: List<String>? = null): Method =
        classDefBy(type).methods.single { it.name == name && (parameters == null || it.parameterTypes.map(Any::toString) == parameters) }

    private fun Method.code(): List<Instruction> = implementation?.instructions?.toList().orEmpty()

    private fun Instruction.referenceText(): String? = (this as? ReferenceInstruction)?.reference?.toString()

    /** The index [branch] at [index] lands on. */
    private fun List<Instruction>.target(index: Int): Int {
        val address = IntArray(size + 1)
        forEachIndexed { i, instruction -> address[i + 1] = address[i] + instruction.codeUnits }
        return address.indexOf(address[index] + (this[index] as OffsetInstruction).codeOffset)
    }

    // ---- stand-ins shaped like Instagram 449's -------------------------------------------------

    private fun classes(
        name: String = FEED_HELPER_NAME,
        lateJump: Boolean = false,
        handlerRegisters: Int = 42,
        shortLists: Int = 1,
        shortListRegisters: Int = 4,
        pageReads: Pair<Int, Int> = 3 to 1,
        lookupReadsPages: Boolean = true,
        menuHoldsItem: Boolean = true,
    ): List<ClassDef> {
        val menu = ImmutableClassDef(
            helper, AccessFlags.PUBLIC.value or AccessFlags.FINAL.value, "Ljava/lang/Object;", null, null, null,
            listOfNotNull(
                ImmutableField(helper, "__redex_internal_original_name", "Ljava/lang/String;",
                    AccessFlags.PUBLIC.value or AccessFlags.STATIC.value or AccessFlags.FINAL.value, ImmutableStringEncodedValue(name), null, null),
                field(helper, "activity", activity),
                field(helper, "post", MEDIA),
                field(helper, "item", itemState).takeIf { menuHoldsItem },
                field(helper, "elsewhere", elsewhere),
            ),
            listOf(
                method(helper, "A09", listOf(OPTION), "V", handlerRegisters, static = false, body = """
                    const-string v0, "feed_action_sheet"
                    return-void
                """),
                // The getter that throws on null, by calling the one that reads the field.
                method(helper, "A00", listOf(helper), "$MEDIA", 2, static = true, body = """
                    invoke-static { p0 }, $helper->A01($helper)$MEDIA
                    move-result-object v0
                    return-object v0
                """),
                method(helper, "A01", listOf(helper), "$MEDIA", 2, static = true, body = """
                    iget-object v0, p0, $helper->post:$MEDIA
                    return-object v0
                """),
            ),
        )
        // The feed menu's builder, one case of a merged lambda: your own post goes past the download
        // check and two flags to the Download row, out of line; anyone else's jumps past it.
        val builder = classDef(lambda, listOf(method(lambda, "invoke", emptyList(), "Ljava/lang/Object;", 15, static = false, body = """
            new-instance v3, Ljava/util/ArrayList;
            invoke-direct { v3 }, Ljava/util/ArrayList;-><init>()V
            iget-object v0, p0, $lambda->state:$state
            iget-object v1, v0, $state->media:$MEDIA
            invoke-static { v1 }, $mine
            move-result v1
            if-eqz v1, :others
            iget-object v12, v0, $state->media:$MEDIA
            const/4 v2, 0x0
            invoke-virtual { v2, v2, v12 }, $check
            move-result v1
            if-eqz v1, ${if (lateJump) ":others" else ":mine"}
            iget-boolean v1, v0, $state->flagged:Z
            const/4 v5, 0x0
            if-eqz v1, :row
            const-wide v6, 0x81034200060c62L
            invoke-static { v2, v6, v7 }, $flag
            move-result v1
            if-eqz v1, :row
            :mine
            invoke-static { v13 }, $helper->A01($helper)$MEDIA
            return-object v3
            :row
            sget-object v7, $DOWNLOAD
            iget-object v1, v0, $state->context:$contextType
            invoke-virtual { v1 }, Landroid/content/Context;->getResources()Landroid/content/res/Resources;
            move-result-object v2
            const v1, 0x7f131703
            invoke-virtual { v2, v1 }, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;
            move-result-object v9
            sget-object v6, $kind->A05:$kind
            move-object v8, v0
            move-object v10, v3
            move v11, v5
            invoke-static/range { v6 .. v11 }, $adder
            goto :mine
            :others
            iget-object v1, v0, $state->other:Ljava/lang/Object;
            iget-object v2, v0, $state->item:$itemState
            iget-object v4, v0, $state->media:$MEDIA
            sget-object v6, $OPTION->REPORT:$OPTION
            const v5, 0x7f000001
            invoke-static { v6, v0, v3, v5 }, $state->A01($OPTION${state}Ljava/util/ArrayList;I)V
            return-object v3
        """)))
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
            "A8k" to ("carousel_media" to "Ljava/util/List;"),
            "A3F" to ("image_versions2" to IMAGE_INFO),
        ).map { (name, field) -> getter(MEDIA, name, field.first, field.second) } +
            method(MEDIA, "getId", emptyList(), "Ljava/lang/String;", 1, static = false, body = """
                const/4 v0, 0x0
                return-object v0
            """)
        val versionGetters = listOf("getUrl" to ("url" to "Ljava/lang/String;"), "DvO" to ("width" to "Ljava/lang/Integer;"),
            "CK7" to ("height" to "Ljava/lang/Integer;"))
        val imageGetters = listOf("Bd1" to ("candidates" to "Ljava/util/List;"))
        // The short menu's list of the options it keeps: made once, answered as it is on one arm and
        // made read-only on the other, where a jump goes to the return.
        val shortList = { listName: String ->
            method(shortMenu, listName, listOf("Z"), "Ljava/util/List;", shortListRegisters, static = true, body = """
                sget-object v1, $WHY_OPTION
                sget-object v0, $REPORT_OPTION
                filled-new-array { v1, v0 }, [$OPTION
                move-result-object v1
                invoke-static { v1 }, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;
                move-result-object v1
                if-nez p0, :short
                return-object v1
                :short
                invoke-static { v1 }, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;
                move-result-object v0
                if-eqz v0, :done
                :done
                return-object v0
            """)
        }
        val shortMenus = classDef(shortMenu, listOf("A01", "A02").take(shortLists).map(shortList) +
            // A static list of the same shape reading Report alone, which isn't the menu's.
            method(shortMenu, "A03", listOf("Z"), "Ljava/util/List;", 2, static = true, body = """
                sget-object v0, $REPORT_OPTION
                const/4 v0, 0x0
                return-object v0
            """))
        // The page lookup, which reads a carousel's pages, and one of the same shape that doesn't.
        val mediaExt = classDef(MEDIA_EXT, listOf(
            method(MEDIA_EXT, "A0Q", listOf(MEDIA, "I"), MEDIA, 3, static = true, body = """
                ${if (lookupReadsPages) "invoke-virtual { p0 }, $MEDIA->A8k()Ljava/util/List;" else "nop"}
                const/4 v0, 0x0
                return-object v0
            """),
            method(MEDIA_EXT, "A0R", listOf(MEDIA, "I"), MEDIA, 3, static = true, body = """
                const/4 v0, 0x0
                return-object v0
            """),
        ))
        // Calls to the lookup: the feed state's page, another of its ints read less often, an int on a
        // class the builder's state doesn't hold read most often of all, and a constant.
        fun call(number: Int, holder: String, field: String) =
            method(pager, "p$number", listOf(MEDIA, holder), MEDIA, 4, static = true, body = """
                iget v0, p1, $holder->$field:I
                invoke-static { p0, v0 }, $pageLookup
                move-result-object v1
                return-object v1
            """)
        val calls = (1..pageReads.first).map { call(it, itemState, "page") } +
            (1..pageReads.second).map { call(10 + it, itemState, "scroll") } +
            (1..5).map { call(20 + it, elsewhere, "index") } +
            method(pager, "constant", listOf(MEDIA), MEDIA, 3, static = true, body = """
                const/4 v0, 0x0
                invoke-static { p0, v0 }, $pageLookup
                move-result-object v1
                return-object v1
            """)
        return listOf(
            menu, builder, eligible, shortMenus, mediaExt, classDef(pager, calls),
            classDef(MEDIA, mediaGetters),
            classDef(USER, listOf(getter(USER, "A89", "username", "Ljava/lang/String;"))),
            anInterface(VIDEO_VERSION, versionGetters.map { it.first to it.second.second }),
            classDef(PANDO_VIDEO_VERSION, versionGetters.map { (name, field) -> getter(PANDO_VIDEO_VERSION, name, field.first, field.second) }),
            anInterface(IMAGE_INFO, imageGetters.map { it.first to it.second.second }),
            classDef(PANDO_IMAGE_INFO, imageGetters.map { (name, field) -> getter(PANDO_IMAGE_INFO, name, field.first, field.second) }),
            anInterface(IMAGE_URL, listOf("getUrl" to "Ljava/lang/String;", "getWidth" to "I", "getHeight" to "I")),
            ExtensionDex.classDef(INSTAGRAM_MEDIA),
        )
    }

    private fun anInterface(type: String, methods: List<Pair<String, String>>): ClassDef = ImmutableClassDef(
        type, AccessFlags.PUBLIC.value or AccessFlags.INTERFACE.value or AccessFlags.ABSTRACT.value,
        "Ljava/lang/Object;", null, null, null, null,
        methods.map { (name, returns) ->
            ImmutableMethod(type, name, emptyList(), returns, AccessFlags.PUBLIC.value or AccessFlags.ABSTRACT.value, null, null, null)
        },
    )

    private fun getter(owner: String, name: String, field: String, returns: String) =
        method(owner, name, emptyList(), returns, 2, static = false, body = """
            const v0, ${field.hashCode()}
            const/4 v0, 0x0
            return-object v0
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
