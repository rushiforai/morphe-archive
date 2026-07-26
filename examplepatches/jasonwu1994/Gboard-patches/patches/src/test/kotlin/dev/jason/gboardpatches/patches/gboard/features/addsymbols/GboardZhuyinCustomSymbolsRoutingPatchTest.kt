package dev.jason.gboardpatches.patches.gboard.features.addsymbols

import org.junit.Assert.assertFalse
import org.junit.Assert.assertTrue
import org.junit.Test
import java.nio.file.Files
import java.nio.file.Path

class GboardZhuyinCustomSymbolsRoutingPatchTest {
    @Test
    fun `footer tab click consumer shape accepts expected footer lambda`() {
        val shape = FooterTabClickConsumerShape(
            scrollableNavigationFieldCount = 1,
            acceptReadsScrollableNavigationField = true,
            acceptCallsScrollableNavigationView = true
        )

        assertTrue(isValidFooterTabClickConsumerShape(shape))
    }

    @Test
    fun `footer tab click consumer shape rejects consumer without navigation field read`() {
        val shape = FooterTabClickConsumerShape(
            scrollableNavigationFieldCount = 1,
            acceptReadsScrollableNavigationField = false,
            acceptCallsScrollableNavigationView = true
        )

        assertFalse(isValidFooterTabClickConsumerShape(shape))
    }

    @Test
    fun `footer tab click consumer shape rejects drifted class with multiple navigation fields`() {
        val shape = FooterTabClickConsumerShape(
            scrollableNavigationFieldCount = 2,
            acceptReadsScrollableNavigationField = true,
            acceptCallsScrollableNavigationView = true
        )

        assertFalse(isValidFooterTabClickConsumerShape(shape))
    }

    @Test
    fun `routing patch uses only Gboard 1777 helper descriptors`() {
        val source = readPatch("GboardZhuyinCustomSymbolsRoutingPatch.kt")
        val required = listOf(
            "private const val PROVIDER_RECEIVER_WRAPPER_CLASS = \"Loef;\"",
            "private const val METRICS_UTILS_CLASS = \"Lhhs;\"",
            "private const val FOOTER_TAB_CLICK_CONSUMER_CLASS = \"Lgar;\"",
            "private const val KEYBOARD_WRAPPER_CLASS = \"Lnvd;\"",
            "parameterTypes = listOf(\"Lovf;\", \"Lodx;\", \"Lout;\")",
            "returnType = \"Lodx;\"",
            "parameterTypes = listOf(\"Lovf;\", \"Lout;\")",
            "parameterTypes = listOf(\"Lovf;\")",
            "returnType = \"Lvtk;\"",
            "\"Landroid/view/inputmethod/EditorInfo;\"",
            "parameterTypes = listOf(\"Lodx;\", \"Lout;\", \"Lovf;\")",
            "check-cast p1, Lovf;",
            "check-cast p0, Lovf;",
            "check-cast p2, Lovf;",
        )
        required.forEach { descriptor ->
            assertTrue("Missing Gboard 17.7.7 routing descriptor: $descriptor", source.contains(descriptor))
        }

        listOf("Lniu;", "Lgsr;", "Lfsk;", "Lmzu;", "Lnzd;", "Lnim;", "Lnyt;", "Lunq;")
            .forEach { descriptor ->
                assertFalse("Stale Gboard 17.0.10 routing descriptor remains: $descriptor", source.contains(descriptor))
            }
    }

