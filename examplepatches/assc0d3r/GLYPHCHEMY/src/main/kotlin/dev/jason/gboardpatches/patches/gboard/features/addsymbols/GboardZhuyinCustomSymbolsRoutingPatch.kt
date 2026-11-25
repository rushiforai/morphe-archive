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
import dev.jason.gboardpatches.patches.gboard.shared.generated.GboardVersionBindings
import dev.jason.gboardpatches.patches.gboard.shared.runtimeabi.RuntimeCallEmitter
import dev.jason.gboardpatches.patches.gboard.shared.runtimeabi.RuntimeCallId

// 18.6.3 renamed every class in this chain. They are taken from the generated bindings
// instead of being repeated as literals, so a future version only needs a binding update:
//   Lplg; (provider/receiver wrapper)      -> Lpey;  (KeyboardProviderReceiverWrapper)
//   Lihe; (metrics)                        -> Lidl;  b(Lpwf;)Lxai;
//   Lgyt; (footer tab click consumer)      -> Lgve;  accept(Object)V
//   Lpbw; (keyboard wrapper, onKeyboardReady) -> Lovs;
//   Lqch; (keyboard/session)               -> Lpwf;  (keyboardDefinitionType)
private val keyboardType: String
    get() = GboardVersionBindings.keyboardDefinitionType.descriptor
private val providerRequestKeyboardType: String
    get() = GboardVersionBindings.keyboardDefinitionType.descriptor
private val providerRequestReceiverType: String
    get() = GboardVersionBindings.keyboardCompletionCallbackType.descriptor
private val scrollableNavigationViewType: String
    get() = GboardVersionBindings.customSymbolsNavigation.ownerDescriptor

internal val gboardZhuyinCustomSymbolsRoutingPatch = bytecodePatch(
    description = "調整 add-symbols 的 provider / routing / tab identity 主線。"
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
    val mutableMethod =
        findMutableMethodOrThrow(GboardVersionBindings.keyboardExtensionManager)
    mutableMethod.addInstructions(0, EXTENSION_MANAGER_DELEGATE)
}

context(context: BytecodePatchContext)
private fun patchProviderRequest() = with(context) {
    val mutableMethod = findMutableMethodOrThrow(GboardVersionBindings.keyboardProviderRequest)
    mutableMethod.addInstructions(0, PROVIDER_REQUEST_DELEGATE)
}

context(context: BytecodePatchContext)
private fun patchProviderWrapper() = with(context) {
    findMutableMethodOrThrow(GboardVersionBindings.customSymbolsProviderCreated)
        .addInstructions(0, PROVIDER_WRAPPER_TYPE_DELEGATE)
    findMutableMethodOrThrow(GboardVersionBindings.customSymbolsProviderBefore)
        .addInstructions(0, PROVIDER_WRAPPER_TYPE_DELEGATE)
    findMutableMethodOrThrow(GboardVersionBindings.customSymbolsProviderValid)
        .addInstructions(0, PROVIDER_WRAPPER_TYPE_DELEGATE)
}

context(context: BytecodePatchContext)
private fun patchMetricsAlias() = with(context) {
    findMutableMethodOrThrow(GboardVersionBindings.customSymbolsMetrics)
        .addInstructions(0, METRICS_ALIAS_DELEGATE)
}

context(context: BytecodePatchContext)
private fun patchNavigationIdentity() = with(context) {
    findMutableMethodOrThrow(GboardVersionBindings.customSymbolsNavigation)
        .addInstructions(0, NAVIGATION_IDENTITY_DELEGATE)
}

context(context: BytecodePatchContext)
private fun patchFooterTabClick() = with(context) {
    val footerClick = GboardVersionBindings.customSymbolsFooterClick
    val consumerClass = mutableClass(footerClick.ownerDescriptor)
    val mutableMethod = findMutableMethodOrThrow(footerClick)
    validateFooterTabClickConsumerOrThrow(
        consumerClassType = footerClick.ownerDescriptor,
        fieldTypes = consumerClass.fields.map { it.type },
        method = mutableMethod
    )
    mutableMethod.addInstructions(0, FOOTER_TAB_CLICK_DELEGATE)
}

context(context: BytecodePatchContext)
private fun patchKeyboardReady() = with(context) {
    findMutableMethodOrThrow(GboardVersionBindings.customSymbolsKeyboardReady)
        .addInstructions(0, KEYBOARD_READY_DELEGATE)
}

private val EXTENSION_MANAGER_DELEGATE = """
    ${RuntimeCallEmitter.invoke(RuntimeCallId.ADD_SYMBOLS_RUNTIME_ENSURE_EXTENSION_PROVIDER_MAPPING, "p0, p1")}
""".trimIndent()

private val PROVIDER_REQUEST_DELEGATE: String
    get() = """
    move-object v2, p4

    ${RuntimeCallEmitter.invoke(RuntimeCallId.ADD_SYMBOLS_RUNTIME_REWRITE_PROVIDER_REQUEST_TYPE, "p4")}

    move-result-object p4

    check-cast p4, $providerRequestKeyboardType

    ${RuntimeCallEmitter.invoke(RuntimeCallId.ADD_SYMBOLS_RUNTIME_BRIDGE_PROVIDER_RECEIVER, "p0, v2, p7")}

    move-result-object p7

    check-cast p7, $providerRequestReceiverType
""".trimIndent()

private val PROVIDER_WRAPPER_TYPE_DELEGATE: String
    get() = """
    ${RuntimeCallEmitter.invoke(RuntimeCallId.ADD_SYMBOLS_RUNTIME_REWRITE_PROVIDER_WRAPPER_KEYBOARD_TYPE, "p1")}

    move-result-object p1

    check-cast p1, $keyboardType
""".trimIndent()

private val METRICS_ALIAS_DELEGATE: String
    get() = """
    ${RuntimeCallEmitter.invoke(RuntimeCallId.ADD_SYMBOLS_RUNTIME_REWRITE_METRICS_KEYBOARD_TYPE, "p0")}

    move-result-object p0

    check-cast p0, $keyboardType
""".trimIndent()

private val NAVIGATION_IDENTITY_DELEGATE: String
    get() = """
    ${RuntimeCallEmitter.invoke(RuntimeCallId.ADD_SYMBOLS_RUNTIME_REWRITE_NAVIGATION_KEYBOARD_TYPE, "p2")}

    move-result-object p2

    check-cast p2, $keyboardType
""".trimIndent()

private val FOOTER_TAB_CLICK_DELEGATE = """
    ${RuntimeCallEmitter.invoke(RuntimeCallId.ADD_SYMBOLS_RUNTIME_ON_EXPRESSION_CORPUS_FOOTER_TAB_CLICK, "p0, p1")}
""".trimIndent()

private val KEYBOARD_READY_DELEGATE = """
    ${RuntimeCallEmitter.invoke(RuntimeCallId.ADD_SYMBOLS_RUNTIME_ON_KEYBOARD_READY, "p0 .. p3")}
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
    consumerClassType: String,
    fieldTypes: List<String>,
    method: MutableMethod
) {
    val navigationType = scrollableNavigationViewType
    val shape = FooterTabClickConsumerShape(
        scrollableNavigationFieldCount = fieldTypes.count { it == navigationType },
        acceptReadsScrollableNavigationField =
            method.referencesFieldType(
                definingClass = consumerClassType,
                fieldType = navigationType
            ),
        acceptCallsScrollableNavigationView = method.referencesMethodOwner(navigationType)
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
