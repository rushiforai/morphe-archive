package dev.utaa.linimal.patches.features.browser

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.Match
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.methodCall
import app.morphe.patcher.newInstance
import app.morphe.patcher.patch.ApkArchitecture
import app.morphe.patcher.patch.PatchAvailability
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableFieldReference
import dev.utaa.linimal.patches.features.ads.smartChannelAdsPatch
import dev.utaa.linimal.patches.shared.Constants
import dev.utaa.linimal.patches.status.PatchId
import dev.utaa.linimal.patches.status.recordFeatureStatus
import dev.utaa.linimal.patches.status.recordUnsafeFeatureStatus
import dev.utaa.linimal.patches.util.BOOLEAN
import dev.utaa.linimal.patches.util.OBJECT
import dev.utaa.linimal.patches.util.STRING
import dev.utaa.linimal.patches.util.VOID
import dev.utaa.linimal.patches.util.isSafeInjectionIndex

private const val CONTEXT = "Landroid/content/Context;"
private const val URI = "Landroid/net/Uri;"
private const val INTENT = "Landroid/content/Intent;"
private const val VIEW = "Landroid/view/View;"
private const val FRAGMENT_ACTIVITY = "Landroidx/fragment/app/b0;"
private const val REFERRER_PARAM = "Lci1/q;"
private const val REFERRER_LOCATION = "Lci1/q\$b;"
private const val REFERRER_ACTION = "Lci1/q\$a;"
private const val LINK_OPTIONS = "Lci1/a;"
private const val LINK_ROUTER = "Lci1/c;"
private const val LINK_ROUTING_INTERFACE = "Lci1/b;"
private const val CHAT_REFERRER = "Lci1/r;"
private const val CHAT_REFERRER_VALUE = "Lci1/r\$a;"
private const val NORMALIZED_LINK = "Lci1/p;"
private const val EXTERNAL_BROWSER_HOOK =
    "Ldev/utaa/linimal/extension/features/browser/ExternalBrowserHooks;" +
        "->tryOpenChatLinkExternally(Landroid/content/Context;Landroid/net/Uri;Ljava/lang/Object;)Z"

/**
 * トーク内のリンクを押した操作を表す referrer action。本文リンク（CLICK）、リッチメッセージ（RICH_MSG）、
 * リッチメニュー（RICH_MENU）、テンプレート・Flex のカード（TEMPLATE_MSG）がすべて同じ routing へ届きます。
 * どの action を外部へ渡すかは runtime 側が enum 名で判定し、ここでは enum に揃っていることだけを確かめます。
 */
private val chatLinkActions = setOf("CLICK", "RICH_MSG", "RICH_MENU", "TEMPLATE_MSG")

private val linkRouterParameters = listOf(
    CONTEXT,
    URI,
    LINK_OPTIONS,
    CHAT_REFERRER,
    BOOLEAN,
    REFERRER_PARAM,
    BOOLEAN,
)

private val defaultLinkRoutingParameters = listOf(
    LINK_ROUTING_INTERFACE,
    STRING,
    REFERRER_PARAM,
    BOOLEAN,
    BOOLEAN,
    BOOLEAN,
    BOOLEAN,
    LINK_OPTIONS,
    "I",
)

/**
 * 汎用リンク routing の実装。難読化されたクラス名・メソッド名を主要条件にせず、URI 変換、
 * chat referrer model、最終 routing の引数形状を組み合わせて reference DEX の一件に限定します。
 */
private val externalBrowserTargetFingerprint = Fingerprint(
    returnType = VOID,
    parameters = listOf(STRING, REFERRER_PARAM, BOOLEAN, LINK_OPTIONS),
    filters = listOf(
        methodCall(
            definingClass = URI,
            name = "parse",
            parameters = listOf(STRING),
            returnType = URI,
            opcode = Opcode.INVOKE_STATIC,
        ),
        newInstance(CHAT_REFERRER_VALUE),
        fieldAccess(type = LINK_ROUTER, opcode = Opcode.IGET_OBJECT),
        fieldAccess(type = FRAGMENT_ACTIVITY, opcode = Opcode.IGET_OBJECT),
        methodCall(
            parameters = linkRouterParameters,
            returnType = INTENT,
            opcode = Opcode.INVOKE_INTERFACE_RANGE,
        ),
    ),
    custom = { _, classDef -> classDef.interfaces.contains(LINK_ROUTING_INTERFACE) },
)

