package app.fakh.patches.smartlife

import app.fakh.patches.smartlife.shared.Constants.COMPATIBILITY_BARDI
import app.fakh.patches.smartlife.shared.Constants.COMPATIBILITY_SMARTLIFE
import app.fakh.patches.smartlife.shared.Constants.COMPATIBILITY_TUYA_SMART
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction

/** The Liquid Glass switch in Settings, which turns the glass bar and the glass cards on and off. */
private val liquidGlassSwitchPatch = resourcePatch {
    execute {
        addSettingsSwitch("fakh_liquid_glass")
    }
}

/**
 * `ThingFragmentTabHost.a(ViewGroup, View, Fragment, boolean, boolean)`: adds one tab to the bottom bar. The tab
 * widget exists only after the host's setup, so the capsule goes in here instead of when the host is attached. Found
 * by its parameters, since R8 renames the method.
 */
private object AddTabFingerprint : Fingerprint(
    definingClass = "Lcom/thingclips/smart/hometab/ThingFragmentTabHost;",
    returnType = "V",
    parameters = listOf("Landroid/view/ViewGroup;", "Landroid/view/View;", "Landroidx/fragment/app/Fragment;", "Z", "Z"),
)

@Suppress("unused")
val glassNavigationBarPatch = bytecodePatch(
    name = "Glass navigation bar",
    description = "Draws the navigation bar as a floating, translucent capsule with a sliding selection pill, " +
        "in the app's own colors. Slide a finger along it to switch tabs.",
) {
    compatibleWith(COMPATIBILITY_SMARTLIFE, COMPATIBILITY_TUYA_SMART, COMPATIBILITY_BARDI)
    category("Theme")
    extendWith("extensions/extension.mpe")
    dependsOn(liquidGlassSwitchPatch, settingsSwitchesPatch)

    execute {
        val method = AddTabFingerprint.method
        val returns = method.implementation!!.instructions.withIndex()
            .filter { it.value.opcode == Opcode.RETURN_VOID }
            .map { it.index }
        if (returns.isEmpty()) throw PatchException("Smart Life: the add-tab method has no return")
        // From the last return up, so the earlier indexes stay valid. p0 is only read.
        returns.reversed().forEach {
            method.addInstructions(
                it,
                "invoke-static { p0 }, Lapp/fakh/extension/smartlife/GlassNavigationBar;->install(Landroid/widget/TabHost;)V",
            )
        }
    }
}

/** The interfaces of the cards of the Device Management page. */
private val MANAGEMENT_CARD_INTERFACES = setOf(
    "Lcom/thingclips/smart/home/adv/api/ui/IDeviceUIItemView;",
    "Lcom/thingclips/smart/device/list/management/adapter/IDeviceCard;",
)

/** The constructor of a device card, which sets its own background last. */
private fun cardConstructorFingerprint(type: String) = Fingerprint(
    definingClass = type,
    name = "<init>",
    returnType = "V",
    parameters = listOf("Landroid/content/Context;", "Landroid/util/AttributeSet;", "I"),
)

/** The device card on the Favorites page of the Home tab. */
private val smallCardFingerprint = cardConstructorFingerprint("Lcom/thingclips/smart/home/adv/widget/SmallCard;")

/** The device card on a room page of the Home tab, such as Unassigned. */
private val roomCardFingerprint = cardConstructorFingerprint("Lcom/thingclips/smart/home/adv/widget/RoomDeviceSmallCard;")

/**
 * `updateGradientBackground(View, WeatherState)` of a weather card controller (Medium with two readings, Large with
 * three), which colors the card for the weather.
 */
private fun weatherBackgroundFingerprint(controller: String) = Fingerprint(
    definingClass = "Lcom/thingclips/smart/home/adv/card/$controller;",
    name = "updateGradientBackground",
    returnType = "V",
    parameters = listOf("Landroid/view/View;", "Lcom/thingclips/smart/home/adv/bean/WeatherState;"),
)

