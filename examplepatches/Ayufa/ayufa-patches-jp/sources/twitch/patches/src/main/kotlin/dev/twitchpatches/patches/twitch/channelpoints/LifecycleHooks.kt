package dev.twitchpatches.patches.twitch.channelpoints

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import dev.twitchpatches.patches.twitch.shared.code
import dev.twitchpatches.patches.twitch.shared.isInstance
import dev.twitchpatches.patches.twitch.shared.reference
import dev.twitchpatches.patches.twitch.shared.uniqueHook
import dev.twitchpatches.patches.twitch.shared.insertAtReturn

internal data class UiHooks(val application: Method)

internal fun BytecodePatchContext.resolveUiHooks(): UiHooks {
    val app = classDefBy("Ltv/twitch/android/app/consumer/TwitchApplication;").methods.filter {
        it.name == "onCreate" && it.isInstance(emptyList(), "V")
    }.uniqueHook("application onCreate")
    if (app.code().none { it.opcode == Opcode.RETURN_VOID }) {
        throw PatchException("Channel points: expected application return paths.")
    }
    return UiHooks(app)
}

internal fun BytecodePatchContext.applyUiHooks(hooks: UiHooks) {
    val app = mutableClassDefBy(hooks.application.definingClass).methods.single { it.reference == hooks.application.reference }
    app.code().withIndex().filter { it.value.opcode == Opcode.RETURN_VOID }
        .map { it.index }.asReversed().forEach {
            app.insertAtReturn(it, "invoke-static/range {p0 .. p0}, $RUNTIME->initialize(Landroid/app/Application;)V")
        }
}
