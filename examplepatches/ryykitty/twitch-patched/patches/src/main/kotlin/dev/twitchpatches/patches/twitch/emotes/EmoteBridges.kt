package dev.twitchpatches.patches.twitch.emotes

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import dev.twitchpatches.patches.twitch.shared.reference

internal fun BytecodePatchContext.emoteConnectionBridge(connection: Method): String {
    val owner = mutableClassDefBy(connection.definingClass)
    val name = "twitchPatchesChatConnected"
    if (owner.methods.any { it.name == name }) throw PatchException("Emotes: chat connection bridge already exists.")
    val bridge = ImmutableMethod(owner.type, name, connection.parameters, "V",
        AccessFlags.PUBLIC.value or AccessFlags.STATIC.value, null, null,
        MutableMethodImplementation(3)).toMutable()
    bridge.addInstructionsWithLabels(0, emoteConnectionBody(connection.parameterTypes[0].toString()))
    owner.methods.add(bridge)
    return bridge.reference
}

internal fun emoteConnectionBody(channelType: String): String = when (channelType) {
    "Ljava/lang/String;" -> """
        invoke-static/range {p0 .. p1}, $EMOTES->onChannelChanged(Ljava/lang/String;Ljava/lang/String;)V
        return-void
    """
    CHANNEL_ID -> """
        if-eqz p0, :done
        invoke-virtual/range {p0 .. p0}, $CHANNEL_ID->toString()Ljava/lang/String;
        move-result-object v0
        invoke-static {v0, p1}, $EMOTES->onChannelChanged(Ljava/lang/String;Ljava/lang/String;)V
        :done
        return-void
    """
    else -> throw PatchException("Emotes: unsupported channel ID bridge type.")
}

internal fun BytecodePatchContext.emoteRowBridge(hooks: EmoteHooks): String {
    val model = mutableClassDefBy(hooks.source.definingClass)
    val holder = mutableClassDefBy(hooks.binder.definingClass)
    val getterName = "twitchPatchSourceChannel"
    val bindName = "twitchPatchBindEmotes"
    if (model.methods.any { it.name == getterName } || holder.methods.any { it.name == bindName })
        throw PatchException("Emotes: generated chat bridges already exist.")
    val getter = ImmutableMethod(model.type, getterName, emptyList(), "Ljava/lang/String;",
        AccessFlags.PUBLIC.value or AccessFlags.FINAL.value, null, null, MutableMethodImplementation(2)).toMutable()
    getter.addInstructions(0, """
        iget-object v0, p0, ${hooks.source}
        return-object v0
    """)
    model.methods.add(getter)
    val bind = ImmutableMethod(holder.type, bindName,
        listOf(ImmutableMethodParameter(holder.type, null, null), ImmutableMethodParameter(model.type, null, null)), "V",
        AccessFlags.PUBLIC.value or AccessFlags.STATIC.value, null, null, MutableMethodImplementation(4)).toMutable()
    bind.addInstructions(0, """
        iget-object v0, p0, ${hooks.textView}
        invoke-virtual {p1}, ${getter.reference}
        move-result-object v1
        invoke-static {v0, v1}, $EMOTES->bind(Landroid/widget/TextView;Ljava/lang/String;)V
        return-void
    """)
    holder.methods.add(bind)
    return bind.reference
}
