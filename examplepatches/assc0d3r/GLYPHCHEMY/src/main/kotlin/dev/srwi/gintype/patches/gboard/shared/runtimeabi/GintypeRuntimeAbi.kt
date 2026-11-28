package dev.srwi.gintype.patches.gboard.shared.runtimeabi

internal enum class RuntimeCallId(internal val encodedAbi: String) {
    THICC_TOP_BAR_RUNTIME_ON_CANDIDATES_UPDATED("Ldev/srwi/gintype/extension/thicctopbar/GboardThiccTopBarRuntime;->onCandidatesUpdated(Ljava/lang/Object;Ljava/lang/Object;)V"),
    THICC_TOP_BAR_RUNTIME_ON_CANDIDATES_CLEARED("Ldev/srwi/gintype/extension/thicctopbar/GboardThiccTopBarRuntime;->onCandidatesCleared(Ljava/lang/Object;)V"),
    THICC_TOP_BAR_RUNTIME_ON_SOFT_KEYBOARD_VIEW_INFLATED("Ldev/srwi/gintype/extension/thicctopbar/GboardThiccTopBarRuntime;->onSoftKeyboardViewInflated(Ljava/lang/Object;)V"),
    THICC_TOP_BAR_RUNTIME_SCALE_HEADER_TARGET_HEIGHT("Ldev/srwi/gintype/extension/thicctopbar/GboardThiccTopBarRuntime;->scaleHeaderTargetHeight(Ljava/lang/Object;I)I"),
    THICC_TOP_BAR_RUNTIME_ON_KEYBOARD_TOUCH_EVENT("Ldev/srwi/gintype/extension/thicctopbar/GboardThiccTopBarRuntime;->onKeyboardTouchEvent(Ljava/lang/Object;Landroid/view/MotionEvent;)V"),
    THICC_TOP_BAR_RUNTIME_ON_KEY_DATA_DISPATCHED("Ldev/srwi/gintype/extension/thicctopbar/GboardThiccTopBarRuntime;->onKeyDataDispatched()V"),
    MULTIGLIDE_RUNTIME_ON_KEYBOARD_VIEW_READY("Ldev/srwi/gintype/extension/multiglide/GboardMultiGlideRuntime;->onKeyboardViewReady(Ljava/lang/Object;)V"),
    MULTIGLIDE_RUNTIME_ON_GESTURE_EVENT_ENTRY("Ldev/srwi/gintype/extension/multiglide/GboardMultiGlideRuntime;->onGestureEventEntry(Ljava/lang/Object;Landroid/view/MotionEvent;)V"),
    MULTIGLIDE_RUNTIME_SHOULD_START_GESTURE("Ldev/srwi/gintype/extension/multiglide/GboardMultiGlideRuntime;->shouldStartGesture(Ljava/lang/Object;Z)Z"),
    MULTIGLIDE_RUNTIME_SHOULD_INTERCEPT_GESTURE_DISPATCH("Ldev/srwi/gintype/extension/multiglide/GboardMultiGlideRuntime;->shouldInterceptGestureDispatch(Ljava/lang/Object;)Z"),
    MULTIGLIDE_RUNTIME_SHOULD_INTERCEPT_GESTURE_RESET("Ldev/srwi/gintype/extension/multiglide/GboardMultiGlideRuntime;->shouldInterceptGestureReset(Ljava/lang/Object;)Z"),
    MULTIGLIDE_RUNTIME_RESOLVE_LETTER_STARTED("Ldev/srwi/gintype/extension/multiglide/GboardMultiGlideRuntime;->resolveLetterStarted(Ljava/lang/Object;Z)Z"),
    MULTIGLIDE_RUNTIME_SHOULD_RECEIVE_EVENTS_DURING_OTHER_OWNER("Ldev/srwi/gintype/extension/multiglide/GboardMultiGlideRuntime;->shouldReceiveEventsDuringOtherOwner(Ljava/lang/Object;)Z"),
    MULTIGLIDE_RUNTIME_SHOULD_SUPPRESS_BASIC_HANDLER("Ldev/srwi/gintype/extension/multiglide/GboardMultiGlideRuntime;->shouldSuppressBasicMotionEventHandler(Ljava/lang/Object;Landroid/view/MotionEvent;)Z"),
    MULTIGLIDE_RUNTIME_SHOULD_SUPPRESS_ROLLOVER_COMMIT("Ldev/srwi/gintype/extension/multiglide/GboardMultiGlideRuntime;->shouldSuppressRolloverCommitOnPointerDown(Landroid/view/MotionEvent;)Z"),
    TYPING_EFFECTS_RUNTIME_ON_KEYBOARD_TOUCH_EVENT("Ldev/srwi/gintype/extension/typingeffects/GboardTypingEffectsRuntime;->onKeyboardTouchEvent(Ljava/lang/Object;Landroid/view/MotionEvent;)V"),
    TYPING_EFFECTS_RUNTIME_ON_KEYBOARD_DETACHED("Ldev/srwi/gintype/extension/typingeffects/GboardTypingEffectsRuntime;->onKeyboardDetached(Ljava/lang/Object;)V"),
    TYPING_EFFECTS_RUNTIME_SHOULD_SUPPRESS_STOCK_TRAIL("Ldev/srwi/gintype/extension/typingeffects/GboardTypingEffectsRuntime;->shouldSuppressStockGestureTrail(Ljava/lang/Object;)Z"),
    CUSTOM_HOLD_POPUPS_RUNTIME_TRANSFORM_SOFT_KEY_DEF("Ldev/srwi/gintype/extension/customholdpopups/GboardCustomHoldPopupsRuntime;->transformSoftKeyDef(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;"),
    CUSTOM_HOLD_POPUPS_RUNTIME_ON_POPUP_SHOWN("Ldev/srwi/gintype/extension/customholdpopups/GboardCustomHoldPopupsRuntime;->onPopupShown(Ljava/lang/Object;)V"),
    CUSTOM_HOLD_POPUPS_RUNTIME_ON_POPUP_SELECTION_UPDATED("Ldev/srwi/gintype/extension/customholdpopups/GboardCustomHoldPopupsRuntime;->onPopupSelectionUpdated(Ljava/lang/Object;Z)V"),
    CUSTOM_HOLD_POPUPS_RUNTIME_ON_POPUP_HIDDEN("Ldev/srwi/gintype/extension/customholdpopups/GboardCustomHoldPopupsRuntime;->onPopupHidden(Ljava/lang/Object;)V"),
    CUSTOM_HOLD_POPUPS_RUNTIME_SHOULD_INTERCEPT_KEY_DATA_DISPATCH("Ldev/srwi/gintype/extension/customholdpopups/GboardCustomHoldPopupsRuntime;->shouldInterceptKeyDataDispatch(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Z"),
}

