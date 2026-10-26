import java.io.BufferedInputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.TreeSet;
import java.util.zip.ZipEntry;
import java.util.zip.ZipFile;

import com.android.tools.smali.dexlib2.Opcodes;
import com.android.tools.smali.dexlib2.dexbacked.DexBackedDexFile;
import com.android.tools.smali.dexlib2.iface.ClassDef;
import com.android.tools.smali.dexlib2.iface.Method;
import com.android.tools.smali.dexlib2.iface.MethodImplementation;
import com.android.tools.smali.dexlib2.iface.instruction.Instruction;
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction;
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction;

/**
 * Read-only native DinamicX callpath audit on the ORIGINAL Taobao APK.
 * Results list static method references; they do not prove dynamic dispatch or
 * observed translations. Does not need root, credentials or an emulator.
 */
public final class AnalyzeDinamicXRoutes {
    private static final String DX_BUTTER = "Ltb/gi6;";
    private static final String DX_FAST = "Ltb/cx5;";
    private static final String SETTER = "->setText(Ljava/lang/CharSequence;)V";
    private static final String ATTRIBUTE = "->onSetStringAttribute(JLjava/lang/String;)V";
    private static final long TEXT_HASH = 38178040921L;
    private static final Set<String> TARGETS = Set.of(
        DX_BUTTER + SETTER, DX_FAST + SETTER,
        DX_BUTTER + ATTRIBUTE, DX_FAST + ATTRIBUTE
    );

    private record TargetInfo(String dex, String superclass, List<String> interfaces,
                              int registers, int tries, int instructionCount,
                              Set<String> textFieldsWritten, boolean hasTextHash,
                              Set<String> methodCalls) {}
    // Capture subclass overrides separately from exact patched methods. These
    // can write a second text field even when they invoke the patched parent.
    private record AttributeOverride(String source, String superclass,
                                     List<String> stringFields,
                                     List<Integer> fieldWriteIndices,
                                     List<Integer> superInvokeIndices) {}
    private static final Map<String, AttributeOverride> attrOverrides = new HashMap<>();
    private static final Map<String, TargetInfo> targetData = new HashMap<>();
    private static final Map<String, String> superclassByType = new HashMap<>();
    private static final Map<String, Set<String>> directCallers = new HashMap<>();
    private static final Map<String, Set<String>> virtualDispatchReferences = new HashMap<>();
    private static final Set<String> external = new TreeSet<>();
    private static long implementedCount;

    private static String id(String type, Method m) {
        return type + "->" + m.getName() + "(" +
            String.join("", m.getParameterTypes()) + ")" + m.getReturnType();
    }

    private static String invocation(Instruction instruction) {
        if (!instruction.getOpcode().name.startsWith("invoke-") &&
            !instruction.getOpcode().name.startsWith("INVOKE_")) return null;
        if (!(instruction instanceof ReferenceInstruction ref)) return null;
        return ref.getReference().toString();
    }

    private static void firstPass(ZipFile apk) throws IOException {
        for (ZipEntry entry : Collections.list(apk.entries())) {
            if (!entry.getName().matches("classes(\\d*)\\.dex")) continue;
            DexBackedDexFile dex = DexBackedDexFile.fromInputStream(
                Opcodes.getDefault(), new BufferedInputStream(apk.getInputStream(entry)));
            for (ClassDef cls : dex.getClasses()) {
                String type = cls.getType();
                superclassByType.put(type, cls.getSuperclass());
                for (Method method : cls.getMethods()) {
                    MethodImplementation impl = method.getImplementation();
                    if (impl == null) continue;
                    implementedCount++;
                    String source = id(type, method);
                    boolean target = TARGETS.contains(source);
                    boolean attributeOverride = source.endsWith(ATTRIBUTE) && !target;
                    Set<String> subclassStringFields = new TreeSet<>();
                    List<Integer> subclassFieldWriteIndices = new ArrayList<>();
                    List<Integer> subclassSuperInvokeIndices = new ArrayList<>();
                    Set<String> textWrites = new TreeSet<>();
                    Set<String> outbound = new TreeSet<>();
                    boolean hash = false;
                    int count = 0;
                    for (Instruction insn : impl.getInstructions()) {
                        count++;
                        if (insn instanceof WideLiteralInstruction wide &&
                            wide.getWideLiteral() == TEXT_HASH) hash = true;
                        if (insn.getOpcode().name.startsWith("iput-object") ||
                            insn.getOpcode().name.startsWith("IPUT_OBJECT")) {
                            if (insn instanceof ReferenceInstruction ref &&
                                ref.getReference().toString().endsWith(
                                    "->text:Ljava/lang/CharSequence;")) {
                                textWrites.add(ref.getReference().toString());
                            }
                        }
                        if (attributeOverride &&
                            insn.getOpcode().name.toUpperCase().replace('-', '_').startsWith("IPUT_OBJECT") &&
                            insn instanceof ReferenceInstruction ref) {
                            String field = ref.getReference().toString();
                            if (field.endsWith("Ljava/lang/String;") ||
                                field.endsWith("Ljava/lang/CharSequence;")) {
                                subclassStringFields.add(field);
                                subclassFieldWriteIndices.add(count);
                            }
                        }
                        String callee = invocation(insn);
                        if (attributeOverride && callee != null &&
                            callee.endsWith(ATTRIBUTE) &&
                            insn.getOpcode().name.toUpperCase().replace('-', '_').startsWith("INVOKE_SUPER")) {
                            subclassSuperInvokeIndices.add(count);
                        }
                        if (callee != null) {
                            if (target) outbound.add(callee);
                            if (TARGETS.contains(callee))
                                directCallers.computeIfAbsent(callee, k -> new TreeSet<>())
                                    .add(source);
                            if (callee.endsWith(ATTRIBUTE) || callee.endsWith(SETTER)) {
                                virtualDispatchReferences
                                    .computeIfAbsent(callee, k -> new TreeSet<>()).add(source);
                            }
                        }
                    }
                    if (attributeOverride) {
                        attrOverrides.put(source, new AttributeOverride(
                            source, cls.getSuperclass(),
                            List.copyOf(subclassStringFields),
                            List.copyOf(subclassFieldWriteIndices),
                            List.copyOf(subclassSuperInvokeIndices)));
                    }
                    if (target) {
                        var info = new TargetInfo(entry.getName(), cls.getSuperclass(),
                            new ArrayList<>(cls.getInterfaces()), impl.getRegisterCount(),
                            impl.getTryBlocks().size(), count, textWrites, hash, outbound);
                        if (targetData.put(source, info) != null)
                            throw new IOException("Duplicate target method " + source);
                    }
                }
            }
        }
    }

