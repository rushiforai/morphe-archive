package io.github.emotionbug.patches.adot.summary;

import com.android.tools.smali.dexlib2.Opcode;
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation;
import com.android.tools.smali.dexlib2.builder.instruction.*;
import com.android.tools.smali.dexlib2.iface.*;
import com.android.tools.smali.dexlib2.iface.instruction.*;
import io.github.emotionbug.patches.adot.dex.MethodPatch;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.function.Function;
import static io.github.emotionbug.patches.adot.dex.DexInstructions.*;

/** Additive events bound to the untouched 14.4.0 coroutine bodies and Room schema. */
public final class LocalGemmaSummaryPatch implements MethodPatch {
    public static final String ID = "adot.summary.local-gemma";
    public static final String HOOK = "Lio/github/emotionbug/patches/runtime/AdotSummaryHooks;";
    public static final String RECORDING = "Ltx4;->c(Lkhk;Lh58;)Ljava/lang/Object;";
    public static final String QUOTA = "Lui;->F(JLjmq;Ljw;Lh58;)Ljava/lang/Object;";
    public static final String ORIGINAL = "Lyx9;->l(JLdm3;Lh58;)Ljava/lang/Object;";
    private static final Map<String, String> BODIES = Map.of(
            RECORDING, "841e29131e757033cef28f2ac77464e7e2500dadd1ccc7af0fad3c76aabb2e81",
            QUOTA, "8815b8e91e13f75eb99259e82c838d78dd0622d0c27e60e398619907be98b084",
            ORIGINAL, "e1ebafd9dc6db216b9c2147750e1c87ed82010ffea1c020b8535a8b3171a48b7");
    private static final Map<String, String> DEPENDENCIES = Map.ofEntries(
            Map.entry("Lonq;-><clinit>()V", "58b8dc146b42570a48c796560b7a02f64ba6caf969d697a246ed90b5161212b4"),
            Map.entry("Lvhc;-><clinit>()V", "4b3d2ef9a7cc666d91ff8e3886e80ef25efbda7aef059bde06e3666d0440deba"),
            Map.entry("Lm9g;-><init>(JLkhk;)V", "4968a7a234a9e7e23273735aeb0127e85fb5e89355b65104fcd6dd08eddad7e3"),
            Map.entry("Lgoq;->a()Lpnq;", "b05d671df2b304b694e259966b8b0167e8895575d0d040983a77f7f4ffd2caf2"),
            Map.entry("Lpnq;-><init>(JLlik;Landroid/net/Uri;Ljava/lang/String;J)V", "a80afeb749e8d9f8d17a0c3ada20931d77fb04c25511b82ec5ffcc9a5a325aa6"),
            Map.entry("Lqnq;-><init>(JJLjava/lang/Long;Ljava/lang/Long;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V", "9575ecdc1e4d416cc0d093afd04113afeea49f52b1a36bf3a9a9ea6cabb22ae9"),
            Map.entry("Lufa;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;", "de5234b9e15f070ac8e104721d65076655983d507a97447d1e2bfd0b2724da06"),
            Map.entry("Lej;->O(Lmf7;Llgr;Lg1b;Lh58;)Ljava/lang/Object;", "62de441b7eaf1d7c3560cd743b4d28588dd1c3810003ccae53a31f8a7cfd2fb2"),
            Map.entry("Liw9;->f(JLyo4;Lh58;)Ljava/lang/Object;", "b32ace85093b8785c9cd918d04c14c2538328ba3f78fdb9ae6a85480d92481e2"),
            Map.entry("Ldw9;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;", "69447f33274358b7727ebfe5ab8b51584e35095d1ecc99e125ed70a56bfedf8a"),
            Map.entry("Lkl0;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;", "6936f0b325061229d4df855eb6a6d619582c16e627288c07eeb451a18c7fa5e2"),
            Map.entry("Lxal;->j()Lv5o;", "50143c57c3bfa739e94a6b91312e8c9643a9cf71dfdf47c66cdd9092e479af9e"),
            Map.entry("Lo64;->a(Luhl;)V", "f42de65a68e6e0976c33923f2a60c7575bce2a376c6a041d7375e5db8f05a46b"));

    @Override public String dexEntry() { return "classes3.dex"; }
    @Override public Set<String> methods() { return BODIES.keySet(); }

