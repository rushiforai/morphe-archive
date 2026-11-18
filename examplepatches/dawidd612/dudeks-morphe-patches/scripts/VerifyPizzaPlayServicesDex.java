import java.util.*;
import com.android.tools.smali.dexlib2.*;
import com.android.tools.smali.dexlib2.iface.*;
import com.android.tools.smali.dexlib2.iface.instruction.*;
import com.android.tools.smali.dexlib2.iface.reference.FieldReference;

/** Execute the emitted update-UI guards, preserving original errors/authentication. */
public final class VerifyPizzaPlayServicesDex extends VerifyPizzaRewardDex {
    static final String OWNER = "Lcom/google/android/gms/common/GoogleApiAvailability;";
    static final String RESULT = "Lcom/google/android/gms/common/ConnectionResult;";
    static final Object LISTENER = new Object();

    static String instruction(Instruction i) {
        return i.getOpcode()+"/"+registers(i)+"/"+
            (i instanceof ReferenceInstruction r ? r.getReference() : "")+"/"+
            (i instanceof WideLiteralInstruction l ? l.getWideLiteral() : "")+"/"+
            (i instanceof OffsetInstruction o ? o.getCodeOffset() : "");
    }

    static void originalBody(Method before, Method after, int start, int added) {
        validateRegistersAndBranches(after);
        check(before.getImplementation().getRegisterCount()==after.getImplementation().getRegisterCount(), "Register frame changed");
        var old = code(before); var now = new ArrayList<>(code(after));
        int units = now.subList(start,start+added).stream().mapToInt(Instruction::getCodeUnits).sum();
        now.subList(start,start+added).clear();
        check(old.stream().map(VerifyPizzaPlayServicesDex::instruction).toList().equals(
            now.stream().map(VerifyPizzaPlayServicesDex::instruction).toList()), "Original availability body changed: "+key(before));
        var oldTries=before.getImplementation().getTryBlocks(); var newTries=after.getImplementation().getTryBlocks();
        check(oldTries.size()==newTries.size(), "Exception regions changed");
        for(int i=0;i<oldTries.size();i++) {
            var a=oldTries.get(i);var b=newTries.get(i);
            check(b.getStartCodeAddress()==a.getStartCodeAddress()+units && b.getCodeUnitCount()==a.getCodeUnitCount(), "Exception range moved incorrectly");
            check(a.getExceptionHandlers().size()==b.getExceptionHandlers().size(), "Exception handlers changed");
            for(int j=0;j<a.getExceptionHandlers().size();j++) {
                var x=a.getExceptionHandlers().get(j);var y=b.getExceptionHandlers().get(j);
                check(Objects.equals(x.getExceptionType(),y.getExceptionType()) && y.getHandlerCodeAddress()==x.getHandlerCodeAddress()+units, "Exception handler moved incorrectly");
            }
        }
    }

    // Returns cancellation count, or -1 when the original method is reached.
    static int executeGuard(Method method, int error, boolean withListener, int start, int boundary) {
        var c=code(method);var indices=offsets(c);var values=new Object[method.getImplementation().getRegisterCount()];
        Arrays.fill(values,UNSET);
        if(start>0) values[((TwoRegisterInstruction)c.get(start-1)).getRegisterA()]=error;
        else {values[values.length-2]=error;values[values.length-1]=withListener?LISTENER:null;}
        int pc=0;for(int n=0;n<start;n++)pc+=c.get(n).getCodeUnits();
        int cancels=0;
        for(int step=0;step<32;step++) {
            int index=indices.get(pc);
            if(index==boundary)return -1;
            var i=c.get(index);int next=pc+i.getCodeUnits();
            switch(i.getOpcode()) {
                case CONST_4, CONST_16 -> values[((OneRegisterInstruction)i).getRegisterA()]=((NarrowLiteralInstruction)i).getNarrowLiteral();
                case IF_EQ, IF_NE -> {
                    var r=(TwoRegisterInstruction)i;boolean same=Objects.equals(values[r.getRegisterA()],values[r.getRegisterB()]);
                    if(same==(i.getOpcode()==Opcode.IF_EQ))next=pc+((OffsetInstruction)i).getCodeOffset();
                }
                case IF_EQZ -> {Object v=values[((OneRegisterInstruction)i).getRegisterA()];if(v==null || Objects.equals(v,0))next=pc+((OffsetInstruction)i).getCodeOffset();}
                case INVOKE_INTERFACE -> {
                    check(key(call(i)).equals("Landroid/content/DialogInterface$OnCancelListener;->onCancel(Landroid/content/DialogInterface;)V"), "Unexpected UI/auth callback");
                    var r=registers(i);check(values[r.get(0)]==LISTENER && Objects.equals(values[r.get(1)],0), "Cancellation arguments changed");cancels++;
                }
                case RETURN_VOID -> {return cancels;}
                default -> throw new AssertionError("Unexpected guard instruction "+i.getOpcode());
            }
            pc=next;
        }
        throw new AssertionError("Update guard did not terminate");
    }

