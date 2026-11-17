package app.tiktoktweaks.patches;

import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod;
import app.morphe.patcher.util.smali.ExternalLabel;
import app.morphe.patcher.extensions.InstructionExtensions;
import app.morphe.patcher.patch.ApkFileType;
import app.morphe.patcher.patch.AppTarget;
import app.morphe.patcher.patch.BytecodePatchContext;
import app.morphe.patcher.patch.Compatibility;
import app.morphe.patcher.patch.Patch;
import app.morphe.patcher.patch.PatchKt;
import com.android.tools.smali.dexlib2.AccessFlags;
import com.android.tools.smali.dexlib2.Opcode;
import com.android.tools.smali.dexlib2.iface.ClassDef;
import com.android.tools.smali.dexlib2.iface.Method;
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction;
import com.android.tools.smali.dexlib2.iface.instruction.Instruction;
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction;
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction;
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction;
import com.android.tools.smali.dexlib2.iface.reference.FieldReference;
import com.android.tools.smali.dexlib2.iface.reference.MethodReference;
import com.android.tools.smali.dexlib2.iface.reference.StringReference;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import java.util.Set;
import kotlin.Unit;

/**
 * Bytecode-only customizations for TikTok 47.7.1.
 * Feed hook structure derives from niposch/revanced-tiktok-patches (GPL-3.0).
 */
public final class TikTokPatches {
    private static final String MODEL = "Lcom/ss/android/ugc/aweme/feed/model/";
    private static final String FEED = MODEL + "FeedItemList;";
    private static final String AWEME = MODEL + "Aweme;";
    private static final String FOLLOW = "Lcom/ss/android/ugc/aweme/follow/presenter/FollowFeedList;";
    private static final String PANEL = "Lcom/ss/android/ugc/aweme/feed/panel/BaseListFragmentPanel;";
    private static final String CONTEXT = "Landroid/content/Context;";
    private static final String BUNDLE = "Landroid/os/Bundle;";
    private static final String STRING = "Ljava/lang/String;";
    private static final String ROOT = "Lapp/tiktoktweaks/";
    private static final String FILTER = ROOT + "FeedFilter;";
    private static final String PREFS = ROOT + "Prefs;";
    private static final String PLAYBACK = ROOT + "Playback;";
    private static final String UI = ROOT + "SettingsUi;";
    private static final InstructionExtensions INS = InstructionExtensions.INSTANCE;

    static final Patch EXTENSION = PatchKt.bytecodePatch(null, null, true, builder -> {
        builder.extendWith(() -> {
            var stream = TikTokPatches.class.getResourceAsStream("/extensions/tiktok.mpe");
            if (stream == null) throw new IllegalStateException("Missing bundled TikTok extension");
            return stream;
        });
        return Unit.INSTANCE;
    });

    public static final Patch customizationsPatch = PatchKt.bytecodePatch(
        "TikTok Tweaks",
        "Feed filters, No Shop, no Tako, downloads, remembered speed and clear display, re-mute, smaller text, with a settings page.",
        true,
        builder -> {
            builder.compatibleWith(new Compatibility("com.zhiliaoapp.musically", "TikTok", null, ApkFileType.APK,
                Integer.valueOf(0xFE2C55),
                Set.of("9041803e91bcb814b4b4399fb5c85a91640b755e5e8ba76813814bf4cf2ab5ba"),
                List.of(new AppTarget("47.7.1", 23, false, null, null)), null));
            builder.dependsOn(EXTENSION);
            builder.execute(context -> {
                initContext(context);
                feed(context);
                followFeed(context);
                shopTabs(context);
                offlineAndTako(context);
                activityDefault(context);
                scaling(context);
                downloads(context);
                playback(context);
                settings(context);
                seekbar(context);
                return Unit.INSTANCE;
            });
            return Unit.INSTANCE;
        }
    );

    private static List<ClassDef> allClasses(BytecodePatchContext context) {
        List<ClassDef> classes = new ArrayList<>();
        context.classDefForEach(cls -> {
            classes.add(cls);
            return Unit.INSTANCE;
        });
        return classes;
    }

    private static ClassDef requireClass(BytecodePatchContext context, String type) {
        ClassDef cls = context.classDefByOrNull(type);
        if (cls == null) throw new IllegalStateException("Missing TikTok class: " + type);
        return cls;
    }

