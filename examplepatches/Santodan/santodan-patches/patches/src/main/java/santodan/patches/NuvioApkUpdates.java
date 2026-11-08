package santodan.patches;

import app.morphe.patcher.util.proxy.mutableTypes.*;
import com.android.tools.smali.dexlib2.Opcode;
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction21c;
import com.android.tools.smali.dexlib2.iface.instruction.*;
import com.android.tools.smali.dexlib2.iface.reference.StringReference;
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableStringReference;
import java.util.*;

/** Beta.8 native updater: same-width constants only; coroutine/installer code stays native. */
public final class NuvioApkUpdates {
    static final String JOB = "Lcom/nuvio/tv/updater/UpdateJobService;";
    public static final List<String> TYPES = List.of("Llb/j0;", "Llb/q0;", "Llb/m0;", "Llb/k;", "Llb/q;", JOB);
    static final String APP_VERSION = software.santodan.nuvio.NuvioNative.VERSION;
    static final class Contract {
        final String type, name, hash;
        final int versions;
        Contract(String type, String name, String hash, int versions) {
            this.type = type; this.name = name; this.hash = hash; this.versions = versions;
        }
        String type() { return type; }
        String name() { return name; }
        String hash() { return hash; }
        int versions() { return versions; }
        public String toString() { return type + "->" + name; }
    }
    static final List<Contract> CONTRACTS = List.of(
        new Contract("Llb/j0;", "a", "b160c7d497b0eb00a9de4ff8060fbae7acdb9e3fab8c7c43e0dc99553bc3fcc9", 0),
        new Contract("Llb/q0;", "a", "0d05364ac7f38e385b56e97c40d382595fbe8a7c980a344c272a512fc05dfda4", 1),
        new Contract("Llb/q0;", "b", "eb15160a3bc6340f7bd8581bfb4dea925e9ebb042e34c2fe81b0a0d2846966fe", 1),
        new Contract("Llb/m0;", "invokeSuspend", "e701d1bd8b696b04773508d38656dea3735ec26687f0b46199bd5ed49c818a25", 1),
        new Contract("Llb/k;", "a", "a51ab9e77200f2d9771de6347171456cc67b13e744b4ed710c1868018e69c19e", 1),
        new Contract("Llb/q;", "a", "698e27dfa5a44d7fac6a639545316713bd8643b515fafd3219ecba68c6c7efa6", 1),
        new Contract("Llb/q;", "d", "b48748b53656262871e9290b1e4d3434c69d423b4d5b2321de51e6f6256a3140", 1),
        new Contract(JOB, "a", "593b1344d951c10de39e14e64ff970fbb288ec159fddb6f21e312dea0ef880ff", 1));

    public static boolean validVersion(String value) {
        return value.matches("(0|[1-9][0-9]{0,8})\\.(0|[1-9][0-9]{0,8})\\.(0|[1-9][0-9]{0,8})(?:-[0-9A-Za-z-]+(?:\\.[0-9A-Za-z-]+)*)?");
    }
    static String string(Instruction instruction) {
        if (!(instruction instanceof ReferenceInstruction)) return "";
        var reference = ((ReferenceInstruction) instruction).getReference();
        return reference instanceof StringReference ? ((StringReference) reference).getString() : "";
    }
    static List<MutableMethod> validate(Map<String, MutableClass> classes) {
        List<MutableMethod> methods = new ArrayList<>();
        for (Contract c : CONTRACTS) {
            MutableClass owner = classes.get(c.type());
            if (owner == null) throw new IllegalStateException("Missing native updater " + c.type());
            var candidates = owner.getMethods().stream().filter(m -> m.getName().equals(c.name())).collect(java.util.stream.Collectors.toList());
            if (candidates.size() != 1) throw new IllegalStateException("Missing/ambiguous native updater " + c);
            MutableMethod method = candidates.get(0);
            String parameters = c.type().equals("Llb/j0;") ? "Llb/l;Lkotlin/coroutines/jvm/internal/ContinuationImpl;" :
                c.type().equals("Llb/q0;") ? c.name().equals("a") ? "Llb/q0;Lkotlin/coroutines/jvm/internal/ContinuationImpl;" : "Llb/q0;Llb/l;" :
                c.type().equals("Llb/m0;") ? "Ljava/lang/Object;" : c.type().equals("Llb/k;") ? "" : "Lkotlin/coroutines/jvm/internal/ContinuationImpl;";
            String result = c.type().equals("Llb/k;") ? "Llb/l;" : c.type().equals("Llb/q0;") && c.name().equals("b") ? "Ljava/lang/String;" : "Ljava/lang/Object;";
            boolean isStatic = c.type().equals("Llb/q0;") || c.type().equals("Llb/k;");
            if (c.type().equals(JOB)) {
                parameters = JOB + "Lcom/nuvio/tv/updater/UpdateJobService$a;Lkotlin/coroutines/jvm/internal/ContinuationImpl;";
                isStatic = true;
            }
            if (!method.toString().equals(c.type() + "->" + c.name() + "(" + parameters + ")" + result) ||
                ((method.getAccessFlags() & 8) != 0) != isStatic)
                throw new IllegalStateException("Incompatible native updater signature " + c);
            if (method.getImplementation() == null || !NuvioPlaybackButtonsPatch.fingerprint(method).equals(c.hash()))
                throw new IllegalStateException("Changed or already patched native updater " + c);
            var code = NuvioRemainingEpisodesPatch.instructions(method);
            if (code.stream().filter(i -> string(i).equals(APP_VERSION)).count() != c.versions())
                throw new IllegalStateException("Unexpected updater version constants " + c);
            if (c.versions() == 0 && (code.stream().filter(i -> string(i).equals("NuvioMedia")).count() != 1 ||
                code.stream().filter(i -> string(i).equals("NuvioTV")).count() != 1))
                throw new IllegalStateException("Unexpected GitHub repository constants");
            methods.add(method);
        }
        return methods;
    }
    public static void apply(Map<String, MutableClass> classes, String owner, String repository, String version) {
        if (!(owner + "/" + repository).matches("[A-Za-z0-9-]+/[A-Za-z0-9_.-]+") || !validVersion(version))
            throw new IllegalArgumentException("Invalid GitHub repository or installed release version");
        // Validate every contract before the first mutation, including cached-download cleanup.
        var methods = validate(classes);
        for (var method : methods) {
            var code = NuvioRemainingEpisodesPatch.instructions(method);
            for (int index = 0; index < code.size(); index++) {
                Instruction instruction = code.get(index);
                String old = string(instruction);
                String replacement = old.equals(APP_VERSION) ? version : method.getDefiningClass().equals("Llb/j0;") ?
                    old.equals("NuvioMedia") ? owner : old.equals("NuvioTV") ? repository : null : null;
                if (replacement != null) {
                    if (instruction.getOpcode() != Opcode.CONST_STRING) throw new IllegalStateException("Unexpected constant encoding");
                    method.getImplementation().replaceInstruction(index, new BuilderInstruction21c(Opcode.CONST_STRING,
                        ((OneRegisterInstruction) instruction).getRegisterA(), new ImmutableStringReference(replacement)));
                }
            }
        }
    }
}
