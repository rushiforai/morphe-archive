package app.morphe.patches.tiktok

import app.morphe.Fixtures
import app.morphe.patches.tiktok.feedfilter.COMMENT_TOP_BAR_BRIDGE_BASE
import app.morphe.patches.tiktok.feedfilter.TAKO_COMMENT_TOP_BAR_BRIDGE
import app.morphe.patches.tiktok.feedfilter.TAKO_COMMENT_TOP_BAR_SERVICE
import app.morphe.patches.tiktok.feedfilter.countColdStartFeedItemListStores
import app.morphe.patches.tiktok.feedfilter.isCommentTopBarCanShow
import app.morphe.patches.tiktok.feedfilter.isTakoSearchEntranceInflater
import app.morphe.patches.tiktok.feedfilter.takoSearchEntranceVariants
import app.morphe.patches.tiktok.interaction.downloads.drawsCommentImageWatermark
import app.morphe.patches.tiktok.interaction.searchsuggestions.isSearchRewardsAccessor
import app.morphe.patches.tiktok.interaction.speed.playerManagerSpeedBoundary
import app.morphe.patches.tiktok.misc.settings.isSettingsComposeRowsMethod
import app.morphe.patches.tiktok.misc.commenttools.isCommentSearchHeaderFactory
import app.morphe.patches.tiktok.misc.commenttools.resolveCommentSearchSuggestions
import app.morphe.patches.tiktok.misc.commenttools.compactCommentHeaderComponents
import app.morphe.patches.tiktok.misc.commenttools.isCompactCommentHeaderBind
import app.morphe.patches.tiktok.misc.commenttools.resolveCompactCommentHeader
import app.morphe.patches.tiktok.misc.commenttools.resolveLikeTouchListener
import app.morphe.patches.tiktok.interaction.videooverlays.*
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.DexFileFactory
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import java.io.File
import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Test

/**
 * Instruction-level anchors used by TikTok 47.0.3 remain unique on every
 * retained universal APK. The assertions describe behavior the patches consume rather than R8
 * names or strings that can move into adjacent methods.
 */
class TikTokPatchAnchorsMatchFixturesTest {
    /**
     * Issue #21. The regional Report button's gate and the search rewards accessor are each one
     * method on every build, static and without parameters, so every register is a local the
     * entry guard can use.
     */
    @Test
    fun `regional Report gate and search rewards accessor stay unique on every retained fixture`() {
        val apks = fixtures()
        for (apk in apks) {
            val container = DexFileFactory.loadDexContainer(apk, Opcodes.getDefault())
            val gates = mutableListOf<Method>()
            val accessors = mutableListOf<Method>()
            container.dexEntryNames.asSequence()
                .flatMap { container.getEntry(it)!!.dexFile.classes.asSequence() }
                .flatMap { it.methods.asSequence() }
                .forEach {
                    if (isFeedReportButtonGate(it)) gates += it
                    if (isSearchRewardsAccessor(it)) accessors += it
                }
            assertEquals("${apk.name}: Report button gate ${gates.map { it.definingClass }}", 1, gates.size)
            assertEquals("${apk.name}: search rewards accessor ${accessors.map { it.definingClass }}", 1, accessors.size)
            for (method in gates + accessors) {
                assertTrue("${apk.name}: ${method.definingClass} has no local for the guard",
                    method.implementation!!.registerCount >= 1)
            }
            // The gate's own false is the ordinary answer, so the guard's false is one it handles.
            assertTrue("${apk.name}: the Report gate never answers false itself",
                gates.single().implementation!!.instructions.any {
                    it.opcode == Opcode.CONST_4 && (it as NarrowLiteralInstruction).narrowLiteral == 0
                })
        }
    }

