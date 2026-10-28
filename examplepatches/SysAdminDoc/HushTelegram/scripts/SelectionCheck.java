import com.android.tools.smali.dexlib2.AccessFlags;
import com.android.tools.smali.dexlib2.DexFileFactory;
import com.android.tools.smali.dexlib2.Opcode;
import com.android.tools.smali.dexlib2.Opcodes;
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation;
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction22b;
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction21t;
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction22s;
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction23x;
import com.android.tools.smali.dexlib2.iface.ClassDef;
import com.android.tools.smali.dexlib2.iface.DexFile;
import com.android.tools.smali.dexlib2.iface.Field;
import com.android.tools.smali.dexlib2.iface.Method;
import com.android.tools.smali.dexlib2.iface.MethodImplementation;
import com.android.tools.smali.dexlib2.iface.MultiDexContainer;
import com.android.tools.smali.dexlib2.iface.instruction.Instruction;
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction;
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction;
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction;
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction;
import com.android.tools.smali.dexlib2.iface.reference.FieldReference;
import com.android.tools.smali.dexlib2.iface.reference.MethodReference;
import com.android.tools.smali.dexlib2.iface.reference.StringReference;
import com.android.tools.smali.dexlib2.iface.value.EncodedValue;
import com.android.tools.smali.dexlib2.util.EncodedValueUtils;
import com.reandroid.arsc.chunk.PackageBlock;
import com.reandroid.arsc.chunk.TableBlock;
import com.reandroid.arsc.chunk.xml.AndroidManifestBlock;
import com.reandroid.arsc.container.SpecTypePair;
import com.reandroid.arsc.model.ResourceEntry;
import com.reandroid.arsc.chunk.xml.ResXmlAttribute;
import com.reandroid.arsc.chunk.xml.ResXmlElement;
import com.reandroid.json.JSONArray;
import com.reandroid.json.JSONObject;

import java.io.File;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;
import java.util.TreeSet;
import java.util.zip.ZipFile;

/** Compiled evidence for selections whose valid output need not contain runtime hooks. */
public final class SelectionCheck {
    private static final String OWN = "Lapp/hushtelegram/extension/";
    private static final String STATUS = OWN + "telegram/settings/SettingsStatus;";
    private static final String API = "Lorg/telegram/messenger/BuildVars;-><clinit>()V";
    private static final String CONNECTIONS = "Lorg/telegram/tgnet/ConnectionsManager;";
    private static final String ANDROID = "{http://schemas.android.com/apk/res/android}";
    private static final String ALIAS = "app.hushtelegram.extension.telegram.settings.OpenSettings";
    private static final String PUSH_RECEIVER = "app.hushtelegram.extension.telegram.misc.UnifiedPushReceiver";
    private static final String PUSH_RAISE = "app.hushtelegram.extension.telegram.misc.UnifiedPushRaise";
    private static final String PUSH_SIGN_UP = "Lorg/telegram/messenger/PushListenerController;->sendRegistrationToServer(ILjava/lang/String;)V";
    private static final String ATTACH_NAME = "Lorg/telegram/messenger/FileLoader;->getAttachFileName(Lorg/telegram/tgnet/TLObject;)Ljava/lang/String;";
    private static final String REMOVE_FILTER = "Lorg/telegram/messenger/MessagesController;->removeFilter(Lorg/telegram/messenger/MessagesController$DialogFilter;)V";

    static final class Expected {
        boolean settings, links, api, maps, icon, push;
        int apiId;
        String apiHash, mapsKey;
        Map<String, Boolean> flags;

        Expected(JSONObject input) {
            settings = input.getBoolean("settings");
            links = input.getBoolean("links");
            api = input.getBoolean("api");
            maps = input.getBoolean("maps");
            icon = input.optBoolean("icon", false);
            push = input.optBoolean("push", false);
            apiId = input.optInt("apiId");
            apiHash = input.optString("apiHash");
            mapsKey = input.optString("mapsKey");
            flags = new TreeMap<>();
            JSONObject values = input.getJSONObject("flags");
            for (String key : values.keySet()) flags.put(key, values.getBoolean(key));
        }
    }

    static final class Evidence {
        boolean passed = true;
        int changedMethods, addedMethods, structuralFindings, apiLiteralChanges, nativeVersionChanges, mapsValueChanges;
        boolean settings;
        Map<String, Boolean> flags = new TreeMap<>();

        JSONObject json() {
            return new JSONObject().put("passed", passed).put("settings", settings)
                    .put("changedMethods", changedMethods).put("addedMethods", addedMethods)
                    .put("structuralFindings", structuralFindings).put("apiLiteralChanges", apiLiteralChanges)
                    .put("nativeVersionChanges", nativeVersionChanges)
                    .put("mapsValueChanges", mapsValueChanges).put("flags", new JSONObject(flags));
        }
    }

    private static void require(boolean condition) {
        if (!condition) throw new IllegalStateException("SELECTION_CHECK_FAILED");
    }

    private static String signature(Method method) {
        return method.getDefiningClass() + "->" + method.getName() + "("
                + String.join("", method.getParameterTypes()) + ")" + method.getReturnType();
    }

    /** One APK decoded once: its dex entry names, method prints and classes. */
    static final class Side {
        static int decodes;
        final File apk;
        final TreeSet<String> dexEntries;
        final Map<String, String> bodies;
        final Map<String, ClassDef> classes;

        Side(File apk) throws Exception {
            this.apk = apk;
            dexEntries = dexEntries(apk);
            var dex = DexFileFactory.loadDexContainer(apk, Opcodes.getDefault());
            bodies = DexDiff.fingerprintAll(dex);
            classes = classes(dex);
            decodes++;
        }
    }

