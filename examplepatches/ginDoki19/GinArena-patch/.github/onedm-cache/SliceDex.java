import com.android.tools.smali.dexlib2.AccessFlags;
import com.android.tools.smali.dexlib2.DexFileFactory;
import com.android.tools.smali.dexlib2.Opcode;
import com.android.tools.smali.dexlib2.Opcodes;
import com.android.tools.smali.dexlib2.iface.ClassDef;
import com.android.tools.smali.dexlib2.iface.DexFile;
import com.android.tools.smali.dexlib2.iface.Method;
import com.android.tools.smali.dexlib2.iface.MethodImplementation;
import com.android.tools.smali.dexlib2.iface.MethodParameter;
import com.android.tools.smali.dexlib2.iface.instruction.Instruction;
import com.android.tools.smali.dexlib2.iface.instruction.formats.Instruction12x;
import com.android.tools.smali.dexlib2.iface.instruction.formats.Instruction21c;
import com.android.tools.smali.dexlib2.iface.instruction.formats.Instruction22x;
import com.android.tools.smali.dexlib2.iface.instruction.formats.Instruction32x;
import com.android.tools.smali.dexlib2.iface.instruction.formats.Instruction35c;
import com.android.tools.smali.dexlib2.iface.instruction.formats.Instruction3rc;
import com.android.tools.smali.dexlib2.iface.reference.MethodReference;
import com.android.tools.smali.dexlib2.iface.reference.TypeReference;
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef;
import com.android.tools.smali.dexlib2.immutable.ImmutableDexFile;
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod;
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation;
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter;
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction10x;
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction35c;
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction3rc;
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableMethodReference;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.HashSet;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.zip.ZipEntry;
import java.util.zip.ZipFile;
import java.util.zip.ZipOutputStream;

/**
 * Prepares 1DM 20.0 (30257) classes*.dex for headless JVM execution:
 * 1. Slices each DEX to 1DM + Gson/Guava/Kotlin/AndroidX-core classes so per-DEX method counts stay well under 65K.
 * 2. Restores R8-stripped trivial <init> bridges (new-instance Sub + invoke-direct Super.<init> -> Sub.<init>)
 *    across all DEX files so dex2jar preserves exact object allocation types.
 * 3. Upgrades .class headers from Java 6 (50) to Java 8 (52) for static/default interface method support.
 */
public final class SliceDex {

    private static boolean keep(String type) {
        return type.startsWith("Li/")
            || type.startsWith("Lidm/")
            || type.startsWith("Lacr/")
            || type.startsWith("Lcom/aspsine/")
            || type.startsWith("Lcom/google/gson/")
            || type.startsWith("Lcom/google/common/")
            || type.startsWith("Lcom/google/thirdparty/")
            || type.startsWith("Lkotlin/")
            || type.startsWith("Lokhttp3/")
            || type.startsWith("Lokio/")
            || type.startsWith("Landroidx/collection/")
            || type.startsWith("Landroidx/core/");
    }

    public static void main(String[] args) throws Exception {
        if (args.length == 2 && "--fix-jar".equals(args[0])) {
            upgradeClassVersionInJar(new File(args[1]));
            return;
        }
        if (args.length == 3 && "--slice-dir".equals(args[0])) {
            sliceDirectory(new File(args[1]), new File(args[2]));
            return;
        }
        throw new IllegalArgumentException(
            "Usage: SliceDex --slice-dir <inDexDir> <outDexDir> | SliceDex --fix-jar <jar>"
        );
    }

