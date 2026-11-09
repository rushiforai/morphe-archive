import com.android.tools.smali.dexlib2.Opcode;
import com.android.tools.smali.dexlib2.iface.Method;
import com.android.tools.smali.dexlib2.iface.instruction.*;
import com.android.tools.smali.dexlib2.iface.reference.*;
import java.util.*;
import tw.maps.TwoWheelerCore;

/** Executes the serialized selector and builder prefix, using mock host objects.
 * It deliberately does NOT claim to emulate Android, JNI, or routing services. */
public class GuardInterpreter {
    static final class Host {
        final boolean projected;
        final String vehicle;
        Host(boolean projected, String vehicle) { this.projected = projected; this.vehicle = vehicle; }
    }
    static String field(String owner, String name, String type) { return owner + "->" + name + ":" + type; }
    static String mode(boolean two, boolean builder) {
        return builder ? field("Lqvv;", two ? "b" : "a", "Lqvv;") : field("Lckbl;", two ? "f" : "a", "Lckbl;");
    }
    static boolean zero(Object x) { return x == null || x.equals(0); }

    public static void verify(Method method) {
        boolean builder = method.toString().equals(TwoWheelerCore.BUILDER);
        int cases = 0;
        for (boolean projected : new boolean[]{false,true}) for (String vehicle : List.of("a","b","c","d"))
            for (boolean flag : new boolean[]{false,true}) for (String input : builder ? List.of("a","b","c") : List.of("a")) {
                String supplied = field("Lqvv;",input,"Lqvv;");
                String expected = projected && vehicle.equals("b") ? mode(true,builder)
                    : flag && vehicle.equals("d") ? mode(true,builder) : builder ? supplied : mode(false,false);
                String actual = run(method, new Host(projected,field("Lplq;",vehicle,"Lplq;")), flag, supplied);
                if (!expected.equals(actual)) throw new AssertionError("Guard behavior mismatch " + method + " host=" + projected + "/" + vehicle + " flag=" + flag + " input=" + input + " got=" + actual);
                cases++;
            }
        System.out.println("GUARD MATRIX " + method + ": " + cases + " cases passed");
    }

    static String run(Method method, Host host, boolean flag, String supplied) {
        boolean builder = method.toString().equals(TwoWheelerCore.BUILDER);
        Object[] r = new Object[method.getImplementation().getRegisterCount()];
        if (builder) { r[37]="this"; r[41]=supplied; } else r[r.length-1]="this";
        Map<Integer,Instruction> instructions = new HashMap<>();
        int address = 0;
        for (var i : method.getImplementation().getInstructions()) { instructions.put(address,i); address += i.getCodeUnits(); }
        int pc = 0;
        Object result = null;
        for (int steps=0; steps<150; steps++) {
            Instruction i = instructions.get(pc);
            if (i == null) throw new AssertionError("Branch does not target an instruction: " + pc);
            int next = pc+i.getCodeUnits();
            int a = i instanceof OneRegisterInstruction ? ((OneRegisterInstruction)i).getRegisterA() : -1;
            int b = i instanceof TwoRegisterInstruction ? ((TwoRegisterInstruction)i).getRegisterB() : -1;
            switch(i.getOpcode()) {
                case MOVE_OBJECT: case MOVE_OBJECT_FROM16: r[a]=r[b]; break;
                case IGET_OBJECT: {
                    String ref=((ReferenceInstruction)i).getReference().toString();
                    if (ref.equals(field("Lbtxk;","f","Ljava/lang/Object;"))) r[a]="provider";
                    else if (ref.equals(field("Lbtxk;","a","Ljava/lang/Object;")) || ref.equals(field("Lqxa;","m","Lbwbm;"))) r[a]="flags";
                    else if (ref.equals(field("Lqxa;","c","Lpkr;"))) r[a]=host;
                    else throw new AssertionError("Unknown mock field: " + ref);
                    break;
                }
                case INSTANCE_OF: r[a] = r[b] instanceof Host && ((Host)r[b]).projected ? 1:0; break;
                case CHECK_CAST: break;
                case SGET_OBJECT: r[a]=((ReferenceInstruction)i).getReference().toString(); break;
                case INVOKE_INTERFACE: case INVOKE_VIRTUAL: {
                    String ref=((ReferenceInstruction)i).getReference().toString();
                    var invoke=(FiveRegisterInstruction)i;
                    if (ref.equals("Lcqvj;->a()Ljava/lang/Object;")) result=host;
                    else if (ref.equals("Lpkr;->d()Lplq;")) result=host.vehicle;
                    else if (ref.equals("Lbwbm;->l()Z")) result=flag?1:0;
                    else if (ref.equals("Lplq;->equals(Ljava/lang/Object;)Z")) result=Objects.equals(r[invoke.getRegisterC()],r[invoke.getRegisterD()])?1:0;
                    else throw new AssertionError("Unknown mock call: " + ref);
                    break;
                }
                case MOVE_RESULT: case MOVE_RESULT_OBJECT: r[a]=result; break;
                case IF_EQZ:
                    if (builder && a==38) return (String)r[3]; // builder prefix ends here
                    if(zero(r[a])) next=pc+((OffsetInstruction)i).getCodeOffset();
                    break;
                case IF_NEZ: if(!zero(r[a])) next=pc+((OffsetInstruction)i).getCodeOffset(); break;
                case IF_NE: if(!Objects.equals(r[a],r[b])) next=pc+((OffsetInstruction)i).getCodeOffset(); break;
                case GOTO: case GOTO_16: case GOTO_32: next=pc+((OffsetInstruction)i).getCodeOffset(); break;
                case RETURN_OBJECT: return (String)r[a];
                default: throw new AssertionError("Unsupported interpreter opcode: " + i.getOpcode());
            }
            pc=next;
        }
        throw new AssertionError("Interpreter did not terminate");
    }
}
