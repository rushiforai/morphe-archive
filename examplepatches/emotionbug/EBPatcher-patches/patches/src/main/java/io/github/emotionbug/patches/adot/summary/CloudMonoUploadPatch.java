package io.github.emotionbug.patches.adot.summary;

import com.android.tools.smali.dexlib2.Opcode;
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation;
import com.android.tools.smali.dexlib2.builder.BuilderInstruction;
import com.android.tools.smali.dexlib2.builder.instruction.*;
import com.android.tools.smali.dexlib2.iface.*;
import com.android.tools.smali.dexlib2.iface.instruction.*;
import com.android.tools.smali.dexlib2.iface.reference.MethodReference;
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableTypeReference;
import io.github.emotionbug.patches.adot.dex.MethodPatch;
import java.util.*;
import java.util.function.Function;
import static io.github.emotionbug.patches.adot.dex.DexInstructions.*;

/** Cloud-only descriptor selection and per-item lifetime. The shared goq selector is untouched. */
public final class CloudMonoUploadPatch implements MethodPatch {
    public static final String HOOK = "Lio/github/emotionbug/patches/runtime/CloudMonoUpload;";
    public static final String SCOPE = "Lgnq;->b(Lh58;)Ljava/lang/Object;";
    public static final String METADATA = "Lgu3;->L(Ljmq;Ljava/lang/String;Lnli;)Lhml;";
    public static final String UPLOAD = "Lknq;->a(Lgoq;Likd;Lz;Lh58;)Ljava/lang/Object;";
    public static final String STAGE_ONE = "Lzoq;->b(Ljmq;Lh58;)Ljava/lang/Object;";
    public static final String UPDATE = "Lzoq;->f(Ljmq;Lh58;)Ljava/lang/Object;";
    private static final String SELECTOR = "Lgoq;->a()Lpnq;";
    private static final Map<String, String> BODIES = Map.of(
            SCOPE, "cbc527064863b13ec38e6cba05d25be2ca72dc2146d6b38fce045198e59ea889",
            METADATA, "fb10a85e570566f40f1bf39dc0febf991737ea3d42ad1750185ef8be890d6dda",
            STAGE_ONE, "e0b0584c3a3b146ecfa14f589feed955c75ff7d28c95ec16fe91a1bc8c054777",
            UPDATE, "b944a8aa5893219802158c53139ab16faaad246eafafdc96fd217ac212405792",
            UPLOAD, "71fe5929ab24fbb730738dbceed908f9be501766fb4cb74e5c4c667c161cea97");
    private static final Map<String, String> CONTRACTS = Map.of(
            SELECTOR, "b05d671df2b304b694e259966b8b0167e8895575d0d040983a77f7f4ffd2caf2",
            "Lgoq;-><init>(Lpnq;Lpnq;I)V", "cfec8f3b62120283d649fd3bc4588fdb7e82a1f32acb67f8fd39c76cbfd7db33",
            "Lpnq;-><init>(JLlik;Landroid/net/Uri;Ljava/lang/String;J)V", "a80afeb749e8d9f8d17a0c3ada20931d77fb04c25511b82ec5ffcc9a5a325aa6",
            "Llik;-><clinit>()V", "8111944579c41015195bb12db78347538540777bdb1de888e4d6541b85da38af",
            "Lbnq;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;", "aa7c22bbe66548d6019ff2963d433e04a48f300e0abd014df4fcacfbdafa32c4",
            "Lgnq;->d(Ljmq;Lh58;)Ljava/io/Serializable;", "628b31caa6563b1801512d16c3fd0357f639924664ce20663a1b32b4c1570456",
            "Lgnq;->c(JLjmq;Lh58;)Ljava/lang/Object;", "4d0a24c643e4b19d4f8a2a6222388d5425cc6a32be31cd071edd38700ccffa96",
            "Lik3;-><clinit>()V", "a31bfb915f032b5b58891395d76e1d0ce7c1960a42ff68651b51c70da142901b",
            "Lts1;->j()Lq2j;", "f83d016432ee3cef93041388990ab184dec113b4194fcba6261191d18d4b6e27");
    private static final Map<String, String> UPDATE_CONTRACTS = Map.of(
            "Lpmq;->b(Ljmq;Lnli;Lh58;)Ljava/lang/Object;", "5549566f756a0517728007398efbebceccfd7349373d7df5feb1a92029cf2da0",
            "Lzoq;->a(Lqoq;Ljmq;Lh58;)Ljava/lang/Object;", "66f7ffac102ba6340edbdf73e74a514a8a3d0b89252c86f71d4baa3c4d4d3e21",
            "Laq3;->k(Lhml;Lh58;)Ljava/lang/Object;", "6e57ff682cc68a922dfe9928e233d12cc4d877ec60caef32a114aeccf85afd43",
            "Lhai;->g()Llmd;", "1252bc266d924babf0d6f5a8767b6e0b7b5233eaf46835c5d528d039ec636c61",
            "Lhai;->C(Ljava/lang/Object;Likd;Lz;Lgm3;)Ljava/lang/Object;", "543689ca01eaa861305cda3a8c029cfdac2a5f9ca4e16d98b64423363c040108",
            "Lhai;->t()Ljava/lang/String;", "a26b9d359a5362de829f6675c8fce6ba450cf581fc55c45fef0c627b49f30dfb",
            "Lkmq;-><clinit>()V", "8c871c8f0f471f772953ba0bcb9ce2386f81bbd97e45a40eda1054b18db84eaa");

