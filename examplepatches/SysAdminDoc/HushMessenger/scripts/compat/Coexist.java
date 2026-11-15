package compat;

import com.android.tools.smali.dexlib2.AccessFlags;
import com.android.tools.smali.dexlib2.DexFileFactory;
import com.android.tools.smali.dexlib2.Opcode;
import com.android.tools.smali.dexlib2.Opcodes;
import com.android.tools.smali.dexlib2.iface.ClassDef;
import com.android.tools.smali.dexlib2.iface.Method;
import com.android.tools.smali.dexlib2.iface.Field;
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction;
import com.android.tools.smali.dexlib2.iface.instruction.Instruction;
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction;
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction;
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction;
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction;
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction;
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction;
import com.android.tools.smali.dexlib2.iface.instruction.ThreeRegisterInstruction;
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction;
import com.android.tools.smali.dexlib2.iface.instruction.SwitchPayload;
import com.android.tools.smali.dexlib2.iface.reference.FieldReference;
import com.android.tools.smali.dexlib2.iface.reference.MethodReference;
import com.android.tools.smali.dexlib2.iface.reference.StringReference;
import com.android.tools.smali.dexlib2.iface.reference.TypeReference;
import com.android.tools.smali.dexlib2.iface.value.StringEncodedValue;

import java.io.*;
import java.nio.file.*;
import java.security.DigestOutputStream;
import java.security.MessageDigest;
import java.security.cert.Certificate;
import java.util.*;
import java.util.jar.JarEntry;
import java.util.jar.JarFile;
import java.util.regex.*;
import java.util.stream.Collectors;
import java.util.zip.ZipEntry;
import java.util.zip.ZipException;
import java.util.zip.ZipFile;

import static compat.CompatReport.*;
import static compat.Bubbles.*;
import static compat.Media.*;
import static compat.Inbox.*;
import static compat.MessageLog.*;
import static compat.Tabs.*;
import static compat.Menus.*;
import static compat.Chats.*;
import static compat.Looks.*;
import static compat.Extras.*;
import static compat.TopBar.*;
import static compat.Controls.*;
import static compat.Drawer.*;

/** Installing beside Meta apps and clones: the own-name pool, the signer check, FBNS and link launchers. */
final class Coexist {

    static final String CLONE = "Clone install under another package name";

    /** Redex string pools' keys that give Messenger's name, as "pool#key". Mirrors ownNamePoolKeys in CloneInstallPatch.kt. */
    static Set<String> ownNamePoolKeys(List<ClassDef> classes) {
        var keys = new HashSet<String>();
        for (var cls : classes) for (var m : cls.getMethods()) {
            if (!AccessFlags.STATIC.isSet(m.getAccessFlags()) || !"Ljava/lang/String;".equals(m.getReturnType()) ||
                m.getParameterTypes().size() != 1 || !"I".equals(m.getParameterTypes().get(0).toString()) || m.getImplementation() == null) continue;
            var code = instructions(m);
            if (code.isEmpty() || !(code.get(0) instanceof OffsetInstruction table) ||
                (code.get(0).getOpcode() != Opcode.PACKED_SWITCH && code.get(0).getOpcode() != Opcode.SPARSE_SWITCH)) continue;
            var indexAt = new HashMap<Integer, Integer>();
            for (int i = 0, address = 0; i < code.size(); address += code.get(i).getCodeUnits(), i++) indexAt.put(address, i);
            var payloadAt = indexAt.get(table.getCodeOffset());
            if (payloadAt == null || !(code.get(payloadAt) instanceof SwitchPayload payload)) continue;
            for (var element : payload.getSwitchElements()) {
                var at = indexAt.get(element.getOffset());
                if (at == null || at + 1 >= code.size()) continue;
                var load = code.get(at);
                if ((load.getOpcode() == Opcode.CONST_STRING || load.getOpcode() == Opcode.CONST_STRING_JUMBO) &&
                    "com.facebook.orca".equals(((StringReference) ((ReferenceInstruction) load).getReference()).getString()) &&
                    code.get(at + 1).getOpcode() == Opcode.RETURN_OBJECT && register(code.get(at + 1)) == register(load))
                    keys.add(hookId(m) + "#" + element.getKey());
            }
        }
        return keys;
    }