    static Map<String, ClassDef> classes(MultiDexContainer<? extends DexFile> dex) throws Exception {
        Map<String, ClassDef> result = new HashMap<>();
        for (String entry : dex.getDexEntryNames()) {
            for (ClassDef type : dex.getEntry(entry).getDexFile().getClasses()) {
                require(result.put(type.getType(), type) == null);
            }
        }
        return result;
    }

    /**
     * A field's initial value, with an explicit default (0, false, null) read as none. The DEX
     * writer drops trailing defaults when a patch rewrites the class, and the field starts at its
     * type's default either way.
     */
    static EncodedValue initialValue(Field field) {
        EncodedValue value = field.getInitialValue();
        return value == null || EncodedValueUtils.isDefaultValue(value) ? null : value;
    }

    static void declarations(ClassDef original, ClassDef replacement, boolean allowAddedMethods) {
        require(original.getAccessFlags() == replacement.getAccessFlags()
                && java.util.Objects.equals(original.getSuperclass(), replacement.getSuperclass())
                && original.getInterfaces().equals(replacement.getInterfaces())
                && original.getAnnotations().equals(replacement.getAnnotations()));
        Map<String, Field> fields = new HashMap<>();
        for (Field field : replacement.getFields()) {
            require(fields.put(field.getName() + ":" + field.getType(), field) == null);
        }
        for (Field field : original.getFields()) {
            Field next = fields.remove(field.getName() + ":" + field.getType());
            require(next != null && field.getAccessFlags() == next.getAccessFlags()
                    && java.util.Objects.equals(initialValue(field), initialValue(next))
                    && field.getAnnotations().equals(next.getAnnotations())
                    && field.getHiddenApiRestrictions().equals(next.getHiddenApiRestrictions()));
        }
        require(fields.isEmpty());
        Map<String, Method> methods = new HashMap<>();
        for (Method method : replacement.getMethods()) {
            require(methods.put(signature(method), method) == null);
        }
        for (Method method : original.getMethods()) {
            Method next = methods.remove(signature(method));
            require(next != null && method.getAccessFlags() == next.getAccessFlags()
                    && method.getAnnotations().equals(next.getAnnotations())
                    && method.getHiddenApiRestrictions().equals(next.getHiddenApiRestrictions()));
            for (int i = 0; i < method.getParameters().size(); i++) {
                require(method.getParameters().get(i).getAnnotations().equals(next.getParameters().get(i).getAnnotations()));
            }
        }
        require(allowAddedMethods || methods.isEmpty());
    }

    private static Method method(Map<String, ClassDef> types, String wanted) {
        Method result = null;
        for (var type : types.values()) {
            for (Method candidate : type.getMethods()) {
                if (!signature(candidate).equals(wanted)) continue;
                require(result == null);
                result = candidate;
            }
        }
        require(result != null && result.getImplementation() != null);
        return result;
    }

    private static List<Instruction> instructions(Method method) {
        List<Instruction> result = new ArrayList<>();
        method.getImplementation().getInstructions().forEach(result::add);
        return result;
    }

    private static List<String> tryRanges(MethodImplementation implementation) {
        List<String> ranges = new ArrayList<>();
        for (var block : implementation.getTryBlocks()) {
            List<String> handlers = new ArrayList<>();
            for (var handler : block.getExceptionHandlers()) handlers.add(handler.getExceptionType() + ":" + handler.getHandlerCodeAddress());
            ranges.add(block.getStartCodeAddress() + ":" + block.getCodeUnitCount() + ":" + handlers);
        }
        return ranges;
    }

    private static boolean flag(Method method) {
        require(AccessFlags.PUBLIC.isSet(method.getAccessFlags())
                && AccessFlags.STATIC.isSet(method.getAccessFlags())
                && method.getParameterTypes().isEmpty() && method.getReturnType().equals("Z"));
        List<Instruction> code = instructions(method);
        require(code.size() >= 2 && code.get(0).getOpcode() == Opcode.CONST_4
                && code.get(1).getOpcode() == Opcode.RETURN
                && ((OneRegisterInstruction) code.get(0)).getRegisterA()
                == ((OneRegisterInstruction) code.get(1)).getRegisterA());
        int value = ((NarrowLiteralInstruction) code.get(0)).getNarrowLiteral();
        require(value == 0 || value == 1);
        return value == 1;
    }

    private static void hook(Map<String, Integer> calls, Map<String, Boolean> flags,
                             String status, String owner, String... methods) {
        boolean installed = Boolean.TRUE.equals(flags.get(status));
        for (String method : methods) {
            int count = calls.getOrDefault(OWN + "telegram/" + owner + ";->" + method, 0);
            require(installed ? count > 0 : count == 0);
        }
    }

