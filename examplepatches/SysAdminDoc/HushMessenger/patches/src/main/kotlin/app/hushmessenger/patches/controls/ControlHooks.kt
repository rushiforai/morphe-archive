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
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference as DexMethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import com.android.tools.smali.dexlib2.iface.value.StringEncodedValue

internal const val SETTINGS = "Lapp/hushmessenger/extension/Settings;"
internal const val AD_ITEM = "Lcom/facebook/messaging/business/inboxads/common/InboxAdsItem;"
internal const val IMMUTABLE_LIST = "Lcom/google/common/collect/ImmutableList;"
internal const val PREFERENCE_GETTER = "Lcom/facebook/prefs/shared/FbSharedPreferences;->AhC(LX/1BK;Z)Z"
private const val PEOPLE_JEWEL_KEY = "pymk_jewel_section_hidden"
internal const val DRAWER_FOLDER_SELECTED = "HomeDrawerFragmentBase.handleOnFolderSelected"
internal const val AVATAR_TAB_EVENT = "Lcom/facebook/xapp/messaging/composer/avatar/composertab/event/ActivateAvatarSticker;"
internal const val SEARCH_CLEAR_TAG = "messenger_search_clear_button_tag"
internal const val TYPING_MAILBOX_CALL = "setTypingIndicatorForThreadWithThreadIdentifier"
internal const val READ_MAILBOX_CALL = "markAsReadThreadWithThreadIdentifier"

private val facebookPlugins = setOf(
    "Lcom/facebook/messaging/inbox/tab/plugins/core/tabtoolbarbutton/facebookbutton/facebooktoolbarbutton/FacebookButtonTabButtonImplementation;",
    "Lcom/facebook/messaging/marketplace/plugins/folder/navbarmenuitem/NavBarMenuItemImplementation;",
    "Lcom/facebook/messaging/profile/plugins/core/threadsettingsactionbutton/facebookprofile/ThreadSettingsFacebookProfileActionButton;",
    "Lcom/facebook/messaging/navigation/plugins/drawerfoldersections/fbshortcutsfoldersection/FacebookShortcutsFolderSection;",
    "Lcom/facebook/messaging/communitymessaging/plugins/channelinvite/sharetofacebookbutton/ShareToFacebookButtonImplementation;",
    "Lcom/facebook/messaging/publicchats/plugins/externalsharehscrollbuttons/sharetofacebook/ShareToFacebookHScrollButtonImplementation;",
)

