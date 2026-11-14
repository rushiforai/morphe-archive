package app.fakh.patches.smartlife

import app.fakh.patches.smartlife.shared.Constants.COMPATIBILITY_BARDI
import app.fakh.patches.smartlife.shared.Constants.COMPATIBILITY_SMARTLIFE
import app.fakh.patches.smartlife.shared.Constants.COMPATIBILITY_TUYA_SMART
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference

/** `SmartApplication.attachBaseContext(Context)`: the app's entry point, run before anything reads its signature. */
private object AttachBaseContextFingerprint : Fingerprint(
    definingClass = "Lcom/smart/app/SmartApplication;",
    name = "attachBaseContext",
    returnType = "V",
    parameters = listOf("Landroid/content/Context;"),
)

/**
 * The method that shows the "integrity check fails, it will quit automatically" toast and kills the process 3.8
 * seconds later, once the security library decides the signature is not Tuya's. Found by the string resource it
 * looks up, since R8 renames the class and its shape differs per app.
 */
private object IntegrityKillFingerprint : Fingerprint(
    returnType = "V",
    strings = listOf("thing_app_siganature_illegal"),
)

/**
 * libthing_security reads the app's signing certificate and kills the process when it is not Tuya's, so this
 * patch makes the app see the original certificate again through a PackageManager proxy.
 */
@Suppress("unused")
val signatureSpoofPatch = bytecodePatch(
    name = "Spoof signature",
    description = "Lets the patched app start. A patched app is signed with a different key, which the app's " +
        "integrity check rejects, so without this it closes a few seconds after it opens.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_SMARTLIFE, COMPATIBILITY_TUYA_SMART, COMPATIBILITY_BARDI)
    category("Feature")
    extendWith("extensions/extension.mpe")

    execute {
        AttachBaseContextFingerprint.method.addInstructions(
            0,
            "invoke-static { p1 }, Lapp/fakh/extension/smartlife/SignatureSpoof;->install(Landroid/content/Context;)V",
        )
        // Safety net for phones where the spoof does not cover every check: the app keeps running instead of quitting.
        IntegrityKillFingerprint.method.addInstructions(
            0,
            "invoke-static { }, Lapp/fakh/extension/smartlife/SignatureSpoof;->logIntegrityKill()V\nreturn-void",
        )
    }
}

/** Whether this method creates an instance of [type]. */
private fun Method.instantiates(type: String): Boolean = implementation?.instructions?.any {
    it.opcode == Opcode.NEW_INSTANCE && ((it as ReferenceInstruction).reference as TypeReference).type == type
} == true

/**
 * The method of AIAssistantEnableServiceImpl that builds the "How can I help?" bar; null makes the host skip it.
 * Found by the view it creates, since R8 renames the method between releases.
 */
private object AiBarFactoryFingerprint : Fingerprint(
    definingClass = "Lcom/thingclips/smart/ai/aiassistant/AIAssistantEnableServiceImpl;",
    returnType = "Landroid/view/View;",
    custom = { method, _ -> method.instantiates("Lcom/thingclips/smart/ai/aiassistant/ui/view/AIHomeEntryView;") },
)

/** The same service's factory for the floating bar on device panels; null makes the host skip it. */
private object PanelAiBarFactoryFingerprint : Fingerprint(
    definingClass = "Lcom/thingclips/smart/ai/aiassistant/AIAssistantEnableServiceImpl;",
    returnType = "Lcom/thingclips/smart/ai/assistant/view/AIBarView;",
    custom = { method, _ -> method.instantiates("Lcom/thingclips/smart/ai/aiassistant/ui/view/InnerFloatAIBarLayout;") },
)

/** HomeAdvCardService.addUiCard: registers every card type the home list can show. */
private object AddUiCardFingerprint : Fingerprint(
    definingClass = "Lcom/thingclips/smart/home/adv/service/HomeAdvCardService;",
    name = "addUiCard",
    returnType = "V",
)

internal const val CELL_PACKAGE = "Lcom/thingclips/smart/personal/center/plug/cell"

/**
 * The `f(Continuation)` of a Me-tab cell: the suspend function that tells the list whether to show the cell. BARDI
 * renames the method, so [name] can be left out to match by signature alone.
 */