    /**
     * Issue #23. The Save media button finds the sticker sheet's actions by the sheet's shape:
     * exactly one set of two or more fields sharing a TextView-descended type. The type itself is
     * renamed on every build (0GSy, 1AWY, 1D84, 0CNa, 02Lg), which is what broke the old lookup.
     */
    @Test
    fun `sticker sheet keeps one group of like typed action fields on every retained fixture`() {
        val apks = fixtures()
        for (apk in apks) {
            val container = DexFileFactory.loadDexContainer(apk, Opcodes.getDefault())
            val byType = container.dexEntryNames.asSequence()
                .flatMap { container.getEntry(it)!!.dexFile.classes.asSequence() }.associateBy { it.type }
            fun descendsFrom(type: String, ancestor: String): Boolean {
                var current: String? = type
                repeat(8) {
                    if (current == ancestor) return true
                    current = byType[current]?.superclass ?: return false
                }
                return false
            }
            val rows = byType.values.filter { row ->
                row.superclass == "Landroid/widget/LinearLayout;" &&
                    row.fields.any { it.type == "Lcom/bytedance/lighten/loader/SmartImageView;" } &&
                    row.fields.any { it.type == "Lcom/bytedance/tux/input/TuxTextView;" } &&
                    row.methods.any { method ->
                        val parameters = method.parameterTypes.map(CharSequence::toString)
                        method.returnType == "V" && parameters.size == 4 && parameters[1] == "Z" &&
                            parameters[2] == "Ljava/lang/String;" && parameters[3] == "Ljava/util/Map;" &&
                            !AccessFlags.STATIC.isSet(method.accessFlags) &&
                            byType[parameters[0]]?.fields?.any {
                                it.type == "Lcom/ss/android/ugc/aweme/base/model/UrlModel;"
                            } == true
                    }
            }
            assertEquals("${apk.name}: sticker preview row", 1, rows.size)
            val groups = rows.single().fields
                .filter { !AccessFlags.STATIC.isSet(it.accessFlags) && descendsFrom(it.type, "Landroid/widget/TextView;") }
                .groupBy { it.type }.filterValues { it.size >= 2 }
            assertEquals("${apk.name}: like typed action fields ${groups.keys}", 1, groups.size)
        }
    }

    /**
     * Issue #22. Each search-page Tako entrance has exactly one ViewStub inflater with a local
     * for the guard, and TikTok itself answers null from it, which is the answer the guard gives.
     */
    @Test
    fun `both search page Tako entrances keep one nullable inflater on every retained fixture`() {
        val apks = fixtures()
        for (apk in apks) {
            val container = DexFileFactory.loadDexContainer(apk, Opcodes.getDefault())
            val inflaters = container.dexEntryNames.asSequence()
                .flatMap { container.getEntry(it)!!.dexFile.classes.asSequence() }
                .filter { it.type in takoSearchEntranceVariants }
                .flatMap { it.methods.asSequence() }
                .filter(::isTakoSearchEntranceInflater).toList()
            assertEquals(
                "${apk.name}: one inflater per entrance",
                takoSearchEntranceVariants.toSet(),
                inflaters.map { it.definingClass }.toSet(),
            )
            assertEquals("${apk.name}: no second inflater", 2, inflaters.size)
            for (inflater in inflaters) {
                val body = inflater.implementation!!
                assertTrue("${apk.name}: ${inflater.definingClass} has no local for the guard",
                    body.registerCount - 2 >= 1)
                val instructions = body.instructions.toList()
                assertTrue("${apk.name}: ${inflater.definingClass} never answers null itself",
                    instructions.zipWithNext().any { (first, second) ->
                        first.opcode == Opcode.CONST_4 && (first as NarrowLiteralInstruction).narrowLiteral == 0 &&
                            second.opcode == Opcode.RETURN_OBJECT
                    })
            }
        }
    }