internal var messageTextGetterName: String = ""
internal var messageIdGetterName: String = ""
internal var messageIsUnsentGetterName: String = ""

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
    "typing_mailbox" to setOf("LX/8eb;->A0I(Ljava/lang/String;Z)LX/325;"),
    "bubbles" to setOf("LX/2ZW;->A00()Z"),
    "browser" to setOf("Lcom/facebook/messaging/browser/util/MessengerBrowserLauncher;->A0L(Landroid/net/Uri;Lcom/facebook/auth/usersession/FbUserSession;)Z"),
    "ads" to setOf("LX/2Wl;->D2i(LX/1fx;${IMMUTABLE_LIST}Ljava/lang/String;)$IMMUTABLE_LIST"),
    "people_jewel" to setOf("LX/HAR;->A01(LX/HAR;)Z"),
    "allow_screenshot" to setOf(
        "LX/N2h;->run()V",
        "Lcom/facebook/screenshot/ScreenshotContentObserver;->onChange(ZLandroid/net/Uri;)V",
    ),
    "hide_read_receipts" to setOf("LX/AX0;->run()V"),
    "read_mailbox" to setOf("LX/9sm;->A01(Ljava/lang/Long;Ljava/lang/String;Ljava/lang/String;Lkotlin/jvm/functions/Function0;Lkotlin/jvm/functions/Function0;)V"),
    "keep_unsent" to setOf("LX/SH3;->A01(Landroid/content/Intent;Lcom/facebook/auth/usersession/FbUserSession;Ljava/lang/String;)V"),
    "unsent_indicator" to setOf("LX/K1Y;->BWo(I)Ljava/lang/String;"),
    "delta_unsent" to setOf("LX/K1Y;->Btd(I)Z"),
    "ai_search" to setOf("LX/5OA;->A0A(LX/5OA;)Z", "LX/5OA;->A0B(LX/5OA;)Z"),
    "ai_search_chip" to setOf("LX/D8E;->render(LX/2MZ;)LX/1GG;"),
    "emoji_typeface" to setOf("LX/1KV;->A00()Landroid/graphics/Typeface;"),
    "avatar_tabs" to setOf("Lcom/facebook/messaging/msys/thread/composer/configuration/xapp/BaseXappComposerConfigurationFactory;->A0P()$IMMUTABLE_LIST"),
    "menu_settings" to setOf(
        "LX/HFb;->Ax1(LX/0MG;)Ljava/util/ArrayList;",
        "LX/TxV;->CAo(LX/4jw;I)V",
        "LX/Txc;->A0I(Ljava/util/List;)V",
        "LX/Jwp;->onClick(Landroid/view/View;)V",
    ),
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
    // Static fields initialized from the Notifications tab's own "hide suggestions" preference key.
    val peopleJewelKeys = classes.flatMap { cls ->
        val code = cls.methods.singleOrNull { it.name == "<clinit>" }?.implementation?.instructions?.toList().orEmpty()
        if (code.none { ((it as? ReferenceInstruction)?.reference as? StringReference)?.string == PEOPLE_JEWEL_KEY }) emptyList()
        else code.filter { it.opcode == Opcode.SPUT_OBJECT }.map { (it as ReferenceInstruction).reference.toString() }
    }.toSet()
    messageTextGetterName = ""
    messageIdGetterName = ""
    messageIsUnsentGetterName = ""
    var rawText = ""
    var rawId = ""
    var rawUnsent = ""
    for (cls in classes) {
        if (rawText.isNotEmpty()) break
        for (m in cls.methods) {
            val debugCode = m.implementation?.instructions?.toList() ?: continue
            val debugStrs = debugCode.mapNotNull { ((it as? ReferenceInstruction)?.reference as? StringReference)?.string }
            if ("text=" !in debugStrs || "message_id=" !in debugStrs || "is_unsent=" !in debugStrs) continue
            var lastRef: DexMethodReference? = null
            for (insn in debugCode) {
                val ref = (insn as? ReferenceInstruction)?.reference ?: continue
                if (insn.opcode == Opcode.INVOKE_INTERFACE && ref is DexMethodReference) {
                    lastRef = ref
                } else if (ref is StringReference && lastRef != null) {
                    when (ref.string) {
                        "text=" -> if (lastRef.returnType == "Ljava/lang/String;") { rawText = lastRef.name; lastRef = null }
                        "message_id=" -> if (lastRef.returnType == "Ljava/lang/String;") { rawId = lastRef.name; lastRef = null }
                        "is_unsent=" -> if (lastRef.returnType == "Z") { rawUnsent = lastRef.name; lastRef = null }
                    }
                }
            }
            break
        }
    }
    if (rawText.isNotEmpty()) {
        messageTextGetterName = rawText
        messageIdGetterName = rawId
        messageIsUnsentGetterName = rawUnsent
        for (wrapperCls in classes) {
            if (!AccessFlags.ABSTRACT.isSet(wrapperCls.accessFlags) || wrapperCls.interfaces.size != 1) continue
            val wf = wrapperCls.fields.filter { !AccessFlags.STATIC.isSet(it.accessFlags) }
            if (wf.size != 1 || wf[0].type != "Ljava/util/List;") continue
            if (wrapperCls.methods.none { it.name == "getCount" && it.returnType == "I" && it.parameterTypes.isEmpty() }) continue
            fun resolve(raw: String, ret: String): String {
                if (wrapperCls.methods.any { it.name == raw && it.returnType == ret && it.parameterTypes == listOf("I") }) return raw
                return wrapperCls.methods.firstOrNull { wm ->
                    wm.returnType == ret && wm.parameterTypes == listOf("I") &&
                        wm.implementation?.instructions?.any { insn ->
                            insn.opcode == Opcode.INVOKE_INTERFACE &&
                                ((insn as? ReferenceInstruction)?.reference as? DexMethodReference)?.name == raw
                        } == true
                }?.name ?: raw
            }
            messageTextGetterName = resolve(rawText, "Ljava/lang/String;")
            messageIdGetterName = resolve(rawId, "Ljava/lang/String;")
            messageIsUnsentGetterName = resolve(rawUnsent, "Z")
            break
        }
    }
    var searchFieldRender: Method? = null
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
                if (original == "SecureWindowUtils\$1") add("allow_screenshot")
                if (original == "ReadThreadManager\$1") add("hide_read_receipts")
            }
            if (gate && refs.any { it.toString() == "Landroid/os/Build\$VERSION;->SDK_INT:I" } &&
                refs.any { it.toString() == "Landroid/app/ActivityManager;->isLowRamDevice()Z" }) add("bubbles")
            if (method.returnType == "Z" && strings.containsAll(setOf("iab_skipped_reason", "user_prefers_external"))) add("browser")
            if (method.returnType == "Z" && AccessFlags.STATIC.isSet(method.accessFlags) && method.parameterTypes == listOf(cls.type) &&
                refs.any { it.toString() in peopleJewelKeys } && refs.any { it.toString() == PREFERENCE_GETTER }) add("people_jewel")
            if (cls.type == "Lcom/facebook/screenshot/ScreenshotContentObserver;" && method.name == "onChange" &&
                method.returnType == "V") add("allow_screenshot")
            if (method.returnType == "V" && method.parameterTypes.size == 3 &&
                method.parameterTypes[0] == "Landroid/content/Intent;" &&
                strings.any { "ACTION_REVOKE_MESSAGE" in it }) add("keep_unsent")
            if (messageTextGetterName.isNotEmpty() &&
                method.name == messageTextGetterName &&
                method.returnType == "Ljava/lang/String;" && method.parameterTypes == listOf("I") &&
                AccessFlags.ABSTRACT.isSet(cls.accessFlags) && cls.interfaces.size == 1) {
                val instanceFields = cls.fields.filter { !AccessFlags.STATIC.isSet(it.accessFlags) }
                if (instanceFields.size == 1 && instanceFields[0].type == "Ljava/util/List;" &&
                    cls.methods.any { it.name == "getCount" && it.returnType == "I" && it.parameterTypes.isEmpty() }) add("unsent_indicator")
            }
            if (messageIsUnsentGetterName.isNotEmpty() &&
                method.name == messageIsUnsentGetterName &&
                method.returnType == "Z" && method.parameterTypes == listOf("I") &&
                AccessFlags.ABSTRACT.isSet(cls.accessFlags) && cls.interfaces.size == 1) {
                val instanceFields = cls.fields.filter { !AccessFlags.STATIC.isSet(it.accessFlags) }
                if (instanceFields.size == 1 && instanceFields[0].type == "Ljava/util/List;" &&
                    cls.methods.any { it.name == "getCount" && it.returnType == "I" && it.parameterTypes.isEmpty() }) add("delta_unsent")
            }
            if (method.returnType == "Z" && AccessFlags.STATIC.isSet(method.accessFlags) &&
                method.parameterTypes == listOf(cls.type) &&
                strings.any { "SearchAiagentImplementationsKillSwitch" in it }) add("ai_search")
            if (method.returnType == "Landroid/graphics/Typeface;" && method.parameterTypes.isEmpty() &&
                !AccessFlags.STATIC.isSet(method.accessFlags) &&
                "FacebookEmojiTypefaceProviderImpl" in strings) add("emoji_typeface")
            if (method.returnType == "Ljava/util/ArrayList;" && method.parameterTypes.size == 1 &&
                !AccessFlags.STATIC.isSet(method.accessFlags) &&
                strings.any { "settingsfolder.folderitem.SettingsFolderItem" in it }) add("menu_settings")
            if (method.returnType == "V" && method.parameterTypes.size == 2 &&
                method.parameterTypes[1] == "I" && !AccessFlags.STATIC.isSet(method.accessFlags) &&
                strings.contains("Unknown ViewHolder")) add("menu_settings")
            if (method.name == "onClick" && method.returnType == "V" &&
                method.parameterTypes == listOf("Landroid/view/View;") &&
                DRAWER_FOLDER_SELECTED in strings) add("menu_settings")
            // The Litho sticker keyboard's tab list builder reads the avatar tab's activate event.
            if (method.returnType == IMMUTABLE_LIST && method.parameterTypes.isEmpty() &&
                refs.any { it.toString().startsWith("$AVATAR_TAB_EVENT->") }) add("avatar_tabs")
            if (method.name == "render" && SEARCH_CLEAR_TAG in strings) searchFieldRender = method
            // Encrypted chats send typing through this msys mailbox call (thread id, typing).
            if (method.parameterTypes == listOf("Ljava/lang/String;", "Z") && TYPING_MAILBOX_CALL in strings) add("typing_mailbox")
            // Encrypted chats mark a thread read, which also sends the receipt, through this msys call.
            if (method.returnType == "V" && READ_MAILBOX_CALL in strings) add("read_mailbox")
        }
    }
    val gridBinderType = found["menu_settings"].orEmpty()
        .firstOrNull { it.returnType == "V" && it.parameterTypes.size == 2 && it.parameterTypes[1] == "I" }
        ?.definingClass
    if (gridBinderType != null) {
        for (cls in classes) {
            val instantiates = cls.methods.any { m ->
                m.implementation?.instructions?.any { insn ->
                    insn.opcode == Opcode.NEW_INSTANCE &&
                        ((insn as? ReferenceInstruction)?.reference as? TypeReference)?.type == gridBinderType
                } == true
            }
            if (!instantiates) continue
            cls.methods.singleOrNull {
                it.returnType == "V" && it.parameterTypes == listOf("Ljava/util/List;") &&
                    !AccessFlags.STATIC.isSet(it.accessFlags)
            }?.let { found.getValue("menu_settings").add(it) }
            break
        }
    }
    // The search field creates the Ask Meta AI chip before any other component, and only for a typed query.
    searchFieldRender?.let { field ->
        val chip = field.implementation!!.instructions.asSequence()
            .filter { it.opcode == Opcode.NEW_INSTANCE }
            .map { ((it as ReferenceInstruction).reference as TypeReference).type }
            .mapNotNull { type -> classes.firstOrNull { it.type == type } }
            .firstOrNull { cls -> cls.methods.any { it.name == "render" } }
        chip?.methods?.singleOrNull { it.name == "render" && it.returnType == field.returnType }
            ?.let { found.getValue("ai_search_chip").add(it) }
    }
    return found
}