    private static MutableMethod method(BytecodePatchContext context, String type, String name, String... params) {
        List<String> wanted = Arrays.asList(params);
        for (MutableMethod method : context.mutableClassDefBy(type).getMethods()) {
            if (!method.getName().equals(name) || method.getImplementation() == null) continue;
            List<String> actual = new ArrayList<>();
            for (CharSequence parameter : method.getParameterTypes()) actual.add(parameter.toString());
            if (actual.equals(wanted)) return method;
        }
        throw new IllegalStateException("Missing TikTok method: " + type + "->" + name);
    }

    private static MutableMethod mutable(BytecodePatchContext context, Method target) {
        for (MutableMethod method : context.mutableClassDefBy(target.getDefiningClass())
                .getMethods()) {
            if (method.getName().equals(target.getName())
                    && method.getParameterTypes().equals(target.getParameterTypes())
                    && method.getReturnType().equals(target.getReturnType())) return method;
        }
        throw new IllegalStateException("Could not resolve method: " + target);
    }

    private static List<? extends Instruction> code(MutableMethod method) {
        return method.getImplementation().getInstructions();
    }

    private static List<Integer> returnIndexes(MutableMethod method) {
        List<Integer> indexes = new ArrayList<>();
        List<? extends Instruction> instructions = code(method);
        for (int i = instructions.size() - 1; i >= 0; i--) {
            if (instructions.get(i).getOpcode() == Opcode.RETURN_OBJECT) indexes.add(i);
        }
        return indexes;
    }

    private static void initContext(BytecodePatchContext context) {
        String init = "invoke-static/range {%s .. %s}, " + PREFS + "->init(" + CONTEXT + ")V";
        INS.addInstruction(method(context, "Lcom/ss/android/ugc/aweme/main/MainActivity;", "onCreate", BUNDLE),
            0, String.format(init, "p0", "p0"));
        for (String task : new String[]{"JatoInitTask", "StoreRegionInitTask"}) {
            INS.addInstruction(method(context, "Lcom/ss/android/ugc/aweme/legoImp/task/" + task + ";", "run", CONTEXT),
                0, String.format(init, "p1", "p1"));
        }
    }

    private static void feed(BytecodePatchContext context) {
        MutableMethod getter = method(context, FEED, "getItems");
        int self = getter.getImplementation().getRegisterCount() - 1;
        List<Integer> returns = returnIndexes(getter);
        if (returns.isEmpty()) throw new IllegalStateException("getItems has no object return");
        for (int index : returns) {
            int result = ((OneRegisterInstruction) code(getter).get(index)).getRegisterA();
            if (self > 15 || result > 15) throw new IllegalStateException("Unexpected getItems registers");
            INS.addInstructions(getter, index, "invoke-static {v" + self + ", v" + result + "}, "
                + FILTER + "->getter(" + FEED + "Ljava/util/List;)Ljava/util/List;\n"
                + "move-result-object v" + result);
        }

        // Network and protobuf boundaries cover paths that read items directly.
        for (String type : new String[]{
            "Lcom/ss/android/ugc/aweme/feed/FeedApiService;",
            "Lcom/ss/android/ugc/aweme/feed/api/FeedApi;",
            "Lcom/ss/android/ugc/tiktok/ConvertHelper;"
        }) {
            int matched = 0;
            for (Method original : requireClass(context, type).getMethods()) {
                if (!original.getReturnType().equals(FEED) || original.getImplementation() == null) continue;
                MutableMethod target = mutable(context, original);
                for (int index : returnIndexes(target)) {
                    int register = ((OneRegisterInstruction) code(target).get(index)).getRegisterA();
                    INS.addInstruction(target, index, invokeOne(register, FILTER, "feed", FEED));
                    matched++;
                }
            }
            if (matched == 0) throw new IllegalStateException("Missing feed boundary in " + type);
        }

        int writes = 0;
        for (ClassDef cls : allClasses(context)) {
            if (cls.getType().startsWith(ROOT)) continue;
            for (Method original : cls.getMethods()) {
                if (original.getImplementation() == null) continue;
                List<Integer> found = new ArrayList<>();
                int index = 0;
                for (Instruction ins : original.getImplementation().getInstructions()) {
                    if (ins.getOpcode() == Opcode.IPUT_OBJECT
                            && ((ReferenceInstruction) ins).getReference() instanceof FieldReference) {
                        FieldReference field = (FieldReference) ((ReferenceInstruction) ins).getReference();
                        if (field.getDefiningClass().equals(FEED) && field.getName().equals("preloadAds")) found.add(index);
                    }
                    index++;
                }
                if (found.isEmpty()) continue;
                MutableMethod target = mutable(context, original);
                Collections.reverse(found);
                for (int write : found) {
                    int owner = ((TwoRegisterInstruction) code(target).get(write)).getRegisterB();
                    INS.addInstruction(target, write + 1, invokeOne(owner, FILTER, "clearPreloadAds", FEED));
                    writes++;
                }
            }
        }
        if (writes < 4) throw new IllegalStateException("Unexpected preloadAds writes: " + writes);
    }