    /**
     * The Tako bar inside the comments sheet. Both services that can serve it keep one canShow
     * of the guarded shape on every build, with a local for the guard's answer; the Tako bridge
     * still sits on the base whose canShow is guarded, and the Tako service already answers
     * false itself, so the guard's false is one the sheet's resolver handles.
     */
    @Test
    fun `both comment sheet Tako top bar gates stay unique and guardable on every retained fixture`() {
        // The extension answers the bridge base's guard by class name, so the name it compares
        // has to be the one the fingerprint pins; a rename of either alone would apply cleanly
        // and leave the bar standing.
        val extension = File("../extensions/tiktok/src/main/java/app/morphe/extension/tiktok/feedfilter/TakoAiFilter.java")
            .takeIf { it.isFile } ?: File("extensions/tiktok/src/main/java/app/morphe/extension/tiktok/feedfilter/TakoAiFilter.java")
        assertTrue("could not find TakoAiFilter.java from ${File(".").absolutePath}", extension.isFile)
        val compared = Regex("COMMENT_TOP_BAR_BRIDGE\\s*=\\s*\"([A-Za-z0-9_]+)\"").find(extension.readText())?.groupValues?.get(1)
        assertEquals("the class name the extension compares is the bridge the patch pins",
            TAKO_COMMENT_TOP_BAR_BRIDGE.substringAfterLast('/').removeSuffix(";"), compared)

        val apks = fixtures()
        for (apk in apks) {
            val container = DexFileFactory.loadDexContainer(apk, Opcodes.getDefault())
            val wanted = setOf(TAKO_COMMENT_TOP_BAR_SERVICE, COMMENT_TOP_BAR_BRIDGE_BASE, TAKO_COMMENT_TOP_BAR_BRIDGE)
            val classes = container.dexEntryNames.asSequence()
                .flatMap { container.getEntry(it)!!.dexFile.classes.asSequence() }
                .filter { it.type in wanted }.associateBy { it.type }
            assertEquals("${apk.name}: named Tako comment services", wanted, classes.keys)
            val bridge = classes.getValue(TAKO_COMMENT_TOP_BAR_BRIDGE)
            assertEquals("${apk.name}: the Tako bridge extends the guarded base",
                COMMENT_TOP_BAR_BRIDGE_BASE, bridge.superclass)
            assertEquals("${apk.name}: the bridge has no canShow of its own", 0,
                bridge.methods.count { it.name == "canShow" })
            assertEquals("${apk.name}: the bridge names its Tako service", 1,
                bridge.methods.count { it.name == "bridgeTopBar" && it.parameterTypes.isEmpty() })
            for (type in listOf(TAKO_COMMENT_TOP_BAR_SERVICE, COMMENT_TOP_BAR_BRIDGE_BASE)) {
                val gates = classes.getValue(type).methods.filter(::isCommentTopBarCanShow)
                assertEquals("${apk.name}: $type canShow", 1, gates.size)
                val body = gates.single().implementation!!
                // this plus five parameters; the guard writes its answer to v0.
                assertTrue("${apk.name}: $type canShow has no local for the guard",
                    body.registerCount - 6 >= 1)
            }
            val takoGate = classes.getValue(TAKO_COMMENT_TOP_BAR_SERVICE).methods.single(::isCommentTopBarCanShow)
            assertTrue("${apk.name}: the Tako service never answers false itself",
                takoGate.implementation!!.instructions.any {
                    it.opcode == Opcode.CONST_4 && (it as NarrowLiteralInstruction).narrowLiteral == 0
                })
        }
    }

    @Test
    fun `block skip native pager methods survive every retained fixture`() {
        val apks = fixtures()
        for (apk in apks) {
            val container = DexFileFactory.loadDexContainer(apk, Opcodes.getDefault())
            val pager = container.dexEntryNames.asSequence()
                .flatMap { container.getEntry(it)!!.dexFile.classes.asSequence() }
                .single { it.type == "Lcom/ss/android/ugc/aweme/common/widget/VerticalViewPager;" }
            app.morphe.patches.tiktok.interaction.blockauthor.validateBlockPager(pager.methods)
        }
    }
    @Test
    fun `bottom search banner model and native component key survive every retained fixture`() {
        val apks = fixtures()
        for (apk in apks) {
            val container = DexFileFactory.loadDexContainer(apk, Opcodes.getDefault())
            val wanted = setOf(
                "Lcom/ss/android/ugc/aweme/feed/model/Aweme;",
                "Lcom/ss/android/ugc/aweme/feed/model/banner/BannerCommonStruct;",
                "Lcom/ss/android/ugc/aweme/feed/model/banner/BannerCommonKey;",
                "Lcom/ss/android/ugc/feed/platform/cell/interact/bottom/bar/FeedSearchBottomBarPreload;",
            )
            val classes = container.dexEntryNames.asSequence()
                .flatMap { container.getEntry(it)!!.dexFile.classes.asSequence() }
                .filter { it.type in wanted }.associateBy { it.type }
            assertEquals("${apk.name}: named banner contracts", wanted, classes.keys)
            val model = classes.getValue("Lcom/ss/android/ugc/aweme/feed/model/Aweme;")
            assertEquals(1, model.methods.count { it.name == "getBanners" && it.parameterTypes.isEmpty() &&
                it.returnType == "Ljava/util/List;" && !AccessFlags.STATIC.isSet(it.accessFlags) })
            assertEquals(1, model.methods.count { it.name == "setBanners" &&
                it.parameterTypes.map(CharSequence::toString) == listOf("Ljava/util/List;") && it.returnType == "V" })
            val banner = classes.getValue("Lcom/ss/android/ugc/aweme/feed/model/banner/BannerCommonStruct;")
            assertTrue(banner.fields.any { it.name == "bannerKey" &&
                it.type == "Lcom/ss/android/ugc/aweme/feed/model/banner/BannerCommonKey;" && AccessFlags.PUBLIC.isSet(it.accessFlags) })
            val key = classes.getValue("Lcom/ss/android/ugc/aweme/feed/model/banner/BannerCommonKey;")
            assertTrue(key.fields.any { it.name == "componentKey" && it.type == "Ljava/lang/String;" &&
                AccessFlags.PUBLIC.isSet(it.accessFlags) })
            val preload = classes.getValue("Lcom/ss/android/ugc/feed/platform/cell/interact/bottom/bar/FeedSearchBottomBarPreload;")
            assertTrue(preload.methods.any { "bottom_banner_search_rs" in it.stringConstants() })
        }
    }

