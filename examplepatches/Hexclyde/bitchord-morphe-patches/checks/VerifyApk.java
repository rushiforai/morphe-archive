import com.android.apksig.ApkVerifier;
import com.android.tools.smali.dexlib2.*;
import com.android.tools.smali.dexlib2.iface.*;
import com.android.tools.smali.dexlib2.iface.instruction.*;
import com.android.tools.smali.dexlib2.iface.reference.*;

import com.reandroid.apk.ApkModule;
import com.reandroid.xml.XMLFactory;

import org.w3c.dom.*;
import org.xmlpull.v1.XmlSerializer;

import java.io.*;
import java.nio.file.*;
import java.util.*;

import javax.xml.parsers.*;

public class VerifyApk {
    static final String NS = "http://schemas.android.com/apk/res/android";
    static int checks;

    static final String SONG_CONSTRUCTOR =
            "[Ljava/lang/String;, Ljava/lang/String;, Ljava/lang/String;, Ljava/lang/String;,"
                    + " Ljava/lang/String;, Ljava/lang/String;, Ljava/util/List;,"
                    + " Ljava/lang/String;, Ljava/lang/String;, Z, Z, Ljava/lang/String;,"
                    + " Lcom/music/bitchord/data/model/QueueTier;, Ljava/lang/String;,"
                    + " Ljava/lang/String;, Ljava/lang/String;, Ljava/lang/String;,"
                    + " Ljava/lang/String;, Ljava/lang/Long;, Ljava/lang/Long;,"
                    + " Ljava/lang/Integer;, Ljava/lang/String;, Z, Ljava/lang/Boolean;,"
                    + " Ljava/lang/String;, Lcom/music/bitchord/data/model/PlaybackSourceType;,"
                    + " Ljava/lang/String;]";

    static void check(boolean value, String name) {
        checks++;
        if (!value) throw new AssertionError(name);
    }

    static String signature(MethodReference ref) {
        return ref.getDefiningClass()
                + "->"
                + ref.getName()
                + ref.getParameterTypes()
                + ref.getReturnType();
    }

    static boolean resolves(
            Map<String, ClassDef> classes,
            MethodReference reference,
            String owner,
            Set<String> visited) {
        ClassDef cls = classes.get(owner);
        if (cls == null || !visited.add(owner)) return false;
        for (Method method : cls.getMethods())
            if (method.getName().equals(reference.getName())
                    && method.getParameterTypes().equals(reference.getParameterTypes())
                    && method.getReturnType().equals(reference.getReturnType())) return true;
        if (cls.getSuperclass() != null
                && resolves(classes, reference, cls.getSuperclass(), visited)) return true;
        for (String parent : cls.getInterfaces())
            if (resolves(classes, reference, parent, visited)) return true;
        return false;
    }

    static boolean fieldResolves(Map<String, ClassDef> classes, FieldReference reference) {
        for (String owner = reference.getDefiningClass(); owner != null; ) {
            ClassDef cls = classes.get(owner);
            if (cls == null) return false;
            for (Field field : cls.getFields())
                if (field.getName().equals(reference.getName())
                        && field.getType().equals(reference.getType())) return true;
            owner = cls.getSuperclass();
        }
        return false;
    }

    static MethodReference call(Instruction instruction) {
        return instruction instanceof ReferenceInstruction r
                        && r.getReference() instanceof MethodReference m
                ? m
                : null;
    }

    static int argument(Instruction instruction, int index) {
        if (instruction instanceof RegisterRangeInstruction range)
            return range.getStartRegister() + index;
        FiveRegisterInstruction five = (FiveRegisterInstruction) instruction;
        return new int[] {
                    five.getRegisterC(),
                    five.getRegisterD(),
                    five.getRegisterE(),
                    five.getRegisterF(),
                    five.getRegisterG()
                }
                [index];
    }

    static Instruction branchTarget(List<Instruction> code, int index) {
        int pc = 0;
        for (int i = 0; i < index; i++) pc += code.get(i).getCodeUnits();
        int target = pc + ((OffsetInstruction) code.get(index)).getCodeOffset();
        pc = 0;
        for (Instruction instruction : code) {
            if (pc == target) return instruction;
            pc += instruction.getCodeUnits();
        }
        throw new AssertionError("Branch does not land on an instruction: " + target);
    }

    static Document manifest(File apk) throws Exception {
        try (ApkModule module = ApkModule.loadApkFile(apk)) {
            module.getTableBlock();
            StringWriter text = new StringWriter();
            XmlSerializer xml = XMLFactory.newSerializer();
            xml.setOutput(text);
            module.getAndroidManifest().serialize(xml);
            xml.flush();
            DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
            factory.setNamespaceAware(true);
            return factory.newDocumentBuilder()
                    .parse(new ByteArrayInputStream(text.toString().getBytes("UTF-8")));
        }
    }

    static Set<String> authorities(Document doc) {
        Set<String> result = new HashSet<>();
        var nodes = doc.getElementsByTagName("provider");
        for (int i = 0; i < nodes.getLength(); i++)
            result.addAll(
                    Arrays.asList(
                            ((Element) nodes.item(i))
                                    .getAttributeNS(NS, "authorities")
                                    .split(";")));
        return result;
    }

    static boolean hasLauncherFilter(Element component) {
        var filters = component.getElementsByTagName("intent-filter");
        for (int i = 0; i < filters.getLength(); i++) {
            Element filter = (Element) filters.item(i);
            if (hasNamed(filter, "action", "android.intent.action.MAIN")
                    && hasNamed(filter, "category", "android.intent.category.LAUNCHER"))
                return true;
        }
        return false;
    }

    static boolean hasNamed(Element parent, String tag, String name) {
        var nodes = parent.getElementsByTagName(tag);
        for (int i = 0; i < nodes.getLength(); i++)
            if (((Element) nodes.item(i)).getAttributeNS(NS, "name").equals(name)) return true;
        return false;
    }

