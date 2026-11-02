import java.io.File;
import java.util.ArrayList;
import java.util.List;
import com.android.tools.smali.dexlib2.DexFileFactory;
import com.android.tools.smali.dexlib2.Opcodes;
import com.android.tools.smali.dexlib2.Opcode;
import com.android.tools.smali.dexlib2.AccessFlags;
import com.android.tools.smali.dexlib2.iface.instruction.*;
import com.android.tools.smali.dexlib2.iface.reference.MethodReference;

class VerifyNavigationDex {
    static final String SETTINGS = "Lapp/spicetify/extension/spotify/settings/PatchSettings;";
    static final String INSTALLED = "Lapp/spicetify/extension/spotify/settings/InstalledPatches;";

    static void require(boolean condition, String message) {
        if (!condition) throw new AssertionError(message);
    }

    static boolean methodRef(Instruction instruction, String owner, String name, List<String> parameters, String result) {
        return instruction instanceof ReferenceInstruction ref && ref.getReference() instanceof MethodReference m
            && m.getDefiningClass().equals(owner) && m.getName().equals(name)
            && m.getParameterTypes().equals(parameters) && m.getReturnType().equals(result);
    }

    public static void main(String[] args) throws Exception {
        require(args.length == 2 && List.of("0", "1").contains(args[1]),
                "Usage: VerifyNavigationDex.java APK PREMIUM_TAB_PATCH_ENABLED");
        boolean enabled = args[1].equals("1");
        var dex = DexFileFactory.loadDexContainer(new File(args[0]), Opcodes.forApi(35));
        int hooks = 0, capabilities = 0, helpers = 0;
        for (var entry : dex.getDexEntryNames()) for (var cls : dex.getEntry(entry).getDexFile().getClasses()) {
            for (var method : cls.getMethods()) {
                if (method.getImplementation() == null) continue;
                boolean relevant = cls.getType().equals(INSTALLED) && method.getName().equals("hidePremiumTab")
                        || cls.getType().equals(SETTINGS) && method.getName().equals("showPremiumTab");
                if (!relevant) for (var instruction : method.getImplementation().getInstructions()) {
                    if (instruction instanceof ReferenceInstruction ref
                            && ref.getReference() instanceof MethodReference target
                            && target.getDefiningClass().equals(SETTINGS) && target.getName().equals("showPremiumTab")) {
                        relevant = true;
                        break;
                    }
                }
                if (!relevant) continue;
                var code = new ArrayList<Instruction>();
                method.getImplementation().getInstructions().forEach(code::add);
                if (cls.getType().equals(INSTALLED) && method.getName().equals("hidePremiumTab")) {
                    capabilities++;
                    require(method.getParameterTypes().isEmpty() && method.getReturnType().equals("Z")
                            && AccessFlags.STATIC.isSet(method.getAccessFlags()) && code.size() == 2
                            && code.get(0).getOpcode() == Opcode.CONST_4
                            && ((NarrowLiteralInstruction) code.get(0)).getNarrowLiteral() == (enabled ? 1 : 0)
                            && code.get(1).getOpcode() == Opcode.RETURN
                            && ((OneRegisterInstruction) code.get(0)).getRegisterA()
                                == ((OneRegisterInstruction) code.get(1)).getRegisterA(),
                            "Premium tab capability does not match patch selection");
                }
                if (cls.getType().equals(SETTINGS) && method.getName().equals("showPremiumTab")) {
                    helpers++;
                    require(method.getParameterTypes().equals(List.of("Z")) && method.getReturnType().equals("Z")
                            && AccessFlags.PUBLIC.isSet(method.getAccessFlags()) && AccessFlags.STATIC.isSet(method.getAccessFlags()),
                            "Invalid navigation helper signature");
                    int argument = method.getImplementation().getRegisterCount() - 1;
                    require(code.size() == 8
                            && code.get(0).getOpcode() == Opcode.IF_EQZ
                            && ((OffsetInstruction) code.get(0)).getCodeOffset() == 10
                            && code.get(1).getOpcode() == Opcode.INVOKE_STATIC
                            && ((FiveRegisterInstruction) code.get(1)).getRegisterCount() == 0
                            && methodRef(code.get(1), SETTINGS, "hidePremiumTabEnabled", List.of(), "Z")
                            && code.get(2).getOpcode() == Opcode.MOVE_RESULT
                            && code.get(3).getOpcode() == Opcode.IF_NEZ
                            && ((OffsetInstruction) code.get(3)).getCodeOffset() == 4
                            && code.get(4).getOpcode() == Opcode.CONST_4
                            && ((NarrowLiteralInstruction) code.get(4)).getNarrowLiteral() == 1
                            && code.get(5).getOpcode() == Opcode.RETURN
                            && code.get(6).getOpcode() == Opcode.CONST_4
                            && ((NarrowLiteralInstruction) code.get(6)).getNarrowLiteral() == 0
                            && code.get(7).getOpcode() == Opcode.RETURN
                            && List.of(0, 2, 3, 4, 5, 6, 7).stream().allMatch(index ->
                                ((OneRegisterInstruction) code.get(index)).getRegisterA() == argument)
                            && method.getImplementation().getTryBlocks().isEmpty(),
                            "Navigation helper must return the original flag AND the negated hide preference");
                }
                for (int index = 0; index < code.size(); index++) {
                    if (!(code.get(index) instanceof ReferenceInstruction ref)
                            || !(ref.getReference() instanceof MethodReference target)
                            || !target.getDefiningClass().equals(SETTINGS) || !target.getName().equals("showPremiumTab")) continue;
                    hooks++;
                    require(cls.getType().equals("Lp/tkd0;") && method.getName().equals("invoke")
                            && method.getParameterTypes().isEmpty() && method.getReturnType().equals("Ljava/lang/Object;"),
                            "Navigation hook is outside the verified flag consumer");
                    require(index >= 2 && index + 3 < code.size(), "Incomplete navigation hook");
                    require(methodRef(code.get(index - 2), "Lp/f4p0;", "b", List.of(), "Z")
                            && code.get(index - 2).getOpcode() == Opcode.INVOKE_VIRTUAL
                            && code.get(index - 1).getOpcode() == Opcode.MOVE_RESULT,
                            "Navigation hook must consume the original Premium tab flag");
                    int register = ((OneRegisterInstruction) code.get(index - 1)).getRegisterA();
                    require(code.get(index).getOpcode() == Opcode.INVOKE_STATIC_RANGE
                            && code.get(index) instanceof RegisterRangeInstruction call
                            && call.getRegisterCount() == 1 && call.getStartRegister() == register
                            && target.getParameterTypes().equals(List.of("Z")) && target.getReturnType().equals("Z")
                            && code.get(index + 1).getOpcode() == Opcode.MOVE_RESULT
                            && ((OneRegisterInstruction) code.get(index + 1)).getRegisterA() == register
                            && code.get(index + 2).getOpcode() == Opcode.CONST_4
                            && code.get(index + 3).getOpcode() == Opcode.IF_EQZ
                            && ((OneRegisterInstruction) code.get(index + 3)).getRegisterA() == register,
                            "Navigation hook must preserve the flag register and branch");
                }
            }
        }
        require(hooks == (enabled ? 1 : 0), "Unexpected Premium navigation hook count: " + hooks);
        require(enabled ? capabilities == 1 && helpers == 1 : capabilities <= 1 && helpers <= 1,
                "Missing or duplicate Premium navigation extension");
        System.out.println("Premium navigation verified: " + hooks + " hook(s), selected=" + enabled);
    }
}