    /** Verify all reflection contracts and semantics before applying any event edits. */
    public static void validate(Function<String, ? extends ClassDef> classes) {
        DEPENDENCIES.forEach((descriptor, hash) -> {
            Method found = null;
            for (Method candidate : classes.apply(descriptor.substring(0, descriptor.indexOf("->"))).getMethods())
                if (descriptor.equals(id(candidate))) { if (found != null) throw unsupported(descriptor); found = candidate; }
            if (found == null || !hash.equals(SummaryBytecodeGuard.fingerprint(found))) throw unsupported(descriptor);
        });
        for (String descriptor : List.of("Lm9g;->a:J", "Lm9g;->b:Lkhk;", "Lkhk;->c:Lrrd;",
                "Ljmq;->d:J", "Ljmq;->q:Lgoq;", "Lpnq;->a:J", "Lpnq;->c:Landroid/net/Uri;", "Lpnq;->e:J",
                "Lyx9;->a:Liw9;", "Liw9;->a:Lcom/skt/prod/dialer/database/room/call/CallDatabase;",
                "Lxal;->c:Ljava/util/concurrent/Executor;", "Lztb;->d:Landroid/database/sqlite/SQLiteDatabase;",
                "Lmx9;->d:J", "Lyo4;->a:I", "Lyo4;->b:Ljava/lang/String;")) {
            int split = descriptor.indexOf("->"), colon = descriptor.indexOf(':');
            int count = 0;
            for (Field field : classes.apply(descriptor.substring(0, split)).getFields())
                if (field.getName().equals(descriptor.substring(split + 2, colon)) && field.getType().equals(descriptor.substring(colon + 1))
                        && (field.getAccessFlags() & 9) == 1) count++;
            if (count != 1) throw unsupported(descriptor);
        }
        for (String descriptor : List.of("Lrrd;->a()Landroid/net/Uri;", "Lv5o;->c0()Lztb;")) {
            int count = 0;
            for (Method candidate : classes.apply(descriptor.substring(0, descriptor.indexOf("->"))).getMethods())
                if (descriptor.equals(id(candidate)) && candidate.getAccessFlags() == 1025) count++;
            if (count != 1) throw unsupported(descriptor);
        }
        if (!"Lxal;".equals(classes.apply("Lcom/skt/prod/dialer/database/room/call/CallDatabase;").getSuperclass()))
            throw unsupported("CallDatabase superclass");
    }

    @Override public MethodImplementation implementation(Method target) {
        String descriptor = id(target);
        if (!BODIES.containsKey(descriptor) || !BODIES.get(descriptor).equals(SummaryBytecodeGuard.fingerprint(target)))
            throw unsupported(descriptor);
        MutableMethodImplementation result = new MutableMethodImplementation(target.getImplementation());
        if (RECORDING.equals(descriptor)) insert(result, 0x87, "recording", 2, 1);
        else if (QUOTA.equals(descriptor)) {
            // Descending offsets: only the TICKET_ALL_USED equality fallthroughs of onq.l and vhc.p.
            insert(result, 0x281, "quota", 8, 1);
            insert(result, 0x197, "quota", 1, 1);
        } else insert(result, 0x5f, "original", 8, 4);
        if (ORIGINAL.equals(descriptor)) {
            // The coroutine's v0 is its mx9 continuation from 0x18 onward. Do not change
            // cancellation/error semantics: restore a complete pre-API local result, then rethrow.
            var start = result.newLabelForAddress(0x18);
            var end = result.newLabelForIndex(result.getInstructions().size());
            result.addInstruction(new BuilderInstruction11x(Opcode.MOVE_EXCEPTION, 1));
            result.addInstruction(new BuilderInstruction35c(Opcode.INVOKE_STATIC, 3, 0, 9, 10, 0, 0,
                    method(HOOK, "apiFailed", List.of("Ljava/lang/Object;", "J"), "V")));
            result.addInstruction(new BuilderInstruction11x(Opcode.THROW, 1));
            result.addCatch(start, end, end);
        }
        return result;
    }

    private static void insert(MutableMethodImplementation body, int address, String name, int first, int count) {
        int index = 0, offset = 0;
        while (offset < address) offset += body.getInstructions().get(index++).getCodeUnits();
        if (offset != address) throw unsupported(name + " address");
        Instruction original = body.getInstructions().get(index);
        var reference = ((ReferenceInstruction) original).getReference();
        // Replace at the same location, then reinsert the displaced original. Existing labels,
        // including yx9's suspended-success goto, land ON the event rather than skipping it.
        body.replaceInstruction(index, new BuilderInstruction3rc(Opcode.INVOKE_STATIC_RANGE, first, count,
                method(HOOK, name, count == 4 ? List.of("Ljava/lang/Object;", "J", "Ljava/lang/Object;") : List.of("Ljava/lang/Object;"), "V")));
        body.addInstruction(index + 1, new BuilderInstruction10x(Opcode.NOP));
        if (original instanceof TwoRegisterInstruction registers)
            body.addInstruction(index + 2, new BuilderInstruction22c(original.getOpcode(), registers.getRegisterA(), registers.getRegisterB(), reference));
        else body.addInstruction(index + 2, new BuilderInstruction21c(original.getOpcode(), ((OneRegisterInstruction) original).getRegisterA(), reference));
        // Four inserted code units preserve payload alignment and every live register.
    }

    private static IllegalStateException unsupported(String descriptor) {
        return new IllegalStateException("Unsupported or already patched native summary contract: " + descriptor);
    }
}
