package dev.twitchpatches.patches.twitch.ads

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import dev.twitchpatches.patches.twitch.settings.settingsPatch
import dev.twitchpatches.patches.twitch.shared.*

@Suppress("unused")
val hideDisplayAdsPatch = bytecodePatch(
    name = "Hide feed and display ads",
    description = "Hides sponsored feed cards, banners and display ads.",
    default = true,
) {
    compatibleWith(TwitchTarget.compatibility)
    dependsOn(settingsPatch, reactNativeBridgePatch, reactNativeFeedAdsPatch)
    execute {
        val classes = mutableListOf<com.android.tools.smali.dexlib2.iface.ClassDef>().apply { classDefForEach { add(it) } }
        val parser = classes.flatMap { it.methods }.filter {
            it.hasStrings("failed to parse display ad response: ") &&
                it.parameterTypes.map { p -> p.toString() } == listOf("Lretrofit2/adapter/rxjava2/Result;", "Z") &&
                AccessFlags.PUBLIC.isSet(it.accessFlags) && !AccessFlags.STATIC.isSet(it.accessFlags)
        }.uniqueHook("display-ad response parser")
        val noAd = parser.code().filter { it.opcode == Opcode.SGET_OBJECT }
            .mapNotNull { (it as? ReferenceInstruction)?.reference as? FieldReference }
            .filter { it.type == it.definingClass && classDefBy(it.type).superclass == parser.returnType }
            .distinctBy { it.toString() }.uniqueHook("native no-ad display result")
        val singleton = classDefBy(noAd.type).fields.filter { it.name == noAd.name && it.type == noAd.type }
            .uniqueHook("display no-ad singleton field")
        if (!AccessFlags.PUBLIC.isSet(singleton.accessFlags) || !AccessFlags.STATIC.isSet(singleton.accessFlags))
            throw PatchException("Display ads: no-ad field is not a public singleton.")
        val method = mutable(parser)
        val words = 1 + parser.parameterTypes.sumOf { if (it.toString() in listOf("J", "D")) 2 else 1 }
        val code = method.code()
        if ((method.implementation?.registerCount ?: 0) <= words || code.isEmpty())
            throw PatchException("Display ads: no scratch register at method entry.")
        method.addInstructionsWithLabels(0, """
            invoke-static {}, $AD_SETTINGS->displayAdsBlocked()Z
            move-result v0
            if-eqz v0, :original
            sget-object v0, $noAd
            return-object v0
        """, ExternalLabel("original", code.first()))
        blockBrowseDisplayAds(classes.flatMap { it.methods })
        initializeAdFeature(1)
    }
}