/** static h preset が CHAT / CLICK と既定の false 値で構成されることを検証します。 */
private val chatClickPresetFingerprint = Fingerprint(
    definingClass = REFERRER_PARAM,
    name = "<clinit>",
    returnType = VOID,
    parameters = emptyList(),
    filters = listOf(
        fieldAccess(
            definingClass = REFERRER_LOCATION,
            name = "CHAT",
            type = REFERRER_LOCATION,
            opcode = Opcode.SGET_OBJECT,
        ),
        fieldAccess(
            definingClass = REFERRER_ACTION,
            name = "CLICK",
            type = REFERRER_ACTION,
            opcode = Opcode.SGET_OBJECT,
        ),
        fieldAccess(
            definingClass = REFERRER_PARAM,
            name = "h",
            type = REFERRER_PARAM,
            opcode = Opcode.SPUT_OBJECT,
        ),
    ),
    custom = { method, _ -> hasChatClickPresetShape(method.implementation?.instructions?.toList().orEmpty()) },
)

/**
 * テキストメッセージ binder が URL を正規化し、h を読み、routing interface へ渡す経路を確認します。
 * 汎用 target を変更する前に、h が通常チャット本文リンクで使われることを保証します。
 */
private val chatTextLinkCallerFingerprint = Fingerprint(
    returnType = VOID,
    parameters = listOf(STRING),
    filters = listOf(
        methodCall(
            parameters = listOf(CONTEXT, STRING, STRING),
            returnType = NORMALIZED_LINK,
            opcode = Opcode.INVOKE_STATIC,
        ),
        fieldAccess(
            definingClass = REFERRER_PARAM,
            name = "h",
            type = REFERRER_PARAM,
            opcode = Opcode.SGET_OBJECT,
        ),
        fieldAccess(type = LINK_OPTIONS, opcode = Opcode.IGET_OBJECT),
        methodCall(
            parameters = defaultLinkRoutingParameters,
            returnType = VOID,
            opcode = Opcode.INVOKE_STATIC_RANGE,
        ),
    ),
)

/**
 * 変更対象は最終の汎用実装だけですが、View click → Kotlin callback → text binder → routing interface
 * という完全なクリック経路が存在することも必須にします。
 */
private fun textLinkCallbackFingerprint(textLinkCaller: Match) = Fingerprint(
    returnType = OBJECT,
    parameters = listOf(OBJECT),
    filters = listOf(
        methodCall(
            definingClass = textLinkCaller.originalClassDef.type,
            name = textLinkCaller.method.name,
            parameters = textLinkCaller.method.parameterTypes.map(CharSequence::toString),
            returnType = textLinkCaller.method.returnType,
            opcode = Opcode.INVOKE_VIRTUAL,
        ),
    ),
)

private fun textLinkViewClickFingerprint(callback: Match) = Fingerprint(
    returnType = VOID,
    parameters = listOf(VIEW),
    filters = listOf(
        methodCall(
            definingClass = callback.originalClassDef.type,
            name = callback.method.name,
            parameters = callback.method.parameterTypes.map(CharSequence::toString),
            returnType = callback.method.returnType,
            opcode = Opcode.INVOKE_VIRTUAL,
        ),
    ),
)

private data class TargetInjectionShape(
    val insertionIndex: Int,
    val uriRegister: Int,
    val actionScratchRegister: Int,
    val contextScratchRegister: Int,
    val contextField: FieldReference,
)

/** referrer の location / action を持つ instance field。難読化名ではなく型で一意に決めます。 */
private data class ReferrerFields(
    val location: FieldReference,
    val action: FieldReference,
)

/**
 * referrer が location と action の instance field を 1 つずつ持ち、location の enum に CHAT、action の
 * enum に [chatLinkActions] がそろっている場合だけ field を返します。
 */
private fun referrerFields(
    referrer: ClassDef?,
    location: ClassDef?,
    action: ClassDef?,
): ReferrerFields? {
    if (referrer == null || location == null || action == null) {
        return null
    }
    fun enumConstants(classDef: ClassDef) = classDef.staticFields
        .filter { it.type == classDef.type }
        .map { it.name }
        .toSet()
    if ("CHAT" !in enumConstants(location) || !enumConstants(action).containsAll(chatLinkActions)) {
        return null
    }
    val locationField = referrer.instanceFields.singleOrNull { it.type == REFERRER_LOCATION } ?: return null
    val actionField = referrer.instanceFields.singleOrNull { it.type == REFERRER_ACTION } ?: return null
    return ReferrerFields(
        location = ImmutableFieldReference(REFERRER_PARAM, locationField.name, REFERRER_LOCATION),
        action = ImmutableFieldReference(REFERRER_PARAM, actionField.name, REFERRER_ACTION),
    )
}

