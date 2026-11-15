package compat;

import com.android.tools.smali.dexlib2.AccessFlags;
import com.android.tools.smali.dexlib2.DexFileFactory;
import com.android.tools.smali.dexlib2.Opcode;
import com.android.tools.smali.dexlib2.Opcodes;
import com.android.tools.smali.dexlib2.iface.ClassDef;
import com.android.tools.smali.dexlib2.iface.Method;
import com.android.tools.smali.dexlib2.iface.Field;
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction;
import com.android.tools.smali.dexlib2.iface.instruction.Instruction;
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction;
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction;
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction;
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction;
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction;
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction;
import com.android.tools.smali.dexlib2.iface.instruction.ThreeRegisterInstruction;
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction;
import com.android.tools.smali.dexlib2.iface.instruction.SwitchPayload;
import com.android.tools.smali.dexlib2.iface.reference.FieldReference;
import com.android.tools.smali.dexlib2.iface.reference.MethodReference;
import com.android.tools.smali.dexlib2.iface.reference.StringReference;
import com.android.tools.smali.dexlib2.iface.reference.TypeReference;
import com.android.tools.smali.dexlib2.iface.value.StringEncodedValue;

import java.io.*;
import java.nio.file.*;
import java.security.DigestOutputStream;
import java.security.MessageDigest;
import java.security.cert.Certificate;
import java.util.*;
import java.util.jar.JarEntry;
import java.util.jar.JarFile;
import java.util.regex.*;
import java.util.stream.Collectors;
import java.util.zip.ZipEntry;
import java.util.zip.ZipException;
import java.util.zip.ZipFile;

import static compat.CompatReport.*;
import static compat.Bubbles.*;
import static compat.Coexist.*;
import static compat.Media.*;
import static compat.Inbox.*;
import static compat.MessageLog.*;
import static compat.Tabs.*;
import static compat.Menus.*;
import static compat.Chats.*;
import static compat.Looks.*;
import static compat.Extras.*;
import static compat.TopBar.*;
import static compat.Drawer.*;

/** findControls: every control's hooks, found the way the patches find them. */
final class Controls {