    private static void compiledHooks(Map<String, ClassDef> types, Map<String, Boolean> flags) {
        Map<String, Integer> calls = new HashMap<>();
        for (ClassDef type : types.values()) {
            if (type.getType().startsWith(OWN)) continue;
            for (Method method : type.getMethods()) {
                if (method.getImplementation() == null) continue;
                for (Instruction instruction : method.getImplementation().getInstructions()) {
                    if (instruction instanceof ReferenceInstruction reference
                            && reference.getReference() instanceof MethodReference target
                            && target.getDefiningClass().startsWith(OWN)) {
                        calls.merge(target.getDefiningClass() + "->" + target.getName(), 1, Integer::sum);
                    }
                }
            }
        }
        for (String entry : List.of("onApplicationCreate", "onActivityCreate", "onNewIntent")) {
            require(calls.getOrDefault(OWN + "telegram/settings/SettingsEntry;->" + entry, 0) > 0);
        }
        hook(calls, flags, "channelAds", "ads/Ads", "skipSponsoredMessages");
        hook(calls, flags, "videoAds", "ads/Ads", "skipVideoAds");
        hook(calls, flags, "searchAds", "ads/Ads", "skipSearchAds");
        hook(calls, flags, "storyRequests", "misc/Stories", "skipStoryRequests");
        hook(calls, flags, "storyBar", "misc/Stories", "hideStoryBar");
        hook(calls, flags, "storyCamera", "misc/Stories", "showStoryCamera");
        hook(calls, flags, "storyAvatars", "misc/Stories", "hideAvatarStories");
        hook(calls, flags, "storyTouches", "misc/Stories", "hideAvatarStoryTouches");
        hook(calls, flags, "channelRecommendations", "misc/Recommendations", "skipRecommendations");
        hook(calls, flags, "cachedRecommendations", "misc/Recommendations", "skipCachedRecommendations");
        hook(calls, flags, "readMetrics", "misc/Analytics", "skipReadMetrics");
        int promo = calls.getOrDefault(OWN + "telegram/misc/Analytics;->skipPremiumAppLog", 0);
        int promoFlags = 0;
        for (String status : List.of("premiumPromoShow", "premiumPromoTap", "premiumPromoAccept", "premiumPromoFail")) {
            if (Boolean.TRUE.equals(flags.get(status))) promoFlags++;
        }
        require(promo == promoFlags);
        hook(calls, flags, "dualCameraReport", "misc/Analytics", "skipDeviceAppLog");
        hook(calls, flags, "callDebugUpload", "misc/CallDebug", "skipCallDebugUpload");
        hook(calls, flags, "callLogFileUpload", "misc/CallDebug", "skipCallLogFileUpload");
        hook(calls, flags, "callLogUpload", "misc/CallDebug", "skipCallLogUpload");
        hook(calls, flags, "chatDraftPreviews", "misc/DraftPreviews", "skipChatPreview");
        hook(calls, flags, "shareDraftPreviews", "misc/DraftPreviews", "skipSharePreview");
        hook(calls, flags, "pollLinkPreviews", "misc/DraftPreviews", "skipPollPreview");
        hook(calls, flags, "storyLinkPreviews", "misc/DraftPreviews", "skipStoryLinkPreview");
        hook(calls, flags, "botSharePreviews", "misc/DraftPreviews", "skipBotSharePreview");
        hook(calls, flags, "localDrafts", "misc/LocalDrafts", "keepOnPhone");
        hook(calls, flags, "localSearch", "misc/LocalSearch", "keep", "sent", "emptyText", "phones");
        hook(calls, flags, "skipAutologin", "misc/LinkRouting", "addAutologinToken");
        hook(calls, flags, "commerceSettingsRows", "misc/Commerce", "addSettingsRow", "showWalletRow");
        hook(calls, flags, "commerceProfileGifts", "misc/Commerce", "addProfileTab", "showGiftsTab");
        hook(calls, flags, "commerceChannelGift", "misc/Commerce", "showChannelGiftButton");
        hook(calls, flags, "commerceAttachWallet", "misc/Commerce", "showAttachWallet");
        hook(calls, flags, "commerceMenuWallet", "misc/Commerce", "showMenuWallet");
        hook(calls, flags, "commerceProfileSendGram", "misc/Commerce", "showProfileSendGram");
        hook(calls, flags, "commerceAddressSendGram", "misc/Commerce", "showAddressSendGram");
        hook(calls, flags, "commerceTransferSendGram", "misc/Commerce", "showTransferSendGram");
        hook(calls, flags, "commercePremiumEffects", "misc/Commerce", "skipPremiumEffect");
        hook(calls, flags, "commercePremiumEmojiPacks", "misc/Commerce", "dropLockedEmojiPacks");
        // Both sticker targets ask premiumStickersBlocked: the two filters and the keyboard pass,
        // and the effect player's tooltip.
        int blocked = (Boolean.TRUE.equals(flags.get("commercePremiumStickers")) ? 3 : 0)
                + (Boolean.TRUE.equals(flags.get("commercePremiumEffects")) ? 1 : 0);
        require(calls.getOrDefault(OWN + "telegram/misc/Commerce;->premiumStickersBlocked", 0) == blocked);
        hook(calls, flags, "promotionalSuggestions", "misc/Suggestions", "filterChatList");
        hook(calls, flags, "birthdayGiftBanner", "misc/Suggestions", "birthdayGiftBannerDismissed");
        hook(calls, flags, "cachedProxyDialog", "ads/ProxyPromotions", "hideCachedProxyDialog");
        hook(calls, flags, "cachedProxyFilters", "ads/ProxyPromotions", "showSelectedDialog");
        hook(calls, flags, "externalBrowserRouting", "misc/LinkRouting", "tryOpenExternal");
        hook(calls, flags, "miniAppLocation", "misc/MiniAppLocation", "refuse", "location", "refusePrompt", "answer");
        hook(calls, flags, "openedLinkTracking", "misc/LinkRouting", "cleanOpenedUri");
        hook(calls, flags, "sharedLinkTracking", "misc/LinkRouting", "cleanShareIntent");
        hook(calls, flags, "firebaseCertificateHeader", "misc/FirebasePush", "certificateHeader");
        hook(calls, flags, "repairFirebasePush", "misc/FirebasePush", "registerDeviceAnswer");
        hook(calls, flags, "hidePopularApps", "misc/PopularApps", "skipLoad", "hideSection");
        hook(calls, flags, "myChatsSearch", "misc/MyChatsSearch", "keep", "sent", "phones", "dropPublicTabs", "downloadsAt",
                "keepHashtag", "endPublicPosts", "dropPublicResults");
        hook(calls, flags, "nameFold", "misc/NameFold", "fold");
        hook(calls, flags, "hideContactsBlock", "misc/ContactsBlock", "rows", "placeholder");
        hook(calls, flags, "hideGreetingStickers", "misc/GreetingStickers", "measure");
        hook(calls, flags, "disableChatSwipe", "misc/ChatSwipe", "keepRowStill");
        hook(calls, flags, "disableChannelPull", "misc/ChannelPull", "stopBottomPull", "keepChannelStill");
        hook(calls, flags, "disableChannelPull", "misc/ForumTopicPull", "stopTopicPull", "keepTopicStill");
        hook(calls, flags, "quietContactsNag", "misc/ContactsNag", "skipAsk", "hideBadge");
        hook(calls, flags, "holidayLook", "misc/HolidayLook", "mode");
        hook(calls, flags, "titleEmoji", "misc/TitleEmoji", "decorate");
        hook(calls, flags, "useSystemFont", "misc/SystemFont", "typeface", "built");
        hook(calls, flags, "amoledBlack", "misc/BlackTheme", "loaded");
        hook(calls, flags, "hideTranslateBar", "misc/TranslateBar", "hidden");
        hook(calls, flags, "exactNumbers", "misc/ExactNumbers", "format");
        hook(calls, flags, "revealSpoilers", "misc/Spoilers", "mediaCovered");
        hook(calls, flags, "hideKeyboardOnScroll", "misc/ScrollKeyboard", "chatScrolled");
        hook(calls, flags, "keepVideosMuted", "misc/VolumeKeys", "chatTakesKey");
        hook(calls, flags, "videoEitherLandscape", "misc/VideoTurn", "fullScreen");
        hook(calls, flags, "videoOnlyFromButton", "misc/VideoUpright", "listenerOn", "listenerOff", "requested", "restore");
        hook(calls, flags, "swipeBackOnProfiles", "misc/SwipeBack", "touchBlocks");
        hook(calls, flags, "hidePhoneNumber", "misc/HidePhone", "shown");
        hook(calls, flags, "shareNumberUnticked", "misc/ContactShare", "startsTicked");
        hook(calls, flags, "messageSeconds", "misc/MessageTime", "shown");
        hook(calls, flags, "allowChatBlur", "misc/ChatBlur", "allowed");
        hook(calls, flags, "voiceOneAtATime", "misc/VoicePlaylist", "queue");
        hook(calls, flags, "lockedVoice", "misc/LockedVoice", "refuse");
        hook(calls, flags, "noHaptics", "misc/Haptics", "tap");
        hook(calls, flags, "reactionEffectsOff", "misc/ReactionEffects", "skipped");
        hook(calls, flags, "hideFolderCounters", "misc/FolderTabs", "countersHidden");
        hook(calls, flags, "launchFolder", "misc/LaunchFolder", "firstTabs");
        hook(calls, flags, "hideAllChats", "misc/LaunchFolder", "allChatsTab", "tabsAdded", "editing", "skipsDone");
        hook(calls, flags, "hiddenChats", "misc/HiddenChats", "prune");
        hook(calls, flags, "forwardHideSender", "misc/ForwardSender", "starts");
        hook(calls, flags, "voiceMusicPlayer", "misc/VoicePlayer", "music");
        hook(calls, flags, "silenceNonContacts", "misc/NonContacts", "silenced");
        hook(calls, flags, "disableArchivePull", "misc/ArchivePull", "keepsOut", "leavesOut", "menu");
        hook(calls, flags, "rearCameraFirst", "misc/RearCamera", "front");
        hook(calls, flags, "hideGalleryCameraTile", "misc/GalleryCameraTile", "tile");
        hook(calls, flags, "hideStickerTime", "misc/StickerTime", "hidden");
        hook(calls, flags, "stickerSize", "misc/StickerSize", "size");
        hook(calls, flags, "ignoreMutedMentions", "misc/MutedMentions", "notifyDialog");
        hook(calls, flags, "hideBlockedInGroups", "misc/BlockedSenders", "type", "hideReply");
        hook(calls, flags, "hideFeaturesAndInvite", "misc/FeaturesInvite", "addFeaturesRow", "listShown");
        hook(calls, flags, "messageMenuRepeat", "misc/MessageMenu", "fill");
        hook(calls, flags, "keepDeleted", "misc/KeepDeleted", "userUpdate", "channelUpdate", "push", "measuring");
        hook(calls, flags, "redDeletedLabel", "misc/KeepDeleted", "painted");
        hook(calls, flags, "askBeforeSending", "misc/SendConfirm", "sticker", "gif", "voice", "call");
        hook(calls, flags, "outsideTranslate", "misc/OutsideTranslate", "show", "fill", "chosen", "headerMenu", "headerClick");
        hook(calls, flags, "hideChannelButtons", "misc/ChannelButtons", "set");
        hook(calls, flags, "hideChannelMute", "misc/ChannelMute", "begin", "muteLabelled", "finish", "visibility");
        hook(calls, flags, "hideSendAs", "misc/SendAs", "show");
        hook(calls, flags, "hideContactsTab", "misc/MainTabs", "tabsShown", "blocksSwipe");
        hook(calls, flags, "compactTabBar", "misc/MainTabs", "barPadding", "barCorner", "barHeight", "barMinWidth");
        hook(calls, flags, "sideMenu", "misc/SideMenu", "swipeStarts", "back");
        hook(calls, flags, "hideNewMessage", "misc/MainTabs", "newMessageButton");
        hook(calls, flags, "fasterDownloads", "misc/DownloadSpeed", "fast");
        hook(calls, flags, "dataSaverDownloads", "misc/DataSaverDownloads", "hold", "holdMask");
        hook(calls, flags, "saveDownloads", "misc/SaveDownloads", "fileLoaded");
        hook(calls, flags, "storageFolder", "misc/StorageFolder", "telegramFolder");
        hook(calls, flags, "unifiedPush", "misc/UnifiedPush", "token", "type");
        hook(calls, flags, "hideByKeyword", "misc/MessageFilters", "type");
        hook(calls, flags, "galleryCameraOnTap", "misc/GalleryCamera", "keepCameraOff", "wakeOnTap", "openWhenReady");
        hook(calls, flags, "disableUpdateChecks", "misc/UpdateChecks", "skipUpdateCheck");
        for (String[] bridge : List.of(
                new String[]{"nativeTokenPresence", "Lorg/telegram/messenger/SharedConfig;->hushTelegramTokenPresence()I"},
                new String[]{"nativeAccountCounts", "Lorg/telegram/messenger/UserConfig;->hushTelegramAccountCounts()I"})) {
            Method stub = method(types, OWN + "telegram/misc/FirebasePush;->" + bridge[0] + "()I");
            List<Instruction> code = instructions(stub);
            boolean linked = code.size() == 3 && code.get(0).getOpcode() == Opcode.INVOKE_STATIC
                    && code.get(0) instanceof ReferenceInstruction reference
                    && reference.getReference().toString().equals(bridge[1])
                    && code.get(1).getOpcode() == Opcode.MOVE_RESULT && code.get(2).getOpcode() == Opcode.RETURN;
            require(linked == Boolean.TRUE.equals(flags.get("firebaseLocalStatus")));
            if (linked) method(types, bridge[1]);
        }
        // UnifiedPush hands its address to Telegram's own sign-up through a stub the patch writes.
        List<Instruction> signUp = instructions(method(types, OWN + "telegram/misc/UnifiedPush;->sendToTelegram(ILjava/lang/String;)V"));
        boolean signUpLinked = signUp.size() == 2 && signUp.get(0).getOpcode() == Opcode.INVOKE_STATIC
                && signUp.get(0) instanceof ReferenceInstruction reference
                && reference.getReference().toString().equals(PUSH_SIGN_UP)
                && signUp.get(1).getOpcode() == Opcode.RETURN_VOID;
        require(signUpLinked == Boolean.TRUE.equals(flags.get("unifiedPush")));
        if (signUpLinked) method(types, PUSH_SIGN_UP);
        // Save downloaded files tells a document from its thumbnail by the downloader's own name for it.
        List<Instruction> attach = instructions(method(types, OWN + "telegram/misc/SaveDownloads;->attachName(Ljava/lang/Object;)Ljava/lang/String;"));
        boolean attachLinked = attach.size() == 4 && attach.get(1).getOpcode() == Opcode.INVOKE_STATIC
                && attach.get(1) instanceof ReferenceInstruction call
                && call.getReference().toString().equals(ATTACH_NAME)
                && attach.get(3).getOpcode() == Opcode.RETURN_OBJECT;
        require(attachLinked == Boolean.TRUE.equals(flags.get("saveDownloads")));
        if (attachLinked) method(types, ATTACH_NAME);
        // Folders by chat type has no hook; its stubs are the patch, so the one that takes a folder out of
        // Telegram's list stands for them.
        List<Instruction> delete = instructions(method(types, OWN + "telegram/misc/ChatTypeFolders;->dropFolder(II)V"));
        long removes = delete.stream().filter(instruction -> instruction.getOpcode() == Opcode.INVOKE_VIRTUAL
                && instruction instanceof ReferenceInstruction call
                && call.getReference().toString().equals(REMOVE_FILTER)).count();
        boolean deleteLinked = removes == 1 && delete.get(delete.size() - 1).getOpcode() == Opcode.RETURN_VOID;
        require(deleteLinked == Boolean.TRUE.equals(flags.get("chatTypeFolders")));
        if (deleteLinked) method(types, REMOVE_FILTER);
    }

