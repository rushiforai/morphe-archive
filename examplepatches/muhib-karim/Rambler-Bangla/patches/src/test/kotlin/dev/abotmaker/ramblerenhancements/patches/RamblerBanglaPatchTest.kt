package dev.abotmaker.ramblerenhancements.patches

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Assert.fail
import org.junit.Test

class RamblerBanglaPatchTest {
    private val stockHinglishRule =
        "\n3. Hinglish Override: For any combination of Indian languages (e.g., Hindi, Bengali, Marathi, Kannada, etc.) and English, override all native script defaults. Transcribe and edit exclusively in Romanized script (Hinglish/Banglish). Example: Use \"Aap kaise ho?\" instead of \"\u0906\u092a \u0915\u0948\u0938\u0947 \u0939\u0948\u0902?\".\n"

    private fun escapeSmali(s: String): String =
        s.replace("\\", "\\\\").replace("\"", "\\\"").replace("\n", "\\n")

    private fun buildSynthetic1854Builder(ruleLiteral: String = stockHinglishRule) =
        ImmutableMethod(
            "Lfja;",
            "d",
            listOf(
                ImmutableMethodParameter("Ljava/lang/String;", emptySet(), null),
                ImmutableMethodParameter("Ljava/lang/String;", emptySet(), null),
            ),
            "Ljava/lang/String;",
            AccessFlags.PUBLIC.value or AccessFlags.STATIC.value,
            emptySet(),
            emptySet(),
            MutableMethodImplementation(6),
        ).toMutable().apply {
            addInstructions(
                0,
                """
                move-object v0, p0
                move-object v1, p1
                const-string v2, "{HINGLISH_OVERRIDE_RULE}"
                const-string v3, "${escapeSmali(ruleLiteral)}"
                invoke-virtual {v0, v2, v3}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;
                move-result-object v0
                const-string v2, "{ENABLED_LANGUAGES}"
                invoke-virtual {v0, v2, v1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;
                move-result-object v0
                return-object v0
                """.trimIndent(),
            )
        }

    @Test
    fun patchesGboard1854OrderAndRejectsDoublePatching() {
        val builder = buildSynthetic1854Builder()
        val targets = analyzeBanglaLiteBuilder(builder)
        assertEquals(3, targets.ruleRegister)
        assertEquals(1, targets.languagesRegister)
        assertEquals(0, targets.promptResultRegister)

        installBanglaLiteScriptHooks(targets)

        val refs = builder.implementation!!.instructions
            .mapNotNull { (it as? ReferenceInstruction)?.reference?.toString() }
        assertTrue(refs.any { it.contains("selectHinglishOverrideRule") })
        assertTrue(refs.any { it.contains("rewriteCleanupPromptScriptGate") })

        // Fail-closed on second patch attempt
        try {
            analyzeBanglaLiteBuilder(builder)
            fail("Expected double-patch attempt to fail closed")
        } catch (expected: PatchException) {
            assertTrue(expected.message.orEmpty().contains("already installed"))
        }
    }

    @Test
    fun failsClosedOnDriftedHinglishOverrideFingerprint() {
        val drifted = buildSynthetic1854Builder(stockHinglishRule + "!")
        try {
            analyzeBanglaLiteBuilder(drifted)
            fail("Expected drifted Hinglish rule fingerprint to fail closed")
        } catch (expected: PatchException) {
            assertTrue(expected.message.orEmpty().contains("FAIL-CLOSED"))
        }
    }

    @Test
    fun amoledDarkKeyboardPatchesPaletteConstructorAndIsIdempotent() {
        val ctor = ImmutableMethod(
            "Lrmt;",
            "<init>",
            listOf(
                ImmutableMethodParameter("Landroid/content/Context;", emptySet(), null),
                ImmutableMethodParameter("Z", emptySet(), null),
            ),
            "V",
            AccessFlags.PUBLIC.value or AccessFlags.CONSTRUCTOR.value,
            emptySet(),
            emptySet(),
            MutableMethodImplementation(5),
        ).toMutable().apply {
            addInstructions(
                0,
                """
                invoke-direct {p0}, Ljava/lang/Object;-><init>()V
                iput-boolean p2, p0, Lrmt;->a:Z
                const/4 v0, 0x1
                iput v0, p0, Lrmt;->P:I
                iput v0, p0, Lrmt;->Q:I
                iput v0, p0, Lrmt;->R:I
                iput v0, p0, Lrmt;->S:I
                const/4 p1, 0x0
                return-void
                """.trimIndent(),
            )
        }
        val fields = listOf("Lrmt;->P:I", "Lrmt;->Q:I", "Lrmt;->R:I", "Lrmt;->S:I")
        ctor.applyAmoledDarkPalette("Lrmt;->a:Z", fields)
        val countAfterFirst = ctor.implementation!!.instructions.size
        assertTrue(countAfterFirst > 10)
        assertTrue(
            ctor.implementation!!.instructions.any { insn ->
                ((insn as? com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction)
                    ?.reference?.toString().orEmpty()).contains("isAmoledDarkKeyboardEnabled()Z")
            },
        )
        // Second call must be idempotent
        ctor.applyAmoledDarkPalette("Lrmt;->a:Z", fields)
        assertEquals(countAfterFirst, ctor.implementation!!.instructions.size)
    }

