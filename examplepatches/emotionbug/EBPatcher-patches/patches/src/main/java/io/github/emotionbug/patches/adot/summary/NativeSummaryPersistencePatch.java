package io.github.emotionbug.patches.adot.summary;

import com.android.tools.smali.dexlib2.Opcode;
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation;
import com.android.tools.smali.dexlib2.builder.instruction.*;
import com.android.tools.smali.dexlib2.iface.*;
import com.android.tools.smali.dexlib2.iface.instruction.*;
import com.android.tools.smali.dexlib2.iface.debug.DebugItem;
import io.github.emotionbug.patches.adot.dex.MethodPatch;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.function.Function;
import static io.github.emotionbug.patches.adot.dex.DexInstructions.*;

/** Canonical native storage only: no Activity, Compose renderer, UI key or event interception. */
public final class NativeSummaryPersistencePatch implements MethodPatch {
    public static final String STORAGE = "Liw9;-><init>(Lcom/skt/prod/dialer/database/room/call/CallDatabase;Lo2c;)V";
    public static final String INSERT = "Lhh2;->invoke(Ljava/lang/Object;)Ljava/lang/Object;";
    public static final String ASSOCIATION = "Lly4;-><init>(JJLjava/lang/Long;Ljava/lang/String;)V";
    public static final String PUBLICATION = "Lyx9;->r(Lem3;Ls2c;Lyub;Lh58;)Ljava/lang/Object;";
    private static final Map<String, String> BODIES = Map.of(
            STORAGE, "034b2a53e72e0302aa46fbf509f5e641102bf4dc4bc8287dcf272bf98189bd30",
            INSERT, "dc8df98ab72b7741afdde4ff2585a336b6afade8b94dddb9a8dd406b5c26c213",
            ASSOCIATION, "8d455f42a0b0692a455ee4e72cdc38a5382b4219fecdd5e0883b26a9e8aff729",
            PUBLICATION, "df55a8f97694024ffc8e6392507dc4705f2968fd0c091164f7ad1f4748a5407a");
    private static final Map<String, String> DEPENDENCIES = Map.ofEntries(
            Map.entry("Lxal;->c()V", "e03856e82a29997c582930cb4b1c6fb3fa038099fbe7678003c873b6f86549d7"),
            Map.entry("Lxal;->u()V", "aeb6dfe79f3931d978a495065197dbe6da3deba222e104eb2ff79bedacf565b8"),
            Map.entry("Lxal;->o()V", "433d81d6b9670b913b51612fb302ec8625e1e1adc0cfe083758aaf7d6391b789"),
            Map.entry("Liv1;->R(Lf58;Lxal;Lkotlin/jvm/functions/Function1;ZZ)Ljava/lang/Object;", "e4a1c1eb3fb2699cdcb1fccf3b2f4b90c6536cdfa314849c73cf03ff4c50f212"),
            Map.entry("Lsi8;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;", "5ac9c32f9a8c3a812d74885d59f8dd1811fab8437e815b0dcb79d5c9b83d5b5f"),
            Map.entry("Lj8h;->C(Ljava/lang/String;)Luhl;", "4e0030e7707e642a32a92c492071925ef2e3e3b817bfd3c446dd945b640dda4e"),
            Map.entry("Lwlc;->Q(Loo3;)Lno3;", "eb41c92132a975b00961a14dbb74548403b48272756ecd4f34c5c948126a8487"),
            Map.entry("Lyo4;-><init>(ILjava/lang/String;Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/util/List;Ljava/util/List;Ljava/util/ArrayList;)V", "d6957e3ff96068b2e0a73ff384b9b69b3155079b1856bf164092fafe281028ca"),
            Map.entry("Lzl3;->g(Ljava/util/ArrayList;Lh58;)Ljava/lang/Object;", "048e2c4ca8b269df60ef37d9e394893a27edc76ced09997f82d7cbb55521b3ea"),
            Map.entry("Llq3;->c(Ljava/util/ArrayList;Lh58;)Ljava/lang/Object;", "0789b6c0bb3b368e905c8bfd65797b591530ec7cfe12900a8a85c0e981976ab0"),
            Map.entry("Lyl3;->y()Ljava/lang/String;", "fde9f6ec8cd6054921bd1fd2581d4f1d52191d3ef36bb50fdc1d280f3b4e8a52"),
            Map.entry("Lam3;-><init>(JJILjava/lang/String;IIJJ)V", "f5df05fd5d1ca7555fe5beed2be060ea71435b8baad983b57b10a23a96a43061"),
            Map.entry("Lmq3;-><init>(JJJLjava/lang/String;Ljava/lang/Long;)V", "94992ac2d38c2cada1b9835f91176caf8332690ce481c061f2e5dad3e5e21145"),
            Map.entry("Lulc;->N(Lfy3;Ljava/lang/Integer;)Ls68;", "9e081022c91508feffaa118aeb308edbca8ca2d63628262c77969974acafab32"),
            Map.entry("Ls68;-><clinit>()V", "4e201d27a34348500377b7932bd0ced68b735d3ad26bcb854872f185675caa9e"),
            Map.entry("Lgu;->emit(Ljava/lang/Object;Lf58;)Ljava/lang/Object;", "6368ffc13b008f04ee766beec0eb61e829802db0aa69e7f05bb01cab9f3da3b1"));
    @Override public String dexEntry() { return "classes3.dex"; }
    @Override public Set<String> methods() { return BODIES.keySet(); }
    public static void validate(Function<String, ? extends ClassDef> classes) {
        LocalGemmaSummaryPatch.validate(classes); // Includes exact schema, recording and captured Room connection guards.
        DEPENDENCIES.forEach((descriptor, hash) -> {
            ClassDef owner = classes.apply(descriptor.substring(0, descriptor.indexOf("->")));
            Method found = null;
            if (owner != null) for (Method method : owner.getMethods()) if (descriptor.equals(id(method))) found = method;
            if (found == null || !hash.equals(SummaryBytecodeGuard.fingerprint(found))) throw unsupported(descriptor);
        });
        for (String descriptor : List.of("Lam3;->b:J", "Lmq3;->b:J", "Lly4;->a:J", "Lly4;->d:Ljava/lang/Long;", "Lpv9;->b:J", "Lo58;->a:J",
                "Lyo4;->a:I", "Lyo4;->b:Ljava/lang/String;", "Lyo4;->d:Ljava/util/List;",
                "Lx68;->a:I", "Lx68;->b:Ljava/lang/String;", "Lx68;->c:I", "Lx68;->d:J", "Lx68;->e:J")) {
            int split = descriptor.indexOf("->"), colon = descriptor.indexOf(':');
            ClassDef row = classes.apply(descriptor.substring(0, split)); int count = 0;
            if (row != null) for (Field field : row.getFields())
                if (field.getName().equals(descriptor.substring(split + 2, colon))
                        && field.getType().equals(descriptor.substring(colon + 1)) && field.getAccessFlags() == 17) count++;
            if (count != 1) throw unsupported(descriptor);
        }
    }
    @Override public MethodImplementation implementation(Method target) {
        String descriptor = id(target);
        if (!BODIES.containsKey(descriptor) || !BODIES.get(descriptor).equals(SummaryBytecodeGuard.fingerprint(target)))
            throw unsupported(descriptor);
        if (PUBLICATION.equals(descriptor)) return publication(target.getImplementation());
        MutableMethodImplementation body = new MutableMethodImplementation(target.getImplementation());
        if (INSERT.equals(descriptor)) {
            for (int address : new int[]{0x464, 0x451}) {
                int pc = 0, index = 0;
                while (pc < address) pc += body.getInstructions().get(index++).getCodeUnits();
                if (pc != address) throw unsupported("native transaction offset");
                Instruction old = body.getInstructions().get(index);
                if (!(old instanceof FiveRegisterInstruction registers) || registers.getRegisterC() != 0
                        || registers.getRegisterD() != 1 || registers.getRegisterE() != 7
                        || !((ReferenceInstruction) old).getReference().toString().equals(address == 0x464
                            ? "Lras;->J(Luhl;Ljava/util/Collection;)Ljava/util/List;"
                            : "Lras;->G(Luhl;Ljava/lang/Iterable;)V"))
                    throw unsupported("native transaction call");
                body.replaceInstruction(index, new BuilderInstruction35c(Opcode.INVOKE_STATIC, 1, 7, 0, 0, 0, 0,
                        method(LocalGemmaSummaryPatch.HOOK, "beforeApiInsert", List.of("Ljava/lang/Object;"), "V")));
                body.addInstruction(index + 1, new BuilderInstruction10x(Opcode.NOP));
                body.addInstruction(index + 2, new BuilderInstruction35c(Opcode.INVOKE_VIRTUAL, 3, 0, 1, 7, 0, 0,
                        ((ReferenceInstruction) old).getReference()));
            }
        } else {
            for (int i = body.getInstructions().size() - 1; i >= 0; i--) {
                if (body.getInstructions().get(i).getOpcode() != Opcode.RETURN_VOID) continue;
                body.replaceInstruction(i, new BuilderInstruction35c(Opcode.INVOKE_STATIC, 1, 0, 0, 0, 0, 0,
                        method(LocalGemmaSummaryPatch.HOOK, STORAGE.equals(descriptor) ? "storage" : "association", List.of("Ljava/lang/Object;"), "V")));
                body.addInstruction(i + 1, new BuilderInstruction10x(Opcode.NOP));
                body.addInstruction(i + 2, new BuilderInstruction10x(Opcode.RETURN_VOID));
            }
        }
        return body;
    }