    private static int apiChanges(Map<String, ClassDef> before, Map<String, ClassDef> after, Expected expected) {
        return buildVarsChanges(method(before, API), method(after, API), expected.api, expected.apiId, expected.apiHash);
    }

    /** BuildVars' initializer differs only by the API pair written in place. */
    static int buildVarsChanges(Method original, Method patched, boolean api, int apiId, String apiHash) {
        MethodImplementation reference = original.getImplementation();
        require(original.getAccessFlags() == patched.getAccessFlags()
                && reference.getRegisterCount() == patched.getImplementation().getRegisterCount()
                && tryRanges(reference).equals(tryRanges(patched.getImplementation())));
        List<Instruction> oldCode = new ArrayList<>(), newCode = instructions(patched);
        reference.getInstructions().forEach(oldCode::add);
        require(oldCode.size() == newCode.size());
        int changed = 0, id = 0, hash = 0;
        for (int i = 0; i < oldCode.size(); i++) {
            Instruction old = oldCode.get(i), next = newCode.get(i);
            if (DexDiff.render(old).equals(DexDiff.render(next))) continue;
            require(api && i + 1 < oldCode.size()
                    && old instanceof OneRegisterInstruction && next instanceof OneRegisterInstruction
                    && ((OneRegisterInstruction) old).getRegisterA()
                    == ((OneRegisterInstruction) next).getRegisterA()
                    && DexDiff.render(oldCode.get(i + 1)).equals(DexDiff.render(newCode.get(i + 1))));
            Instruction writer = newCode.get(i + 1);
            require(writer instanceof ReferenceInstruction
                    && ((ReferenceInstruction) writer).getReference() instanceof FieldReference);
            FieldReference field = (FieldReference) ((ReferenceInstruction) writer).getReference();
            require(field.getDefiningClass().equals("Lorg/telegram/messenger/BuildVars;")
                    && ((OneRegisterInstruction) writer).getRegisterA()
                    == ((OneRegisterInstruction) next).getRegisterA());
            if (field.getName().equals("APP_ID") && field.getType().equals("I")) {
                require(writer.getOpcode() == Opcode.SPUT && next.getOpcode() == Opcode.CONST
                        && next instanceof NarrowLiteralInstruction
                        && ((NarrowLiteralInstruction) next).getNarrowLiteral() == apiId);
                id++;
            } else {
                require(field.getName().equals("APP_HASH") && field.getType().equals("Ljava/lang/String;")
                        && writer.getOpcode() == Opcode.SPUT_OBJECT
                        && (next.getOpcode() == Opcode.CONST_STRING
                        || next.getOpcode() == Opcode.CONST_STRING_JUMBO)
                        && ((StringReference) ((ReferenceInstruction) next).getReference())
                        .getString().equals(apiHash));
                hash++;
            }
            changed++;
        }
        require(changed == (api ? 2 : 0) && id == (api ? 1 : 0) && hash == (api ? 1 : 0));
        return changed;
    }