    @Test
    fun `fullscreen entry and both location card contracts survive every retained fixture`() {
        val apks=fixtures()
        for(apk in apks) {
            val container=DexFileFactory.loadDexContainer(apk,Opcodes.getDefault())
            val classes=container.dexEntryNames.flatMap{container.getEntry(it)!!.dexFile.classes}
            val byType=classes.associateBy{it.type}
            val listFactories = classes.asSequence().flatMap { it.methods.asSequence() }
                .filter(::isLocationBadgeListFactory).toList()
            assertEquals("${apk.name}: location-only presentation list boundary", 1, listFactories.size)
            val factory = MutableMethod(listFactories.single())
            val factoryBefore = factory.implementation!!.instructions.toList()
            val writeFactory = factory.resolveLocationBadgeList()
            assertEquals(factoryBefore, factory.implementation!!.instructions.toList())
            writeFactory()
            assertEquals(factoryBefore.size + 2, factory.implementation!!.instructions.size)
            val model = byType.getValue("Lcom/ss/android/ugc/aweme/feed/model/AnchorCommonStruct;")
            assertTrue(model.methods.any { it.name == "getComponentKey" && it.parameterTypes.isEmpty() &&
                it.returnType == "Ljava/lang/String;" })
            val preload = byType.getValue("Lcom/ss/android/ugc/aweme/poi/preload/PoiAnchorPreloadTask;")
            assertTrue(preload.methods.any { method -> "anchor_poi" in method.stringConstants() })
            val full=byType.getValue(FULLSCREEN_COMPONENT).methods.filter(::isFullscreenBind)
            assertEquals("${apk.name}: exact Full screen entry",1,full.size)
            val cards=locationCardMarkers.map{marker->
                // Don't materialize every method in a large APK just to retain one binder.
                val matches=classes.asSequence().flatMap{it.methods.asSequence()}
                    .filter{isLocationCardBind(it,marker)}.toList()
                assertEquals("${apk.name}: $marker",1,matches.size)
                marker to MutableMethod(matches.single())
            }
            val f=MutableMethod(full.single())
            val methods=listOf(f)+cards.map{it.second}
            val before=methods.map{it.implementation!!.instructions.toList()}
            val write=resolveFeedOverlayControls(f,cards){byType[it]}
            methods.forEachIndexed{i,m->assertEquals(before[i],m.implementation!!.instructions.toList())}
            write()
            methods.forEachIndexed{i,m->assertEquals(before[i],m.implementation!!.instructions.drop(1))}
        }
    }

