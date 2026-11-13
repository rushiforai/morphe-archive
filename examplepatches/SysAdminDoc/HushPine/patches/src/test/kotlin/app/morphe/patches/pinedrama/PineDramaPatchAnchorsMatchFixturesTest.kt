package app.morphe.patches.pinedrama

import app.morphe.Fixtures
import app.morphe.takes
import app.morphe.patches.pinedrama.feedfilter.COMMENT_TOP_BAR_BRIDGE_BASE
import app.morphe.patches.pinedrama.feedfilter.TAKO_COMMENT_TOP_BAR_BRIDGE
import app.morphe.patches.pinedrama.feedfilter.COLD_START_STORES
import app.morphe.patches.pinedrama.feedfilter.coldStartCall
import app.morphe.patches.pinedrama.feedfilter.coldStartOrchestrators
import app.morphe.patches.pinedrama.feedfilter.countColdStartFeedItemListStores
import app.morphe.patches.pinedrama.feedfilter.isCommentTopBarCanShow
import app.morphe.patches.pinedrama.feedfilter.isTakoSearchEntranceInflater
import app.morphe.patches.pinedrama.feedfilter.takoSearchEntranceVariants
import app.morphe.patches.pinedrama.interaction.downloads.StickerPreviewSourceFingerprint
import app.morphe.patches.pinedrama.interaction.downloads.drawsCommentImageWatermark
import app.morphe.patches.pinedrama.interaction.searchsuggestions.isSearchRewardsAccessor
import app.morphe.patches.pinedrama.interaction.speed.playerManagerSpeedBoundary
import app.morphe.patches.pinedrama.misc.settings.isSettingsComposeRowsMethod
import app.morphe.patches.pinedrama.misc.optimizer.backendBuilderCall
import app.morphe.patches.pinedrama.misc.optimizer.framePreparerGateIndex
import app.morphe.patches.pinedrama.interaction.engagement.ProfileGridBindFingerprint
import app.morphe.patches.pinedrama.interaction.engagement.ProfileGridHolderBindFingerprint
import app.morphe.patches.pinedrama.interaction.engagement.gridCountSite
import app.morphe.patches.pinedrama.interaction.engagement.holderCountSites
import app.morphe.patches.pinedrama.interaction.favorites.isDialog
import app.morphe.patches.pinedrama.interaction.favorites.isQuickFavoritePanelShow
import app.morphe.patches.pinedrama.interaction.favorites.quickFavoritePanelField
import app.morphe.patches.pinedrama.interaction.quality.ForceHdrOffFingerprint
import app.morphe.patches.pinedrama.interaction.quality.SimVideoSetBitRateFingerprint
import app.morphe.patches.pinedrama.interaction.quality.SimVideoUrlModelSetBitRateFingerprint
import app.morphe.patches.pinedrama.interaction.quality.SIM_BIT_RATE
import app.morphe.patches.pinedrama.interaction.quality.requireGearCodecField
import app.morphe.patches.pinedrama.interaction.quality.requirePlayerGearSetter
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.value.StringEncodedValue
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import java.io.File
import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertNotNull
import org.junit.Assert.assertTrue
import org.junit.Test

/**
 * Instruction-level anchors the patches use on PineDrama remain unique on every
 * retained universal APK. The assertions describe behavior the patches consume rather than R8
 * names or strings that can move into adjacent methods.
 */
class PineDramaPatchAnchorsMatchFixturesTest {
    /**
     * Issue #21. The search rewards accessor is one method on every build, static and without
     * parameters, so every register is a local the entry guard can use.
     */
    @Test
    fun `search rewards accessor stays unique on every retained fixture`() {
        val apks = fixtures()
        for (apk in apks) {
            val container = Fixtures.dexContainer(apk, Opcodes.getDefault())
            val accessors = mutableListOf<Method>()
            container.dexEntryNames.asSequence()
                .flatMap { container.getEntry(it)!!.dexFile.classes.asSequence() }
                .flatMap { it.methods.asSequence() }
                .forEach {
                    if (isSearchRewardsAccessor(it)) accessors += it
                }
            assertEquals("${apk.name}: search rewards accessor ${accessors.map { it.definingClass }}", 1, accessors.size)
            assertTrue("${apk.name}: ${accessors.single().definingClass} has no local for the guard",
                accessors.single().implementation!!.registerCount >= 1)
        }
    }