internal fun cellVisibilityFingerprint(
    cell: String,
    name: String? = "f",
) = Fingerprint(
    definingClass = "$CELL_PACKAGE/$cell;",
    name = name,
    returnType = "Ljava/lang/Object;",
    parameters = listOf("Lkotlin/coroutines/Continuation;"),
)

private val welfareEntryFingerprint = cellVisibilityFingerprint("WelfareEntryCell")
private val welfareBannerFingerprint = cellVisibilityFingerprint("WelfareBannerCell")

internal const val HIDE_CELL = """
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;
    return-object v0
"""

@Suppress("unused")
val hideRewardsHubPatch = bytecodePatch(
    name = "Hide Rewards Hub",
    description = "Removes the \"Rewards Hub\" row and its banner from the Me tab.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_SMARTLIFE, COMPATIBILITY_TUYA_SMART)
    category("Layout")
    extendWith("extensions/extension.mpe")
    dependsOn(switchRow("fakh_hide_rewards"), settingsSwitchesPatch)

    execute {
        welfareEntryFingerprint.method.whenSwitchOn("fakh_hide_rewards", HIDE_CELL)
        welfareBannerFingerprint.method.whenSwitchOn("fakh_hide_rewards", HIDE_CELL)
    }
}

/** AbsBaseArcherCell.f: the default "show this Me-tab row" answer of every cell that does not override it. */
private object DefaultCellVisibilityFingerprint : Fingerprint(
    definingClass = "Lcom/thingclips/smart/archer/api/AbsBaseArcherCell;",
    name = "f",
    returnType = "Ljava/lang/Object;",
    parameters = listOf("Lkotlin/coroutines/Continuation;"),
)

/**
 * Mini-app ids of the server-defined Me-tab rows the enabled patches hide, each with the switch in Settings that has
 * to be on; the ids do not change with the app language.
 */
private val hiddenRowIds = linkedMapOf<String, String>()

/** The class with type [type]. */
private fun BytecodePatchContext.classDef(type: String): ClassDef {
    var found: ClassDef? = null
    classDefForEach { if (it.type == type) found = it }
    return found ?: throw PatchException("Smart Life: $type not found.")
}

/**
 * Where a CustomIotCell keeps its row bean and where that bean keeps the mini-app id, as smali field references.
 * R8 renames both classes and fields between releases, so they are read from the code: the bean is the second
 * constructor parameter of the cell, held in the cell's only field of that type, and the id is the field the bean's
 * constructor stores its third parameter in.
 */
private fun BytecodePatchContext.customRowIdPath(): Pair<String, String> {
    val cell = classDef("$CELL_PACKAGE/CustomIotCell;")
    val beanType = cell.methods.single { it.name == "<init>" }.parameterTypes[1].toString()
    val cellField = cell.fields.single { it.type == beanType }.name

    val constructor = classDef(beanType).methods.single { it.name == "<init>" }
    val implementation = constructor.implementation ?: throw PatchException("Smart Life: $beanType has no constructor body.")
    val parameterRegisters = 1 + constructor.parameterTypes.sumOf { if (it.toString() == "J" || it.toString() == "D") 2 else 1 }
    val thisRegister = implementation.registerCount - parameterRegisters
    val idRegister = thisRegister + 3 // this, then the type, the url and the id.
    val idField = implementation.instructions
        .filter { it.opcode == Opcode.IPUT_OBJECT }
        .firstOrNull { (it as TwoRegisterInstruction).registerA == idRegister && it.registerB == thisRegister }
        ?.let { ((it as ReferenceInstruction).reference as FieldReference).name }
        ?: throw PatchException("Smart Life: the mini-app id field of $beanType was not found.")

    return "$CELL_PACKAGE/CustomIotCell;->$cellField:$beanType" to "$beanType->$idField:Ljava/lang/String;"
}

/**
 * Hides the server-defined Me-tab rows listed in [hiddenRowIds]. Those rows are CustomIotCell instances that all
 * share the default visibility answer, so one check runs there and compares each row's mini-app id (CustomIotCell
 * compares the same field itself); p0 and p1 are free to reuse because the method only returns a constant afterwards.
 * Runs once, after every hide patch added its id.
 */