    /** Whether some move-result takes Messenger's name from a string pool lookup by a constant key. */
    static boolean pooledOwnName(List<Instruction> code, Set<String> pools) {
        for (int load = 1; load < code.size(); load++) {
            if (code.get(load).getOpcode() != Opcode.MOVE_RESULT_OBJECT || code.get(load - 1).getOpcode() != Opcode.INVOKE_STATIC ||
                !(code.get(load - 1) instanceof FiveRegisterInstruction lookup) || lookup.getRegisterCount() != 1) continue;
            int key = lookup.getRegisterC();
            for (int j = load - 2; j >= 0; j--) {
                if (!code.get(j).getOpcode().setsRegister() || register(code.get(j)) != key) continue;
                if (Set.of(Opcode.CONST_4, Opcode.CONST_16, Opcode.CONST, Opcode.CONST_HIGH16).contains(code.get(j).getOpcode()) &&
                    pools.contains(ref(lookup) + "#" + ((NarrowLiteralInstruction) code.get(j)).getNarrowLiteral())) return true;
                break;
            }
        }
        return false;
    }

    /**
     * The two methods the clone patch edits (CloneInstallPatch.kt): the encrypted-backup preference lookup, a public
     * no-argument constructor that reads getPackageName once, and the static attachment authority check.
     */
    static List<String> cloneSites(List<ClassDef> classes, List<String> failures) {
        var lookups = new ArrayList<String>();
        var checks = new ArrayList<String>();
        var pools = ownNamePoolKeys(classes);
        for (var cls : classes) {
            for (var method : cls.getMethods()) {
                var impl = method.getImplementation();
                if (impl == null) continue;
                var strings = new ArrayList<String>();
                int packageReads = 0;
                for (var insn : impl.getInstructions()) {
                    if (!(insn instanceof ReferenceInstruction ref)) continue;
                    if (ref.getReference() instanceof StringReference s) strings.add(s.getString());
                    if (ref.getReference() instanceof MethodReference m && "Landroid/content/Context;".equals(m.getDefiningClass()) &&
                        "getPackageName".equals(m.getName())) packageReads++;
                }
                // 583 takes Messenger's name from a string pool instead of a constant.
                if (strings.contains("autobackupprefs") && strings.contains("fbautobackupprefs") &&
                    (strings.contains("com.facebook.orca") || pooledOwnName(instructions(method), pools)) &&
                    "<init>".equals(method.getName()) && method.getParameterTypes().isEmpty() && AccessFlags.PUBLIC.isSet(method.getAccessFlags())) {
                    if (packageReads != 1) failures.add(hookId(method) + " reads its package name " + packageReads + " times");
                    lookups.add(hookId(method));
                }
                if (Collections.frequency(strings, "com.facebook.orca.tam-attachment") == 1 && strings.contains(".tam-attachment") &&
                    strings.contains("com.facebook.katana.tam-attachment") && AccessFlags.STATIC.isSet(method.getAccessFlags()) &&
                    "Z".equals(method.getReturnType()) && List.of("Ljava/lang/String;").equals(method.getParameterTypes().stream().map(Object::toString).toList())) {
                    checks.add(hookId(method));
                }
            }
        }
        if (lookups.size() != 1) failures.add("expected one encrypted-backup lookup, found " + lookups.size());
        if (checks.size() != 1) failures.add("expected one attachment authority check, found " + checks.size());
        var sites = new ArrayList<String>(lookups);
        sites.addAll(checks);
        return sites;
    }

    static Method findSignerMethod(List<ClassDef> classes) {
        for (var cls : classes) {
            for (var method : cls.getMethods()) {
                if (!method.getParameterTypes().isEmpty()) continue;
                var impl = method.getImplementation();
                if (impl == null) continue;
                boolean hasApkContents = false, hasHistory = false, hasSignatures = false;
                for (var insn : impl.getInstructions()) {
                    if (!(insn instanceof ReferenceInstruction ref)) continue;
                    var refObj = ref.getReference();
                    if (refObj instanceof MethodReference mRef &&
                        "Landroid/content/pm/SigningInfo;".equals(mRef.getDefiningClass())) {
                        if ("getApkContentsSigners".equals(mRef.getName())) hasApkContents = true;
                        if ("getSigningCertificateHistory".equals(mRef.getName())) hasHistory = true;
                    } else if (refObj instanceof FieldReference fRef &&
                        "Landroid/content/pm/PackageInfo;".equals(fRef.getDefiningClass()) &&
                        "signatures".equals(fRef.getName())) {
                        hasSignatures = true;
                    }
                }
                if (hasApkContents && hasHistory && hasSignatures) return method;
            }
        }
        return null;
    }

