/*
 * Messenger anchors adapted from RookieEnough/De-Vanced at 0d01e3dd5ec82b6796b28b82c33fc6af4944b2e6
 * (including ReVanced contributions) and rushiranpise/morphe-patches at
 * 55ca6a05ea3559e95a0876316dcb7caad1f3c9cf. GPL-3.0. See NOTICE.
 */
package app.hushmessenger.patches.controls

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import com.android.tools.smali.dexlib2.iface.value.StringEncodedValue

internal const val SETTINGS = "Lapp/hushmessenger/extension/Settings;"
internal const val AD_ITEM = "Lcom/facebook/messaging/business/inboxads/common/InboxAdsItem;"
internal const val IMMUTABLE_LIST = "Lcom/google/common/collect/ImmutableList;"

private val facebookPlugins = setOf(
    "Lcom/facebook/messaging/inbox/tab/plugins/core/tabtoolbarbutton/facebookbutton/facebooktoolbarbutton/FacebookButtonTabButtonImplementation;",
    "Lcom/facebook/messaging/marketplace/plugins/folder/navbarmenuitem/NavBarMenuItemImplementation;",
    "Lcom/facebook/messaging/profile/plugins/core/threadsettingsactionbutton/facebookprofile/ThreadSettingsFacebookProfileActionButton;",
    "Lcom/facebook/messaging/navigation/plugins/drawerfoldersections/fbshortcutsfoldersection/FacebookShortcutsFolderSection;",
    "Lcom/facebook/messaging/communitymessaging/plugins/channelinvite/sharetofacebookbutton/ShareToFacebookButtonImplementation;",
    "Lcom/facebook/messaging/publicchats/plugins/externalsharehscrollbuttons/sharetofacebook/ShareToFacebookHScrollButtonImplementation;",
)

internal val expectedHooks = mapOf(
    "stories" to setOf("LX/1mi;->A00()Z"),
    "facebook" to setOf(
        "LX/Sc2;->A06()Z", "LX/YFi;->A04()Z", "LX/2aP;->A0C()Z", "LX/3Ec;->A00()Z",
        "LX/3me;->A00()Z", "LX/HFd;->A02()Z", "LX/HRL;->A06()Z", "LX/HRM;->A02()Z",
        "LX/JiY;->A06()Z", "LX/Jir;->A02()Z", "LX/JjE;->A00()Z", "LX/JjM;->A01()Z",
        "LX/JjO;->A02()Z", "LX/JjQ;->A02()Z", "LX/JjV;->A03()Z", "LX/JjW;->A03()Z",
        "LX/JjY;->A01()Z", "LX/JjZ;->A01()Z", "LX/Jjb;->A06()Z", "LX/Jjc;->A06()Z", "LX/Jjd;->A06()Z",
    ),
    "ai_menu" to setOf("LX/HFe;->A00()Z", "LX/HFe;->A01()Z", "LX/Jiu;->A00()Z", "LX/Jiu;->A01()Z"),
    "ai_fab" to setOf("LX/6k8;->render(LX/2MZ;)LX/1GG;"),
    "subtabs" to setOf("LX/2UL;->run()V"),
    "typing" to setOf("LX/Ahp;->run()V"),
    "bubbles" to setOf("LX/2ZW;->A00()Z"),
    "browser" to setOf("Lcom/facebook/messaging/browser/util/MessengerBrowserLauncher;->A0L(Landroid/net/Uri;Lcom/facebook/auth/usersession/FbUserSession;)Z"),
    "ads" to setOf("LX/2Wl;->D2i(LX/1fx;${IMMUTABLE_LIST}Ljava/lang/String;)$IMMUTABLE_LIST"),
) + pluginGates.mapValues { it.value.methods }

internal fun Method.hookId() = "$definingClass->$name(${parameterTypes.joinToString("")})$returnType"