internal data class RuntimeAbi(
    val owner: String,
    val name: String,
    val parameters: List<String>,
    val returnType: String,
    val isStatic: Boolean,
) {
    val descriptor: String
        get() = parameters.joinToString(prefix = "(", postfix = ")$returnType", separator = "")

    val reference: String
        get() = "$owner->$name$descriptor"

    companion object {
        fun decode(encoded: String): RuntimeAbi {
            val owner = encoded.substringBefore("->")
            val method = encoded.substringAfter("->")
            val name = method.substringBefore('(')
            val parametersDescriptor = method.substringAfter('(').substringBefore(')')
            return RuntimeAbi(
                owner = owner,
                name = name,
                parameters = decodeTypes(parametersDescriptor),
                returnType = method.substringAfter(')'),
                isStatic = true,
            )
        }

        private fun decodeTypes(descriptor: String): List<String> = buildList {
            var index = 0
            while (index < descriptor.length) {
                val start = index
                while (descriptor[index] == '[') index++
                if (descriptor[index] == 'L') {
                    index = descriptor.indexOf(';', index) + 1
                    require(index > 0) { "Malformed object type in runtime ABI: $descriptor" }
                } else {
                    index++
                }
                add(descriptor.substring(start, index))
            }
        }
    }
}

internal object RuntimeAbiCatalog {
    private val abiByCall = RuntimeCallId.entries.associateWith { call ->
        RuntimeAbi.decode(call.encodedAbi)
    }

    fun abi(call: RuntimeCallId): RuntimeAbi = abiByCall.getValue(call)
}
