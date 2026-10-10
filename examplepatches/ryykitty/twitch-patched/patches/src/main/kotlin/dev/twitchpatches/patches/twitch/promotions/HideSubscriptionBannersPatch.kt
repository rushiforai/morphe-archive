package dev.twitchpatches.patches.twitch.promotions

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.resource.ResourceType
import app.morphe.patcher.resource.resourceId
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import dev.twitchpatches.patches.twitch.settings.resolveSettingsHooks
import dev.twitchpatches.patches.twitch.settings.settingsPatch
import dev.twitchpatches.patches.twitch.shared.*

private const val BANNER_POLICY = "Ldev/twitchpatches/extension/promotions/SubscriptionBannerSettings;"

@Suppress("unused")
val hideSubscriptionBannersPatch = bytecodePatch(
    name = "Hide subscription discount banners",
    description = "Hides subscription offers, discount banners and promotional labels.",
    default = true,
) {
    compatibleWith(TwitchTarget.compatibility)
    dependsOn(settingsPatch, reactNativeBridgePatch, reactNativeSubscriptionBannersPatch)
    execute {
        val composer = resolveSettingsHooks().composer
        val title = resourceId(ResourceType.STRING, "creator_led_promotion_title")
        val subtitle = resourceId(ResourceType.STRING, "creator_led_promotion_subtitle")
        val candidates = mutableListOf<Method>()
        classDefForEach { type -> candidates.addAll(type.methods.filter { method ->
            val parameters = method.parameterTypes.map { it.toString() }
            parameters.size == 7 && parameters.subList(2, 4) == List(2) { "Ljava/lang/String;" } &&
                parameters.takeLast(2) == listOf(composer, "I") && method.returnType == "V" &&
                method.code().filterIsInstance<WideLiteralInstruction>().map { it.wideLiteral }.let {
                    title in it && subtitle in it
                }
        }) }
        val renderer = candidates.uniqueHook("subscription promotion title/subtitle renderer")
        validateOptionalRenderer(renderer)
        val promotionType = renderer.parameterTypes[1].toString()
        val creatorLed = renderer.references().filterIsInstance<FieldReference>().filter {
            it.definingClass == promotionType && it.name == "CREATOR_LED" && it.type == promotionType
        }.distinctBy { it.toString() }.uniqueHook("creator-led banner discriminator")
        if (classDefBy(creatorLed.definingClass).superclass != "Ljava/lang/Enum;")
            throw PatchException("Subscription promotion discriminator is no longer an enum")
        val application = classDefBy("Ltv/twitch/android/app/consumer/TwitchApplication;").methods
            .filter { it.name == "onCreate" && it.isInstance(emptyList(), "V") }
            .uniqueHook("subscription banner policy initialization")
        mutableClassDefBy(renderer.definingClass).methods.filter { it.reference == renderer.reference }
            .uniqueHook("resolved banner renderer").gateOptionalRenderer(BANNER_POLICY)
        val app = mutableClassDefBy(application.definingClass).methods.filter { it.reference == application.reference }
            .uniqueHook("resolved application initializer")
        app.code().withIndex().filter { it.value.opcode == Opcode.RETURN_VOID }.map { it.index }.asReversed().forEach {
            app.insertAtReturn(it, "invoke-static/range {p0 .. p0}, $BANNER_POLICY->initialize(Landroid/app/Application;)V")
        }
    }
}
