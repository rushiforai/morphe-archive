/*
 * Messenger anchors adapted from RookieEnough/De-Vanced at 0d01e3dd5ec82b6796b28b82c33fc6af4944b2e6
 * (including ReVanced contributions) and rushiranpise/morphe-patches at
 * 55ca6a05ea3559e95a0876316dcb7caad1f3c9cf. GPL-3.0. See NOTICE.
 */
package app.hushmessenger.patches.controls

import app.hushmessenger.patches.MessengerTarget
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
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.SwitchPayload
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference as DexMethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import com.android.tools.smali.dexlib2.iface.value.StringEncodedValue
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter

internal const val SETTINGS = "Lapp/hushmessenger/extension/Settings;"
internal const val AD_ITEM = "Lcom/facebook/messaging/business/inboxads/common/InboxAdsItem;"
internal const val IMMUTABLE_LIST = "Lcom/google/common/collect/ImmutableList;"
internal const val PREFERENCE_GETTER = "Lcom/facebook/prefs/shared/FbSharedPreferences;->AhC(LX/1BK;Z)Z"
private const val PEOPLE_JEWEL_KEY = "pymk_jewel_section_hidden"
/** Only the People tab's suggestion handler starts this coroutine; the handler itself is obfuscated. */
internal const val PEOPLE_TAB_FETCH = "Lcom/facebook/messaging/peopletab/segments/friendrequests/usecase/" +
    "PeopleTabPYMKHandler\$fetchPymkSuggestions\$\$inlined\$CoroutineExceptionHandler\$1;"
/** The search screen's empty-state suggestions source logs under this name. */
internal const val PEOPLE_SEARCH_SOURCE = "PeopleYouMayKnowSectionDataSource"
/** The story viewer requests its page of suggested people under this query name. */
internal const val STORY_SUGGESTIONS_QUERY = "MsgrPeopleYouMayKnowQuery"
internal const val DRAWER_FOLDER_SELECTED = "HomeDrawerFragmentBase.handleOnFolderSelected"
internal const val DRAWER_REFRESH = "HomeDrawerFragmentBase.refreshDrawerItems"
internal const val AVATAR_TAB_EVENT = "Lcom/facebook/xapp/messaging/composer/avatar/composertab/event/ActivateAvatarSticker;"
internal const val COMPOSER_FACTORY = "Lcom/facebook/messaging/msys/thread/composer/configuration/xapp/BaseXappComposerConfigurationFactory;"
internal const val SEARCH_CLEAR_TAG = "messenger_search_clear_button_tag"
internal const val MONTAGE_CARD = "Lcom/facebook/messaging/montage/model/MontageCard;"
internal const val STORY_MARK_READ_TAG = "MontageMsysMarkReadHandler"
/** The story viewer's More options button logs this as it builds its menu. */
internal const val STORY_MENU_TAG = "toolbar_click_menu_button"
/** The menu's click handler logs this before it saves the story on screen. */
internal const val STORY_SAVE_TAG = "menu_item_download"
internal const val STORY_SAVE_HELPER = "hushmessengerAddStorySave"
/** Every notes tip sheet, Make my notes public and Add lyrics included, opens under this fragment tag. */
internal const val NOTES_TIP_SHEET = "NotesMigNuxBottomSheet"
internal const val NOTES_TIP_TYPE_ARG = "arg_nux_type"
/** The story viewer caps its Share your own story card per day under this preference key. */
internal const val STORY_CARD_DATE_KEY = "last_date_creation_card_shown"
internal const val ANDROIDX_FRAGMENT = "Landroidx/fragment/app/Fragment;"
internal const val ANIMATION = "Landroid/view/animation/Animation;"
/** androidx asks every fragment for its animation here before it loads one, and the base answer is none. */
internal const val FRAGMENT_ANIMATION = "$ANDROIDX_FRAGMENT->onCreateAnimation(IZI)$ANIMATION"
internal const val CHAT_ANIMATION = "Lapp/hushmessenger/extension/ChatAnimation;"
internal const val CHAT_ANIMATION_CREATE = "$CHAT_ANIMATION->create(Ljava/lang/Object;IZI)$ANIMATION"
private const val IMMUTABLE_LIST_OF = "$IMMUTABLE_LIST->of(Ljava/lang/Object;)$IMMUTABLE_LIST"
internal const val TYPING_MAILBOX_CALL = "setTypingIndicatorForThreadWithThreadIdentifier"
internal const val READ_MAILBOX_CALL = "markAsReadThreadWithThreadIdentifier"
internal const val SCREEN_CAPTURE_CALLBACK = "Landroid/app/Activity\$ScreenCaptureCallback;"
/** Encrypted chats hand every photo to this transcoder; its two image entry points keep their names in every build. */
internal const val MEDIA_TRANSCODER = "Lcom/facebook/msys/mci/transcoder/DefaultMediaTranscoder;"
internal const val TRANSCODE_IMAGE = "$MEDIA_TRANSCODER->transcodeImage(Ljava/lang/String;DDLjava/lang/String;Ljava/util/Map;)[B"
internal const val TRANSCODE_IMAGE_ASYNC = "$MEDIA_TRANSCODER->transcodeImageAsync(" +
    "Ljava/lang/String;DDLjava/lang/String;Ljava/util/Map;Lcom/facebook/msys/mci/TranscodeImageCompletionCallback;)V"
private const val ORIGINAL_PHOTO = "Lapp/hushmessenger/extension/OriginalPhoto;"
private const val FLAG_SECURE = 0x2000

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
    "ai_sticker_cell" to setOf("LX/FXP;->render(LX/2MZ;)LX/1GG;"),
    "subtabs" to setOf("LX/2UL;->run()V"),
    "typing" to setOf("LX/Ahp;->run()V"),
    "typing_mailbox" to setOf("LX/8eb;->A0I(Ljava/lang/String;Z)LX/325;"),
    "bubbles" to setOf("LX/2ZW;->A00()Z"),
    "bubble_mode" to setOf("LX/2ZW;->A01(Lcom/facebook/auth/usersession/FbUserSession;)Z"),
    "browser" to setOf("Lcom/facebook/messaging/browser/util/MessengerBrowserLauncher;->A0L(Landroid/net/Uri;Lcom/facebook/auth/usersession/FbUserSession;)Z"),
    "ads" to setOf("LX/2Wl;->D2i(LX/1fx;${IMMUTABLE_LIST}Ljava/lang/String;)$IMMUTABLE_LIST"),
    "people_jewel" to setOf("LX/HAR;->A01(LX/HAR;)Z"),
    "people_tab" to setOf("LX/JZ6;->A01(LX/JZ6;)V"),
    "people_search" to setOf("LX/CX5;->DLP(LX/EA8;Ljava/lang/Object;)LX/EBu;"),
    "people_story" to setOf("Lcom/facebook/messaging/montage/viewer/MontageViewerFragment;->" +
        "A0Y(Lcom/facebook/messaging/montage/viewer/MontageViewerFragment;)V"),
    "allow_screenshot" to setOf(
        "LX/N2h;->run()V",
        "Lcom/facebook/screenshot/ScreenshotContentObserver;->onChange(ZLandroid/net/Uri;)V",
        "LX/8xp;->onScreenCaptured()V",
        "LX/4nW;->A00(Landroid/view/Window;)V",
    ),
    "screenshot_viewers" to screenshotViewerHooks("A1A"),
    "hide_read_receipts" to setOf("LX/AX0;->run()V"),
    "read_mailbox" to setOf("LX/9sm;->A01(Ljava/lang/Long;Ljava/lang/String;Ljava/lang/String;Lkotlin/jvm/functions/Function0;Lkotlin/jvm/functions/Function0;)V"),
    "keep_unsent" to setOf("LX/SH3;->A01(Landroid/content/Intent;Lcom/facebook/auth/usersession/FbUserSession;Ljava/lang/String;)V"),
    "anonymous_stories" to setOf("LX/HNV;->C1V(${MONTAGE_CARD}Z)V"),
    "save_stories" to setOf("LX/JgG;->onClick(Landroid/view/View;)V"),
    "growth_notes" to setOf("Lcom/facebook/presence/note/ui/nux/controller/NotesNuxController;->" +
        "A01(Landroidx/fragment/app/Fragment;LX/Ocr;Ljava/util/List;LX/5MS;Lkotlin/jvm/functions/Function1;)Ljava/lang/Object;"),
    "growth_story_card" to setOf("Lcom/facebook/messaging/montage/viewer/MontageViewerFragment;->" +
        "A0x(Lcom/facebook/messaging/montage/viewer/MontageViewerFragment;)Z"),
    "unsent_indicator" to setOf("LX/K1Y;->BWo(I)Ljava/lang/String;"),
    "delta_unsent" to setOf("LX/K1Y;->Btd(I)Z"),
    "ai_search" to setOf("LX/5OA;->A0A(LX/5OA;)Z", "LX/5OA;->A0B(LX/5OA;)Z"),
    "ai_search_chip" to setOf("LX/D8E;->render(LX/2MZ;)LX/1GG;"),
    "emoji_typeface" to setOf("LX/1KV;->A00()Landroid/graphics/Typeface;"),
    "original_photo" to setOf(TRANSCODE_IMAGE, TRANSCODE_IMAGE_ASYNC),
    "avatar_tabs" to setOf("Lcom/facebook/messaging/msys/thread/composer/configuration/xapp/BaseXappComposerConfigurationFactory;->A0P()$IMMUTABLE_LIST"),
    "menu_settings" to setOf(
        "LX/9rv;->A1i()V",
        "LX/HFb;->Ax1(LX/0MG;)Ljava/util/ArrayList;",
        "LX/TxV;->CAo(LX/4jw;I)V",
        "LX/Txc;->A0I(Ljava/util/List;)V",
        "LX/Jwp;->onClick(Landroid/view/View;)V",
    ),
    "chat_animation" to setOf(FRAGMENT_ANIMATION),
    "chat_fragment" to setOf("LX/1hl;-><init>()V"),
    "chat_inbox" to setOf("LX/1fs;-><init>()V"),
    "chat_legacy" to setOf("LX/1hd;->onCreateAnimation(IZI)$ANIMATION"),
) + pluginGates.mapValues { it.value.methods }