    static Method nativeInitializer(ClassDef owner) {
        require(owner != null && owner.getType().equals(CONNECTIONS));
        Method found = null;
        for (Method method : owner.getMethods()) {
            if (method.getImplementation() == null) continue;
            for (Instruction instruction : instructions(method)) {
                if (instruction instanceof ReferenceInstruction reference
                        && reference.getReference() instanceof MethodReference call
                        && call.getDefiningClass().equals(CONNECTIONS) && call.getName().equals("native_init")) {
                    require(found == null && method.getName().equals("init")
                            && instruction.getOpcode() == Opcode.INVOKE_STATIC_RANGE
                            && call.getParameterTypes().size() >= 4
                            && call.getParameterTypes().subList(0, 4).equals(List.of("I", "I", "I", "I")));
                    found = method;
                }
            }
        }
        require(found != null);
        return found;
    }

    /** Rebuild the one permitted insertion, including relocated branches and exception ranges. */
    static int nativeVersionChanges(Method original, Method patched, boolean configured, int apiId) {
        require(signature(original).equals(signature(patched))
                && original.getAccessFlags() == patched.getAccessFlags());
        MutableMethodImplementation expected = new MutableMethodImplementation(original.getImplementation());
        if (configured) {
            List<Instruction> body = instructions(original);
            int at = -1;
            for (int i = 0; i < body.size(); i++) {
                if (body.get(i) instanceof ReferenceInstruction reference
                        && reference.getReference() instanceof MethodReference call
                        && call.getDefiningClass().equals(CONNECTIONS) && call.getName().equals("native_init")) {
                    require(at == -1 && body.get(i) instanceof RegisterRangeInstruction);
                    at = i;
                }
            }
            require(at >= 0 && apiId > 0);
            int version = ((RegisterRangeInstruction) body.get(at)).getStartRegister() + 1;
            int api = version + 2;
            var nativeCall = expected.newLabelForIndex(at);
            expected.addInstruction(at, new BuilderInstruction23x(Opcode.XOR_INT, version, version, api));
            expected.addInstruction(at + 1, new BuilderInstruction21t(Opcode.IF_NEZ, version, nativeCall));
            expected.addInstruction(at + 2, new BuilderInstruction22s(Opcode.XOR_INT_LIT16, version, api, 128));
            expected.addInstruction(at + 3, new BuilderInstruction22b(Opcode.XOR_INT_LIT8, version, version, -1));
        }
        require(expected.getRegisterCount() == patched.getImplementation().getRegisterCount()
                && expected.getInstructions().stream().map(DexDiff::render).toList()
                    .equals(instructions(patched).stream().map(DexDiff::render).toList())
                && tryRanges(expected).equals(tryRanges(patched.getImplementation())));
        return configured ? 1 : 0;
    }

