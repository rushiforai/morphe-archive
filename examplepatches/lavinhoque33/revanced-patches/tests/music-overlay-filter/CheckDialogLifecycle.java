/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-20.
 */
import com.android.tools.smali.dexlib2.AccessFlags;
import com.android.tools.smali.dexlib2.Opcodes;
import com.android.tools.smali.dexlib2.dexbacked.DexBackedDexFile;
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction;
import com.android.tools.smali.dexlib2.iface.reference.MethodReference;

import java.io.BufferedInputStream;
import java.nio.file.Path;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.zip.ZipFile;

/** java -cp cli.jar CheckDialogLifecycle.java patched-music.apk [...] */
class CheckDialogLifecycle {
    private static final String HOOK = "Lapp/morphe/extension/music/patches/general/OverlayFilterPatch;";

    public static void main(String[] args) throws Exception {
        if (args.length == 0) throw new IllegalArgumentException("Pass a patched Music APK");
        for (String apk : args) {
            var parents = new HashMap<String, String>();
            var declarations = new HashMap<String, Integer>();
            var hooked = new ArrayList<String>();
            try (var zip = new ZipFile(apk)) {
                for (var entry : Collections.list(zip.entries())) {
                    if (!entry.getName().matches("classes[0-9]*\\.dex")) continue;
                    try (var input = new BufferedInputStream(zip.getInputStream(entry))) {
                        var dex = DexBackedDexFile.fromInputStream(Opcodes.getDefault(), input);
                        for (var cls : dex.getClasses()) {
                            parents.put(cls.getType(), cls.getSuperclass());
                            for (var method : cls.getVirtualMethods()) {
                                if (!method.getName().equals("onStart") || !method.getParameterTypes().isEmpty()
                                        || !method.getReturnType().equals("V")) continue;
                                declarations.put(cls.getType(), method.getAccessFlags());
                                var body = method.getImplementation();
                                if (body == null) continue;
                                for (var insn : body.getInstructions()) {
                                    if (insn instanceof ReferenceInstruction ref
                                            && ref.getReference() instanceof MethodReference call
                                            && call.getDefiningClass().equals(HOOK) && call.getName().equals("updateDialogDim")) {
                                        hooked.add(cls.getType());
                                        break;
                                    }
                                }
                            }
                        }
                    }
                }
            }
            if (hooked.isEmpty()) throw new AssertionError("No Music overlay-filter lifecycle hooks in " + apk);
            for (String type : hooked) {
                for (String parent = parents.get(type); parent != null; parent = parents.get(parent)) {
                    if (AccessFlags.FINAL.isSet(declarations.getOrDefault(parent, 0))) {
                        throw new AssertionError(type + " overrides final " + parent + "->onStart()V");
                    }
                }
            }
            System.out.println(Path.of(apk).getFileName() + ": " + hooked.size() + " loadable onStart overrides");
        }
    }
}
