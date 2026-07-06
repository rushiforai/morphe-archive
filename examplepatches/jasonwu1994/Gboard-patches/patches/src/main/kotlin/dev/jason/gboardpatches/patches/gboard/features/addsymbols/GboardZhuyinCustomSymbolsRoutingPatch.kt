package dev.jason.gboardpatches.patches.gboard.features.addsymbols

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import dev.jason.gboardpatches.patches.gboard.shared.findMutableMethodOrThrow
import dev.jason.gboardpatches.patches.gboard.shared.mutableClass
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val EXTENSION_MANAGER_CLASS = "Lmiu;"
private const val EMOTICON_PROVIDER_CLASS = "Lhvs;"
private const val PROVIDER_RECEIVER_WRAPPER_CLASS = "Lniu;"
private const val METRICS_UTILS_CLASS = "Lgsr;"
private const val FOOTER_TAB_CLICK_CONSUMER_CLASS = "Lfsk;"
private const val KEYBOARD_WRAPPER_CLASS = "Lmzu;"
private const val SCROLLABLE_NAVIGATION_VIEW_CLASS =
    "Lcom/google/android/apps/inputmethod/libs/expression/navbar/ScrollableNavigationView;"

internal val gboardZhuyinCustomSymbolsRoutingPatch = bytecodePatch(
    description = "移植 add-symbols 的 provider / routing / tab identity 主線。"
) {
    dependsOn(gboardZhuyinCustomSymbolsExtensionPatch)

    execute {
        patchExtensionManager()
        patchProviderRequest()
        patchProviderWrapper()
        patchMetricsAlias()
        patchNavigationIdentity()
        patchFooterTabClick()
        patchKeyboardReady()
    }
}

context(context: BytecodePatchContext)
private fun patchExtensionManager() = with(context) {
    val mutableMethod = findMutableMethodOrThrow(
        classType = EXTENSION_MANAGER_CLASS,
        name = "c",
        returnType = "Lnip;",
        parameterTypes = listOf("Lnzd;")
    )
    mutableMethod.addInstructions(0, EXTENSION_MANAGER_DELEGATE)
}

context(context: BytecodePatchContext)
private fun patchProviderRequest() = with(context) {
    val mutableMethod = findMutableMethodOrThrow(
        classType = EMOTICON_PROVIDER_CLASS,
        name = "F",
        returnType = "V",
        parameterTypes = listOf(
            "Landroid/content/Context;",
            "Lnin;",
            "Lnxy;",
            "Lnzd;",
            "Ljava/lang/String;",
            "Ljyn;",
            "Lnio;"
        )
    )
    mutableMethod.addInstructions(0, PROVIDER_REQUEST_DELEGATE)
}

context(context: BytecodePatchContext)
private fun patchProviderWrapper() = with(context) {
    val onKeyboardCreated = findMutableMethodOrThrow(
        classType = PROVIDER_RECEIVER_WRAPPER_CLASS,
        name = "a",
        returnType = "V",
        parameterTypes = listOf("Lnzd;", "Lnim;", "Lnyt;")
    )
    onKeyboardCreated.addInstructions(0, PROVIDER_WRAPPER_TYPE_DELEGATE)

    val onBeforeKeyboardCreated = findMutableMethodOrThrow(
        classType = PROVIDER_RECEIVER_WRAPPER_CLASS,
        name = "b",
        returnType = "Lnim;",
        parameterTypes = listOf("Lnzd;", "Lnyt;")
    )
    onBeforeKeyboardCreated.addInstructions(0, PROVIDER_WRAPPER_TYPE_DELEGATE)

    val canHandle = findMutableMethodOrThrow(
        classType = PROVIDER_RECEIVER_WRAPPER_CLASS,
        name = "c",
        returnType = "Z",
        parameterTypes = listOf("Lnzd;")
    )
    canHandle.addInstructions(0, PROVIDER_WRAPPER_TYPE_DELEGATE)
}

context(context: BytecodePatchContext)
private fun patchMetricsAlias() = with(context) {
    val mutableMethod = findMutableMethodOrThrow(
        classType = METRICS_UTILS_CLASS,
        name = "b",
        returnType = "Lunq;",
        parameterTypes = listOf("Lnzd;")
    )
    mutableMethod.addInstructions(0, METRICS_ALIAS_DELEGATE)
}

context(context: BytecodePatchContext)
private fun patchNavigationIdentity() = with(context) {
    val mutableMethod = findMutableMethodOrThrow(
        classType = SCROLLABLE_NAVIGATION_VIEW_CLASS,
        name = "a",
        returnType = "V",
        parameterTypes = listOf(
            "Landroid/view/inputmethod/EditorInfo;",
            "Lnzd;",
            "Z",
            "Ljava/util/function/Consumer;",
            "Landroid/os/Parcelable;",
            "Ljava/util/function/Supplier;",
            "Ljava/util/function/Supplier;"
        )
    )
    mutableMethod.addInstructions(0, NAVIGATION_IDENTITY_DELEGATE)
}