    @Test
    fun `custom symbols patch set uses Gboard 1777 corpus body history and recycler descriptors`() {
        val entry = readPatch("GboardZhuyinCustomSymbolsEntryPatch.kt")
        assertTrue(entry.contains("GboardVersionBindings.softKeyBind"))
        assertTrue(entry.contains("check-cast p1, \$softKeyMetadataType"))
        assertFalse(entry.contains("Loaa;"))

        val corpus = readPatch("GboardZhuyinCustomSymbolsCorpusPatch.kt")
        assertTrue(corpus.contains("private const val EXPRESSION_CORPUS_MANAGER_CLASS = \"Lgan;\""))
        assertTrue(corpus.contains("returnType = \"Lvai;\""))
        assertFalse(corpus.contains("Lfsg;"))
        assertFalse(corpus.contains("Ltvg;"))

        val state = readPatch("GboardZhuyinCustomSymbolsEmoticonStatePatch.kt")
        listOf(
            "private const val EMOTICON_HEADER_CALLBACK_CLASS = \"Lfpu;\"",
            "private const val VIEW_UTIL_CLASS = \"Lsav;\"",
            "\"Lody;\"",
            "\"Lout;\"",
            "\"Lcom/google/android/libraries/inputmethod/metadata/ImeDef;\"",
            "\"Lovf;\"",
            "name = \"ey\"",
            "\"Lovk;\"",
            "name = \"l\"",
            "name = \"k\"",
            "parameterTypes = listOf(\"Lvai;\")",
            "name = \"D\"",
            "name = \"y\"",
            "parameterTypes = listOf(\"Lfrg;\")",
        ).forEach { descriptor ->
            assertTrue("Missing Gboard 17.7.7 state descriptor: $descriptor", state.contains(descriptor))
        }
        assertTrue(state.contains("private fun patchConstructor()"))
        assertTrue(state.contains("mutableMethod.instructionIndices(\"RETURN_VOID\")"))
        assertFalse(state.contains("val superConstructorIndex"))

        val history = readPatch("GboardZhuyinCustomSymbolsHistoryPatch.kt")
        assertTrue(history.contains("private const val EMOTICON_ITEM_CLICK_CONSUMER_CLASS = \"Liju;\""))
        assertTrue(history.contains("private const val EMOTICON_HISTORY_MANAGER_CLASS = \"Lfsr;\""))
        assertTrue(history.contains("private const val EMOTICON_HISTORY_FIELD = \"c\""))
        assertTrue(history.contains("interceptHistoryWrite"))
        assertFalse(history.contains("clickMethod.instructionIndices(\"RETURN_VOID\")"))

        val recycler = readPatch("GboardZhuyinCustomSymbolsRecyclerPatch.kt")
        listOf(
            "private const val BASE_RECYCLER_ADAPTER_CLASS = \"Ljn;\"",
            "private const val EMOTICON_RECYCLER_ADAPTER_CLASS = \"Lils;\"",
            "\"Lily;\"",
            "parameterTypes = listOf(\"Lkl;\", \"I\")",
            "name = \"gp\"",
            "returnType = \"Lkl;\"",
            "check-cast v0, Lkl;",
        ).forEach { descriptor ->
            assertTrue("Missing Gboard 17.7.7 recycler descriptor: $descriptor", recycler.contains(descriptor))
        }
        assertTrue(recycler.contains("mutableMethod.instructionIndices(\"RETURN_VOID\")"))
        assertFalse(recycler.contains("val superConstructorIndex"))
    }

    @Test
    fun `emoticon constructor callback never reads stock reused p5 register`() {
        val state = readPatch("GboardZhuyinCustomSymbolsEmoticonStatePatch.kt")
        val runtime = readExtensionRuntime()
        val delegate = state.substringAfter("private val CONSTRUCTOR_DELEGATE")
            .substringBefore("private val BODY_READY_DELEGATE")

        assertTrue(delegate.contains(
            "invoke-static {p0}, Ldev/jason/gboardpatches/extension/addsymbols/" +
                "GboardAddSymbolsRuntime;->onEmoticonKeyboardConstructed(Ljava/lang/Object;)V",
        ))
        assertFalse(delegate.contains("p5"))
        assertTrue(runtime.contains(
            "public static void onEmoticonKeyboardConstructed(Object keyboard)",
        ))
        assertFalse(runtime.contains(
            "onEmoticonKeyboardConstructed(Object keyboard, Object keyboardType)",
        ))
    }

    @Test
    fun `body ready delegate stays on keyboard receiver before normal branch clobbers p0`() {
        val targetFixture = listOf(
            "iput-object p2, p0, EmoticonKeyboardM2.r:ViewGroup",
            "const p0, 0x7f0b02d8",
            "invoke-virtual p1, p0, SoftKeyboardView.findViewById",
            "move-result-object p0",
            "return-void",
        )
        val bodyFieldWriteIndex = targetFixture.indexOfFirst {
            it.contains("EmoticonKeyboardM2.r:ViewGroup")
        }
        val receiverClobberIndex = targetFixture.indexOfFirst { it.startsWith("const p0") }

        assertTrue(bodyFieldWriteIndex >= 0)
        assertTrue(receiverClobberIndex > bodyFieldWriteIndex)

        val source = readPatch("GboardZhuyinCustomSymbolsEmoticonStatePatch.kt")
        assertTrue(source.contains("name = \"r\""))
        assertTrue(source.contains("type = \"Landroid/view/ViewGroup;\""))
        assertTrue(source.contains("opcodeName = \"IPUT_OBJECT\""))
        assertTrue(source.contains("bodyReadyFieldWriteIndex + 1"))
        assertTrue(source.contains("invoke-static {p0},"))
        assertFalse(source.contains(
            "returnIndices.sortedDescending().forEach { returnIndex ->\n" +
                "        mutableMethod.addInstructions(returnIndex, BODY_READY_DELEGATE)",
        ))
    }

