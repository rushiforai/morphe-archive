package io.github.emotionbug.patches.adot.ads;

import com.android.tools.smali.dexlib2.*;
import com.android.tools.smali.dexlib2.iface.*;
import com.android.tools.smali.dexlib2.iface.instruction.*;
import com.android.tools.smali.dexlib2.iface.reference.*;
import com.android.tools.smali.dexlib2.immutable.*;
import com.android.tools.smali.dexlib2.immutable.instruction.*;
import io.github.emotionbug.patches.adot.summary.SummaryBytecodeGuard;
import java.io.File;
import java.util.*;
import org.junit.*;
import static org.junit.Assert.*;
import static io.github.emotionbug.patches.adot.dex.DexInstructions.id;

public class BannerAdsPatchTest {
    private final BannerAdsPatch patch = new BannerAdsPatch();

    private Map<String, Method> originals() throws Exception {
        String path = System.getenv("EBPATCHER_TEST_APK");
        Assume.assumeTrue("Provide private original APK via EBPATCHER_TEST_APK", path != null);
        var dex = DexFileFactory.loadDexContainer(new File(path), Opcodes.getDefault()).getEntry(patch.dexEntry()).getDexFile();
        Map<String, Method> result = new HashMap<>();
        for (ClassDef owner : dex.getClasses()) if (owner.getType().equals(BannerAdsPatch.OWNER))
            for (Method method : owner.getMethods()) if (patch.methods().contains(id(method))) result.put(id(method), method);
        assertEquals(patch.methods(), result.keySet());
        return result;
    }
    private static Method withBody(Method method, MethodImplementation body) {
        return new ImmutableMethod(method.getDefiningClass(), method.getName(), method.getParameters(), method.getReturnType(),
                method.getAccessFlags(), method.getAnnotations(), method.getHiddenApiRestrictions(), body);
    }
    @Test public void mutatedVendorCodeAndReapplicationFailClosed() throws Exception {
        for (Method original : originals().values()) {
            List<Instruction> instructions = new ArrayList<>();
            original.getImplementation().getInstructions().forEach(instructions::add);
            for (int index = 0; index < instructions.size(); index++) {
                List<Instruction> changed = new ArrayList<>(instructions);
                changed.set(index, new ImmutableInstruction10x(Opcode.NOP));
                Method mutation = withBody(original, new ImmutableMethodImplementation(original.getImplementation().getRegisterCount(), changed, null, null));
                assertThrows(IllegalStateException.class, () -> patch.implementation(mutation));
            }
            assertThrows(IllegalStateException.class, () -> patch.implementation(withBody(original, null)));
            assertThrows(IllegalStateException.class, () -> patch.implementation(withBody(original, patch.implementation(original))));
        }
    }
    @Test public void initializedConstructorBranchesReachCollapseWithoutClobberedReceiver() throws Exception {
        Method original = originals().get(BannerAdsPatch.CONSTRUCTOR);
        MethodImplementation rewritten = patch.implementation(original);
        List<Instruction> before = new ArrayList<>(), after = new ArrayList<>();
        original.getImplementation().getInstructions().forEach(before::add);
        rewritten.getInstructions().forEach(after::add);
        int prefix = after.size() - 2, address = 0;
        Set<Integer> boundaries = new HashSet<>();
        for (Instruction instruction : after) { boundaries.add(address); address += instruction.getCodeUnits(); }
        int finalAddress = address;
        address = 0;
        for (int index = 0; index < prefix; index++) {
            // Compare each full instruction fingerprint, not only its opcode.
            var first = new ImmutableMethodImplementation(10, List.of(before.get(index)), null, null);
            var second = new ImmutableMethodImplementation(10, List.of(after.get(index)), null, null);
            assertEquals(SummaryBytecodeGuard.fingerprint(withBody(original, first)), SummaryBytecodeGuard.fingerprint(withBody(original, second)));
            if (after.get(index) instanceof OffsetInstruction branch) {
                int target = address + branch.getCodeOffset();
                assertTrue("Constructor branch must remain in the retained prefix/collapse path", target >= 0 && target < finalAddress && boundaries.contains(target));
            }
            address += after.get(index).getCodeUnits();
        }
        FiveRegisterInstruction collapse = (FiveRegisterInstruction) after.get(prefix);
        assertEquals(4, collapse.getRegisterC());
        assertEquals(BannerAdsPatch.CLEAR, id((MethodReference) ((ReferenceInstruction) collapse).getReference()));
        assertEquals(Opcode.RETURN_VOID, after.get(prefix + 1).getOpcode());
    }