    /**
     * FBNS's package check (RestoreTrustPatch.kt's FbnsPackageCheckFingerprint): a void method that reads
     * PackageInfo.signatures once and logs "PackageInfoUtil" and "Failed to create SHA-256 hash". The read's
     * two registers must be distinct and at most v15, as routeFbnsSigners requires.
     */
    static List<String> fbnsCheckProblems(List<ClassDef> classes) {
        var problems = new ArrayList<String>();
        var checks = new ArrayList<Method>();
        for (var cls : classes) {
            for (var method : cls.getMethods()) {
                if (!"V".equals(method.getReturnType()) || method.getImplementation() == null) continue;
                // The fingerprint's filters match in order: the read, then the tag after it, then the hash failure.
                int step = 0;
                for (var insn : method.getImplementation().getInstructions()) {
                    if (!(insn instanceof ReferenceInstruction ref)) continue;
                    if (step == 0 && ref.getReference() instanceof FieldReference f
                        && "Landroid/content/pm/PackageInfo;".equals(f.getDefiningClass()) && "signatures".equals(f.getName())) step = 1;
                    else if (step == 1 && ref.getReference() instanceof StringReference s && "PackageInfoUtil".equals(s.getString())) step = 2;
                    else if (step == 2 && ref.getReference() instanceof StringReference s
                        && "Failed to create SHA-256 hash".equals(s.getString())) step = 3;
                }
                if (step == 3) checks.add(method);
            }
        }
        if (checks.size() != 1) {
            problems.add("expected one FBNS package check, found " + checks.size());
            return problems;
        }
        var reads = new ArrayList<TwoRegisterInstruction>();
        for (var insn : checks.get(0).getImplementation().getInstructions()) {
            if (insn.getOpcode() == Opcode.IGET_OBJECT && ((ReferenceInstruction) insn).getReference() instanceof FieldReference f
                && "Landroid/content/pm/PackageInfo;".equals(f.getDefiningClass()) && "signatures".equals(f.getName())) {
                reads.add((TwoRegisterInstruction) insn);
            }
        }
        if (reads.size() != 1) problems.add("expected one PackageInfo.signatures read in " + hookId(checks.get(0)) + ", found " + reads.size());
        else if (reads.get(0).getRegisterA() == reads.get(0).getRegisterB() || reads.get(0).getRegisterA() > 15 || reads.get(0).getRegisterB() > 15) {
            problems.add("FBNS package check " + hookId(checks.get(0)) + " reads signatures into v" + reads.get(0).getRegisterA()
                + " from v" + reads.get(0).getRegisterB() + ", which the call can't name");
        }
        return problems;
    }