    @Test
    fun `native comment like installer is unique and leaves other actions intact on every fixture`() {
        val apks = fixtures()
        for (apk in apks) {
            val container = DexFileFactory.loadDexContainer(apk, Opcodes.getDefault())
            val classes = container.dexEntryNames.flatMap { container.getEntry(it)!!.dexFile.classes }
            val owners = classes.filter { type -> type.methods.any { method ->
                method.implementation?.instructions?.any {
                    ((it as? ReferenceInstruction)?.reference as? StringReference)?.string == "diggView bind: comment id "
                } == true
            } }
            assertEquals("${apk.name}: native comment like view", 1, owners.size)
            val installers = owners.single().methods.filter { method ->
                method.returnType == "V" && method.parameterTypes.isEmpty() &&
                    method.implementation?.instructions?.any {
                        ((it as? ReferenceInstruction)?.reference as? MethodReference)?.name == "setOnTouchListener"
                    } == true
            }
            assertEquals("${apk.name}: listener installer", 1, installers.size)
            val byType = classes.associateBy { it.type }
            val method = MutableMethod(installers.single())
            val before = method.implementation!!.instructions.toList()
            val write = method.resolveLikeTouchListener { byType[it] }
            assertEquals(before, method.implementation!!.instructions.toList())
            write()
            val after = method.implementation!!.instructions.toList()
            assertEquals(before.size, after.size)
            assertEquals("${apk.name}: only one native call changes", 1,
                before.indices.count { before[it] !== after[it] })
            assertEquals(1, after.count {
                ((it as? ReferenceInstruction)?.reference as? MethodReference)?.definingClass ==
                    "Lapp/morphe/extension/tiktok/comment/CommentLikeTouchTarget;"
            })
        }
    }

    @Test
    fun `all three compact comment roots keep their named lifecycle contract on every fixture`() {
        val apks = fixtures()
        for (apk in apks) {
            val container = DexFileFactory.loadDexContainer(apk, Opcodes.getDefault())
            val components = container.dexEntryNames.flatMap { entry ->
                container.getEntry(entry)!!.dexFile.classes.filter { it.type in compactCommentHeaderComponents }
            }
            assertEquals("${apk.name}: three dedicated header components", 3, components.size)
            for (component in components) {
                assertEquals("${apk.name}: ${component.type} is a slot, not the sheet root",
                    "Lcom/bytedance/assem/arch/view/UISlotAssem;", component.superclass)
                val binds = component.methods.filter(::isCompactCommentHeaderBind)
                assertEquals("${apk.name}: ${component.type} lifecycle", 1, binds.size)
                val method = MutableMethod(binds.single())
                val original = method.implementation!!.instructions.toList()
                method.resolveCompactCommentHeader()()
                assertEquals(original, method.implementation!!.instructions.drop(1).toList())
            }
        }
    }

    @Test
    fun `comment suggestion banner factory is unique and guardable on every fixture`() {
        val apks = fixtures()
        for (apk in apks) {
            val container = DexFileFactory.loadDexContainer(apk, Opcodes.getDefault())
            val matches = container.dexEntryNames.flatMap { entry ->
                container.getEntry(entry)!!.dexFile.classes.filter {
                    it.type == "Lcom/ss/android/ugc/aweme/search/common/communicate/AbsSearchService;"
                }.flatMap { it.methods.filter(::isCommentSearchHeaderFactory) }
            }
            assertEquals("${apk.name}: optional comment_top banner factory", 1, matches.size)
            val method = MutableMethod(matches.single())
            val original = method.implementation!!.instructions.toList()
            assertTrue("native absent-banner returns remain supported",
                original.count { it.opcode == Opcode.RETURN_OBJECT } >= 2)
            val write = method.resolveCommentSearchSuggestions()
            assertEquals("preflight must not edit", original, method.implementation!!.instructions.toList())
            write()
            assertEquals(listOf(Opcode.INVOKE_STATIC, Opcode.MOVE_RESULT, Opcode.IF_EQZ,
                Opcode.CONST_4, Opcode.RETURN_OBJECT, Opcode.NOP),
                method.implementation!!.instructions.take(6).map { it.opcode })
            assertEquals(original, method.implementation!!.instructions.drop(6).toList())
        }
    }

