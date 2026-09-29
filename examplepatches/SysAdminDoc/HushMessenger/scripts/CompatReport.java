/*
 * Dry-run compatibility report for Messenger APKs.
 *
 * Checks whether a given APK is compatible with all 27 HushMessenger patches
 * without modifying the file. Prints package, version code, ABI, signer and
 * PASS/FAIL per patch, then exits non-zero on any failure.
 *
 * Compile:
 *   javac -cp <dexlib2.jar>;<guava.jar> scripts/CompatReport.java
 * Run:
 *   java -cp <dexlib2.jar>;<guava.jar>;scripts CompatReport <apk>
 *
 * Requires: JDK 21+, smali-dexlib2-3.0.9.jar, guava-33.x-jre.jar,
 *           aapt2 and apksigner from Android Build Tools.
 */

import com.android.tools.smali.dexlib2.AccessFlags;
import com.android.tools.smali.dexlib2.Opcode;
import com.android.tools.smali.dexlib2.Opcodes;
import com.android.tools.smali.dexlib2.dexbacked.DexBackedDexFile;
import com.android.tools.smali.dexlib2.iface.ClassDef;
import com.android.tools.smali.dexlib2.iface.Method;
import com.android.tools.smali.dexlib2.iface.instruction.Instruction;
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction;
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction;
import com.android.tools.smali.dexlib2.iface.reference.FieldReference;
import com.android.tools.smali.dexlib2.iface.reference.MethodReference;
import com.android.tools.smali.dexlib2.iface.reference.StringReference;
import com.android.tools.smali.dexlib2.iface.reference.TypeReference;
import com.android.tools.smali.dexlib2.iface.value.StringEncodedValue;

import java.io.*;
import java.nio.file.*;
import java.security.MessageDigest;
import java.security.cert.Certificate;
import java.util.*;
import java.util.jar.JarEntry;
import java.util.jar.JarFile;
import java.util.regex.*;
import java.util.stream.Collectors;
import java.util.zip.ZipEntry;
import java.util.zip.ZipFile;

public class CompatReport {

    static final String PACKAGE = "com.facebook.orca";
    static final String VERSION = "580.0.0.49.91";
    static final Set<Integer> VERSION_CODES = Set.of(346013387, 346013440, 346013442);

    static final String FACEBOOK_SIGNER =
        "e3f9e1e0cf99d0e56a055ba65e241b3399f7cea524326b0cdd6ec1327ed0fdc1";
    static final String META_SIGNER =
        "911d604446084ca7f4760b775bfc160fa8702441240a7258645d7a72c4312d27";

    static final String AD_ITEM = "Lcom/facebook/messaging/business/inboxads/common/InboxAdsItem;";
    static final String IMMUTABLE_LIST = "Lcom/google/common/collect/ImmutableList;";
    static final String PREFERENCE_GETTER = "Lcom/facebook/prefs/shared/FbSharedPreferences;->AhC(LX/1BK;Z)Z";
    static final String PEOPLE_JEWEL_KEY = "pymk_jewel_section_hidden";

    static final Set<String> FACEBOOK_PLUGINS = Set.of(
        "Lcom/facebook/messaging/inbox/tab/plugins/core/tabtoolbarbutton/facebookbutton/facebooktoolbarbutton/FacebookButtonTabButtonImplementation;",
        "Lcom/facebook/messaging/marketplace/plugins/folder/navbarmenuitem/NavBarMenuItemImplementation;",
        "Lcom/facebook/messaging/profile/plugins/core/threadsettingsactionbutton/facebookprofile/ThreadSettingsFacebookProfileActionButton;",
        "Lcom/facebook/messaging/navigation/plugins/drawerfoldersections/fbshortcutsfoldersection/FacebookShortcutsFolderSection;",
        "Lcom/facebook/messaging/communitymessaging/plugins/channelinvite/sharetofacebookbutton/ShareToFacebookButtonImplementation;",
        "Lcom/facebook/messaging/publicchats/plugins/externalsharehscrollbuttons/sharetofacebook/ShareToFacebookHScrollButtonImplementation;"
    );

