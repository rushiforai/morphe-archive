import java.util.*;
import com.android.tools.smali.dexlib2.Opcode;
import com.android.tools.smali.dexlib2.iface.instruction.Instruction;
import com.android.tools.smali.dexlib2.immutable.*;
import com.android.tools.smali.dexlib2.immutable.instruction.*;
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableFieldReference;
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableMethodReference;
import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;

class VerifyAdsDexTest {
    enum Change { NONE, ARGUMENT, RESULT, GETTER, FILTER, ITERATOR, CALLER, MISSING, DUPLICATE, CAPABILITY }
    enum PlayerChange { NONE, OPCODE, ARGUMENT, RESULT, BRANCH, GETTER, CAPABILITY, CAPABILITY_ACCESS,
        EMBEDDED_MISSING, EMBEDDED_OWNER, EMBEDDED_LITERAL, EMBEDDED_BRANCH, EMBEDDED_ORIGINAL,
        EMBEDDED_REGISTER, EMBEDDED_ARGUMENT, EMBEDDED_DUPLICATE, EMBEDDED_RETURN, EMBEDDED_PARAM }

    @Test void acceptsExpectedHooks() { VerifyAdsDex.verifyHooks(fixture(Change.NONE), true); }

    @Test void rejectsBrokenHooks() {
        for (var change : Change.values()) if (change != Change.NONE) {
            assertThrows(AssertionError.class, () -> VerifyAdsDex.verifyHooks(fixture(change), true), change.name());
        }
    }

    @Test void rejectsHooksWhenPatchIsNotSelected() {
        assertThrows(AssertionError.class, () -> VerifyAdsDex.verifyHooks(fixture(Change.NONE), false));
    }

    @Test void acceptsNoExtensionWhenNotSelected() { VerifyAdsDex.verifyHooks(List.of(), false); }

    @Test void acceptsExpectedPlayerHook() { VerifyAdsDex.verifyPlayerHooks(playerFixture(PlayerChange.NONE), true); }

    @Test void rejectsBrokenPlayerHooks() {
        for (var change : PlayerChange.values()) if (change != PlayerChange.NONE) {
            assertThrows(AssertionError.class, () -> VerifyAdsDex.verifyPlayerHooks(playerFixture(change), true), change.name());
        }
    }

    @Test void rejectsPlayerHookWhenPatchIsNotSelected() {
        assertThrows(AssertionError.class, () -> VerifyAdsDex.verifyPlayerHooks(playerFixture(PlayerChange.NONE), false));
    }

    @Test void rejectsEmbeddedHookWhenPatchIsNotSelected() {
        assertThrows(AssertionError.class, () -> VerifyAdsDex.verifyPlayerHooks(List.of(embeddedFixture(PlayerChange.NONE)), false));
    }

    @Test void acceptsNoPlayerHookWhenNotSelected() { VerifyAdsDex.verifyPlayerHooks(List.of(), false); }

    List<ImmutableClassDef> playerFixture(PlayerChange change) {
        var code = List.<Instruction>of(
                new ImmutableInstruction35c(Opcode.INVOKE_VIRTUAL, 1, 4, 0, 0, 0, 0,
                        new ImmutableMethodReference("Lcom/spotify/scrollsita/v1/Section;",
                                change == PlayerChange.GETTER ? "p0" : "o0", List.of(), "Z")),
                new ImmutableInstruction11x(Opcode.MOVE_RESULT, 4),
                new ImmutableInstruction3rc(change == PlayerChange.OPCODE ? Opcode.INVOKE_VIRTUAL_RANGE : Opcode.INVOKE_STATIC_RANGE,
                        change == PlayerChange.ARGUMENT ? 5 : 4, 1,
                        new ImmutableMethodReference(VerifyAdsDex.PLAYER_HELPER, "showImageBrandAd", List.of("Z"), "Z")),
                new ImmutableInstruction11x(Opcode.MOVE_RESULT, change == PlayerChange.RESULT ? 5 : 4),
                new ImmutableInstruction11n(Opcode.CONST_4, 5, 3),
                new ImmutableInstruction21t(Opcode.IF_EQZ, change == PlayerChange.BRANCH ? 5 : 4, 2),
                new ImmutableInstruction11x(Opcode.RETURN_OBJECT, 4));
        var caller = new ImmutableMethod("Lp/ja31;", "invoke",
                List.of(new ImmutableMethodParameter("Ljava/lang/Object;", Set.of(), null)),
                "Ljava/lang/Object;", 1, Set.of(), Set.of(),
                new ImmutableMethodImplementation(7, code, List.of(), List.of()));
        var capabilityMethod = new ImmutableMethod(VerifyAdsDex.INSTALLED, "hidePlayerAdCards", List.of(), "Z",
                change == PlayerChange.CAPABILITY_ACCESS ? 1 : 9, Set.of(), Set.of(),
                new ImmutableMethodImplementation(1, List.of(
                        new ImmutableInstruction11n(Opcode.CONST_4, 0, change == PlayerChange.CAPABILITY ? 0 : 1),
                        new ImmutableInstruction11x(Opcode.RETURN, 0)), List.of(), List.of()));
        var capability = new ImmutableClassDef(VerifyAdsDex.INSTALLED, 1, "Ljava/lang/Object;", List.of(), null,
                Set.of(), List.of(), List.of(capabilityMethod));
        var classes = new ArrayList<>(List.of(new ImmutableClassDef("Lp/ja31;", 1, "Ljava/lang/Object;", List.of(), null,
                Set.of(), List.of(), List.of(caller)), capability));
        if (change != PlayerChange.EMBEDDED_MISSING) classes.add(embeddedFixture(change));
        if (change == PlayerChange.EMBEDDED_DUPLICATE) classes.add(embeddedFixture(change));
        return classes;
    }

