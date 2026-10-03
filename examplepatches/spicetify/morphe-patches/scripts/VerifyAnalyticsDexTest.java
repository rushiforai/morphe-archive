import java.util.*;
import com.android.tools.smali.dexlib2.Opcode;
import com.android.tools.smali.dexlib2.iface.ClassDef;
import com.android.tools.smali.dexlib2.iface.instruction.Instruction;
import com.android.tools.smali.dexlib2.immutable.*;
import com.android.tools.smali.dexlib2.immutable.instruction.*;
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableMethodReference;
import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;

class VerifyAnalyticsDexTest {
    enum Change { NONE, MISSING, DUPLICATE }
    enum PendingChange { NONE, MISSING, TARGET, NAME, PARAMS, RETURN, REGISTER }
    enum VoidChange { NONE, MISSING, EXTRA_RETURN }
    enum HandlerChange { NONE, MISSING, LITERAL, OPCODE, REGISTER }

    @Test void acceptsExpectedHooks() {
        VerifyAnalyticsDex.verifyHooks(
            fixture(Change.NONE, PendingChange.NONE, VoidChange.NONE, HandlerChange.NONE), true);
    }

    @Test void rejectsBrokenHooks() {
        for (var change : Change.values()) if (change != Change.NONE) {
            assertThrows(AssertionError.class, () -> VerifyAnalyticsDex.verifyHooks(
                fixture(change, PendingChange.NONE, VoidChange.NONE, HandlerChange.NONE), true), change.name());
        }
        for (var change : PendingChange.values()) if (change != PendingChange.NONE) {
            assertThrows(AssertionError.class, () -> VerifyAnalyticsDex.verifyHooks(
                fixture(Change.NONE, change, VoidChange.NONE, HandlerChange.NONE), true), change.name());
        }
        for (var change : VoidChange.values()) if (change != VoidChange.NONE) {
            assertThrows(AssertionError.class, () -> VerifyAnalyticsDex.verifyHooks(
                fixture(Change.NONE, PendingChange.NONE, change, HandlerChange.NONE), true), change.name());
        }
        for (var change : HandlerChange.values()) if (change != HandlerChange.NONE) {
            assertThrows(AssertionError.class, () -> VerifyAnalyticsDex.verifyHooks(
                fixture(Change.NONE, PendingChange.NONE, VoidChange.NONE, change), true), change.name());
        }
    }

    @Test void rejectsHooksWhenPatchIsNotSelected() {
        assertThrows(AssertionError.class, () -> VerifyAnalyticsDex.verifyHooks(
            fixture(Change.NONE, PendingChange.NONE, VoidChange.NONE, HandlerChange.NONE), false));
    }

    @Test void acceptsOriginalBodiesWhenPatchIsNotSelected() {
        VerifyAnalyticsDex.verifyHooks(
            fixture(Change.MISSING, PendingChange.MISSING, VoidChange.MISSING, HandlerChange.MISSING), false);
    }