    @Test
    fun clipboardDragReorderPatchesTouchCallbackAndIsIdempotent() {
        val rv = "Landroid/support/v7/widget/RecyclerView;"
        val vh = "Lkr;"
        val getMoveFlags = ImmutableMethod(
            "Lfqi;",
            "c",
            listOf(ImmutableMethodParameter(rv, emptySet(), null), ImmutableMethodParameter(vh, emptySet(), null)),
            "I",
            AccessFlags.PUBLIC.value or AccessFlags.FINAL.value,
            emptySet(),
            emptySet(),
            MutableMethodImplementation(4),
        ).toMutable().apply {
            addInstructions(0, "const/16 v0, 0x3030\nreturn v0")
        }
        val onChildDraw = ImmutableMethod(
            "Lfqi;",
            "e",
            listOf(
                ImmutableMethodParameter("Landroid/graphics/Canvas;", emptySet(), null),
                ImmutableMethodParameter(rv, emptySet(), null),
                ImmutableMethodParameter(vh, emptySet(), null),
                ImmutableMethodParameter("F", emptySet(), null),
                ImmutableMethodParameter("F", emptySet(), null),
                ImmutableMethodParameter("I", emptySet(), null),
                ImmutableMethodParameter("Z", emptySet(), null),
            ),
            "V",
            AccessFlags.PUBLIC.value or AccessFlags.FINAL.value,
            emptySet(),
            emptySet(),
            MutableMethodImplementation(9),
        ).toMutable().apply {
            addInstructions(0, "return-void")
        }
        val isLongPress = ImmutableMethod(
            "Lfqi;",
            "i",
            emptyList(),
            "Z",
            AccessFlags.PUBLIC.value or AccessFlags.FINAL.value,
            emptySet(),
            emptySet(),
            MutableMethodImplementation(2),
        ).toMutable().apply {
            addInstructions(0, "const/4 v0, 0x0\nreturn v0")
        }
        val onMove = ImmutableMethod(
            "Lfqi;",
            "j",
            listOf(
                ImmutableMethodParameter(rv, emptySet(), null),
                ImmutableMethodParameter(vh, emptySet(), null),
                ImmutableMethodParameter(vh, emptySet(), null),
            ),
            "Z",
            AccessFlags.PUBLIC.value or AccessFlags.FINAL.value,
            emptySet(),
            emptySet(),
            MutableMethodImplementation(5),
        ).toMutable().apply {
            addInstructions(0, "const/4 v0, 0x0\nreturn v0")
        }
        val fakeCallback = com.android.tools.smali.dexlib2.immutable.ImmutableClassDef(
            "Lfqi;",
            AccessFlags.PUBLIC.value or AccessFlags.FINAL.value,
            "Lma;",
            emptyList(),
            null,
            emptySet(),
            emptyList(),
            listOf(getMoveFlags, onChildDraw, isLongPress, onMove),
        ).let { app.morphe.patcher.util.proxy.mutableTypes.MutableClass(it) }

        val targets = ClipboardTouchCallbackTargets(
            callbackClass = fakeCallback,
            superClass = "Lma;",
            adapterFieldRef = "Lfqi;->c:Lfqn;",
            recyclerViewType = rv,
            viewHolderType = vh,
            getMovementFlagsMethod = fakeCallback.methods.single { it.name == "c" },
            onChildDrawMethod = fakeCallback.methods.single { it.name == "e" },
            isLongPressDragMethod = fakeCallback.methods.single { it.name == "i" },
            onMoveMethod = fakeCallback.methods.single { it.name == "j" },
            clearViewMethodName = "d",
            onSelectedChangedMethodName = "f",
        )
        applyClipboardDragReorder(targets)
        val methodNames = fakeCallback.methods.map { it.name }.toSet()
        assertTrue("ramblerStockMovementFlags" in methodNames)
        assertTrue("ramblerStockOnChildDraw" in methodNames)
        assertTrue("d" in methodNames)
        assertTrue("f" in methodNames)
        val countAfterFirst = fakeCallback.methods.size
        // Second call must be idempotent
        applyClipboardDragReorder(targets)
        assertEquals(countAfterFirst, fakeCallback.methods.size)
    }