    private static void followFeed(BytecodePatchContext context) {
        String call = "invoke-static/range {p0 .. p0}, " + FILTER + "->follow(" + FOLLOW + ")V";
        INS.addInstruction(method(context, FOLLOW, "getItems"), 0, call);
        INS.addInstruction(method(context, FOLLOW, "getAwemeList"), 0, call);
    }

    /** Makes a boolean method return false when the given Prefs flag is true. Needs a free v0. */
    private static void falseWhen(MutableMethod target, String flag) {
        int params = target.getParameterTypes().size() + (AccessFlags.STATIC.isSet(target.getAccessFlags()) ? 0 : 1);
        if (target.getImplementation().getRegisterCount() <= params) {
            throw new IllegalStateException("No free register in " + target.getName());
        }
        INS.addInstructionsWithLabels(target, 0,
            "invoke-static {}, " + PREFS + "->" + flag + "()Z\n"
                + "move-result v0\n"
                + "if-eqz v0, :original\n"
                + "const/4 v0, 0x0\n"
                + "return v0",
            new ExternalLabel("original", code(target).get(0)));
    }

    private static void shopTabs(BytecodePatchContext context) {
        for (String tab : new String[]{"ShopBottomTabProtocol", "ShopTopTabProtocol"}) {
            String type = "Lcom/ss/android/ugc/aweme/ecommerce/mall/" + tab + ";";
            falseWhen(method(context, type, "enable"), "hideShop");
        }
        falseWhen(method(context, "Lcom/ss/android/ugc/aweme/ecommerce/mall/ShopTopTabProtocol;", "LJIILL"), "hideShop");

        // TikTok's server-driven tab rules skip enable(), so filter the tag list both code paths read.
        MutableMethod topTabs = method(context, "LX/04nt;", "LJII");
        int filtered = 0;
        for (int i = code(topTabs).size() - 2; i >= 0; i--) {
            Instruction ins = code(topTabs).get(i);
            if (!(ins instanceof ReferenceInstruction) || !(((ReferenceInstruction) ins).getReference() instanceof MethodReference)
                    || !((MethodReference) ((ReferenceInstruction) ins).getReference()).getName().equals("LJIIIIZZ")
                    || code(topTabs).get(i + 1).getOpcode() != Opcode.MOVE_RESULT_OBJECT) continue;
            int list = ((OneRegisterInstruction) code(topTabs).get(i + 1)).getRegisterA();
            INS.addInstructions(topTabs, i + 2, "invoke-static/range {v" + list + " .. v" + list + "}, " + ROOT
                + "Scale;->filterTopTabs(Ljava/util/ArrayList;)Ljava/util/ArrayList;\nmove-result-object v" + list);
            filtered++;
        }
        if (filtered == 0) throw new IllegalStateException("Top tab list not found");

        // The tab strip and other callers ask the service directly, so gate every implementation.
        String service = "Lcom/ss/android/ugc/aweme/ecommerce/mall/service/IECommerceMallService;";
        int gated = 0;
        for (ClassDef cls : allClasses(context)) {
            if (!cls.getInterfaces().contains(service)) continue;
            for (Method original : cls.getMethods()) {
                String name = original.getName();
                if (original.getImplementation() == null || !original.getParameterTypes().isEmpty()
                        || !(name.equals("shouldShowMallTab") || name.equals("shouldShowMallTopTab"))) continue;
                falseWhen(mutable(context, original), "hideShop");
                gated++;
            }
        }
        if (gated < 2) throw new IllegalStateException("Mall service gates not found: " + gated);
        System.out.println("mall service gates: " + gated);
    }