internal fun Method.hookId() = "$definingClass->$name(${parameterTypes.joinToString("")})$returnType"

/** Match semantics first, then require the complete set from both tested APKs. */
internal fun findControls(classes: Iterable<ClassDef>): Map<String, List<Method>> {
    val found = expectedHooks.keys.associateWith { mutableListOf<Method>() }
    found.getValue("ai_sticker_cell").addAll(findAiStickerCells(classes))
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
    // The static field each class initializer stores the story card's last-shown date key in.
    val storyCardKeys = classes.flatMap { cls ->
        val code = cls.methods.singleOrNull { it.name == "<clinit>" }?.implementation?.instructions?.toList().orEmpty()
        code.indices.filter { ((code[it] as? ReferenceInstruction)?.reference as? StringReference)?.string == STORY_CARD_DATE_KEY }
            .mapNotNull { at -> code.drop(at + 1).firstOrNull { it.opcode == Opcode.SPUT_OBJECT } }
            .map { (it as ReferenceInstruction).reference.toString() }
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
            if ((cls.type == EPHEMERAL_VIEWER && method.name in setOf("A1A", "A1C", "onResume")) ||
                (cls.type == QUICKSNAP_VIEWER && method.name == "onCreateView")) {
                method.screenshotViewerSites()
                add("screenshot_viewers")
            }
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
            if (!AccessFlags.STATIC.isSet(method.accessFlags) && method.returnType == "Z" &&
                method.parameterTypes == listOf(BUBBLE_SESSION) && instructions.any {
                    it.opcode == Opcode.CONST_WIDE && (it as? WideLiteralInstruction)?.wideLiteral == BUBBLE_ROLLOUT
                }) add("bubble_mode")
            if (method.returnType == "Z" && strings.containsAll(setOf("iab_skipped_reason", "user_prefers_external"))) add("browser")
            if (method.returnType == "Z" && AccessFlags.STATIC.isSet(method.accessFlags) && method.parameterTypes == listOf(cls.type) &&
                refs.any { it.toString() in peopleJewelKeys } && refs.any { it.toString() == activeProfile.preferenceGetter }) add("people_jewel")
            if (AccessFlags.STATIC.isSet(method.accessFlags) && method.returnType == "V" && method.parameterTypes == listOf(cls.type) &&
                refs.any { (it as? DexMethodReference)?.publishesSuggestions() == true } &&
                cls.methods.any { other ->
                    other.implementation?.instructions?.any { ((it as? ReferenceInstruction)?.reference as? TypeReference)?.type == PEOPLE_TAB_FETCH } == true
                }) add("people_tab")
            if (!AccessFlags.STATIC.isSet(method.accessFlags) &&
                strings.containsAll(setOf(PEOPLE_SEARCH_SOURCE, "Failed to load people you may know"))) add("people_search")
            if (AccessFlags.STATIC.isSet(method.accessFlags) && method.returnType == "V" && method.parameterTypes == listOf(cls.type) &&
                STORY_SUGGESTIONS_QUERY in strings) add("people_story")
            if (cls.type == "Lcom/facebook/screenshot/ScreenshotContentObserver;" && method.name == "onChange" &&
                method.returnType == "V") add("allow_screenshot")
            // Android 14 and newer report a screenshot here, and Messenger turns it into the in-chat notice.
            if (method.name == "onScreenCaptured" && method.returnType == "V" && method.parameterTypes.isEmpty() &&
                SCREEN_CAPTURE_CALLBACK in cls.interfaces) add("allow_screenshot")
            // Photo and media viewers in protected chats lock their window through this one helper.
            if (method.returnType == "V" && method.parameterTypes == listOf("Landroid/view/Window;") &&
                !AccessFlags.STATIC.isSet(method.accessFlags) &&
                instructions.any { (it as? NarrowLiteralInstruction)?.narrowLiteral == FLAG_SECURE } &&
                refs.any { it.toString() == "Landroid/view/Window;->addFlags(I)V" }) add("allow_screenshot")
            if (cls.type == MEDIA_TRANSCODER && method.hookId().let { it == TRANSCODE_IMAGE || it == TRANSCODE_IMAGE_ASYNC }) add("original_photo")
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
            if (method.returnType == "V" && method.parameterTypes.isEmpty() &&
                !AccessFlags.STATIC.isSet(method.accessFlags) && DRAWER_REFRESH in strings) add("menu_settings")
            // The Litho sticker keyboard's tab list builder reads the avatar tab's activate event.
            if (method.returnType == IMMUTABLE_LIST && method.parameterTypes.isEmpty() &&
                refs.any { it.toString().startsWith("$AVATAR_TAB_EVENT->") }) add("avatar_tabs")
            // Some builds fill that list inline in a void method of the composer factory instead.
            if (method.returnType == "V" && cls.type == COMPOSER_FACTORY &&
                refs.any { it.toString().startsWith("$AVATAR_TAB_EVENT->") } &&
                refs.any { it.toString().startsWith("$IMMUTABLE_LIST->builder()") }) add("avatar_tabs")
            if (method.name == "render" && SEARCH_CLEAR_TAG in strings) searchFieldRender = method
            // Encrypted chats send typing through this msys mailbox call (thread id, typing).
            if (method.parameterTypes == listOf("Ljava/lang/String;", "Z") && TYPING_MAILBOX_CALL in strings) add("typing_mailbox")
            // Encrypted chats mark a thread read, which also sends the receipt, through this msys call.
            if (method.returnType == "V" && READ_MAILBOX_CALL in strings) add("read_mailbox")
            // Opening a story card sends its seen state through the handler Messenger tags with this name.
            if (method.returnType == "V" && method.parameterTypes == listOf(MONTAGE_CARD, "Z") &&
                !AccessFlags.STATIC.isSet(method.accessFlags) && STORY_MARK_READ_TAG in strings) add("anonymous_stories")
            // The story viewer's More options button builds its menu here, your own story's Save item included.
            if (method.name == "onClick" && method.returnType == "V" && method.parameterTypes == listOf("Landroid/view/View;") &&
                STORY_MENU_TAG in strings) add("save_stories")
            // Notes open every tip sheet through this one suspend call, which returns whether it showed one.
            if (!AccessFlags.STATIC.isSet(method.accessFlags) && method.returnType == "Ljava/lang/Object;" &&
                strings.containsAll(setOf(NOTES_TIP_SHEET, NOTES_TIP_TYPE_ARG))) add("growth_notes")
            // The story viewer adds its Share your own story card only while this daily cap check passes.
            if (AccessFlags.STATIC.isSet(method.accessFlags) && method.returnType == "Z" && method.parameterTypes == listOf(cls.type) &&
                refs.any { it.toString() in storyCardKeys }) add("growth_story_card")
            if (cls.type == ANDROIDX_FRAGMENT && method.hookId() == FRAGMENT_ANIMATION) add("chat_animation")
            // The chat and the inbox under it inherit that answer. androidx needs each fragment's no-argument
            // constructor, so it names the class the animation hook tells apart.
            if (method.name == "<init>" && method.parameterTypes.isEmpty()) {
                if (original == "MsysThreadViewFragment") add("chat_fragment")
                if (original == "M4TabNavigationFragment") add("chat_inbox")
            }
            // Chats on Messenger's older route open in this fragment, which loads its own animation.
            if (original == "ThreadViewFragment" && method.name == "onCreateAnimation" &&
                method.hookId() == "${cls.type}->onCreateAnimation(IZI)$ANIMATION") add("chat_legacy")
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

internal fun validateControls(
    found: Map<String, List<Method>>,
    selected: Set<String> = activeProfile.hooks.keys,
    versions: Map<String, List<Int>> = MessengerTarget.VERSIONS,
) {
    for (feature in selected) {
        val expected = activeProfile.hooks.getValue(feature)
        val actual = found[feature].orEmpty().map { it.hookId() }
        if (actual.size != expected.size || actual.toSet() != expected) {
            throw PatchException("Messenger controls: $feature hooks differ from the tested build. " +
                "Use an unmodified arm64 Messenger ${MessengerTarget.supportedApks(versions)}.")
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

/** The notes tip launcher: an instance suspend call whose result is whether it showed a sheet. */
internal fun MutableMethod.validateNotesTips() {
    validateScratch()
    val strings = implementation!!.instructions.mapNotNull { ((it as? ReferenceInstruction)?.reference as? StringReference)?.string }
    if (AccessFlags.STATIC.isSet(accessFlags) || returnType != "Ljava/lang/Object;" ||
        NOTES_TIP_SHEET !in strings || NOTES_TIP_TYPE_ARG !in strings) {
        throw PatchException("Messenger controls: the notes tip launcher no longer matches the tested build")
    }
}

/** While the switch is on the launcher answers "showed nothing", the same result callers get once every tip is seen. */
internal fun MutableMethod.injectNotesTips() {
    validateNotesTips()
    addInstructionsWithLabels(0, """
        const-string v0, "growth"
        invoke-static {v0}, $SETTINGS->enabled(Ljava/lang/String;)Z
        move-result v0
        if-eqz v0, :stock_behavior
        sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;
        return-object v0
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
        (tail[1] as? ReferenceInstruction)?.reference.toString() != activeProfile.pluginSentinel ||
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
    if (implementation!!.registerCount != 24 || code.size != activeProfile.adFilterSize || exits != activeProfile.adFilterExits ||
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

internal fun MutableMethod.validateOriginalPhoto() {
    validateScratch()
    if (AccessFlags.STATIC.isSet(accessFlags) || (hookId() != TRANSCODE_IMAGE && hookId() != TRANSCODE_IMAGE_ASYNC)) {
        throw PatchException("Messenger controls: unexpected photo transcoder ${hookId()}")
    }
}

/** Hands an HD photo back as its own file; OriginalPhoto returns null or false to let the stock transcode run. */
internal fun MutableMethod.injectOriginalPhoto() {
    validateOriginalPhoto()
    // The URL, target width and height, options, extras and (async) callback sit in one run of parameter registers.
    val call = if (returnType == "[B") """
        invoke-static/range {p1 .. p7}, $ORIGINAL_PHOTO->sync(Ljava/lang/String;DDLjava/lang/String;Ljava/util/Map;)[B
        move-result-object v0
        if-eqz v0, :stock_behavior
        return-object v0
    """ else """
        invoke-static/range {p1 .. p8}, $ORIGINAL_PHOTO->async(Ljava/lang/String;DDLjava/lang/String;Ljava/util/Map;Ljava/lang/Object;)Z
        move-result v0
        if-eqz v0, :stock_behavior
        return-void
    """
    addInstructionsWithLabels(0, call.trimIndent(), ExternalLabel("stock_behavior", getInstruction(0)))
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
        (instructions[0] as? ReferenceInstruction)?.reference.toString() != activeProfile.subtabsSupplier ||
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

internal fun MutableMethod.validateBrowserPreference(): Int {
    val instructions = implementation!!.instructions
    val key = activeProfile.browserPreferenceIndex
    val getter = instructions.getOrNull(key + 1) as? FiveRegisterInstruction
    if (AccessFlags.STATIC.isSet(accessFlags) ||
        parameterTypes != listOf("Landroid/net/Uri;", "Lcom/facebook/auth/usersession/FbUserSession;") ||
        returnType != "Z" || instructions.getOrNull(key)?.opcode != Opcode.SGET_OBJECT ||
        (instructions[key] as? OneRegisterInstruction)?.registerA != 0 ||
        instructions.getOrNull(key + 1)?.opcode != Opcode.INVOKE_INTERFACE ||
        getter?.registerCount != 3 || getter.registerC != 1 || getter.registerD != 0 || getter.registerE != 3 ||
        (instructions.getOrNull(key) as? ReferenceInstruction)?.reference.toString() != activeProfile.browserPreferenceKey ||
        (instructions.getOrNull(key + 1) as? ReferenceInstruction)?.reference.toString() != activeProfile.preferenceGetter ||
        instructions.getOrNull(key + 2)?.opcode != Opcode.MOVE_RESULT ||
        (instructions[key + 2] as? OneRegisterInstruction)?.registerA != 0 ||
        instructions.getOrNull(key + 3)?.opcode != Opcode.IF_EQZ ||
        (instructions[key + 3] as? OneRegisterInstruction)?.registerA != 0 || implementation!!.registerCount != 9) {
        throw PatchException("Messenger controls: external-browser preference no longer matches the tested build")
    }
    return key + 3
}

internal fun MutableMethod.injectBrowserPreference() {
    val branch = validateBrowserPreference()
    // p1 is Uri (v7). Use the same stock preference branch, preserving surrounding handling.
    addInstructions(branch, "invoke-static {v0, p1}, $SETTINGS->preferExternalBrowser(ZLandroid/net/Uri;)Z\nmove-result v0")
}

/** Instruction index a branch lands on, or -1 when it doesn't start an instruction. */
internal fun List<Instruction>.branchTarget(index: Int): Int {
    val offset = (getOrNull(index) as? OffsetInstruction)?.codeOffset ?: return -1
    val target = take(index).sumOf { it.codeUnits } + offset
    var address = 0
    forEachIndexed { i, instruction -> if (address == target) return i; address += instruction.codeUnits }
    return -1
}

/** Instruction indexes a branch, a switch case or a catch handler can land on. */
internal fun Method.jumpTargets(): Set<Int> {
    val code = implementation!!.instructions.toList()
    val addresses = IntArray(code.size + 1)
    for (i in code.indices) addresses[i + 1] = addresses[i] + code[i].codeUnits
    val indexAt = code.indices.associateBy { addresses[it] }
    val targets = mutableSetOf<Int>()
    code.forEachIndexed { i, instruction ->
        if (instruction !is OffsetInstruction) return@forEachIndexed
        val landing = addresses[i] + instruction.codeOffset
        if (instruction.opcode == Opcode.PACKED_SWITCH || instruction.opcode == Opcode.SPARSE_SWITCH) {
            // Case offsets count from the switch instruction, not from its payload.
            (indexAt[landing]?.let(code::get) as? SwitchPayload)?.switchElements
                ?.forEach { case -> indexAt[addresses[i] + case.offset]?.let(targets::add) }
        } else indexAt[landing]?.let(targets::add)
    }
    implementation!!.tryBlocks.forEach { block ->
        block.exceptionHandlers.forEach { handler -> indexAt[handler.handlerCodeAddress]?.let(targets::add) }
    }
    return targets
}

private const val PEOPLE_SERVER_FLAG = 72344235860374863L

/**
 * Where the Notifications tab loads its server flag: the method's only constant with that value, after the
 * preference branch at 12. It's at 17 in most builds and at 16 where Redex inlined the list reset into one call.
 */
private fun List<Instruction>.peopleFlagIndex(): Int =
    indices.filter { i -> this[i].opcode == Opcode.CONST_WIDE && (this[i] as? WideLiteralInstruction)?.wideLiteral == PEOPLE_SERVER_FLAG }
        .singleOrNull()?.takeIf { it in 16..17 } ?: -1

/**
 * The Notifications tab reads its stock "section hidden" preference into v0 and branches on it. A hidden
 * section is still shown when a server flag (v0, three instructions after its constant) is on; both branches
 * land on the final false return.
 */
internal fun MutableMethod.validatePeopleSection() {
    val code = implementation!!.instructions.toList()
    val key = code.getOrNull(8)
    val default = code.getOrNull(9)
    val getter = code.getOrNull(10) as? FiveRegisterInstruction
    val at = code.peopleFlagIndex()
    val flag = code.getOrNull(at)
    val last = code.lastIndex
    if (!AccessFlags.STATIC.isSet(accessFlags) || returnType != "Z" || parameterTypes != listOf(definingClass) ||
        implementation!!.registerCount != 6 ||
        flag?.opcode != Opcode.CONST_WIDE || (flag as? OneRegisterInstruction)?.registerA != 0 ||
        code.getOrNull(at + 1)?.opcode != Opcode.INVOKE_STATIC ||
        (code[at + 1] as? ReferenceInstruction)?.reference.toString() != activeProfile.peopleFlagCheck ||
        code.getOrNull(at + 2)?.opcode != Opcode.MOVE_RESULT || (code[at + 2] as? OneRegisterInstruction)?.registerA != 0 ||
        code.getOrNull(at + 3)?.opcode != Opcode.IF_NEZ || (code[at + 3] as? OneRegisterInstruction)?.registerA != 0 ||
        code.branchTarget(12) != last || code.branchTarget(at + 3) != last ||
        code[last].opcode != Opcode.RETURN || (code[last] as? OneRegisterInstruction)?.registerA != 4 ||
        code[last - 1].opcode != Opcode.RETURN || (code[last - 1] as? OneRegisterInstruction)?.registerA != 0 ||
        code[last - 2].opcode != Opcode.CONST_4 || (code[last - 2] as? WideLiteralInstruction)?.wideLiteral != 1L ||
        key?.opcode != Opcode.SGET_OBJECT || (key as? OneRegisterInstruction)?.registerA != 0 ||
        (key as? ReferenceInstruction)?.reference.toString() != activeProfile.peopleKey ||
        default?.opcode != Opcode.CONST_4 || (default as? OneRegisterInstruction)?.registerA != 4 ||
        (default as? WideLiteralInstruction)?.wideLiteral != 0L ||
        code.getOrNull(10)?.opcode != Opcode.INVOKE_INTERFACE ||
        (code[10] as? ReferenceInstruction)?.reference.toString() != activeProfile.preferenceGetter ||
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
    val serverBranch = implementation!!.instructions.toList().peopleFlagIndex() + 3
    addInstructions(serverBranch, "invoke-static {v0}, $SETTINGS->keepPeopleSection(Z)Z\nmove-result v0")
    addInstructions(12, "invoke-static {v0}, $SETTINGS->hidePeopleSection(Z)Z\nmove-result v0")
}

private fun DexMethodReference.publishesSuggestions() =
    returnType == "V" && parameterTypes.map { it.toString() } == listOf(IMMUTABLE_LIST, "Ljava/util/Map;")

/**
 * Every People tab suggestion update (fetch result, removal, refresh) ends here: the handler's list and
 * per-filter map go to one listener, loaded first from the handler parameter. Returns that field and call.
 */
internal fun MutableMethod.validatePeopleTab(): Pair<String, String> {
    val code = implementation!!.instructions.toList()
    val handler = implementation!!.registerCount - 1
    val load = code.firstOrNull()
    val field = (load as? ReferenceInstruction)?.reference as? FieldReference
    val publish = code.singleOrNull { it.opcode == Opcode.INVOKE_INTERFACE }
    val call = (publish as? ReferenceInstruction)?.reference as? DexMethodReference
    val matches = AccessFlags.STATIC.isSet(accessFlags) && returnType == "V" && parameterTypes == listOf(definingClass) &&
        implementation!!.registerCount in 4..16 && code.lastOrNull()?.opcode == Opcode.RETURN_VOID &&
        load?.opcode == Opcode.IGET_OBJECT && (load as TwoRegisterInstruction).registerB == handler &&
        field != null && field.definingClass == definingClass &&
        call != null && call.publishesSuggestions() && field.type == call.definingClass &&
        (publish as FiveRegisterInstruction).registerCount == 3 && publish.registerC == load.registerA
    if (!matches) {
        throw PatchException("Messenger controls: the People tab suggestions no longer match the tested build")
    }
    return field.toString() to call.toString()
}

internal fun MutableMethod.injectPeopleTab() {
    val (listener, publish) = validatePeopleTab()
    val handler = implementation!!.registerCount - 1
    // An empty list and map are what the tab gets when Meta has no suggestions, so the section is left out.
    addInstructionsWithLabels(0, """
        const-string v0, "people"
        invoke-static {v0}, $SETTINGS->enabled(Ljava/lang/String;)Z
        move-result v0
        if-eqz v0, :stock_behavior
        iget-object v2, v$handler, $listener
        invoke-static {}, $IMMUTABLE_LIST->of()$IMMUTABLE_LIST
        move-result-object v1
        invoke-static {}, Ljava/util/Collections;->emptyMap()Ljava/util/Map;
        move-result-object v0
        invoke-interface {v2, v1, v0}, $publish
        return-void
    """.trimIndent(), ExternalLabel("stock_behavior", getInstruction(0)))
}

/**
 * The search screen's suggestions source ends by wrapping its one titled section with a status into its
 * result. Returns the index of the status load, the section list register and the status register.
 */
internal fun MutableMethod.validatePeopleSearch(): Triple<Int, Int, Int> {
    val code = implementation!!.instructions.toList()
    val end = code.indexOfLast { it.opcode == Opcode.RETURN_OBJECT }
    val status = code.getOrNull(end - 3)
    val wrap = code.getOrNull(end - 2)
    val result = code.getOrNull(end - 1)
    val field = (status as? ReferenceInstruction)?.reference as? FieldReference
    val call = (wrap as? ReferenceInstruction)?.reference as? DexMethodReference
    val targets = code.indices.map { code.branchTarget(it) }.toSet()
    val matches = !AccessFlags.STATIC.isSet(accessFlags) && end >= 3 &&
        status?.opcode == Opcode.SGET_OBJECT && field?.type == "Ljava/lang/Integer;" &&
        wrap?.opcode == Opcode.INVOKE_STATIC && call != null && call.returnType == returnType &&
        call.parameterTypes.map { it.toString() } == listOf(IMMUTABLE_LIST, "Ljava/lang/Integer;") &&
        (wrap as FiveRegisterInstruction).registerCount == 2 && wrap.registerD == (status as OneRegisterInstruction).registerA &&
        wrap.registerC != wrap.registerD && wrap.registerD < 16 &&
        result?.opcode == Opcode.MOVE_RESULT_OBJECT &&
        (code[end] as OneRegisterInstruction).registerA == (result as OneRegisterInstruction).registerA &&
        (end - 3..end).none { it in targets }
    if (!matches) throw PatchException("Messenger controls: the search suggestions no longer match the tested build")
    return Triple(end - 3, (wrap as FiveRegisterInstruction).registerC, wrap.registerD)
}

internal fun MutableMethod.injectPeopleSearch() {
    val (at, sections, scratch) = validatePeopleSearch()
    // The status register is loaded right after this block, so it is free for the switch check.
    addInstructionsWithLabels(at, """
        const-string v$scratch, "people"
        invoke-static {v$scratch}, $SETTINGS->enabled(Ljava/lang/String;)Z
        move-result v$scratch
        if-eqz v$scratch, :stock_behavior
        invoke-static {}, $IMMUTABLE_LIST->of()$IMMUTABLE_LIST
        move-result-object v$sections
    """.trimIndent(), ExternalLabel("stock_behavior", getInstruction(at)))
}

/**
 * The story viewer requests its suggestions page once, after a flag it sets just before the query; a read of that
 * flag from the fragment parameter skips the request. Returns the index of that read.
 */
internal fun MutableMethod.validatePeopleStory(): Int {
    val code = implementation!!.instructions.toList()
    val query = code.indexOfFirst { ((it as? ReferenceInstruction)?.reference as? StringReference)?.string == STORY_SUGGESTIONS_QUERY }
    val set = (query downTo 0).firstOrNull { code[it].opcode == Opcode.IPUT_BOOLEAN }
    val flag = set?.let { (code[it] as ReferenceInstruction).reference.toString() }
    val guard = code.indices.singleOrNull {
        code[it].opcode == Opcode.IGET_BOOLEAN && (code[it] as ReferenceInstruction).reference.toString() == flag
    } ?: -1
    val read = code.getOrNull(guard) as? TwoRegisterInstruction
    val skip = code.getOrNull(guard + 1)
    val matches = AccessFlags.STATIC.isSet(accessFlags) && returnType == "V" && parameterTypes == listOf(definingClass) &&
        flag != null && flag.startsWith("$definingClass->") && flag.endsWith(":Z") &&
        read != null && read.registerA < 16 && read.registerB == implementation!!.registerCount - 1 &&
        skip?.opcode == Opcode.IF_NEZ && (skip as OneRegisterInstruction).registerA == read.registerA &&
        code.branchTarget(guard + 1) > guard + 1 && guard + 2 < query && guard + 2 !in jumpTargets()
    if (!matches) throw PatchException("Messenger controls: the story viewer suggestions no longer match the tested build")
    return guard
}

internal fun MutableMethod.injectPeopleStory() {
    val guard = validatePeopleStory()
    val flag = (getInstruction(guard) as TwoRegisterInstruction).registerA
    val skipped = getInstruction(implementation!!.instructions.toList().branchTarget(guard + 1))
    // Reads as "already requested" while the switch is on; either way the flag register ends as the stock branch leaves it.
    addInstructionsWithLabels(guard + 2, """
        const-string v$flag, "people"
        invoke-static {v$flag}, $SETTINGS->enabled(Ljava/lang/String;)Z
        move-result v$flag
        if-nez v$flag, :skip_suggestions
    """.trimIndent(), ExternalLabel("skip_suggestions", skipped))
}

internal fun Method.validateMenuSettingsAdd() {
    val impl = implementation ?: throw PatchException("Messenger controls: menu settings item builder has no code")
    val code = impl.instructions.toList()
    val returns = code.count { it.opcode == Opcode.RETURN_OBJECT }
    if (returns != 1) throw PatchException("Messenger controls: menu settings item builder has $returns exits, expected 1")
    if (returnType != "Ljava/util/ArrayList;") throw PatchException("Messenger controls: menu settings item builder returns $returnType")
    if (AccessFlags.STATIC.isSet(accessFlags) || parameterTypes.size != 1 || impl.registerCount < 2 ||
        (code.single { it.opcode == Opcode.RETURN_OBJECT } as OneRegisterInstruction).registerA >= impl.registerCount) {
        throw PatchException("Messenger controls: invalid menu settings item builder registers or parameters")
    }
}

internal fun MutableMethod.injectMenuSettingsAdd() {
    validateMenuSettingsAdd()
    val code = implementation!!.instructions.toList()
    val ret = code.indexOfLast { it.opcode == Opcode.RETURN_OBJECT }
    val retReg = (code[ret] as OneRegisterInstruction).registerA
    replaceInstruction(ret, "invoke-static/range {v$retReg .. v$retReg}, $SETTINGS->addMenuSettingsEntry(Ljava/util/ArrayList;)V")
    addInstructions(ret + 1, "return-object v$retReg")
}

internal fun Method.validateMenuSettingsBind() {
    val impl = implementation ?: throw PatchException("Messenger controls: menu settings binder has no code")
    val code = impl.instructions.toList()
    if (code.none { it.opcode == Opcode.RETURN_VOID }) throw PatchException("Messenger controls: menu settings binder has no normal exit")
    if (returnType != "V") throw PatchException("Messenger controls: menu settings binder returns $returnType")
    if (AccessFlags.STATIC.isSet(accessFlags) || parameterTypes.size != 2 || parameterTypes[1] != "I" ||
        !parameterTypes[0].startsWith("L") || impl.registerCount < 3) {
        throw PatchException("Messenger controls: invalid menu settings binder registers or parameters")
    }
}

internal fun MutableMethod.injectMenuSettingsBind() {
    validateMenuSettingsBind()
    val paramWords = parameterTypes.sumOf { if (it == "J" || it == "D") 2 else 1 } + 1
    val viewHolderReg = implementation!!.registerCount - paramWords + 1
    val code = implementation!!.instructions.toList()
    for (normalExit in code.indices.filter { code[it].opcode == Opcode.RETURN_VOID }.reversed()) {
        replaceInstruction(normalExit, "invoke-static/range {v$viewHolderReg .. v$viewHolderReg}, $SETTINGS->handleMenuItemBound(Ljava/lang/Object;)V")
        addInstructions(normalExit + 1, "return-void")
    }
}

internal fun Method.validateMenuDrawerAdd() {
    if (returnType != "V") throw PatchException("Messenger controls: menu drawer items setter returns $returnType")
    if (parameterTypes != listOf("Ljava/util/List;")) throw PatchException("Messenger controls: menu drawer items setter takes ${parameterTypes.joinToString()}")
    val impl = implementation ?: throw PatchException("Messenger controls: menu drawer items setter has no code")
    if (AccessFlags.STATIC.isSet(accessFlags) || impl.registerCount !in 2..256 || impl.instructions.none()) {
        throw PatchException("Messenger controls: invalid menu drawer items setter registers")
    }
}

internal fun MutableMethod.injectMenuDrawerAdd() {
    validateMenuDrawerAdd()
    addInstructions(0, """
        invoke-static/range {p1 .. p1}, $SETTINGS->addMenuDrawerEntry(Ljava/util/List;)Ljava/util/List;
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

/**
 * Builds that fill the keyboard's tab list inline hand a local ArrayList of tab items to one static
 * (ImmutableList.Builder, Iterable) -> ImmutableList copy. Returns that call's index and list register.
 */
internal fun MutableMethod.validateKeyboardTabsInline(): Pair<Int, Int> {
    val code = implementation!!.instructions.toList()
    val copies = code.indices.filter { index ->
        val ref = (code[index] as? ReferenceInstruction)?.reference as? DexMethodReference
        code[index].opcode == Opcode.INVOKE_STATIC && ref != null && ref.returnType == IMMUTABLE_LIST &&
            ref.parameterTypes.map { it.toString() } == listOf("Lcom/google/common/collect/ImmutableList\$Builder;", "Ljava/lang/Iterable;")
    }
    // Code inserted before a jump target would be skipped by whatever jumps there.
    if (returnType != "V" || copies.size != 1 || copies.single() in jumpTargets()) {
        throw PatchException("Messenger controls: the sticker keyboard tab list differs from the tested build")
    }
    return copies.single() to (code[copies.single()] as FiveRegisterInstruction).registerD
}

/** Drops the avatar tab from the list just before Messenger copies it; the list is a local. */
internal fun MutableMethod.injectKeyboardTabsInline() {
    val (copy, tabs) = validateKeyboardTabsInline()
    addInstructions(copy, "invoke-static/range {v$tabs .. v$tabs}, $SETTINGS->removeAvatarTabs(Ljava/lang/Iterable;)V")
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
internal fun Method.menuFolderItemType(): String {
    val types = implementation!!.instructions.filter { it.opcode == Opcode.NEW_INSTANCE }
        .map { ((it as ReferenceInstruction).reference as TypeReference).type }.toSet()
    return types.singleOrNull()
        ?: throw PatchException("Messenger controls: menu settings item builder creates ${types.size} types, expected 1")
}

/** Messenger casts the tapped folder row just before its folder-selected trace section starts. */
internal fun Method.menuFolderCastIndex(folderItemType: String): Int {
    if (returnType != "V") throw PatchException("Messenger controls: drawer folder click returns $returnType")
    val impl = implementation ?: throw PatchException("Messenger controls: drawer folder click has no code")
    if (AccessFlags.STATIC.isSet(accessFlags) || parameterTypes != listOf("Landroid/view/View;") || impl.registerCount < 2) {
        throw PatchException("Messenger controls: invalid drawer folder click parameters or registers")
    }
    val code = impl.instructions.toList()
    val markers = code.indices.filter {
        ((code[it] as? ReferenceInstruction)?.reference as? StringReference)?.string == DRAWER_FOLDER_SELECTED
    }
    val marker = markers.singleOrNull()
        ?: throw PatchException("Messenger controls: drawer folder click has ${markers.size} folder-selected markers, expected 1")
    val casts = code.indices.filter { index ->
        index < marker && marker - index <= 12 && code[index].opcode == Opcode.CHECK_CAST &&
            ((code[index] as ReferenceInstruction).reference as TypeReference).type == folderItemType
    }
    val cast = casts.singleOrNull()
        ?: throw PatchException("Messenger controls: drawer folder click has ${casts.size} row casts before its marker, expected 1")
    if ((code[cast] as OneRegisterInstruction).registerA >= impl.registerCount) {
        throw PatchException("Messenger controls: drawer folder click row register is outside the method")
    }
    if ((cast + 1..marker).any { it in jumpTargets() }) {
        throw PatchException("Messenger controls: drawer folder click can bypass its row cast")
    }
    // Other cases in this merged click handler may branch beyond the marker. Only native row handling
    // must be dominated by the selected cast, where the consuming settings hook will be inserted.
    val addresses = IntArray(code.size + 1)
    for (i in code.indices) addresses[i + 1] = addresses[i] + code[i].codeUnits
    val indexAt = code.indices.associateBy { addresses[it] }
    val pending = ArrayDeque<Int>()
    val seen = mutableSetOf<Int>()
    pending.add(0)
    while (pending.isNotEmpty()) {
        val index = pending.removeFirst()
        if (index == cast || !seen.add(index)) continue
        val instruction = code[index]
        val reference = (instruction as? ReferenceInstruction)?.reference
        val rowOwner = (reference as? FieldReference)?.definingClass
            ?: (reference as? DexMethodReference)?.definingClass
        if (index > cast && rowOwner == folderItemType) {
            throw PatchException("Messenger controls: drawer folder handling can bypass its settings hook")
        }
        if (instruction is OffsetInstruction && instruction.opcode != Opcode.FILL_ARRAY_DATA) {
            val landing = indexAt[addresses[index] + instruction.codeOffset]
                ?: throw PatchException("Messenger controls: drawer folder click branch is invalid")
            if (instruction.opcode == Opcode.PACKED_SWITCH || instruction.opcode == Opcode.SPARSE_SWITCH) {
                val payload = code[landing] as? SwitchPayload
                    ?: throw PatchException("Messenger controls: drawer folder click switch is invalid")
                payload.switchElements.forEach { element ->
                    pending.add(indexAt[addresses[index] + element.offset]
                        ?: throw PatchException("Messenger controls: drawer folder click case is invalid"))
                }
            } else pending.add(landing)
        }
        if (instruction.opcode.canThrow()) impl.tryBlocks.filter {
            addresses[index] >= it.startCodeAddress && addresses[index] < it.startCodeAddress + it.codeUnitCount
        }.forEach { block -> block.exceptionHandlers.forEach { handler ->
            pending.add(indexAt[handler.handlerCodeAddress]
                ?: throw PatchException("Messenger controls: drawer folder click handler is invalid"))
        } }
        if (instruction.opcode.canContinue() && index + 1 < code.size) pending.add(index + 1)
    }
    return cast
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

internal fun MutableMethod.validateStorySeen(): Int {
    if (AccessFlags.STATIC.isSet(accessFlags) || returnType != "V" || parameterTypes != listOf(MONTAGE_CARD, "Z")) {
        throw PatchException("Messenger controls: the story mark-read handler is ${hookId()}, expected (MontageCard, boolean) void")
    }
    val code = implementation!!.instructions.toList()
    val zero = code.firstOrNull()
    if (zero?.opcode != Opcode.CONST_4 || (zero as OneRegisterInstruction).registerA != 0 ||
        (zero as NarrowLiteralInstruction).narrowLiteral != 0) {
        throw PatchException("Messenger controls: the story mark-read handler no longer starts by zeroing v0")
    }
    val card = implementation!!.registerCount - 2
    val cache = code.indexOfFirst { insn ->
        insn.opcode == Opcode.INVOKE_STATIC && (insn as ReferenceInstruction).reference.toString() == IMMUTABLE_LIST_OF &&
            (insn as FiveRegisterInstruction).registerCount == 1 && insn.registerC == card
    }
    if (cache <= 1 || cache !in jumpTargets()) {
        throw PatchException("Messenger controls: the story mark-read handler's local seen update isn't where the send ends")
    }
    val send = code.subList(1, cache)
    val exits = setOf(Opcode.RETURN_VOID, Opcode.RETURN, Opcode.RETURN_WIDE, Opcode.RETURN_OBJECT, Opcode.THROW)
    if (send.any { it.opcode in exits } ||
        send.none { ((it as? ReferenceInstruction)?.reference as? StringReference)?.string == STORY_MARK_READ_TAG }) {
        throw PatchException("Messenger controls: the story mark-read handler's send no longer matches the tested build")
    }
    return cache
}

internal fun MutableMethod.injectStorySeen() {
    val cache = validateStorySeen()
    addInstructionsWithLabels(1, """
        invoke-static {}, $SETTINGS->viewStoriesAnonymously()Z
        move-result v0
        if-eqz v0, :stock_behavior
        const/4 v0, 0x0
        goto/16 :local_seen
    """.trimIndent(), ExternalLabel("stock_behavior", getInstruction(1)), ExternalLabel("local_seen", getInstruction(cache)))
}

internal const val FB_USER_SESSION = "Lcom/facebook/auth/usersession/FbUserSession;"
private const val SET_ADD = "Ljava/util/Set;->add(Ljava/lang/Object;)Z"

/**
 * Messenger's set of story cards read on this phone. Its story lists count a card in the set as seen whatever the
 * server says, and each account's session starts it empty.
 */
internal class StoryReadSet(val type: String, val set: String, val session: String, val cardId: String, val add: String)

private fun Method.locals() = implementation!!.registerCount -
    parameterTypes.sumOf { type -> if (type.toString() == "J" || type.toString() == "D") 2 else 1 } -
    if (AccessFlags.STATIC.isSet(accessFlags)) 0 else 1

/** The handler's local update ends by handing the card itself to the read set; nothing else there takes the card. */
internal fun MutableMethod.storyReadSetAdd(): DexMethodReference {
    val cache = validateStorySeen()
    val card = implementation!!.registerCount - 2
    val calls = implementation!!.instructions.drop(cache).filter { insn ->
        val call = (insn as? ReferenceInstruction)?.reference as? DexMethodReference
        insn.opcode == Opcode.INVOKE_VIRTUAL && call != null && call.returnType == "V" &&
            call.parameterTypes.firstOrNull()?.toString() == MONTAGE_CARD
    }
    val add = calls.singleOrNull() as? FiveRegisterInstruction
    if (add == null || add.registerCount < 2 || add.registerD != card) {
        throw PatchException("Messenger controls: the story mark-read handler no longer hands the card to one read set")
    }
    return (add as ReferenceInstruction).reference as DexMethodReference
}

internal fun ClassDef.validateStoryReadSet(add: DexMethodReference): StoryReadSet {
    fun fail(what: String): Nothing = throw PatchException("Messenger controls: the story read set $type $what")
    val instanceFields = fields.filter { !AccessFlags.STATIC.isSet(it.accessFlags) }
    val set = instanceFields.singleOrNull { it.type == "Ljava/util/Set;" } ?: fail("no longer holds exactly one set")
    val session = instanceFields.singleOrNull { it.type == FB_USER_SESSION } ?: fail("no longer holds exactly one session")
    val setField = "$type->${set.name}:Ljava/util/Set;"
    val sessionField = "$type->${session.name}:$FB_USER_SESSION"
    fun List<Instruction>.writes(field: String) =
        any { it.opcode == Opcode.IPUT_OBJECT && (it as ReferenceInstruction).reference.toString() == field }

    // The seed goes just before the constructor's return, so nothing may branch past it.
    val constructor = methods.filter { it.name == "<init>" }.singleOrNull() ?: fail("no longer has one constructor")
    val built = constructor.implementation?.instructions?.toList() ?: fail("constructor has no code")
    if (built.lastOrNull()?.opcode != Opcode.RETURN_VOID || built.count { it.opcode == Opcode.RETURN_VOID } != 1 ||
        built.any { it is OffsetInstruction } || constructor.implementation!!.tryBlocks.isNotEmpty() ||
        !built.writes(setField) || !built.writes(sessionField) || constructor.locals() !in 2..15) {
        fail("constructor no longer matches the tested build")
    }

    val addId = "${add.definingClass}->${add.name}(${add.parameterTypes.joinToString("")})${add.returnType}"
    val adder = methods.singleOrNull { it.hookId() == addId } ?: fail("no longer has ${add.name}")
    val code = adder.implementation?.instructions?.toList() ?: fail("${add.name} has no code")
    // The hook reads p0 and p1 into v0 and v1 at the method's entry, where no local holds a value yet.
    if (AccessFlags.STATIC.isSet(adder.accessFlags) || adder.locals() !in 2..14) fail("${add.name} no longer matches the tested build")
    val adds = code.indices.filter { code[it].opcode == Opcode.INVOKE_INTERFACE && (code[it] as ReferenceInstruction).reference.toString() == SET_ADD }
    val at = adds.singleOrNull()?.takeIf { it >= 2 } ?: fail("${add.name} no longer adds one card ID")
    val call = code[at] as FiveRegisterInstruction
    val readSet = code[at - 2]
    val readId = code[at - 1]
    val idField = (readId as? ReferenceInstruction)?.reference as? FieldReference
    if (readSet.opcode != Opcode.IGET_OBJECT || (readSet as ReferenceInstruction).reference.toString() != setField ||
        (readSet as TwoRegisterInstruction).registerA != call.registerC || readId.opcode != Opcode.IGET_OBJECT ||
        idField?.definingClass != MONTAGE_CARD || idField.type != "Ljava/lang/String;" ||
        (readId as TwoRegisterInstruction).registerA != call.registerD) {
        fail("${add.name} no longer adds the card's ID to its set")
    }
    return StoryReadSet(type, setField, sessionField, idField.toString(), addId)
}

/** Every card Messenger marks read on this phone passes through here; the extension keeps it while the switch is on. */
internal fun MutableMethod.injectStoryReadSetAdd(readSet: StoryReadSet) {
    addInstructions(0, """
        iget-object v0, p0, ${readSet.session}
        iget-object v1, p1, ${readSet.cardId}
        invoke-static {v0, v1}, $SETTINGS->markStorySeen(Ljava/lang/Object;Ljava/lang/String;)V
    """.trimIndent())
}

/** A new session's read set starts empty; the extension puts back the cards its account kept. */
internal fun MutableMethod.injectStoryReadSetSeed(readSet: StoryReadSet) {
    val exit = implementation!!.instructions.indexOfLast { it.opcode == Opcode.RETURN_VOID }
    addInstructions(exit, """
        iget-object v0, p0, ${readSet.set}
        iget-object v1, p0, ${readSet.session}
        invoke-static {v0, v1}, $SETTINGS->seedSeenStories(Ljava/util/Set;Ljava/lang/Object;)V
    """.trimIndent())
}

private val RESOURCE_CONSTS = setOf(Opcode.CONST_4, Opcode.CONST_16, Opcode.CONST, Opcode.CONST_HIGH16)

/**
 * Your own story's Save item, and where the story menu starts on anyone else's. The menu asks once whether the story
 * is yours. That path adds Save, Delete and Story settings, so only the Save item is copied, into a helper the other
 * path calls.
 */
internal class StorySave(
    /** First instruction of the path for other people's stories; nothing jumps there. */
    val others: Int,
    val fragment: Int,
    val menu: Int,
    val fragmentType: String,
    val menuType: String,
    val controller: String,
    /** Card controllers the item is offered for, in builds that list them; empty where [canSave] answers instead. */
    val saveable: List<String>,
    val canSave: String?,
    val id: Long,
    val label: Long,
    val labelOf: String,
    val icon: String,
    val addItem: String,
    val handler: String,
)

internal fun MutableMethod.validateStorySave(): StorySave {
    fun fail(what: String): Nothing = throw PatchException("Messenger controls: the story menu $what")
    if (name != "onClick" || returnType != "V" || parameterTypes.map { it.toString() } != listOf("Landroid/view/View;")) {
        fail("builder ${hookId()} is no longer onClick(View)")
    }
    val code = implementation!!.instructions.toList()
    val addresses = IntArray(code.size + 1)
    for (i in code.indices) addresses[i + 1] = addresses[i] + code[i].codeUnits
    val indexAt = code.indices.associateBy { addresses[it] }
    fun op(i: Int) = code.getOrNull(i)?.opcode
    fun reg(i: Int) = (code.getOrNull(i) as? OneRegisterInstruction)?.registerA ?: -1
    fun call(i: Int) = (code.getOrNull(i) as? ReferenceInstruction)?.reference as? DexMethodReference
    fun params(i: Int) = call(i)?.parameterTypes?.map { it.toString() }
    fun args(i: Int) = (code.getOrNull(i) as? FiveRegisterInstruction)?.let {
        listOf(it.registerC, it.registerD, it.registerE, it.registerF, it.registerG).take(it.registerCount)
    }.orEmpty()
    fun branch(i: Int) = (code.getOrNull(i) as? OffsetInstruction)?.let { indexAt[addresses[i] + it.codeOffset] } ?: -1
    fun literal(i: Int) = if (op(i) in RESOURCE_CONSTS) (code[i] as WideLiteralInstruction).wideLiteral else null
    // The builder loads a few constants between the answer and its branches.
    fun answer(check: Int) = (check - 1 downTo 0).firstOrNull { op(it) !in RESOURCE_CONSTS && op(it) != Opcode.CONST_STRING } ?: -1

    // "Is this your story?" and a second flag both branch to your own story's items; what follows them is for anyone else's.
    val own = code.indices.filter { i ->
        if (op(i) != Opcode.IF_NEZ || op(i + 1) != Opcode.IGET_BOOLEAN || op(i + 2) != Opcode.IF_NEZ || reg(i + 2) != reg(i + 1) ||
            branch(i) < 0 || branch(i) != branch(i + 2)) return@filter false
        val result = answer(i)
        op(result) == Opcode.MOVE_RESULT && reg(result) == reg(i) && op(result - 1) == Opcode.INVOKE_VIRTUAL &&
            call(result - 1)?.returnType == "Z" && params(result - 1)?.isEmpty() == true &&
            args(result - 1) == listOf((code[i + 1] as TwoRegisterInstruction).registerB)
    }.singleOrNull() ?: fail("no longer asks once whether the story is yours")
    val result = answer(own)
    val flag = reg(own)
    val fragment = args(result - 1).single()
    val fragmentType = call(result - 1)!!.definingClass
    val menu = reg(result - 2)
    val menuType = call(result - 3)?.returnType
    if (op(result - 2) != Opcode.MOVE_RESULT_OBJECT || op(result - 3) != Opcode.INVOKE_STATIC || menuType == null) {
        fail("no longer builds its menu right before asking whether the story is yours")
    }
    // The helper reads the fragment and the menu where the other path starts, so nothing on the way may change or skip to it.
    val others = own + 3
    val targets = jumpTargets()
    val written = (result + 1 until own).map(::reg) + reg(own + 1)
    if (fragment in written || menu in written || fragment > 15 || menu > 15 || others >= code.size ||
        (result - 2..others).any { it in targets }) {
        fail("path for other people's stories no longer matches the tested build")
    }

    // Your own story's items open with one call, a second look at the answer, and the Save item's own test.
    val entry = branch(own)
    val skip = branch(entry + 1)
    val controller = call(entry + 2)
    if (op(entry) != Opcode.INVOKE_STATIC || op(entry + 1) != Opcode.IF_EQZ || reg(entry + 1) != flag ||
        op(entry + 2) != Opcode.INVOKE_STATIC || controller == null || params(entry + 2) != listOf(fragmentType) ||
        args(entry + 2) != listOf(fragment) || op(entry + 3) != Opcode.MOVE_RESULT_OBJECT) {
        fail("items for your own story no longer start with Save")
    }
    val card = reg(entry + 3)
    val saveable = mutableListOf<String>()
    var canSave: String? = null
    var add = entry + 4
    if (op(add) == Opcode.INSTANCE_OF) {
        // Older builds list the card types: a match jumps to the item, the last miss skips it.
        while (op(add) == Opcode.INSTANCE_OF) {
            val test = code[add] as TwoRegisterInstruction
            if (test.registerB != card || reg(add + 1) != test.registerA) fail("Save item's card test no longer matches the tested build")
            saveable += ((code[add] as ReferenceInstruction).reference as TypeReference).type
            add += 2
            if (op(add - 1) == Opcode.IF_EQZ && branch(add - 1) == skip) break
            if (op(add - 1) != Opcode.IF_NEZ) fail("Save item's card test no longer matches the tested build")
        }
        if (op(add - 1) != Opcode.IF_EQZ || (entry + 5 until add - 1 step 2).any { branch(it) != add }) {
            fail("Save item's card test no longer matches the tested build")
        }
    } else {
        // Newer builds ask the card's controller.
        val test = call(add)
        if (op(add) != Opcode.INVOKE_VIRTUAL || test == null || test.returnType != "Z" || test.parameterTypes.isNotEmpty() ||
            args(add) != listOf(card) || op(add + 1) != Opcode.MOVE_RESULT || op(add + 2) != Opcode.IF_EQZ ||
            reg(add + 2) != reg(add + 1) || branch(add + 2) != skip) {
            fail("Save item's card test no longer matches the tested build")
        }
        canSave = test.toString()
        add += 3
    }
    val id = literal(add)
    val label = literal(add + 1)
    val labelOf = call(add + 2)
    val icon = (code.getOrNull(add + 4) as? ReferenceInstruction)?.reference as? FieldReference
    val addItem = call(add + 5)
    if (id == null || label == null || labelOf == null || icon == null || addItem == null ||
        op(add + 2) != Opcode.INVOKE_STATIC || labelOf.returnType != "Ljava/lang/String;" || args(add + 2) != listOf(fragment, reg(add + 1)) ||
        op(add + 3) != Opcode.MOVE_RESULT_OBJECT || op(add + 4) != Opcode.SGET_OBJECT || op(add + 5) != Opcode.INVOKE_STATIC ||
        params(add + 5) != listOf(icon.type, fragmentType, menuType, "Ljava/lang/String;", "I") ||
        args(add + 5) != listOf(reg(add + 4), fragment, menu, reg(add + 3), reg(add)) || skip != add + 6) {
        fail("Save item no longer matches the tested build")
    }

    // The menu sends every click to one handler built from the fragment; its Save branch does the saving.
    val handlers = code.indices.filter { i ->
        val type = ((code[i] as? ReferenceInstruction)?.reference as? TypeReference)?.type
        op(i) == Opcode.NEW_INSTANCE && op(i + 1) == Opcode.INVOKE_DIRECT && call(i + 1)?.name == "<init>" &&
            call(i + 1)?.definingClass == type && params(i + 1) == listOf(fragmentType) && args(i + 1) == listOf(reg(i), fragment) &&
            op(i + 2) == Opcode.INVOKE_VIRTUAL && args(i + 2) == listOf(menu, reg(i))
    }
    val handler = handlers.singleOrNull() ?: fail("no longer sends its clicks to one handler")
    return StorySave(
        others, fragment, menu, fragmentType, menuType, controller.toString(), saveable, canSave, id, label,
        labelOf.toString(), icon.toString(), addItem.toString(), ((code[handler] as ReferenceInstruction).reference as TypeReference).type,
    )
}

/** The handler must save when it gets the ID the copied item carries, or the new item would do something else. */
internal fun ClassDef.validateStoryMenuHandler(save: StorySave) {
    fun fail(what: String): Nothing = throw PatchException("Messenger controls: the story menu handler $type $what")
    fun Instruction.logsSave() = ((this as? ReferenceInstruction)?.reference as? StringReference)?.string == STORY_SAVE_TAG
    val method = methods.singleOrNull { m -> m.implementation?.instructions?.any { it.logsSave() } == true }
        ?: fail("no longer logs $STORY_SAVE_TAG")
    val code = method.implementation!!.instructions.toList()
    val branch = (code.indexOfFirst { it.logsSave() } downTo 0).firstOrNull { code[it].opcode == Opcode.IF_NE }
        ?: fail("no longer picks the Save item by its ID")
    // One side of the comparison is the ID, loaded by the last write to that register before the branch.
    val compared = (code[branch] as TwoRegisterInstruction).let { listOf(it.registerA, it.registerB) }.mapNotNull { register ->
        code.subList(0, branch).lastOrNull { (it as? OneRegisterInstruction)?.registerA == register }
            ?.takeIf { it.opcode in RESOURCE_CONSTS } as? WideLiteralInstruction
    }
    if (compared.none { it.wideLiteral == save.id }) fail("no longer saves the item the story menu adds")
}

/** Offers Save on someone else's story the way the menu offers it on yours, while the switch is on. */
internal fun storySaveHelper(definingClass: String, save: StorySave): MutableMethod {
    val test = save.canSave?.let { "invoke-virtual {v0}, $it\nmove-result v1\nif-eqz v1, :done" }
        ?: save.saveable.mapIndexed { i, type ->
            "instance-of v1, v0, $type\n" + if (i == save.saveable.lastIndex) "if-eqz v1, :done" else "if-nez v1, :add"
        }.joinToString("\n")
    val parameters = listOf(save.fragmentType, save.menuType).map { ImmutableMethodParameter(it, null, null) }
    return MutableMethod(ImmutableMethod(definingClass, STORY_SAVE_HELPER, parameters, "V",
        AccessFlags.PUBLIC.value or AccessFlags.STATIC.value, null, null, ImmutableMethodImplementation(6, emptyList(), null, null)))
        .apply {
            addInstructionsWithLabels(0, """
                invoke-static {}, $SETTINGS->saveAnyStory()Z
                move-result v0
                if-eqz v0, :done
                invoke-static {p0}, ${save.controller}
                move-result-object v0
                if-eqz v0, :done
            """.trimIndent() + "\n" + test + "\n" + """
                :add
                const v3, 0x${save.id.toString(16)}
                const v1, 0x${save.label.toString(16)}
                invoke-static {p0, v1}, ${save.labelOf}
                move-result-object v2
                sget-object v1, ${save.icon}
                invoke-static {v1, p0, p1, v2, v3}, ${save.addItem}
                :done
                return-void
            """.trimIndent())
        }
}

/** Nothing jumps to where the other path starts, and the call only reads the fragment and the menu. */
internal fun MutableMethod.injectStorySave(save: StorySave) {
    addInstructions(save.others, "invoke-static {v${save.fragment}, v${save.menu}}, " +
        "$definingClass->$STORY_SAVE_HELPER(${save.fragmentType}${save.menuType})V")
}

/** ChatAnimation's roles. */
private const val CHAT_ROLE = 1
private const val INBOX_ROLE = 2

/** One local and the four words of (this, transit, enter, nextAnim): v1 is the fragment, v3 enter and v4 nextAnim. */
private fun Method.requireAnimationFrame(what: String) {
    if (AccessFlags.STATIC.isSet(accessFlags) || implementation?.registerCount != 5 ||
        hookId() != "$definingClass->onCreateAnimation(IZI)$ANIMATION") {
        throw PatchException("Messenger controls: $what no longer has the tested animation signature")
    }
}

/** androidx's own answer: no animation, so the one in the transaction loads. */
internal fun Method.validateFragmentAnimation() {
    requireAnimationFrame("androidx's fragment animation")
    val code = implementation!!.instructions.toList()
    if (hookId() != FRAGMENT_ANIMATION || code.map { it.opcode } != listOf(Opcode.CONST_4, Opcode.RETURN_OBJECT) ||
        (code[0] as WideLiteralInstruction).wideLiteral != 0L || code.any { (it as OneRegisterInstruction).registerA != 0 }) {
        throw PatchException("Messenger controls: androidx's fragment animation no longer answers none")
    }
}

/** The older chat loads the transaction's animation itself, or answers none. It never reads v0 before setting it. */
internal fun Method.validateLegacyChatAnimation() {
    requireAnimationFrame("the older chat")
    val code = implementation!!.instructions.toList()
    if (code.map { it.opcode } != listOf(Opcode.IF_EQZ, Opcode.INVOKE_VIRTUAL, Opcode.MOVE_RESULT_OBJECT,
            Opcode.INVOKE_STATIC, Opcode.MOVE_RESULT_OBJECT, Opcode.RETURN_OBJECT, Opcode.CONST_4, Opcode.RETURN_OBJECT) ||
        (code[0] as OneRegisterInstruction).registerA != 4 ||
        (code[3] as ReferenceInstruction).reference.toString() !=
            "Landroid/view/animation/AnimationUtils;->loadAnimation(Landroid/content/Context;I)$ANIMATION") {
        throw PatchException("Messenger controls: the older chat's animation no longer matches the tested build")
    }
}

/**
 * The chat and the inbox must take androidx's answer, or the edit there would never see them.
 * [classOf] looks a type up in the APK.
 */
internal fun validateInheritsFragmentAnimation(type: String, classOf: (String) -> ClassDef?) {
    var current = classOf(type)
    while (current != null && current.type != ANDROIDX_FRAGMENT) {
        if (current.methods.any { it.name == "onCreateAnimation" }) {
            throw PatchException("Messenger controls: ${current.type} answers its own fragment animation")
        }
        current = classOf(current.superclass ?: break)
    }
    if (current?.type != ANDROIDX_FRAGMENT) throw PatchException("Messenger controls: $type is no longer an androidx fragment")
}

/** Asks ChatAnimation for the chat and the inbox under it. Every other fragment keeps androidx's answer. */
internal fun MutableMethod.injectFragmentAnimation(chat: String, inbox: String) {
    validateFragmentAnimation()
    addInstructionsWithLabels(0, """
        instance-of v0, v1, $chat
        if-nez v0, :chat
        instance-of v0, v1, $inbox
        if-eqz v0, :stock_behavior
        const/4 v0, $INBOX_ROLE
        goto :ask
        :chat
        const/4 v0, $CHAT_ROLE
        :ask
        invoke-static {v1, v0, v3, v4}, $CHAT_ANIMATION_CREATE
        move-result-object v0
        return-object v0
    """.trimIndent(), ExternalLabel("stock_behavior", getInstruction(0)))
}

/** The older chat asks first and loads its own animation when ChatAnimation has none. */
internal fun MutableMethod.injectLegacyChatAnimation() {
    validateLegacyChatAnimation()
    addInstructionsWithLabels(0, """
        const/4 v0, $CHAT_ROLE
        invoke-static {v1, v0, v3, v4}, $CHAT_ANIMATION_CREATE
        move-result-object v0
        if-eqz v0, :stock_behavior
        return-object v0
    """.trimIndent(), ExternalLabel("stock_behavior", getInstruction(0)))
}

/** Search and notifications open a chat in this activity instead of over the inbox; the extension matches its name. */
internal const val CHAT_ACTIVITY = "Lcom/facebook/messaging/msys/thread/fragment/MsysThreadViewActivity;"

private const val ANDROID_NAMESPACE = "http://schemas.android.com/apk/res/android"

private fun chatSlide(from: String, to: String, duration: Int) = """
    <?xml version="1.0" encoding="utf-8"?>
    <translate xmlns:android="$ANDROID_NAMESPACE" android:fromXDelta="$from" android:toXDelta="$to"
        android:duration="$duration" android:interpolator="@anim/hush_chat_ease" />
""".trimIndent() + "\n"

/**
 * The chat activity's slide, under the names and lengths the extension's ChatAnimation uses. It eases like the chat
 * fragment's slide, and the hold keeps the screen underneath drawn while a chat slides over it or away.
 */
internal val CHAT_ANIMATION_FILES = mapOf(
    "res/anim/hush_chat_ease.xml" to """
        <?xml version="1.0" encoding="utf-8"?>
        <pathInterpolator xmlns:android="$ANDROID_NAMESPACE" android:controlX1="0.2" android:controlY1="0"
            android:controlX2="0" android:controlY2="1" />
    """.trimIndent() + "\n",
    "res/anim/hush_chat_in.xml" to chatSlide("100%", "0", 300),
    "res/anim/hush_chat_in_rtl.xml" to chatSlide("-100%", "0", 300),
    "res/anim/hush_chat_out.xml" to chatSlide("0", "100%", 250),
    "res/anim/hush_chat_out_rtl.xml" to chatSlide("0", "-100%", 250),
    "res/anim/hush_chat_hold.xml" to """
        <?xml version="1.0" encoding="utf-8"?>
        <alpha xmlns:android="$ANDROID_NAMESPACE" android:fromAlpha="1" android:toAlpha="1" android:duration="300" />
    """.trimIndent() + "\n",
)
