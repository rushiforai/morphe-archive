package local.reddit;

import app.morphe.patcher.patch.*;
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass;
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod;
import com.android.tools.smali.dexlib2.Opcode;
import com.android.tools.smali.dexlib2.builder.Label;
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation;
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction11x;
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction21c;
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction21t;
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction22x;
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction35c;
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction3rc;
import com.android.tools.smali.dexlib2.iface.instruction.Instruction;
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction;
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction;
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction;
import com.android.tools.smali.dexlib2.iface.reference.MethodReference;
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableMethodReference;
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableTypeReference;
import java.io.InputStream;
import java.util.*;
import kotlin.Unit;

/** Opt-in vertical viewer for the currently loaded Reddit Home feed. */
public final class VerticalHomeFeedPatch {
    private static final String EXT = "Llocal/reddit/extension/VerticalHomeFeed;";
    private static BytecodePatch patch;
    private VerticalHomeFeedPatch() { }

    @SuppressWarnings({"unchecked", "deprecation"})
    public static synchronized BytecodePatch getVerticalHomeFeedPatch() {
        if (patch != null) return patch;
        patch = PatchKt.bytecodePatch("Reddit - Vertical home feed",
            "Adds a bottom bar button for a vertical Home feed viewer.", false,
            builder -> {
                builder.compatibleWith(new Compatibility("com.reddit.frontpage", "Reddit", null,
                    ApkFileType.APKM, 0xFF4500, null,
                    Collections.singletonList(new AppTarget("2026.14.0", false, 28)), false));
                builder.extendWith(VerticalHomeFeedPatch::extensionStream);
                builder.execute(context -> {
                    if (!"com.reddit.frontpage".equals(context.getPackageMetadata().getPackageName())
                        || !"2026.14.0".equals(context.getPackageMetadata().getVersionName()))
                        throw new IllegalStateException("Requires Reddit 2026.14.0");

                    MutableMethod mapper = one(context.mutableClassDefBy(
                        "Lcom/reddit/feeds/impl/data/mapper/link/d;"), "a", "Ljava/lang/Object;", 3);
                    int list = mapper.getImplementation().getRegisterCount() - 3;
                    mapper.getImplementation().addInstruction(0, new BuilderInstruction3rc(
                        Opcode.INVOKE_STATIC_RANGE, list, 1, ref("rememberLinks",
                            Collections.singletonList("Ljava/util/List;"), "V")));

                    MutableMethod linkId = one(context.mutableClassDefBy(
                        "Lcom/reddit/domain/model/Link;"), "getKindWithId", "Ljava/lang/String;", 0);
                    int link = linkId.getImplementation().getRegisterCount() - 1;
                    linkId.getImplementation().addInstruction(0, new BuilderInstruction3rc(
                        Opcode.INVOKE_STATIC_RANGE, link, 1, ref("rememberLink",
                            Collections.singletonList("Ljava/lang/Object;"), "V")));

                    MutableClass bottom = context.mutableClassDefBy(
                        "Lcom/reddit/launch/bottomnav/BottomNavScreen;");
                    for (String name : Arrays.asList("J5", "K5")) {
                        MutableMethod nav = one(bottom, name,
                            "J5".equals(name) ? "Lgp3/g;" : "Lgp3/c;", 1);
                        int self = nav.getImplementation().getRegisterCount() - 2;
                        nav.getImplementation().addInstruction(0, new BuilderInstruction3rc(
                            Opcode.INVOKE_STATIC_RANGE, self, 1, ref("initializeNav",
                                Collections.singletonList("Ljava/lang/Object;"), "V")));
                        List<Instruction> code = new ArrayList<>(nav.getImplementation().getInstructions());
                        int builds = 0;
                        for (int i = code.size() - 1; i >= 0; i--) {
                            Instruction ins = code.get(i);
                            if (!(ins instanceof ReferenceInstruction)
                                || !(ins instanceof FiveRegisterInstruction)
                                || !(((ReferenceInstruction) ins).getReference() instanceof MethodReference))
                                continue;
                            MethodReference method = (MethodReference) ((ReferenceInstruction) ins).getReference();
                            boolean match = "J5".equals(name)
                                ? "build".equals(method.getName())
                                    && method.getDefiningClass().contains("ListBuilder")
                                : "M".equals(method.getName())
                                    && "Lwe/w;".equals(method.getDefiningClass());
                            if (!match) continue;
                            int builderRegister = ((FiveRegisterInstruction) ins).getRegisterC();
                            BuilderInstruction35c hook = new BuilderInstruction35c(Opcode.INVOKE_STATIC, 1,
                                builderRegister, 0, 0, 0, 0,
                                ref("addButton", Collections.singletonList("Ljava/lang/Object;"), "V"));
                            if ("K5".equals(name)) {
                                // The final return in K5 is a jump target. Inserting before it
                                // leaves its label on w.M, so the new call is skipped. Replace
                                // the labelled instruction and append an equivalent original.
                                FiveRegisterInstruction original = (FiveRegisterInstruction) ins;
                                nav.getImplementation().replaceInstruction(i, hook);
                                nav.getImplementation().addInstruction(i + 1,
                                    new BuilderInstruction35c(ins.getOpcode(),
                                        original.getRegisterCount(), original.getRegisterC(),
                                        original.getRegisterD(), original.getRegisterE(),
                                        original.getRegisterF(), original.getRegisterG(),
                                        ((ReferenceInstruction) ins).getReference()));
                            } else {
                                nav.getImplementation().addInstruction(i, hook);
                            }
                            builds++;
                        }
                        if (builds != 1) throw new IllegalStateException("Bottom bar changed: " + name);
                    }

                    MutableMethod renderer = null;
                    for (MutableMethod method : context.mutableClassDefBy(
                        "Lcom/reddit/widget/bottomnav/f;").getMethods()) {
                        if (!"b".equals(method.getName()) || !"V".equals(method.getReturnType())
                            || method.getParameterTypes().size() != 13
                            || !"Lcom/reddit/widget/bottomnav/g;".contentEquals(method.getParameterTypes().get(0))
                            || !"Lkotlin/jvm/functions/Function0;".contentEquals(method.getParameterTypes().get(1)))
                            continue;
                        if (renderer != null) throw new IllegalStateException("Multiple bottom tab renderers");
                        renderer = method;
                    }
                    if (renderer == null || renderer.getImplementation() == null)
                        throw new IllegalStateException("Bottom tab renderer missing");
                    int descriptor = renderer.getImplementation().getRegisterCount() - parameterWords(renderer);
                    int clickLabel = descriptor + 2;
                    int icon = descriptor + 7;
                    int label = descriptor + 9;
                    if (descriptor < 2) throw new IllegalStateException("No bottom bar scratch registers");
                    renderer.getImplementation().addInstruction(0,
                        new BuilderInstruction22x(Opcode.MOVE_OBJECT_FROM16, 0, descriptor));
                    renderer.getImplementation().addInstruction(1,
                        new BuilderInstruction22x(Opcode.MOVE_OBJECT_FROM16, 1, clickLabel));
                    renderer.getImplementation().addInstruction(2,
                        new BuilderInstruction3rc(Opcode.INVOKE_STATIC_RANGE, 0, 2,
                            ref("tabLabel", Arrays.asList("Ljava/lang/Object;", "Ljava/lang/String;"),
                                "Ljava/lang/String;")));
                    renderer.getImplementation().addInstruction(3,
                        new BuilderInstruction11x(Opcode.MOVE_RESULT_OBJECT, clickLabel));
                    renderer.getImplementation().addInstruction(4,
                        new BuilderInstruction22x(Opcode.MOVE_OBJECT_FROM16, 0, descriptor));
                    renderer.getImplementation().addInstruction(5,
                        new BuilderInstruction22x(Opcode.MOVE_OBJECT_FROM16, 1, icon));
                    renderer.getImplementation().addInstruction(6,
                        new BuilderInstruction3rc(Opcode.INVOKE_STATIC_RANGE, 0, 2,
                            ref("tabIcon", Arrays.asList("Ljava/lang/Object;",
                                "Lkotlin/jvm/functions/Function2;"),
                                "Lkotlin/jvm/functions/Function2;")));
                    renderer.getImplementation().addInstruction(7,
                        new BuilderInstruction11x(Opcode.MOVE_RESULT_OBJECT, icon));
                    renderer.getImplementation().addInstruction(8,
                        new BuilderInstruction22x(Opcode.MOVE_OBJECT_FROM16, 0, descriptor));
                    renderer.getImplementation().addInstruction(9,
                        new BuilderInstruction22x(Opcode.MOVE_OBJECT_FROM16, 1, label));
                    renderer.getImplementation().addInstruction(10,
                        new BuilderInstruction3rc(Opcode.INVOKE_STATIC_RANGE, 0, 2,
                            ref("tabText", Arrays.asList("Ljava/lang/Object;",
                                "Lkotlin/jvm/functions/Function2;"),
                                "Lkotlin/jvm/functions/Function2;")));
                    renderer.getImplementation().addInstruction(11,
                        new BuilderInstruction11x(Opcode.MOVE_RESULT_OBJECT, label));
                    renderer.getImplementation().addInstruction(12,
                        new BuilderInstruction3rc(Opcode.INVOKE_STATIC_RANGE, descriptor, 2,
                            ref("wrapClick", Arrays.asList("Ljava/lang/Object;",
                                "Lkotlin/jvm/functions/Function0;"),
                                "Lkotlin/jvm/functions/Function0;")));
                    renderer.getImplementation().addInstruction(13,
                        new BuilderInstruction11x(Opcode.MOVE_RESULT_OBJECT, descriptor + 1));

                    String viewer = "Lcom/reddit/frontpage/presentation/listing/linkpager/refactor/PostDetailPagerScreen;";
                    hookScreen(context.mutableClassDefBy(viewer), "n5", "pagerAttached");
                    hookView(context.mutableClassDefBy(viewer), "c4", "pagerAttached");
                    hookView(context.mutableClassDefBy(viewer), "l4", "pagerDetached");

                    MutableMethod pager = one(context.mutableClassDefBy(
                        "Lcom/reddit/ui/compose/pager/h;"), "b", "V", 11);
                    MutableMethodImplementation pagerImpl = pager.getImplementation();
                    int orientation = pagerImpl.getRegisterCount() - 10;
                    pagerImpl.addInstruction(0, new BuilderInstruction3rc(Opcode.INVOKE_STATIC_RANGE,
                        orientation, 1, ref("chooseOrientation",
                            Collections.singletonList("Ljava/lang/Object;"), "Ljava/lang/Object;")));
                    pagerImpl.addInstruction(1, new BuilderInstruction11x(Opcode.MOVE_RESULT_OBJECT, orientation));
                    pagerImpl.addInstruction(2, new BuilderInstruction21c(Opcode.CHECK_CAST, orientation,
                        new ImmutableTypeReference("Landroidx/compose/foundation/gestures/Orientation;")));

                    for (String name : Arrays.asList("c", "d")) {
                        MutableMethod page = one(context.mutableClassDefBy(
                            "Lcom/reddit/frontpage/presentation/listing/linkpager/refactor/q0;"),
                            name, "Ljava/lang/Object;", 2);
                        MutableMethodImplementation impl = page.getImplementation();
                        int self = impl.getRegisterCount() - 3;
                        Label original = impl.newLabelForIndex(0);
                        impl.addInstruction(0, new BuilderInstruction3rc(Opcode.INVOKE_STATIC_RANGE,
                            self, 2, ref("page", Arrays.asList("Ljava/lang/Object;", "Ljava/lang/String;"),
                                "Ljava/lang/Object;")));
                        impl.addInstruction(1, new BuilderInstruction11x(Opcode.MOVE_RESULT_OBJECT, 0));
                        impl.addInstruction(2, new BuilderInstruction21t(Opcode.IF_EQZ, 0, original));
                        impl.addInstruction(3, new BuilderInstruction11x(Opcode.RETURN_OBJECT, 0));
                    }

                    // The improved initial-page path skips q0.c entirely. Keep this
                    // viewer on the standard provider, which consumes our snapshot.
                    for (String name : Arrays.asList("a", "b")) {
                        MutableMethod method = one(context.mutableClassDefBy(
                            "Lcom/reddit/frontpage/presentation/listing/linkpager/refactor/q0;"),
                            name, "Ljava/lang/Object;", 1);
                        MutableMethodImplementation impl = method.getImplementation();
                        List<Instruction> code = new ArrayList<>(impl.getInstructions());
                        int hits = 0;
                        for (int i = code.size() - 2; i >= 0; i--) {
                            Instruction ins = code.get(i);
                            if (!(ins instanceof ReferenceInstruction)
                                || !(((ReferenceInstruction) ins).getReference() instanceof MethodReference)
                                || !"booleanValue".equals(((MethodReference)
                                    ((ReferenceInstruction) ins).getReference()).getName())
                                || code.get(i + 1).getOpcode() != Opcode.MOVE_RESULT) continue;
                            int result = ((OneRegisterInstruction) code.get(i + 1)).getRegisterA();
                            int self = impl.getRegisterCount() - 2;
                            impl.addInstruction(i + 2, new BuilderInstruction35c(Opcode.INVOKE_STATIC,
                                2, self, result, 0, 0, 0,
                                ref("useImprovedProvider", Arrays.asList("Ljava/lang/Object;", "Z"), "Z")));
                            impl.addInstruction(i + 3, new BuilderInstruction11x(Opcode.MOVE_RESULT, result));
                            hits++;
                        }
                        if (hits != 1) throw new IllegalStateException("Provider flag changed: " + name);
                    }

                    MutableMethod scroll = one(context.mutableClassDefBy(
                        "Lcom/reddit/feeds/impl/ui/actions/d1;"), "b", "Ljava/lang/Object;", 3);
                    int scrollSelf = scroll.getImplementation().getRegisterCount() - 4;
                    scroll.getImplementation().addInstruction(0, new BuilderInstruction3rc(
                        Opcode.INVOKE_STATIC_RANGE, scrollSelf, 2, ref("rememberPosition",
                            Arrays.asList("Ljava/lang/Object;", "Ljava/lang/Object;"), "V")));

                    MutableClass dataSource = context.mutableClassDefBy("Lcom/reddit/fullbleedplayer/data/j;");
                    MutableMethod update = one(dataSource, "l", "V", 1);
                    int updateSelf = update.getImplementation().getRegisterCount() - 2;
                    update.getImplementation().addInstruction(0, new BuilderInstruction3rc(
                        Opcode.INVOKE_STATIC_RANGE, updateSelf, 2, ref("wrapUpdate",
                            Arrays.asList("Ljava/lang/Object;", "Lkotlin/jvm/functions/Function1;"),
                            "Lkotlin/jvm/functions/Function1;")));
                    update.getImplementation().addInstruction(1,
                        new BuilderInstruction11x(Opcode.MOVE_RESULT_OBJECT, updateSelf + 1));

                    MutableMethod more = one(dataSource, "b", "Ljava/lang/Object;", 4);
                    MutableMethodImplementation moreImpl = more.getImplementation();
                    int moreSource = moreImpl.getRegisterCount() - 4;
                    Label normalMore = moreImpl.newLabelForIndex(0);
                    moreImpl.addInstruction(0, new BuilderInstruction3rc(Opcode.INVOKE_STATIC_RANGE,
                        moreSource, 1, ref("loadMore", Collections.singletonList("Ljava/lang/Object;"), "Z")));
                    moreImpl.addInstruction(1, new BuilderInstruction11x(Opcode.MOVE_RESULT, 0));
                    moreImpl.addInstruction(2, new BuilderInstruction21t(Opcode.IF_EQZ, 0, normalMore));
                    moreImpl.addInstruction(3, new BuilderInstruction35c(Opcode.INVOKE_STATIC, 0,
                        0, 0, 0, 0, 0, ref("completed", Collections.emptyList(), "Ljava/lang/Object;")));
                    moreImpl.addInstruction(4, new BuilderInstruction11x(Opcode.MOVE_RESULT_OBJECT, 0));
                    moreImpl.addInstruction(5, new BuilderInstruction11x(Opcode.RETURN_OBJECT, 0));

                    MutableMethod initial = one(context.mutableClassDefBy(
                        "Lcom/reddit/fullbleedplayer/data/j;"), "a", "Ljava/lang/Object;", 4);
                    MutableMethodImplementation initialImpl = initial.getImplementation();
                    List<Instruction> initialCode = new ArrayList<>(initialImpl.getInstructions());
                    int seedHooks = 0;
                    for (int i = initialCode.size() - 1; i >= 0; i--) {
                        Instruction ins = initialCode.get(i);
                        if (ins.getOpcode() != Opcode.CHECK_CAST
                            || !(ins instanceof ReferenceInstruction)
                            || !"Lcom/reddit/fullbleedplayer/data/q;".equals(
                                ((ReferenceInstruction) ins).getReference().toString())
                            || i + 1 >= initialCode.size()
                            || initialCode.get(i + 1).getOpcode() != Opcode.INSTANCE_OF
                            || !(initialCode.get(i + 1) instanceof ReferenceInstruction)
                            || !"Lcom/reddit/fullbleedplayer/data/o;".equals(
                                ((ReferenceInstruction) initialCode.get(i + 1)).getReference().toString()))
                            continue;
                        int dataset = ((OneRegisterInstruction) ins).getRegisterA();
                        int source = initialImpl.getRegisterCount() - 4;
                        initialImpl.addInstruction(i + 1, new BuilderInstruction35c(Opcode.INVOKE_STATIC,
                            2, source, dataset, 0, 0, 0,
                            ref("initialMedia", Arrays.asList("Ljava/lang/Object;", "Ljava/lang/Object;"),
                                "Ljava/lang/Object;")));
                        initialImpl.addInstruction(i + 2,
                            new BuilderInstruction11x(Opcode.MOVE_RESULT_OBJECT, dataset));
                        initialImpl.addInstruction(i + 3, new BuilderInstruction21c(Opcode.CHECK_CAST,
                            dataset, new ImmutableTypeReference("Lcom/reddit/fullbleedplayer/data/q;")));
                        seedHooks++;
                    }
                    if (seedHooks != 1) throw new IllegalStateException("Full bleed initial loader changed: " + seedHooks);

                    MutableMethod chrome = one(context.mutableClassDefBy(
                        "Lcom/reddit/fullbleedplayer/data/r;"), "d", "Lcom/reddit/fullbleedplayer/ui/p;", 4);
                    MutableMethodImplementation chromeImpl = chrome.getImplementation();
                    List<Instruction> chromeCode = new ArrayList<>(chromeImpl.getInstructions());
                    int chromeHooks = 0;
                    for (int i = chromeCode.size() - 1; i >= 0; i--) {
                        Instruction ins = chromeCode.get(i);
                        if (ins.getOpcode() != Opcode.RETURN_OBJECT) continue;
                        int result = ((OneRegisterInstruction) ins).getRegisterA();
                        int self = chromeImpl.getRegisterCount() - 5;
                        if (self < 2) throw new IllegalStateException("No chrome scratch registers");
                        chromeImpl.replaceInstruction(i,
                            new BuilderInstruction22x(Opcode.MOVE_OBJECT_FROM16, 1, result));
                        chromeImpl.addInstruction(i + 1,
                            new BuilderInstruction22x(Opcode.MOVE_OBJECT_FROM16, 0, self));
                        chromeImpl.addInstruction(i + 2,
                            new BuilderInstruction3rc(Opcode.INVOKE_STATIC_RANGE, 0, 2,
                                ref("initialChrome", Arrays.asList("Ljava/lang/Object;",
                                    "Ljava/lang/Object;"), "Ljava/lang/Object;")));
                        chromeImpl.addInstruction(i + 3,
                            new BuilderInstruction11x(Opcode.MOVE_RESULT_OBJECT, result));
                        chromeImpl.addInstruction(i + 4, new BuilderInstruction21c(Opcode.CHECK_CAST,
                            result, new ImmutableTypeReference("Lcom/reddit/fullbleedplayer/ui/p;")));
                        chromeImpl.addInstruction(i + 5,
                            new BuilderInstruction11x(Opcode.RETURN_OBJECT, result));
                        chromeHooks++;
                    }
                    if (chromeHooks != 1) throw new IllegalStateException("Full bleed chrome mapper changed: " + chromeHooks);

                    MutableMethod viewState = one(context.mutableClassDefBy(
                        "Lcom/reddit/fullbleedplayer/ui/FullBleedViewModel;"),
                        "L", "Ljava/lang/Object;", 1);
                    MutableMethodImplementation viewImpl = viewState.getImplementation();
                    List<Instruction> viewCode = new ArrayList<>(viewImpl.getInstructions());
                    int viewHooks = 0;
                    for (int i = viewCode.size() - 1; i >= 0; i--) {
                        Instruction ins = viewCode.get(i);
                        if (ins.getOpcode() != Opcode.RETURN_OBJECT) continue;
                        int state = ((OneRegisterInstruction) ins).getRegisterA();
                        int self = viewImpl.getRegisterCount() - 2;
                        if (self < 2) throw new IllegalStateException("No view state scratch registers");
                        viewImpl.replaceInstruction(i,
                            new BuilderInstruction22x(Opcode.MOVE_OBJECT_FROM16, 0, self));
                        viewImpl.addInstruction(i + 1,
                            new BuilderInstruction22x(Opcode.MOVE_OBJECT_FROM16, 1, state));
                        viewImpl.addInstruction(i + 2,
                            new BuilderInstruction3rc(Opcode.INVOKE_STATIC_RANGE, 0, 2,
                                ref("verticalViewState", Arrays.asList("Ljava/lang/Object;",
                                    "Ljava/lang/Object;"), "Ljava/lang/Object;")));
                        viewImpl.addInstruction(i + 3,
                            new BuilderInstruction11x(Opcode.MOVE_RESULT_OBJECT, state));
                        viewImpl.addInstruction(i + 4,
                            new BuilderInstruction11x(Opcode.RETURN_OBJECT, state));
                        viewHooks++;
                    }
                    if (viewHooks != 1) throw new IllegalStateException("Full bleed view state changed: " + viewHooks);
                    return Unit.INSTANCE;
                });
                return Unit.INSTANCE;
            });
        return patch;
    }

