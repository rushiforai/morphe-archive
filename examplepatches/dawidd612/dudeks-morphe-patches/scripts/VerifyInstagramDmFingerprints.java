import java.nio.ByteBuffer;
import java.util.*;
import java.util.zip.ZipFile;
import app.template.patches.instagram.scroll.DirectSendCompletedFingerprint;
import app.template.patches.instagram.scroll.DirectTextSendFingerprint;
import com.android.tools.smali.dexlib2.*;
import com.android.tools.smali.dexlib2.dexbacked.DexBackedDexFile;
import com.android.tools.smali.dexlib2.iface.*;
import com.android.tools.smali.dexlib2.iface.instruction.*;
import com.android.tools.smali.dexlib2.iface.reference.*;
import com.android.tools.smali.dexlib2.immutable.*;
import com.android.tools.smali.dexlib2.immutable.instruction.*;
import com.android.tools.smali.dexlib2.immutable.reference.*;

/** Tests the production predicate, including callbacks without business-share logging. */
public class VerifyInstagramDmFingerprints {
    static final List<String> PARAMETERS = List.of("Ltest/Send;", "Ltest/Kind;", "Ltest/Reply;", "I");
    static void require(boolean ok, String why) { if (!ok) throw new AssertionError(why); }
    static MethodReference call(Instruction instruction) {
        return instruction instanceof ReferenceInstruction r && r.getReference() instanceof MethodReference m ? m : null;
    }
    static Method fixture(String name, List<String> parameters, boolean delayedScroll) {
        var code = new ArrayList<Instruction>();
        if (delayedScroll) code.add(new ImmutableInstruction35c(Opcode.INVOKE_VIRTUAL, 4, 0, 1, 2, 3, 0,
            new ImmutableMethodReference("Landroid/view/View;", "postDelayed", List.of("Ljava/lang/Runnable;", "J"), "Z")));
        code.add(new ImmutableInstruction10x(Opcode.RETURN_VOID));
        return new ImmutableMethod("Ltest/Completion;", name,
            parameters.stream().map(p -> new ImmutableMethodParameter(p, Set.of(), null)).toList(),
            "V", AccessFlags.PUBLIC.getValue(), Set.of(), Set.of(),
            new ImmutableMethodImplementation(9, code, List.of(), List.of()));
    }
    static ClassDef owner(Method method, String callbackInterface) {
        return new ImmutableClassDef(method.getDefiningClass(), AccessFlags.PUBLIC.getValue(),
            "Ljava/lang/Object;", List.of(callbackInterface), null, Set.of(), List.of(), List.of(method));
    }
    static void fixtures() {
        var callback = new ImmutableMethodReference("Ltest/Callback;", "complete", PARAMETERS, "V");
        var predicate = new DirectSendCompletedFingerprint(List.of(callback)).getCustom();
        Method completed = fixture("complete", PARAMETERS, true);
        require(predicate.invoke(completed, owner(completed, callback.getDefiningClass())),
            "Callback without optional logging must match");
        require(!predicate.invoke(completed, owner(completed, "Ltest/Unrelated;")),
            "Unrelated delayed work must not match");
        Method wrongName = fixture("other", PARAMETERS, true);
        require(!predicate.invoke(wrongName, owner(wrongName, callback.getDefiningClass())), "Wrong callback method");
        Method wrongReply = fixture("complete", List.of("Ltest/Send;", "Ltest/Kind;", "Ltest/Other;", "I"), true);
        require(!predicate.invoke(wrongReply, owner(wrongReply, callback.getDefiningClass())), "Wrong reply type");
        Method noScroll = fixture("complete", PARAMETERS, false);
        require(!predicate.invoke(noScroll, owner(noScroll, callback.getDefiningClass())), "Callback without scroll");
        require(!new DirectSendCompletedFingerprint(List.of()).getCustom().invoke(completed,
            owner(completed, callback.getDefiningClass())), "Missing sender callback must fail closed");
        System.out.println("PASS: production fingerprint accepts log-free callback and rejects unrelated work");
    }
    static void apk(String path) throws Exception {
        List<ClassDef> classes = new ArrayList<>();
        try (ZipFile zip = new ZipFile(path)) {
            var entries = zip.entries();
            while (entries.hasMoreElements()) {
                var entry = entries.nextElement();
                if (entry.getName().matches("classes[0-9]*\\.dex")) classes.addAll(new DexBackedDexFile(
                    Opcodes.getDefault(), ByteBuffer.wrap(zip.getInputStream(entry).readAllBytes())).getClasses());
            }
        }
        List<Method> senders = new ArrayList<>();
        for (ClassDef c : classes) for (Method m : c.getMethods()) {
            if (!m.getReturnType().equals("Z") || m.getImplementation() == null) continue;
            Set<String> strings = new HashSet<>();
            for (Instruction i : m.getImplementation().getInstructions())
                if (i instanceof ReferenceInstruction r && r.getReference() instanceof StringReference s) strings.add(s.getString());
            if (strings.containsAll(DirectTextSendFingerprint.INSTANCE.getStrings())) senders.add(m);
        }
        require(senders.size() == 1, "Expected exactly one Direct text sender");
        List<MethodReference> callbacks = new ArrayList<>();
        for (Instruction i : senders.getFirst().getImplementation().getInstructions()) {
            var r = call(i);
            if (r != null && r.getReturnType().equals("V") && r.getParameterTypes().size() == 4 &&
                r.getParameterTypes().getLast().equals("I")) callbacks.add(r);
        }
        var predicate = new DirectSendCompletedFingerprint(callbacks).getCustom();
        List<Method> completions = new ArrayList<>();
        for (ClassDef c : classes) for (Method m : c.getMethods())
            if (m.getReturnType().equals("V") && predicate.invoke(m, c)) completions.add(m);
        require(completions.size() == 1, "Expected one sender-linked delayed-scroll callback, got " + completions.size());
        System.out.println("PASS: unique production fingerprint in " + path + ": " + completions.getFirst());
    }
    public static void main(String[] args) throws Exception {
        fixtures();
        for (String path : args) apk(path);
    }
}
