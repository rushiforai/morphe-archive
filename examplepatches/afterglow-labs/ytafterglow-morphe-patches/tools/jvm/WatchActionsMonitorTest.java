import java.io.File;
import java.nio.file.Path;
import java.util.*;
import app.afterglow.patches.playback.WatchActionsExceptionGuardKt;
import app.morphe.patcher.extensions.InstructionExtensions;
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod;
import com.android.tools.smali.dexlib2.*;
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation;
import com.android.tools.smali.dexlib2.iface.*;
import com.android.tools.smali.dexlib2.iface.instruction.*;
import com.android.tools.smali.dexlib2.immutable.*;

public final class WatchActionsMonitorTest {
    private static int checks;
    private static void check(boolean value, String label) { checks++; if (!value) throw new AssertionError(label); }
    private static List<Instruction> code(Method method) {
        List<Instruction> result = new ArrayList<>(); method.getImplementation().getInstructions().forEach(result::add); return result;
    }
    private static List<String> signature(Method method) {
        List<String> result = new ArrayList<>();
        for (Instruction instruction : code(method)) {
            String value = instruction.getOpcode().name()+":"+instruction.getCodeUnits();
            if (instruction instanceof OneRegisterInstruction r) value += ":A"+r.getRegisterA();
            if (instruction instanceof TwoRegisterInstruction r) value += ":B"+r.getRegisterB();
            if (instruction instanceof ThreeRegisterInstruction r) value += ":C"+r.getRegisterC();
            if (instruction instanceof FiveRegisterInstruction r) value += ":args"+r.getRegisterCount()+","+r.getRegisterC()+","+r.getRegisterD()+","+r.getRegisterE()+","+r.getRegisterF()+","+r.getRegisterG();
            if (instruction instanceof RegisterRangeInstruction r) value += ":range"+r.getStartRegister()+","+r.getRegisterCount();
            if (instruction instanceof ReferenceInstruction r) value += ":ref"+r.getReference();
            if (instruction instanceof WideLiteralInstruction r) value += ":literal"+r.getWideLiteral();
            if (instruction instanceof OffsetInstruction r) value += ":offset"+r.getCodeOffset();
            result.add(value);
        }
        return result;
    }
    private static void validate(Method method) {
        List<Instruction> instructions = code(method); Map<Integer,Instruction> addresses = new LinkedHashMap<>(); int pc=0;
        for (Instruction i : instructions) { addresses.put(pc,i); pc += i.getCodeUnits(); }
        var regions = method.getImplementation().getTryBlocks();
        check(regions.size()==1, "one actual catch-all region: "+method.getName());
        var region = regions.get(0);
        check(region.getExceptionHandlers().size()==1 && region.getExceptionHandlers().get(0).getExceptionType()==null, "all exceptions release native monitor");
        check(region.getStartCodeAddress()==instructions.get(0).getCodeUnits(), "monitor-enter stays outside protected region");
        int end=region.getStartCodeAddress()+region.getCodeUnitCount();
        check(addresses.get(end).getOpcode()==Opcode.MONITOR_EXIT, "normal exit stays outside protected body");
        int handler=region.getExceptionHandlers().get(0).getHandlerCodeAddress();
        check(addresses.get(handler).getOpcode()==Opcode.MOVE_EXCEPTION, "handler captures original exception");
        Instruction enter=instructions.get(0), release=addresses.get(handler+addresses.get(handler).getCodeUnits());
        check(release.getOpcode()==Opcode.MONITOR_EXIT && ((OneRegisterInstruction)release).getRegisterA()==((OneRegisterInstruction)enter).getRegisterA(), "handler releases the original receiver monitor");
        Instruction rethrow=addresses.get(handler+addresses.get(handler).getCodeUnits()+release.getCodeUnits());
        check(rethrow.getOpcode()==Opcode.THROW && ((OneRegisterInstruction)rethrow).getRegisterA()==((OneRegisterInstruction)addresses.get(handler)).getRegisterA(), "same exception rethrown");
    }
    private static MutableMethod fixture(String name, String result) {
        var method=MutableMethod.Companion.toMutable(new ImmutableMethod("LWatchGuardFixture;",name,List.of(),result,
                AccessFlags.PUBLIC.getValue()|AccessFlags.FINAL.getValue()|AccessFlags.DECLARED_SYNCHRONIZED.getValue(),null,null,new MutableMethodImplementation(2)));
        InstructionExtensions.INSTANCE.addInstructions(method,0,"monitor-enter p0\n:start\ninvoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;\nmove-result-object v0\nconst/4 v0, 0x1\n:end\nmonitor-exit p0\n"+(result.equals("V")?"return-void":"return v0")+"\n:error\nmove-exception v0\nmonitor-exit p0\nthrow v0\n.catchall {:start .. :end} :error");
        return method;
    }
    public static void main(String[] args) throws Exception {
        for (String type : List.of("V","Z")) {
            MutableMethod fixture=fixture("fixture"+type,type);
            check(fixture.getImplementation().getTryBlocks().isEmpty(), "regression: inline catch directive alone is discarded");
            var before=signature(fixture); WatchActionsExceptionGuardKt.guardWatchActionsMonitor(fixture);
            check(signature(fixture).equals(before), "production guard preserves every fixture instruction"); validate(fixture);
        }
        List<Method> methods=new ArrayList<>(); int missing=0;
        if (!args[1].equals("-")) {
            var container=DexFileFactory.loadDexContainer(new File(args[1]),Opcodes.getDefault());
            for (String entry:container.getDexEntryNames()) for(ClassDef owner:container.getEntry(entry).getDexFile().getClasses())
                for(Method method:owner.getMethods()) if(method.getImplementation()!=null && Set.of("afterglow_rememberActions","afterglow_refreshActions").contains(method.getName())) methods.add(method);
            check(methods.size()==2,"exactly two packaged watch-action bridges");
        } else { methods.add(fixture("afterglow_rememberActions","V")); methods.add(fixture("afterglow_refreshActions","Z")); }
        for (Method original : methods) {
            var before=signature(original); MutableMethod fixed=MutableMethod.Companion.toMutable(original);
            if (original.getImplementation().getTryBlocks().isEmpty()) {
                missing++; check(!Boolean.parseBoolean(args[2]),"packaged bridge must already carry its catch table");
                WatchActionsExceptionGuardKt.guardWatchActionsMonitor(fixed);
            }
            validate(fixed); check(signature(fixed).equals(before),"actual native instruction body unchanged");
            var carrier=new ImmutableClassDef(original.getDefiningClass(),1,"Ljava/lang/Object;",List.of(),null,null,List.of(),List.of(fixed));
            DexFileFactory.writeDexFile(args[0],new ImmutableDexFile(Opcodes.getDefault(),List.of(carrier)));
            Method round=DexFileFactory.loadDexFile(Path.of(args[0]).toFile(),Opcodes.getDefault()).getClasses().iterator().next().getMethods().iterator().next();
            validate(round); check(signature(round).equals(before),"native instruction identity survives DEX emission");
        }
        System.out.println("PASS "+checks+" actual catch-table/monitor-release/unchanged-body checks; input bridges="+methods.size()+", missing input catch tables="+missing);
    }
}