private val customRowFilterPatch = bytecodePatch {
    finalize {
        if (hiddenRowIds.isEmpty()) return@finalize
        val (cellField, idField) = customRowIdPath()
        val matches = hiddenRowIds.entries.withIndex().joinToString("\n") { (index, row) ->
            // A row stays while its switch is off.
            """
                const-string p1, "${row.key}"
                invoke-virtual { p0, p1 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
                move-result p1
                if-eqz p1, :next$index
                ${switchOn(row.value, "p1")}
                if-nez p1, :hide
                :next$index
            """
        }
        DefaultCellVisibilityFingerprint.method.addInstructionsWithLabels(
            0,
            """
                instance-of p1, p0, $CELL_PACKAGE/CustomIotCell;
                if-eqz p1, :show
                check-cast p0, $CELL_PACKAGE/CustomIotCell;
                iget-object p0, p0, $cellField
                iget-object p0, p0, $idField
                $matches
                goto :show
                :hide
                sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;
                return-object p1
            """,
            ExternalLabel("show", DefaultCellVisibilityFingerprint.method.getInstruction(0)),
        )
    }
}

@Suppress("unused")
val hideMyOrdersPatch = bytecodePatch(
    name = "Hide My Orders",
    description = "Removes the \"My Orders\" row from the Me tab.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_SMARTLIFE, COMPATIBILITY_TUYA_SMART)
    category("Layout")
    extendWith("extensions/extension.mpe")
    dependsOn(customRowFilterPatch, switchRow("fakh_hide_orders"), settingsSwitchesPatch)

    execute { hiddenRowIds["tyko2ipbcpehi0hwtv"] = "fakh_hide_orders" }
}

@Suppress("unused")
val hideTuyaAiWebPatch = bytecodePatch(
    name = "Hide Tuya AI Web Version",
    description = "Removes the \"Tuya AI Web Version\" row from the Me tab.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_SMARTLIFE, COMPATIBILITY_TUYA_SMART)
    category("Layout")
    extendWith("extensions/extension.mpe")
    dependsOn(customRowFilterPatch, switchRow("fakh_hide_ai_web"), settingsSwitchesPatch)

    execute { hiddenRowIds["tyezgn3ay0hma8xah6"] = "fakh_hide_ai_web" }
}

/** `AIPlusMenuView(Context, AttributeSet, int)`: the "Plus" pill of the home header, which inflates its layout. */
private object PlusMenuViewFingerprint : Fingerprint(
    definingClass = "Lcom/thingclips/smart/ai/aiassistant/ui/view/AIPlusMenuView;",
    name = "<init>",
    returnType = "V",
    parameters = listOf("Landroid/content/Context;", "Landroid/util/AttributeSet;", "I"),
)

@Suppress("unused")
val hidePlusButtonPatch = bytecodePatch(
    name = "Hide Plus button",
    description = "Removes the \"Plus\" pill from the home header.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_SMARTLIFE, COMPATIBILITY_TUYA_SMART)
    category("Layout")
    extendWith("extensions/extension.mpe")
    dependsOn(switchRow("fakh_hide_plus"), settingsSwitchesPatch)

    execute {
        PlusMenuViewFingerprint.method.apply {
            val returns = implementation!!.instructions.withIndex().filter { it.value.opcode == Opcode.RETURN_VOID }
            if (returns.isEmpty()) throw PatchException("Smart Life: AIPlusMenuView's constructor has no return")
            // From the last return up, so the earlier indexes stay valid. p0 is only read.
            returns.reversed().forEach {
                addInstructions(it.index, "invoke-static { p0 }, Lapp/fakh/extension/smartlife/Switches;->plus(Landroid/view/View;)V")
            }
        }
    }
}

@Suppress("unused")
val hideRecommendedForYouPatch = bytecodePatch(
    name = "Hide Recommended for you",
    description = "Removes the \"Recommended for You\" section and its cards (AI Notes and the rest) from the home screen.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_SMARTLIFE, COMPATIBILITY_TUYA_SMART)
    category("Layout")
    extendWith("extensions/extension.mpe")
    dependsOn(switchRow("fakh_hide_recommended"), settingsSwitchesPatch)

    execute {
        AddUiCardFingerprint.method.apply {
            // While the switch is on the recommendation card is never registered, so the home list has nothing to
            // build it from.
            addInstructionsWithLabels(
                0,
                """
                    instance-of v0, p1, Lcom/thingclips/smart/home/adv/card/HomeRecoSlotsCard;
                    if-eqz v0, :register
                    ${switchOn("fakh_hide_recommended", "v0")}
                    if-eqz v0, :register
                    return-void
                """,
                ExternalLabel("register", getInstruction(0)),
            )
        }
    }
}