    /**
     * Issue #23. The Save media button finds the sticker sheet's actions by the sheet's shape:
     * sets of two or more fields sharing a TextView-descended type, the narrowest class winning
     * when one set's class extends another's. The type is renamed on every build (0GSy, 1AWY,
     * 1D84, 0CNa, 02Lg, 02uW), which is what broke the old lookup. 47.7.3 also keeps four labels
     * in TuxTextView fields, so the set picked must be the one the row's action binder takes.
     */
    @Test
    fun `sticker sheet keeps one group of like typed action fields on every retained fixture`() {
        val apks = fixtures()
        for (apk in apks) {
            val container = Fixtures.dexContainer(apk, Opcodes.getDefault())
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
            val row = rows.single()
            val groups = row.fields
                .filter { !AccessFlags.STATIC.isSet(it.accessFlags) && descendsFrom(it.type, "Landroid/widget/TextView;") }
                .groupBy { it.type }.filterValues { it.size >= 2 }
            val narrowest = groups.keys.filter { type -> groups.keys.none { it != type && descendsFrom(it, type) } }
            assertEquals("${apk.name}: like typed action fields ${groups.keys}", 1, narrowest.size)
            assertTrue("${apk.name}: ${narrowest.single()} is not what the row binds its actions with",
                row.methods.any { method ->
                    !AccessFlags.STATIC.isSet(method.accessFlags) &&
                        method.parameterTypes.firstOrNull()?.toString() == narrowest.single()
                })
        }
    }

    /**
     * The Downloads patch ties each sticker preview to its StickerItem in the one method that
     * calls the preview bind with the sticker in p2. 47.7.3 appended a Function2 and a Long to
     * that method's parameters, the old whole-list fingerprint stopped matching, and the patch
     * failed at apply with every test green, since nothing here held the fingerprint to a build.
     */
    @Test
    fun `sticker preview source fingerprint takes one method on every retained fixture`() {
        for (apk in fixtures()) {
            val container = Fixtures.dexContainer(apk, Opcodes.getDefault())
            val taken = container.dexEntryNames.asSequence()
                .flatMap { container.getEntry(it)!!.dexFile.classes.asSequence() }
                .flatMap { classDef -> classDef.methods.asSequence().filter { StickerPreviewSourceFingerprint.takes(it, classDef) } }
                .toList()
            assertEquals("${apk.name}: sticker preview source ${taken.map { "${it.definingClass}->${it.name}" }}", 1, taken.size)
            assertEquals("${apk.name}: the sticker the hook reads from p2",
                "Lcom/ss/android/ugc/aweme/im/common/model/StickerItem;", taken.single().parameterTypes[1].toString())
        }
    }

