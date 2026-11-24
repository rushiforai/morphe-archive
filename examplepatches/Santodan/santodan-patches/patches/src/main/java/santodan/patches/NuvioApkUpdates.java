package santodan.patches;

import app.morphe.patcher.util.proxy.mutableTypes.*;
import com.android.tools.smali.dexlib2.Opcode;
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction21c;
import com.android.tools.smali.dexlib2.iface.instruction.*;
import com.android.tools.smali.dexlib2.iface.reference.StringReference;
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableStringReference;
import java.util.*;

/** NuvioTV 1.1.1 native updater: same-width constants only; coroutine/installer code stays native. */
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
        new Contract("Llb/j0;", "a", "e94296c134810c7c31a065c43c2ac3396e3032427cd6bcf875402ae22342b897", 0),
        new Contract("Llb/q0;", "a", "deb7b51a09656d29fb4db753f2e42f23b74b576f1b8a8ec7d34b58994f84f1b7", 1),
        new Contract("Llb/q0;", "b", "788cc681e3dc230c66869681503a5f0ede30fc4ae46f3091c2e76607dc763518", 1),
        new Contract("Llb/m0;", "invokeSuspend", "b7abe79091a01e07eb218d85f4fe24e041ce16894debdf0fae026b9cd3fb9ab9", 1),
        new Contract("Llb/k;", "a", "f43f5e7852d380920f517fc1494eee48248a83f7ab18ab558f86d63b14590ace", 1),
        new Contract("Llb/q;", "a", "351e33178447034aede40e09e856a8e92e4357e32974d670d47e7c36e22864ae", 1),
        new Contract("Llb/q;", "d", "8e03c19ad5ab422492cc190ad665b2922441a8808b7a18a0bce99056ea4c1fdc", 1),
        new Contract(JOB, "a", "d1215c1181edde6d7f4979f51cd92354808c0d7701884361b6f84c5da17fd314", 1));

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