    static final Map<String, Set<String>> PLUGIN_GATE_ANCHORS = Map.ofEntries(
        Map.entry("people", Set.of("com.facebook.messaging.friending.plugins.inboxunit.InboxPeopleYouMayKnowSectionKillSwitch")),
        Map.entry("people_list_end", Set.of("com.facebook.messaging.friending.plugins.inboxthreadlistend.InboxPYMKThreadListEndKillSwitch")),
        Map.entry("friend_requests", Set.of("com.facebook.messaging.friending.plugins.friendrequestinboxunit.FriendingFriendrequestinboxunitKillSwitch")),
        Map.entry("growth", Set.of("com.facebook.messaging.friending.plugins.growthpromotioninboxunit.FriendingGrowthpromotioninboxunitKillSwitch")),
        Map.entry("moments", Set.of("com.facebook.messaging.navigation.plugins.momentsfolder.NavigationMomentsfolderKillSwitch")),
        Map.entry("ai_stickers", Set.of(
            "com.facebook.stickers.keyboardls.generatedtab.plugins.core.KeyboardlsGeneratedtabCoreKillSwitch",
            "com.facebook.messaging.suggestedkeyboard.plugins.core.composer.rows.genai.GenAiSearchSuggestedRow"
        )),
        Map.entry("avatar_stickers", Set.of("com.facebook.stickers.keyboardls.avatartab.plugins.core.KeyboardlsAvatartabCoreKillSwitch")),
        Map.entry("inbox_promotions", Set.of(
            "com.facebook.messaging.quickpromotion.plugins.threadlist.QuickpromotionThreadlistKillSwitch",
            "com.facebook.messaging.quickpromotion.plugins.threadlistmsys.QuickpromotionThreadlistmsysKillSwitch"
        )),
        Map.entry("chat_promotions", Set.of(
            "com.facebook.messaging.quickpromotion.plugins.threadview.QuickpromotionThreadviewKillSwitch",
            "com.facebook.messaging.quickpromotion.plugins.threadviewmsys.QuickpromotionThreadviewmsysKillSwitch"
        )),
        Map.entry("suggested_replies", Set.of("com.facebook.messaging.business.plugins.suggestedreply.SuggestedReplyKillSwitch")),
        Map.entry("business_suggestions", Set.of("com.facebook.messaging.business.plugins.suggestasyoutype.SAYTKillSwitch")),
        Map.entry("event_prompts", Set.of("com.facebook.messaging.events.plugins.qp.EventsQpKillSwitch")),
        Map.entry("reels_badge", Set.of("com.facebook.messaging.reels.plugins.badge.ReelsBadgeKillSwitch")),
        Map.entry("ai_toolbar", Set.of("com.facebook.messaging.inbox.tab.plugins.core.tabtoolbarbutton.aihomebutton.AiHomeButtonKillSwitch"))
    );