    private static Set<String> targetLineage() {
        Set<String> ancestorTypes = new TreeSet<>();
        for (String type : List.of(DX_BUTTER, DX_FAST)) {
            Set<String> seen = new HashSet<>();
            while (type != null && seen.add(type)) {
                ancestorTypes.add(type);
                type = superclassByType.get(type);
            }
        }
        return ancestorTypes;
    }

    private static String descendantOfTarget(String type) {
        Set<String> seen = new HashSet<>();
        while (type != null && seen.add(type)) {
            type = superclassByType.get(type);
            if (DX_BUTTER.equals(type)) return DX_BUTTER;
            if (DX_FAST.equals(type)) return DX_FAST;
        }
        return null;
    }

    private static void reportSubclassOverrides(PrintWriter out) {
        out.println("## Subclass attribute overrides that may bypass translation");
        out.println();
        out.println("The four-hook patch translates arguments inside gi6/cx5. A subclass");
        out.println("can store its own raw String/CharSequence before or after invoking");
        out.println("the patched parent. These are static write-site observations,");
        out.println("NOT runtime evidence that a displayed label remains Chinese.");
        out.println();
        int butterDescendants = 0;
        int fastDescendants = 0;
        for (String type : superclassByType.keySet()) {
            String parent = descendantOfTarget(type);
            if (DX_BUTTER.equals(parent)) butterDescendants++;
            if (DX_FAST.equals(parent)) fastDescendants++;
        }
        out.println("- Descendant classes: Butter=" + butterDescendants +
                    ", Fast=" + fastDescendants);
        var applicable = new java.util.TreeMap<String, AttributeOverride>();
        for (var candidate : attrOverrides.entrySet()) {
            String type = candidate.getKey().substring(0,
                candidate.getKey().indexOf("->"));
            if (descendantOfTarget(type) != null) {
                applicable.put(candidate.getKey(), candidate.getValue());
            }
        }
        int withOwnStringWrites = 0, beforeSuper = 0, afterSuper = 0, noSuper = 0;
        for (var row : applicable.entrySet()) {
            AttributeOverride entry = row.getValue();
            if (!entry.stringFields().isEmpty()) withOwnStringWrites++;
            int before = 0, after = 0;
            if (entry.superInvokeIndices().isEmpty()) {
                noSuper++;
            } else {
                int first = Collections.min(entry.superInvokeIndices());
                int last = Collections.max(entry.superInvokeIndices());
                for (int index : entry.fieldWriteIndices()) {
                    if (index < first) before++;
                    if (index > last) after++;
                }
            }
            if (before > 0) beforeSuper++;
            if (after > 0) afterSuper++;
            out.println("- " + row.getKey() + " | parent=" +
                entry.superclass() + " | string writes=" +
                entry.stringFields().size() + " | before invoke-super=" + before +
                " | after invoke-super=" + after +
                " | invoke-super count=" + entry.superInvokeIndices().size());
        }
        out.println("- Total inherited attribute overrides: " + applicable.size());
        out.println("- Overrides writing additional String/CharSequence fields: " +
                    withOwnStringWrites);
        out.println("- Override methods with string stores before invoke-super: " +
                    beforeSuper + "; after invoke-super: " + afterSuper);
        out.println("- Overrides without a direct invoke-super attribute call: " + noSuper);
        out.println();
        out.println("Independent text fields may feed custom renderers; addressing them");
        out.println("safely needs branch-aware bytecode analysis and device validation.");
        out.println();
    }

