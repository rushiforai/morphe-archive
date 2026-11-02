package dev.twitchpatches.patches.twitch.ads

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import dev.twitchpatches.patches.twitch.settings.settingsPatch
import dev.twitchpatches.patches.twitch.shared.*

private object ClientAdRequestPresenterFingerprint : Fingerprint(
    strings = listOf("ad request already active"),
)

private object DisabledClientAdStateConstructorFingerprint : Fingerprint(
    classFingerprint = ClientAdRequestPresenterFingerprint,
    name = "<init>",
    isStatic = false,
    filters = listOf(
        methodCall(
            definingClass = "Ltv/twitch/android/core/mvp/presenter/StateMachine;",
            name = "<init>",
        )
    ),
)

@Suppress("unused")
val blockClientAdsPatch = bytecodePatch(
    name = "Block client-requested ads",
    description = "Blocks native player ad requests. Restart Twitch after changing this setting.",
    default = true,
) {
    compatibleWith(TwitchTarget.compatibility)
    dependsOn(settingsPatch)
    execute {
        val constructor = DisabledClientAdStateConstructorFingerprint.originalMethod
        if (!AccessFlags.PUBLIC.isSet(constructor.accessFlags) || constructor.parameterTypes.count { it.toString() == "Z" } != 1)
            throw PatchException("Client-ad disabled-state constructor contract changed")
        val disabled = disabledClientAdState(constructor)
        val state = classDefBy(disabled.type)
        if (state.fields.any { !AccessFlags.STATIC.isSet(it.accessFlags) } ||
            classDefBy(state.superclass ?: "").interfaces.none { it == "Ltv/twitch/android/core/mvp/presenter/PresenterState;" })
            throw PatchException("Client-ad disabled singleton no longer implements the original state contract")
        val register = parameterWord(constructor, constructor.parameterTypes.indexOfFirst { it.toString() == "Z" })
        DisabledClientAdStateConstructorFingerprint.method.insertBeforeWithLabels(0, """
                invoke-static/range {p$register .. p$register}, $AD_SETTINGS->allowClientAds(Z)Z
                move-result p$register
        """)
        initializeAdFeature(0)
    }
}