internal fun validateControls(found: Map<String, List<Method>>, selected: Set<String> = expectedHooks.keys) {
    for (feature in selected) {
        val expected = expectedHooks.getValue(feature)
        val actual = found[feature].orEmpty().map { it.hookId() }
        if (actual.size != expected.size || actual.toSet() != expected) {
            throw PatchException("Messenger controls: $feature hooks differ from the tested build. " +
                "Use an unmodified arm64 Messenger 580.0.0.49.91 (346013387, 346013440 or 346013442).")
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

internal fun MutableMethod.injectEmojiTypeface() {
    validateScratch()
    if (returnType != "Landroid/graphics/Typeface;") {
        throw PatchException("Expected Typeface return for emoji hook: ${hookId()}")
    }
    addInstructionsWithLabels(0, """
        invoke-static {}, $SETTINGS->systemEmojiTypeface()Landroid/graphics/Typeface;
        move-result-object v0
        if-eqz v0, :stock_behavior
        return-object v0
    """.trimIndent(), ExternalLabel("stock_behavior", getInstruction(0)))
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

/** Instruction index a branch lands on, or -1 when it doesn't start an instruction. */
internal fun List<Instruction>.branchTarget(index: Int): Int {
    val offset = (getOrNull(index) as? OffsetInstruction)?.codeOffset ?: return -1
    val target = take(index).sumOf { it.codeUnits } + offset
    var address = 0
    forEachIndexed { i, instruction -> if (address == target) return i; address += instruction.codeUnits }
    return -1
}

/**
 * The Notifications tab reads its stock "section hidden" preference into v0 and branches on it. A hidden
 * section is still shown when a server flag (v0 at index 19) is on; both branches land on the final false return.
 */
internal fun MutableMethod.validatePeopleSection() {
    val code = implementation!!.instructions.toList()
    val key = code.getOrNull(8)
    val default = code.getOrNull(9)
    val getter = code.getOrNull(10) as? FiveRegisterInstruction
    val flag = code.getOrNull(17)
    val last = code.lastIndex
    if (!AccessFlags.STATIC.isSet(accessFlags) || returnType != "Z" || parameterTypes != listOf(definingClass) ||
        implementation!!.registerCount != 6 ||
        flag?.opcode != Opcode.CONST_WIDE || (flag as? OneRegisterInstruction)?.registerA != 0 ||
        (flag as? WideLiteralInstruction)?.wideLiteral != 72344235860374863L ||
        code.getOrNull(18)?.opcode != Opcode.INVOKE_STATIC ||
        (code[18] as? ReferenceInstruction)?.reference.toString() != "LX/16z;->A1Z(Ljava/lang/Object;J)Z" ||
        code.getOrNull(19)?.opcode != Opcode.MOVE_RESULT || (code[19] as? OneRegisterInstruction)?.registerA != 0 ||
        code.getOrNull(20)?.opcode != Opcode.IF_NEZ || (code[20] as? OneRegisterInstruction)?.registerA != 0 ||
        code.branchTarget(12) != last || code.branchTarget(20) != last ||
        code[last].opcode != Opcode.RETURN || (code[last] as? OneRegisterInstruction)?.registerA != 4 ||
        code[last - 1].opcode != Opcode.RETURN || (code[last - 1] as? OneRegisterInstruction)?.registerA != 0 ||
        code[last - 2].opcode != Opcode.CONST_4 || (code[last - 2] as? WideLiteralInstruction)?.wideLiteral != 1L ||
        key?.opcode != Opcode.SGET_OBJECT || (key as? OneRegisterInstruction)?.registerA != 0 ||
        (key as? ReferenceInstruction)?.reference.toString() != "LX/JTx;->A01:LX/1BL;" ||
        default?.opcode != Opcode.CONST_4 || (default as? OneRegisterInstruction)?.registerA != 4 ||
        (default as? WideLiteralInstruction)?.wideLiteral != 0L ||
        code.getOrNull(10)?.opcode != Opcode.INVOKE_INTERFACE ||
        (code[10] as? ReferenceInstruction)?.reference.toString() != PREFERENCE_GETTER ||
        getter?.registerCount != 3 || getter.registerC != 1 || getter.registerD != 0 || getter.registerE != 4 ||
        code.getOrNull(11)?.opcode != Opcode.MOVE_RESULT || (code[11] as? OneRegisterInstruction)?.registerA != 0 ||
        code.getOrNull(12)?.opcode != Opcode.IF_EQZ || (code[12] as? OneRegisterInstruction)?.registerA != 0) {
        throw PatchException("Messenger controls: the Notifications tab suggestions setting no longer matches the tested build")
    }
}

internal fun MutableMethod.injectPeopleSection() {
    validatePeopleSection()
    // An enabled control ignores the server override, then counts as Messenger's own hide choice.
    // The later site goes first so index 12 still names the preference branch.
    addInstructions(20, "invoke-static {v0}, $SETTINGS->keepPeopleSection(Z)Z\nmove-result v0")
    addInstructions(12, "invoke-static {v0}, $SETTINGS->hidePeopleSection(Z)Z\nmove-result v0")
}

internal fun MutableMethod.validateMenuSettingsAdd() {
    val code = implementation!!.instructions.toList()
    val returns = code.count { it.opcode == Opcode.RETURN_OBJECT }
    if (returns != 1) throw PatchException("Messenger controls: menu settings item builder has $returns exits, expected 1")
    if (returnType != "Ljava/util/ArrayList;") throw PatchException("Messenger controls: menu settings item builder returns $returnType")
}

internal fun MutableMethod.injectMenuSettingsAdd() {
    validateMenuSettingsAdd()
    val code = implementation!!.instructions.toList()
    val ret = code.indexOfLast { it.opcode == Opcode.RETURN_OBJECT }
    val retReg = (code[ret] as OneRegisterInstruction).registerA
    addInstructions(ret, "invoke-static {v$retReg}, $SETTINGS->addMenuSettingsEntry(Ljava/util/ArrayList;)V")
}

internal fun MutableMethod.validateMenuSettingsBind() {
    val code = implementation!!.instructions.toList()
    if (code.none { it.opcode == Opcode.RETURN_VOID }) throw PatchException("Messenger controls: menu settings binder has no normal exit")
    if (returnType != "V") throw PatchException("Messenger controls: menu settings binder returns $returnType")
}

internal fun MutableMethod.injectMenuSettingsBind() {
    validateMenuSettingsBind()
    val paramWords = parameterTypes.sumOf { if (it == "J" || it == "D") 2 else 1 } + 1
    val viewHolderReg = implementation!!.registerCount - paramWords + 1
    val code = implementation!!.instructions.toList()
    val normalExit = code.indexOfFirst { it.opcode == Opcode.RETURN_VOID }
    addInstructions(normalExit, "invoke-static {v$viewHolderReg}, $SETTINGS->handleMenuItemBound(Ljava/lang/Object;)V")
}

internal fun MutableMethod.validateMenuDrawerAdd() {
    if (returnType != "V") throw PatchException("Messenger controls: menu drawer items setter returns $returnType")
    if (parameterTypes != listOf("Ljava/util/List;")) throw PatchException("Messenger controls: menu drawer items setter takes ${parameterTypes.joinToString()}")
}

internal fun MutableMethod.injectMenuDrawerAdd() {
    validateMenuDrawerAdd()
    addInstructions(0, """
        invoke-static {p1}, $SETTINGS->addMenuDrawerEntry(Ljava/util/List;)Ljava/util/List;
        move-result-object p1
    """.trimIndent())
}

internal fun MutableMethod.validateKeyboardTabs(): Int {
    val code = implementation!!.instructions.toList()
    val exits = code.indices.filter { code[it].opcode == Opcode.RETURN_OBJECT }
    val parameterWords = parameterTypes.sumOf { if (it == "J" || it == "D") 2 else 1 } +
        if (AccessFlags.STATIC.isSet(accessFlags)) 0 else 1
    if (returnType != IMMUTABLE_LIST || exits.size != 1 || implementation!!.registerCount - parameterWords < 2) {
        throw PatchException("Messenger controls: the sticker keyboard tab builder differs from the tested build")
    }
    return exits.single()
}

/** Replacing the return keeps every branch to it; any register but the result is free there. */
internal fun MutableMethod.injectKeyboardTabs() {
    val exit = validateKeyboardTabs()
    val result = (getInstruction(exit) as OneRegisterInstruction).registerA
    val scratch = if (result == 0) 1 else 0
    replaceInstruction(exit, "invoke-static {v$result}, $SETTINGS->filterKeyboardTabs(Ljava/util/List;)Ljava/util/List;")
    addInstructionsWithLabels(exit + 1, """
        move-result-object v$scratch
        if-eqz v$scratch, :original_tabs
        invoke-static {v$scratch}, $IMMUTABLE_LIST->copyOf(Ljava/util/Collection;)$IMMUTABLE_LIST
        move-result-object v$result
        :original_tabs
        return-object v$result
    """.trimIndent())
}

internal fun MutableMethod.validateOutgoingTyping(): Int {
    if (parameterTypes != listOf("Ljava/lang/String;", "Z") || AccessFlags.STATIC.isSet(accessFlags)) {
        throw PatchException("Messenger controls: the encrypted typing call takes ${parameterTypes.joinToString()}, expected String and boolean")
    }
    // The boolean is the last parameter register; invoke-static {vN} needs it below v16.
    val typing = implementation!!.registerCount - 1
    if (typing > 15) throw PatchException("Messenger controls: the encrypted typing flag sits in v$typing, out of invoke range")
    return typing
}

/** Clears the typing flag while Hide typing indicator is on, so Messenger sends "not typing". */
internal fun MutableMethod.injectOutgoingTyping() {
    val typing = validateOutgoingTyping()
    addInstructions(0, """
        invoke-static {v$typing}, $SETTINGS->outgoingTyping(Z)Z
        move-result v$typing
    """.trimIndent())
}

/** The Settings folder builder creates exactly one class: the Menu tab's folder row. */
internal fun MutableMethod.menuFolderItemType(): String {
    val types = implementation!!.instructions.filter { it.opcode == Opcode.NEW_INSTANCE }
        .map { ((it as ReferenceInstruction).reference as TypeReference).type }.toSet()
    return types.singleOrNull()
        ?: throw PatchException("Messenger controls: menu settings item builder creates ${types.size} types, expected 1")
}

/** Messenger casts the tapped folder row just before its folder-selected trace section starts. */
internal fun MutableMethod.menuFolderCastIndex(folderItemType: String): Int {
    if (returnType != "V") throw PatchException("Messenger controls: drawer folder click returns $returnType")
    val code = implementation!!.instructions.toList()
    val markers = code.indices.filter {
        ((code[it] as? ReferenceInstruction)?.reference as? StringReference)?.string == DRAWER_FOLDER_SELECTED
    }
    val marker = markers.singleOrNull()
        ?: throw PatchException("Messenger controls: drawer folder click has ${markers.size} folder-selected markers, expected 1")
    val casts = code.indices.filter { index ->
        index < marker && marker - index <= 12 && code[index].opcode == Opcode.CHECK_CAST &&
            ((code[index] as ReferenceInstruction).reference as TypeReference).type == folderItemType
    }
    return casts.singleOrNull()
        ?: throw PatchException("Messenger controls: drawer folder click has ${casts.size} row casts before its marker, expected 1")
}

internal fun MutableMethod.injectMenuFolderClick(folderItemType: String) {
    val cast = menuFolderCastIndex(folderItemType)
    val row = (getInstruction(cast) as OneRegisterInstruction).registerA
    // Null means the HushMessenger row opened settings; any other row continues with Messenger's handling.
    addInstructionsWithLabels(cast + 1, """
        invoke-static/range {v$row .. v$row}, $SETTINGS->drawerFolderClicked(Ljava/lang/Object;)Ljava/lang/Object;
        move-result-object v$row
        if-nez v$row, :hush_folder_row
        return-void
        :hush_folder_row
        check-cast v$row, $folderItemType
    """.trimIndent())
}

internal fun MutableMethod.validateKeepUnsent() {
    validateScratch()
    if (returnType != "V") throw PatchException("Messenger controls: keep_unsent hook must return void")
    if (parameterTypes.getOrNull(0) != "Landroid/content/Intent;")
        throw PatchException("Messenger controls: keep_unsent hook first param must be Intent")
}

internal fun MutableMethod.injectKeepUnsent() {
    validateKeepUnsent()
    addInstructionsWithLabels(0, """
        invoke-static {}, $SETTINGS->keepUnsent()Z
        move-result v0
        if-eqz v0, :stock_behavior
        const-string v0, "messenger_message_id"
        invoke-virtual {p1, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;
        move-result-object v0
        invoke-static {v0}, $SETTINGS->recordUnsent(Ljava/lang/String;)V
        return-void
    """.trimIndent(), ExternalLabel("stock_behavior", getInstruction(0)))
}

internal fun MutableMethod.validateUnsentIndicator() {
    if (returnType != "Ljava/lang/String;") throw PatchException("Messenger controls: unsent_indicator hook must return String")
    if (parameterTypes != listOf("I")) throw PatchException("Messenger controls: unsent_indicator hook must take one int param")
    val code = implementation!!.instructions.toList()
    if (code.size != 5) throw PatchException("Messenger controls: unsent_indicator hook has ${code.size} instructions, expected 5")
    if (code[4].opcode != Opcode.RETURN_OBJECT) throw PatchException("Messenger controls: unsent_indicator hook must end with return-object")
    if (code[0].opcode != Opcode.INVOKE_STATIC) throw PatchException("Messenger controls: unsent_indicator hook must start with invoke-static")
}

internal fun MutableMethod.injectUnsentIndicator() {
    validateUnsentIndicator()
    val code = implementation!!.instructions.toList()
    val returnIndex = code.indexOfLast { it.opcode == Opcode.RETURN_OBJECT }
    addInstructions(returnIndex, """
        invoke-virtual {p0, p1}, $definingClass->$messageIdGetterName(I)Ljava/lang/String;
        move-result-object p1
        invoke-static {v0, p1}, $SETTINGS->labelKeptUnsent(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
        move-result-object v0
    """.trimIndent())
}

internal fun MutableMethod.validateDeltaUnsent() {
    if (returnType != "Z") throw PatchException("Messenger controls: delta_unsent hook must return boolean")
    if (parameterTypes != listOf("I")) throw PatchException("Messenger controls: delta_unsent hook must take one int param")
    val code = implementation!!.instructions.toList()
    if (code.size != 5) throw PatchException("Messenger controls: delta_unsent hook has ${code.size} instructions, expected 5")
    if (code[4].opcode != Opcode.RETURN) throw PatchException("Messenger controls: delta_unsent hook must end with return")
    if (code[0].opcode != Opcode.INVOKE_STATIC) throw PatchException("Messenger controls: delta_unsent hook must start with invoke-static")
}

internal fun MutableMethod.injectDeltaUnsent() {
    validateDeltaUnsent()
    val code = implementation!!.instructions.toList()
    val returnIndex = code.indexOfLast { it.opcode == Opcode.RETURN }
    addInstructions(returnIndex, """
        invoke-virtual {p0, p1}, $definingClass->$messageIdGetterName(I)Ljava/lang/String;
        move-result-object p1
        invoke-static {v0, p1}, $SETTINGS->suppressUnsent(ZLjava/lang/String;)Z
        move-result v0
    """.trimIndent())
}