    private static int parameterWords(MutableMethod method) {
        int result = 0;
        for (CharSequence p : method.getParameterTypes())
            result += ("J".contentEquals(p) || "D".contentEquals(p)) ? 2 : 1;
        return result;
    }

    private static void hookScreen(MutableClass type,
                                   String method, String hook) {
        MutableMethod target = one(type, method, "V", 0);
        int self = target.getImplementation().getRegisterCount() - 1;
        target.getImplementation().addInstruction(0, new BuilderInstruction3rc(Opcode.INVOKE_STATIC_RANGE,
            self, 1, ref(hook, Collections.singletonList("Ljava/lang/Object;"), "V")));
    }

    private static void hookView(MutableClass type,
                                 String method, String hook) {
        MutableMethod target = one(type, method, "V", 1);
        int self = target.getImplementation().getRegisterCount() - 2;
        target.getImplementation().addInstruction(0, new BuilderInstruction3rc(Opcode.INVOKE_STATIC_RANGE,
            self, 1, ref(hook, Collections.singletonList("Ljava/lang/Object;"), "V")));
    }

    private static MutableMethod one(MutableClass type,
                                     String name, String result, int args) {
        MutableMethod found = null;
        for (MutableMethod method : type.getMethods()) {
            if (!name.equals(method.getName()) || !result.equals(method.getReturnType())
                || method.getParameterTypes().size() != args || method.getImplementation() == null)
                continue;
            if (found != null) throw new IllegalStateException("Ambiguous " + type.getType() + name);
            found = method;
        }
        if (found == null) throw new IllegalStateException("Missing " + type.getType() + name);
        return found;
    }

    private static ImmutableMethodReference ref(String name, List<String> parameters, String result) {
        return new ImmutableMethodReference(EXT, name, parameters, result);
    }

    private static InputStream extensionStream() {
        InputStream stream = VerticalHomeFeedPatch.class.getClassLoader()
            .getResourceAsStream("extensions/vertical-home-feed.mpe");
        if (stream == null) throw new IllegalStateException("Missing vertical-home-feed.mpe");
        return stream;
    }
}