    @Test public void requestsCompleteUnavailableAndHostsStayCollapsedAcrossClearAndReparent() throws Exception {
        VM vm = new VM(originals(), patch);
        vm.execute(BannerAdsPatch.PLACEHOLDER, vm.owner, new Object());
        vm.assertHidden();
        vm.root.visible = vm.inner.visible = 0;
        vm.execute(BannerAdsPatch.REQUEST, vm.owner, vm.callback);
        assertEquals(1, vm.unavailable);
        vm.assertHidden();
        vm.root.visible = vm.inner.visible = 0;
        vm.execute(BannerAdsPatch.CLEAR, vm.owner);
        vm.assertHidden();
        Node previous = vm.root;
        Node replacement = new Node();
        vm.execute(BannerAdsPatch.REPARENT, vm.owner, replacement);
        assertTrue(previous.children.isEmpty());
        assertEquals(List.of(vm.inner), replacement.children);
        vm.assertHidden();
    }

    private static final class Node {
        int visible;
        final List<Node> children = new ArrayList<>();
    }
    /** Bounded execution of the rewritten DEX; unexpected SDK/network calls fail immediately. */
    private static final class VM {
        final Object owner = new Object(), callback = new Object(), unavailableProvider = new Object(), unavailableReason = new Object();
        Node root = new Node(), inner = new Node();
        final Map<String, MethodImplementation> bodies = new HashMap<>();
        int unavailable;
        VM(Map<String, Method> originals, BannerAdsPatch patch) {
            originals.forEach((name, method) -> bodies.put(name, patch.implementation(method)));
            root.children.add(inner);
        }
        void assertHidden() { assertEquals(8, root.visible); assertEquals(8, inner.visible); }
        void execute(String descriptor, Object... parameters) {
            MethodImplementation body = bodies.get(descriptor);
            assertNotNull(descriptor, body);
            Object[] registers = new Object[body.getRegisterCount()];
            System.arraycopy(parameters, 0, registers, registers.length - parameters.length, parameters.length);
            for (Instruction instruction : body.getInstructions()) {
                switch (instruction.getOpcode()) {
                    case CONST_4, CONST_16 -> registers[((OneRegisterInstruction) instruction).getRegisterA()] = ((NarrowLiteralInstruction) instruction).getNarrowLiteral();
                    case IGET_OBJECT -> {
                        TwoRegisterInstruction regs = (TwoRegisterInstruction) instruction;
                        assertSame(owner, registers[regs.getRegisterB()]);
                        String name = ((FieldReference) ((ReferenceInstruction) instruction).getReference()).getName();
                        registers[regs.getRegisterA()] = switch (name) { case "e" -> root; case "f" -> inner; case "h" -> unavailableProvider; default -> throw new AssertionError(name); };
                    }
                    case IPUT_OBJECT -> {
                        TwoRegisterInstruction regs = (TwoRegisterInstruction) instruction;
                        assertSame(owner, registers[regs.getRegisterB()]);
                        assertEquals("e", ((FieldReference) ((ReferenceInstruction) instruction).getReference()).getName());
                        root = (Node) registers[regs.getRegisterA()];
                    }
                    case SGET_OBJECT -> registers[((OneRegisterInstruction) instruction).getRegisterA()] = unavailableReason;
                    case NEW_INSTANCE -> registers[((OneRegisterInstruction) instruction).getRegisterA()] = new Object();
                    case INVOKE_VIRTUAL, INVOKE_INTERFACE, INVOKE_DIRECT -> {
                        FiveRegisterInstruction regs = (FiveRegisterInstruction) instruction;
                        int[] indexes = {regs.getRegisterC(), regs.getRegisterD(), regs.getRegisterE(), regs.getRegisterF(), regs.getRegisterG()};
                        Object[] args = new Object[regs.getRegisterCount()];
                        for (int index = 0; index < args.length; index++) args[index] = registers[indexes[index]];
                        String call = id((MethodReference) ((ReferenceInstruction) instruction).getReference());
                        if (bodies.containsKey(call)) execute(call, args);
                        else if (call.equals("Lkrr;->o()V")) assertSame(owner, args[0]);
                        else if (call.equals("Landroid/view/View;->setVisibility(I)V")) ((Node) args[0]).visible = (Integer) args[1];
                        else if (call.equals("Lx92;->e(Lbf;Lze;)V")) {
                            assertSame(callback, args[0]); assertSame(unavailableProvider, args[1]); assertSame(unavailableReason, args[2]);
                            unavailable++;
                            root.visible = inner.visible = 0; // Caller tries to restore a fallback placeholder.
                        } else if (call.equals("Landroid/view/ViewGroup;->removeAllViews()V")) ((Node) args[0]).children.clear();
                        else if (call.equals("Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V")) ((Node) args[0]).children.add((Node) args[1]);
                        else if (call.equals("Lyp7;-><init>(II)V")) { assertEquals(-1, args[1]); assertEquals(-1, args[2]); }
                        else throw new AssertionError("Unexpected ad request or side effect: " + call);
                    }
                    case RETURN_VOID -> { return; }
                    default -> throw new AssertionError("Unexpected opcode: " + instruction.getOpcode());
                }
            }
            fail("Method did not return");
        }
    }
}