    private static MethodImplementation publication(MethodImplementation original) {
        // Keep every original register operand unchanged. Move the five incoming object
        // parameters down at entry, freeing v16 for the coroutine key on EVERY resumption.
        // Original v7 is temporarily the high half of a long during yx9.k; catches cannot use it.
        MutableMethodImplementation body = new MutableMethodImplementation(new MethodImplementation() {
            @Override public int getRegisterCount() { return original.getRegisterCount() + 1; }
            @Override public Iterable<? extends Instruction> getInstructions() { return original.getInstructions(); }
            @Override public List<? extends TryBlock<? extends ExceptionHandler>> getTryBlocks() { return original.getTryBlocks(); }
            @Override public Iterable<? extends DebugItem> getDebugItems() { return original.getDebugItems(); }
        });
        var start = body.newLabelForAddress(0x1a);
        var end = body.newLabelForAddress(0x2da); // Executable region only, before switch data.
        // True/defensive terminal returns only. 0x2d1 returns COROUTINE_SUSPENDED.
        for (int address : new int[]{0x2d8, 0x2d4, 0x116, 0xa5, 0x2c}) {
            int index = instructionIndex(body, address);
            Instruction displaced = body.getInstructions().get(index);
            if (address == 0xa5) {
                body.replaceInstruction(index, new BuilderInstruction35c(Opcode.INVOKE_STATIC, 3, 7, 11, 12, 0, 0,
                        method(LocalGemmaSummaryPatch.HOOK, "apiPublicationStart",
                                List.of("Ljava/lang/Object;", "Ljava/lang/Object;", "Ljava/lang/Object;"), "V")));
            } else {
                body.replaceInstruction(index, new BuilderInstruction3rc(Opcode.INVOKE_STATIC_RANGE, 16, 1,
                        method(LocalGemmaSummaryPatch.HOOK, "apiPublicationEnd", List.of("Ljava/lang/Object;"), "V")));
            }
            body.addInstruction(index + 1, new BuilderInstruction10x(Opcode.NOP));
            if (address == 0xa5) {
                TwoRegisterInstruction registers = (TwoRegisterInstruction) displaced;
                body.addInstruction(index + 2, new BuilderInstruction22c(displaced.getOpcode(),
                        registers.getRegisterA(), registers.getRegisterB(), ((ReferenceInstruction) displaced).getReference()));
            } else {
                body.addInstruction(index + 2, new BuilderInstruction11x(Opcode.RETURN_OBJECT,
                        ((OneRegisterInstruction) displaced).getRegisterA()));
            }
        }
        int index = instructionIndex(body, 0x1a);
        Instruction displaced = body.getInstructions().get(index);
        TwoRegisterInstruction registers = (TwoRegisterInstruction) displaced;
        body.replaceInstruction(index, new BuilderInstruction22x(Opcode.MOVE_OBJECT_FROM16, 16, 7));
        body.addInstruction(index + 1, new BuilderInstruction22c(displaced.getOpcode(),
                registers.getRegisterA(), registers.getRegisterB(), ((ReferenceInstruction) displaced).getReference()));
        for (int register = 15; register >= 11; register--)
            body.addInstruction(0, new BuilderInstruction22x(Opcode.MOVE_OBJECT_FROM16, register, register + 1));
        var handler = body.newLabelForIndex(body.getInstructions().size());
        body.addInstruction(new BuilderInstruction11x(Opcode.MOVE_EXCEPTION, 0));
        body.addInstruction(new BuilderInstruction3rc(Opcode.INVOKE_STATIC_RANGE, 16, 1,
                method(LocalGemmaSummaryPatch.HOOK, "apiPublicationEnd", List.of("Ljava/lang/Object;"), "V")));
        body.addInstruction(new BuilderInstruction11x(Opcode.THROW, 0));
        body.addCatch(start, end, handler);
        return body;
    }

    private static int instructionIndex(MutableMethodImplementation body, int address) {
        int pc = 0, index = 0;
        while (pc < address) pc += body.getInstructions().get(index++).getCodeUnits();
        if (pc != address) throw unsupported("publication offset");
        return index;
    }
    private static IllegalStateException unsupported(String name) {
        return new IllegalStateException("Unsupported or already patched native summary persistence: " + name);
    }
}