    private static final class Node {
        String name;
        Map<String, String> attributes = new TreeMap<>();
        List<Node> children = new ArrayList<>();
        Node(String name) { this.name = name; }
        Node attribute(String name, String value) { attributes.put(ANDROID + name, value); return this; }
        Node child(Node child) { children.add(child); return this; }
        String canonical() {
            List<String> body = new ArrayList<>();
            for (Node child : children) body.add(child.canonical());
            Collections.sort(body);
            return new JSONArray(List.of(name, new JSONObject(attributes), new JSONArray(body))).toString();
        }
        List<Node> children(String name) { return children.stream().filter(n -> n.name.equals(name)).toList(); }
    }

    private static Node node(ResXmlElement element) {
        Node result = new Node(element.getName());
        var attributes = element.getAttributes();
        while (attributes.hasNext()) {
            ResXmlAttribute attribute = attributes.next();
            String type = attribute.getValueType().name();
            String value = switch (type) {
                case "STRING" -> "STRING:" + attribute.getValueAsString();
                case "BOOLEAN" -> "BOOL:" + attribute.getValueAsBoolean();
                case "DEC", "HEX" -> "INT:" + attribute.getData();
                default -> type + ":" + attribute.getData();
            };
            String uri = attribute.getUri();
            require(result.attributes.put("{" + (uri == null ? "" : uri) + "}"
                    + attribute.getName(), value) == null);
        }
        var children = element.getElements();
        while (children.hasNext()) result.children.add(node((ResXmlElement) children.next()));
        return result;
    }

    private static Node manifest(File apk) throws Exception {
        try (ZipFile zip = new ZipFile(apk);
             var input = zip.getInputStream(zip.getEntry("AndroidManifest.xml"))) {
            return node(AndroidManifestBlock.load(input).getManifestElement());
        }
    }

    private static TreeSet<String> dexEntries(File apk) throws Exception {
        TreeSet<String> names = new TreeSet<>();
        try (ZipFile zip = new ZipFile(apk)) {
            zip.stream().filter(entry -> entry.getName().matches("classes\\d*\\.dex"))
                    .forEach(entry -> names.add(entry.getName()));
        }
        require(!names.isEmpty());
        return names;
    }

    private static Node only(List<Node> elements) { require(elements.size() == 1); return elements.get(0); }