private val weatherMediumFingerprint = weatherBackgroundFingerprint("WeatherMediumController")
private val weatherLargeFingerprint = weatherBackgroundFingerprint("WeatherLargeController")

/** `BaseViewController.createAndAddChild(ViewGroup, LayoutParams)`: inflates every other card of the Home tab. */
private object CreateCardFingerprint : Fingerprint(
    definingClass = "Lcom/thingclips/smart/home/adv/api/base/BaseViewController;",
    name = "createAndAddChild",
    returnType = "Landroid/view/View;",
    parameters = listOf("Landroid/view/ViewGroup;", "Landroid/view/ViewGroup\$LayoutParams;"),
)

@Suppress("unused")
val glassCardsPatch = bytecodePatch(
    name = "Glass cards",
    description = "Draws the cards on the Home tab as glass in the app's own colors, and gives the weather card a glass edge over its weather background.",
) {
    compatibleWith(COMPATIBILITY_SMARTLIFE, COMPATIBILITY_TUYA_SMART, COMPATIBILITY_BARDI)
    category("Theme")
    extendWith("extensions/extension.mpe")
    dependsOn(liquidGlassSwitchPatch, settingsSwitchesPatch)

    execute {
        /** Calls [call] with [register] before every return of [fingerprint]'s method. */
        fun beforeReturns(fingerprint: Fingerprint, register: String, call: String) {
            val method = fingerprint.method
            val returns = method.implementation!!.instructions.withIndex()
                .filter { it.value.opcode == Opcode.RETURN_VOID }
                .map { it.index }
            if (returns.isEmpty()) throw PatchException("Smart Life: ${method.definingClass}->${method.name} has no return")
            // From the last return up, so the earlier indexes stay valid. The register is only read.
            returns.reversed().forEach {
                method.addInstructions(it, "invoke-static { $register }, Lapp/fakh/extension/smartlife/GlassCards;->$call(Landroid/view/View;)V")
            }
        }

        beforeReturns(smallCardFingerprint, "p0", "install")
        beforeReturns(roomCardFingerprint, "p0", "install")
        // At the return p1 holds the card's CardView, which the method looked up into it, or null when it found none.
        beforeReturns(weatherMediumFingerprint, "p1", "weather")
        beforeReturns(weatherLargeFingerprint, "p1", "weather")

        // The Device Management page inflates its cards through IDeviceUIItemView (and IDeviceCard in its older lists),
        // which tell each one when its layout is inflated; the card's layout is the argument.
        var managementCards = 0
        classDefForEach { classDef ->
            if (classDef.interfaces.none { it in MANAGEMENT_CARD_INTERFACES }) return@classDefForEach
            mutableClassDefBy(classDef).methods
                .filter { it.name == "viewInflated" && it.returnType == "V" && it.parameterTypes.map { type -> type.toString() } == listOf("Landroid/view/View;") }
                .forEach {
                    managementCards++
                    it.implementation!!.instructions.withIndex()
                        .filter { instruction -> instruction.value.opcode == Opcode.RETURN_VOID }
                        .map { instruction -> instruction.index }
                        .reversed()
                        .forEach { index ->
                            it.addInstructions(index, "invoke-static { p1 }, Lapp/fakh/extension/smartlife/GlassCards;->managementCard(Landroid/view/View;)V")
                        }
                }
        }
        if (managementCards == 0) throw PatchException("Smart Life: no Device Management card found")

        CreateCardFingerprint.method.apply {
            val returns = implementation!!.instructions.withIndex().filter { it.value.opcode == Opcode.RETURN_OBJECT }
            if (returns.size != 1) throw PatchException("Smart Life: expected one return in createAndAddChild, found ${returns.size}")
            val register = (returns[0].value as OneRegisterInstruction).registerA
            addInstructions(
                returns[0].index,
                """
                    invoke-static { v$register }, Lapp/fakh/extension/smartlife/GlassCards;->card(Landroid/view/View;)Landroid/view/View;
                    move-result-object v$register
                """,
            )
        }
    }
}
