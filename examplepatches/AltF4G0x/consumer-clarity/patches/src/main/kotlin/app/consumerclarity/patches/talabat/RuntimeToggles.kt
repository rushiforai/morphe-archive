package app.consumerclarity.patches.talabat

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.numberOfParameterRegisters
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod

fun MutableMethod.skipWhen(setting: String, contextRegister: String? = null) {
    val arguments = contextRegister?.let { "{$it}" } ?: "{}"
    val signature = contextRegister?.let { "(Landroid/content/Context;)Z" } ?: "()Z"
    addInstructions(
        0,
        """
            invoke-static $arguments, Lapp/consumerclarity/ConsumerClaritySettings;->$setting$signature
            move-result v0
            if-eqz v0, :cc_return
            return-void
            :cc_return
            nop
        """,
    )
}

fun MutableMethod.returnFalseWhen(setting: String) {
    addInstructions(
        0,
        """
            invoke-static {}, Lapp/consumerclarity/ConsumerClaritySettings;->$setting()Z
            move-result v0
            if-eqz v0, :cc_return
            const/4 v0, 0x0
            return v0
            :cc_return
            nop
        """,
    )
}

private fun MutableMethod.requireLocal() {
    val body = implementation ?: throw PatchException("$definingClass->$name has no implementation")
    if (body.registerCount - numberOfParameterRegisters < 1) {
        throw PatchException("$definingClass->$name has no local register for a settings guard")
    }
}

private fun MutableMethod.guard(key: String, result: String) {
    requireLocal()
    addInstructions(
        0,
        """
            const-string v0, "$key"
            invoke-static {v0}, Lapp/consumerclarity/ConsumerClaritySettings;->enabled(Ljava/lang/String;)Z
            move-result v0
            if-eqz v0, :cc_original
            $result
            :cc_original
            nop
        """,
    )
}

fun MutableMethod.skipWhenKey(key: String) = guard(key, "return-void")

fun MutableMethod.returnFalseWhenKey(key: String) = guard(
    key,
    """
        const/4 v0, 0x0
        return v0
    """,
)

fun MutableMethod.returnNullWhenKey(key: String) = guard(
    key,
    """
        const/4 v0, 0x0
        return-object v0
    """,
)

fun MutableMethod.returnEmptySentryIdWhenKey(key: String) = guard(
    key,
    """
        sget-object v0, Lio/sentry/protocol/SentryId;->EMPTY_ID:Lio/sentry/protocol/SentryId;
        return-object v0
    """,
)
