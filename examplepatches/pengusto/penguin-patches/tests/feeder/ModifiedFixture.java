/* SPDX-License-Identifier: GPL-3.0-only */
import com.android.tools.smali.dexlib2.*;
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation;
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction10x;
import com.android.tools.smali.dexlib2.iface.*;
import com.android.tools.smali.dexlib2.immutable.*;
import com.android.tools.smali.dexlib2.writer.io.MemoryDataStore;
import com.android.tools.smali.dexlib2.writer.pool.DexPool;
import java.io.*;
import java.util.*;
import java.util.zip.*;

/** Negative-only APK: valid DEX with one extra NOP in the guarded native editor. Never install. */
class ModifiedFixture {
    public static void main(String[] args) throws Exception {
        if (args.length != 2) throw new IllegalArgumentException("Pass original APK and negative output APK");
        var source = DexFileFactory.loadDexContainer(new File(args[0]), Opcodes.getDefault());
        Map<String, byte[]> replaced = new HashMap<>();
        int changes = 0;
        for (var entry : source.getDexEntryNames()) {
            List<ClassDef> classes = new ArrayList<>(); boolean changed = false;
            for (var type : source.getEntry(entry).getDexFile().getClasses()) {
                if (!type.getType().equals("Lcom/nononsenseapps/feeder/ui/compose/html/LinearArticleContentKt;")) { classes.add(type); continue; }
                List<Method> methods = new ArrayList<>();
                for (var method : type.getMethods()) {
                    if (!method.getName().equals("LinearImageContent")) { methods.add(method); continue; }
                    var implementation = new MutableMethodImplementation(method.getImplementation());
                    implementation.addInstruction(0, new BuilderInstruction10x(Opcode.NOP));
                    methods.add(new ImmutableMethod(method.getDefiningClass(), method.getName(), method.getParameters(),
                        method.getReturnType(), method.getAccessFlags(), method.getAnnotations(), method.getHiddenApiRestrictions(), implementation));
                    changes++; changed = true;
                }
                classes.add(new ImmutableClassDef(type.getType(), type.getAccessFlags(), type.getSuperclass(), type.getInterfaces(),
                    type.getSourceFile(), type.getAnnotations(), type.getFields(), methods));
            }
            if (changed) {
                var store = new MemoryDataStore();
                DexPool.writeTo(store, new ImmutableDexFile(Opcodes.getDefault(), classes));
                replaced.put(entry, store.getData());
            }
        }
        if (changes != 1) throw new AssertionError("Expected exactly one editor mutation");
        try (ZipFile src = new ZipFile(args[0]); ZipOutputStream dst = new ZipOutputStream(new FileOutputStream(args[1]))) {
            for (var entry : Collections.list(src.entries())) {
                if (entry.getName().startsWith("META-INF/")) continue;
                dst.putNextEntry(new ZipEntry(entry.getName()));
                dst.write(replaced.containsKey(entry.getName()) ? replaced.get(entry.getName()) : src.getInputStream(entry).readAllBytes());
                dst.closeEntry();
            }
        }
        System.out.println("Created negative-only modified DEX fixture; do not install");
    }
}