    /**
     * The Threads and Instagram link launchers (RestoreTrustPatch.kt's linkLaunchSites): a void (Context, Uri)
     * method with the app's log tag, with (Context, Intent)Z family launches whose answers the return-void after
     * each drops. Every launch must take the extension call the way the patch places it, and the app's package
     * must load before the tag, as a literal or from a string pool by a constant key (586's armv7 Threads launcher).
     */
    static List<String> linkLauncherProblems(List<ClassDef> classes) {
        var problems = new ArrayList<String>();
        String[][] apps = {{"Threads", "com.instagram.barcelona", "ThreadsLinkLauncher"}, {"Instagram", "com.instagram.android", "InstagramLinkLauncher"}};
        for (var app : apps) {
            var launchers = new ArrayList<Method>();
            for (var cls : classes) {
                for (var method : cls.getMethods()) {
                    if (!"V".equals(method.getReturnType()) || method.getImplementation() == null) continue;
                    if (!List.of("Landroid/content/Context;", "Landroid/net/Uri;").equals(method.getParameterTypes().stream().map(CharSequence::toString).toList())) continue;
                    if (instructions(method).stream().anyMatch(i -> app[2].equals(inboxString(i)))) launchers.add(method);
                }
            }
            if (launchers.size() != 1) {
                problems.add("expected one " + app[0] + " link launcher, found " + launchers.size());
                continue;
            }
            var code = instructions(launchers.get(0));
            int named = -1, tag = -1;
            for (int i = 0; i < code.size(); i++) {
                if (named < 0 && (app[1].equals(inboxString(code.get(i))) || app[1].equals(pooledLinkPackage(classes, launchers.get(0), code, i)))) named = i;
                if (tag < 0 && app[2].equals(inboxString(code.get(i)))) tag = i;
            }
            if (named < 0 || named > tag) {
                problems.add(app[0] + "'s link launcher " + hookId(launchers.get(0)) + " doesn't load " + app[1] + " before its tag");
                continue;
            }
            String why = linkLaunchProblem(launchers.get(0));
            if (why != null) problems.add(app[0] + "'s link launcher " + hookId(launchers.get(0)) + " " + why);
        }
        return problems;
    }

    /**
     * What the move-result at {@code at} takes from a Redex string pool looked up by a constant key straight ahead of it,
     * with nothing jumping between them, as RestoreTrustPatch.kt's requireLinkPackage reads it. Null for anything else.
     */
    static String pooledLinkPackage(List<ClassDef> classes, Method method, List<Instruction> code, int at) {
        if (at < 2 || code.get(at).getOpcode() != Opcode.MOVE_RESULT_OBJECT || code.get(at - 1).getOpcode() != Opcode.INVOKE_STATIC ||
            !(code.get(at - 1) instanceof FiveRegisterInstruction lookup) || lookup.getRegisterCount() != 1 ||
            !(((ReferenceInstruction) lookup).getReference() instanceof MethodReference pool)) return null;
        var key = code.get(at - 2);
        if (!Set.of(Opcode.CONST_4, Opcode.CONST_16, Opcode.CONST, Opcode.CONST_HIGH16).contains(key.getOpcode()) ||
            register(key) != lookup.getRegisterC()) return null;
        var targets = mediaTargets(method);
        if (targets.contains(at - 1) || targets.contains(at)) return null;
        var pools = new ArrayList<Method>();
        for (var cls : classes) if (cls.getType().equals(pool.getDefiningClass()))
            for (var m : cls.getMethods()) if (hookId(m).equals(pool.toString())) pools.add(m);
        return pools.size() == 1 ? poolString(pools.get(0), ((NarrowLiteralInstruction) key).getNarrowLiteral()) : null;
    }

    /** What a Redex string pool answers for a key, as RestoreTrustPatch.kt's poolString. */
    static String poolString(Method pool, int key) {
        var impl = pool.getImplementation();
        if (impl == null || !AccessFlags.STATIC.isSet(pool.getAccessFlags()) || !"Ljava/lang/String;".equals(pool.getReturnType()) ||
            pool.getParameterTypes().size() != 1 || !"I".equals(pool.getParameterTypes().get(0).toString())) return null;
        var code = instructions(pool);
        if (code.isEmpty() || !(code.get(0) instanceof OffsetInstruction table) ||
            (code.get(0).getOpcode() != Opcode.PACKED_SWITCH && code.get(0).getOpcode() != Opcode.SPARSE_SWITCH) ||
            register(code.get(0)) != impl.getRegisterCount() - 1) return null;
        var indexAt = new HashMap<Integer, Integer>();
        for (int i = 0, address = 0; i < code.size(); address += code.get(i).getCodeUnits(), i++) indexAt.put(address, i);
        var payloadAt = indexAt.get(table.getCodeOffset());
        if (payloadAt == null || !(code.get(payloadAt) instanceof SwitchPayload payload)) return null;
        var cases = payload.getSwitchElements().stream().filter(e -> e.getKey() == key).toList();
        if (cases.size() != 1) return null;
        Integer at = indexAt.get(cases.get(0).getOffset());
        if (at == null || at + 1 >= code.size()) return null;
        var load = code.get(at);
        if ((load.getOpcode() != Opcode.CONST_STRING && load.getOpcode() != Opcode.CONST_STRING_JUMBO) ||
            code.get(at + 1).getOpcode() != Opcode.RETURN_OBJECT || register(code.get(at + 1)) != register(load)) return null;
        return ((StringReference) ((ReferenceInstruction) load).getReference()).getString();
    }