    private static void sliceDirectory(File inDir, File outDir) throws Exception {
        outDir.mkdirs();
        File[] dexFiles = inDir.listFiles((d, name) -> name.startsWith("classes") && name.endsWith(".dex"));
        if (dexFiles == null || dexFiles.length == 0) {
            throw new IllegalStateException("No classes*.dex found in " + inDir);
        }
        Arrays.sort(dexFiles);

        Map<File, List<ClassDef>> perDexClasses = new LinkedHashMap<>();
        Map<String, Set<String>> existingInits = new HashMap<>();
        Map<String, Map<String, MethodReference>> neededInits = new HashMap<>();

        // Pass 1: Load kept classes & discover R8-elided <init> bridges across all DEX files
        for (File dexFile : dexFiles) {
            DexFile df = DexFileFactory.loadDexFile(dexFile, Opcodes.getDefault());
            List<ClassDef> kept = new ArrayList<>();
            for (ClassDef cd : df.getClasses()) {
                if (!keep(cd.getType())) continue;
                kept.add(cd);
                Set<String> sigs = existingInits.computeIfAbsent(cd.getType(), k -> new HashSet<>());
                for (Method m : cd.getDirectMethods()) {
                    if ("<init>".equals(m.getName())) {
                        sigs.add(paramKey(m.getParameterTypes()));
                    }
                }
            }
            perDexClasses.put(dexFile, kept);
        }

        for (List<ClassDef> kept : perDexClasses.values()) {
            for (ClassDef cd : kept) {
                for (Method m : cd.getMethods()) {
                    MethodImplementation impl = m.getImplementation();
                    if (impl == null) continue;
                    scanOrRewriteMethod(impl, existingInits, neededInits, false);
                }
            }
        }

        // Note: if Sub1 -> Super0.<init> where Super0 also lacked <init> (chained elision), propagate up superclasses
        Map<String, String> superMap = new HashMap<>();
        for (List<ClassDef> kept : perDexClasses.values()) {
            for (ClassDef cd : kept) {
                if (cd.getSuperclass() != null) {
                    superMap.put(cd.getType(), cd.getSuperclass());
                }
            }
        }

        // Pass 2: Rewrite invoke-direct sites & synthesize missing <init> bridges
        for (Map.Entry<File, List<ClassDef>> entry : perDexClasses.entrySet()) {
            List<ClassDef> srcClasses = entry.getValue();
            if (srcClasses.isEmpty()) continue;

            List<ClassDef> outClasses = new ArrayList<>(srcClasses.size());
            for (ClassDef cd : srcClasses) {
                List<Method> direct = new ArrayList<>();
                for (Method m : cd.getDirectMethods()) {
                    direct.add(rewriteMethodIfNeeded(m, existingInits, neededInits));
                }
                Map<String, MethodReference> synthMap = neededInits.get(cd.getType());
                if (synthMap != null) {
                    Set<String> have = existingInits.computeIfAbsent(cd.getType(), k -> new HashSet<>());
                    for (Map.Entry<String, MethodReference> se : synthMap.entrySet()) {
                        if (have.add(se.getKey())) {
                            direct.add(buildBridgeConstructor(cd, se.getValue(), superMap, existingInits));
                        }
                    }
                }

                List<Method> virtual = new ArrayList<>();
                for (Method m : cd.getVirtualMethods()) {
                    virtual.add(rewriteMethodIfNeeded(m, existingInits, neededInits));
                }

                List<String> filteredIfaces = new ArrayList<>();
                for (String iface : cd.getInterfaces()) {
                    if (existingInits.containsKey(iface)
                        || iface.startsWith("Ljava/")
                        || iface.startsWith("Ljavax/")
                        || iface.startsWith("Landroid/")) {
                        filteredIfaces.add(iface);
                    }
                }

                outClasses.add(new ImmutableClassDef(
                    cd.getType(),
                    cd.getAccessFlags(),
                    cd.getSuperclass(),
                    filteredIfaces,
                    cd.getSourceFile(),
                    cd.getAnnotations(),
                    cd.getStaticFields(),
                    cd.getInstanceFields(),
                    direct,
                    virtual
                ));
            }

            File outDex = new File(outDir, entry.getKey().getName());
            DexFileFactory.writeDexFile(
                outDex.getAbsolutePath(),
                new ImmutableDexFile(Opcodes.getDefault(), outClasses)
            );
        }
    }

