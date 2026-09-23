package santodan.patches;

import app.morphe.patcher.patch.*;
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass;
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod;
import com.android.tools.smali.dexlib2.Opcode;
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction35c;
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction11x;
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction21c;
import com.android.tools.smali.dexlib2.iface.instruction.*;
import com.android.tools.smali.dexlib2.iface.reference.FieldReference;
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableMethodReference;
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableFieldReference;
import java.io.*;
import java.net.URI;
import java.util.*;
import java.util.logging.Logger;
import java.util.zip.*;
import kotlin.Unit;

/** Automatically selects Reddit's own browse-logged-out path on the initial welcome screen. */
public final class RedditGuestModePatch {
    public static final String NAME = "Reddit - Start as guest";
    static final String PACKAGE = "com.reddit.frontpage";
    static final String VERSION = "2026.37.0";
    static final String VIEW_MODEL = "Lcom/reddit/auth/login/screen/welcomev2/WelcomeV2ViewModel;";
    static final String CALLBACK_TYPE = "Lb3o0;";
    static final String EXTENSION = "Lsoftware/santodan/extension/redditguest/RedditGuestMode;";
    static final String CREDENTIAL_PICKER = "Lcom/reddit/auth/login/screen/welcomev2/WelcomeV2ViewModel$viewState$2$1$1;";
    private static final Logger LOG = Logger.getLogger("app.morphe.patches.santodan");

    private RedditGuestModePatch() {}

    @SuppressWarnings({"unchecked", "deprecation"})
    public static BytecodePatch getRedditGuestModePatch() {
        return PatchKt.bytecodePatch(NAME,
            "Skips the forced startup login screen using Reddit's native browse-logged-out action. Login remains available from the account menu. Already included upstream in Morphe Patches PR #3109: https://github.com/MorpheApp/morphe-patches/pull/3109",
            false, builder -> {
                builder.compatibleWith(new Compatibility(PACKAGE, "Reddit", null, ApkFileType.APK,
                    null, null, Collections.singletonList(new AppTarget(VERSION, false, null)), false));
                builder.extendWith(RedditGuestModePatch::extensionStream);
                builder.execute(context -> {
                    if (!PACKAGE.equals(context.getPackageMetadata().getPackageName())
                        || !VERSION.equals(context.getPackageMetadata().getVersionName()))
                        throw unsupported("Expected " + PACKAGE + " " + VERSION);
                    MutableMethod constructor = findConstructor(context.mutableClassDefBy(VIEW_MODEL));
                    hookGuestCallback(constructor);
                    suppressCredentialPicker(context.mutableClassDefBy(CREDENTIAL_PICKER));
                    LOG.info("SantoDan: Reddit startup welcome screen now selects native guest browsing.");
                    return Unit.INSTANCE;
                });
                return Unit.INSTANCE;
            });
    }

    static void suppressCredentialPicker(MutableClass owner) {
        MutableMethod target = null;
        for (MutableMethod method : owner.getMethods())
            if ("invokeSuspend".equals(method.getName()) && "Ljava/lang/Object;".equals(method.getReturnType())
                && method.getParameterTypes().size() == 1) {
                if (target != null) throw unsupported("Multiple startup credential-picker methods found");
                target = method;
            }
        if (target == null || target.getImplementation() == null)
            throw unsupported("Startup credential-picker method not found");
        while (RedditContentFilterPatch.instructions(target).size() > 2)
            target.getImplementation().removeInstruction(2);
        target.getImplementation().replaceInstruction(0,
            new BuilderInstruction21c(Opcode.SGET_OBJECT, 0,
                new ImmutableFieldReference("Lkotlin/Unit;", "a", "Lkotlin/Unit;")));
        target.getImplementation().replaceInstruction(1, new BuilderInstruction11x(Opcode.RETURN_OBJECT, 0));
    }

    static MutableMethod findConstructor(MutableClass owner) {
        List<MutableMethod> matches = new ArrayList<>();
        for (MutableMethod method : owner.getMethods()) {
            if (!"<init>".equals(method.getName()) || method.getImplementation() == null) continue;
            int writes = 0;
            for (Instruction instruction : method.getImplementation().getInstructions()) {
                if (instruction.getOpcode() != Opcode.IPUT_OBJECT || !(instruction instanceof ReferenceInstruction)) continue;
                Object reference = ((ReferenceInstruction) instruction).getReference();
                if (reference instanceof FieldReference) {
                    FieldReference field = (FieldReference) reference;
                    if (VIEW_MODEL.equals(field.getDefiningClass()) && "c0".equals(field.getName())
                        && CALLBACK_TYPE.equals(field.getType())) writes++;
                }
            }
            if (writes == 1) matches.add(method);
        }
        if (matches.size() != 1) throw unsupported("Expected one WelcomeV2ViewModel constructor with guest callback; found " + matches.size());
        return matches.get(0);
    }

    static void hookGuestCallback(MutableMethod method) {
        List<Instruction> instructions = RedditContentFilterPatch.instructions(method);
        int index = -1;
        for (int i = 0; i < instructions.size(); i++) {
            Instruction instruction = instructions.get(i);
            if (instruction.getOpcode() != Opcode.IPUT_OBJECT || !(instruction instanceof ReferenceInstruction)
                || !(instruction instanceof TwoRegisterInstruction)) continue;
            FieldReference field = (FieldReference) ((ReferenceInstruction) instruction).getReference();
            if (VIEW_MODEL.equals(field.getDefiningClass()) && "c0".equals(field.getName())
                && CALLBACK_TYPE.equals(field.getType())) {
                index = i + 1;
            }
        }
        if (index < 0) throw unsupported("Guest startup anchor cannot be safely located");
        method.getImplementation().addInstruction(index,
            new BuilderInstruction35c(Opcode.INVOKE_STATIC, 0, 0, 0, 0, 0, 0,
                new ImmutableMethodReference(EXTENSION, "schedule", Collections.emptyList(), "V")));
    }

    static IllegalStateException unsupported(String reason) {
        return new IllegalStateException("Unsupported Reddit guest-mode bytecode: " + reason
            + ". No fallback was applied. Use Reddit 2026.37.0.");
    }

    static InputStream extensionStream() {
        String path = "extensions/reddit-guest.mpe";
        InputStream resource = RedditGuestModePatch.class.getClassLoader().getResourceAsStream(path);
        if (resource != null) return resource;
        try {
            URI source = RedditGuestModePatch.class.getProtectionDomain().getCodeSource().getLocation().toURI();
            try (ZipFile zip = new ZipFile(new File(source))) {
                ZipEntry entry = zip.getEntry(path);
                if (entry == null) throw new FileNotFoundException(path);
                try (InputStream input = zip.getInputStream(entry)) {
                    ByteArrayOutputStream output = new ByteArrayOutputStream();
                    byte[] buffer = new byte[8192]; int count;
                    while ((count = input.read(buffer)) >= 0) output.write(buffer, 0, count);
                    return new ByteArrayInputStream(output.toByteArray());
                }
            }
        } catch (Exception error) {
            throw new IllegalStateException("Cannot load bundled Reddit guest extension", error);
        }
    }
}