context(context: BytecodePatchContext)
private fun patchFooterTabClick() = with(context) {
    val consumerClass = mutableClass(FOOTER_TAB_CLICK_CONSUMER_CLASS)
    val mutableMethod = findMutableMethodOrThrow(
        classType = FOOTER_TAB_CLICK_CONSUMER_CLASS,
        name = "accept",
        returnType = "V",
        parameterTypes = listOf("Ljava/lang/Object;")
    )
    validateFooterTabClickConsumerOrThrow(consumerClass.fields.map { it.type }, mutableMethod)
    mutableMethod.addInstructions(0, FOOTER_TAB_CLICK_DELEGATE)
}

context(context: BytecodePatchContext)
private fun patchKeyboardReady() = with(context) {
    val mutableMethod = findMutableMethodOrThrow(
        classType = KEYBOARD_WRAPPER_CLASS,
        name = "a",
        returnType = "V",
        parameterTypes = listOf("Lnim;", "Lnyt;", "Lnzd;")
    )
    mutableMethod.addInstructions(0, KEYBOARD_READY_DELEGATE)
}

private val EXTENSION_MANAGER_DELEGATE = """
    invoke-static {p0, p1}, Ldev/jason/gboardpatches/extension/addsymbols/GboardAddSymbolsRuntime;->ensureExtensionProviderMapping(Ljava/lang/Object;Ljava/lang/Object;)V
""".trimIndent()

private val PROVIDER_REQUEST_DELEGATE = """
    move-object v2, p4

    invoke-static {p4}, Ldev/jason/gboardpatches/extension/addsymbols/GboardAddSymbolsRuntime;->rewriteProviderRequestType(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p4

    check-cast p4, Lnzd;

    invoke-static {p0, v2, p7}, Ldev/jason/gboardpatches/extension/addsymbols/GboardAddSymbolsRuntime;->bridgeProviderReceiver(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p7

    check-cast p7, Lnio;
""".trimIndent()

private val PROVIDER_WRAPPER_TYPE_DELEGATE = """
    invoke-static {p1}, Ldev/jason/gboardpatches/extension/addsymbols/GboardAddSymbolsRuntime;->rewriteProviderWrapperKeyboardType(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lnzd;
""".trimIndent()

private val METRICS_ALIAS_DELEGATE = """
    invoke-static {p0}, Ldev/jason/gboardpatches/extension/addsymbols/GboardAddSymbolsRuntime;->rewriteMetricsKeyboardType(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lnzd;
""".trimIndent()

private val NAVIGATION_IDENTITY_DELEGATE = """
    invoke-static {p2}, Ldev/jason/gboardpatches/extension/addsymbols/GboardAddSymbolsRuntime;->rewriteNavigationKeyboardType(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lnzd;
""".trimIndent()

private val FOOTER_TAB_CLICK_DELEGATE = """
    invoke-static {p0, p1}, Ldev/jason/gboardpatches/extension/addsymbols/GboardAddSymbolsRuntime;->onExpressionCorpusFooterTabClick(Ljava/lang/Object;Ljava/lang/Object;)V
""".trimIndent()

private val KEYBOARD_READY_DELEGATE = """
    invoke-static/range {p0 .. p3}, Ldev/jason/gboardpatches/extension/addsymbols/GboardAddSymbolsRuntime;->onKeyboardReady(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V
""".trimIndent()

internal data class FooterTabClickConsumerShape(
    val scrollableNavigationFieldCount: Int,
    val acceptReadsScrollableNavigationField: Boolean,
    val acceptCallsScrollableNavigationView: Boolean
)

internal fun isValidFooterTabClickConsumerShape(shape: FooterTabClickConsumerShape): Boolean =
    shape.scrollableNavigationFieldCount == 1 &&
        shape.acceptReadsScrollableNavigationField &&
        shape.acceptCallsScrollableNavigationView

private fun validateFooterTabClickConsumerOrThrow(
    fieldTypes: List<String>,
    method: MutableMethod
) {
    val shape = FooterTabClickConsumerShape(
        scrollableNavigationFieldCount = fieldTypes.count { it == SCROLLABLE_NAVIGATION_VIEW_CLASS },
        acceptReadsScrollableNavigationField =
            method.referencesFieldType(
                definingClass = FOOTER_TAB_CLICK_CONSUMER_CLASS,
                fieldType = SCROLLABLE_NAVIGATION_VIEW_CLASS
            ),
        acceptCallsScrollableNavigationView = method.referencesMethodOwner(
            SCROLLABLE_NAVIGATION_VIEW_CLASS
        )
    )
    check(isValidFooterTabClickConsumerShape(shape)) {
        "Footer tab click consumer drifted: $shape"
    }
}

private fun MutableMethod.referencesFieldType(
    definingClass: String,
    fieldType: String
): Boolean {
    val instructions = implementation?.instructions ?: return false
    return instructions.any { instruction ->
        val reference = (instruction as? ReferenceInstruction)?.reference as? FieldReference
            ?: return@any false
        reference.definingClass == definingClass && reference.type == fieldType
    }
}

private fun MutableMethod.referencesMethodOwner(definingClass: String): Boolean {
    val instructions = implementation?.instructions ?: return false
    return instructions.any { instruction ->
        val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
            ?: return@any false
        reference.definingClass == definingClass
    }
}