    /**
     * Issue #22. Each search-page Tako entrance has exactly one ViewStub inflater with a local
     * for the guard, and PineDrama itself answers null from it, which is the answer the guard gives.
     */
    @Test
    fun `both search page Tako entrances keep one nullable inflater on every retained fixture`() {
        val apks = fixtures()
        for (apk in apks) {
            val container = Fixtures.dexContainer(apk, Opcodes.getDefault())
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
     * The Tako bar inside the comments sheet. PineDrama serves it through the commentv2 bridge
     * alone: the bridge still sits on the base whose canShow is guarded, and that base keeps one
     * canShow of the guarded shape with a local for the guard's answer.
     */
    @Test
    fun `the comment sheet Tako bridge gate stays unique and guardable on every retained fixture`() {
        // The extension answers the bridge base's guard by class name, so the name it compares
        // has to be the one the fingerprint pins; a rename of either alone would apply cleanly
        // and leave the bar standing.
        val extension = File("../extensions/pinedrama/src/main/java/app/morphe/extension/pinedrama/feedfilter/TakoAiFilter.java")
            .takeIf { it.isFile } ?: File("extensions/pinedrama/src/main/java/app/morphe/extension/pinedrama/feedfilter/TakoAiFilter.java")
        assertTrue("could not find TakoAiFilter.java from ${File(".").absolutePath}", extension.isFile)
        val compared = Regex("COMMENT_TOP_BAR_BRIDGE\\s*=\\s*\"([A-Za-z0-9_]+)\"").find(extension.readText())?.groupValues?.get(1)
        assertEquals("the class name the extension compares is the bridge the patch pins",
            TAKO_COMMENT_TOP_BAR_BRIDGE.substringAfterLast('/').removeSuffix(";"), compared)

        val apks = fixtures()
        for (apk in apks) {
            val container = Fixtures.dexContainer(apk, Opcodes.getDefault())
            val wanted = setOf(COMMENT_TOP_BAR_BRIDGE_BASE, TAKO_COMMENT_TOP_BAR_BRIDGE)
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
            val gates = classes.getValue(COMMENT_TOP_BAR_BRIDGE_BASE).methods.filter(::isCommentTopBarCanShow)
            assertEquals("${apk.name}: bridge base canShow", 1, gates.size)
            val body = gates.single().implementation!!
            // this plus five parameters; the guard writes its answer to v0.
            assertTrue("${apk.name}: the bridge base's canShow has no local for the guard",
                body.registerCount - 6 >= 1)
        }
    }

    /**
     * Issue #142. The quick favorites popup is shown through TikTok's call interceptor, so its
     * show carries the abstract base's name and "show", and returns normally, which is where the
     * extension is handed the popup. 47.4.3 has one show, a lambda keeping the popup it builds
     * in a static Dialog field. Older builds had a horizontal and a vertical popup, each showing
     * itself.
     */
    @Test
    fun `quick favorites popup show and its popup resolve on every retained fixture`() {
        val apks = fixtures()
        for (apk in apks) {
            val container = Fixtures.dexContainer(apk, Opcodes.getDefault())
            val classes = container.dexEntryNames.asSequence()
                .flatMap { container.getEntry(it)!!.dexFile.classes.asSequence() }.toList()
            val byType = classes.associateBy { it.type }
            val shows = classes.flatMap { classDef ->
                classDef.methods.filter { it.isQuickFavoritePanelShow() }.map { classDef to it }
            }
            assertEquals("${apk.name}: quick favorites shows ${shows.map { it.first.type }}", 1, shows.size)
            val (owner, show) = shows.single()
            assertFalse("${apk.name}: the show is the lambda, not the popup", isDialog(owner.type) { byType[it] })
            val field = show.quickFavoritePanelField { byType[it] }
            assertNotNull("${apk.name}: ${owner.type}->${show.name} keeps one popup", field)
            assertTrue("${apk.name}: the lambda stores the popup it builds",
                show.implementation!!.instructions.any {
                    it.opcode == Opcode.SPUT_OBJECT &&
                        ((it as ReferenceInstruction).reference as? FieldReference)?.toString() == field!!.toString()
                })
            assertTrue("${apk.name}: ${owner.type}->${show.name} never returns",
                show.implementation!!.instructions.any { it.opcode == Opcode.RETURN_VOID })
        }
    }

    @Test
    fun `bottom search banner model and native component key survive every retained fixture`() {
        val apks = fixtures()
        for (apk in apks) {
            val container = Fixtures.dexContainer(apk, Opcodes.getDefault())
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
    fun `location affiliate disclosure uses the same named contract on every fixture`() {
        val apks = fixtures()
        val model = "Lcom/ss/android/ugc/aweme/feed/model/"
        val expectedClasses = listOf("Aweme", "ContentModel", "StandardBusinessModel", "LocalAllianceInfo")
        for (apk in apks) {
            val container = Fixtures.dexContainer(apk, Opcodes.getDefault())
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

    /**
     * AdsFilter.isPseudoAd reads the commerce struct by name. PineDrama's own AwemeExtKt.isPseudoAd
     * has to read exactly those three members on every build, or the two tests have drifted apart.
     * Its shape is pinned too: each read returns false early, so only the flag and the ad data
     * together make a pseudo ad, which is how AdsFilter combines them.
     */
    @Test
    fun `pseudo ad check reads the members PineDrama's own isPseudoAd reads on every fixture`() {
        val model = "Lcom/ss/android/ugc/aweme/feed/model/"
        val commerce = "Lcom/ss/android/ugc/aweme/commerce/AwemeCommerceStruct;"
        for (apk in fixtures()) {
            val container = Fixtures.dexContainer(apk, Opcodes.getDefault())
            val check = container.dexEntryNames.asSequence()
                .flatMap { container.getEntry(it)!!.dexFile.classes.asSequence() }
                .single { it.type == "${model}AwemeExtKt;" }
                .methods.single { it.name == "isPseudoAd" && it.parameterTypes == listOf("${model}Aweme;") }
            assertEquals("${apk.name}: PineDrama's pseudo ad test", listOf(
                "${model}Aweme;->getCommerceVideoAuthInfo()$commerce",
                "$commerce->isPseudoAd()Z",
                "$commerce->getPseudoAdData()${model}AwemeRawAd;",
            ), check.implementation!!.instructions.filterIsInstance<ReferenceInstruction>().map { it.reference.toString() })
            assertEquals("${apk.name}: PineDrama's pseudo ad test needs both signals", listOf(
                "invoke-virtual", "move-result-object", "const/4", "if-nez", "return",
                "invoke-virtual", "move-result", "if-nez", "return",
                "invoke-virtual", "move-result-object", "if-nez", "return",
                "const/4", "return",
            ), check.implementation!!.instructions.map { it.opcode.name })
        }
    }

    /**
     * Drop the animated image cache turns the frame preparer off and leaves PineDrama's own caching
     * strategy alone (#100, #130). On every declared build the factory has to be one method that
     * calls one backend builder whose preparer gate nothing jumps to directly.
     */
    @Test
    fun `animated image cache factory keeps one shape on every declared build`() {
        for (apk in Fixtures.declared()) {
            val container = Fixtures.dexContainer(apk, Opcodes.getDefault())
            val classes = container.dexEntryNames.asSequence()
                .flatMap { container.getEntry(it)!!.dexFile.classes.asSequence() }.toList()
            val factories = classes.flatMap { cls ->
                cls.methods.filter { app.morphe.patches.pinedrama.misc.optimizer.AnimatedDrawableFactoryFingerprint.takes(it, cls) }
            }
            assertEquals("${apk.name}: animated drawable factories", 1, factories.size)
            val factory = factories.single()
            val call = requireNotNull(factory.backendBuilderCall()) { "${apk.name}: backend builder call" }
            val builder = classes.single { it.type == factory.definingClass }.methods.single {
                it.name == call.name && it.parameterTypes.map(CharSequence::toString) == call.parameterTypes.map(CharSequence::toString) && it.returnType == call.returnType
            }
            assertTrue("${apk.name}: frame preparer gate", builder.framePreparerGateIndex() != null)
        }
    }

    /**
     * Show engagement rate hooks the profile grid adapter's bind right after the cell's view count
     * is formatted, and hands the extension the text and the cell's Aweme. One bind per declared
     * build, the item in the register its statistics were asked of, and the text the one the
     * cell's next setText writes (v1 and v12 on all three builds).
     */
    @Test
    fun `profile grid view count site resolves on every declared build`() {
        Fixtures.forEachDeclared { apk ->
            val container = Fixtures.dexContainer(apk, Opcodes.getDefault())
            val classes = container.dexEntryNames.asSequence()
                .flatMap { container.getEntry(it)!!.dexFile.classes.asSequence() }.toList()
            val binds = classes.flatMap { cls -> cls.methods.filter { ProfileGridBindFingerprint.takes(it, cls) } }
            assertEquals("profile grid binds", 1, binds.size)
            val bind = binds.single()
            val site = runCatching { bind.gridCountSite() }.getOrElse { throw AssertionError(it.message, it) }
            assertEquals("text and item registers", 11 to 10, site.textRegister to site.itemRegister)
            val instructions = bind.implementation!!.instructions.toList()
            val result = instructions[site.insertAt - 1]
            assertEquals(Opcode.MOVE_RESULT_OBJECT, result.opcode)
            assertEquals(site.textRegister, (result as OneRegisterInstruction).registerA)
            val setText = (site.insertAt until instructions.size).first {
                val reference = (instructions[it] as? ReferenceInstruction)?.reference as? MethodReference
                reference?.name == "setText" && reference.parameterTypes.map(CharSequence::toString) == listOf("Ljava/lang/CharSequence;")
            }
            assertEquals("the cell's text is the formatted count", site.textRegister,
                (instructions[setText] as FiveRegisterInstruction).registerD)
        }
    }

    /**
     * The grid cell holder's bind, which set the count on another creator's Videos tab, Favorites
     * and Liked on the S22 with 47.1.4: one bind per declared build, the item in the parameter register its statistics
     * are read from (v15), and two count sites (the plain cell and the pinned or scheduled one),
     * each text the one the next setText writes.
     */
    @Test
    fun `profile grid holder view count sites resolve on every declared build`() {
        Fixtures.forEachDeclared { apk ->
            val container = Fixtures.dexContainer(apk, Opcodes.getDefault())
            val classes = container.dexEntryNames.asSequence()
                .flatMap { container.getEntry(it)!!.dexFile.classes.asSequence() }.toList()
            val binds = classes.flatMap { cls -> cls.methods.filter { ProfileGridHolderBindFingerprint.takes(it, cls) } }
            assertEquals("grid holder binds", 1, binds.size)
            val bind = binds.single()
            val found = runCatching { bind.holderCountSites() }.getOrElse { throw AssertionError(it.message, it) }
            assertEquals("item register", 15, found.itemRegister)
            assertEquals("count sites", 2, found.sites.size)
            assertTrue("highest first", found.sites.zipWithNext().all { (a, b) -> a.insertAt > b.insertAt })
            val instructions = bind.implementation!!.instructions.toList()
            val thisRegister = bind.implementation!!.registerCount - bind.parameters.size - 1
            val views = found.sites.map { site ->
                val setText = (site.insertAt until instructions.size).first {
                    val reference = (instructions[it] as? ReferenceInstruction)?.reference as? MethodReference
                    reference?.name == "setText" && reference.parameterTypes.map(CharSequence::toString) == listOf("Ljava/lang/CharSequence;")
                }
                val call = instructions[setText] as FiveRegisterInstruction
                assertEquals("the cell's text is the formatted count", site.textRegister, call.registerD)
                // The view is the holder's own count field, read right before the call.
                val load = instructions[setText - 1]
                assertEquals("count view load", Opcode.IGET_OBJECT, load.opcode)
                assertEquals("count view register", call.registerC, (load as TwoRegisterInstruction).registerA)
                assertEquals("count view owner", thisRegister, load.registerB)
                (load as ReferenceInstruction).reference as FieldReference
            }
            assertEquals("one count view", 1, views.toSet().size)
            assertEquals("count view class", bind.definingClass, views.first().definingClass)
            assertEquals("count view type", "Lcom/bytedance/tux/input/TuxTextView;", views.first().type)
        }
    }

    /**
     * Play SDR instead of HDR hooks PineDrama's own HDR-off answer and both player gear setters, one
     * method each. SdrPlayback counts hdrType 1 and 2 as HDR because SimBitRate.isHdr does.
     */
    @Test
    fun `SDR playback hooks land on one method each and isHdr keeps its HDR types on every fixture`() {
        val models = "Lcom/ss/android/ugc/playerkit/simapicommon/model/"
        val expected = mapOf(
            ForceHdrOffFingerprint to "Lcom/ss/android/ugc/aweme/video/simplayer/PlayerConfigImpl;->isForceHdrOff()Z",
            SimVideoSetBitRateFingerprint to "${models}SimVideo;->setBitRate(Ljava/util/List;)V",
            SimVideoUrlModelSetBitRateFingerprint to "${models}SimVideoUrlModel;->setBitRate(Ljava/util/List;)V",
        )
        for (apk in fixtures()) {
            val container = Fixtures.dexContainer(apk, Opcodes.getDefault())
            val classes = container.dexEntryNames.asSequence()
                .flatMap { container.getEntry(it)!!.dexFile.classes.asSequence() }.toList()
            for ((fingerprint, signature) in expected) {
                val taken = classes.flatMap { classDef ->
                    classDef.methods.filter { fingerprint.takes(it, classDef) }
                }
                assertEquals("${apk.name}: $signature", listOf(signature), taken.map { it.anchorSignature() })
            }
            val isHdr = classes.single { it.type == "${models}SimBitRate;" }
                .methods.single { it.name == "isHdr" && it.parameterTypes.isEmpty() }
            val instructions = isHdr.implementation!!.instructions.toList()
            assertEquals("${apk.name}: SimBitRate.isHdr literals", listOf(1, 2, 0),
                instructions.filterIsInstance<NarrowLiteralInstruction>().map { it.narrowLiteral })
            assertEquals("${apk.name}: SimBitRate.isHdr reads", List(2) { "${models}SimBitRate;->getHdrType()I" },
                instructions.filterIsInstance<ReferenceInstruction>().map { it.reference.toString() })
        }
    }

    /**
     * Prefer H.264 playback hooks both player gear setters and keeps the gears whose
     * SimBitRate.getCodecType is 0. That getter has to return the field a converter fills from the
     * feed's is_bytevc1 (0 H.264, 1 ByteVC1, 2 ByteVC2), and the patch's own shape checks have to
     * pass, on every declared build.
     */
    @Test
    fun `H264 playback hooks the gear setters and getCodecType reads is_bytevc1 on every declared build`() {
        val models = "Lcom/ss/android/ugc/playerkit/simapicommon/model/"
        val bitRate = "Lcom/ss/android/ugc/aweme/feed/model/BitRate;"
        val expected = mapOf(
            SimVideoSetBitRateFingerprint to "${models}SimVideo;->setBitRate(Ljava/util/List;)V",
            SimVideoUrlModelSetBitRateFingerprint to "${models}SimVideoUrlModel;->setBitRate(Ljava/util/List;)V",
        )
        Fixtures.forEachDeclared { apk ->
            val container = Fixtures.dexContainer(apk, Opcodes.getDefault())
            val classes = container.dexEntryNames.asSequence()
                .flatMap { container.getEntry(it)!!.dexFile.classes.asSequence() }.toList()
            for ((fingerprint, signature) in expected) {
                val taken = classes.flatMap { classDef ->
                    classDef.methods.filter { fingerprint.takes(it, classDef) }
                }
                assertEquals(signature, listOf(signature), taken.map { it.anchorSignature() })
                requirePlayerGearSetter(taken.single())
            }

            val byType = classes.associateBy { it.type }
            val codec = requireGearCodecField { byType[it] }
            fun Method.fieldReads() = implementation!!.instructions
                .mapNotNull { ((it as? ReferenceInstruction)?.reference as? FieldReference)?.toString() }.toList()
            val gear = byType.getValue(SIM_BIT_RATE)
            assertEquals("SimBitRate.isBytevc1 reads the codec field", listOf(codec.toString()),
                gear.methods.single { it.name == "isBytevc1" && it.parameterTypes.isEmpty() }.fieldReads())

            // The feed model's is_bytevc1 is the field its isBytevc1() returns.
            val feedField = byType.getValue(bitRate).fields.single { field ->
                field.annotations.any { annotation ->
                    annotation.elements.any { (it.value as? StringEncodedValue)?.value == "is_bytevc1" }
                }
            }
            assertEquals("I", feedField.type)
            assertEquals(listOf("$bitRate->${feedField.name}:I"),
                byType.getValue(bitRate).methods.single { it.name == "isBytevc1" && it.parameterTypes.isEmpty() }
                    .fieldReads())

            // And a converter hands BitRate.isBytevc1() straight to the gear's codec setter.
            val feedCodec = "$bitRate->isBytevc1()I"
            val gearCodec = setOf("$SIM_BIT_RATE->setCodecType(I)V", "$SIM_BIT_RATE->setBytevc1(I)V")
            val converters = classes.flatMap { it.methods }.filter { method ->
                val instructions = method.implementation?.instructions?.toList() ?: return@filter false
                instructions.indices.any { index ->
                    val read = (instructions[index] as? ReferenceInstruction)?.reference?.toString() == feedCodec
                    val result = instructions.getOrNull(index + 1) as? OneRegisterInstruction
                    read && result != null && result.opcode == Opcode.MOVE_RESULT &&
                        instructions.drop(index + 2).firstOrNull { it.opcode.name.startsWith("invoke") }?.let { call ->
                            (call as ReferenceInstruction).reference.toString() in gearCodec &&
                                (call as FiveRegisterInstruction).registerD == result.registerA
                        } == true
                }
            }
            assertTrue("no converter copies BitRate.isBytevc1 into a gear's codec", converters.isNotEmpty())
        }
    }

    /**
     * ContentMarkerFilters.aiSignal reads each AI marker by name, getter first and field second.
     * Every one it relies on has to be there on every declared build, in the shape it reads:
     * a no-argument getter or a field of that name.
     */
    @Test
    fun `every AI filter signal resolves on every declared build`() {
        val model = "Lcom/ss/android/ugc/aweme/feed/model/"
        val wanted = mapOf(
            "${model}Aweme;" to listOf(
                "getAigcInfo", "getModerationAigcInfo", "getC2paInfo", "getAiAliveInfo", "aiRemixInfo",
                "aiPortraitInfo", "aiTheaterInfo", "aiChatEditorInfo", "getAnchors", "getTextExtra",
                "getDesc", "getAid",
            ),
            "Lcom/ss/android/ugc/aweme/feed/AIGCInfo;" to listOf("getAIGCLabelType", "createByAI"),
            "${model}ModerationAigcInfo;" to listOf(
                "moderationAigcLabelType", "moderationUserLabelStatus", "creatorGuidanceStatus",
                "moderationCreatorSegment",
            ),
            "${model}C2PAInfo;" to listOf("aigcSrc", "firstAigcSrc", "lastAigcSrc"),
            "${model}AIAliveInfo;" to listOf("getModelKey", "getModelPrompt", "getText"),
            "${model}AIRemixInfo;" to listOf("getTaskId", "getPromptId"),
            "${model}AIPortraitInfo;" to listOf("getTaskId", "getPromptId"),
            "${model}AITheaterInfo;" to listOf("getTaskId", "getPromptId"),
            "${model}AiChatEditorInfo;" to listOf("getTaskId"),
            "${model}AnchorCommonStruct;" to listOf("getComponentKey"),
            "Lcom/ss/android/ugc/aweme/model/TextExtraStruct;" to listOf("getHashTagName"),
        )
        val aiAnchorKeys = setOf(
            "anchor_aigc_avatar", "anchor_ai_portrait", "anchor_ai_remix", "anchor_ai_style",
            "anchor_ai_group_shot",
        )
        Fixtures.forEachDeclared { apk ->
            val container = Fixtures.dexContainer(apk, Opcodes.getDefault())
            val classes = container.dexEntryNames.asSequence()
                .flatMap { container.getEntry(it)!!.dexFile.classes.asSequence() }
                .filter { it.type in wanted }
                .associateBy { it.type }
            for ((type, members) in wanted) {
                val classDef = classes[type] ?: throw AssertionError("$type is missing")
                val getters = classDef.methods.filter { it.parameterTypes.isEmpty() }.map { it.name }.toSet()
                val fields = classDef.fields.map { it.name }.toSet()
                assertEquals(
                    "$type: AI signal members",
                    emptyList<String>(),
                    members.filter { it !in getters && it !in fields },
                )
            }
            val aweme = classes.getValue("${model}Aweme;")
            for (name in listOf("aiRemixInfo", "aiPortraitInfo", "aiTheaterInfo", "aiChatEditorInfo")) {
                assertTrue("Aweme.$name is a struct field", aweme.fields.any { it.name == name && it.type.startsWith(model) })
            }
            val loaded = container.dexEntryNames.asSequence()
                .flatMap { container.getEntry(it)!!.dexFile.classes.asSequence() }
                .flatMap { it.methods.asSequence() }
                .flatMap { it.stringConstants().asSequence() }
                .filter { it in aiAnchorKeys }
                .toSet()
            assertEquals("AI effect anchor keys", aiAnchorKeys, loaded)
        }
    }

    /**
     * Hide subscriber-only videos (#219) asks Aweme.isSubOnlyVideo() by name, so a build that
     * drops or renames the getter would quietly hide nothing.
     */
    @Test
    fun `the subscriber-only flag resolves on every declared build`() {
        val awemeType = "Lcom/ss/android/ugc/aweme/feed/model/Aweme;"
        Fixtures.forEachDeclared { apk ->
            val container = Fixtures.dexContainer(apk, Opcodes.getDefault())
            val aweme = container.dexEntryNames.asSequence()
                .flatMap { container.getEntry(it)!!.dexFile.classes.asSequence() }
                .firstOrNull { it.type == awemeType } ?: throw AssertionError("$awemeType is missing")
            assertTrue(
                "Aweme.isSubOnlyVideo()Z is missing",
                aweme.methods.any { it.name == "isSubOnlyVideo" && it.parameterTypes.isEmpty() && it.returnType == "Z" },
            )
        }
    }

    /**
     * Match text stickers too reads Aweme's sticker list and each sticker's type and textStruct.
     * PineDrama's own translation service is what says a type 18 sticker's textStruct is its words:
     * it checks the type against 18 before it reads the string; type 5 keeps anchor JSON there.
     */
    @Test
    fun `text sticker members the sticker word rule reads resolve on every declared build`() {
        val aweme = "Lcom/ss/android/ugc/aweme/feed/model/Aweme;"
        val sticker = "Lcom/ss/android/ugc/aweme/sticker/data/InteractStickerStruct;"
        val translation = "Lcom/ss/android/ugc/aweme/translation/service/TranslationServiceImpl;"
        val textModel = "Lcom/ss/android/ugc/aweme/tools/sticker/core/text/model/TextStickerModel;"
        Fixtures.forEachDeclared { apk ->
            val container = Fixtures.dexContainer(apk, Opcodes.getDefault())
            val classes = container.dexEntryNames.asSequence()
                .flatMap { container.getEntry(it)!!.dexFile.classes.asSequence() }
                .filter { it.type == aweme || it.type == sticker || it.type == translation || it.type == textModel }
                .associateBy { it.type }
            for ((type, name, returns) in listOf(
                Triple(aweme, "getInteractStickerStructs", "Ljava/util/List;"),
                Triple(sticker, "getType", "I"),
                Triple(sticker, "getTextStruct", "Ljava/lang/String;"),
            )) {
                assertTrue("${apk.name}: $type.$name()$returns", classes[type]?.methods?.toList().orEmpty().any {
                    it.name == name && it.parameterTypes.isEmpty() && it.returnType == returns
                })
            }
            val readsTextStickerWords = classes[translation]?.methods?.toList().orEmpty().any { method ->
                val instructions = method.implementation?.instructions?.toList().orEmpty()
                fun calls(name: String) = instructions.any {
                    val reference = (it as? ReferenceInstruction)?.reference as? MethodReference
                    reference != null && reference.definingClass == sticker && reference.name == name
                }
                calls("getType") && calls("getTextStruct") && instructions.any {
                    it.opcode == Opcode.CONST_16 && (it as NarrowLiteralInstruction).narrowLiteral == 18
                }
            }
            assertTrue("${apk.name}: the translation service reads a type 18 sticker's textStruct", readsTextStickerWords)
            // The editor writes the typed text into textStruct as type 20 with a caption model, else 18.
            val written = classes[textModel]?.methods?.toList().orEmpty().singleOrNull { it.name == "getInteractStickerStruct" }
            val instructions = written?.implementation?.instructions?.toList().orEmpty()
            val literals = instructions.filter { it.opcode == Opcode.CONST_16 }
                .map { (it as NarrowLiteralInstruction).narrowLiteral }.toSet()
            assertTrue("${apk.name}: the editor's text sticker types $literals", literals.containsAll(setOf(18, 20)))
            assertTrue("${apk.name}: the editor writes textStruct", instructions.any {
                val reference = (it as? ReferenceInstruction)?.reference as? MethodReference
                reference != null && reference.definingClass == sticker && reference.name == "setTextStruct"
            })
        }
    }

    @Test
    fun `main feed items getter exists once on every fixture`() {
        val apks = fixtures()

        for (apk in apks) {
            val matches = mutableListOf<Method>()
            val container = Fixtures.dexContainer(apk, Opcodes.getDefault())
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
            val container = Fixtures.dexContainer(apk, Opcodes.getDefault())
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

            val container = Fixtures.dexContainer(apk, Opcodes.getDefault())
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
                            storeCount in 1..4
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

            // What calls both cache methods: the cold start's orchestrator, which the patch hooks
            // too. Up to 47.0.3 the golden method ran the cold start itself, a shape the patch no
            // longer takes, so only a declared build is held to it.
            if (Fixtures.versionOf(apk) !in Fixtures.declaredVersions()) continue
            val targets = setOf(goldenCache.single().coldStartCall(), offlineCache.single().coldStartCall())
            val calls = container.dexEntryNames.asSequence()
                .flatMap { container.getEntry(it)!!.dexFile.classes.asSequence() }
                .flatMap { it.methods.asSequence() }
                .mapNotNull { method ->
                    val called = method.implementation?.instructions
                        ?.mapNotNull { (it as? ReferenceInstruction)?.reference as? MethodReference }
                        ?.map { "${it.definingClass}->${it.name}(${it.parameterTypes.joinToString("")})${it.returnType}" }
                        ?.filter { it in targets }?.toSet().orEmpty()
                    if (called.isEmpty()) null else method to called
                }.toMap()
            val orchestrators = coldStartOrchestrators(goldenCache.single(), offlineCache.single(), calls)
            assertEquals("${apk.name}: cold-start orchestrators", 1, orchestrators.size)
            val coldMethods = (goldenCache + offlineCache + orchestrators).distinctBy { it.anchorSignature() }
            assertEquals(
                "${apk.name}: cold-cache FeedItemList stores",
                COLD_START_STORES,
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

    private fun fixtures(): List<File> = Fixtures.apks()
}
