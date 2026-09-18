import java.io.File;
import java.util.ArrayList;
import com.android.tools.smali.dexlib2.DexFileFactory;
import com.android.tools.smali.dexlib2.Opcodes;
import com.android.tools.smali.dexlib2.Opcode;
import com.android.tools.smali.dexlib2.AccessFlags;
import com.android.tools.smali.dexlib2.iface.instruction.Instruction;
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction;
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction;
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction;
import com.android.tools.smali.dexlib2.iface.reference.MethodReference;

/** Run with Morphe Desktop's all.jar on the classpath and Java 21. */
class VerifySharingDex {
    private static final String HELPER = "Lapp/spicetify/extension/spotify/privacy/SharingLinks;";

    public static void main(String[] args) throws Exception {
        if (args.length != 2) throw new IllegalArgumentException("Usage: VerifySharingDex.java APK EXPECTED_CALLS");
        int expected = Integer.parseInt(args[1]);
        int helpers = 0;
        int calls = 0;
        var dex = DexFileFactory.loadDexContainer(new File(args[0]), Opcodes.getDefault());
        for (var entry : dex.getDexEntryNames()) {
            for (var cls : dex.getEntry(entry).getDexFile().getClasses()) {
                for (var method : cls.getMethods()) {
                    if (cls.getType().equals(HELPER) && method.getName().equals("sanitizeUrl")) {
                        if (!method.getParameterTypes().equals(java.util.List.of("Ljava/lang/String;"))
                                || !method.getReturnType().equals("Ljava/lang/String;")
                                || !AccessFlags.PUBLIC.isSet(cls.getAccessFlags())
                                || !AccessFlags.PUBLIC.isSet(method.getAccessFlags())
                                || !AccessFlags.STATIC.isSet(method.getAccessFlags())
                                || method.getImplementation() == null) {
                            throw new AssertionError("Injected helper has an invalid signature, access flags, or no body");
                        }
                        helpers++;
                    }
                    if (method.getImplementation() == null) continue;
                    var instructions = new ArrayList<Instruction>();
                    method.getImplementation().getInstructions().forEach(instructions::add);
                    for (int i = 0; i < instructions.size(); i++) {
                        var instruction = instructions.get(i);
                        if (!(instruction instanceof ReferenceInstruction ref)
                                || !(ref.getReference() instanceof MethodReference target)
                                || !target.getDefiningClass().equals(HELPER)
                                || !target.getName().equals("sanitizeUrl")) continue;
                        calls++;
                        if (!target.getParameterTypes().equals(java.util.List.of("Ljava/lang/String;"))
                                || !target.getReturnType().equals("Ljava/lang/String;")) {
                            throw new AssertionError("Sanitizer call descriptor does not match the helper");
                        }
                        if (i < 2 || i + 1 >= instructions.size()
                                || instruction.getOpcode() != Opcode.INVOKE_STATIC_RANGE
                                || !(instruction instanceof RegisterRangeInstruction range)
                                || range.getRegisterCount() != 1
                                || instructions.get(i - 1).getOpcode() != Opcode.MOVE_RESULT_OBJECT
                                || instructions.get(i + 1).getOpcode() != Opcode.MOVE_RESULT_OBJECT
                                || ((OneRegisterInstruction) instructions.get(i - 1)).getRegisterA() != range.getStartRegister()
                                || ((OneRegisterInstruction) instructions.get(i + 1)).getRegisterA() != range.getStartRegister()
                                || !(instructions.get(i - 2) instanceof ReferenceInstruction previous)
                                || !(previous.getReference() instanceof MethodReference uri)
                                || !uri.getDefiningClass().equals("Landroid/net/Uri;")
                                || !uri.getName().equals("toString")) {
                            throw new AssertionError("Sanitizer call does not preserve the URI result register");
                        }
                        System.out.println("Verified call: " + cls.getType() + "->" + method.getName());
                    }
                }
            }
        }
        if (calls != expected || helpers != expected) {
            throw new AssertionError("Expected " + expected + " helper/call; found " + helpers + "/" + calls);
        }
        System.out.println("Sharing DEX verified: " + calls + " call(s), " + helpers + " helper(s)");
    }
}
