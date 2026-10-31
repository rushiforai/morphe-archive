package dev.twitchpatches.patches.twitch.ads

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.util.proxy.mutableTypes.MutableField.Companion.toMutable
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.immutable.ImmutableField
import dev.twitchpatches.patches.twitch.reload.nativeReloadMethod
import dev.twitchpatches.patches.twitch.shared.*

private const val SKINS = "Ldev/twitchpatches/extension/ads/ChannelSkinRuntime;"
private const val SAVED = "twitchPatchesChannelSkinArguments:[Ljava/lang/Object;"

internal fun channelSkinCapture(method: Method) = nativeReloadMethod(method.definingClass, method.name,
    method.parameterTypes.map { it.toString() }, "V", method.parameterTypes.size + 3, """
        const/4 v0, ${method.parameterTypes.size}
        new-array v0, v0, [Ljava/lang/Object;
        ${method.parameterTypes.indices.joinToString("\n") { index -> """
            const/4 v1, $index
            aput-object p${index + 1}, v0, v1
        """ }}
        iput-object v0, p0, ${method.definingClass}->$SAVED
        invoke-static {p0}, $SKINS->capture(Ljava/lang/Object;)V
        return-void
    """)

internal fun BytecodePatchContext.blockChannelSkins(classes: List<ClassDef>) {
    val contract = channelSkinContract(classes)
    fun wrap(method: Method): String {
        require(method.parameterTypes.all { it.toString().startsWith("L") }) {
            "Channel sponsorship: renderer parameters changed."
        }
        val owner = mutableClassDefBy(method.definingClass)
        owner.fields.add(ImmutableField(owner.type, SAVED.substringBefore(':'), "[Ljava/lang/Object;",
            AccessFlags.PUBLIC.value, null, null, null).toMutable())
        val original = owner.methods.single { it.reference == method.reference }
        val wrapper = channelSkinCapture(method)
        owner.methods.remove(original)
        original.name = "twitchPatchesChannelSkinRenderOriginal"
        owner.methods.add(original)
        owner.methods.add(wrapper)
        return original.reference
    }
    val banner = wrap(contract.banner)
    val header = wrap(contract.header)
    val owner = mutableClassDefBy(contract.hide.definingClass)
    val hide = owner.methods.single { it.reference == contract.hide.reference }
    val hideName = hide.name
    owner.methods.remove(hide)
    hide.name = "twitchPatchesChannelSkinHideOriginal"
    owner.methods.add(hide)
    owner.methods.add(nativeReloadMethod(owner.type, hideName, emptyList(), "V", 2, """
        const/4 v0, 0x0
        iput-object v0, p0, ${owner.type}->$SAVED
        invoke-static {p0}, $SKINS->remove(Ljava/lang/Object;)V
        invoke-virtual {p0}, ${hide.reference}
        return-void
    """))
    fun arguments(method: Method) = method.parameterTypes.mapIndexed { index, type -> """
        const/4 v7, $index
        aget-object v${index + 1}, v6, v7
        check-cast v${index + 1}, $type
    """ }.joinToString("\n")
    val bridge = mutableClassDefBy(SKINS)
    bridge.methods.remove(bridge.methods.single { it.name == "render" })
    bridge.methods.add(nativeReloadMethod(SKINS, "render", listOf("Ljava/lang/Object;"), "V", 9, """
        move-object v0, p0
        instance-of v1, v0, ${contract.banner.definingClass}
        if-eqz v1, :header
        check-cast v0, ${contract.banner.definingClass}
        iget-object v6, v0, ${contract.banner.definingClass}->$SAVED
        if-eqz v6, :done
        invoke-static {}, $AD_SETTINGS->displayAdsBlocked()Z
        move-result v1
        if-eqz v1, :showBanner
        invoke-virtual {v0}, ${hide.reference}
        return-void
        :showBanner
        ${arguments(contract.banner)}
        invoke-virtual/range {v0 .. v5}, $banner
        return-void
        :header
        instance-of v1, v0, ${contract.header.definingClass}
        if-eqz v1, :done
        check-cast v0, ${contract.header.definingClass}
        iget-object v6, v0, ${contract.header.definingClass}->$SAVED
        if-eqz v6, :done
        ${arguments(contract.header)}
        invoke-static {}, $AD_SETTINGS->displayAdsBlocked()Z
        move-result v7
        if-eqz v7, :showHeader
        sget-object v4, ${contract.hidden}
        :showHeader
        invoke-virtual/range {v0 .. v4}, $header
        :done
        return-void
    """, static = true))
}
