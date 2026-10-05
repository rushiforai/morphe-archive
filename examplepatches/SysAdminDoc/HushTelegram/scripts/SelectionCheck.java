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
import com.android.tools.smali.dexlib2.iface.Field;
import com.android.tools.smali.dexlib2.iface.Method;
import com.android.tools.smali.dexlib2.iface.MethodImplementation;
import com.android.tools.smali.dexlib2.iface.instruction.Instruction;
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction;
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction;
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction;
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction;
import com.android.tools.smali.dexlib2.iface.reference.FieldReference;
import com.android.tools.smali.dexlib2.iface.reference.MethodReference;
import com.android.tools.smali.dexlib2.iface.reference.StringReference;
import com.reandroid.arsc.chunk.xml.AndroidManifestBlock;
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

    static final class Expected {
        boolean settings, links, api, maps;
        int apiId;
        String apiHash, mapsKey;
        Map<String, Boolean> flags;

        Expected(JSONObject input) {
            settings = input.getBoolean("settings");
            links = input.getBoolean("links");
            api = input.getBoolean("api");
            maps = input.getBoolean("maps");
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

    private static Map<String, ClassDef> classes(File apk) throws Exception {
        Map<String, ClassDef> result = new HashMap<>();
        var dex = DexFileFactory.loadDexContainer(apk, Opcodes.getDefault());
        for (String entry : dex.getDexEntryNames()) {
            for (ClassDef type : dex.getEntry(entry).getDexFile().getClasses()) {
                require(result.put(type.getType(), type) == null);
            }
        }
        return result;
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
                    && java.util.Objects.equals(field.getInitialValue(), next.getInitialValue())
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
        hook(calls, flags, "deviceStats", "misc/Analytics", "skipDeviceStats");
        hook(calls, flags, "readMetrics", "misc/Analytics", "skipReadMetrics");
        int promo = calls.getOrDefault(OWN + "telegram/misc/Analytics;->skipPremiumAppLog", 0);
        int promoFlags = 0;
        for (String status : List.of("premiumPromoShow", "premiumPromoTap", "premiumPromoAccept", "premiumPromoFail")) {
            if (Boolean.TRUE.equals(flags.get(status))) promoFlags++;
        }
        require(promo == promoFlags);
        hook(calls, flags, "callDebugUpload", "misc/CallDebug", "skipCallDebugUpload");
        hook(calls, flags, "callLogFileUpload", "misc/CallDebug", "skipCallLogFileUpload");
        hook(calls, flags, "callLogUpload", "misc/CallDebug", "skipCallLogUpload");
        hook(calls, flags, "chatDraftPreviews", "misc/DraftPreviews", "skipChatPreview");
        hook(calls, flags, "shareDraftPreviews", "misc/DraftPreviews", "skipSharePreview");
        hook(calls, flags, "pollLinkPreviews", "misc/DraftPreviews", "skipPollPreview");
        hook(calls, flags, "storyLinkPreviews", "misc/DraftPreviews", "skipStoryLinkPreview");
        hook(calls, flags, "botSharePreviews", "misc/DraftPreviews", "skipBotSharePreview");
        hook(calls, flags, "commerceSettingsRows", "misc/Commerce", "addSettingsRow");
        hook(calls, flags, "commerceProfileGifts", "misc/Commerce", "addProfileTab", "showGiftsTab");
        hook(calls, flags, "commerceChannelGift", "misc/Commerce", "showChannelGiftButton");
        hook(calls, flags, "promotionalSuggestions", "misc/Suggestions", "filterChatList");
        hook(calls, flags, "birthdayGiftBanner", "misc/Suggestions", "birthdayGiftBannerDismissed");
        hook(calls, flags, "cachedProxyDialog", "ads/ProxyPromotions", "hideCachedProxyDialog");
        hook(calls, flags, "cachedProxyFilters", "ads/ProxyPromotions", "showSelectedDialog");
        hook(calls, flags, "externalBrowserRouting", "misc/LinkRouting", "tryOpenExternal");
        hook(calls, flags, "openedLinkTracking", "misc/LinkRouting", "cleanOpenedUri");
        hook(calls, flags, "sharedLinkTracking", "misc/LinkRouting", "cleanShareIntent");
        hook(calls, flags, "firebaseCertificateHeader", "misc/FirebasePush", "certificateHeader");
        hook(calls, flags, "hidePopularApps", "misc/PopularApps", "skipLoad", "hideSection");
        hook(calls, flags, "disableChatSwipe", "misc/ChatSwipe", "keepRowStill");
        hook(calls, flags, "disableChannelPull", "misc/ChannelPull", "stopBottomPull", "keepChannelStill");
        hook(calls, flags, "quietContactsNag", "misc/ContactsNag", "skipAsk", "hideBadge");
        hook(calls, flags, "holidayLook", "misc/HolidayLook", "mode");
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
    }

    private static int apiChanges(Map<String, ClassDef> before, Map<String, ClassDef> after,
                                  Expected expected) {
        Method original = method(before, API), patched = method(after, API);
        require(original.getAccessFlags() == patched.getAccessFlags()
                && original.getImplementation().getRegisterCount()
                == patched.getImplementation().getRegisterCount()
                && tryRanges(original.getImplementation()).equals(tryRanges(patched.getImplementation())));
        List<Instruction> oldCode = instructions(original), newCode = instructions(patched);
        require(oldCode.size() == newCode.size());
        int changed = 0, id = 0, hash = 0;
        for (int i = 0; i < oldCode.size(); i++) {
            Instruction old = oldCode.get(i), next = newCode.get(i);
            if (DexDiff.render(old).equals(DexDiff.render(next))) continue;
            require(expected.api && i + 1 < oldCode.size()
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
                        && ((NarrowLiteralInstruction) next).getNarrowLiteral() == expected.apiId);
                id++;
            } else {
                require(field.getName().equals("APP_HASH") && field.getType().equals("Ljava/lang/String;")
                        && writer.getOpcode() == Opcode.SPUT_OBJECT
                        && (next.getOpcode() == Opcode.CONST_STRING
                        || next.getOpcode() == Opcode.CONST_STRING_JUMBO)
                        && ((StringReference) ((ReferenceInstruction) next).getReference())
                        .getString().equals(expected.apiHash));
                hash++;
            }
            changed++;
        }
        require(changed == (expected.api ? 2 : 0) && id == (expected.api ? 1 : 0)
                && hash == (expected.api ? 1 : 0));
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

    private static int manifestChanges(File clean, File patched, Expected expected, boolean credentialsOnlyDelta) throws Exception {
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

    private static Evidence check(File clean, File patched, Expected expected, boolean credentialsOnlyDelta) throws Exception {
        Evidence result = new Evidence();
        result.settings = expected.settings;
        TreeSet<String> oldDex = dexEntries(clean), newDex = dexEntries(patched);
        require(newDex.containsAll(oldDex));
        Map<String, String> oldBodies = DexDiff.fingerprintAll(clean), newBodies = DexDiff.fingerprintAll(patched);
        require(newBodies.keySet().containsAll(oldBodies.keySet()));
        TreeSet<String> changed = new TreeSet<>(), added = new TreeSet<>(newBodies.keySet());
        added.removeAll(oldBodies.keySet());
        for (String key : oldBodies.keySet()) if (!oldBodies.get(key).equals(newBodies.get(key))) changed.add(key);
        require(expected.settings && !credentialsOnlyDelta || added.isEmpty());
        Map<String, ClassDef> before = classes(clean), after = classes(patched);
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
        result.mapsValueChanges = manifestChanges(clean, patched, expected, credentialsOnlyDelta);
        result.changedMethods = changed.size();
        result.addedMethods = added.size();
        return result;
    }

    public static void main(String[] args) {
        try {
            require(args.length == 4 || args.length == 5);
            Expected expected = new Expected(new JSONObject(new File(args[2])));
            Evidence evidence = check(new File(args[0]), new File(args[1]), expected, false);
            if (args.length == 5) check(new File(args[4]), new File(args[1]), expected, true);
            Files.writeString(new File(args[3]).toPath(), evidence.json().toString() + "\n", StandardCharsets.UTF_8);
            System.out.println("SELECTION_CHECK_PASSED");
        } catch (Exception failure) {
            if (args.length >= 4) {
                try (var privateReport = new java.io.PrintWriter(args[3] + ".failure-private.txt", StandardCharsets.UTF_8)) {
                    failure.printStackTrace(privateReport);
                } catch (Exception unavailable) {
                    System.err.println("SELECTION_EVIDENCE_WRITE_FAILED");
                }
            }
            System.err.println("SELECTION_CHECK_FAILED");
            System.exit(1);
        }
    }
}
