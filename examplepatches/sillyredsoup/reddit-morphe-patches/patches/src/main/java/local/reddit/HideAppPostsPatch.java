package local.reddit;

import app.morphe.patcher.patch.*;
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod;
import com.android.tools.smali.dexlib2.Opcode;
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction11x;
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction3rc;
import com.android.tools.smali.dexlib2.iface.instruction.Instruction;
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction;
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction;
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction;
import com.android.tools.smali.dexlib2.iface.reference.MethodReference;
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableMethodReference;
import java.io.InputStream;
import java.util.*;
import kotlin.Unit;

/** Removes Dev Platform app posts from listing children in Reddit 2026.14.0. */
public final class HideAppPostsPatch {
    private static BytecodePatch patch;
    private HideAppPostsPatch() {}

    @SuppressWarnings({"unchecked", "deprecation"})
    public static synchronized BytecodePatch getHideAppPostsPatch() {
        if (patch != null) return patch;
        patch = PatchKt.bytecodePatch("Reddit - Hide app posts",
            "Hides interactive app and game posts in listings.", false, builder -> {
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

                    MutableMethod nav = null;
                    for (MutableMethod method : context.mutableClassDefBy(
                        "Lcom/reddit/launch/bottomnav/BottomNavScreen;").getMethods())
                        if ("J5".equals(method.getName()) && "Lgp3/g;".equals(method.getReturnType())
                            && method.getParameterTypes().size() == 1 && method.getImplementation() != null) {
                            if (nav != null) throw new IllegalStateException("Ambiguous bottom bar builder");
                            nav = method;
                        }
                    if (nav == null) throw new IllegalStateException("Missing bottom bar builder");
                    int resources = nav.getImplementation().getRegisterCount() - 1;
                    nav.getImplementation().addInstruction(0,
                        new BuilderInstruction3rc(Opcode.INVOKE_STATIC_RANGE, resources - 1, 2,
                            new ImmutableMethodReference("Llocal/reddit/extension/AppPostFilter;",
                                "initialize", Arrays.asList("Ljava/lang/Object;",
                                    "Landroid/content/res/Resources;"), "V")));

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
                    int settingHooks = 0;
                    for (int i = 0; i < settingsCode.size(); i++) {
                        Instruction ins = settingsCode.get(i);
                        if (!(ins instanceof ReferenceInstruction) || !(ins instanceof FiveRegisterInstruction)) continue;
                        Object ref = ((ReferenceInstruction) ins).getReference();
                        if (!(ref instanceof MethodReference) || !"setPreferenceScreen".equals(((MethodReference) ref).getName())) continue;
                        int screen = ((FiveRegisterInstruction) ins).getRegisterD();
                        settings.getImplementation().addInstruction(i + 1,
                                new BuilderInstruction3rc(Opcode.INVOKE_STATIC_RANGE, screen, 1,
                                    new ImmutableMethodReference("Llocal/reddit/extension/AppPostFilter;",
                                        "addSetting", Collections.singletonList("Ljava/lang/Object;"), "V")));
                        settingHooks++;
                    }
                    if (settingHooks != 1) throw new IllegalStateException("Morphe settings initializer changed");
                    return Unit.INSTANCE;
                });
                return Unit.INSTANCE;
            });
        return patch;
    }

    private static InputStream extensionStream() {
        InputStream stream = HideAppPostsPatch.class.getClassLoader()
            .getResourceAsStream("extensions/hide-app-posts.mpe");
        if (stream == null) throw new IllegalStateException("Missing hide-app-posts.mpe");
        return stream;
    }
}