    private static Method rewriteMethodIfNeeded(
        Method m,
        Map<String, Set<String>> existingInits,
        Map<String, Map<String, MethodReference>> neededInits
    ) {
        MethodImplementation impl = m.getImplementation();
        if (impl == null) return m;
        List<Instruction> rewritten = scanOrRewriteMethod(impl, existingInits, neededInits, true);
        if (rewritten == null) return m;
        MethodImplementation newImpl = new ImmutableMethodImplementation(
            impl.getRegisterCount(),
            rewritten,
            impl.getTryBlocks(),
            impl.getDebugItems()
        );
        return new ImmutableMethod(
            m.getDefiningClass(),
            m.getName(),
            m.getParameters(),
            m.getReturnType(),
            m.getAccessFlags(),
            m.getAnnotations(),
            m.getHiddenApiRestrictions(),
            newImpl
        );
    }

    private static List<Instruction> scanOrRewriteMethod(
        MethodImplementation impl,
        Map<String, Set<String>> existingInits,
        Map<String, Map<String, MethodReference>> neededInits,
        boolean rewrite
    ) {
        Map<Integer, String> uninitRegs = new HashMap<>();
        List<Instruction> out = rewrite ? new ArrayList<>() : null;
        boolean changed = false;

        for (Instruction insn : impl.getInstructions()) {
            Opcode op = insn.getOpcode();
            Instruction replacement = insn;

            if (op == Opcode.NEW_INSTANCE) {
                Instruction21c ni = (Instruction21c) insn;
                String allocType = ((TypeReference) ni.getReference()).getType();
                uninitRegs.put(ni.getRegisterA(), allocType);
            } else if ((op == Opcode.MOVE_OBJECT || op == Opcode.MOVE_OBJECT_FROM16 || op == Opcode.MOVE_OBJECT_16)) {
                int dst = -1, src = -1;
                if (insn instanceof Instruction12x) {
                    dst = ((Instruction12x) insn).getRegisterA();
                    src = ((Instruction12x) insn).getRegisterB();
                } else if (insn instanceof Instruction22x) {
                    dst = ((Instruction22x) insn).getRegisterA();
                    src = ((Instruction22x) insn).getRegisterB();
                } else if (insn instanceof Instruction32x) {
                    dst = ((Instruction32x) insn).getRegisterA();
                    src = ((Instruction32x) insn).getRegisterB();
                }
                if (dst >= 0) {
                    String t = uninitRegs.get(src);
                    if (t != null) uninitRegs.put(dst, t);
                    else uninitRegs.remove(dst);
                }
            } else if (op == Opcode.INVOKE_DIRECT && insn instanceof Instruction35c) {
                Instruction35c inv = (Instruction35c) insn;
                MethodReference mr = (MethodReference) inv.getReference();
                if ("<init>".equals(mr.getName()) && inv.getRegisterCount() >= 1) {
                    int receiver = inv.getRegisterC();
                    String allocType = uninitRegs.remove(receiver);
                    if (allocType != null && !allocType.equals(mr.getDefiningClass()) && existingInits.containsKey(allocType)) {
                        String pKey = paramKey(mr.getParameterTypes());
                        neededInits.computeIfAbsent(allocType, k -> new LinkedHashMap<>()).putIfAbsent(pKey, mr);
                        if (rewrite) {
                            ImmutableMethodReference newRef = new ImmutableMethodReference(
                                allocType, "<init>", mr.getParameterTypes(), "V"
                            );
                            replacement = new ImmutableInstruction35c(
                                Opcode.INVOKE_DIRECT,
                                inv.getRegisterCount(),
                                inv.getRegisterC(),
                                inv.getRegisterD(),
                                inv.getRegisterE(),
                                inv.getRegisterF(),
                                inv.getRegisterG(),
                                newRef
                            );
                            changed = true;
                        }
                    }
                    // Clear any aliases of the same uninitialized reference
                    if (allocType != null) {
                        uninitRegs.values().removeIf(v -> v.equals(allocType));
                    }
                }
            } else if (op == Opcode.INVOKE_DIRECT_RANGE && insn instanceof Instruction3rc) {
                Instruction3rc inv = (Instruction3rc) insn;
                MethodReference mr = (MethodReference) inv.getReference();
                if ("<init>".equals(mr.getName()) && inv.getRegisterCount() >= 1) {
                    int receiver = inv.getStartRegister();
                    String allocType = uninitRegs.remove(receiver);
                    if (allocType != null && !allocType.equals(mr.getDefiningClass()) && existingInits.containsKey(allocType)) {
                        String pKey = paramKey(mr.getParameterTypes());
                        neededInits.computeIfAbsent(allocType, k -> new LinkedHashMap<>()).putIfAbsent(pKey, mr);
                        if (rewrite) {
                            ImmutableMethodReference newRef = new ImmutableMethodReference(
                                allocType, "<init>", mr.getParameterTypes(), "V"
                            );
                            replacement = new ImmutableInstruction3rc(
                                Opcode.INVOKE_DIRECT_RANGE,
                                inv.getStartRegister(),
                                inv.getRegisterCount(),
                                newRef
                            );
                            changed = true;
                        }
                    }
                    if (allocType != null) {
                        uninitRegs.values().removeIf(v -> v.equals(allocType));
                    }
                }
            }

            if (rewrite) {
                out.add(replacement);
            }
        }
        return (rewrite && changed) ? out : null;
    }