    /** Changes the Activity dropdown's starting value, the same LiveData a tap on an option writes. */
    private static void activityDefault(BytecodePatchContext context) {
        activityDefault(method(context, "Lcom/ss/android/ugc/aweme/notification/adapter/FilterViewModel;", "Z43"));
        String lambda = "Lkotlin/jvm/internal/AFwS168S0000000_39_I1;";
        activityDefault(method(context, lambda, "invoke$200", lambda));

        // A tap also posts the option itself, which is what actually applies the filter.
        MutableMethod init = method(context, "Lcom/ss/android/ugc/aweme/notification/adapter/FilterViewModel;", "<init>");
        for (int i = code(init).size() - 1; i >= 0; i--) {
            if (code(init).get(i).getOpcode() != Opcode.RETURN_VOID) continue;
            INS.addInstruction(init, i, "invoke-static/range {p0 .. p0}, " + ROOT + "Scale;->seedActivity(Ljava/lang/Object;)V");
            return;
        }
        throw new IllegalStateException("FilterViewModel return not found");
    }

    private static void activityDefault(MutableMethod target) {
        for (int i = 0; i < code(target).size(); i++) {
            Instruction ins = code(target).get(i);
            if (ins.getOpcode() != Opcode.SGET || !(((ReferenceInstruction) ins).getReference() instanceof FieldReference)) continue;
            FieldReference field = (FieldReference) ((ReferenceInstruction) ins).getReference();
            if (!field.getDefiningClass().equals("LX/0Cwe;") || !field.getName().equals("LIZJ")) continue;
            int register = ((OneRegisterInstruction) ins).getRegisterA();
            INS.addInstructions(target, i + 1, "invoke-static/range {v" + register + " .. v" + register + "}, "
                + PREFS + "->activityGroup(I)I\nmove-result v" + register);
            return;
        }
        throw new IllegalStateException("Activity default not found in " + target.getName());
    }

    private static void offlineAndTako(BytecodePatchContext context) {
        falseWhen(method(context, "LX/06OC;", "LJJJJL"), "disableOffline");
        falseWhen(method(context, "LX/0Bbm;", "n0"), "disableOffline");

        falseWhen(method(context,
            "Lcom/ss/android/ugc/aweme/comment/keyboard/keyboardv2/refactor/TypingStickerRecommendTrigger;", "Sp",
            "Lcom/ss/android/ugc/aweme/comment/model/CommentContextSource;", "LX/0HD1;"), "hideCommentStickers");

        // Registers the Tako icon in the home top bar.
        MutableMethod topIcon = method(context, "Lcom/ss/android/ugc/aweme/tako/feed/topicon/TakoTopIconAssem;", "onCreate");
        int afterSuperCall = afterSuper(topIcon);
        INS.addInstructionsWithLabels(topIcon, afterSuperCall,
            "invoke-static {}, " + PREFS + "->hideTako()Z\nmove-result v0\nif-eqz v0, :original\nreturn-void",
            new ExternalLabel("original", code(topIcon).get(afterSuperCall)));

        String inbox = "Lcom/ss/android/ugc/aweme/inbox/widget/multi/MultiViewModel;";
        String filter = ROOT + "Scale;->filterInbox(Ljava/util/List;)Ljava/util/List;\n";
        INS.addInstructions(method(context, inbox, "o53", "Ljava/util/List;"), 0,
            "invoke-static/range {p1 .. p1}, " + filter + "move-result-object p1");
        INS.addInstructions(method(context, inbox, "s53", "Ljava/lang/Long;", "Ljava/util/List;", "Z"), 0,
            "invoke-static/range {p2 .. p2}, " + filter + "move-result-object p2");

        MutableMethod entrance = method(context,
            "Lcom/ss/android/ugc/aweme/tako/otherpage/feed/mainentrance/ui/AbsTakoRightBottomEntrance;",
            "onViewCreated", "Landroid/view/View;");
        for (int i = code(entrance).size() - 1; i >= 0; i--) {
            if (code(entrance).get(i).getOpcode() != Opcode.RETURN_VOID) continue;
            INS.addInstruction(entrance, i, "invoke-static/range {p1 .. p1}, " + ROOT + "Scale;->hideTako(Landroid/view/View;)V");
            return;
        }
        throw new IllegalStateException("Tako entrance return not found");
    }