/**
 * 外部ブラウザ routing は、トーク（location CHAT）でリンクを押した操作に限ります。本文リンク、
 * リッチメッセージ、リッチメニュー、テンプレート・Flex のカードが対象です（Issue #18）。
 * OAuth、Channel permission、Pay、LIFF、Settings WebView、Timeline は CHAT の referrer を持たず、
 * LINE の web host は runtime 側で元の処理へ残します。
 */
val externalBrowserChatTextLinkPatch = bytecodePatch(
    name = "Open links in external browser",
    description = "トークの本文、リッチメッセージ、リッチメニュー、カードの http/https リンクを、実行時設定で外部ブラウザへ渡せるようにします。",
) {
    compatibleWith(Constants.LINE_COMPATIBILITY)
    availability { _, architecture ->
        if (architecture == ApkArchitecture.ARM64_V8A) {
            PatchAvailability.REQUIRED
        } else {
            PatchAvailability.UNAVAILABLE
        }
    }
    dependsOn(smartChannelAdsPatch)

    execute {
        val targetMatches = externalBrowserTargetFingerprint.matchAllOrNull().orEmpty()
        if (targetMatches.size != 1) {
            recordFeatureStatus(
                listOf(PatchId.EXTERNAL_BROWSER_CHAT_TEXT_LINK),
                expectedTargetCount = 1,
                actualTargetCount = targetMatches.size,
                reason = "ExternalBrowserTargetNotUnique",
            )
            return@execute
        }

        val target = targetMatches.single()
        val targetShape = targetInjectionShape(target)
        if (targetShape == null || !isSafeInjectionIndex(target.method.implementation, targetShape.insertionIndex)) {
            recordUnsafeFeatureStatus(
                listOf(PatchId.EXTERNAL_BROWSER_CHAT_TEXT_LINK),
                expectedTargetCount = 1,
                actualTargetCount = 1,
                reason = "ExternalBrowserTargetInstructionShapeMismatch",
            )
            return@execute
        }

        if (chatClickPresetFingerprint.matchAllOrNull().orEmpty().size != 1) {
            recordUnsafeFeatureStatus(
                listOf(PatchId.EXTERNAL_BROWSER_CHAT_TEXT_LINK),
                expectedTargetCount = 1,
                actualTargetCount = 1,
                reason = "ExternalBrowserChatPresetNotUnique",
            )
            return@execute
        }

        val fields = referrerFields(
            classDefByOrNull(REFERRER_PARAM),
            classDefByOrNull(REFERRER_LOCATION),
            classDefByOrNull(REFERRER_ACTION),
        )
        if (fields == null) {
            recordUnsafeFeatureStatus(
                listOf(PatchId.EXTERNAL_BROWSER_CHAT_TEXT_LINK),
                expectedTargetCount = 1,
                actualTargetCount = 1,
                reason = "ExternalBrowserReferrerShapeMismatch",
            )
            return@execute
        }

        val textLinkCallers = chatTextLinkCallerFingerprint.matchAllOrNull().orEmpty()
        if (textLinkCallers.size != 1 || !hasChatTextLinkCallerShape(textLinkCallers.singleOrNull())) {
            recordUnsafeFeatureStatus(
                listOf(PatchId.EXTERNAL_BROWSER_CHAT_TEXT_LINK),
                expectedTargetCount = 1,
                actualTargetCount = 1,
                reason = "ExternalBrowserChatCallerShapeMismatch",
            )
            return@execute
        }

        val textLinkCallbacks = textLinkCallbackFingerprint(textLinkCallers.single()).matchAllOrNull().orEmpty()
        if (textLinkCallbacks.size != 1 || !hasTextLinkCallbackShape(textLinkCallbacks.singleOrNull())) {
            recordUnsafeFeatureStatus(
                listOf(PatchId.EXTERNAL_BROWSER_CHAT_TEXT_LINK),
                expectedTargetCount = 1,
                actualTargetCount = 1,
                reason = "ExternalBrowserCallbackChainMismatch",
            )
            return@execute
        }

        val viewClicks = textLinkViewClickFingerprint(textLinkCallbacks.single()).matchAllOrNull().orEmpty()
        if (viewClicks.size != 1 || !hasTextLinkViewClickShape(viewClicks.singleOrNull())) {
            recordUnsafeFeatureStatus(
                listOf(PatchId.EXTERNAL_BROWSER_CHAT_TEXT_LINK),
                expectedTargetCount = 1,
                actualTargetCount = 1,
                reason = "ExternalBrowserViewClickChainMismatch",
            )
            return@execute
        }

        val contextFieldSmali = fieldSmali(targetShape.contextField)
        val actionScratch = targetShape.actionScratchRegister
        val contextScratch = targetShape.contextScratchRegister
        // CHAT の referrer だけを hook へ渡し、action の判定は runtime 側に任せます。
        target.method.addInstructionsWithLabels(
            targetShape.insertionIndex,
            """
                if-eqz p2, :original
                iget-object v$actionScratch, p2, ${fieldSmali(fields.location)}
                sget-object v$contextScratch, $REFERRER_LOCATION->CHAT:$REFERRER_LOCATION
                if-ne v$actionScratch, v$contextScratch, :original
                iget-object v$actionScratch, p2, ${fieldSmali(fields.action)}
                iget-object v$contextScratch, p0, $contextFieldSmali
                invoke-static { v$contextScratch, v${targetShape.uriRegister}, v$actionScratch }, $EXTERNAL_BROWSER_HOOK
                move-result v$contextScratch
                if-eqz v${targetShape.contextScratchRegister}, :original
                return-void
                :original
                nop
            """.trimIndent(),
        )
        recordFeatureStatus(
            listOf(PatchId.EXTERNAL_BROWSER_CHAT_TEXT_LINK),
            expectedTargetCount = 1,
            actualTargetCount = 1,
            reason = "ExternalBrowserChatLinkGuarded",
        )
    }
}