    private static Method buildBridgeConstructor(
        ClassDef cd,
        MethodReference targetInit,
        Map<String, String> superMap,
        Map<String, Set<String>> existingInits
    ) {
        List<MethodParameter> params = new ArrayList<>();
        int regCount = 1; // p0 = this
        for (CharSequence pt : targetInit.getParameterTypes()) {
            String ps = pt.toString();
            params.add(new ImmutableMethodParameter(ps, null, null));
            regCount += ("J".equals(ps) || "D".equals(ps)) ? 2 : 1;
        }

        // Call targetInit directly (Dalvik permits super-ancestor <init>, or immediate superclass if it declares/synthesizes it)
        String superTargetClass = targetInit.getDefiningClass();
        String immediateSuper = cd.getSuperclass();
        String pKey = paramKey(targetInit.getParameterTypes());
        if (immediateSuper != null && existingInits.getOrDefault(immediateSuper, Collections.emptySet()).contains(pKey)) {
            superTargetClass = immediateSuper;
        }

        ImmutableMethodReference superRef = new ImmutableMethodReference(
            superTargetClass, "<init>", targetInit.getParameterTypes(), "V"
        );
        List<Instruction> insns = Arrays.asList(
            new ImmutableInstruction3rc(Opcode.INVOKE_DIRECT_RANGE, 0, regCount, superRef),
            new ImmutableInstruction10x(Opcode.RETURN_VOID)
        );
        ImmutableMethodImplementation impl = new ImmutableMethodImplementation(regCount, insns, null, null);
        return new ImmutableMethod(
            cd.getType(),
            "<init>",
            params,
            "V",
            AccessFlags.PUBLIC.getValue() | AccessFlags.CONSTRUCTOR.getValue(),
            null,
            null,
            impl
        );
    }

    private static String paramKey(List<? extends CharSequence> types) {
        StringBuilder sb = new StringBuilder("(");
        for (CharSequence t : types) sb.append(t);
        return sb.append(")").toString();
    }

    private static void upgradeClassVersionInJar(File jarFile) throws Exception {
        File tmp = new File(jarFile.getParentFile(), jarFile.getName() + ".tmp");
        try (ZipFile zf = new ZipFile(jarFile);
             ZipOutputStream zos = new ZipOutputStream(new FileOutputStream(tmp))) {
            Enumeration<? extends ZipEntry> en = zf.entries();
            byte[] buf = new byte[16384];
            while (en.hasMoreElements()) {
                ZipEntry ze = en.nextElement();
                ByteArrayOutputStream bos = new ByteArrayOutputStream();
                try (InputStream is = zf.getInputStream(ze)) {
                    int n;
                    while ((n = is.read(buf)) != -1) bos.write(buf, 0, n);
                }
                byte[] data = bos.toByteArray();
                if (ze.getName().endsWith(".class") && data.length >= 8) {
                    int major = ((data[6] & 0xff) << 8) | (data[7] & 0xff);
                    if (major < 52) {
                        data[6] = 0;
                        data[7] = 52;
                    }
                }
                ZipEntry outEntry = new ZipEntry(ze.getName());
                zos.putNextEntry(outEntry);
                zos.write(data);
                zos.closeEntry();
            }
        }
        Files.move(tmp.toPath(), jarFile.toPath(), StandardCopyOption.REPLACE_EXISTING);
    }
}