    @Test
    fun `location affiliate disclosure uses the same named contract on every fixture`() {
        val apks = fixtures()
        val model = "Lcom/ss/android/ugc/aweme/feed/model/"
        val expectedClasses = listOf("Aweme", "ContentModel", "StandardBusinessModel", "LocalAllianceInfo")
        for (apk in apks) {
            val container = DexFileFactory.loadDexContainer(apk, Opcodes.getDefault())
            val models = container.dexEntryNames.flatMap { entry ->
                container.getEntry(entry)!!.dexFile.classes.filter { it.type in expectedClasses.map { "$model$it;" } }
            }.associateBy { it.type }
            assertEquals("${apk.name}: complete model chain", 4, models.size)
            val aweme = models.getValue("${model}Aweme;")
            assertTrue(aweme.methods.any {
                it.name == "getContentModel" && it.parameterTypes.isEmpty() &&
                    it.returnType == "${model}ContentModel;"
            })
            assertTrue(models.getValue("${model}ContentModel;").fields.any {
                it.name == "standardBusinessModel" && it.type == "${model}StandardBusinessModel;"
            })
            assertTrue(models.getValue("${model}StandardBusinessModel;").methods.any {
                it.name == "getLocalAllianceInfo" && it.parameterTypes.isEmpty() &&
                    it.returnType == "${model}LocalAllianceInfo;"
            })
            val show = models.getValue("${model}LocalAllianceInfo;").methods.single {
                it.name == "showBottomLabel" && it.parameterTypes.isEmpty() && it.returnType == "Z"
            }
            val instructions = show.implementation!!.instructions.toList()
            assertEquals(
                "${apk.name}: label type is 1 and label text is nonempty",
                listOf(Opcode.IGET_OBJECT, Opcode.CONST_4, Opcode.IF_EQZ, Opcode.INVOKE_VIRTUAL,
                    Opcode.MOVE_RESULT, Opcode.CONST_4, Opcode.IF_NE, Opcode.IGET_OBJECT,
                    Opcode.IF_EQZ, Opcode.INVOKE_VIRTUAL, Opcode.MOVE_RESULT, Opcode.IF_EQZ,
                    Opcode.CONST_4, Opcode.RETURN),
                instructions.map { it.opcode },
            )
            assertEquals(listOf(0, 1, 1), instructions.filterIsInstance<NarrowLiteralInstruction>().map { it.narrowLiteral })
            assertEquals(listOf(
                "${model}LocalAllianceInfo;->allianceItemLabelType:Ljava/lang/Integer;",
                "Ljava/lang/Integer;->intValue()I",
                "${model}LocalAllianceInfo;->allianceItemLabelText:Ljava/lang/String;",
                "Ljava/lang/String;->length()I",
            ), instructions.filterIsInstance<ReferenceInstruction>().map { it.reference.toString() })
        }
    }

    @Test
    fun `main feed items getter exists once on every fixture`() {
        val apks = fixtures()

        for (apk in apks) {
            val matches = mutableListOf<Method>()
            val container = DexFileFactory.loadDexContainer(apk, Opcodes.getDefault())
            for (entry in container.dexEntryNames) {
                for (classDef in container.getEntry(entry)!!.dexFile.classes) {
                    if (classDef.type !=
                        "Lcom/ss/android/ugc/aweme/feed/model/FeedItemList;"
                    ) continue
                    matches += classDef.methods.filter { method ->
                        method.name == "getItems" && method.parameterTypes.isEmpty() &&
                            method.returnType == "Ljava/util/List;"
                    }
                }
            }

            assertEquals(
                "${apk.name}: FeedItemList.getItems late filter boundary",
                1,
                matches.size,
            )
        }
    }

    @Test
    fun `settings compose rows anchor is unique on every fixture`() {
        val apks = fixtures()

        for (apk in apks.sortedByDescending { it.name }) {
            val matches = mutableListOf<Method>()
            val classMethods = mutableListOf<Method>()
            val container = DexFileFactory.loadDexContainer(apk, Opcodes.getDefault())
            for (entry in container.dexEntryNames) {
                for (classDef in container.getEntry(entry)!!.dexFile.classes) {
                    if (classDef.type.endsWith("/SettingsComposeRvmpFragment;")) {
                        classMethods += classDef.methods
                    }
                    for (method in classDef.methods) {
                        if (isSettingsComposeRowsMethod(method, classDef)) matches += method
                    }
                }
            }

            assertEquals(
                "${apk.name}: settings compose rows " +
                    matches.joinToString { it.anchorSignature() } +
                    "; class methods: " + classMethods.joinToString(" | ") { method ->
                        method.anchorSignature() + " calls=" + method.listReturningCalls().joinToString()
                    },
                1,
                matches.size,
            )
        }
    }