private fun fieldSmali(field: FieldReference): String = "${field.definingClass}->${field.name}:${field.type}"

/**
 * URI parse 境界の local register を再利用する前に、reference target の data flow を厳密に検証します。
 * FragmentActivity field は名前に依存せず、元の routing 命令列から取得します。
 */
private fun targetInjectionShape(match: Match): TargetInjectionShape? {
    val method = match.method
    val instructions = method.implementation?.instructions?.toList() ?: return null
    val parseIndex = match.instructionMatches[0].index
    val routerFieldIndex = match.instructionMatches[2].index
    val contextFieldIndex = match.instructionMatches[3].index
    val routeIndex = match.instructionMatches[4].index
    val implementation = method.implementation ?: return null
    val parameterStart = implementation.registerCount - method.parameterTypes.size - 1
    val thisRegister = parameterStart
    val stringParameterRegister = parameterStart + 1
    val referrerParameterRegister = parameterStart + 2
    val parse = instructions.getOrNull(parseIndex) as? FiveRegisterInstruction
    val uriResult = instructions.getOrNull(parseIndex + 1) as? OneRegisterInstruction
    val uriCheck = instructions.getOrNull(parseIndex + 2) as? FiveRegisterInstruction
    val routerRead = instructions.getOrNull(routerFieldIndex) as? TwoRegisterInstruction
    val routerField = (instructions.getOrNull(routerFieldIndex) as? ReferenceInstruction)
        ?.reference as? FieldReference
    val contextRead = instructions.getOrNull(contextFieldIndex) as? TwoRegisterInstruction
    val contextField = (instructions.getOrNull(contextFieldIndex) as? ReferenceInstruction)
        ?.reference as? FieldReference
    val route = instructions.getOrNull(routeIndex) as? RegisterRangeInstruction
    val routeReference = (instructions.getOrNull(routeIndex) as? ReferenceInstruction)
        ?.reference as? MethodReference
    val referrerMove = instructions.getOrNull(routeIndex - 3) as? TwoRegisterInstruction

    // 検証済みの reference shape では、この位置の v0/v1 は live ではありません。v0 は h の
    // identity 比較だけに使い、v1 は Context / hook result の後に元コードで上書きされます。
    if (
        implementation.registerCount - (method.parameterTypes.size + 1) < 2 ||
        parse?.opcode != Opcode.INVOKE_STATIC ||
        parse.registerCount != 1 ||
        parse.registerC != stringParameterRegister ||
        uriResult?.opcode != Opcode.MOVE_RESULT_OBJECT ||
        uriResult.registerA !in 0..15 ||
        uriCheck?.opcode != Opcode.INVOKE_VIRTUAL ||
        uriCheck.registerCount != 1 ||
        uriCheck.registerC != uriResult.registerA ||
        (instructions.getOrNull(parseIndex + 2) as? ReferenceInstruction)?.reference
            .let { it as? MethodReference }
            ?.let { it.definingClass == OBJECT && it.name == "getClass" && it.returnType == "Ljava/lang/Class;" }
            != true ||
        routerRead?.opcode != Opcode.IGET_OBJECT ||
        routerRead.registerB != thisRegister ||
        routerField?.type != LINK_ROUTER ||
        routerField.definingClass != match.originalClassDef.type ||
        contextRead?.opcode != Opcode.IGET_OBJECT ||
        contextRead.registerB != thisRegister ||
        contextRead.registerA != 1 ||
        contextField?.type != FRAGMENT_ACTIVITY ||
        contextField.definingClass != match.originalClassDef.type ||
        route?.opcode != Opcode.INVOKE_INTERFACE_RANGE ||
        routeReference?.definingClass != LINK_ROUTER ||
        routeReference.parameterTypes != linkRouterParameters ||
        routeReference.returnType != INTENT ||
        route.registerCount != 8 ||
        route.startRegister != routerRead.registerA ||
        route.startRegister + 1 != contextRead.registerA ||
        route.startRegister + 2 != uriResult.registerA ||
        referrerMove?.opcode != Opcode.MOVE_OBJECT ||
        referrerMove.registerA != route.startRegister + 6 ||
        referrerMove.registerB != referrerParameterRegister
    ) {
        return null
    }

    return TargetInjectionShape(
        insertionIndex = parseIndex + 2,
        uriRegister = uriResult.registerA,
        actionScratchRegister = 0,
        contextScratchRegister = 1,
        contextField = contextField,
    )
}