/** Match semantics first, then require the complete set from both tested APKs. */
internal fun findControls(classes: Iterable<ClassDef>): Map<String, List<Method>> {
    val found = expectedHooks.keys.associateWith { mutableListOf<Method>() }
    val adContract = classes.any { it.type == AD_ITEM } && classes.any { cls ->
        cls.type == IMMUTABLE_LIST && cls.methods.any {
            it.name == "copyOf" && it.parameterTypes == listOf("Ljava/util/Collection;") &&
                it.returnType == IMMUTABLE_LIST && AccessFlags.PUBLIC.isSet(it.accessFlags) && AccessFlags.STATIC.isSet(it.accessFlags)
        }
    }
    for (cls in classes) {
        val original = cls.fields.firstOrNull { it.name == "__redex_internal_original_name" }
            ?.initialValue.let { (it as? StringEncodedValue)?.value }
        for (method in cls.methods) {
            val instructions = method.implementation?.instructions?.toList() ?: continue
            val refs = instructions.mapNotNull { (it as? ReferenceInstruction)?.reference }
            val strings = refs.filterIsInstance<StringReference>().map { it.string }.toSet()
            val gate = method.returnType == "Z" && method.parameterTypes.isEmpty()
            fun add(key: String) { found.getValue(key).add(method) }
            if (method.returnType == "Z" && (method.parameterTypes.isEmpty() ||
                (AccessFlags.STATIC.isSet(method.accessFlags) && method.parameterTypes == listOf(cls.type)))) {
                for ((key, spec) in pluginGates) if (strings.any { it in spec.anchors }) add(key)
            }
            if (adContract && method.returnType == IMMUTABLE_LIST && method.parameterTypes.size == 3 &&
                strings.containsAll(setOf("messaging.inbox.itemlistprocessor.ItemListProcessorInterfaceSpec", "processItems", "new_friend_bump_threads"))) add("ads")
            if (gate && "com.facebook.messaging.friendsinboxunit.plugins.inboxunit.FriendsInboxUnitKillSwitch" in strings) add("stories")
            if (gate && instructions.any {
                it.opcode == Opcode.NEW_INSTANCE &&
                    ((it as? ReferenceInstruction)?.reference as? TypeReference)?.type in facebookPlugins
            }) add("facebook")
            if (gate && strings.any {
                it == "com.facebook.messaging.navigation.plugins.aicreationfolder.folderitem.AiCreationFolderItem" ||
                    it == "com.facebook.messaging.navigation.plugins.aihomefolder.folderitem.AiHomeFolderItem"
            }) add("ai_menu")
            if ("AiFabComponent" in strings && instructions.any { it.opcode == Opcode.RETURN_OBJECT }) add("ai_fab")
            if (method.name == "run" && method.returnType == "V" && method.parameterTypes.isEmpty()) {
                if (original == "InboxSubtabsItemSupplierImplementation\$onSubscribe\$1") add("subtabs")
                if (original == "ConversationTypingContext\$sendActiveStateRunnable\$1") add("typing")
            }
            if (gate && refs.any { it.toString() == "Landroid/os/Build\$VERSION;->SDK_INT:I" } &&
                refs.any { it.toString() == "Landroid/app/ActivityManager;->isLowRamDevice()Z" }) add("bubbles")
            if (method.returnType == "Z" && strings.containsAll(setOf("iab_skipped_reason", "user_prefers_external"))) add("browser")
        }
    }
    return found
}

internal fun validateControls(found: Map<String, List<Method>>, selected: Set<String> = expectedHooks.keys) {
    for (feature in selected) {
        val expected = expectedHooks.getValue(feature)
        val actual = found[feature].orEmpty().map { it.hookId() }
        if (actual.size != expected.size || actual.toSet() != expected) {
            throw PatchException("Messenger controls: $feature hooks differ from the tested build. " +
                "Use an unmodified arm64 Messenger 580.0.0.49.91 (346013387 or 346013440).")
        }
    }
}

/** New plugin gates use the same switch/pause contract without one Java getter per feature. */
internal fun MutableMethod.injectFeatureSwitch(key: String) {
    validateScratch()
    if (returnType != "Z") throw PatchException("Messenger controls: expected a boolean plugin gate")
    addInstructionsWithLabels(0, """
        const-string v0, "$key"
        invoke-static {v0}, $SETTINGS->enabled(Ljava/lang/String;)Z
        move-result v0
        if-eqz v0, :stock_behavior
        const/4 v0, 0x0
        return v0
    """.trimIndent(), ExternalLabel("stock_behavior", getInstruction(0)))
}