    @Test
    fun `thrown header callback cannot leak custom adapter construction into stock adapter`() {
        val targetFixture = listOf(
            "move-object v1, v0",
            "check-cast v1, EmoticonKeyboardM2",
            "iget-object p0, p0, Lfpu.a:Object",
            "invoke-virtual {v1, p1, v5}, EmoticonKeyboardM2.D(II)V",
            "return-void",
        )
        val receiverCallIndex = targetFixture.indexOfFirst {
            it.contains("EmoticonKeyboardM2.D(II)V")
        }
        assertTrue(receiverCallIndex > 0)
        assertTrue(targetFixture.take(receiverCallIndex).any { it.startsWith("iget-object p0") })

        val state = readPatch("GboardZhuyinCustomSymbolsEmoticonStatePatch.kt")
        val recycler = readPatch("GboardZhuyinCustomSymbolsRecyclerPatch.kt")
        val runtime = readExtensionRuntime()

        assertFalse(state.contains("HEADER_CALLBACK_BEFORE_DELEGATE"))
        assertTrue(state.contains("indexOfMethodCallOrThrow("))
        assertTrue(state.contains("name = \"D\""))
        assertTrue(state.contains("HEADER_CALLBACK_DELEGATE.format(headerReceiverRegister)"))
        val headerDelegate = state.substringAfter("private val HEADER_CALLBACK_DELEGATE")
            .substringBefore("private val HEADER_START_EDGE_GUARD_DELEGATE")
        assertTrue(headerDelegate.contains("invoke-static {%s},"))
        assertFalse(headerDelegate.contains("invoke-static {p0},"))
        assertTrue(recycler.contains(
            "onEmoticonRecyclerAdapterConstructed(Ljava/lang/Object;Ljava/lang/Object;)V",
        ))
        assertTrue(recycler.contains("invoke-static {p0, p3},"))
        assertFalse(runtime.contains("ACTIVE_CUSTOM_EMOTICON_HEADER_CALLBACK_RECEIVER"))
        assertFalse(runtime.contains("CUSTOM_EMOTICON_ADAPTER_CONSTRUCTION"))
        assertFalse(runtime.contains("onHeaderCallbackBefore("))
    }

    @Test
    fun `thrown item click cannot leak custom history state into stock history`() {
        val targetFixture = listOf(
            "move-object/from16 v1, p1",
            "iget-object v3, v0, EmoticonKeyboardM2.c:Lfsr;",
            "invoke-virtual {v3, v4}, Lfsr;->c(Ljava/lang/String;)V",
            "new-instance v3, Loud",
            "sget-object v5, Lowd.a:Lviq;",
            "return-void",
        )
        val historyCallIndex = targetFixture.indexOfFirst { it.contains("Lfsr;->c") }
        assertTrue(historyCallIndex > 0)
        assertTrue(targetFixture.take(historyCallIndex).any { it.contains("v1, p1") })
        assertFalse(targetFixture.drop(historyCallIndex + 1).any { it.contains("p1") })
        assertTrue(targetFixture.drop(historyCallIndex + 1).first { it.contains("v5") }
            .startsWith("sget-object v5"))

        val history = readPatch("GboardZhuyinCustomSymbolsHistoryPatch.kt")
        val runtime = readExtensionRuntime()
        assertTrue(history.contains("EMOTICON_KEYBOARD_CLASS"))
        assertTrue(history.contains("EMOTICON_HISTORY_FIELD"))
        assertTrue(history.contains("move-result p1"))
        assertTrue(history.contains("if-nez p1, :jasondev_history_handled"))
        assertTrue(history.contains("move-object/from16 v5, p0"))
        assertTrue(history.contains("invoke-static {v5, %s, %s}"))
        assertFalse(history.contains("invoke-static {p0, %s, %s}"))
        assertFalse(history.contains("clickMethod.addInstructions(0, ITEM_CLICK_DELEGATE)"))
        assertFalse(history.contains("ITEM_CLICK_FINISH_DELEGATE"))
        assertFalse(runtime.contains("ACTIVE_CUSTOM_EMOTICON_HISTORY_WRITE_KEYBOARD"))
        assertFalse(runtime.contains("onEmoticonItemClick("))
        assertFalse(runtime.contains("onEmoticonItemClickFinished("))
        assertTrue(runtime.contains("public static boolean interceptHistoryWrite("))
        assertTrue(runtime.contains("Object consumer, Object historyManager, String symbol)"))
    }

    private fun readPatch(fileName: String): String = Files.readString(
        Path.of("src/main/kotlin/dev/jason/gboardpatches/patches/gboard/features/addsymbols/$fileName")
    )

    private fun readExtensionRuntime(): String = Files.readString(
        Path.of(
            "../extensions/extension/src/main/java/dev/jason/gboardpatches/extension/" +
                "addsymbols/GboardAddSymbolsRuntime.java",
        ),
    )
}