private fun hasChatClickPresetShape(instructions: List<com.android.tools.smali.dexlib2.iface.instruction.Instruction>): Boolean {
    val chatIndex = instructions.indexOfFirst { instruction ->
        val reference = (instruction as? ReferenceInstruction)?.reference as? FieldReference
        instruction.opcode == Opcode.SGET_OBJECT &&
            reference?.definingClass == REFERRER_LOCATION &&
            reference.name == "CHAT" &&
            reference.type == REFERRER_LOCATION
    }
    val clickIndex = instructions.indexOfFirst { instruction ->
        val reference = (instruction as? ReferenceInstruction)?.reference as? FieldReference
        instruction.opcode == Opcode.SGET_OBJECT &&
            reference?.definingClass == REFERRER_ACTION &&
            reference.name == "CLICK" &&
            reference.type == REFERRER_ACTION
    }
    val presetStoreIndex = instructions.indexOfFirst { instruction ->
        val reference = (instruction as? ReferenceInstruction)?.reference as? FieldReference
        instruction.opcode == Opcode.SPUT_OBJECT &&
            reference?.definingClass == REFERRER_PARAM &&
            reference.name == "h" &&
            reference.type == REFERRER_PARAM
    }
    val chatRead = instructions.getOrNull(chatIndex) as? OneRegisterInstruction
    val clickRead = instructions.getOrNull(clickIndex) as? OneRegisterInstruction
    val presetConstructor = instructions.getOrNull(presetStoreIndex - 1) as? FiveRegisterInstruction
    val presetConstructorReference = (instructions.getOrNull(presetStoreIndex - 1) as? ReferenceInstruction)
        ?.reference as? MethodReference
    val presetStore = instructions.getOrNull(presetStoreIndex) as? OneRegisterInstruction
    val falseMask = presetConstructor?.registerF?.let { register ->
        instructions.subList(0, presetStoreIndex - 1)
            .asReversed()
            .firstNotNullOfOrNull { instruction ->
                val literal = instruction as? NarrowLiteralInstruction
                val literalRegister = instruction as? OneRegisterInstruction
                literal?.takeIf { literalRegister?.registerA == register }?.narrowLiteral
            }
    }

    return chatIndex >= 0 &&
        clickIndex > chatIndex &&
        presetStoreIndex > clickIndex &&
        chatRead != null &&
        clickRead != null &&
        presetConstructor?.opcode == Opcode.INVOKE_DIRECT &&
        presetConstructorReference?.definingClass == REFERRER_PARAM &&
        presetConstructorReference.name == "<init>" &&
        presetConstructorReference.parameterTypes == listOf(REFERRER_LOCATION, REFERRER_ACTION, "I") &&
        presetConstructorReference.returnType == VOID &&
        presetConstructor.registerCount == 4 &&
        presetConstructor.registerD == chatRead.registerA &&
        presetConstructor.registerE == clickRead.registerA &&
        falseMask == 4 &&
        presetStore?.registerA == presetConstructor.registerC
}