    @Test
    fun atMentionLifecycleHooksPreserveCalculatorInstructionZeroAndAreIdempotent() {
        val onStart = ImmutableMethod(
            "Lphr;",
            "onStartInputView",
            listOf(
                ImmutableMethodParameter("Landroid/view/inputmethod/EditorInfo;", emptySet(), null),
                ImmutableMethodParameter("Z", emptySet(), null),
            ),
            "V",
            AccessFlags.PUBLIC.value or AccessFlags.FINAL.value,
            emptySet(),
            emptySet(),
            MutableMethodImplementation(5),
        ).toMutable().apply {
            addInstructions(
                0,
                """
                invoke-static {p0, p1}, Ldev/jason/gboardpatches/extension/incognito/GboardManualIncognitoRuntime;->onInputViewStarting(Ljava/lang/Object;Landroid/view/inputmethod/EditorInfo;)V
                return-void
                """.trimIndent(),
            )
        }
        val onUpdate = ImmutableMethod(
            "Lphr;",
            "onUpdateSelection",
            listOf("I", "I", "I", "I", "I", "I").map { ImmutableMethodParameter(it, emptySet(), null) },
            "V",
            AccessFlags.PUBLIC.value or AccessFlags.FINAL.value,
            emptySet(),
            emptySet(),
            MutableMethodImplementation(8),
        ).toMutable().apply {
            addInstructions(
                0,
                """
                invoke-direct {p0, p3, p4}, Lphr;->gboardPatchesCalculatorSelection(II)V
                return-void
                """.trimIndent(),
            )
        }
        val onHidden = ImmutableMethod(
            "Lphr;",
            "onWindowHidden",
            emptyList(),
            "V",
            AccessFlags.PUBLIC.value or AccessFlags.FINAL.value,
            emptySet(),
            emptySet(),
            MutableMethodImplementation(2),
        ).toMutable().apply {
            addInstructions(0, "return-void")
        }

        val imeClass = app.morphe.patcher.util.proxy.mutableTypes.MutableClass(
            com.android.tools.smali.dexlib2.immutable.ImmutableClassDef(
                "Lphr;",
                AccessFlags.PUBLIC.value,
                "Landroid/inputmethodservice/InputMethodService;",
                emptyList(),
                null,
                emptySet(),
                emptyList(),
                listOf(onStart, onUpdate, onHidden),
            ),
        )
        val fieldRef = "Lphr;->i:Lcom/google/android/libraries/inputmethod/inputview/InputView;"
        installAtMentionLifecycleHooksOnClass(imeClass, fieldRef)

        val updatedStart = imeClass.methods.single { it.name == "onStartInputView" }
        val startRefs = updatedStart.implementation!!.instructions
            .mapNotNull { (it as? ReferenceInstruction)?.reference?.toString() }
        // Must run AFTER Manual Incognito hook so incognito flag is already set
        assertTrue(startRefs[0].contains("GboardManualIncognitoRuntime"))
        assertTrue(startRefs[1].contains("RamblerAtMentionStripRuntime;->onInputViewStarted"))

        val updatedSel = imeClass.methods.single { it.name == "onUpdateSelection" }
        assertEquals(8, updatedSel.implementation!!.registerCount)
        val selRefs = updatedSel.implementation!!.instructions
            .mapNotNull { (it as? ReferenceInstruction)?.reference?.toString() }
        // Instruction 0 MUST stay gboardPatchesCalculatorSelection for conflict-free coexistence
        assertTrue(selRefs[0].contains("gboardPatchesCalculatorSelection"))
        assertTrue(selRefs[1].contains("ramblerBanglaAtMentionSelection"))

        // Idempotent second invocation
        val selCount = updatedSel.implementation!!.instructions.size
        installAtMentionLifecycleHooksOnClass(imeClass, fieldRef)
        assertEquals(selCount, updatedSel.implementation!!.instructions.size)
    }