    /** Passes an int through a Prefs mapper right after reading (or right before writing) a field. */
    private static void afterField(MutableMethod target, Opcode opcode, String name, boolean after, String mapper) {
        for (int i = 0; i < code(target).size(); i++) {
            Instruction ins = code(target).get(i);
            if (ins.getOpcode() != opcode || !(((ReferenceInstruction) ins).getReference() instanceof FieldReference)
                    || !((FieldReference) ((ReferenceInstruction) ins).getReference()).getName().equals(name)) continue;
            int register = ins instanceof TwoRegisterInstruction
                ? ((TwoRegisterInstruction) ins).getRegisterA() : ((OneRegisterInstruction) ins).getRegisterA();
            INS.addInstructions(target, after ? i + 1 : i, "invoke-static/range {v" + register + " .. v" + register + "}, "
                + PREFS + "->" + mapper + "(I)I\nmove-result v" + register);
            return;
        }
        throw new IllegalStateException("Field " + name + " not found in " + target.getName());
    }

    private static void seekbar(BytecodePatchContext context) {
        Method show = null;
        Method type = null;
        for (ClassDef cls : allClasses(context)) {
            for (Method candidate : cls.getMethods()) {
                if (candidate.getImplementation() == null) continue;
                for (Instruction ins : candidate.getImplementation().getInstructions()) {
                    if (ins.getOpcode() != Opcode.CONST_STRING && ins.getOpcode() != Opcode.CONST_STRING_JUMBO) continue;
                    String value = ((StringReference) ((ReferenceInstruction) ins).getReference()).getString();
                    if (value.equals("can not show seekbar, state: 1, not in resume")) show = candidate;
                    if (value.equals("seekbar show type change, change to:")) type = candidate;
                }
            }
        }
        if (show == null || type == null) throw new IllegalStateException("Seekbar methods not found");
        INS.addInstructions(mutable(context, show), 0, "const/4 v0, 0x1\nreturn v0");
        MutableMethod typeMethod = mutable(context, type);
        INS.addInstruction(typeMethod, 0, "const/16 v" + (typeMethod.getImplementation().getRegisterCount() - 1) + ", 0x64");
    }

    private static void scaling(BytecodePatchContext context) {
        // LX/04F8 turns TikTok's text size slider position into a whole-app density factor at startup.
        String font = "LX/04F8;";
        INS.addInstruction(method(context, font, "LIZLLL", CONTEXT), 0,
            "invoke-static/range {p0 .. p0}, " + PREFS + "->init(" + CONTEXT + ")V");
        for (String factor : new String[]{"LIZ", "LIZJ"}) {
            MutableMethod target = method(context, font, factor);
            INS.addInstructionsWithLabels(target, 0,
                "sget v0, " + font + "->LIZ:I\n"
                    + "invoke-static {v0}, " + PREFS + "->smallStep(I)Z\n"
                    + "move-result v0\n"
                    + "if-eqz v0, :original\n"
                    + "invoke-static {}, " + PREFS + "->fontFactor()F\n"
                    + "move-result v0\n"
                    + "return v0",
                new ExternalLabel("original", code(target).get(0)));
        }

        // The slider works in positions; TikTok keeps storing its own 0-3 mode.
        MutableMethod slider = method(context, "LX/1Qsb;", "<init>", CONTEXT, "Landroid/util/AttributeSet;");
        afterField(slider, Opcode.IPUT, "LLJZIJLIL", false, "sliderMax");
        String page = "Lcom/ss/android/ugc/aweme/setting/page/accessibility/DynamicFontSizeFragment;";
        afterField(method(context, page, "onCreate", BUNDLE), Opcode.SGET, "LIZ", true, "modeToPos");
        INS.addInstructions(method(context, page, "KY", "I"), 0,
            "invoke-static/range {p1 .. p1}, " + PREFS + "->posToMode(I)I\nmove-result p1");
        String confirm = "Lkotlin/jvm/internal/AwS549S0100000_39_I1;";
        afterField(method(context, confirm, "invoke$2", confirm, "Ljava/lang/Object;"), Opcode.IGET, "LLLFFI", true, "commitPos");

        INS.addInstructions(method(context, "LX/02cp;", "attachBaseContext", CONTEXT), 0,
            "invoke-static/range {p1 .. p1}, " + ROOT + "Scale;->wrap(" + CONTEXT + ")" + CONTEXT + "\n"
            + "move-result-object p1");
    }