    static final Map<String, Set<String>> EXPECTED_HOOKS;
    static {
        var hooks = new LinkedHashMap<String, Set<String>>();
        hooks.put("stories", Set.of("LX/1mi;->A00()Z"));
        hooks.put("facebook", Set.of(
            "LX/Sc2;->A06()Z", "LX/YFi;->A04()Z", "LX/2aP;->A0C()Z", "LX/3Ec;->A00()Z",
            "LX/3me;->A00()Z", "LX/HFd;->A02()Z", "LX/HRL;->A06()Z", "LX/HRM;->A02()Z",
            "LX/JiY;->A06()Z", "LX/Jir;->A02()Z", "LX/JjE;->A00()Z", "LX/JjM;->A01()Z",
            "LX/JjO;->A02()Z", "LX/JjQ;->A02()Z", "LX/JjV;->A03()Z", "LX/JjW;->A03()Z",
            "LX/JjY;->A01()Z", "LX/JjZ;->A01()Z", "LX/Jjb;->A06()Z", "LX/Jjc;->A06()Z", "LX/Jjd;->A06()Z"
        ));
        hooks.put("ai_menu", Set.of("LX/HFe;->A00()Z", "LX/HFe;->A01()Z", "LX/Jiu;->A00()Z", "LX/Jiu;->A01()Z"));
        hooks.put("ai_fab", Set.of("LX/6k8;->render(LX/2MZ;)LX/1GG;"));
        hooks.put("subtabs", Set.of("LX/2UL;->run()V"));
        hooks.put("typing", Set.of("LX/Ahp;->run()V"));
        hooks.put("bubbles", Set.of("LX/2ZW;->A00()Z"));
        hooks.put("browser", Set.of("Lcom/facebook/messaging/browser/util/MessengerBrowserLauncher;->A0L(Landroid/net/Uri;Lcom/facebook/auth/usersession/FbUserSession;)Z"));
        hooks.put("ads", Set.of("LX/2Wl;->D2i(LX/1fx;" + IMMUTABLE_LIST + "Ljava/lang/String;)" + IMMUTABLE_LIST));
        hooks.put("people_jewel", Set.of("LX/HAR;->A01(LX/HAR;)Z"));
        hooks.put("allow_screenshot", Set.of("LX/N2h;->run()V", "Lcom/facebook/screenshot/ScreenshotContentObserver;->onChange(ZLandroid/net/Uri;)V"));
        hooks.put("hide_read_receipts", Set.of("LX/AX0;->run()V"));
        hooks.put("keep_unsent", Set.of("LX/SH3;->A01(Landroid/content/Intent;Lcom/facebook/auth/usersession/FbUserSession;Ljava/lang/String;)V"));
        hooks.put("unsent_indicator", Set.of("LX/K1Y;->BWo(I)Ljava/lang/String;"));
        hooks.put("delta_unsent", Set.of("LX/K1Y;->Btd(I)Z"));
        hooks.put("ai_search", Set.of("LX/5OA;->A0A(LX/5OA;)Z", "LX/5OA;->A0B(LX/5OA;)Z"));
        hooks.put("emoji_typeface", Set.of("LX/1KV;->A00()Landroid/graphics/Typeface;"));
        hooks.put("ai_search_chip", Set.of("LX/D8E;->render(LX/2MZ;)LX/1GG;"));
        hooks.put("typing_mailbox", Set.of("LX/8eb;->A0I(Ljava/lang/String;Z)LX/325;"));
        hooks.put("read_mailbox", Set.of("LX/9sm;->A01(Ljava/lang/Long;Ljava/lang/String;Ljava/lang/String;Lkotlin/jvm/functions/Function0;Lkotlin/jvm/functions/Function0;)V"));
        hooks.put("avatar_tabs", Set.of("Lcom/facebook/messaging/msys/thread/composer/configuration/xapp/BaseXappComposerConfigurationFactory;->A0P()" + IMMUTABLE_LIST));
        hooks.put("menu_settings", Set.of("LX/HFb;->Ax1(LX/0MG;)Ljava/util/ArrayList;", "LX/TxV;->CAo(LX/4jw;I)V",
            "LX/Txc;->A0I(Ljava/util/List;)V", "LX/Jwp;->onClick(Landroid/view/View;)V"));
        hooks.put("people", Set.of("LX/1pm;->A0C()Z", "LX/2Wl;->A04()Z"));
        hooks.put("people_list_end", Set.of("LX/1pm;->A0B()Z", "LX/2Wl;->A03()Z"));
        hooks.put("friend_requests", Set.of("LX/1pm;->A09()Z", "LX/2Wl;->A02()Z"));
        hooks.put("growth", Set.of("LX/1pm;->A0A()Z", "LX/2GE;->A0A(LX/2GE;)Z"));
        hooks.put("moments", Set.of("LX/HFe;->A05()Z", "LX/Jiu;->A05()Z"));
        hooks.put("ai_stickers", Set.of("LX/PKW;->A03(LX/PKW;)Z", "LX/PKz;->A07(LX/PKz;)Z"));
        hooks.put("avatar_stickers", Set.of("LX/PKW;->A01(LX/PKW;)Z"));
        hooks.put("inbox_promotions", Set.of("LX/2Ef;->A0J()Z", "LX/2Ef;->A0K()Z"));
        hooks.put("chat_promotions", Set.of("LX/ThP;->A0D()Z", "LX/ThP;->A0E()Z"));
        hooks.put("suggested_replies", Set.of("LX/7Sd;->A06(LX/7Sd;)Z", "LX/7Tb;->A05(LX/7Tb;)Z", "LX/ThO;->A05()Z"));
        hooks.put("business_suggestions", Set.of("LX/7Sd;->A05(LX/7Sd;)Z", "LX/7Tb;->A04(LX/7Tb;)Z", "LX/ThO;->A04()Z"));
        hooks.put("event_prompts", Set.of("LX/ThP;->A07()Z", "LX/ThP;->A08()Z"));
        hooks.put("reels_badge", Set.of("LX/7xF;->A09(LX/7xF;)Z"));
        hooks.put("ai_toolbar", Set.of("LX/2aP;->A04()Z"));
        EXPECTED_HOOKS = Collections.unmodifiableMap(hooks);
    }

    static final String APP_COMMUNICATION = "com.facebook.permission.prod.FB_APP_COMMUNICATION";
    static final String RECEIVER_ACCESS = "com.facebook.receiver.permission.ACCESS";
    static final String APP_COMMUNICATION_FORMAT = "com.facebook.permission.%s.FB_APP_COMMUNICATION";
    static final Set<String> DEX_NAMES = Set.of(APP_COMMUNICATION, RECEIVER_ACCESS, APP_COMMUNICATION_FORMAT);