    @Test
    fun `watermark cache and playback anchors are unique on every fixture`() {
        val apks = fixtures()

        for (apk in apks) {
            val watermark = mutableListOf<Method>()
            val goldenCache = mutableListOf<Method>()
            val offlineCache = mutableListOf<Method>()
            val speed = mutableListOf<Method>()

            val container = DexFileFactory.loadDexContainer(apk, Opcodes.getDefault())
            for (entry in container.dexEntryNames) {
                for (classDef in container.getEntry(entry)!!.dexFile.classes) {
                    for (method in classDef.methods) {
                        val strings = method.stringConstants()
                        if (
                            method.parameterTypes == listOf("Landroid/graphics/Bitmap;") &&
                            method.returnType == "V" &&
                            "[tiktok_logo]" in strings &&
                            method.drawsCommentImageWatermark()
                        ) {
                            watermark += method
                        }
                        val storeCount = method.countColdStartFeedItemListStores()
                        if (
                            method.parameterTypes.isEmpty() && method.returnType == "Z" &&
                            "processGoldenVideoHitCache hitCache , time cost " in strings &&
                            storeCount in 3..4
                        ) {
                            goldenCache += method
                        }
                        if (
                            method.parameterTypes.isEmpty() && method.returnType == "Z" &&
                            "processOfflineVideoHitCache error" in strings &&
                            storeCount in 1..4
                        ) {
                            offlineCache += method
                        }
                        if (
                            method.definingClass.endsWith("/feed/controller/PlayerController;") &&
                            method.parameterTypes == listOf("F") && method.returnType == "V" &&
                            "speed_begin" in strings && "begin_speed" in strings &&
                            method.playerManagerSpeedBoundary() != null
                        ) {
                            speed += method
                        }
                    }
                }
            }

            assertEquals("${apk.name}: comment watermark anchor", 1, watermark.size)
            assertEquals("${apk.name}: golden cold-cache anchor", 1, goldenCache.size)
            assertEquals("${apk.name}: offline cold-cache anchor", 1, offlineCache.size)
            assertEquals("${apk.name}: playback speed anchor", 1, speed.size)

            val coldMethods = (goldenCache + offlineCache).distinctBy { it.anchorSignature() }
            assertEquals(
                "${apk.name}: cold-cache FeedItemList stores",
                4,
                coldMethods.sumOf { it.countColdStartFeedItemListStores() },
            )
            val offlineMarkers = coldMethods.sumOf { method ->
                method.implementation?.instructions?.count { instruction ->
                    instruction.opcode == Opcode.SGET_OBJECT &&
                        (instruction as? ReferenceInstruction)?.reference.let { reference ->
                            reference is FieldReference &&
                                reference.name == "OFFLINE_MODE" &&
                                reference.type == reference.definingClass
                        }
                } ?: 0
            }
            assertEquals("${apk.name}: cold-cache OFFLINE_MODE marker", 1, offlineMarkers)
        }
    }

    private fun Method.stringConstants(): Set<String> =
        implementation?.instructions?.mapNotNull { instruction ->
            ((instruction as? ReferenceInstruction)?.reference as? StringReference)?.string
        }?.toSet() ?: emptySet()

    private fun Method.anchorSignature(): String =
        "$definingClass->$name${parameterTypes.joinToString("", "(", ")")}$returnType"

    private fun Method.listReturningCalls(): List<String> =
        implementation?.instructions?.mapNotNull { instruction ->
            if (instruction.opcode != Opcode.INVOKE_STATIC) return@mapNotNull null
            val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
                ?: return@mapNotNull null
            reference.toString().takeIf {
                reference.returnType == "Ljava/util/List;" ||
                    "Ljava/util/Comparator;" in reference.parameterTypes ||
                    "Ljava/lang/Iterable;" in reference.parameterTypes
            }
        } ?: emptyList()

    private fun fixtures(): List<File> = Fixtures.files { file ->
            file.extension == "apk" && file.name.contains(Regex("(46\\.[2789]\\.3|47\\.0\\.3)"))
        }
}
