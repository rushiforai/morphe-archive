package local.reddit;

import app.morphe.patcher.patch.*;
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass;
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod;
import com.android.tools.smali.dexlib2.Opcode;
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction11x;
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction21c;
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction3rc;
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction35c;
import com.android.tools.smali.dexlib2.builder.BuilderInstruction;
import com.android.tools.smali.dexlib2.iface.instruction.*;
import com.android.tools.smali.dexlib2.iface.reference.MethodReference;
import com.android.tools.smali.dexlib2.iface.reference.TypeReference;
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableMethodReference;
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableTypeReference;
import java.io.InputStream;
import java.util.*;
import kotlin.Unit;

/** Reddit 2026.14.0 only. Keep fingerprints strict so a changed APK fails closed. */
public final class RedditModePatch {
    private static final String VERSION = "2026.14.0";
    private static final String EXT = "Llocal/reddit/extension/RedditMode;";
    private static final String NAV = "Lcom/reddit/launch/bottomnav/BottomNavScreen;";
    private static BytecodePatch patch;
    private RedditModePatch() {}

    @SuppressWarnings({"unchecked", "deprecation"})
    public static synchronized BytecodePatch getRedditModePatch() {
        if (patch != null) return patch;
        patch = PatchKt.bytecodePatch("Reddit - NSFW mode",
            "Shows only NSFW posts when on and only non-NSFW posts when off.",
            false, builder -> {
                builder.compatibleWith(new Compatibility("com.reddit.frontpage", "Reddit", null,
                    ApkFileType.APKM, 0xFF4500, null,
                    Collections.singletonList(new AppTarget(VERSION, false, 28)), false));
                builder.extendWith(RedditModePatch::extensionStream);
                builder.execute(context -> {
                    if (!"com.reddit.frontpage".equals(context.getPackageMetadata().getPackageName())
                        || !VERSION.equals(context.getPackageMetadata().getVersionName()))
                        throw new IllegalStateException("Requires Reddit " + VERSION);

                    MutableMethod children = one(context.mutableClassDefBy(
                        "Lcom/reddit/domain/model/listing/Listing;"), "getChildren", "Ljava/util/List;", 0);
                    List<Instruction> code = new ArrayList<>(children.getImplementation().getInstructions());
                    int hooked = 0;
                    for (int i = code.size() - 1; i >= 0; i--) {
                        Instruction ins = code.get(i);
                        if (ins.getOpcode() != Opcode.RETURN_OBJECT) continue;
                        int r = ((OneRegisterInstruction) ins).getRegisterA();
                        children.getImplementation().addInstruction(i,
                            call(EXT, "filterListing", "Ljava/util/List;",
                                Collections.singletonList("Ljava/util/List;"), r));
                        children.getImplementation().addInstruction(i + 1,
                            new BuilderInstruction11x(Opcode.MOVE_RESULT_OBJECT, r));
                        hooked++;
                    }
                    if (hooked != 1) throw new IllegalStateException("Listing.getChildren shape changed");

                    MutableMethod converter = one(context.mutableClassDefBy(
                        "Lcom/reddit/achievements/profile/t;"), "l",
                        "Lcom/reddit/feeds/ui/composables/g;", 1);
                    List<Instruction> converterCode = new ArrayList<>(converter.getImplementation().getInstructions());
                    int converted = 0;
                    for (int i = converterCode.size() - 2; i >= 0; i--) {
                        Instruction ins = converterCode.get(i);
                        if (ins.getOpcode() != Opcode.INVOKE_INTERFACE || !(ins instanceof FiveRegisterInstruction)
                            || !(ins instanceof ReferenceInstruction)) continue;
                        Object ref = ((ReferenceInstruction) ins).getReference();
                        if (!(ref instanceof MethodReference)
                            || !"Lxn1/a;".equals(((MethodReference) ref).getDefiningClass())
                            || !"a".equals(((MethodReference) ref).getName())
                            || converterCode.get(i + 1).getOpcode() != Opcode.MOVE_RESULT_OBJECT) continue;
                        int element = ((FiveRegisterInstruction) ins).getRegisterE();
                        int result = ((OneRegisterInstruction) converterCode.get(i + 1)).getRegisterA();
                        converter.getImplementation().addInstruction(i + 2,
                            new BuilderInstruction35c(Opcode.INVOKE_STATIC, 2, element, result, 0, 0, 0,
                                new ImmutableMethodReference(EXT, "filterConverted",
                                    Arrays.asList("Ljava/lang/Object;", "Ljava/lang/Object;"), "Ljava/lang/Object;")));
                        converter.getImplementation().addInstruction(i + 3,
                            new BuilderInstruction11x(Opcode.MOVE_RESULT_OBJECT, result));
                        converter.getImplementation().addInstruction(i + 4,
                            new BuilderInstruction21c(Opcode.CHECK_CAST, result,
                                new ImmutableTypeReference("Lcom/reddit/feeds/ui/composables/g;")));
                        converted++;
                    }
                    if (converted != 1) throw new IllegalStateException("Feed converter shape changed: " + converted);

                    MutableMethod nav = one(context.mutableClassDefBy(NAV), "J5", "Lgp3/g;", 1);
                    int resources = nav.getImplementation().getRegisterCount() - 1;
                    nav.getImplementation().addInstruction(0,
                        new BuilderInstruction3rc(Opcode.INVOKE_STATIC_RANGE, resources - 1, 2,
                            new ImmutableMethodReference(EXT, "initialize",
                                Arrays.asList("Ljava/lang/Object;", "Landroid/content/res/Resources;"), "V")));
                    List<Instruction> navCode = new ArrayList<>(nav.getImplementation().getInstructions());
                    int builds = 0;
                    for (int i = navCode.size() - 1; i >= 0; i--) {
                        Instruction ins = navCode.get(i);
                        if (!(ins instanceof ReferenceInstruction) || !(ins instanceof FiveRegisterInstruction)) continue;
                        Object ref = ((ReferenceInstruction) ins).getReference();
                        if (!(ref instanceof MethodReference) || !"build".equals(((MethodReference) ref).getName())
                            || !((MethodReference) ref).getDefiningClass().contains("ListBuilder")) continue;
                        int list = ((FiveRegisterInstruction) ins).getRegisterC();
                        nav.getImplementation().addInstruction(i,
                            call(EXT, "addButton", "V",
                                Collections.singletonList("Ljava/lang/Object;"), list));
                        builds++;
                    }
                    if (builds != 1) throw new IllegalStateException("Bottom bar builder shape changed: " + builds);

                    MutableMethod modern = one(context.mutableClassDefBy(NAV), "K5", "Lgp3/c;", 1);
                    int modernThis = modern.getImplementation().getRegisterCount() - 2;
                    modern.getImplementation().addInstruction(0,
                        call(EXT, "initializeModern", "V",
                            Collections.singletonList("Ljava/lang/Object;"), modernThis));
                    List<Instruction> modernCode = new ArrayList<>(modern.getImplementation().getInstructions());
                    int models = 0;
                    for (int i = modernCode.size() - 1; i >= 0; i--) {
                        Instruction ins = modernCode.get(i);
                        if (ins.getOpcode() != Opcode.CHECK_CAST || !(ins instanceof ReferenceInstruction)) continue;
                        Object ref = ((ReferenceInstruction) ins).getReference();
                        if (!(ref instanceof TypeReference) || !"Lmv1/a;".equals(((TypeReference) ref).getType())) continue;
                        int model = ((OneRegisterInstruction) ins).getRegisterA();
                        modern.getImplementation().addInstruction(i + 1,
                            call(EXT, "replaceModernTab", "Ljava/lang/Object;",
                                Collections.singletonList("Ljava/lang/Object;"), model));
                        modern.getImplementation().addInstruction(i + 2,
                            new BuilderInstruction11x(Opcode.MOVE_RESULT_OBJECT, model));
                        modern.getImplementation().addInstruction(i + 3,
                            new BuilderInstruction21c(Opcode.CHECK_CAST, model,
                                new ImmutableTypeReference("Lmv1/a;")));
                        models++;
                    }
                    if (models != 1) throw new IllegalStateException("Modern bottom bar model shape changed: " + models);

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
                    renderer.getImplementation().addInstruction(0,
                        new BuilderInstruction3rc(Opcode.INVOKE_STATIC_RANGE, descriptor, 4,
                            new ImmutableMethodReference(EXT, "selected",
                                Arrays.asList("Ljava/lang/Object;", "Lkotlin/jvm/functions/Function0;",
                                    "Ljava/lang/String;", "Z"), "Z")));
                    renderer.getImplementation().addInstruction(1,
                        new BuilderInstruction11x(Opcode.MOVE_RESULT, descriptor + 3));
                    renderer.getImplementation().addInstruction(2,
                        new BuilderInstruction3rc(Opcode.INVOKE_STATIC_RANGE, descriptor, 2,
                            new ImmutableMethodReference(EXT, "wrapClick",
                                Arrays.asList("Ljava/lang/Object;", "Lkotlin/jvm/functions/Function0;"),
                                "Lkotlin/jvm/functions/Function0;")));
                    renderer.getImplementation().addInstruction(3,
                        new BuilderInstruction11x(Opcode.MOVE_RESULT_OBJECT, descriptor + 1));

                    MutableClass repository = context.mutableClassDefBy("Lcom/reddit/account/repository/c;");
                    MutableMethod repositoryInit = null;
                    for (MutableMethod method : repository.getMethods())
                        if ("<init>".equals(method.getName()) && method.getImplementation() != null) {
                            if (repositoryInit != null) throw new IllegalStateException("Multiple repository constructors");
                            repositoryInit = method;
                        }
                    if (repositoryInit == null) throw new IllegalStateException("Preference repository constructor missing");
                    int repoThis = repositoryInit.getImplementation().getRegisterCount()
                        - parameterWords(repositoryInit) - 1;
                    beforeReturns(repositoryInit, call(EXT, "rememberRepository", "V",
                        Collections.singletonList("Ljava/lang/Object;"), repoThis));
                    return Unit.INSTANCE;
                });
                return Unit.INSTANCE;
            });
        return patch;
    }

