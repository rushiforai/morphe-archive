package dev.twitchpatches.patches.twitch.ads

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import dev.twitchpatches.patches.twitch.settings.settingsPatch
import dev.twitchpatches.patches.twitch.shared.*

@Suppress("unused")
val blockClientAdsPatch = bytecodePatch(
    name = "Block client-requested ads",
    description = "Suppresses native ad requests. Restart Twitch after changing the setting.",
    default = true,
) {
    compatibleWith(TwitchTarget.candidateCompatibility)
    dependsOn(settingsPatch)
    execute {
        val classes = mutableListOf<com.android.tools.smali.dexlib2.iface.ClassDef>().apply { classDefForEach { add(it) } }
        val presenter = classes.filter { type -> type.methods.any { it.hasStrings("ad request already active") } }
            .uniqueHook("client-ad request presenter")
        val constructor = presenter.methods.filter { it.name == "<init>" &&
            AccessFlags.PUBLIC.isSet(it.accessFlags) && it.parameterTypes.count { p -> p.toString() == "Z" } == 1 &&
            it.references().filterIsInstance<MethodReference>().any { ref ->
                ref.definingClass == "Ltv/twitch/android/core/mvp/presenter/StateMachine;" && ref.name == "<init>"
            }
        }.uniqueHook("client-ad disabled-state constructor")
        val disabled = disabledClientAdState(constructor)
        val state = classDefBy(disabled.type)
        if (state.fields.any { !AccessFlags.STATIC.isSet(it.accessFlags) } ||
            classDefBy(state.superclass ?: "").interfaces.none { it == "Ltv/twitch/android/core/mvp/presenter/PresenterState;" })
            throw PatchException("Client-ad disabled singleton no longer implements the original state contract")
        val register = parameterWord(constructor, constructor.parameterTypes.indexOfFirst { it.toString() == "Z" })
        mutable(constructor).insertBeforeWithLabels(0, """
                invoke-static/range {p$register .. p$register}, $AD_SETTINGS->allowClientAds(Z)Z
                move-result p$register
        """)
        initializeAdFeature(0)
    }
}