    static Map<String, List<Method>> findControls(List<ClassDef> classes) {
        var found = new LinkedHashMap<String, List<Method>>();
        for (var key : CONTROL_KEYS) found.put(key, new ArrayList<>());
        var inboxTypes = new HashMap<String, ClassDef>();
        classes.forEach(c -> inboxTypes.put(c.getType(), c));
        var stringTables = stringTables(classes);
        found.get("ai_sticker_cell").addAll(findAiStickerCells(classes));
        found.get("ai_sticker_grid").addAll(findAiStickerGrids(classes));
        var community = communityInbox(classes);
        if (community != null) found.get("community_inbox").add(community.render());
        found.get("emoji_drawer").addAll(emojiDrawerReaders(classes));
        found.get("inbox_search_bar").addAll(searchIconReaders(classes));
        found.get("emoji_search").addAll(emojiSearchWatchers(classes));
        found.get("tab_badges").addAll(tabBadgeDispatchers(classes));
        found.get("facebook_badge").addAll(facebookBadgeChecks(classes));
        found.get("facebook_profile_header").addAll(profileHeaders(classes));
        found.get("tab_config").addAll(tabConfigurations(classes));
        found.get("ai_mentions").addAll(aiMentionDispatchers(classes));
        found.get("ai_commands").addAll(aiCommandLists(classes));
        var searchBars = searchBarBuilders(classes);
        found.get("ai_search_hint").addAll(searchBars);
        found.get("ai_search_screen_hint").addAll(searchScreenHints(classes, searchBars));
        found.get("ai_mention_rows").addAll(aiMentionRowChecks(classes));
        found.get("ai_summary").addAll(aiSummary(classes));
        found.get("xhe_audio").addAll(shareCopies(classes));
        found.get("disappearing_swipe").addAll(disappearingSwipeStarts(classes));
        found.get("recent_media").addAll(recentMediaDetectors(classes));
        found.get("instants_button").addAll(instantsButtonAttaches(classes));
        found.get("save_voice").addAll(voiceDownloads(classes));
        found.get("save_voice_menu").addAll(saveVoiceMenu(classes));
        found.get("message_actions").addAll(messageActions(classes));
        found.get("message_actions_more").addAll(messageActionsMore(classes));
        found.get("hide_read_receipts").addAll(chatSeenBroadcasts(classes));
        found.get("reply_read").addAll(replyReadDispatches(classes));
        found.get("analytics_uploads").addAll(analyticsUploads(classes));
        found.get("analytics_uploads").addAll(boundUploadTasks(classes));
        found.get("analytics_uploads").addAll(xanalyticsUploadTimers(classes));
        found.get("analytics_uploads").addAll(inProcessUploadStarts(classes, stringTables));
        found.get("attribution_uploads").addAll(attributionUploads(classes));
        found.get("ad_events").addAll(adEvents(classes));
        found.get("mqtt_telemetry").addAll(mqttTelemetry(classes));
        pinnedChats(classes).forEach((hook, methods) -> found.get(hook).addAll(methods));
        hiddenChats(classes, inboxTypes).forEach((hook, methods) -> found.get(hook).addAll(methods));
        found.get("nearby_scans").addAll(nearbyScans(classes));
        found.get("wifi_identity").addAll(wifiIdentityReads(classes));
        found.get("phone_id_sync").addAll(phoneIdSync(classes));
        found.get("story_hold").addAll(storyHold(classes));
        found.get("chat_preview").addAll(chatPreview(classes));
        found.get("chat_preview_size").addAll(chatPreviewSize(classes));
        found.get("landscape_lock").addAll(portraitLock(classes));
        found.get("landscape_media").addAll(mediaOrientation(classes));
        found.get("blocked_list_pictures").addAll(blockedListPictures(classes));
        found.get("restricted_notify").addAll(restrictedNotify(classes));
        found.get("share_story").addAll(shareStory(classes));
        found.get("share_story_target").addAll(shareStoryTarget(classes));
        found.get("floating_tab_bar").addAll(tabBarBuilders(classes, true));
        found.get("tab_bar_overlay").addAll(tabBarBuilders(classes, false));
        found.get("tab_bar_scroll_away").addAll(tabBarScrollAway(classes));
        found.get("avatar_shape").addAll(avatarShape(classes));
        found.get("story_ring").addAll(storyRing(classes));
        found.get("quiet_call_ring").addAll(quietCallRing(classes));
        found.get("quiet_call_notification").addAll(quietCallNotification(classes));
        found.get("car_messages").addAll(carMessages(classes));
        found.get("car_extension_gate").addAll(carExtensionGate(classes));
        found.get("local_chat_search").addAll(localChatSearch(classes));
        found.get("call_recording").addAll(callRecording(classes));
        found.get("home_header").addAll(homeHeader(classes));
        var markRead = markReadButton(classes);
        if (!markRead.isEmpty()) {
            found.get("mark_read_bar").add(markRead.get(0));
            found.get("mark_read_bar").add(markRead.get(2));
            found.get("hide_call_bar").add(markRead.get(0));
            found.get("hide_call_bar").add(markRead.get(2));
            found.get("mark_read_click").add(markRead.get(1));
        }
        found.get("text_style").addAll(textStyleField(classes));
        found.get("message_log").addAll(messageLogHooks(classes));
        var logButton = messageLogButton(classes);
        if (!logButton.isEmpty()) {
            found.get("message_log_button").add(logButton.get(0));
            found.get("message_log_click").add(logButton.get(1));
        }
        found.get("app_theme_pick").addAll(appThemePick(classes));
        found.get("auto_reply").addAll(messageLogHooks(classes));
        found.get("unsent_recall").addAll(unsentRecall(classes));
        found.get("unsent_clear").addAll(unsentClear(classes));
        found.get("quiet_log_check").addAll(quietLogCheck(classes));
        found.get("quiet_log_drop").addAll(quietLogDrop(classes));
        found.get("chat_channel_keep").addAll(chatChannelKeep(classes));
        found.get("chat_channel_raise").addAll(chatChannelRaise(classes));
        found.get("system_camera").addAll(systemCameraLaunches(classes));
        found.get("external_gallery").addAll(externalGalleryHooks(classes, stringTables));
        found.get("gallery_temp_file").addAll(galleryTempFileHooks(classes));
        found.get("gallery_to_chat").addAll(galleryToChatHooks(classes));
        found.get("instant_gallery").addAll(instantGallery(classes));
        found.get("special_contacts").addAll(specialContacts(classes));
        found.get("menu_blur").addAll(menuBlur(classes));
        found.get("chat_head_video").addAll(chatHeadVideo(classes));
        var callButtonBuilders = callButtonBuilt(classes, stringTables);
        found.get("call_button_built").addAll(callButtonBuilders);
        found.get("hide_call_lists").addAll(callButtonLists(classes, callButtonBuilders));
        customFontHooks(classes).forEach((key, methods) -> found.get(key).addAll(methods));
        // Every viewer method with an entry point's name is checked, whatever its signature, and one that doesn't match
        // leaves the control unresolved, as findControls in ControlHooks.kt clears it then.
        boolean changedViewer = false;
        for (var cls : classes) for (var method : cls.getMethods()) {
            boolean candidate = (EPHEMERAL_VIEWER.equals(cls.getType()) && (EPHEMERAL_DIALOGS.contains(method.getName()) || "onResume".equals(method.getName()))) ||
                (QUICKSNAP_VIEWER.equals(cls.getType()) && "onCreateView".equals(method.getName()));
            if (!candidate) continue;
            if (screenshotViewerSites(method).isEmpty()) changedViewer = true;
            else found.get("screenshot_viewers").add(method);
        }
        if (changedViewer) found.get("screenshot_viewers").clear();
        var jewelCandidates = new ArrayList<Map.Entry<Method, Set<String>>>();

        // Collect people jewel key fields
        var peopleJewelKeys = new HashSet<String>();
        for (var cls : classes) {
            for (var m : cls.getMethods()) {
                if (!"<clinit>".equals(m.getName())) continue;
                var impl = m.getImplementation();
                if (impl == null) continue;
                var code = new ArrayList<Instruction>();
                for (var i : impl.getInstructions()) code.add(i);
                boolean hasKey = false;
                for (var i : code) {
                    if (i instanceof ReferenceInstruction ri && ri.getReference() instanceof StringReference sr) {
                        if (PEOPLE_JEWEL_KEY.equals(sr.getString())) { hasKey = true; break; }
                    }
                }
                if (!hasKey) continue;
                for (var i : code) {
                    if (i.getOpcode() == Opcode.SPUT_OBJECT && i instanceof ReferenceInstruction ri) {
                        peopleJewelKeys.add(ri.getReference().toString());
                    }
                }
            }
        }

        // The static field a class initializer stores the story card's last-shown date key in
        var storyCardKeys = new HashSet<String>();
        for (var cls : classes) {
            for (var m : cls.getMethods()) {
                if (!"<clinit>".equals(m.getName()) || m.getImplementation() == null) continue;
                boolean pending = false;
                for (var i : m.getImplementation().getInstructions()) {
                    if (i instanceof ReferenceInstruction ri && ri.getReference() instanceof StringReference sr &&
                        STORY_CARD_DATE_KEY.equals(sr.getString())) pending = true;
                    else if (pending && i.getOpcode() == Opcode.SPUT_OBJECT) {
                        storyCardKeys.add(((ReferenceInstruction) i).getReference().toString());
                        pending = false;
                    }
                }
            }
        }

        String msgTextGetterName = "", msgIdGetterName = "", msgIsUnsentGetterName = "", msgOtidGetterName = "", msgRowInterface = "";
        String msgTimestampGetterName = "", msgSenderGetterName = "", msgContentTypeGetterName = "", msgContentSubtypeGetterName = "";
        String rawText = "", rawId = "", rawUnsent = "", rawOtid = "", rawTimestamp = "", rawSender = "", rawContentType = "";
        String rawContentSubtype = "";
        outer:
        for (var cls : classes) {
            for (var m : cls.getMethods()) {
                var mImpl = m.getImplementation();
                if (mImpl == null) continue;
                var mCode = new ArrayList<Instruction>();
                for (var i : mImpl.getInstructions()) mCode.add(i);
                boolean hasText = false, hasMsgId = false, hasUnsent = false;
                for (var i : mCode) {
                    if (i instanceof ReferenceInstruction ri && ri.getReference() instanceof StringReference sr) {
                        if ("text=".equals(sr.getString())) hasText = true;
                        if ("message_id=".equals(sr.getString())) hasMsgId = true;
                        if ("is_unsent=".equals(sr.getString())) hasUnsent = true;
                    }
                }
                if (!hasText || !hasMsgId || !hasUnsent) continue;
                MethodReference lastRef = null;
                for (var i : mCode) {
                    if (!(i instanceof ReferenceInstruction ri)) continue;
                    var ref = ri.getReference();
                    if (i.getOpcode() == Opcode.INVOKE_INTERFACE && ref instanceof MethodReference mr) {
                        lastRef = mr;
                    } else if (ref instanceof StringReference sr && lastRef != null) {
                        switch (sr.getString()) {
                            case "text=" -> { if ("Ljava/lang/String;".equals(lastRef.getReturnType())) { rawText = lastRef.getName(); lastRef = null; } }
                            case "offline_threading_id=" -> { if ("Ljava/lang/String;".equals(lastRef.getReturnType())) { rawOtid = lastRef.getName(); lastRef = null; } }
                            case "message_id=" -> { if ("Ljava/lang/String;".equals(lastRef.getReturnType())) { rawId = lastRef.getName(); lastRef = null; } }
                            case "is_unsent=" -> { if ("Z".equals(lastRef.getReturnType())) { rawUnsent = lastRef.getName(); lastRef = null; } }
                            case "timestamp_ms=" -> { if ("J".equals(lastRef.getReturnType())) { rawTimestamp = lastRef.getName(); lastRef = null; } }
                            case "sender_id=" -> { if ("J".equals(lastRef.getReturnType())) { rawSender = lastRef.getName(); lastRef = null; } }
                            case "message_content_type=" -> { if ("I".equals(lastRef.getReturnType())) { rawContentType = lastRef.getName(); lastRef = null; } }
                            case "message_content_subtype=" -> { if ("I".equals(lastRef.getReturnType())) { rawContentSubtype = lastRef.getName(); lastRef = null; } }
                        }
                    }
                }
                break outer;
            }
        }

        if (!rawText.isEmpty()) {
            msgTextGetterName = rawText;
            msgIdGetterName = rawId;
            msgIsUnsentGetterName = rawUnsent;
            msgOtidGetterName = rawOtid;
            for (var wCls : classes) {
                if (!AccessFlags.ABSTRACT.isSet(wCls.getAccessFlags())) continue;
                if (wCls.getInterfaces().size() != 1) continue;
                long instFields = 0; String fieldType = null;
                for (var f : wCls.getFields()) {
                    if (!AccessFlags.STATIC.isSet(f.getAccessFlags())) { instFields++; fieldType = f.getType(); }
                }
                if (instFields != 1 || !"Ljava/util/List;".equals(fieldType)) continue;
                boolean hasGetCount = false;
                for (var wm : wCls.getMethods()) {
                    if ("getCount".equals(wm.getName()) && "I".equals(wm.getReturnType()) && wm.getParameterTypes().isEmpty()) {
                        hasGetCount = true; break;
                    }
                }
                if (!hasGetCount) continue;
                msgTextGetterName = resolveWrapper(wCls, rawText, "Ljava/lang/String;");
                msgIdGetterName = resolveWrapper(wCls, rawId, "Ljava/lang/String;");
                msgIsUnsentGetterName = resolveWrapper(wCls, rawUnsent, "Z");
                if (!rawOtid.isEmpty()) msgOtidGetterName = resolveWrapper(wCls, rawOtid, "Ljava/lang/String;");
                if (!rawTimestamp.isEmpty()) msgTimestampGetterName = resolveWrapper(wCls, rawTimestamp, "J");
                if (!rawSender.isEmpty()) msgSenderGetterName = resolveWrapper(wCls, rawSender, "J");
                if (!rawContentType.isEmpty()) msgContentTypeGetterName = resolveWrapper(wCls, rawContentType, "I");
                if (!rawContentSubtype.isEmpty()) msgContentSubtypeGetterName = resolveWrapper(wCls, rawContentSubtype, "I");
                msgRowInterface = wCls.getInterfaces().get(0);
                break;
            }
        }
        var cqlRowGetters = List.of(Map.entry(msgOtidGetterName, "Ljava/lang/String;"), Map.entry(msgTimestampGetterName, "J"),
            Map.entry(msgSenderGetterName, "J"), Map.entry(msgContentTypeGetterName, "I"), Map.entry(msgContentSubtypeGetterName, "I"));

        // The app icon manager maps "default" to the start screen and every other icon to a LauncherAlias.
        var appIconManagers = new HashSet<String>();
        for (var cls : classes) for (var m : cls.getMethods()) {
            if (!"<clinit>".equals(m.getName()) || m.getImplementation() == null) continue;
            var literals = new HashSet<String>();
            for (var i : m.getImplementation().getInstructions())
                if (i instanceof ReferenceInstruction ri && ri.getReference() instanceof StringReference sr) literals.add(sr.getString());
            if (literals.contains("com.facebook.orca.auth.StartScreenActivity") &&
                literals.stream().anyMatch(s -> s.startsWith("com.facebook.orca.LauncherAlias"))) appIconManagers.add(cls.getType());
        }

        for (var cls : classes) {
            String original = null;
            for (var f : cls.getFields()) {
                if ("__redex_internal_original_name".equals(f.getName())) {
                    var iv = f.getInitialValue();
                    if (iv instanceof StringEncodedValue sev) original = sev.getValue();
                }
            }
            for (var method : cls.getMethods()) {
                var impl = method.getImplementation();
                if (impl == null) continue;
                var instructions = new ArrayList<Instruction>();
                for (var i : impl.getInstructions()) instructions.add(i);
                var refs = new ArrayList<Object>();
                var strings = new HashSet<String>();
                for (var i : instructions) {
                    if (i instanceof ReferenceInstruction ri) {
                        refs.add(ri.getReference());
                        if (ri.getReference() instanceof StringReference sr) strings.add(sr.getString());
                    }
                }
                var paramTypes = method.getParameterTypes().stream()
                    .map(CharSequence::toString).toList();
                boolean gate = "Z".equals(method.getReturnType()) && paramTypes.isEmpty();
                boolean isStatic = AccessFlags.STATIC.isSet(method.getAccessFlags());

                // Plugin gates
                if ("Z".equals(method.getReturnType()) &&
                    (paramTypes.isEmpty() ||
                     (isStatic && paramTypes.equals(List.of(cls.getType()))))) {
                    var anchors = new HashSet<>(strings);
                    anchors.addAll(tableStrings(instructions, stringTables));
                    for (var entry : PLUGIN_GATE_ANCHORS.entrySet()) {
                        for (var s : anchors) {
                            if (entry.getValue().contains(s)) {
                                found.get(entry.getKey()).add(method);
                                break;
                            }
                        }
                    }
                }

                // stories
                if (gate && strings.contains("com.facebook.messaging.friendsinboxunit.plugins.inboxunit.FriendsInboxUnitKillSwitch")) {
                    found.get("stories").add(method);
                }

                // app_icons: the icon manager's subscription benefit checks, a static one on the session and, in 586,
                // an instance one that also reads a Context
                if (appIconManagers.contains(cls.getType()) && "Z".equals(method.getReturnType()) &&
                    paramTypes.equals(isStatic ? List.of(BUBBLE_SESSION) : List.of("Landroid/content/Context;", BUBBLE_SESSION)) &&
                    strings.contains("CUSTOM_APP_ICON")) {
                    found.get("app_icons").add(method);
                }

                // app_themes: the one static benefit check on the session for paid themes; the generic lookup takes a String
                if (isStatic && "Z".equals(method.getReturnType()) && paramTypes.equals(List.of(BUBBLE_SESSION)) &&
                    strings.contains("CUSTOM_APP_THEME")) {
                    found.get("app_themes").add(method);
                }

                // facebook, and facebook_profile for a gate that builds only the chat details Profile button
                if (gate) {
                    Set<String> shortcuts = new HashSet<>();
                    for (var i : instructions) {
                        if (i.getOpcode() == Opcode.NEW_INSTANCE && i instanceof ReferenceInstruction ri &&
                            ri.getReference() instanceof TypeReference tr && FACEBOOK_PLUGINS.contains(tr.getType())) {
                            shortcuts.add(tr.getType());
                        }
                    }
                    if (shortcuts.equals(Set.of(FACEBOOK_PROFILE_BUTTON))) found.get("facebook_profile").add(method);
                    else if (!shortcuts.isEmpty()) found.get("facebook").add(method);
                }

                // ai_menu
                if (gate && (strings.contains("com.facebook.messaging.navigation.plugins.aicreationfolder.folderitem.AiCreationFolderItem") ||
                             strings.contains("com.facebook.messaging.navigation.plugins.aihomefolder.folderitem.AiHomeFolderItem"))) {
                    found.get("ai_menu").add(method);
                }

                // ai_fab
                if (strings.contains("AiFabComponent")) {
                    boolean hasReturnObject = false;
                    for (var i : instructions) {
                        if (i.getOpcode() == Opcode.RETURN_OBJECT) { hasReturnObject = true; break; }
                    }
                    if (hasReturnObject) found.get("ai_fab").add(method);
                }

                // redex-named run()V methods
                if ("run".equals(method.getName()) && "V".equals(method.getReturnType()) &&
                    paramTypes.isEmpty() && original != null) {
                    switch (original) {
                        case "InboxSubtabsItemSupplierImplementation$onSubscribe$1" -> found.get("subtabs").add(method);
                        case "ConversationTypingContext$sendActiveStateRunnable$1" -> found.get("typing").add(method);
                        case "SecureWindowUtils$1" -> found.get("allow_screenshot").add(method);
                    }
                }

                // bubbles
                if (gate) {
                    boolean hasSdkInt = false, hasLowRam = false;
                    for (var r : refs) {
                        String rs = r.toString();
                        if ("Landroid/os/Build$VERSION;->SDK_INT:I".equals(rs)) hasSdkInt = true;
                        if ("Landroid/app/ActivityManager;->isLowRamDevice()Z".equals(rs)) hasLowRam = true;
                    }
                    if (hasSdkInt && hasLowRam) found.get("bubbles").add(method);
                }
                if (!isStatic && "Z".equals(method.getReturnType()) &&
                    paramTypes.equals(List.of(BUBBLE_SESSION)) && instructions.stream().anyMatch(i ->
                        i.getOpcode() == Opcode.CONST_WIDE && i instanceof WideLiteralInstruction flag &&
                        flag.getWideLiteral() == BUBBLE_ROLLOUT)) found.get("bubble_mode").add(method);

                // browser: the launcher's own (Uri, session) instance check, which logs no skip reason
                if ("Z".equals(method.getReturnType()) && MESSENGER_BROWSER_LAUNCHER.equals(cls.getType()) && !isStatic &&
                    paramTypes.equals(List.of("Landroid/net/Uri;", BUBBLE_SESSION))) {
                    found.get("browser").add(method);
                }

                // people_jewel, kept once discovery knows the preference getter. It takes the suggestions logger, then its owner.
                if ("Z".equals(method.getReturnType()) && isStatic && paramTypes.size() == 2 && paramTypes.get(1).equals(cls.getType())) {
                    var refIds = refs.stream().map(Object::toString).collect(Collectors.toSet());
                    if (!Collections.disjoint(refIds, peopleJewelKeys)) jewelCandidates.add(Map.entry(method, refIds));
                }

                // ScreenshotContentObserver.onChange
                if ("Lcom/facebook/screenshot/ScreenshotContentObserver;".equals(cls.getType()) &&
                    "onChange".equals(method.getName()) && "V".equals(method.getReturnType())) {
                    found.get("allow_screenshot").add(method);
                }

                // Android 14+ screenshot callback (in-chat notice)
                if ("onScreenCaptured".equals(method.getName()) && "V".equals(method.getReturnType()) &&
                    paramTypes.isEmpty() && cls.getInterfaces().contains("Landroid/app/Activity$ScreenCaptureCallback;")) {
                    found.get("allow_screenshot").add(method);
                }

                // Media viewers' window lock: FLAG_SECURE through Window.addFlags
                if ("V".equals(method.getReturnType()) && !isStatic &&
                    paramTypes.equals(List.of("Landroid/view/Window;"))) {
                    boolean secureFlag = false, addFlags = false;
                    for (var i : instructions) {
                        if (i instanceof NarrowLiteralInstruction lit && lit.getNarrowLiteral() == 0x2000) secureFlag = true;
                    }
                    for (var r : refs) if ("Landroid/view/Window;->addFlags(I)V".equals(r.toString())) addFlags = true;
                    if (secureFlag && addFlags) found.get("allow_screenshot").add(method);
                }

                // keep_unsent: the instance (Intent, session, String, Map) revoke handler
                if ("V".equals(method.getReturnType()) && !isStatic && paramTypes.equals(REVOKE_HANDLER) &&
                    strings.stream().anyMatch(s -> s.contains("ACTION_REVOKE_MESSAGE"))) {
                    found.get("keep_unsent").add(method);
                }

                // unsent_indicator
                if (!msgTextGetterName.isEmpty() &&
                    method.getName().equals(msgTextGetterName) &&
                    "Ljava/lang/String;".equals(method.getReturnType()) &&
                    paramTypes.equals(List.of("I")) &&
                    AccessFlags.ABSTRACT.isSet(cls.getAccessFlags()) &&
                    cls.getInterfaces().size() == 1) {
                    long instanceFieldCount = 0;
                    boolean hasListField = false;
                    for (var f : cls.getFields()) {
                        if (!AccessFlags.STATIC.isSet(f.getAccessFlags())) {
                            instanceFieldCount++;
                            if ("Ljava/util/List;".equals(f.getType())) hasListField = true;
                        }
                    }
                    boolean hasGetCount = false;
                    for (var m : cls.getMethods()) {
                        if ("getCount".equals(m.getName()) && "I".equals(m.getReturnType()) &&
                            m.getParameterTypes().isEmpty()) { hasGetCount = true; break; }
                    }
                    if (instanceFieldCount == 1 && hasListField && hasGetCount) {
                        found.get("unsent_indicator").add(method);
                    }
                }

                // delta_unsent
                if (!msgIsUnsentGetterName.isEmpty() &&
                    method.getName().equals(msgIsUnsentGetterName) &&
                    "Z".equals(method.getReturnType()) &&
                    paramTypes.equals(List.of("I")) &&
                    AccessFlags.ABSTRACT.isSet(cls.getAccessFlags()) &&
                    cls.getInterfaces().size() == 1) {
                    long instanceFieldCount2 = 0;
                    boolean hasListField2 = false;
                    for (var f : cls.getFields()) {
                        if (!AccessFlags.STATIC.isSet(f.getAccessFlags())) {
                            instanceFieldCount2++;
                            if ("Ljava/util/List;".equals(f.getType())) hasListField2 = true;
                        }
                    }
                    boolean hasGetCount2 = false;
                    for (var m : cls.getMethods()) {
                        if ("getCount".equals(m.getName()) && "I".equals(m.getReturnType()) &&
                            m.getParameterTypes().isEmpty()) { hasGetCount2 = true; break; }
                    }
                    if (instanceFieldCount2 == 1 && hasListField2 && hasGetCount2) {
                        found.get("delta_unsent").add(method);
                    }
                }

                // Encrypted chats' rows come straight from a CQL result set and take both unsent hooks too.
                if (paramTypes.equals(List.of("I")) && isCqlRow(cls, msgRowInterface, cqlRowGetters)) {
                    if (!msgTextGetterName.isEmpty() && method.getName().equals(msgTextGetterName) &&
                        "Ljava/lang/String;".equals(method.getReturnType())) found.get("unsent_indicator").add(method);
                    if (!msgIsUnsentGetterName.isEmpty() && method.getName().equals(msgIsUnsentGetterName) &&
                        "Z".equals(method.getReturnType())) found.get("delta_unsent").add(method);
                }

                // ai_search
                if ("Z".equals(method.getReturnType()) && !isStatic && paramTypes.isEmpty() &&
                    strings.stream().anyMatch(s -> s.contains("SearchAiagentImplementationsKillSwitch"))) {
                    found.get("ai_search").add(method);
                }

                // original_photo: the encrypted-chat photo transcoder's entry points, its config and its Java decode, named the same in every build
                if ("Lcom/facebook/msys/mci/transcoder/DefaultMediaTranscoder;".equals(cls.getType()) &&
                    !isStatic && ORIGINAL_PHOTO_HOOKS.contains(hookId(method))) {
                    found.get("original_photo").add(method);
                }

                // original_video: the video transcoder's private worker, which holds the passthrough size check
                if ("Lcom/facebook/msys/mci/transcoder/DefaultMediaTranscoder;".equals(cls.getType()) && !isStatic &&
                    ORIGINAL_VIDEO_HOOK.equals(hookId(method)) && strings.contains("mci_video_passthrough") && videoPassthroughSite(method)) {
                    found.get("original_video").add(method);
                }

                // xhe_transcode: the same worker, counted only when its first String still reaches Messenger's source Uri parse
                if ("Lcom/facebook/msys/mci/transcoder/DefaultMediaTranscoder;".equals(cls.getType()) && !isStatic &&
                    ORIGINAL_VIDEO_HOOK.equals(hookId(method)) && strings.contains("mci_video_passthrough") && transcodeSourceParsed(method)) {
                    found.get("xhe_transcode").add(method);
                }

                // emoji_typeface: Messenger's emoji getter, counted only when its downloaded font holder proves out (#34)
                if ("Landroid/graphics/Typeface;".equals(method.getReturnType()) &&
                    paramTypes.isEmpty() && !isStatic &&
                    strings.contains("FacebookEmojiTypefaceProviderImpl") && emojiFontHolder(inboxTypes, method) != null) {
                    found.get("emoji_typeface").add(method);
                }

                // typing_mailbox: the msys call that sends typing in encrypted chats
                if (paramTypes.equals(List.of("Ljava/lang/String;", "Z")) &&
                    strings.contains("setTypingIndicatorForThreadWithThreadIdentifier")) {
                    found.get("typing_mailbox").add(method);
                }

                // anonymous_stories: the story mark-read handler that reports a viewed card
                if ("V".equals(method.getReturnType()) && paramTypes.equals(List.of(MONTAGE_CARD, "Z")) &&
                    !isStatic && strings.contains("MontageMsysMarkReadHandler")) {
                    found.get("anonymous_stories").add(method);
                }

                // anonymous_stories: the story preview's constructor, where a card opened anonymously loses its new-story ring (#35)
                if (MONTAGE_BUCKET_PREVIEW.equals(cls.getType()) && "<init>".equals(method.getName()) && paramTypes.contains(MONTAGE_CARD)) {
                    found.get("anonymous_stories").add(method);
                }

                // save_stories: the story viewer's More options menu, which adds Save to your own story's menu
                if ("onClick".equals(method.getName()) && "V".equals(method.getReturnType()) &&
                    paramTypes.equals(List.of("Landroid/view/View;")) && strings.contains("toolbar_click_menu_button")) {
                    found.get("save_stories").add(method);
                }

                // chat_animation: androidx's answer of no animation, which every fragment is asked for first
                if (FRAGMENT_ANIMATION.equals(hookId(method))) found.get("chat_animation").add(method);

                // chat_fragment and chat_inbox: the chat and the inbox under it, named by the constructor androidx needs
                if ("<init>".equals(method.getName()) && paramTypes.isEmpty()) {
                    if ("MsysThreadViewFragment".equals(original)) found.get("chat_fragment").add(method);
                    if ("M4TabNavigationFragment".equals(original)) found.get("chat_inbox").add(method);
                }

                // chat_jump: the chat fragment's own onViewCreated, where the chat first has a view. Mirrors ChatJump.kt.
                if ("MsysThreadViewFragment".equals(original) && !isStatic && "onViewCreated".equals(method.getName()) &&
                    "V".equals(method.getReturnType()) && paramTypes.equals(List.of("Landroid/view/View;", "Landroid/os/Bundle;")) &&
                    method.getImplementation() != null) {
                    found.get("chat_jump").add(method);
                }

                // chat_legacy: the chat fragment on Messenger's older route, which loads its own animation
                if ("ThreadViewFragment".equals(original) &&
                    (cls.getType() + "->onCreateAnimation(IZI)" + ANIMATION).equals(hookId(method))) {
                    found.get("chat_legacy").add(method);
                }

                // growth_notes: the launcher every notes tip sheet (Make my notes public, Add lyrics) goes through
                if (!isStatic && "Ljava/lang/Object;".equals(method.getReturnType()) &&
                    strings.contains("NotesMigNuxBottomSheet") && strings.contains("arg_nux_type")) {
                    found.get("growth_notes").add(method);
                }

                // growth_story_card: the daily cap check the story viewer's Share your own story card waits on
                if (isStatic && "Z".equals(method.getReturnType()) && paramTypes.equals(List.of(cls.getType())) &&
                    refs.stream().anyMatch(r -> storyCardKeys.contains(r.toString()))) {
                    found.get("growth_story_card").add(method);
                }

                // people_tab: the People tab suggestion handler handing its list and filter map to the tab
                if ("V".equals(method.getReturnType()) && isStatic && paramTypes.equals(List.of(cls.getType())) &&
                    refs.stream().anyMatch(r -> r instanceof MethodReference mr && "V".equals(mr.getReturnType()) &&
                        mr.getParameterTypes().stream().map(CharSequence::toString).toList().equals(List.of(IMMUTABLE_LIST, "Ljava/util/Map;"))) &&
                    classReferencesType(cls, PEOPLE_TAB_FETCH)) {
                    found.get("people_tab").add(method);
                }

                // people_search: the search screen's empty-state suggestions source
                if (!isStatic && strings.contains("PeopleYouMayKnowSectionDataSource") &&
                    strings.contains("Failed to load people you may know")) {
                    found.get("people_search").add(method);
                }

                // people_story: the story viewer's once-per-viewer request for a page of suggested people
                if ("V".equals(method.getReturnType()) && isStatic && paramTypes.equals(List.of(cls.getType())) &&
                    (strings.contains("MsgrPeopleYouMayKnowQuery") ||
                        tableStrings(instructions, stringTables).contains("MsgrPeopleYouMayKnowQuery"))) {
                    found.get("people_story").add(method);
                }

                // people_inbox_refresh: the chat list supplier's items read, counted only when the whole refresh route proves out
                if (INBOX_SUPPLIER.equals(cls.getType()) && !isStatic && IMMUTABLE_LIST.equals(method.getReturnType()) &&
                    paramTypes.isEmpty() && strings.contains(INBOX_ITEMS_TRACE) && inboxRefreshRoute(inboxTypes, method) != null) {
                    found.get("people_inbox_refresh").add(method);
                    if (pinListSite(method)) found.get("pin_list").add(method);
                    if (hiddenListSite(method) && hiddenChatNames(inboxTypes)) found.get("hidden_chat_list").add(method);
                }

                // avatar_tabs: the sticker keyboard's tab list, filled inline in a composer factory method that
                // copies it into a builder once and returns the built list.
                if (IMMUTABLE_LIST.equals(method.getReturnType()) && keyboardTabCopy(method) &&
                    "Lcom/facebook/messaging/msys/thread/composer/configuration/xapp/BaseXappComposerConfigurationFactory;".equals(cls.getType()) &&
                    refs.stream().anyMatch(r -> r.toString().startsWith(
                        "Lcom/facebook/xapp/messaging/composer/avatar/composertab/event/ActivateAvatarSticker;->")) &&
                    refs.stream().anyMatch(r -> r.toString().startsWith(IMMUTABLE_LIST + "->builder()"))) {
                    found.get("avatar_tabs").add(method);
                }

                // menu_settings: Settings folder builder, grid binder, folder click and legacy section refresh.
                if ("Ljava/util/ArrayList;".equals(method.getReturnType()) && paramTypes.size() == 1 && !isStatic &&
                    strings.stream().anyMatch(s -> s.contains("settingsfolder.folderitem.SettingsFolderItem"))) {
                    found.get("menu_settings").add(method);
                }
                if ("V".equals(method.getReturnType()) && paramTypes.size() == 2 && "I".equals(paramTypes.get(1)) &&
                    !isStatic && strings.contains("Unknown ViewHolder")) {
                    found.get("menu_settings").add(method);
                }
                if ("onClick".equals(method.getName()) && "V".equals(method.getReturnType()) &&
                    paramTypes.equals(List.of("Landroid/view/View;")) &&
                    strings.contains("HomeDrawerFragmentBase.handleOnFolderSelected")) {
                    found.get("menu_settings").add(method);
                }
                if ("V".equals(method.getReturnType()) && paramTypes.isEmpty() && !isStatic &&
                    strings.contains("HomeDrawerFragmentBase.refreshDrawerItems")) {
                    found.get("menu_settings").add(method);
                }
            }
        }
        // ai_search_chip: the first component with a render method that the search field creates.
        Method searchField = null;
        for (var cls : classes) {
            for (var m : cls.getMethods()) {
                if (!"render".equals(m.getName()) || m.getImplementation() == null) continue;
                for (var i : m.getImplementation().getInstructions()) {
                    if (i instanceof ReferenceInstruction ri && ri.getReference() instanceof StringReference sr &&
                        "messenger_search_clear_button_tag".equals(sr.getString())) searchField = m;
                }
            }
        }
        if (searchField != null) {
            var byType = new HashMap<String, ClassDef>();
            for (var cls : classes) byType.put(cls.getType(), cls);
            chip:
            for (var i : searchField.getImplementation().getInstructions()) {
                if (i.getOpcode() != Opcode.NEW_INSTANCE || !(i instanceof ReferenceInstruction ri) ||
                    !(ri.getReference() instanceof TypeReference tr)) continue;
                var cls = byType.get(tr.getType());
                if (cls == null) continue;
                boolean renders = false;
                for (var m : cls.getMethods()) if ("render".equals(m.getName())) renders = true;
                if (!renders) continue;
                for (var m : cls.getMethods()) {
                    if ("render".equals(m.getName()) && m.getReturnType().equals(searchField.getReturnType())) {
                        found.get("ai_search_chip").add(m);
                    }
                }
                break chip;
            }
        }
        // menu_settings: the plain-list drawer items setter lives in the class that creates the grid binder.
        String gridBinderType = null;
        for (var m : found.get("menu_settings")) {
            if ("V".equals(m.getReturnType()) && m.getParameterTypes().size() == 2 &&
                "I".equals(m.getParameterTypes().get(1).toString())) {
                gridBinderType = m.getDefiningClass();
                break;
            }
        }
        if (gridBinderType != null) {
            outer:
            for (var cls : classes) {
                for (var m : cls.getMethods()) {
                    var impl = m.getImplementation();
                    if (impl == null) continue;
                    for (var i : impl.getInstructions()) {
                        if (i.getOpcode() != Opcode.NEW_INSTANCE || !(i instanceof ReferenceInstruction ri) ||
                            !(ri.getReference() instanceof TypeReference tr) || !gridBinderType.equals(tr.getType())) continue;
                        Method setter = null;
                        int setters = 0;
                        for (var candidate : cls.getMethods()) {
                            if ("V".equals(candidate.getReturnType()) && !AccessFlags.STATIC.isSet(candidate.getAccessFlags()) &&
                                candidate.getParameterTypes().size() == 1 &&
                                "Ljava/util/List;".equals(candidate.getParameterTypes().get(0).toString())) {
                                setter = candidate;
                                setters++;
                            }
                        }
                        if (setters == 1) found.get("menu_settings").add(setter);
                        break outer;
                    }
                }
            }
        }
        // The Notifications tab reads its preference through the getter the external-browser check uses.
        var read = browserPreferenceRead(found.get("browser"));
        for (var candidate : jewelCandidates) {
            if (read != null && candidate.getValue().contains(read.getter())) found.get("people_jewel").add(candidate.getKey());
        }
        // The patches refuse these hooks without a free local register, mostly for the scratch v0 their edits write.
        for (var key : NEEDS_A_LOCAL) {
            var methods = found.get(key);
            // ad_events' visibility callback reuses its event register, so only the static entry event needs a local.
            if (methods != null && methods.stream().anyMatch(m -> !hasLocal(m) &&
                (!"ad_events".equals(key) || AccessFlags.STATIC.isSet(m.getAccessFlags())))) methods.clear();
        }
        return found;
    }
}
