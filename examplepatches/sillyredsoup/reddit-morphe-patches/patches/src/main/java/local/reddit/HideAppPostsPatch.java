package local.reddit;

import app.morphe.patcher.patch.*;
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod;
import com.android.tools.smali.dexlib2.Opcode;
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction11x;
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction3rc;
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction35c;
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction21c;
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableTypeReference;
import com.android.tools.smali.dexlib2.iface.instruction.Instruction;
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction;
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction;
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction;
import com.android.tools.smali.dexlib2.iface.reference.MethodReference;
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableMethodReference;
import java.io.InputStream;
import java.util.*;
import kotlin.Unit;

/** Removes Dev Platform app posts from legacy and modern feeds in Reddit 2026.14.0. */
public final class HideAppPostsPatch {
    private static BytecodePatch patch;
    private HideAppPostsPatch() {}

    @SuppressWarnings({"unchecked", "deprecation"})
    public static synchronized BytecodePatch getHideAppPostsPatch() {
        if (patch != null) return patch;
        patch = PatchKt.bytecodePatch("Reddit - Hide app posts",
            "Hides interactive app and game posts in feeds.", false, builder -> {
                builder.compatibleWith(new Compatibility("com.reddit.frontpage", "Reddit", null,
                    ApkFileType.APKM, 0xFF4500, null,
                    Collections.singletonList(new AppTarget("2026.14.0", false, 28)), false));
                builder.extendWith(HideAppPostsPatch::extensionStream);
                builder.execute(context -> {
                    if (!"com.reddit.frontpage".equals(context.getPackageMetadata().getPackageName())
                        || !"2026.14.0".equals(context.getPackageMetadata().getVersionName()))
                        throw new IllegalStateException("Requires Reddit 2026.14.0");
                    MutableMethod children = null;
                    for (MutableMethod method : context.mutableClassDefBy(
                        "Lcom/reddit/domain/model/listing/Listing;").getMethods())
                        if ("getChildren".equals(method.getName())
                            && "Ljava/util/List;".equals(method.getReturnType())
                            && method.getParameterTypes().isEmpty() && method.getImplementation() != null) {
                            if (children != null) throw new IllegalStateException("Ambiguous Listing.getChildren");
                            children = method;
                        }
                    if (children == null) throw new IllegalStateException("Missing Listing.getChildren");
                    List<Instruction> code = new ArrayList<>(children.getImplementation().getInstructions());
                    int hooked = 0;
                    for (int i = code.size() - 1; i >= 0; i--) {
                        Instruction ins = code.get(i);
                        if (ins.getOpcode() != Opcode.RETURN_OBJECT) continue;
                        int r = ((OneRegisterInstruction) ins).getRegisterA();
                        children.getImplementation().addInstruction(i,
                            new BuilderInstruction3rc(Opcode.INVOKE_STATIC_RANGE, r, 1,
                                new ImmutableMethodReference("Llocal/reddit/extension/AppPostFilter;",
                                    "filterListing", Collections.singletonList("Ljava/util/List;"),
                                    "Ljava/util/List;")));
                        children.getImplementation().addInstruction(i + 1,
                            new BuilderInstruction11x(Opcode.MOVE_RESULT_OBJECT, r));
                        hooked++;
                    }
                    if (hooked != 1) throw new IllegalStateException("Listing.getChildren shape changed");

                    MutableMethod converter = one(context.mutableClassDefBy(
                        "Lcom/reddit/achievements/profile/t;"), "l", "Lcom/reddit/feeds/ui/composables/g;", 1);
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
                                new ImmutableMethodReference("Llocal/reddit/extension/AppPostFilter;", "filterConverted",
                                    Arrays.asList("Ljava/lang/Object;", "Ljava/lang/Object;"), "Ljava/lang/Object;")));
                        converter.getImplementation().addInstruction(i + 3,
                            new BuilderInstruction11x(Opcode.MOVE_RESULT_OBJECT, result));
                        converter.getImplementation().addInstruction(i + 4,
                            new BuilderInstruction21c(Opcode.CHECK_CAST, result,
                                new ImmutableTypeReference("Lcom/reddit/feeds/ui/composables/g;")));
                        converted++;
                    }
                    if (converted != 1) throw new IllegalStateException("Feed converter shape changed: " + converted);

                    MutableMethod application = one(context.mutableClassDefBy(
                        "Lcom/reddit/frontpage/FrontpageApplication;"), "onCreate", "V", 0);
                    application.getImplementation().addInstruction(0,
                        new BuilderInstruction3rc(Opcode.INVOKE_STATIC_RANGE,
                            application.getImplementation().getRegisterCount() - 1, 1,
                            new ImmutableMethodReference("Llocal/reddit/extension/AppPostFilter;", "initialize",
                                Collections.singletonList("Landroid/content/Context;"), "V")));

                    MutableMethod settings = null;
                    for (MutableMethod method : context.mutableClassDefBy(
                        "Lapp/morphe/extension/reddit/settings/preference/RedditPreferenceFragment;").getMethods())
                        if ("initialize".equals(method.getName()) && "V".equals(method.getReturnType())
                            && method.getParameterTypes().isEmpty() && method.getImplementation() != null) {
                            if (settings != null) throw new IllegalStateException("Ambiguous Morphe settings initializer");
                            settings = method;
                        }
                    if (settings == null) throw new IllegalStateException("Missing Morphe settings initializer");
                    List<Instruction> settingsCode = new ArrayList<>(settings.getImplementation().getInstructions());
                    int screen = -1;
                    for (Instruction ins : settingsCode) {
                        if (!(ins instanceof ReferenceInstruction) || !(ins instanceof FiveRegisterInstruction)) continue;
                        Object ref = ((ReferenceInstruction) ins).getReference();
                        if (ref instanceof MethodReference && "setPreferenceScreen".equals(((MethodReference) ref).getName())) {
                            if (screen != -1) throw new IllegalStateException("Multiple preference screens");
                            screen = ((FiveRegisterInstruction) ins).getRegisterD();
                        }
                    }
                    if (screen == -1) throw new IllegalStateException("Missing preference screen");
                    int settingHooks = 0;
                    for (int i = settingsCode.size() - 1; i >= 0; i--) {
                        if (settingsCode.get(i).getOpcode() != Opcode.RETURN_VOID) continue;
                        settings.getImplementation().addInstruction(i,
                            new BuilderInstruction3rc(Opcode.INVOKE_STATIC_RANGE, screen, 1,
                                new ImmutableMethodReference("Llocal/reddit/extension/AppPostFilter;", "addSetting",
                                    Collections.singletonList("Ljava/lang/Object;"), "V")));
                        settingHooks++;
                    }
                    if (settingHooks != 1) throw new IllegalStateException("Morphe settings initializer changed");
                    return Unit.INSTANCE;
                });
                return Unit.INSTANCE;
            });
        return patch;
    }

    private static MutableMethod one(app.morphe.patcher.util.proxy.mutableTypes.MutableClass type,
                                     String name, String returns, int parameters) {
        MutableMethod found = null;
        for (MutableMethod method : type.getMethods())
            if (name.equals(method.getName()) && returns.equals(method.getReturnType())
                    && method.getParameterTypes().size() == parameters && method.getImplementation() != null) {
                if (found != null) throw new IllegalStateException("Ambiguous " + name);
                found = method;
            }
        if (found == null) throw new IllegalStateException("Missing " + name);
        return found;
    }

    private static InputStream extensionStream() {
        InputStream stream = HideAppPostsPatch.class.getClassLoader()
            .getResourceAsStream("extensions/hide-app-posts.mpe");
        if (stream == null) throw new IllegalStateException("Missing hide-app-posts.mpe");
        return stream;
    }
}