private fun hasChatTextLinkCallerShape(match: Match?): Boolean {
    val candidate = match ?: return false
    val instructions = candidate.method.implementation?.instructions?.toList() ?: return false
    val presetReadIndex = candidate.instructionMatches[1].index
    val routeIndex = candidate.instructionMatches[3].index
    val presetRead = instructions.getOrNull(presetReadIndex) as? OneRegisterInstruction
    val presetField = (instructions.getOrNull(presetReadIndex) as? ReferenceInstruction)
        ?.reference as? FieldReference
    val route = instructions.getOrNull(routeIndex) as? RegisterRangeInstruction
    val routeReference = (instructions.getOrNull(routeIndex) as? ReferenceInstruction)
        ?.reference as? MethodReference

    return presetRead?.opcode == Opcode.SGET_OBJECT &&
        presetField?.definingClass == REFERRER_PARAM &&
        presetField.name == "h" &&
        presetField.type == REFERRER_PARAM &&
        route?.opcode == Opcode.INVOKE_STATIC_RANGE &&
        routeReference?.parameterTypes == defaultLinkRoutingParameters &&
        routeReference.returnType == VOID &&
        route.registerCount == defaultLinkRoutingParameters.size &&
        route.startRegister + 2 == presetRead.registerA
}

private fun hasTextLinkCallbackShape(match: Match?): Boolean {
    val candidate = match ?: return false
    val instructions = candidate.method.implementation?.instructions?.toList() ?: return false
    val invokeIndex = candidate.instructionMatches.singleOrNull()?.index ?: return false
    val stringCast = instructions.getOrNull(invokeIndex - 4) as? ReferenceInstruction
    val receiverRead = instructions.getOrNull(invokeIndex - 2) as? TwoRegisterInstruction
    val receiverCast = instructions.getOrNull(invokeIndex - 1) as? ReferenceInstruction
    val invoke = instructions.getOrNull(invokeIndex) as? FiveRegisterInstruction
    val invokeReference = (instructions.getOrNull(invokeIndex) as? ReferenceInstruction)
        ?.reference as? MethodReference

    return stringCast?.opcode == Opcode.CHECK_CAST &&
        (stringCast.reference as? TypeReference)?.type == STRING &&
        receiverRead?.opcode == Opcode.IGET_OBJECT &&
        receiverCast?.opcode == Opcode.CHECK_CAST &&
        (receiverCast.reference as? TypeReference)?.type == invokeReference?.definingClass &&
        invoke?.opcode == Opcode.INVOKE_VIRTUAL &&
        invoke.registerCount == 2 &&
        receiverRead.registerA == receiverCast.let { it as? OneRegisterInstruction }?.registerA &&
        invoke.registerC == receiverCast.let { it as? OneRegisterInstruction }?.registerA &&
        invoke.registerD == stringCast.let { it as? OneRegisterInstruction }?.registerA
}

private fun hasTextLinkViewClickShape(match: Match?): Boolean {
    val candidate = match ?: return false
    val instructions = candidate.method.implementation?.instructions?.toList() ?: return false
    val invokeIndex = candidate.instructionMatches.singleOrNull()?.index ?: return false
    val callbackRead = instructions.getOrNull(invokeIndex - 1) as? TwoRegisterInstruction
    val callbackField = (instructions.getOrNull(invokeIndex - 1) as? ReferenceInstruction)
        ?.reference as? FieldReference
    val invoke = instructions.getOrNull(invokeIndex) as? FiveRegisterInstruction

    return callbackRead?.opcode == Opcode.IGET_OBJECT &&
        callbackField != null &&
        callbackRead.registerA == invoke?.registerC &&
        invoke.opcode == Opcode.INVOKE_VIRTUAL &&
        invoke.registerCount == 2
}