/** Require the observed plugin cache contract, including the polarity of its disabled return. */
internal fun MutableMethod.validatePluginGate() {
    validateScratch()
    val code = implementation!!.instructions
    val first = code.firstOrNull() as? TwoRegisterInstruction
    val enabled = code.getOrNull(1)
    val disabled = code.getOrNull(2)
    val enabledRegister = (enabled as? OneRegisterInstruction)?.registerA
    val disabledRegister = (disabled as? OneRegisterInstruction)?.registerA
    val tail = code.takeLast(5)
    val cache = tail.getOrNull(0) as? TwoRegisterInstruction
    val compare = tail.getOrNull(2) as? TwoRegisterInstruction
    if (code.firstOrNull()?.opcode != Opcode.IGET_OBJECT || first?.registerA != 0 ||
        first.registerB != implementation!!.registerCount - 1 ||
        enabled?.opcode != Opcode.CONST_4 || (enabled as? WideLiteralInstruction)?.wideLiteral != 1L ||
        disabled?.opcode != Opcode.CONST_4 || (disabled as? WideLiteralInstruction)?.wideLiteral != 0L ||
        enabledRegister !in 2 until implementation!!.registerCount - 1 ||
        disabledRegister !in 2 until implementation!!.registerCount - 1 || enabledRegister == disabledRegister ||
        code.drop(3).any { instruction ->
            val destination = (instruction as? OneRegisterInstruction)?.registerA
            instruction.opcode.setsRegister() && destination != null &&
                (destination == enabledRegister || destination == disabledRegister ||
                    (instruction.opcode.setsWideRegister() &&
                        (destination + 1 == enabledRegister || destination + 1 == disabledRegister)))
        } ||
        tail.map { it.opcode } != listOf(Opcode.IGET_OBJECT, Opcode.SGET_OBJECT, Opcode.IF_EQ, Opcode.RETURN, Opcode.RETURN) ||
        cache?.registerA != 1 || cache.registerB != first.registerB ||
        (tail[0] as? ReferenceInstruction)?.reference != (code[0] as? ReferenceInstruction)?.reference ||
        (tail[1] as? ReferenceInstruction)?.reference.toString() != "LX/1dj;->A03:Ljava/lang/Object;" ||
        (tail[1] as? OneRegisterInstruction)?.registerA != 0 || compare?.registerA != 1 || compare.registerB != 0 ||
        (tail[2] as? OffsetInstruction)?.codeOffset != 3 ||
        (tail[3] as? OneRegisterInstruction)?.registerA != (enabled as? OneRegisterInstruction)?.registerA ||
        (tail[4] as? OneRegisterInstruction)?.registerA != (disabled as? OneRegisterInstruction)?.registerA) {
        throw PatchException("Messenger controls: plugin enable/disable behavior changed in ${hookId()}. Use an unmodified supported APK.")
    }
}

/** Wrap both exits, including direct branches to a return. v5 stays intact on the inactive path. */
internal fun MutableMethod.validateAdFilter(): List<Int> {
    val code = implementation!!.instructions
    val exits = code.indices.filter { code[it].opcode == Opcode.RETURN_OBJECT }
    if (implementation!!.registerCount != 24 || code.size != 935 || exits != listOf(916, 931) ||
        exits.any { (code[it] as? OneRegisterInstruction)?.registerA != 5 }) {
        throw PatchException("Messenger controls: the inbox ad filter exits differ from the tested build")
    }
    return exits
}

internal fun MutableMethod.injectAdFilter() {
    val exits = validateAdFilter()
    for (index in exits.reversed()) {
        replaceInstruction(index, "invoke-static {v5}, $SETTINGS->filterInboxAds(Ljava/util/List;)Ljava/util/List;")
        addInstructionsWithLabels(index + 1, """
            move-result-object v0
            if-eqz v0, :original_list
            invoke-static {v0}, $IMMUTABLE_LIST->copyOf(Ljava/util/Collection;)$IMMUTABLE_LIST
            move-result-object v5
            :original_list
            return-object v5
        """.trimIndent())
    }
}

/** v0 must be a local register, never a parameter overwritten on the stock branch. */
internal fun MutableMethod.validateScratch() {
    val parameterWords = parameterTypes.sumOf { if (it == "J" || it == "D") 2 else 1 } +
        if (AccessFlags.STATIC.isSet(accessFlags)) 0 else 1
    if ((implementation?.registerCount ?: 0) <= parameterWords) {
        throw PatchException("Messenger controls: no local register in ${hookId()}")
    }
}

internal fun MutableMethod.injectSwitch(getter: String, result: String) {
    validateSwitch()
    val returnCode = when (returnType) {
        "V" -> "return-void"
        "Z" -> "const/4 v0, $result\nreturn v0"
        else -> {
            "const/4 v0, 0x0\nreturn-object v0"
        }
    }
    addInstructionsWithLabels(0, """
        invoke-static {}, $SETTINGS->$getter()Z
        move-result v0
        if-eqz v0, :stock_behavior
        $returnCode
    """.trimIndent(), ExternalLabel("stock_behavior", getInstruction(0)))
}

