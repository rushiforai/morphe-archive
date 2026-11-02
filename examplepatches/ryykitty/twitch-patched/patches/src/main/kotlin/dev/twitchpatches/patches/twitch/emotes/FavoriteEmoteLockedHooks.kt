package dev.twitchpatches.patches.twitch.emotes

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import com.android.tools.smali.dexlib2.iface.Method
import dev.twitchpatches.patches.twitch.shared.*

private const val TUID = "Ltv/twitch/android/models/Tuid;"

private class LockedEmoteConstructorFingerprint(clicked: String, parameters: List<String>) : Fingerprint(
    superclass = clicked,
    name = "<init>",
    parameters = parameters,
)

internal fun BytecodePatchContext.resolveLockedEmoteConstructor(h: NativePickerHooks): Method {
    val clicked = classDefBy(h.unlocked.definingClass).superclass.orEmpty()
    val parameters = listOf(h.generic.parameterTypes[3].toString(), PICKER_STRING, PICKER_STRING, TUID)
    return LockedEmoteConstructorFingerprint(clicked, parameters).originalMethod
}

internal fun lockedEmoteBridges(bridge: MutableClass, h: NativePickerHooks, locked: Method) {
    fun lockedRead(name: String, read: String) = replacePickerBridge(bridge, name, 1, """
        instance-of v0, p0, ${locked.definingClass}
        if-eqz v0, :other
        check-cast p0, ${locked.definingClass}
        $read
        return-object v0
        :other
        const/4 v0, 0x0
        return-object v0
    """)
    lockedRead("lockedToken", "iget-object v0, p0, ${pickerParameterField(locked, 2)}")
    lockedRead("lockedChannel", """
        iget-object v0, p0, ${pickerParameterField(locked, 3)}
        invoke-virtual {v0}, $TUID->toString()$PICKER_STRING
        move-result-object v0
    """)
    lockedRead("lockedKind", """
        iget-object v0, p0, ${pickerParameterField(locked, 0)}
        invoke-virtual {v0}, Ljava/lang/Enum;->name()$PICKER_STRING
        move-result-object v0
    """)
    val kind = locked.parameterTypes[0].toString()
    val asset = h.generic.parameterTypes[2].toString()
    val badge = h.model.parameterTypes[3].toString()
    replacePickerBridge(bridge, "lockedModel", 5, """
        invoke-static {p3}, $kind->valueOf($PICKER_STRING)$kind
        move-result-object v0
        new-instance v1, $TUID
        invoke-direct {v1, p2}, $TUID-><init>($PICKER_STRING)V
        new-instance v2, ${locked.definingClass}
        invoke-direct {v2, v0, p0, p1, v1}, ${locked.reference}
        sget-object v3, $asset->STATIC:$asset
        sget-object v0, $badge->LOCKED:$badge
        const-string v4, "FOLLOWER"
        invoke-virtual {p3, v4}, $PICKER_STRING->equals(Ljava/lang/Object;)Z
        move-result v4
        if-eqz v4, :build
        sget-object v0, $badge->HEART:$badge
        :build
        new-instance v4, ${h.model.definingClass}
        invoke-direct {v4, p0, v2, v3, v0}, ${h.model.reference}
        return-object v4
    """)
}