    private static void downloads(BytecodePatchContext context) {
        String acl = MODEL + "ACLCommonShare;";
        INS.addInstruction(method(context, acl, "getCode"), 1, "const/4 v0, 0x0");
        INS.addInstruction(method(context, acl, "getShowType"), 1, "const/4 v0, 0x2");
        INS.addInstructions(method(context, acl, "getTranscode"), 1,
            "invoke-static {v0}, " + PREFS + "->transcode(I)I\nmove-result v0");

        int patched = 0;
        for (MutableMethod target : context.mutableClassDefBy("LX/01Ac;").getMethods()) {
            if (target.getImplementation() == null) continue;
            for (int i = code(target).size() - 4; i >= 0; i--) {
                String camera = cameraBlock(code(target), i);
                if (camera == null) continue;
                int path = ((OneRegisterInstruction) code(target).get(i)).getRegisterA();
                int builder = ((FiveRegisterInstruction) code(target).get(i + 1)).getRegisterC();
                if (path > 15 || builder > 15) throw new IllegalStateException("Unexpected download registers");
                INS.removeInstructions(target, i, 4);
                INS.addInstructions(target, i, "invoke-static {}, " + PREFS + "->"
                    + (camera.endsWith("/") ? "downloadPathSlash" : "downloadPath") + "()" + STRING + "\n"
                    + "move-result-object v" + path + "\n"
                    + "invoke-virtual {v" + builder + ", v" + path + "}, Ljava/lang/StringBuilder;->append("
                    + STRING + ")Ljava/lang/StringBuilder;");
                patched++;
            }
        }
        if (patched == 0) throw new IllegalStateException("Download path code not found");
        System.out.println("download path sites: " + patched);
    }

    /** Matches: sget DIRECTORY_DCIM, append, const-string "/Camera[/]", append. */
    private static String cameraBlock(List<? extends Instruction> code, int i) {
        if (i + 3 >= code.size() || code.get(i).getOpcode() != Opcode.SGET_OBJECT
                || code.get(i + 1).getOpcode() != Opcode.INVOKE_VIRTUAL
                || code.get(i + 2).getOpcode() != Opcode.CONST_STRING
                || code.get(i + 3).getOpcode() != Opcode.INVOKE_VIRTUAL) return null;
        var field = ((ReferenceInstruction) code.get(i)).getReference();
        if (!(field instanceof FieldReference) || !((FieldReference) field).getName().equals("DIRECTORY_DCIM")) return null;
        String value = ((StringReference) ((ReferenceInstruction) code.get(i + 2)).getReference()).getString();
        return value.equals("/Camera") || value.equals("/Camera/") ? value : null;
    }