    ImmutableClassDef embeddedFixture(PlayerChange change) {
        String owner = change == PlayerChange.EMBEDDED_OWNER ? "Lp/other;" : "Lp/onq;";
        int guard = change == PlayerChange.EMBEDDED_PARAM ? 4 : 0;
        var code = List.<Instruction>of(
                new ImmutableInstruction35c(Opcode.INVOKE_STATIC, change == PlayerChange.EMBEDDED_ARGUMENT ? 1 : 0, 0, 0, 0, 0, 0,
                        new ImmutableMethodReference(VerifyAdsDex.PLAYER_HELPER, "showEmbeddedAd", List.of(), "Z")),
                new ImmutableInstruction11x(Opcode.MOVE_RESULT, change == PlayerChange.EMBEDDED_REGISTER ? 1 : guard),
                new ImmutableInstruction21t(Opcode.IF_NEZ, guard, change == PlayerChange.EMBEDDED_BRANCH ? 3 : 4),
                new ImmutableInstruction11n(Opcode.CONST_4, guard, change == PlayerChange.EMBEDDED_LITERAL ? 1 : 0),
                new ImmutableInstruction11x(change == PlayerChange.EMBEDDED_RETURN ? Opcode.RETURN_OBJECT : Opcode.RETURN, guard),
                new ImmutableInstruction22c(Opcode.IGET_OBJECT, guard, 4, new ImmutableFieldReference("Lp/onq;",
                        change == PlayerChange.EMBEDDED_ORIGINAL ? "c" : "b", "Ljava/lang/Object;")),
                new ImmutableInstruction11n(Opcode.CONST_4, 0, 0),
                new ImmutableInstruction11x(Opcode.RETURN, 0));
        var method = new ImmutableMethod(owner, "z",
                List.of(new ImmutableMethodParameter("Lcom/spotify/player/model/ContextTrack;", Set.of(), null)),
                "Z", 1, Set.of(), Set.of(), new ImmutableMethodImplementation(6, code, List.of(), List.of()));
        return new ImmutableClassDef(owner, 1, "Ljava/lang/Object;", List.of(), null, Set.of(), List.of(), List.of(method));
    }

    List<ImmutableClassDef> fixture(Change change) {
        var classes = new ArrayList<ImmutableClassDef>();
        for (var owner : List.of("Lp/jb20;", "Lp/vot;", "Lp/x7v0;")) {
            if (change == Change.MISSING && owner.equals("Lp/jb20;")) continue;
            boolean browse = owner.equals("Lp/x7v0;");
            String structure = browse ? "Lcom/spotify/browsita/v1/resolved/BrowseStructure;"
                    : "Lcom/spotify/casita/v1/resolved/HomeStructure;";
            var code = new ArrayList<Instruction>(List.of(
                new ImmutableInstruction35c(Opcode.INVOKE_VIRTUAL, 1, 4, 0, 0, 0, 0,
                    new ImmutableMethodReference(structure, change == Change.GETTER ? "x" : browse ? "o" : "p", List.of(), "Lp/ih40;")),
                new ImmutableInstruction11x(Opcode.MOVE_RESULT_OBJECT, 4),
                new ImmutableInstruction3rc(Opcode.INVOKE_STATIC_RANGE, change == Change.ARGUMENT ? 5 : 4, 1,
                    new ImmutableMethodReference(VerifyAdsDex.HELPER, change == Change.FILTER ? "filter" : browse ? "browse" : "home",
                        List.of("Ljava/util/List;"), "Ljava/util/List;")),
                new ImmutableInstruction11x(Opcode.MOVE_RESULT_OBJECT, change == Change.RESULT ? 5 : 4),
                new ImmutableInstruction10x(Opcode.NOP), new ImmutableInstruction10x(Opcode.NOP)));
            if (owner.equals("Lp/jb20;")) code.add(new ImmutableInstruction10x(Opcode.NOP));
            code.add(new ImmutableInstruction35c(Opcode.INVOKE_INTERFACE, 1, change == Change.ITERATOR ? 5 : 4, 0, 0, 0, 0,
                    new ImmutableMethodReference("Ljava/lang/Iterable;", "iterator", List.of(), "Ljava/util/Iterator;")));
            code.add(new ImmutableInstruction11x(Opcode.MOVE_RESULT_OBJECT, 4));
            code.add(new ImmutableInstruction11x(Opcode.RETURN_OBJECT, 4));
            String actualOwner = change == Change.CALLER && owner.equals("Lp/jb20;") ? "Ltest/Other;" : owner;
            var definition = definition(actualOwner, VerifyAdsDex.CALLERS.get(owner), "Ljava/lang/Object;", code);
            classes.add(definition);
            if (change == Change.DUPLICATE && owner.equals("Lp/jb20;")) classes.add(definition);
        }
        classes.add(definition(VerifyAdsDex.INSTALLED, "hideBrandAds", "Z", List.of(
                new ImmutableInstruction11n(Opcode.CONST_4, 0, change == Change.CAPABILITY ? 0 : 1),
                new ImmutableInstruction11x(Opcode.RETURN, 0))));
        return classes;
    }

    ImmutableClassDef definition(String owner, String name, String result, List<? extends Instruction> code) {
        var method = new ImmutableMethod(owner, name, List.of(), result, 9, Set.of(), Set.of(),
                new ImmutableMethodImplementation(7, code, List.of(), List.of()));
        return new ImmutableClassDef(owner, 1, "Ljava/lang/Object;", List.of(), null, Set.of(), List.of(), List.of(method));
    }
}