    private static int parameterWords(MutableMethod method) {
        int result = 0;
        for (CharSequence p : method.getParameterTypes()) result += ("J".contentEquals(p) || "D".contentEquals(p)) ? 2 : 1;
        return result;
    }

    private static MutableMethod one(MutableClass owner, String name, String returns, int params) {
        MutableMethod found = null;
        for (MutableMethod method : owner.getMethods())
            if (name.equals(method.getName()) && returns.equals(method.getReturnType())
                && method.getParameterTypes().size() == params && method.getImplementation() != null) {
                if (found != null) throw new IllegalStateException("Ambiguous " + owner.getType() + "->" + name);
                found = method;
            }
        if (found == null) throw new IllegalStateException("Missing " + owner.getType() + "->" + name);
        return found;
    }

    private static void beforeReturns(MutableMethod method, BuilderInstruction3rc call) {
        List<Instruction> code = new ArrayList<>(method.getImplementation().getInstructions());
        int count = 0;
        for (int i = code.size() - 1; i >= 0; i--)
            if (code.get(i).getOpcode() == Opcode.RETURN_VOID) {
                method.getImplementation().addInstruction(i, call);
                count++;
            }
        if (count == 0) throw new IllegalStateException("No return in " + method.getName());
    }

    private static BuilderInstruction3rc call(String owner, String name, String returns,
                                               List<String> params, int register) {
        return new BuilderInstruction3rc(Opcode.INVOKE_STATIC_RANGE, register, 1,
            new ImmutableMethodReference(owner, name, params, returns));
    }

    private static InputStream extensionStream() {
        InputStream stream = RedditModePatch.class.getClassLoader()
            .getResourceAsStream("extensions/reddit-mode.mpe");
        if (stream == null) throw new IllegalStateException("Missing reddit-mode.mpe");
        return stream;
    }
}