    private final String dex;
    private final Set<String> targets;

    private CloudMonoUploadPatch(String dex, Set<String> targets) {
        this.dex = dex;
        this.targets = targets;
    }

    public static List<MethodPatch> create() {
        return List.of(new CloudMonoUploadPatch("classes2.dex", Set.of(METADATA)),
                new CloudMonoUploadPatch("classes3.dex", Set.of(SCOPE, UPLOAD, STAGE_ONE, UPDATE)));
    }

    @Override public String dexEntry() { return dex; }
    @Override public Set<String> methods() { return targets; }

    public static void validate(Function<String, ? extends ClassDef> classes) {
        CONTRACTS.forEach((descriptor, expected) -> {
            Method found = find(classes, descriptor);
            if (!expected.equals(SummaryBytecodeGuard.fingerprint(found))) throw unsupported(descriptor);
        });
        UPDATE_CONTRACTS.forEach((descriptor, expected) -> {
            if (!expected.equals(SummaryBytecodeGuard.fingerprint(find(classes, descriptor)))) throw unsupported(descriptor);
        });
        for (String descriptor : List.of("Lh58;->getContext()Lkotlin/coroutines/CoroutineContext;",
                "Lkotlin/coroutines/CoroutineContext;->U(Ljava/lang/Object;Lkotlin/jvm/functions/Function2;)Ljava/lang/Object;",
                "Lwie;->isCancelled()Z", "Lwie;->p()Ljava/util/concurrent/CancellationException;"))
            if ((find(classes, descriptor).getAccessFlags() & 9) != 1) throw unsupported(descriptor);
        for (String descriptor : List.of("Ljmq;->a:Lik3;", "Ljmq;->q:Lgoq;", "Lpnq;->a:J",
                "Lpnq;->c:Landroid/net/Uri;", "Lpnq;->d:Ljava/lang/String;", "Lpnq;->b:Llik;",
                "Lgoq;->a:Lpnq;", "Llik;->e:Llik;", "Ljmq;->b:Lkmq;", "Ljmq;->e:Ljava/lang/Long;",
                "Lkmq;->d:Lkmq;", "Lkmq;->e:Lkmq;")) {
            int split = descriptor.indexOf("->"), colon = descriptor.indexOf(':');
            int count = 0;
            for (Field field : classes.apply(descriptor.substring(0, split)).getFields())
                if (field.getName().equals(descriptor.substring(split + 2, colon))
                        && field.getType().equals(descriptor.substring(colon + 1)) && (field.getAccessFlags() & 1) != 0) count++;
            if (count != 1) throw unsupported(descriptor);
        }
    }