    @Test
    fun nativeSuggestionStripHooksAreInstalledCleanlyAndIdempotently() {
        val tcMethod = ImmutableMethod(
            "Lpbh;",
            "K",
            listOf(ImmutableMethodParameter("Z", emptySet(), null)),
            "V",
            AccessFlags.PUBLIC.value or AccessFlags.FINAL.value,
            emptySet(),
            emptySet(),
            MutableMethodImplementation(5),
        ).toMutable().apply { addInstructions(0, "return-void") }

        val reqMethod = ImmutableMethod(
            "Lpbo;",
            "aa",
            listOf(
                ImmutableMethodParameter("I", emptySet(), null),
                ImmutableMethodParameter("Z", emptySet(), null),
            ),
            "V",
            AccessFlags.PUBLIC.value or AccessFlags.FINAL.value,
            emptySet(),
            emptySet(),
            MutableMethodImplementation(5),
        ).toMutable().apply { addInstructions(0, "return-void") }

        val evMethod = ImmutableMethod(
            "Lphr;",
            "aw",
            listOf(ImmutableMethodParameter("Lohe;", emptySet(), null)),
            "Z",
            AccessFlags.PUBLIC.value or AccessFlags.FINAL.value,
            emptySet(),
            emptySet(),
            MutableMethodImplementation(28),
        ).toMutable().apply {
            addInstructions(
                0,
                """
                const/4 v0, 0x0
                return v0
                """.trimIndent(),
            )
        }

        installNativeTextCandidatesUpdatedHook(tcMethod)
        installNativeRequestCandidatesHook(reqMethod)
        installNativeHandleEventHook(evMethod)

        val tcSize = tcMethod.implementation!!.instructions.size
        val reqSize = reqMethod.implementation!!.instructions.size
        val evSize = evMethod.implementation!!.instructions.size

        assertTrue(
            tcMethod.implementation!!.instructions
                .mapNotNull { (it as? ReferenceInstruction)?.reference?.toString() }
                .any { it.contains("RamblerAtMentionStripRuntime;->onTextCandidatesUpdated") },
        )
        assertTrue(
            reqMethod.implementation!!.instructions
                .mapNotNull { (it as? ReferenceInstruction)?.reference?.toString() }
                .any { it.contains("RamblerAtMentionStripRuntime;->trySupplyNativeCandidatesFromDelegate") },
        )
        assertTrue(
            evMethod.implementation!!.instructions
                .mapNotNull { (it as? ReferenceInstruction)?.reference?.toString() }
                .any { it.contains("RamblerAtMentionStripRuntime;->tryHandleNativeCandidateEvent") },
        )

        // Idempotent second pass
        installNativeTextCandidatesUpdatedHook(tcMethod)
        installNativeRequestCandidatesHook(reqMethod)
        installNativeHandleEventHook(evMethod)
        assertEquals(tcSize, tcMethod.implementation!!.instructions.size)
        assertEquals(reqSize, reqMethod.implementation!!.instructions.size)
        assertEquals(evSize, evMethod.implementation!!.instructions.size)
    }

    @Test
    fun ramblerBanglaLauncherIconAssetsExistAndManifestUpdatesCleanly() {
        val loader = this::class.java.classLoader
        for (relPath in RAMBLER_BANGLA_ICON_ASSET_PATHS) {
            val stream = loader.getResourceAsStream("rambler-bangla/icon/$relPath")
            assertTrue("Missing bundled Rambler Bangla icon asset: $relPath", stream != null)
            stream!!.use { assertTrue(it.readBytes().isNotEmpty()) }
        }

        val factory = javax.xml.parsers.DocumentBuilderFactory.newInstance().apply {
            isNamespaceAware = true
        }
        val doc = factory.newDocumentBuilder().parse(
            java.io.ByteArrayInputStream(
                """
                <manifest xmlns:android="http://schemas.android.com/apk/res/android" package="com.aidev2024.ramblerbangla">
                    <application android:icon="@mipmap/ic_app" android:roundIcon="@mipmap/ic_app_round" />
                </manifest>
                """.trimIndent().toByteArray(Charsets.UTF_8),
            ),
        )
        applyRamblerBanglaLauncherIconManifest(doc)
        registerSettingsActivity(doc)
        val app = doc.documentElement.getElementsByTagName("application").item(0) as org.w3c.dom.Element
        assertEquals(RAMBLER_BANGLA_LAUNCHER_ICON_REF, app.getAttributeNS(ANDROID_NS, "icon"))
        assertEquals(RAMBLER_BANGLA_LAUNCHER_ICON_REF, app.getAttributeNS(ANDROID_NS, "roundIcon"))
        val perms = doc.documentElement.getElementsByTagName("uses-permission")
        var hasInstallPerm = false
        for (i in 0 until perms.length) {
            val el = perms.item(i) as org.w3c.dom.Element
            if (el.getAttributeNS(ANDROID_NS, "name") == "android.permission.REQUEST_INSTALL_PACKAGES") {
                hasInstallPerm = true
            }
        }
        assertTrue("Manifest must include REQUEST_INSTALL_PACKAGES for in-app updater", hasInstallPerm)
    }
}