    /** The id the patched table gave the icon patch's launcher picture, mipmap/hush_launcher. */
    private static int launcherIcon(File apk) throws Exception {
        TableBlock table;
        try (ZipFile zip = new ZipFile(apk)) {
            var entry = zip.getEntry(TableBlock.FILE_NAME);
            require(entry != null);
            try (var input = new java.io.BufferedInputStream(zip.getInputStream(entry))) { table = TableBlock.load(input); }
        }
        int found = 0;
        for (PackageBlock block : table.listPackages()) {
            for (SpecTypePair pair : block.listSpecTypePairs()) {
                Iterator<ResourceEntry> resources = pair.getResources();
                while (resources.hasNext()) {
                    ResourceEntry resource = resources.next();
                    if (resource == null || resource.isEmpty() || !"mipmap".equals(resource.getType())
                            || !"hush_launcher".equals(resource.getName())) continue;
                    require(found == 0);
                    found = resource.getResourceId();
                }
            }
        }
        require(found != 0);
        return found;
    }

    static int manifestChanges(File clean, File patched, Expected expected, boolean credentialsOnlyDelta) throws Exception {
        Node before = manifest(clean), after = manifest(patched);
        Node application = only(before.children("application"));
        if (expected.settings && !credentialsOnlyDelta) {
            Node sdk = only(before.children("uses-sdk"));
            String value = sdk.attributes.get(ANDROID + "minSdkVersion");
            require(value != null && value.startsWith("INT:"));
            sdk.attribute("minSdkVersion", "INT:" + Math.max(28, Integer.parseInt(value.substring(4))));
            application.child(new Node("activity-alias")
                    .attribute("name", "STRING:" + ALIAS)
                    .attribute("targetActivity", "STRING:org.telegram.ui.LaunchActivity")
                    .attribute("exported", "BOOL:true")
                    .child(new Node("intent-filter")
                            .child(new Node("action").attribute("name", "STRING:android.intent.action.APPLICATION_PREFERENCES"))
                            .child(new Node("category").attribute("name", "STRING:android.intent.category.DEFAULT"))));
        }
        if (expected.links && !credentialsOnlyDelta) {
            List<Node> queries = before.children("queries");
            require(queries.size() <= 1);
            Node query = queries.isEmpty() ? new Node("queries") : queries.get(0);
            if (queries.isEmpty()) before.child(query);
            for (String scheme : List.of("http", "https")) {
                boolean exists = query.children("intent").stream().anyMatch(intent ->
                        intent.children("action").stream().anyMatch(a -> "STRING:android.intent.action.VIEW".equals(a.attributes.get(ANDROID + "name")))
                        && intent.children("category").stream().anyMatch(c -> "STRING:android.intent.category.BROWSABLE".equals(c.attributes.get(ANDROID + "name")))
                        && intent.children("data").stream().anyMatch(d -> ("STRING:" + scheme).equals(d.attributes.get(ANDROID + "scheme"))
                        && !d.attributes.containsKey(ANDROID + "host")));
                if (!exists) query.child(new Node("intent")
                        .child(new Node("action").attribute("name", "STRING:android.intent.action.VIEW"))
                        .child(new Node("category").attribute("name", "STRING:android.intent.category.BROWSABLE"))
                        .child(new Node("data").attribute("scheme", "STRING:" + scheme)));
            }
        }
        if (expected.push && !credentialsOnlyDelta) {
            // UnifiedPush notifications asks to see the UnifiedPush apps and declares the two
            // components they talk to.
            List<Node> queries = before.children("queries");
            require(queries.size() <= 1);
            Node query = queries.isEmpty() ? new Node("queries") : queries.get(0);
            if (queries.isEmpty()) before.child(query);
            query.child(new Node("intent").child(new Node("action").attribute("name", "STRING:org.unifiedpush.android.distributor.REGISTER")));
            Node actions = new Node("intent-filter");
            for (String action : List.of("NEW_ENDPOINT", "MESSAGE", "UNREGISTERED", "REGISTRATION_FAILED", "TEMP_UNAVAILABLE")) {
                actions.child(new Node("action").attribute("name", "STRING:org.unifiedpush.android.connector." + action));
            }
            application.child(new Node("receiver").attribute("name", "STRING:" + PUSH_RECEIVER)
                    .attribute("exported", "BOOL:true").child(actions));
            application.child(new Node("service").attribute("name", "STRING:" + PUSH_RAISE)
                    .attribute("exported", "BOOL:true")
                    .child(new Node("intent-filter").child(new Node("action")
                            .attribute("name", "STRING:org.unifiedpush.android.connector.RAISE_TO_FOREGROUND"))));
        }
        if (expected.icon && !credentialsOnlyDelta) {
            // HushTelegram icon and name points the application, and Telegram's default launcher
            // entry where it names its own, at the picture it added. No case sets a name.
            String icon = "REFERENCE:" + launcherIcon(patched);
            String original = application.attributes.get(ANDROID + "icon");
            require(original != null && original.startsWith("REFERENCE:") && !original.equals(icon));
            application.attribute("icon", icon).attribute("roundIcon", icon);
            Node launcher = only(application.children("activity-alias").stream().filter(n ->
                    "STRING:org.telegram.messenger.DefaultIcon".equals(n.attributes.get(ANDROID + "name"))).toList());
            for (String name : List.of("icon", "roundIcon")) {
                if (launcher.attributes.containsKey(ANDROID + name)) launcher.attribute(name, icon);
            }
        }
        int changed = 0;
        if (expected.maps) {
            Node entry = only(application.children("meta-data").stream().filter(n ->
                    List.of("STRING:com.google.android.maps.v2.API_KEY", "STRING:com.google.android.geo.API_KEY")
                            .contains(n.attributes.get(ANDROID + "name"))).toList());
            require(entry.attributes.get(ANDROID + "value").startsWith("STRING:")
                    && !entry.attributes.containsKey(ANDROID + "resource")
                    && !entry.attributes.get(ANDROID + "value").equals("STRING:" + expected.mapsKey));
            entry.attribute("value", "STRING:" + expected.mapsKey);
            changed++;
        }
        require(before.canonical().equals(after.canonical()));
        return changed;
    }