    private static Method find(Function<String, ? extends ClassDef> classes, String descriptor) {
        ClassDef owner = classes.apply(descriptor.substring(0, descriptor.indexOf("->")));
        if (owner != null) for (Method method : owner.getMethods()) if (descriptor.equals(id(method))) return method;
        throw unsupported(descriptor);
    }

    @Override public MethodImplementation implementation(Method target) {
        String descriptor = id(target);
        if (!targets.contains(descriptor) || !BODIES.get(descriptor).equals(SummaryBytecodeGuard.fingerprint(target)))
            throw unsupported(descriptor);
        MutableMethodImplementation body = new MutableMethodImplementation(target.getImplementation());
        if (descriptor.equals(SCOPE)) scope(body);
        else if (descriptor.equals(STAGE_ONE)) stageOne(body);
        else if (descriptor.equals(UPDATE)) replaceField(body, 0xc6, "duplicateFallbackId", 7, 7, "Ljava/lang/Long;", null);
        else {
            int count = 0;
            for (int i = body.getInstructions().size() - 1; i >= 0; i--) {
                Instruction instruction = body.getInstructions().get(i);
                if (!(instruction instanceof ReferenceInstruction reference) || !(reference.getReference() instanceof MethodReference method)
                        || !id(method).equals(SELECTOR)) continue;
                int receiver = instruction instanceof RegisterRangeInstruction range ? range.getStartRegister()
                        : ((FiveRegisterInstruction) instruction).getRegisterC();
                Instruction result = body.getInstructions().get(i + 1);
                if (result.getOpcode() != Opcode.MOVE_RESULT_OBJECT) throw unsupported("selector result");
                body.replaceInstruction(i, new BuilderInstruction3rc(Opcode.INVOKE_STATIC_RANGE, receiver, 1,
                        method(HOOK, "selected", List.of("Ljava/lang/Object;"), "Ljava/lang/Object;")));
                body.addInstruction(i + 2, new BuilderInstruction21c(Opcode.CHECK_CAST,
                        ((OneRegisterInstruction) result).getRegisterA(), new ImmutableTypeReference("Lpnq;")));
                count++;
            }
            if (count != (descriptor.equals(METADATA) ? 3 : 8)) throw unsupported("cloud selector count");
        }
        return body;
    }
    private static int at(MutableMethodImplementation body, int address) {
        int index = 0, pc = 0;
        while (pc < address) pc += body.getInstructions().get(index++).getCodeUnits();
        if (pc != address) throw unsupported("cloud branch address");
        return index;
    }

    private static BuilderInstruction3rc call(String name, int register, String returns) {
        return new BuilderInstruction3rc(Opcode.INVOKE_STATIC_RANGE, register, 1,
                method(HOOK, name, List.of("Ljava/lang/Object;"), returns));
    }

    private static void replaceField(MutableMethodImplementation body, int address, String name,
                                     int receiver, int result, String returns, String cast) {
        int index = at(body, address);
        if (body.getInstructions().get(index).getOpcode() != Opcode.IGET_OBJECT) throw unsupported(name);
        body.replaceInstruction(index, call(name, receiver, returns));
        body.addInstruction(index + 1, new BuilderInstruction11x(Opcode.MOVE_RESULT_OBJECT, result));
        if (cast != null) body.addInstruction(index + 2,
                new BuilderInstruction21c(Opcode.CHECK_CAST, result, new ImmutableTypeReference(cast)));
    }

    private static void beforeField(MutableMethodImplementation body, int address, List<BuilderInstruction> added) {
        int index = at(body, address);
        var old = body.getInstructions().get(index);
        if (old.getOpcode() != Opcode.IGET_OBJECT) throw unsupported("stage-one field anchor");
        var registers = (TwoRegisterInstruction) old;
        var copy = new BuilderInstruction22c(old.getOpcode(), registers.getRegisterA(), registers.getRegisterB(),
                ((ReferenceInstruction) old).getReference());
        body.replaceInstruction(index, added.get(0));
        for (int i = 1; i < added.size(); i++) body.addInstruction(index + i, added.get(i));
        body.addInstruction(index + added.size(), copy);
    }

