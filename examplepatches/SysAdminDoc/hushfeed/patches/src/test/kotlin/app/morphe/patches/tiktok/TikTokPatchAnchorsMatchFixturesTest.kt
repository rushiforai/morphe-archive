package app.morphe.patches.tiktok

import app.morphe.patches.tiktok.feedfilter.countColdStartFeedItemListStores
import app.morphe.patches.tiktok.interaction.downloads.drawsCommentImageWatermark
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
import org.junit.Assume.assumeTrue
import org.junit.Test

/**
 * Instruction-level anchors used by TikTok 47.0.3 remain unique on every
 * retained universal APK. The assertions describe behavior the patches consume rather than R8
 * names or strings that can move into adjacent methods.
 */
class TikTokPatchAnchorsMatchFixturesTest {
    @Test
    fun `block skip native pager methods survive every retained fixture`() {
        val apks = fixtures()
        assumeTrue("no TikTok fixture on this machine", apks.isNotEmpty())
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
        assumeTrue("no TikTok fixture on this machine", apks.isNotEmpty())
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
        assumeTrue("no TikTok fixture on this machine",apks.isNotEmpty())
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
        assumeTrue("no TikTok fixture on this machine", apks.isNotEmpty())
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
        assumeTrue("no TikTok fixture on this machine", apks.isNotEmpty())
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
        assumeTrue("no TikTok fixture on this machine", apks.isNotEmpty())
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
        assumeTrue("no TikTok fixture on this machine", apks.isNotEmpty())
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
        assumeTrue("no TikTok fixture on this machine", apks.isNotEmpty())

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
        assumeTrue("no TikTok fixture on this machine", apks.isNotEmpty())

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
        assumeTrue("no TikTok fixture on this machine", apks.isNotEmpty())

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

    private fun fixtures(): List<File> {
        val directory = File(System.getenv("HUSHFEED_FIXTURE_DIR") ?: "C:/_claude-backups/tiktok-fixture")
        if (!directory.isDirectory) return emptyList()
        return directory.listFiles()?.filter { file ->
            file.isFile && file.extension == "apk" &&
                file.name.contains(Regex("(46\\.[2789]\\.3|47\\.0\\.3)"))
        }?.sortedBy { it.name } ?: emptyList()
    }
}