internal fun MutableMethod.validateSwitch() {
    validateScratch()
    if (returnType != "V" && returnType != "Z" && !returnType.startsWith("L")) {
        throw PatchException("Unexpected hook return type: $returnType")
    }
}

internal fun MutableMethod.validateSubtabs() {
    val instructions = implementation!!.instructions
    val literal = instructions.getOrNull(2)
    val supplier = instructions.getOrNull(0) as? TwoRegisterInstruction
    val flag = instructions.getOrNull(1) as? TwoRegisterInstruction
    val setter = instructions.getOrNull(3) as? FiveRegisterInstruction
    if (implementation!!.registerCount != 3 || instructions.map { it.opcode } !=
        listOf(Opcode.IGET_OBJECT, Opcode.IGET_OBJECT, Opcode.CONST_4, Opcode.INVOKE_VIRTUAL, Opcode.RETURN_VOID) ||
        supplier?.registerA != 0 || supplier.registerB != 2 || flag?.registerA != 1 || flag.registerB != 0 ||
        setter?.registerCount != 2 || setter.registerC != 1 || setter.registerD != 0 ||
        (literal as? OneRegisterInstruction)?.registerA != 0 ||
        (literal as? WideLiteralInstruction)?.wideLiteral != 1L ||
        (instructions[0] as? ReferenceInstruction)?.reference.toString() !=
            "LX/2UL;->A00:Lcom/facebook/messaging/inboxsubtabs/plugins/subtabs/itemsupplier/InboxSubtabsItemSupplierImplementation;" ||
        (instructions[1] as? ReferenceInstruction)?.reference.toString() !=
            "Lcom/facebook/messaging/inboxsubtabs/plugins/subtabs/itemsupplier/InboxSubtabsItemSupplierImplementation;->A05:Ljava/util/concurrent/atomic/AtomicBoolean;" ||
        (instructions[3] as? ReferenceInstruction)?.reference.toString() != "Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V") {
        throw PatchException("Messenger controls: inbox tabs no longer use the checked visibility flag")
    }
}

internal fun MutableMethod.injectSubtabs() {
    validateSubtabs()
    addInstructions(3, "invoke-static {v0}, $SETTINGS->showSubtabs(Z)Z\nmove-result v0")
}

internal fun MutableMethod.validateBrowserPreference() {
    val instructions = implementation!!.instructions
    val getter = instructions.getOrNull(61) as? FiveRegisterInstruction
    if (AccessFlags.STATIC.isSet(accessFlags) ||
        parameterTypes != listOf("Landroid/net/Uri;", "Lcom/facebook/auth/usersession/FbUserSession;") ||
        returnType != "Z" || instructions.getOrNull(60)?.opcode != Opcode.SGET_OBJECT ||
        (instructions[60] as? OneRegisterInstruction)?.registerA != 0 ||
        instructions.getOrNull(61)?.opcode != Opcode.INVOKE_INTERFACE ||
        getter?.registerCount != 3 || getter.registerC != 1 || getter.registerD != 0 || getter.registerE != 3 ||
        (instructions.getOrNull(60) as? ReferenceInstruction)?.reference.toString() != "LX/1D1;->A1U:LX/1BK;" ||
        (instructions.getOrNull(61) as? ReferenceInstruction)?.reference.toString() !=
            "Lcom/facebook/prefs/shared/FbSharedPreferences;->AhC(LX/1BK;Z)Z" ||
        instructions.getOrNull(62)?.opcode != Opcode.MOVE_RESULT ||
        (instructions[62] as? OneRegisterInstruction)?.registerA != 0 ||
        instructions.getOrNull(63)?.opcode != Opcode.IF_EQZ ||
        (instructions[63] as? OneRegisterInstruction)?.registerA != 0 || implementation!!.registerCount != 9) {
        throw PatchException("Messenger controls: external-browser preference no longer matches the tested build")
    }
}

internal fun MutableMethod.injectBrowserPreference() {
    validateBrowserPreference()
    // p1 is Uri (v7). Use the same stock preference branch, preserving surrounding handling.
    addInstructions(63, "invoke-static {v0, p1}, $SETTINGS->preferExternalBrowser(ZLandroid/net/Uri;)Z\nmove-result v0")
}