    private static void stageOne(MutableMethodImplementation body) {
        // Original file validation and native error constructor remain the sole file-error transition.
        var validate = body.newLabelForAddress(0x92);
        var fileError = body.newLabelForAddress(0xe3);
        var existingId = body.newLabelForAddress(0x76);
        replaceField(body, 0x113, "routingType", 1, 2, "Ljava/lang/Object;", "Lkmq;");
        beforeField(body, 0xeb, List.of(
                call("prepare", 1, "Z"),
                new BuilderInstruction11x(Opcode.MOVE_RESULT, 2),
                new BuilderInstruction21t(Opcode.IF_EQZ, 2, fileError),
                call("unchangedServerId", 1, "Ljava/lang/Long;"),
                new BuilderInstruction11x(Opcode.MOVE_RESULT_OBJECT, 2),
                new BuilderInstruction21t(Opcode.IF_NEZ, 2, existingId)));
        // Existing stage-one records must validate/prepare first. Changed bytes then follow the
        // native PATCH route with the SAME request ID; unchanged bytes retain the existing-ID skip.
        beforeField(body, 0x6c, List.of(
                call("active", 1, "Z"),
                new BuilderInstruction11x(Opcode.MOVE_RESULT, 2),
                new BuilderInstruction21t(Opcode.IF_NEZ, 2, validate)));
    }


    private static void scope(MutableMethodImplementation body) {
        if (!body.getTryBlocks().isEmpty()) throw unsupported("scope exception coverage");
        var start = body.newLabelForAddress(0x1c); // bnq continuation has been selected/created in v2.
        List<Integer> addresses = new ArrayList<>();
        int pc = 0;
        for (Instruction instruction : body.getInstructions()) { addresses.add(pc); pc += instruction.getCodeUnits(); }
        int begins = 0, loops = 0, suspends = 0;
        for (int i = addresses.size() - 1; i >= 0; i--) {
            int address = addresses.get(i);
            Instruction original = body.getInstructions().get(i);
            if (original.getOpcode() == Opcode.RETURN_OBJECT) {
                int result = ((OneRegisterInstruction) original).getRegisterA();
                if (result == 3) { suspends++; continue; } // The asynchronous upload still owns its lease.
                body.replaceInstruction(i, finish());
                body.addInstruction(i + 1, new BuilderInstruction11x(Opcode.RETURN_OBJECT, result));
            } else if (address == 0x79 || address == 0xd1) {
                if (!(original instanceof TwoRegisterInstruction regs) || !(original instanceof ReferenceInstruction ref))
                    throw unsupported("scope anchor");
                if (address == 0xd1) {
                    body.replaceInstruction(i, new BuilderInstruction35c(Opcode.INVOKE_STATIC, 2, 2, 4, 0, 0, 0,
                            method(HOOK, "begin", List.of("Ljava/lang/Object;", "Ljava/lang/Object;"), "V")));
                    begins++;
                } else { body.replaceInstruction(i, finish()); loops++; }
                body.addInstruction(i + 1, new BuilderInstruction22c(original.getOpcode(), regs.getRegisterA(), regs.getRegisterB(), ref.getReference()));
            }
        }
        if (begins != 1 || loops != 1 || suspends != 1) throw unsupported("scope lifecycle");
        var end = body.newLabelForIndex(body.getInstructions().size());
        body.addInstruction(new BuilderInstruction11x(Opcode.MOVE_EXCEPTION, 0));
        body.addInstruction(finish());
        body.addInstruction(new BuilderInstruction11x(Opcode.THROW, 0));
        body.addCatch(start, end, end); // Includes resumed failures/cancellation; never swallows the original error.
    }

    private static BuilderInstruction3rc finish() {
        return new BuilderInstruction3rc(Opcode.INVOKE_STATIC_RANGE, 2, 1,
                method(HOOK, "end", List.of("Ljava/lang/Object;"), "V"));
    }
    private static IllegalStateException unsupported(String detail) {
        return new IllegalStateException("Unsupported or already patched cloud mono contract: " + detail);
    }
}
