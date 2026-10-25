package santodan.patches;

import app.morphe.patcher.util.proxy.mutableTypes.*;
import com.android.tools.smali.dexlib2.*;
import com.android.tools.smali.dexlib2.builder.instruction.*;
import com.android.tools.smali.dexlib2.dexbacked.DexBackedDexFile;
import com.android.tools.smali.dexlib2.immutable.*;
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableStringReference;
import com.android.tools.smali.dexlib2.iface.instruction.*;
import com.android.tools.smali.dexlib2.writer.pool.DexPool;
import java.io.*;
import java.util.*;
import java.util.zip.ZipFile;

public final class VerifyNuvioUpdateInstaller {
    static final String AUTHORITY = "com.nuvio.testing.fileprovider";
    static void check(boolean value) { if (!value) throw new AssertionError(); }
    static void rejected(Runnable action) {
        try { action.run(); } catch (IllegalStateException expected) { return; }
        throw new AssertionError("Invalid installer accepted");
    }
    static Map<String, MutableClass> copy(Map<String, MutableClass> original) {
        var result = new HashMap<String, MutableClass>();
        original.forEach((type, owner) -> result.put(type, new MutableClass(owner)));
        return result;
    }
    public static void main(String[] args) throws Exception {
        var originals = new HashMap<String, MutableClass>();
        var types = Set.of(NuvioUpdateInstaller.INSTALLER, NuvioUpdateInstaller.RECEIVER, NuvioUpdateInstaller.INSTALL_ACTION);
        try (var zip = new ZipFile(args[0])) {
            for (var entry : Collections.list(zip.entries())) if (entry.getName().matches("classes\\d*\\.dex"))
                try (var in = new BufferedInputStream(zip.getInputStream(entry))) {
                    for (var owner : DexBackedDexFile.fromInputStream(null, in).getClasses()) if (types.contains(owner.getType()))
                        check(originals.put(owner.getType(), new MutableClass(owner)) == null);
                }
        }
        check(originals.size() == 3);
        if (args.length > 2) {
            var expected = copy(originals);
            NuvioUpdateInstaller.disableMetadata(expected.get(NuvioUpdateInstaller.INSTALLER), expected.get(NuvioUpdateInstaller.RECEIVER));
            NuvioUpdateInstaller.renameProviders(expected.get(NuvioUpdateInstaller.INSTALL_ACTION), expected.get(NuvioUpdateInstaller.RECEIVER), "com.nuvio.santodan.fileprovider");
            int matched = 0;
            try (var zip = new ZipFile(args[2])) {
                for (var entry : Collections.list(zip.entries())) if (entry.getName().matches("classes\\d*\\.dex"))
                    try (var in = new BufferedInputStream(zip.getInputStream(entry))) {
                        for (var definition : DexBackedDexFile.fromInputStream(null, in).getClasses()) if (types.contains(definition.getType())) {
                            matched++;
                            for (var actual : new MutableClass(definition).getMethods()) {
                                if (definition.getType().equals(NuvioUpdateInstaller.INSTALLER) && actual.getName().equals("b")) NuvioUpdateFlowPatch.removeInstallHook(actual);
                                var before = expected.get(definition.getType()).getMethods().stream().filter(m -> m.toString().equals(actual.toString())).findFirst().orElseThrow();
                                check(NuvioPlaybackButtonsPatch.fingerprint(actual).equals(NuvioPlaybackButtonsPatch.fingerprint(before)));
                            }
                        }
                    }
            }
            check(matched == 3);
            System.out.println("PASS: rebuilt APK installer, receiver and clone-provider methods exactly match verified repairs");
        }
        for (String mode : List.of("updater", "clone", "updater-first", "clone-first")) {
            var classes = copy(originals);
            var installer = classes.get(NuvioUpdateInstaller.INSTALLER);
            var receiver = classes.get(NuvioUpdateInstaller.RECEIVER);
            var action = classes.get(NuvioUpdateInstaller.INSTALL_ACTION);
            boolean update = !mode.equals("clone"), clone = !mode.equals("updater");
            if (mode.equals("clone-first")) NuvioUpdateInstaller.renameProviders(action, receiver, AUTHORITY);
            if (update) NuvioUpdateInstaller.disableMetadata(installer, receiver);
            if (clone && !mode.equals("clone-first")) NuvioUpdateInstaller.renameProviders(action, receiver, AUTHORITY);
            if (update) rejected(() -> NuvioUpdateInstaller.disableMetadata(installer, receiver));
            if (clone) rejected(() -> NuvioUpdateInstaller.renameProviders(action, receiver, AUTHORITY));
            File out = new File(args[1], "installer-" + mode + ".dex"); out.getParentFile().mkdirs();
            DexPool.writeTo(out.toString(), new ImmutableDexFile(Opcodes.getDefault(), classes.values()));
            try (var in = new BufferedInputStream(new FileInputStream(out))) {
                for (var definition : DexBackedDexFile.fromInputStream(null, in).getClasses()) {
                    var owner = new MutableClass(definition);
                    for (var after : owner.getMethods()) {
                        var before = originals.get(owner.getType()).getMethods().stream().filter(m -> m.toString().equals(after.toString())).findFirst().orElseThrow();
                        if (owner.getType().equals(NuvioUpdateInstaller.INSTALLER) && after.getName().equals("b") && update) {
                            check(NuvioUpdateInstaller.isZero(after.getImplementation().getInstructions().get(0), 15));
                            after.getImplementation().removeInstruction(0);
                        }
                        if (owner.getType().equals(NuvioUpdateInstaller.RECEIVER) && after.getName().equals("onReceive") && update) {
                            int result = NuvioUpdateInstaller.dmResult(after);
                            int register = ((OneRegisterInstruction) after.getImplementation().getInstructions().get(result)).getRegisterA();
                            check(NuvioUpdateInstaller.isZero(after.getImplementation().getInstructions().get(result + 1), register));
                            after.getImplementation().removeInstruction(result + 1);
                        }
                        if (clone && (owner.getType().equals(NuvioUpdateInstaller.RECEIVER) && after.getName().equals("onReceive") ||
                            owner.getType().equals(NuvioUpdateInstaller.INSTALL_ACTION) && after.getName().equals("invokeSuspend"))) {
                            int index = NuvioUpdateInstaller.authority(after);
                            var instruction = after.getImplementation().getInstructions().get(index);
                            check(NuvioApkUpdates.string(instruction).equals(AUTHORITY));
                            after.getImplementation().replaceInstruction(index, new BuilderInstruction21c(Opcode.CONST_STRING,
                                ((OneRegisterInstruction) instruction).getRegisterA(), new ImmutableStringReference(NuvioUpdateInstaller.AUTHORITY)));
                        }
                        check(NuvioPlaybackButtonsPatch.fingerprint(after).equals(NuvioPlaybackButtonsPatch.fingerprint(before)));
                        check(ImmutableMethodImplementation.of(after.getImplementation()).getTryBlocks().equals(ImmutableMethodImplementation.of(before.getImplementation()).getTryBlocks()));
                    }
                }
            }
        }
        var invalid = copy(originals);
        var badReceiver = invalid.get(NuvioUpdateInstaller.RECEIVER);
        NuvioUpdateInstaller.unique(badReceiver, "onReceive").getImplementation().replaceInstruction(0, new BuilderInstruction10x(Opcode.NOP));
        rejected(() -> NuvioUpdateInstaller.disableMetadata(invalid.get(NuvioUpdateInstaller.INSTALLER), badReceiver));
        var missing = copy(originals);
        missing.get(NuvioUpdateInstaller.INSTALLER).getMethods().removeIf(m -> m.getName().equals("b"));
        rejected(() -> NuvioUpdateInstaller.disableMetadata(missing.get(NuvioUpdateInstaller.INSTALLER), missing.get(NuvioUpdateInstaller.RECEIVER)));
        System.out.println("PASS: original beta.8 installer flags, no receiver copy retry, clone providers, both patch orders, duplicate/changed/missing rejection, DEX/try-region roundtrip");
    }
}