    private static void playback(BytecodePatchContext context) {
        INS.addInstruction(method(context, PANEL, "onViewCreated", "Landroid/view/View;", BUNDLE), 0,
            "invoke-static/range {p1 .. p1}, " + PLAYBACK + "->attachMute(Landroid/view/View;)V");
        INS.addInstruction(method(context, "Lcom/ss/android/ugc/aweme/feed/assem/music/mute/OpenOnMuteImpl;", "LJIJJ"), 0,
            "invoke-static {}, " + PLAYBACK + "->refreshMute()V");

        MutableMethod speedEvent = method(context, PANEL, "onFeedSpeedSelectedEvent", "LX/09fC;");
        int speedIndex = -1;
        for (int i = 0; i < code(speedEvent).size(); i++) {
            Instruction ins = code(speedEvent).get(i);
            if (ins instanceof ReferenceInstruction && ((ReferenceInstruction) ins).getReference() instanceof MethodReference
                    && ((MethodReference) ((ReferenceInstruction) ins).getReference()).getReturnType().equals("F")) {
                speedIndex = i + 1;
                break;
            }
        }
        if (speedIndex < 0 || code(speedEvent).get(speedIndex).getOpcode() != Opcode.MOVE_RESULT) {
            throw new IllegalStateException("Speed value not found");
        }
        int speed = ((OneRegisterInstruction) code(speedEvent).get(speedIndex)).getRegisterA();
        INS.addInstruction(speedEvent, speedIndex + 1, "invoke-static {v" + speed + "}, " + PLAYBACK + "->rememberSpeed(F)V");

        MutableMethod clearEvent = method(context,
            "Lcom/ss/android/ugc/feed/platform/panel/clearmode/ClearModePanelComponent;", "onClearModeEvent", "LX/0BvL;");
        int clearIndex = -1;
        for (int i = 0; i < code(clearEvent).size(); i++) {
            if (code(clearEvent).get(i).getOpcode() == Opcode.IGET_BOOLEAN) { clearIndex = i; break; }
        }
        if (clearIndex < 0) throw new IllegalStateException("Clear mode flag not found");
        int clear = ((TwoRegisterInstruction) code(clearEvent).get(clearIndex)).getRegisterA();
        INS.addInstruction(clearEvent, clearIndex + 1, "invoke-static {v" + clear + "}, " + PLAYBACK + "->rememberClear(Z)V");

        INS.addInstructions(method(context, PANEL, "onRenderFirstFrame", STRING), 0,
            "invoke-static {}, " + PLAYBACK + "->restoreClear()V\n"
            + "invoke-virtual {p0}, " + PANEL + "->LJII()" + AWEME + "\n"
            + "move-result-object v0\n"
            + "const/4 v1, 0x1\n"
            + "invoke-virtual {p0, v1}, " + PANEL + "->W7(Z)" + STRING + "\n"
            + "move-result-object v1\n"
            + "invoke-static {v0, v1}, " + PLAYBACK + "->applySpeed(" + AWEME + STRING + ")V");
    }

    private static void settings(BytecodePatchContext context) {
        String activity = "Lcom/bytedance/ies/ugc/aweme/commercialize/compliance/personalization/AdPersonalizationActivity;";
        // v0 is overwritten before it is read at each of these points in 47.7.1.
        MutableMethod create = method(context, activity, "onCreate", BUNDLE);
        guard(create, afterSuper(create), "invoke-static/range {p0 .. p0}, " + UI + "->open(Landroid/app/Activity;)V\n");
        for (String name : new String[]{"onResume", "onStop"}) {
            MutableMethod lifecycle = method(context, activity, name);
            guard(lifecycle, afterSuper(lifecycle), "");
        }
        guard(method(context, activity, "onBackPressed"), 0,
            "invoke-virtual/range {p0 .. p0}, Landroid/app/Activity;->finish()V\n");

        MutableMethod page = method(context, "Lcom/ss/android/ugc/aweme/setting/ui/rvmpcompose/SettingsComposeRvmpFragment;",
            "onCreateView", "Landroid/view/LayoutInflater;", "Landroid/view/ViewGroup;", BUNDLE);
        for (int index : returnIndexes(page)) {
            int view = ((OneRegisterInstruction) code(page).get(index)).getRegisterA();
            INS.addInstruction(page, index, "invoke-static/range {v" + view + " .. v" + view + "}, "
                + UI + "->attachButton(Landroid/view/View;)V");
        }
    }

    /** Runs code and returns, only when the activity was opened as the patch settings page. */
    private static void guard(MutableMethod target, int index, String code) {
        INS.addInstructionsWithLabels(target, index,
            "invoke-static/range {p0 .. p0}, " + UI + "->isSettings(Landroid/app/Activity;)Z\n"
                + "move-result v0\n"
                + "if-eqz v0, :original\n"
                + code
                + "return-void",
            new ExternalLabel("original", code(target).get(index)));
    }

    private static int afterSuper(MutableMethod method) {
        for (int i = 0; i < code(method).size(); i++) {
            if (code(method).get(i).getOpcode() == Opcode.INVOKE_SUPER) return i + 1;
        }
        throw new IllegalStateException("No super call in " + method.getName());
    }

    private static String invokeOne(int register, String owner, String name, String type) {
        return "invoke-static/range {v" + register + " .. v" + register + "}, " + owner + "->" + name + "(" + type + ")V";
    }
}