    List<ClassDef> fixture(Change funnelChange, PendingChange pendingChange, VoidChange voidChange,
                           HandlerChange handlerChange) {
        var classes = new ArrayList<ClassDef>();

        // p.t4y.a, the event store transaction: dropped when enabled.
        var insertCode = new ArrayList<Instruction>();
        if (funnelChange != Change.MISSING) {
            insertCode.add(new ImmutableInstruction10x(Opcode.RETURN_VOID));
        } else {
            insertCode.add(new ImmutableInstruction35c(Opcode.INVOKE_STATIC, 1, 4, 0, 0, 0, 0,
                new ImmutableMethodReference("Lp/jji1;", "r", List.of("Lp/vaz0;", "Z", "Z", "Lkotlin/jvm/functions/Function1;"), "Ljava/lang/Object;")));
        }
        classes.add(method(VerifyAnalyticsDex.INSERT_OWNER, "a", VerifyAnalyticsDex.INSERT_PARAMS, "V", insertCode));

        // Metrics snapshots, flush worker scheduling, Facebook events: return-void sites.
        classes.add(method("Lcom/spotify/eventsender/corebridge/EventSenderCoreBridgeImpl;",
            "queueMetricsDataSnapshotForSending", List.of("[B", "[B"), "V",
            voidChange == VoidChange.MISSING ? originalInvoke() : List.of(new ImmutableInstruction10x(Opcode.RETURN_VOID))));
        classes.add(method("Lp/p6y;", "a", List.of(), "V",
            voidChange == VoidChange.MISSING || voidChange == VoidChange.EXTRA_RETURN
                ? originalInvoke() : List.of(new ImmutableInstruction10x(Opcode.RETURN_VOID))));
        classes.add(method("Lp/ge5;", "z", VerifyAnalyticsDex.FACEBOOK_PARAMS, "V",
            voidChange == VoidChange.MISSING ? originalInvoke() : List.of(new ImmutableInstruction10x(Opcode.RETURN_VOID))));

        // p.xtf.handleMessage, the only path into the comScore SDK.
        var handlerCode = new ArrayList<Instruction>();
        if (handlerChange != HandlerChange.MISSING) {
            handlerCode.add(new ImmutableInstruction11n(Opcode.CONST_4, 0,
                handlerChange == HandlerChange.LITERAL ? 0 : 1));
            handlerCode.add(new ImmutableInstruction11x(
                handlerChange == HandlerChange.OPCODE ? Opcode.RETURN_OBJECT : Opcode.RETURN,
                handlerChange == HandlerChange.REGISTER ? 1 : 0));
        } else {
            handlerCode.add(new ImmutableInstruction35c(Opcode.INVOKE_STATIC, 1, 4, 0, 0, 0, 0,
                new ImmutableMethodReference("Lcom/comscore/Analytics;", "start",
                    List.of("Landroid/content/Context;"), "V")));
        }
        classes.add(method("Lp/xtf;", "handleMessage", List.of("Landroid/os/Message;"), "Z", handlerCode));

        // p.p1p0.a, the pending-events RPC answered locally.
        var pendingCode = new ArrayList<Instruction>();
        if (pendingChange != PendingChange.MISSING) {
            pendingCode.add(new ImmutableInstruction35c(Opcode.INVOKE_STATIC, 1, 4, 0, 0, 0, 0,
                new ImmutableMethodReference(
                    pendingChange == PendingChange.TARGET ? "Ltest/Other;" : VerifyAnalyticsDex.ANALYTICS,
                    pendingChange == PendingChange.NAME ? "noEvents" : "noPendingEvents",
                    pendingChange == PendingChange.PARAMS ? List.of("Lp/p1p0;") : List.of("Ljava/lang/Object;"),
                    pendingChange == PendingChange.RETURN ? "Ljava/lang/Object;"
                        : "Lio/reactivex/rxjava3/core/Single;")));
            pendingCode.add(new ImmutableInstruction11x(Opcode.MOVE_RESULT_OBJECT, 4));
            pendingCode.add(new ImmutableInstruction11x(Opcode.RETURN_OBJECT,
                pendingChange == PendingChange.REGISTER ? 5 : 4));
        } else {
            pendingCode.add(new ImmutableInstruction35c(Opcode.INVOKE_VIRTUAL, 1, 4, 0, 0, 0, 0,
                new ImmutableMethodReference("Lp/p1p0;", "callSingle",
                    List.of("Ljava/lang/String;", "Ljava/lang/String;", "Ljava/lang/Object;"),
                    "Lio/reactivex/rxjava3/core/Single;")));
        }
        classes.add(method("Lp/p1p0;", "a", VerifyAnalyticsDex.PENDING_PARAMS,
            "Lio/reactivex/rxjava3/core/Single;", pendingCode));

        if (funnelChange == Change.DUPLICATE) {
            classes.add(method(VerifyAnalyticsDex.INSERT_OWNER, "a", VerifyAnalyticsDex.INSERT_PARAMS, "V",
                new ArrayList<>(insertCode)));
        }
        return classes;
    }

    List<Instruction> originalInvoke() {
        return new ArrayList<>(List.of(new ImmutableInstruction35c(Opcode.INVOKE_STATIC, 1, 4, 0, 0, 0, 0,
            new ImmutableMethodReference("Lp/h5b1;", "q", List.of("Landroid/content/Context;"), "Ljava/lang/Object;"))));
    }

    ClassDef method(String owner, String name, List<String> parameters, String result,
                    List<? extends Instruction> code) {
        var method = new ImmutableMethod(owner, name,
            parameters.stream().map(type -> new ImmutableMethodParameter(type, Set.of(), null)).toList(),
            result, 9, Set.of(), Set.of(), new ImmutableMethodImplementation(8, code, List.of(), List.of()));
        return new ImmutableClassDef(owner, 1, "Ljava/lang/Object;", List.of(), null, Set.of(), List.of(), List.of(method));
    }
}