@Suppress("unused")
val hideAiAskBarPatch = bytecodePatch(
    name = "Hide AI ask bar",
    description = "Removes the \"How can I help?\" Tuya AI bar above the navigation bar and at the bottom of device panels.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_SMARTLIFE, COMPATIBILITY_TUYA_SMART)
    category("Layout")
    extendWith("extensions/extension.mpe")
    dependsOn(switchRow("fakh_hide_ai_bar"), settingsSwitchesPatch)

    execute {
        listOf(AiBarFactoryFingerprint, PanelAiBarFactoryFingerprint).forEach {
            it.method.whenSwitchOn("fakh_hide_ai_bar", "const/4 v0, 0x0\nreturn-object v0")
        }
    }
}

/** The app shell's loader of `tab_config.json`, the tabs of the navigation bar; R8 renames its class. */
private object TabConfigLoaderFingerprint : Fingerprint(
    returnType = "Lcom/thingclips/smart/appshell/model/TabModule;",
    strings = listOf("getTabList error: "),
)

/**
 * Hands every tab list the loader returns to the extension, which drops the tabs whose hide switch is on. Shared by
 * the patches that hide a tab, so the call goes in once.
 */
internal val tabFilterPatch = bytecodePatch {
    extendWith("extensions/extension.mpe")

    execute {
        TabConfigLoaderFingerprint.method.apply {
            val returns = implementation!!.instructions.withIndex().filter { it.value.opcode == Opcode.RETURN_OBJECT }
            if (returns.isEmpty()) throw PatchException("Smart Life: the tab config loader has no return")
            // From the last return up, so the earlier indexes stay valid. The returned register is only read.
            returns.reversed().forEach {
                val register = (it.value as OneRegisterInstruction).registerA
                addInstructions(it.index, "invoke-static { v$register }, Lapp/fakh/extension/smartlife/Switches;->tabs(Ljava/lang/Object;)V")
            }
        }
    }
}

@Suppress("unused")
val hideExploreTabPatch = bytecodePatch(
    name = "Hide Explore tab",
    description = "Removes the Explore tab from the navigation bar.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_SMARTLIFE, COMPATIBILITY_TUYA_SMART)
    category("Layout")
    dependsOn(tabFilterPatch, switchRow("fakh_hide_explore"), settingsSwitchesPatch)
}

/** AdMobServiceImpl: the method that builds an ad slot view for a position, found by its Context and String parameters. */
private object AdSlotViewFingerprint : Fingerprint(
    definingClass = "Lcom/thingclips/smart/advertisement/admob/service/AdMobServiceImpl;",
    returnType = "Landroid/view/View;",
    custom = { method, _ ->
        method.parameterTypes.size >= 2 &&
            method.parameterTypes[0] == "Landroid/content/Context;" &&
            method.parameterTypes[1] == "Ljava/lang/String;"
    },
)

/** AdMobServiceImpl's entry query: asks whether the ad service has a Me-tab entry for a position code. */
private object AdEntryFingerprint : Fingerprint(
    definingClass = "Lcom/thingclips/smart/advertisement/admob/service/AdMobServiceImpl;",
    returnType = "Lcom/thingclips/smart/advertisement/admob/api/bean/MeEntryDisplayModel;",
    parameters = listOf("Ljava/lang/String;"),
)

@Suppress("unused")
val hideAdsPatch = bytecodePatch(
    name = "Hide ads",
    description = "Removes the Google ad banners and ad rows the app shows, such as the one above the Me menu.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_SMARTLIFE, COMPATIBILITY_TUYA_SMART)
    category("Privacy")
    extendWith("extensions/extension.mpe")
    dependsOn(switchRow("fakh_hide_ads"), settingsSwitchesPatch)

    execute {
        // Both return null, which their callers already handle (a pad device gets no ad slot at all).
        listOf(AdSlotViewFingerprint, AdEntryFingerprint).forEach {
            it.method.whenSwitchOn("fakh_hide_ads", "const/4 v0, 0x0\nreturn-object v0")
        }
    }
}