    private static Evidence check(Side clean, Side patched, Expected expected, boolean credentialsOnlyDelta) throws Exception {
        Evidence result = new Evidence();
        result.settings = expected.settings;
        require(patched.dexEntries.containsAll(clean.dexEntries));
        Map<String, String> oldBodies = clean.bodies, newBodies = patched.bodies;
        require(newBodies.keySet().containsAll(oldBodies.keySet()));
        TreeSet<String> changed = new TreeSet<>(), added = new TreeSet<>(newBodies.keySet());
        added.removeAll(oldBodies.keySet());
        for (String key : oldBodies.keySet()) if (!oldBodies.get(key).equals(newBodies.get(key))) changed.add(key);
        require(expected.settings && !credentialsOnlyDelta || added.isEmpty());
        Map<String, ClassDef> before = clean.classes, after = patched.classes;
        Method originalInit = nativeInitializer(before.get(CONNECTIONS));
        Method patchedInit = nativeInitializer(after.get(CONNECTIONS));
        result.nativeVersionChanges = nativeVersionChanges(originalInit, patchedInit, expected.api, expected.apiId);
        if (!expected.settings || credentialsOnlyDelta) require(changed.equals(expected.api
                ? new TreeSet<>(List.of(API, signature(originalInit))) : new TreeSet<>()));
        require(after.keySet().containsAll(before.keySet()));
        // Mutable host classes can move into a new main DEX without adding a runtime extension.
        require(expected.settings && !credentialsOnlyDelta || before.keySet().equals(after.keySet()));
        for (String type : before.keySet()) {
            ClassDef original = before.get(type), replacement = after.get(type);
            declarations(original, replacement, expected.settings && !credentialsOnlyDelta);
        }
        require(expected.settings == after.keySet().stream().anyMatch(type -> type.startsWith(OWN)));
        for (ClassDef type : after.values()) {
            for (Method method : type.getMethods()) {
                String key = signature(method);
                if (changed.contains(key) || added.contains(key))
                    result.structuralFindings += DexDiff.structuralFindings(type, method).size();
            }
        }
        require(result.structuralFindings == 0);
        if (expected.settings) {
            ClassDef status = after.get(STATUS);
            require(status != null && expected.flags != null);
            for (Method method : status.getMethods()) {
                if (!method.getReturnType().equals("Z") || !method.getParameterTypes().isEmpty()) continue;
                require(expected.flags.containsKey(method.getName()));
                boolean value = flag(method);
                require(value == expected.flags.get(method.getName()));
                result.flags.put(method.getName(), value);
            }
            require(result.flags.keySet().equals(expected.flags.keySet()));
            compiledHooks(after, result.flags);
        }
        result.apiLiteralChanges = apiChanges(before, after, expected);
        result.mapsValueChanges = manifestChanges(clean.apk, patched.apk, expected, credentialsOnlyDelta);
        result.changedMethods = changed.size();
        result.addedMethods = added.size();
        return result;
    }

    /** One case: {patched, expectation, evidence} and, for full-configured, the full catalog's build as baseline. */
    private static void answer(Side clean, String[] request) throws Exception {
        require(request.length == 3 || request.length == 4);
        Expected expected = new Expected(new JSONObject(new File(request[1])));
        Side patched = new Side(new File(request[0]));
        Evidence evidence = check(clean, patched, expected, false);
        if (request.length == 4) check(new Side(new File(request[3])), patched, expected, true);
        Files.writeString(new File(request[2]).toPath(), evidence.json().toString() + "\n", StandardCharsets.UTF_8);
    }

    private static void reportPrivately(String evidencePath, Exception failure) {
        try (var privateReport = new java.io.PrintWriter(evidencePath + ".failure-private.txt", StandardCharsets.UTF_8)) {
            failure.printStackTrace(privateReport);
        } catch (Exception unavailable) {
            System.err.println("SELECTION_EVIDENCE_WRITE_FAILED");
        }
    }

    /**
     * --serve CLEAN: the matrix keeps one checker for a whole run, so the clean fixture is decoded
     * once, not once a case. Each stdin line is one case, the one-shot arguments after CLEAN joined
     * by tabs, and gets one SELECTION_CHECK_PASSED or SELECTION_CHECK_FAILED line back. At the end of
     * input the decode count goes out, so a run can show it decoded the clean fixture once.
     */
    private static void serve(File clean) throws Exception {
        Side stock = new Side(clean);
        var input = new java.io.BufferedReader(new java.io.InputStreamReader(System.in, StandardCharsets.UTF_8));
        int cases = 0;
        for (String line; (line = input.readLine()) != null; ) {
            if (line.isEmpty()) continue;
            String[] request = line.split("\t", -1);
            cases++;
            try {
                answer(stock, request);
                System.out.println("SELECTION_CHECK_PASSED");
            } catch (Exception failure) {
                if (request.length >= 3) reportPrivately(request[2], failure);
                System.out.println("SELECTION_CHECK_FAILED");
            }
            System.out.flush();
        }
        System.out.println("SELECTION_CHECK_DECODES cases=" + cases + " decodes=" + Side.decodes);
    }

    public static void main(String[] args) {
        if (args.length == 2 && args[0].equals("--serve")) {
            try {
                serve(new File(args[1]));
            } catch (Exception failure) {
                System.err.println("SELECTION_CHECK_FAILED");
                System.exit(1);
            }
            return;
        }
        try {
            require(args.length == 4 || args.length == 5);
            answer(new Side(new File(args[0])), java.util.Arrays.copyOfRange(args, 1, args.length));
            System.out.println("SELECTION_CHECK_PASSED");
        } catch (Exception failure) {
            if (args.length >= 4) reportPrivately(args[3], failure);
            System.err.println("SELECTION_CHECK_FAILED");
            System.exit(1);
        }
    }
}