    private static boolean mayDispatchToTarget(String methodRef) {
        int index = methodRef.indexOf("->");
        return index > 0 &&
               targetLineage().contains(methodRef.substring(0, index)) &&
               (methodRef.endsWith(SETTER) || methodRef.endsWith(ATTRIBUTE));
    }

    private static void secondPass(ZipFile apk) throws IOException {
        Set<String> sought = new HashSet<>();
        for (Set<String> callers : directCallers.values()) sought.addAll(callers);
        for (var entry : virtualDispatchReferences.entrySet())
            if (mayDispatchToTarget(entry.getKey())) sought.addAll(entry.getValue());
        if (sought.isEmpty()) return;
        for (ZipEntry entry : Collections.list(apk.entries())) {
            if (!entry.getName().matches("classes(\\d*)\\.dex")) continue;
            DexBackedDexFile dex = DexBackedDexFile.fromInputStream(
                Opcodes.getDefault(), new BufferedInputStream(apk.getInputStream(entry)));
            for (ClassDef cls : dex.getClasses()) {
                for (Method m : cls.getMethods()) {
                    var impl = m.getImplementation();
                    if (impl == null) continue;
                    String source = id(cls.getType(), m);
                    for (Instruction insn : impl.getInstructions()) {
                        String callee = invocation(insn);
                        if (callee != null && sought.contains(callee)) {
                            external.add(source + " -> " + callee);
                        }
                    }
                }
            }
        }
    }

    private static void report(PrintWriter out) {
        out.println("# DinamicX call-path analysis of original Taobao 10.66.30");
        out.println();
        out.println("Implemented DEX methods scanned: " + implementedCount);
        out.println("Expected 4 target methods: " + TARGETS.size());
        out.println("Located: " + targetData.size());
        out.println();
        out.println("This report is STATIC only. An absent direct call is not proof the "
                    + "override is unused: invokevirtual on a base type, reflection "
                    + "and JNI dispatch are not resolved.");
        out.println();
        for (String target : new TreeSet<>(TARGETS)) {
            TargetInfo info = targetData.get(target);
            out.println("## " + target);
            if (info == null) { out.println("MISSING"); continue; }
            out.println("- DEX: " + info.dex());
            out.println("- Superclass: " + info.superclass());
            out.println("- Interfaces: " + info.interfaces());
            out.println("- Registers / try blocks / instructions: " + info.registers() +
                        " / " + info.tries() + " / " + info.instructionCount());
            out.println("- Direct field writes: " + info.textFieldsWritten());
            out.println("- Includes exact DinamicX TEXT attribute hash: " + info.hasTextHash());
            out.println("- Calls from this implementation:");
            for (String callee : info.methodCalls()) out.println("  - " + callee);
            var callers = directCallers.getOrDefault(target, Set.of());
            out.println("- Exact direct invoke references (" + callers.size() + "):");
            for (String caller : callers) out.println("  - " + caller);
            out.println();
        }
        reportSubclassOverrides(out);
        out.println("## Virtual dispatch via a target superclass");
        out.println("Target class lineage: " + targetLineage());
        out.println("Calls on the base class may dispatch to the target override "
                    + "depending on the receiver's concrete type.");
        for (var entry : new java.util.TreeMap<>(virtualDispatchReferences).entrySet()) {
            if (!mayDispatchToTarget(entry.getKey())) continue;
            out.println("- " + entry.getKey() + " (" + entry.getValue().size() + " callers)");
            for (String caller : entry.getValue())
                out.println("  - " + caller);
        }
        out.println();
        out.println("## Second-hop exact callers");
        for (String s : external) out.println("- " + s);
        out.println();
        out.println("## Evidence boundaries");
        out.println("- Native .so invocation paths, runtime template loading, "
                    + "server-side templates and Account/login remain unverified.");
        out.println("- Compare ELF library hashes separately using "
                    + "scripts/triage_apk_variants.py.");
        out.println("- These results do not show whether any text was rendered in English.");
    }

    public static void main(String[] args) throws Exception {
        if (args.length < 1 || args.length > 2)
            throw new IllegalArgumentException(
                "Usage: AnalyzeDinamicXRoutes original.apk [report.md]");
        try (var apk = new ZipFile(args[0])) {
            firstPass(apk);
            if (!targetData.keySet().equals(TARGETS)) {
                throw new IllegalStateException(
                    "Unexpected DinamicX code inventory: " + targetData.keySet());
            }
            for (String method : TARGETS) {
                TargetInfo t = targetData.get(method);
                if (t.textFieldsWritten().isEmpty())
                    throw new IllegalStateException("No text field write: " + method);
                if (method.endsWith(ATTRIBUTE) && !t.hasTextHash())
                    throw new IllegalStateException("No expected TEXT hash: " + method);
            }
            secondPass(apk);
        }
        if (args.length == 2) {
            Path output = Path.of(args[1]);
            if (output.getParent() != null) Files.createDirectories(output.getParent());
            try (var writer = new PrintWriter(Files.newBufferedWriter(output))) {
                report(writer);
            }
            System.out.println("Wrote " + output);
        } else {
            var writer = new PrintWriter(System.out, true);
            report(writer);
            writer.flush();
        }
    }
}
