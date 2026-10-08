package santodan.patches;

import app.morphe.patcher.patch.BytecodePatch;
import app.morphe.patcher.patch.PatchKt;
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass;
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod;
import com.android.tools.smali.dexlib2.Opcode;
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction35c;
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction;
import com.android.tools.smali.dexlib2.iface.instruction.Instruction;
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction;
import com.android.tools.smali.dexlib2.iface.reference.MethodReference;
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableMethodReference;
import java.io.*;
import java.net.URI;
import java.util.zip.ZipFile;
import java.util.zip.ZipEntry;
import java.util.ArrayList;
import java.util.List;
import kotlin.Unit;

/** Shared, unnamed dependency: installed once by any beta4 runtime settings patch. */
public final class NuvioSettingsMenuPatch {
    private static BytecodePatch patch;
    static final String EXTENSION = "Lsoftware/santodan/extension/nuviomenu/NuvioSettingsMenu;";
    private NuvioSettingsMenuPatch() {}

    static synchronized BytecodePatch getMenuPatch() {
        if (patch == null) patch = PatchKt.bytecodePatch(null, null, false, builder -> {
            builder.extendWith(NuvioSettingsMenuPatch::extensionStream);
            builder.execute(context -> {
                String version = context.getPackageMetadata().getVersionName();
                if (!"com.nuvio.tv".equals(context.getPackageMetadata().getPackageName()))
                    throw NuvioAiringSeriesPatch.unsupported("Expected com.nuvio.tv");
                // Keep beta2's existing UI contracts; beta4 introduces collapsible Layout sections.
                if (NuvioLayout.beta4(version)) hookLayoutList(context.mutableClassDefBy("Lja/n;"));
                return Unit.INSTANCE;
            });
            return Unit.INSTANCE;
        });
        return patch;
    }

    static void hookLayoutList(MutableClass owner) {
        MutableMethod target = NuvioAiringSeriesPatch.unique(owner, "invoke", 1);
        List<Instruction> instructions = NuvioAiringSeriesPatch.instructions(target);
        int matches = 0;
        for (int i = instructions.size() - 1; i >= 0; i--) {
            Instruction instruction = instructions.get(i);
            if (!NuvioAiringSeriesPatch.calls(instruction, "Lja/i2;", "<init>")) continue;
            MethodReference constructor = (MethodReference) ((ReferenceInstruction) instruction).getReference();
            if (!constructor.getParameterTypes().contains("Lsa/j6;")) continue;
            int anchor = -1;
            for (int j = i + 1; j < Math.min(i + 12, instructions.size()); j++) {
                if (NuvioAiringSeriesPatch.calls(instructions.get(j), "Lg0/i;", "q")) { anchor = j; break; }
            }
            if (anchor < 0 || !(instructions.get(anchor) instanceof FiveRegisterInstruction))
                throw NuvioAiringSeriesPatch.unsupported("Layout section list anchor changed");
            int scope = ((FiveRegisterInstruction) instructions.get(anchor)).getRegisterC();
            target.getImplementation().addInstruction(anchor,
                new BuilderInstruction35c(Opcode.INVOKE_STATIC, 1, scope, 0, 0, 0, 0,
                    new ImmutableMethodReference(EXTENSION, "addMenu", List.of("Ljava/lang/Object;"), "V")));
            matches++;
        }
        if (matches != 1) throw NuvioAiringSeriesPatch.unsupported("Ambiguous/missing Layout section list");
    }

    static InputStream extensionStream() {
        String path = "extensions/nuvio-settings-menu.mpe";
        InputStream resource = NuvioSettingsMenuPatch.class.getClassLoader().getResourceAsStream(path);
        if (resource != null) return resource;
        try {
            URI source = NuvioSettingsMenuPatch.class.getProtectionDomain().getCodeSource().getLocation().toURI();
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
            throw new IllegalStateException("Cannot load bundled NuvioTV extension", error);
        }
    }
}