    static final Map<String, String> EXPECTED_DEX_SITES = Map.of(
        "LX/0iX;->A04(Landroid/app/Application;)V@18", APP_COMMUNICATION_FORMAT,
        "LX/15l;->A03()V@25", APP_COMMUNICATION,
        "LX/1f4;->A05(Lcom/facebook/auth/usersession/FbUserSession;LX/1f4;Ljava/lang/String;Ljava/lang/String;)V@36", APP_COMMUNICATION,
        "LX/2Qr;->A01(Landroid/content/Intent;LX/2Qr;)V@24", APP_COMMUNICATION_FORMAT,
        "LX/33K;->A04(LX/5X3;Ljava/lang/Object;II)Ljava/lang/Object;@1433", APP_COMMUNICATION_FORMAT,
        "Lcom/facebook/common/appinit/invoker/OnApplicationInitInvoker;->A0Z(Lcom/facebook/common/appinit/invoker/OnApplicationInitInvoker;I)V@507", APP_COMMUNICATION_FORMAT
    );

    static final Map<String, Integer> EXPECTED_MANIFEST_MENTIONS = Map.of(
        APP_COMMUNICATION, 26, RECEIVER_ACCESS, 3
    );

    // Patch name -> hook keys
    static final Map<String, List<String>> PATCHES = new LinkedHashMap<>();
    static {
        PATCHES.put("Hide inbox ads", List.of("ads"));
        PATCHES.put("Hide People You May Know", List.of("people", "people_list_end", "people_jewel"));
        PATCHES.put("Hide friend request cards", List.of("friend_requests"));
        PATCHES.put("Hide growth prompts", List.of("growth"));
        PATCHES.put("Hide inbox promotions", List.of("inbox_promotions"));
        PATCHES.put("Hide stories and notes", List.of("stories"));
        PATCHES.put("Hide inbox tabs", List.of("subtabs"));
        PATCHES.put("Hide Facebook shortcuts", List.of("facebook"));
        PATCHES.put("Hide Meta AI", List.of("ai_menu", "ai_fab", "ai_toolbar", "ai_search", "ai_search_chip"));
        PATCHES.put("Hide Chat Moments", List.of("moments"));
        PATCHES.put("Hide Reels badge", List.of("reels_badge"));
        PATCHES.put("Hide AI sticker tools", List.of("ai_stickers"));
        PATCHES.put("Hide avatar stickers", List.of("avatar_stickers", "avatar_tabs"));
        PATCHES.put("Hide chat promotions", List.of("chat_promotions"));
        PATCHES.put("Hide business reply suggestions", List.of("suggested_replies"));
        PATCHES.put("Hide business typing suggestions", List.of("business_suggestions"));
        PATCHES.put("Hide event prompts", List.of("event_prompts"));
        PATCHES.put("Hide typing indicator", List.of("typing", "typing_mailbox"));
        PATCHES.put("Open web links externally", List.of("browser"));
        PATCHES.put("Allow chat bubbles", List.of("bubbles"));
        PATCHES.put("Use system emoji", List.of("emoji_typeface"));
        PATCHES.put("Allow screenshots", List.of("allow_screenshot"));
        PATCHES.put("Hide read receipts", List.of("hide_read_receipts", "read_mailbox"));
        PATCHES.put("Keep unsent messages", List.of("keep_unsent", "unsent_indicator", "delta_unsent"));
        PATCHES.put("Open settings from menu", List.of("menu_settings"));
    }

    static String hookId(Method m) {
        var params = new StringBuilder();
        for (var p : m.getParameterTypes()) params.append(p);
        return m.getDefiningClass() + "->" + m.getName() + "(" + params + ")" + m.getReturnType();
    }

    static List<ClassDef> loadDex(File apk) throws Exception {
        var classes = new ArrayList<ClassDef>();
        try (var zip = new ZipFile(apk)) {
            for (var e : Collections.list(zip.entries())) {
                if (!e.getName().matches("classes[0-9]*\\.dex")) continue;
                var dex = new DexBackedDexFile(Opcodes.getDefault(),
                    zip.getInputStream(e).readAllBytes());
                for (var cls : dex.getClasses()) classes.add(cls);
            }
        }
        return classes;
    }

    static Method findSignerMethod(List<ClassDef> classes) {
        for (var cls : classes) {
            for (var method : cls.getMethods()) {
                if (!method.getParameterTypes().isEmpty()) continue;
                var impl = method.getImplementation();
                if (impl == null) continue;
                boolean hasApkContents = false, hasHistory = false, hasSignatures = false;
                for (var insn : impl.getInstructions()) {
                    if (!(insn instanceof ReferenceInstruction ref)) continue;
                    var refObj = ref.getReference();
                    if (refObj instanceof MethodReference mRef &&
                        "Landroid/content/pm/SigningInfo;".equals(mRef.getDefiningClass())) {
                        if ("getApkContentsSigners".equals(mRef.getName())) hasApkContents = true;
                        if ("getSigningCertificateHistory".equals(mRef.getName())) hasHistory = true;
                    } else if (refObj instanceof FieldReference fRef &&
                        "Landroid/content/pm/PackageInfo;".equals(fRef.getDefiningClass()) &&
                        "signatures".equals(fRef.getName())) {
                        hasSignatures = true;
                    }
                }
                if (hasApkContents && hasHistory && hasSignatures) return method;
            }
        }
        return null;
    }