    static Set<String> verify(Map<String,ClassDef> patched,Map<String,ClassDef> original,boolean microg) {
        var roles=new ArrayList<Method>();
        for(var m:original.get(OWNER).getMethods()) {
            var p=m.getParameterTypes();
            if(m.getReturnType().equals("V") && (
                p.equals(List.of("Landroid/content/Context;",RESULT)) ||
                p.equals(List.of("Lcom/google/android/gms/common/api/GoogleApiActivity;","I","Lcom/google/android/gms/common/api/GoogleApiActivity;")) ||
                (p.size()==4 && p.get(0).equals("Landroid/app/Activity;") && p.get(2).equals("I") && p.get(3).equals("Landroid/content/DialogInterface$OnCancelListener;"))))roles.add(m);
        }
        check(roles.size()==3,"Missing or ambiguous availability UI roles");
        Set<String> changed=new HashSet<>();
        for(var before:roles) {
            var after=method(patched,OWNER,before.getName(),"V",before.getParameterTypes().stream().map(Object::toString).toArray(String[]::new));
            if(!microg) {check(canonical(before).equals(canonical(after)), "Stock-only mode changed GMS UI");continue;}
            boolean notification=before.getParameterTypes().equals(List.of("Landroid/content/Context;",RESULT));
            int start=0;int added=notification?5:8;
            if(notification) {
                var originalCode=code(before);
                for(int n=0;n<originalCode.size();n++) {
                    var i=originalCode.get(n);
                    if(i.getOpcode()==Opcode.IGET && i instanceof ReferenceInstruction r && r.getReference() instanceof FieldReference f && f.getDefiningClass().equals(RESULT) && f.getType().equals("I")) {start=n+1;break;}
                }
                check(start>0,"Missing notification error-code load");
            }
            originalBody(before,after,start,added);changed.add(key(after));
            for(int error=-1;error<=24;error++)for(boolean listener:List.of(false,true)) {
                int actual=executeGuard(after,error,listener,start,start+added);
                int expected=error==2||error==18 ? (!notification&&listener?1:0) : -1;
                check(actual==expected,"Wrong update/auth error handling: "+before.getName()+" error="+error);
            }
            for(int repeat=0;repeat<50;repeat++)check(executeGuard(after,2,true,start,start+added)==(notification?0:1),"Repeated updates reached UI");
        }
        int preserved=0;
        for(String owner:List.of(OWNER,RESULT,"Lcom/google/android/gms/common/a;","Lcom/google/android/gms/common/api/GoogleApiActivity;")) {
            for(var before:original.get(owner).getMethods())if(!changed.contains(key(before))) {
                var after=method(patched,owner,before.getName(),before.getReturnType(),before.getParameterTypes().stream().map(Object::toString).toArray(String[]::new));
                check(canonical(before).equals(canonical(after)),"Availability result/real resolution changed: "+key(before));preserved++;
            }
        }
        System.out.println("PASS: "+(microg?"update codes 2/18 suppressed; original dialogs cancelled once, other errors/auth resolutions preserved":"stock GMS UI unchanged")+"; "+preserved+" availability/result/activity methods unchanged");
        return changed;
    }

    public static void main(String[] args)throws Exception {
        verify(availabilityClasses(args[0]),availabilityClasses(args[1]),args.length<3||args[2].equals("microg"));
    }

    // Standalone checks are explicitly scoped to GMS availability, not the
    // integration verifier's whole-APK class/asset validity contract.
    static Map<String,ClassDef> availabilityClasses(String file)throws Exception {
        Set<String> selected=Set.of(OWNER,RESULT,"Lcom/google/android/gms/common/a;","Lcom/google/android/gms/common/api/GoogleApiActivity;");
        Map<String,ClassDef> found=new HashMap<>();
        var dex=DexFileFactory.loadDexContainer(new java.io.File(file),Opcodes.getDefault());
        for(String entry:dex.getDexEntryNames())for(var cls:dex.getEntry(entry).getDexFile().getClasses())
            if(selected.contains(cls.getType()))check(found.put(cls.getType(),cls)==null,"Duplicate availability class");
        check(found.keySet().equals(selected),"Missing availability class");return found;
    }
}