    static String linkLaunchProblem(Method method) {
        if (AccessFlags.STATIC.isSet(method.getAccessFlags())) return "is static";
        var code = instructions(method);
        var launches = new ArrayList<Integer>();
        for (int i = 0; i < code.size(); i++) {
            if (code.get(i).getOpcode() == Opcode.INVOKE_VIRTUAL && ((ReferenceInstruction) code.get(i)).getReference() instanceof MethodReference m
                && "Z".equals(m.getReturnType()) && List.of("Landroid/content/Context;", "Landroid/content/Intent;").equals(m.getParameterTypes().stream().map(CharSequence::toString).toList())) {
                launches.add(i);
            }
        }
        if (launches.isEmpty()) return "has no launches";
        for (int index : launches) {
            String why = linkLaunchProblem(method, code, index);
            if (why != null) return why;
        }
        return null;
    }

    static String linkLaunchProblem(Method method, List<Instruction> code, int index) {
        if (index + 1 >= code.size() || code.get(index + 1).getOpcode() != Opcode.RETURN_VOID) return "uses its launch's answer";
        if (mediaTargets(method).contains(index + 1)) return "jumps to the return after its launch";
        var call = (FiveRegisterInstruction) code.get(index);
        int launcher = call.getRegisterC(), context = call.getRegisterD(), intent = call.getRegisterE();
        if (launcher == context || launcher == intent || context == intent || Math.max(launcher, Math.max(context, intent)) > 15) {
            return "launches with v" + launcher + ", v" + context + " and v" + intent + ", which the call can't name";
        }
        if (context != method.getImplementation().getRegisterCount() - 2) return "launches with a Context other than its own";
        int build = -1, builds = 0;
        for (int i = 0; i < code.size(); i++) {
            if (code.get(i).getOpcode() == Opcode.INVOKE_STATIC && ((ReferenceInstruction) code.get(i)).getReference() instanceof MethodReference m
                && "Landroid/content/Intent;".equals(m.getReturnType()) && List.of("Landroid/net/Uri;").equals(m.getParameterTypes().stream().map(CharSequence::toString).toList())) {
                build = i;
                builds++;
            }
        }
        if (builds != 1) return "builds " + builds + " intents from its link, expected 1";
        if (build > index || code.get(build + 1).getOpcode() != Opcode.MOVE_RESULT_OBJECT
            || ((OneRegisterInstruction) code.get(build + 1)).getRegisterA() != intent) {
            return "launches an intent other than the one it built from the link";
        }
        // The catch block after the return reuses the register for its log message, which can't reach the launch.
        for (int i = build + 2; i < index; i++) {
            if (code.get(i).getOpcode().setsRegister() && code.get(i) instanceof OneRegisterInstruction one && one.getRegisterA() == intent) {
                return "writes its intent's register again before its launch";
            }
        }
        int[] addresses = new int[code.size() + 1];
        for (int i = 0; i < code.size(); i++) addresses[i + 1] = addresses[i] + code.get(i).getCodeUnits();
        var indexAt = new HashMap<Integer, Integer>();
        for (int i = 0; i < code.size(); i++) indexAt.put(addresses[i], i);
        for (int i = index + 1; i < code.size(); i++) {
            if (!(code.get(i) instanceof OffsetInstruction jump)) continue;
            int landing = addresses[i] + jump.getCodeOffset();
            var cases = new ArrayList<Integer>();
            if (jump.getOpcode() == Opcode.PACKED_SWITCH || jump.getOpcode() == Opcode.SPARSE_SWITCH) {
                Integer at = indexAt.get(landing);
                if (at != null && code.get(at) instanceof SwitchPayload payload) for (var e : payload.getSwitchElements()) cases.add(addresses[i] + e.getOffset());
            } else {
                cases.add(landing);
            }
            for (int c : cases) if (c <= addresses[index]) return "jumps back to its launch from after it";
        }
        return null;
    }
}