    static Map<String, List<Method>> findControls(List<ClassDef> classes) {
        var found = new LinkedHashMap<String, List<Method>>();
        for (var key : EXPECTED_HOOKS.keySet()) found.put(key, new ArrayList<>());

        boolean hasAdItem = false, hasImmutableCopy = false;
        for (var cls : classes) {
            if (cls.getType().equals(AD_ITEM)) hasAdItem = true;
            if (cls.getType().equals(IMMUTABLE_LIST)) {
                for (var m : cls.getMethods()) {
                    if ("copyOf".equals(m.getName()) &&
                        m.getParameterTypes().equals(List.of("Ljava/util/Collection;")) &&
                        m.getReturnType().equals(IMMUTABLE_LIST) &&
                        AccessFlags.PUBLIC.isSet(m.getAccessFlags()) &&
                        AccessFlags.STATIC.isSet(m.getAccessFlags())) {
                        hasImmutableCopy = true;
                    }
                }
            }
        }
        boolean adContract = hasAdItem && hasImmutableCopy;

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

        String msgTextGetterName = "", msgIdGetterName = "", msgIsUnsentGetterName = "";
        String rawText = "", rawId = "", rawUnsent = "";
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
                            case "message_id=" -> { if ("Ljava/lang/String;".equals(lastRef.getReturnType())) { rawId = lastRef.getName(); lastRef = null; } }
                            case "is_unsent=" -> { if ("Z".equals(lastRef.getReturnType())) { rawUnsent = lastRef.getName(); lastRef = null; } }
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
                break;
            }
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
                    for (var entry : PLUGIN_GATE_ANCHORS.entrySet()) {
                        for (var s : strings) {
                            if (entry.getValue().contains(s)) {
                                found.get(entry.getKey()).add(method);
                                break;
                            }
                        }
                    }
                }

                // ads
                if (adContract && IMMUTABLE_LIST.equals(method.getReturnType()) &&
                    paramTypes.size() == 3 &&
                    strings.contains("messaging.inbox.itemlistprocessor.ItemListProcessorInterfaceSpec") &&
                    strings.contains("processItems") &&
                    strings.contains("new_friend_bump_threads")) {
                    found.get("ads").add(method);
                }

                // stories
                if (gate && strings.contains("com.facebook.messaging.friendsinboxunit.plugins.inboxunit.FriendsInboxUnitKillSwitch")) {
                    found.get("stories").add(method);
                }

                // facebook
                if (gate) {
                    for (var i : instructions) {
                        if (i.getOpcode() == Opcode.NEW_INSTANCE && i instanceof ReferenceInstruction ri) {
                            if (ri.getReference() instanceof TypeReference tr) {
                                if (FACEBOOK_PLUGINS.contains(tr.getType())) {
                                    found.get("facebook").add(method);
                                    break;
                                }
                            }
                        }
                    }
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
                        case "ReadThreadManager$1" -> found.get("hide_read_receipts").add(method);
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

                // browser
                if ("Z".equals(method.getReturnType()) &&
                    strings.contains("iab_skipped_reason") && strings.contains("user_prefers_external")) {
                    found.get("browser").add(method);
                }

                // people_jewel
                if ("Z".equals(method.getReturnType()) && isStatic &&
                    paramTypes.equals(List.of(cls.getType()))) {
                    boolean hasJewelKey = false, hasPrefGetter = false;
                    for (var r : refs) {
                        String rs = r.toString();
                        if (peopleJewelKeys.contains(rs)) hasJewelKey = true;
                        if (PREFERENCE_GETTER.equals(rs)) hasPrefGetter = true;
                    }
                    if (hasJewelKey && hasPrefGetter) found.get("people_jewel").add(method);
                }

                // ScreenshotContentObserver.onChange
                if ("Lcom/facebook/screenshot/ScreenshotContentObserver;".equals(cls.getType()) &&
                    "onChange".equals(method.getName()) && "V".equals(method.getReturnType())) {
                    found.get("allow_screenshot").add(method);
                }

                // keep_unsent
                if ("V".equals(method.getReturnType()) && paramTypes.size() == 3 &&
                    "Landroid/content/Intent;".equals(paramTypes.get(0)) &&
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

                // ai_search
                if ("Z".equals(method.getReturnType()) && isStatic &&
                    paramTypes.equals(List.of(cls.getType())) &&
                    strings.stream().anyMatch(s -> s.contains("SearchAiagentImplementationsKillSwitch"))) {
                    found.get("ai_search").add(method);
                }

                // emoji_typeface
                if ("Landroid/graphics/Typeface;".equals(method.getReturnType()) &&
                    paramTypes.isEmpty() && !isStatic &&
                    strings.contains("FacebookEmojiTypefaceProviderImpl")) {
                    found.get("emoji_typeface").add(method);
                }

                // typing_mailbox: the msys call that sends typing in encrypted chats
                if (paramTypes.equals(List.of("Ljava/lang/String;", "Z")) &&
                    strings.contains("setTypingIndicatorForThreadWithThreadIdentifier")) {
                    found.get("typing_mailbox").add(method);
                }

                // read_mailbox: the msys call that marks a thread read (and sends the receipt) in encrypted chats
                if ("V".equals(method.getReturnType()) && strings.contains("markAsReadThreadWithThreadIdentifier")) {
                    found.get("read_mailbox").add(method);
                }

                // avatar_tabs: the Litho sticker keyboard's tab list builder
                if (IMMUTABLE_LIST.equals(method.getReturnType()) && paramTypes.isEmpty() &&
                    refs.stream().anyMatch(r -> r.toString().startsWith(
                        "Lcom/facebook/xapp/messaging/composer/avatar/composertab/event/ActivateAvatarSticker;->"))) {
                    found.get("avatar_tabs").add(method);
                }

                // menu_settings: Settings folder builder, grid binder and the drawer's folder click
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
        return found;
    }

    static List<Map.Entry<String, String>> findDexSites(List<ClassDef> classes) {
        var sites = new ArrayList<Map.Entry<String, String>>();
        for (var cls : classes) {
            for (var method : cls.getMethods()) {
                var impl = method.getImplementation();
                if (impl == null) continue;
                boolean hasShared = false;
                for (var i : impl.getInstructions()) {
                    if ((i.getOpcode() == Opcode.CONST_STRING || i.getOpcode() == Opcode.CONST_STRING_JUMBO) &&
                        i instanceof ReferenceInstruction ri && ri.getReference() instanceof StringReference sr &&
                        DEX_NAMES.contains(sr.getString())) {
                        hasShared = true;
                        break;
                    }
                }
                if (!hasShared) continue;
                int index = 0;
                for (var i : impl.getInstructions()) {
                    if ((i.getOpcode() == Opcode.CONST_STRING || i.getOpcode() == Opcode.CONST_STRING_JUMBO) &&
                        i instanceof ReferenceInstruction ri && ri.getReference() instanceof StringReference sr &&
                        DEX_NAMES.contains(sr.getString())) {
                        var params = new StringBuilder();
                        for (var p : method.getParameterTypes()) params.append(p);
                        String siteId = method.getDefiningClass() + "->" + method.getName() +
                            "(" + params + ")" + method.getReturnType() + "@" + index;
                        sites.add(Map.entry(siteId, sr.getString()));
                    }
                    index++;
                }
            }
        }
        return sites;
    }

    static Set<String> findAbis(File apk) throws Exception {
        var abis = new TreeSet<String>();
        try (var zip = new ZipFile(apk)) {
            for (var e : Collections.list(zip.entries())) {
                String name = e.getName();
                if (name.startsWith("lib/") && name.endsWith(".so")) {
                    String[] parts = name.split("/");
                    if (parts.length >= 3) abis.add(parts[1]);
                }
            }
        }
        return abis;
    }

    static String resolveWrapper(ClassDef wCls, String rawName, String returnType) {
        for (var wm : wCls.getMethods()) {
            if (wm.getName().equals(rawName) && wm.getReturnType().equals(returnType)
                    && wm.getParameterTypes().size() == 1 && "I".equals(wm.getParameterTypes().get(0).toString()))
                return rawName;
        }
        for (var wm : wCls.getMethods()) {
            if (!wm.getReturnType().equals(returnType)) continue;
            if (wm.getParameterTypes().size() != 1 || !"I".equals(wm.getParameterTypes().get(0).toString())) continue;
            var impl = wm.getImplementation();
            if (impl == null) continue;
            for (var insn : impl.getInstructions()) {
                if (insn.getOpcode() == Opcode.INVOKE_INTERFACE && insn instanceof ReferenceInstruction ri
                        && ri.getReference() instanceof MethodReference mr && rawName.equals(mr.getName()))
                    return wm.getName();
            }
        }
        return rawName;
    }

    static String findTool(String name) {
        String sdk = System.getenv("ANDROID_HOME");
        if (sdk == null) sdk = System.getenv("ANDROID_SDK_ROOT");
        if (sdk == null) {
            String home = System.getProperty("user.home");
            File local = new File(home, "AppData/Local/Android/Sdk");
            if (local.isDirectory()) sdk = local.getAbsolutePath();
        }
        if (sdk == null) return null;
        File buildTools = new File(sdk, "build-tools");
        if (!buildTools.isDirectory()) return null;
        String[] versions = buildTools.list();
        if (versions == null || versions.length == 0) return null;
        Arrays.sort(versions, Comparator.reverseOrder());
        boolean win = System.getProperty("os.name", "").toLowerCase().contains("win");
        for (String v : versions) {
            File dir = new File(buildTools, v);
            if (win) {
                for (String ext : new String[]{".exe", ".bat", ""}) {
                    File tool = new File(dir, name + ext);
                    if (tool.isFile()) return tool.getAbsolutePath();
                }
            } else {
                File tool = new File(dir, name);
                if (tool.isFile()) return tool.getAbsolutePath();
            }
        }
        return null;
    }

    record ApkInfo(String packageName, String versionName, String versionCode) {}

    static ApkInfo parseApkInfo(File apk) {
        String aapt2 = findTool("aapt2");
        if (aapt2 == null) return null;
        try {
            var pb = new ProcessBuilder(aapt2, "dump", "badging", apk.getAbsolutePath());
            pb.redirectErrorStream(true);
            var proc = pb.start();
            String output = new String(proc.getInputStream().readAllBytes());
            proc.waitFor();
            String pkg = null, ver = null, code = null;
            var m = Pattern.compile("package:\\s+name='([^']+)'").matcher(output);
            if (m.find()) pkg = m.group(1);
            m = Pattern.compile("versionName='([^']+)'").matcher(output);
            if (m.find()) ver = m.group(1);
            m = Pattern.compile("versionCode='([^']+)'").matcher(output);
            if (m.find()) code = m.group(1);
            return new ApkInfo(pkg, ver, code);
        } catch (Exception e) {
            return null;
        }
    }

    static String parseSignerFingerprint(File apk) {
        String tool = findTool("apksigner");
        if (tool == null) return null;
        try {
            ProcessBuilder pb;
            if (tool.endsWith(".bat")) {
                pb = new ProcessBuilder("cmd", "/c", tool, "verify", "--print-certs", apk.getAbsolutePath());
            } else {
                pb = new ProcessBuilder(tool, "verify", "--print-certs", apk.getAbsolutePath());
            }
            pb.redirectErrorStream(true);
            var proc = pb.start();
            String output = new String(proc.getInputStream().readAllBytes());
            int exit = proc.waitFor();
            var m = Pattern.compile("certificate sha-256 digest:\\s+([0-9a-f]+)").matcher(output.toLowerCase());
            if (m.find()) return m.group(1);
            return null;
        } catch (Exception e) {
            System.out.println("DEBUG apksigner exception: " + e);
            return null;
        }
    }

    static int countManifestMentions(File apk, String permName) {
        String aapt2 = findTool("aapt2");
        if (aapt2 == null) return -1;
        try {
            var pb = new ProcessBuilder(aapt2, "dump", "xmltree", apk.getAbsolutePath(), "--file", "AndroidManifest.xml");
            pb.redirectErrorStream(true);
            var proc = pb.start();
            String output = new String(proc.getInputStream().readAllBytes());
            proc.waitFor();
            int count = 0;
            // Count attribute lines (not Raw annotations) containing the permission name
            for (String line : output.split("\n")) {
                String trimmed = line.trim();
                if (trimmed.startsWith("(Raw:")) continue;
                if (trimmed.contains("\"" + permName + "\"")) count++;
            }
            return count;
        } catch (Exception e) {
            return -1;
        }
    }

    public static void main(String[] args) throws Exception {
        if (args.length < 1) {
            System.err.println("Usage: CompatReport <apk>");
            System.exit(2);
        }
        File apk = new File(args[0]);
        if (!apk.isFile()) {
            System.err.println("File not found: " + apk);
            System.exit(2);
        }

        // Header info
        ApkInfo info = parseApkInfo(apk);
        Set<String> abis = findAbis(apk);
        String signer = parseSignerFingerprint(apk);

        String pkgName = info != null ? info.packageName : "(aapt2 unavailable)";
        String verName = info != null ? info.versionName : "(aapt2 unavailable)";
        String verCode = info != null ? info.versionCode : "(aapt2 unavailable)";
        String abiStr = abis.isEmpty() ? "(none)" : String.join(", ", abis);
        String sigStr = signer != null ? signer : "(apksigner unavailable)";

        System.out.println("Package:      " + pkgName);
        System.out.println("Version:      " + verName + " (" + verCode + ")");
        System.out.println("ABI:          " + abiStr);
        System.out.println("Signer:       " + sigStr);
        System.out.println();

        boolean anyFail = false;

        // Pre-checks
        if (info != null && !PACKAGE.equals(info.packageName)) {
            System.out.println("[FAIL] Package name: expected " + PACKAGE + ", got " + info.packageName);
            anyFail = true;
        }
        if (info != null && !VERSION.equals(info.versionName)) {
            System.out.println("[FAIL] Version name: expected " + VERSION + ", got " + info.versionName);
            anyFail = true;
        }
        if (info != null && info.versionCode != null) {
            try {
                int code = Integer.parseInt(info.versionCode);
                if (!VERSION_CODES.contains(code)) {
                    System.out.println("[FAIL] Version code: " + code + " is not in " + VERSION_CODES);
                    anyFail = true;
                }
            } catch (NumberFormatException e) {
                System.out.println("[FAIL] Version code: not a number: " + info.versionCode);
                anyFail = true;
            }
        }
        if (signer != null && !FACEBOOK_SIGNER.equals(signer) && !META_SIGNER.equals(signer)) {
            System.out.println("[WARN] Signer: " + signer + " is not the stock Facebook or Meta certificate");
        }

        // Load DEX
        System.out.println("Loading DEX classes...");
        List<ClassDef> classes = loadDex(apk);
        System.out.println("Loaded " + classes.size() + " classes from " + apk.getName());
        System.out.println();

        // Find controls
        Map<String, List<Method>> controls = findControls(classes);
        int totalHooks = controls.values().stream().mapToInt(List::size).sum();
        System.out.println("Discovered " + totalHooks + " hooks across " + controls.size() + " feature keys");
        System.out.println();

        // Check Install beside Meta apps (DEX sites + manifest mentions)
        {
            var failures = new ArrayList<String>();
            var sites = findDexSites(classes);
            if (sites.size() != EXPECTED_DEX_SITES.size()) {
                failures.add("expected " + EXPECTED_DEX_SITES.size() + " permission loads, found " + sites.size());
            } else {
                var siteMap = new LinkedHashMap<String, String>();
                for (var e : sites) siteMap.put(e.getKey(), e.getValue());
                if (!siteMap.equals(EXPECTED_DEX_SITES)) {
                    failures.add("permission instruction sites differ from the tested build");
                }
            }
            for (var entry : EXPECTED_MANIFEST_MENTIONS.entrySet()) {
                int count = countManifestMentions(apk, entry.getKey());
                if (count == -1) {
                    failures.add("aapt2 unavailable, cannot check manifest for " + entry.getKey());
                } else if (count != entry.getValue()) {
                    failures.add("expected " + entry.getValue() + " manifest uses of " + entry.getKey() + ", found " + count);
                }
            }
            if (failures.isEmpty()) {
                System.out.println("[PASS] Install beside Meta apps");
            } else {
                System.out.println("[FAIL] Install beside Meta apps");
                for (var f : failures) System.out.println("       " + f);
                anyFail = true;
            }
        }

        // Check Restore screens on re-signed builds (signer lookup fingerprint)
        {
            Method signerMethod = findSignerMethod(classes);
            if (signerMethod != null) {
                System.out.println("[PASS] Restore screens on re-signed builds (" + hookId(signerMethod) + ")");
            } else {
                System.out.println("[FAIL] Restore screens on re-signed builds");
                System.out.println("       No method found matching the signer lookup pattern");
                anyFail = true;
            }
        }

        // Check each control patch
        for (var entry : PATCHES.entrySet()) {
            String patchName = entry.getKey();
            List<String> hookKeys = entry.getValue();
            var failures = new ArrayList<String>();
            for (String key : hookKeys) {
                Set<String> expected = EXPECTED_HOOKS.get(key);
                if (expected == null) {
                    failures.add(key + ": no expected hooks defined");
                    continue;
                }
                List<Method> actual = controls.getOrDefault(key, List.of());
                Set<String> actualIds = actual.stream().map(CompatReport::hookId).collect(Collectors.toSet());
                if (actualIds.size() != expected.size() || !actualIds.equals(expected)) {
                    failures.add(key + ": expected " + expected.size() + " hooks " + expected +
                        ", found " + actualIds.size() + " " + actualIds);
                }
            }
            if (failures.isEmpty()) {
                System.out.println("[PASS] " + patchName);
            } else {
                System.out.println("[FAIL] " + patchName);
                for (var f : failures) System.out.println("       " + f);
                anyFail = true;
            }
        }

        System.out.println();
        if (anyFail) {
            System.out.println("RESULT: FAIL — one or more patches are incompatible with this APK.");
            System.out.println("Use an unmodified arm64 Messenger " + VERSION +
                " (version code " + VERSION_CODES.stream().map(String::valueOf)
                    .collect(Collectors.joining(" or ")) + ").");
            System.exit(1);
        } else {
            System.out.println("RESULT: PASS — all " + (PATCHES.size() + 2) + " patches are compatible.");
            System.exit(0);
        }
    }
}