    static int launcherCount(Document doc) {
        int count = 0;
        for (String tag : List.of("activity", "activity-alias")) {
            var components = doc.getElementsByTagName(tag);
            for (int i = 0; i < components.getLength(); i++) {
                Element component = (Element) components.item(i);
                if (component.getAttributeNS(NS, "enabled").equals("false")) continue;
                if (hasLauncherFilter(component)) count++;
            }
        }
        return count;
    }

    public static void main(String[] args) throws Exception {
        File input = new File(args[0]), output = new File(args[1]);
        boolean nativeEnabled = args.length < 3 || !args[2].equals("clone-only");
        String expectedLabel = args.length > 3 ? args[3] : "Bitchord+";
        Document before = manifest(input), after = manifest(output);
        check(
                before.getDocumentElement().getAttribute("package").equals("com.music.bitchord"),
                "Original input");
        check(
                after.getDocumentElement()
                        .getAttribute("package")
                        .equals("com.music.bitchord.telegramtest"),
                "Separate application ID");
        Set<String> original = authorities(before), renamed = authorities(after);
        check(
                !renamed.isEmpty() && Collections.disjoint(original, renamed),
                "Provider authorities do not conflict");
        Element app = (Element) after.getElementsByTagName("application").item(0);
        check(
                app.getAttributeNS(NS, "label").equals(expectedLabel),
                "Configured installation label");
        check(
                app.getAttributeNS(NS, "name").equals("com.music.bitchord.BitChordApplication"),
                "Existing application class preserved");
        check(launcherCount(before) == 1, "Original APK has one launcher entry");
        check(launcherCount(after) == 1, "Patched APK has one launcher entry");
        boolean setupFound = false;
        var activities = after.getElementsByTagName("activity");
        for (int i = 0; i < activities.getLength(); i++) {
            Element activity = (Element) activities.item(i);
            if (!activity.getAttributeNS(NS, "name")
                    .equals("app.bitchord.telegram.TelegramActivity")) continue;
            setupFound = true;
            check(
                    activity.getAttributeNS(NS, "exported").equals("false"),
                    "Telegram setup is not exported");
            check(
                    activity.getElementsByTagName("intent-filter").getLength() == 0,
                    "Telegram setup has no intent filters");
        }
        check(setupFound == nativeEnabled, "Telegram setup activity matches patch selection");
        var aliases = after.getElementsByTagName("activity-alias");
        for (int i = 0; i < aliases.getLength(); i++) {
            Element alias = (Element) aliases.item(i);
            check(
                    alias.getAttributeNS(NS, "label").equals(expectedLabel),
                    "Launcher icon uses configured name");
            check(
                    alias.getAttributeNS(NS, "name").startsWith("com.music.bitchord.telegramtest."),
                    "Launcher aliases renamed");
            check(
                    alias.getAttributeNS(NS, "targetActivity")
                            .equals("com.music.bitchord.MainActivity"),
                    "Alias targets real activity");
        }
        var permissions = after.getElementsByTagName("permission");
        for (int i = 0; i < permissions.getLength(); i++)
            check(
                    ((Element) permissions.item(i))
                            .getAttributeNS(NS, "name")
                            .startsWith("com.music.bitchord.telegramtest."),
                    "Custom permission isolated");
        var signature =
                new ApkVerifier.Builder(output)
                        .setMinCheckedPlatformVersion(26)
                        .setMaxCheckedPlatformVersion(36)
                        .build()
                        .verify();
        check(signature.isVerified(), "Signature valid: " + signature.getErrors());
        check(
                signature.isVerifiedUsingV2Scheme() || signature.isVerifiedUsingV3Scheme(),
                "Modern APK signature");
        var container = DexFileFactory.loadDexContainer(output, Opcodes.getDefault());
        Map<String, ClassDef> definitions = new HashMap<>();
        for (String entry : container.getDexEntryNames())
            for (ClassDef cls : container.getEntry(entry).getDexFile().getClasses())
                definitions.put(cls.getType(), cls);
        Set<String> types = new HashSet<>();
        boolean hook = false,
                iconPrefix = false,
                publication = false,
                songMaker = false,
                playlistSave = false,
                playlistFlow = false,
                playlistId = false,
                flowSwap = false,
                downloadQueue = false,
                atmosDecoder = false,
                atmosSetting = false,
                ffmpegRenderer = false,
                version = false,
                portal = false,
                generic = false;
        Set<String> uiDefinitions = new HashSet<>(), uiReferences = new HashSet<>();
        int accountHooks = 0, sourceHooks = 0, sourceEditorHooks = 0;
        Set<String> downmixHooks = new TreeSet<>(), smoothHooks = new TreeSet<>();
        Set<String> alignHooks = new TreeSet<>();
        int[] settleWaits = new int[2]; // BitChord's 300 ms wait before the crossfade; ours
        // Extension methods BitChord's own classes call that ART wouldn't let them reach.
        Set<String> unreachable = new TreeSet<>(), reached = new TreeSet<>();
        boolean smoothEntry = false;
        int legendTexts = 0, legendCalls = 0, searchHooks = 0, legendLinks = 0, matchHooks = 0;
        boolean downmixTarget = false;
        boolean liveSearchCall = false, slider = false;
        int statsFormatHooks = 0, statsCaptureHooks = 0, statsMeasureHooks = 0;
        int playingHooks = 0, transitionHooks = 0;
        Set<String> policyRequests = new HashSet<>();
        Set<String> statsFields = new HashSet<>(), hostStatsFields = new HashSet<>();
        boolean statsTwoLines = false, statsGeneration = false, statsActive = false;
        boolean secureCapture = false, overlayCall = false, recentsCall = false, noSocket = true;
        int secureWindowCalls = 0, metadataHooks = 0, dataSourceHooks = 0, downloadHooks = 0;
        Set<String> specFields = new HashSet<>();
        for (String entry : container.getDexEntryNames())
            for (ClassDef cls : container.getEntry(entry).getDexFile().getClasses()) {
                if (!types.add(cls.getType()))
                    throw new AssertionError("Duplicate class " + cls.getType());
                if (cls.getType().equals("Lcom/music/bitchord/data/NerdStats$Snapshot;"))
                    for (Field field : cls.getFields())
                        hostStatsFields.add(field.getName() + ":" + field.getType());
                if (cls.getType().equals("Lcom/music/bitchord/data/sources/TrackMatcher;"))
                    for (Method method : cls.getMethods())
                        if ((method.getName().equals("best") || method.getName().equals("ranked"))
                                && method.getImplementation() != null) {
                            com.android.tools.smali.dexlib2.iface.instruction.Instruction first =
                                    method.getImplementation().getInstructions().iterator().next();
                            if (first
                                            instanceof
                                            com.android.tools.smali.dexlib2.iface.instruction
                                                    .ReferenceInstruction
                                    && ((com.android.tools.smali.dexlib2.iface.instruction
                                                            .ReferenceInstruction)
                                                    first)
                                            .getReference()
                                            .toString()
                                            .startsWith(
                                                    "Lapp/bitchord/telegram/TelegramMatch;->filter"))
                                matchHooks++;
                        }
                if (cls.getType().equals("Lcom/music/bitchord/ui/MainViewModel$SearchRequest;")
                        || cls.getType().equals("Lapp/bitchord/telegram/FormatLegend;"))
                    for (Method method : cls.getMethods())
                        if (method.getImplementation() != null)
                            for (com.android.tools.smali.dexlib2.iface.instruction.Instruction in :
                                    method.getImplementation().getInstructions())
                                if (in
                                                instanceof
                                                com.android.tools.smali.dexlib2.iface.instruction
                                                        .ReferenceInstruction
                                        && ((com.android.tools.smali.dexlib2.iface.instruction
                                                                        .ReferenceInstruction)
                                                                in)
                                                        .getReference()
                                                instanceof MethodReference) {
                                    MethodReference called =
                                            (MethodReference)
                                                    ((com.android.tools.smali.dexlib2.iface
                                                                            .instruction
                                                                            .ReferenceInstruction)
                                                                    in)
                                                            .getReference();
                                    if (method.getName().equals("<init>")
                                            && called.getName().equals("searching")) searchHooks++;
                                    if (method.getName().startsWith("host")
                                            && called.getDefiningClass()
                                                    .startsWith("Landroidx/compose/"))
                                        legendLinks++;
                                }
                if (cls.getType().equals("Lcom/music/bitchord/ui/components/SongTextKt;"))
                    for (Method method : cls.getMethods())
                        if (method.getName().startsWith("ExplicitSongTitle")
                                && method.getImplementation() != null)
                            for (com.android.tools.smali.dexlib2.iface.instruction.Instruction in :
                                    method.getImplementation().getInstructions())
                                if (in
                                                instanceof
                                                com.android.tools.smali.dexlib2.iface.instruction
                                                        .ReferenceInstruction
                                        && ((com.android.tools.smali.dexlib2.iface.instruction
                                                                        .ReferenceInstruction)
                                                                in)
                                                        .getReference()
                                                instanceof MethodReference) {
                                    MethodReference called =
                                            (MethodReference)
                                                    ((com.android.tools.smali.dexlib2.iface
                                                                            .instruction
                                                                            .ReferenceInstruction)
                                                                    in)
                                                            .getReference();
                                    if (called.getDefiningClass()
                                            .equals("Landroidx/compose/material3/TextKt;"))
                                        legendTexts++;
                                    if (called.getDefiningClass()
                                            .equals("Lapp/bitchord/telegram/FormatLegend;"))
                                        legendCalls++;
                                }
                if (cls.getType().equals("Lcom/music/bitchord/playback/PlaybackService;"))
                    for (Method method : cls.getMethods())
                        if (method.getName().equals("bitchordSmoothSwap")) smoothEntry = true;
                if (cls.getType().equals("Lcom/music/bitchord/playback/audio/PrecisionAudioSink;"))
                    downmixTarget =
                            cls.getInterfaces().contains("Lapp/bitchord/telegram/Downmix$Target;");
                if (cls.getType().equals("Lcom/music/bitchord/data/spotify/LocalPlaylistStore;"))
                    for (Field field : cls.getFields())
                        if (field.getName().equals("_playlists")
                                && field.getType()
                                        .equals("Lkotlinx/coroutines/flow/StateFlowImpl;"))
                            playlistFlow = true;
                if (cls.getType().equals("Lcom/music/bitchord/data/settings/AppSettings;"))
                    for (Field field : cls.getFields())
                        if (field.getName().equals("dolbyAtmos")
                                && (field.getAccessFlags() & 0x8) != 0
                                && field.getType()
                                        .equals("Lkotlinx/coroutines/flow/StateFlowImpl;"))
                            atmosSetting = true;
                if (cls.getType().equals("Lcom/music/bitchord/data/spotify/LocalPlaylist;"))
                    for (Field field : cls.getFields())
                        if (field.getName().equals("id")
                                && field.getType().equals("Ljava/lang/String;")) playlistId = true;
                if (cls.getType().equals("Lapp/bitchord/telegram/TelegramBridge;"))
                    for (Field field : cls.getFields())
                        check(
                                !field.getName().equals("tracks")
                                        && !field.getName().equals("cursors"),
                                "Bridge has no full-history map or index cursor");
                for (Method method : cls.getMethods()) {
                    if (cls.getType().equals("Lcom/music/bitchord/ui/screens/SettingsSheetKt;")
                            || cls.getType().equals("Lkotlin/reflect/TypesJVMKt;"))
                        uiDefinitions.add(signature(method));
                    if (cls.getType().equals("Lapp/bitchord/telegram/TelegramUi;")
                            && (method.getName().equals("hostGroup")
                                    || method.getName().equals("hostPainter")))
                        check(
                                method.getImplementation() != null
                                        && method.getImplementation().getTryBlocks().isEmpty(),
                                "Rewritten host bridge has no stale try blocks");
                    String params = method.getParameterTypes().toString();
                    boolean isStatic = (method.getAccessFlags() & 0x8) != 0;
                    boolean isPublic = (method.getAccessFlags() & 0x1) != 0;
                    if (cls.getType().equals("Lcom/music/bitchord/data/model/Song;")
                            && method.getName().equals("<init>")
                            && isPublic
                            && params.equals(SONG_CONSTRUCTOR)) songMaker = true;
                    if (cls.getType().equals("Lcom/music/bitchord/data/spotify/LocalPlaylistStore;")
                            && method.getName().equals("savePlaylist")
                            && isStatic
                            && params.equals("[Ljava/lang/String;, Ljava/util/List;]"))
                        playlistSave = true;
                    if (cls.getType().equals("Lkotlinx/coroutines/flow/StateFlowImpl;")
                            && (cls.getAccessFlags() & 0x1) != 0
                            && method.getName().equals("compareAndSet")
                            && isPublic
                            && params.equals("[Ljava/lang/Object;, Ljava/lang/Object;]"))
                        flowSwap = true;
                    if (cls.getType().equals("Lcom/music/bitchord/data/sources/DeviceCodecs;")
                            && method.getName().equals("getPlaysDolbyAtmos")
                            && isStatic
                            && isPublic
                            && params.equals("[]")) atmosDecoder = true;
                    if (cls.getType().startsWith("Lcom/music/bitchord/playback/PlaybackService")
                            && method.getName().equals("buildAudioRenderers")
                            && method.getImplementation() != null)
                        for (Instruction i : method.getImplementation().getInstructions())
                            if (i instanceof ReferenceInstruction r
                                    && r.getReference()
                                            .toString()
                                            .startsWith(
                                                    "Landroidx/media3/decoder/ffmpeg/"
                                                            + "FfmpegAudioRenderer;-><init>"))
                                ffmpegRenderer = true;
                    if (cls.getType().equals("Lcom/music/bitchord/download/Downloads;")
                            && method.getName().equals("enqueue")
                            && isStatic
                            && params.equals(
                                    "[Landroid/content/Context;,"
                                            + " Lcom/music/bitchord/data/model/Song;,"
                                            + " Ljava/lang/String;]")) downloadQueue = true;
                    if (cls.getType().equals("Lcom/music/bitchord/data/sources/SourceRegistry;")
                            && method.getName().equals("publish")
                            && method.getParameterTypes()
                                    .toString()
                                    .equals("[Ljava/util/ArrayList;, Z]")) publication = true;
                    if (method.getImplementation() == null) continue;
                    List<Instruction> instructions = new ArrayList<>();
                    method.getImplementation().getInstructions().forEach(instructions::add);
                    for (int index = 0; index < instructions.size(); index++) {
                        Instruction instruction = instructions.get(index);
                        if (cls.getType()
                                        .equals(
                                                "Lcom/music/bitchord/playback/PlaybackService$smoothSwapCurrentTrackVersion$1;")
                                && method.getName().equals("invokeSuspend")
                                && instruction.getOpcode() == Opcode.CONST_WIDE_16) {
                            long wait = ((WideLiteralInstruction) instruction).getWideLiteral();
                            if (wait == 300) settleWaits[0]++;
                            if (wait == 2600) settleWaits[1]++;
                        }
                        if (instruction instanceof ReferenceInstruction reference) {
                            if (reference.getReference() instanceof MethodReference target
                                    && target.getDefiningClass()
                                            .startsWith("Lapp/bitchord/telegram/")
                                    && !cls.getType().startsWith("Lapp/bitchord/telegram/")) {
                                String name = target.getDefiningClass() + "->" + target.getName();
                                reached.add(name);
                                ClassDef owner = definitions.get(target.getDefiningClass());
                                boolean open = owner != null && (owner.getAccessFlags() & 0x1) != 0;
                                if (open) {
                                    open = false;
                                    for (Method m : owner.getMethods())
                                        if (m.getName().equals(target.getName())
                                                && m.getParameterTypes()
                                                        .toString()
                                                        .equals(
                                                                target.getParameterTypes()
                                                                        .toString())
                                                && m.getReturnType().equals(target.getReturnType()))
                                            open = (m.getAccessFlags() & 0x1) != 0;
                                }
                                if (!open) unreachable.add(cls.getType() + " calls " + name);
                            }
                            if (reference.getReference() instanceof MethodReference target) {
                                if (cls.getType().startsWith("Lapp/bitchord/telegram/")
                                        && target.getDefiningClass()
                                                .startsWith("Lorg/drinkless/tdlib/TdApi$"))
                                    policyRequests.add(target.getDefiningClass());
                                if (target.getDefiningClass()
                                                .equals("Lapp/bitchord/telegram/PlaybackPolicy;")
                                        && !cls.getType().startsWith("Lapp/bitchord/telegram/")) {
                                    if (target.getName().equals("onState")) {
                                        playingHooks++;
                                        check(
                                                method.getName().equals("onIsPlayingChanged")
                                                        && index == 2
                                                        && argument(instruction, 0) == 1
                                                        && argument(instruction, 1) == 11,
                                                "Actual is-playing event passes player and boolean"
                                                        + " before either branch");
                                    } else if (target.getName().equals("onTransition")) {
                                        transitionHooks++;
                                        check(
                                                method.getName().equals("onTrackBecameCurrent")
                                                        && index == 2
                                                        && argument(instruction, 0) == 0,
                                                "Actual current-track callback acknowledges active"
                                                        + " item at entry");
                                    }
                                }
                                if (target.getDefiningClass()
                                                .equals("Lapp/bitchord/telegram/InternalAddon;")
                                        && target.getName().equals("reserved")
                                        && cls.getType()
                                                .equals(
                                                        "Lcom/music/bitchord/wear/WearBridge$sendToWatch$1;")) {
                                    check(
                                            instructions.get(index + 2).getOpcode()
                                                    == Opcode.IF_EQZ,
                                            "Native download predicate has a conditional fallback");
                                    Instruction destination = branchTarget(instructions, index + 2);
                                    check(
                                            destination.getOpcode() == Opcode.NEW_INSTANCE
                                                    && destination
                                                            instanceof ReferenceInstruction ref
                                                    && ref.getReference()
                                                            .toString()
                                                            .equals("Lokhttp3/Request$Builder;"),
                                            "External download resumes at the original"
                                                    + " Request.Builder instruction");
                                    check(
                                            instructions.indexOf(destination) > index,
                                            "Download fallback is forward, never into an unrelated"
                                                    + " merged coroutine");
                                }
                                if (target.getDefiningClass()
                                                .equals("Lapp/bitchord/telegram/InternalAddon;")
                                        && target.getName().equals("bodyOrNull")
                                        && !cls.getType().startsWith("Lapp/bitchord/telegram/")) {
                                    check(
                                            instructions.get(index + 2).getOpcode() == Opcode.IF_EQZ
                                                    && branchTarget(instructions, index + 2)
                                                            == instructions.get(index + 4),
                                            "External metadata resumes at the first original host"
                                                    + " instruction");
                                }
                                if (cls.getType().startsWith("Lapp/bitchord/telegram/")
                                        && (target.getDefiningClass()
                                                        .startsWith("Landroidx/media3/")
                                                || target.getDefiningClass()
                                                        .startsWith("Lcom/music/bitchord/")
                                                || target.getDefiningClass()
                                                        .equals("Lkotlinx/coroutines/JobKt;")))
                                    check(
                                            resolves(
                                                    definitions,
                                                    target,
                                                    target.getDefiningClass(),
                                                    new HashSet<>()),
                                            "New adapter links to optimized host method: "
                                                    + signature(target));
                                if (cls.getType().equals("Lapp/bitchord/telegram/InternalAddon;")
                                        && target.getDefiningClass()
                                                .equals("Lapp/bitchord/telegram/TelegramBridge;")
                                        && target.getName().equals("searchTracks"))
                                    liveSearchCall = true;
                                if (cls.getType().equals("Lapp/bitchord/telegram/TelegramActivity;")
                                        && target.getDefiningClass()
                                                .equals("Landroid/widget/SeekBar;")
                                        && target.getName().equals("<init>")) slider = true;
                                if (cls.getType().equals("Lapp/bitchord/telegram/TelegramBridge;")
                                        && target.getDefiningClass()
                                                .equals(
                                                        "Lorg/drinkless/tdlib/TdApi$GetChatHistory;"))
                                    check(
                                            method.getName().equals("channelHistory"),
                                            "History is confined to the explicit channel page");
                                if (cls.getType().equals("Lapp/bitchord/telegram/TelegramUi;")
                                        && (target.getDefiningClass()
                                                        .equals(
                                                                "Lcom/music/bitchord/ui/screens/SettingsSheetKt;")
                                                || target.getDefiningClass()
                                                        .equals("Lkotlin/reflect/TypesJVMKt;")))
                                    uiReferences.add(signature(target));
                                if (target.getDefiningClass()
                                                .equals("Lapp/bitchord/telegram/TelegramUi;")
                                        && target.getName().equals("accountSection")) {
                                    accountHooks++;
                                    MethodReference previous = call(instructions.get(index - 1));
                                    check(
                                            previous != null
                                                    && previous.getName()
                                                            .startsWith("SettingsGroup"),
                                            "Separate Telegram section follows the complete Google"
                                                    + " account group");
                                    check(
                                            argument(instruction, 0)
                                                    == argument(instructions.get(index - 1), 4),
                                            "Telegram section uses the outer group composer");
                                    check(
                                            method.getName().equals("AccountAndScrobblingScreen"),
                                            "Telegram section is in the account screen, outside"
                                                    + " card content");
                                }
                                if (target.getDefiningClass()
                                                .equals("Lapp/bitchord/telegram/TelegramUi;")
                                        && target.getName().equals("sourceSetupRow")) {
                                    sourceHooks++;
                                }
                                if (target.getDefiningClass()
                                                .equals("Lapp/bitchord/telegram/SmoothUpgrade;")
                                        && !cls.getType().startsWith("Lapp/bitchord/telegram/"))
                                    smoothHooks.add(cls.getType() + ">" + target.getName());
                                if (target.getDefiningClass()
                                                .equals("Lapp/bitchord/telegram/VersionAlign;")
                                        && !cls.getType().startsWith("Lapp/bitchord/telegram/"))
                                    alignHooks.add(
                                            cls.getType()
                                                    + ">"
                                                    + method.getName()
                                                    + ">"
                                                    + target.getName());
                                if (target.getDefiningClass()
                                                .equals("Lapp/bitchord/telegram/Downmix;")
                                        && !cls.getType().startsWith("Lapp/bitchord/telegram/")) {
                                    check(
                                            cls.getType()
                                                    .equals(
                                                            "Lcom/music/bitchord/playback/audio/PrecisionAudioSink;"),
                                            "Downmix hooks are only in BitChord's audio sink");
                                    downmixHooks.add(method.getName() + ">" + target.getName());
                                }
                                if (target.getDefiningClass()
                                                .equals("Lapp/bitchord/telegram/SourceEditorRoute;")
                                        && target.getName().equals("wrap")) {
                                    check(
                                            cls.getType()
                                                    .equals(
                                                            "Lcom/music/bitchord/ui/screens/SourcesScreenKt$$ExternalSyntheticLambda32;"),
                                            "Source editor route is in the Sources row");
                                    sourceEditorHooks++;
                                }
                                if (cls.getType().equals("Lapp/bitchord/telegram/TelegramActivity;")
                                        && target.getDefiningClass()
                                                .equals("Landroid/view/Window;")) {
                                    check(
                                            !target.getName().equals("clearFlags"),
                                            "Telegram integration never clears capture protection");
                                    if (target.getName().equals("addFlags")) secureCapture = true;
                                    if (target.getName().equals("setHideOverlayWindows"))
                                        overlayCall = true;
                                }
                                if (cls.getType().equals("Lapp/bitchord/telegram/TelegramActivity;")
                                        && target.getName().equals("secureWindow"))
                                    secureWindowCalls++;
                                if (cls.getType().equals("Lapp/bitchord/telegram/TelegramActivity;")
                                        && target.getName().equals("setRecentsScreenshotEnabled"))
                                    recentsCall = true;
                                if (cls.getType().startsWith("Lapp/bitchord/telegram/")
                                        && (target.getDefiningClass()
                                                        .equals("Ljava/net/ServerSocket;")
                                                || target.getDefiningClass()
                                                        .equals("Ljava/net/Socket;")))
                                    noSocket = false;
                                if (!cls.getType().startsWith("Lapp/bitchord/telegram/")) {
                                    if (target.getDefiningClass()
                                                    .equals("Lapp/bitchord/telegram/InternalAddon;")
                                            && target.getName().equals("bodyOrNull"))
                                        metadataHooks++;
                                    if (target.getDefiningClass()
                                                    .equals(
                                                            "Lapp/bitchord/telegram/TelegramDataSource;")
                                            && target.getName().equals("wrap")) {
                                        dataSourceHooks++;
                                        check(
                                                cls.getType()
                                                                .equals(
                                                                        "Landroidx/media3/datasource/ResolvingDataSource;")
                                                        && method.getName().equals("<init>"),
                                                "Media3 router is downstream of resolution");
                                    }
                                    if (target.getDefiningClass()
                                                    .equals(
                                                            "Lapp/bitchord/telegram/NativeDownloads;")
                                            && target.getName().equals("fetch")) downloadHooks++;
                                }
                                if (target.getDefiningClass()
                                        .equals("Lapp/bitchord/telegram/PlaybackStats;")) {
                                    switch (target.getName()) {
                                        case "decorate" -> {
                                            statsFormatHooks++;
                                            check(
                                                    method.getName().equals("SleeveNerdStats"),
                                                    "Stats formatting changes only the enabled"
                                                            + " artwork overlay");
                                            check(
                                                    argument(instruction, 0) == 4
                                                            && argument(instruction, 1) == 11,
                                                    "Stats formatter receives the localized"
                                                            + " description and original snapshot");
                                            Instruction saved = instructions.get(index - 1);
                                            check(
                                                    saved instanceof TwoRegisterInstruction move
                                                            && move.getRegisterA() == 11
                                                            && move.getRegisterB() == 45,
                                                    "Overlay uses saved snapshot rather than a"
                                                            + " newer global snapshot");
                                        }
                                        case "capture" -> {
                                            statsCaptureHooks++;
                                            check(
                                                    method.getName()
                                                            .equals("access$publishNerdStats"),
                                                    "Provenance captured in host publication path");
                                            MethodReference previous =
                                                    call(instructions.get(index - 1));
                                            check(
                                                    previous != null
                                                            && previous.getDefiningClass()
                                                                    .equals(
                                                                            "Lcom/music/bitchord/data/NerdStats$Snapshot;")
                                                            && previous.getName().equals("<init>"),
                                                    "Provenance paired with the constructed"
                                                            + " snapshot");
                                            check(
                                                    argument(instruction, 0) == 5
                                                            && argument(instruction, 1) == 14,
                                                    "Correct snapshot and provenance constructor"
                                                            + " registers");
                                        }
                                        case "measureLossless" -> {
                                            statsMeasureHooks++;
                                            check(
                                                    method.getName()
                                                            .equals("access$publishNerdStats"),
                                                    "Lossless measurement stays in the host"
                                                            + " telemetry path");
                                            check(
                                                    argument(instruction, 0) == 9,
                                                    "Use original asynchronous"
                                                            + " rendition-measurement callback");
                                            check(
                                                    instructions.get(index + 1).getOpcode()
                                                                    == Opcode.MOVE_RESULT_OBJECT
                                                            && ((OneRegisterInstruction)
                                                                                    instructions
                                                                                            .get(
                                                                                                    index
                                                                                                            + 1))
                                                                            .getRegisterA()
                                                                    == 0,
                                                    "Measurement result replaces only the lossless"
                                                            + " null result");
                                            check(
                                                    instructions.get(index + 2).getOpcode()
                                                            == Opcode.GOTO,
                                                    "Lossless measurement cannot fall through to"
                                                            + " the previous YouTube bitrate");
                                        }
                                    }
                                }
                                if (method.getName().equals("SleeveNerdStats")
                                        && target.getDefiningClass()
                                                .equals("Landroidx/compose/material3/TextKt;")
                                        && !statsTwoLines) {
                                    Instruction previous = instructions.get(index - 1);
                                    statsTwoLines =
                                            previous instanceof OneRegisterInstruction reg
                                                    && reg.getRegisterA() == 17
                                                    && previous
                                                            instanceof
                                                            NarrowLiteralInstruction literal
                                                    && literal.getNarrowLiteral() == 2;
                                }
                            }
                            if (reference.getReference() instanceof FieldReference field) {
                                if (cls.getType().startsWith("Lapp/bitchord/telegram/")
                                        && (field.getDefiningClass().startsWith("Landroidx/media3/")
                                                || field.getDefiningClass()
                                                        .startsWith("Lcom/music/bitchord/")))
                                    check(
                                            fieldResolves(definitions, field),
                                            "New adapter reads an existing host field: " + field);
                                if (cls.getType().startsWith("Lapp/bitchord/telegram/")
                                        && field.getDefiningClass()
                                                .equals("Landroidx/media3/datasource/DataSpec;")) {
                                    ClassDef owner = definitions.get(field.getDefiningClass());
                                    boolean exists = false;
                                    for (Field originalField : owner.getFields())
                                        if (originalField.getName().equals(field.getName())
                                                && originalField.getType().equals(field.getType()))
                                            exists = true;
                                    check(exists, "Media3 DataSpec field resolves: " + field);
                                    specFields.add(field.getName());
                                }
                                if (cls.getType().equals("Lapp/bitchord/telegram/PlaybackStats;")
                                        && field.getDefiningClass()
                                                .equals(
                                                        "Lcom/music/bitchord/data/NerdStats$Snapshot;"))
                                    statsFields.add(field.getName() + ":" + field.getType());
                                if (method.getName().equals("access$publishNerdStats")
                                        && field.getDefiningClass()
                                                .equals("Lcom/music/bitchord/data/NerdStats;")) {
                                    if (field.getName().equals("generation"))
                                        statsGeneration = true;
                                    if (field.getName().equals("activeMediaId")) statsActive = true;
                                }
                            }
                            if (reference.getReference() instanceof MethodReference target
                                    && cls.getType()
                                            .equals("Lcom/music/bitchord/BitChordApplication;")
                                    && target.getDefiningClass()
                                            .equals("Lapp/bitchord/telegram/TelegramBridge;")
                                    && target.getName().equals("init")) hook = true;
                            if (reference.getReference() instanceof StringReference text) {
                                if (cls.getType()
                                        .equals("Lapp/bitchord/telegram/TelegramBridge;")) {
                                    check(
                                            !text.getString().contains("BitChord native test"),
                                            "Telegram application version is unbranded");
                                    if (text.getString().equals("1.0.20")) version = true;
                                }
                                if (cls.getType()
                                        .equals("Lapp/bitchord/telegram/TelegramActivity;")) {
                                    check(
                                            !text.getString().equals("Index newest messages")
                                                    && !text.getString()
                                                            .equals("Load older messages"),
                                            "No mandatory indexing controls");
                                    if (text.getString().equals("https://my.telegram.org/apps"))
                                        portal = true;
                                    if (text.getString().contains("generic, descriptive name"))
                                        generic = true;
                                }
                            }
                            if (reference.getReference() instanceof StringReference text
                                    && cls.getType().equals("Lcom/music/bitchord/AppIcon;")) {
                                check(
                                        !text.getString().equals("com.music.bitchord."),
                                        "No stale icon prefix");
                                if (text.getString().equals("com.music.bitchord.telegramtest."))
                                    iconPrefix = true;
                            }
                        }
                    }
                }
            }
        check(iconPrefix, "Icon prefix targets test aliases");
        check(hook == nativeEnabled, "Native startup hook presence");
        check(
                types.contains("Lapp/bitchord/telegram/TelegramActivity;") == nativeEnabled,
                "Native setup class presence");
        if (nativeEnabled) {
            check(
                    playingHooks == 1 && transitionHooks == 1,
                    "Exactly one actual-playing and current-track acknowledgement hook");
            for (String name :
                    List.of(
                            "GetChatSponsoredMessages",
                            "ViewMessages",
                            "ClickChatSponsoredMessage",
                            "ReportChatSponsoredMessage",
                            "GetMessageProperties",
                            "OpenChat",
                            "CloseChat"))
                check(
                        policyRequests.contains("Lorg/drinkless/tdlib/TdApi$" + name + ";"),
                        "Official TDLib policy API linked: " + name);
            for (String name :
                    List.of(
                            "ChannelView",
                            "ChannelSponsorship",
                            "ChannelContent",
                            "MediaPolicy",
                            "TelegramLifecycle",
                            "PlaybackPolicy"))
                check(
                        types.contains("Lapp/bitchord/telegram/" + name + ";"),
                        "Policy component included: " + name);
            check(
                    secureCapture && secureWindowCalls >= 3,
                    "Activity and both dialog paths explicitly protect capture");
            check(overlayCall && recentsCall, "Overlay and Recents protection calls included");
            check(
                    noSocket
                            && !types.contains("Lapp/bitchord/telegram/LocalAddon;")
                            && !types.contains("Lapp/bitchord/telegram/HttpRange;"),
                    "No extension HTTP server or socket API calls");
            check(
                    metadataHooks == 1 && dataSourceHooks == 1 && downloadHooks == 1,
                    "Internal metadata, post-resolution Media3 and explicit-download hooks each"
                            + " installed exactly once");
            check(
                    types.contains("Lapp/bitchord/telegram/NativeAudio;")
                            && types.contains("Lapp/bitchord/telegram/TelegramDataSource;"),
                    "Private range reader and Media3 adapter included");
            check(
                    specFields.containsAll(Arrays.asList("uri", "position", "length")),
                    "Media3 ranges read actual runtime DataSpec fields rather than compile-only"
                            + " constants");
            boolean overlayPermission = false;
            var requested = after.getElementsByTagName("uses-permission");
            for (int i = 0; i < requested.getLength(); i++)
                if (((Element) requested.item(i))
                        .getAttributeNS(NS, "name")
                        .equals("android.permission.HIDE_OVERLAY_WINDOWS"))
                    overlayPermission = true;
            check(overlayPermission, "Android 12+ overlay suppression permission declared");
            check(
                    statsFormatHooks == 1 && statsCaptureHooks == 1 && statsMeasureHooks == 1,
                    "Exactly one of each stats hook");
            check(statsTwoLines, "Source and bitrate have a visible second line");
            check(
                    statsGeneration && statsActive,
                    "Original generation and active-item publication guards remain");
            check(
                    statsFields.size() == 3 && hostStatsFields.containsAll(statsFields),
                    "Stats helper resolves real optimized host fields");
            check(
                    types.contains("Lapp/bitchord/telegram/PlaybackStats;"),
                    "Playback stats helper included");
            check(
                    liveSearchCall && slider,
                    "Internal addon uses live search and native cache slider exists");
            check(
                    types.contains("Lapp/bitchord/telegram/LiveSearch;")
                            && types.contains("Lapp/bitchord/telegram/TrackMetadata;")
                            && types.contains("Lapp/bitchord/telegram/CachePolicy;"),
                    "Live search, stable-reference resolver and cache policy included");
            check(
                    version && portal && generic,
                    "Unbranded client version, official credential link and generic-title guidance"
                            + " included");
            check(
                    types.contains("Lapp/bitchord/telegram/CredentialStore;")
                            && types.contains("Lapp/bitchord/telegram/CredentialCipher;"),
                    "Runtime encrypted credential storage included");
            check(accountHooks == 1, "Exactly one Account & integrations setup entry");
            check(sourceHooks == 0, "Sources has no Telegram setup action");
            check(
                    matchHooks == 2,
                    "Telegram files get the stricter title check first in TrackMatcher.best and"
                            + " .ranked");
            check(
                    legendTexts == 2 && legendCalls == 2 && searchHooks == 1 && legendLinks == 3,
                    "Song titles draw the format legend: "
                            + legendTexts
                            + " Text calls, "
                            + legendCalls
                            + " legend lookups, "
                            + searchHooks
                            + " search hooks, "
                            + legendLinks
                            + " Compose links");
            check(
                    smoothEntry
                            && smoothHooks.equals(
                                    new TreeSet<>(
                                            List.of(
                                                    "Lcom/music/bitchord/playback/PlaybackService;>alignedOffset",
                                                    "Lcom/music/bitchord/playback/PlaybackService$swapIn$6;>prepare",
                                                    "Lcom/music/bitchord/playback/PlaybackService$swapIn$6;>replace",
                                                    "Lcom/music/bitchord/playback/PlaybackService$smoothSwapCurrentTrackVersion$1;>settled",
                                                    "Lcom/music/bitchord/playback/PlaybackService$swapIn$6;>seekTo"))),
                    "Quality upgrades go through the two-player swap: " + smoothHooks);
            check(
                    unreachable.isEmpty() && reached.size() > 10,
                    "BitChord's classes call only public extension classes and methods: "
                            + unreachable);
            check(
                    settleWaits[0] == 0 && settleWaits[1] == 1,
                    "The swap waits for the new copy to play in step before the crossfade: "
                            + Arrays.toString(settleWaits));
            check(
                    alignHooks.equals(
                            new TreeSet<>(
                                    List.of(
                                            "Lcom/music/bitchord/playback/audio/PrecisionAudioSink;>getCurrentPositionUs>position"))),
                    "Upgrades are lined up from the audio sink's position: " + alignHooks);
            check(
                    downmixTarget
                            && downmixHooks.equals(
                                    new TreeSet<>(
                                            List.of(
                                                    "configure>configure",
                                                    "configure>format",
                                                    "configure>off",
                                                    "flush>flush",
                                                    "reset>flush",
                                                    "handleBuffer>handleBuffer"))),
                    "Surround downmix wraps the audio sink's configure, flush, reset and"
                            + " handleBuffer: "
                            + downmixHooks);
            check(
                    sourceEditorHooks == 1,
                    "Telegram source row opens Telegram settings, not the address editor");
            check(
                    uiReferences.size() == 3 && uiDefinitions.containsAll(uiReferences),
                    "UI shim resolves real host group, row and painter signatures");
            check(
                    types.contains("Lapp/bitchord/telegram/NativeSource;"),
                    "Automatic registration adapter included");
            check(types.contains("Lorg/drinkless/tdlib/Client;"), "TDLib JNI client included");
            check(
                    types.contains("Lorg/drinkless/tdlib/TdApi;"),
                    "Matching generated TDLib API included");
            check(publication, "Source registration method exists after R8");
            check(songMaker, "Song constructor matches what channel playlists build");
            check(
                    playlistSave && playlistFlow && playlistId && flowSwap,
                    "Playlist store can save and replace a channel playlist");
            check(downloadQueue, "Downloads.enqueue takes a channel's songs");
            check(
                    atmosDecoder && atmosSetting,
                    "BitChord's Dolby Atmos decoder check and setting are where the patch reads"
                            + " them");
            check(ffmpegRenderer, "BitChord's player decodes Dolby with its own FFmpeg decoder");
            check(
                    app.getAttributeNS(NS, "extractNativeLibs").equals("true"),
                    "Native extraction enabled");
            check(
                    app.getAttributeNS(NS, "supportsRtl").equals("true"),
                    "Right-to-left layouts enabled, for the Arabic and Urdu pages");
        }
        System.out.println(
                "PASS: "
                        + checks
                        + " compiled APK checks; "
                        + types.size()
                        + " unique DEX classes; APK signature verified. Mode: "
                        + (nativeEnabled ? "combined" : "clone-only"));
    }
}
