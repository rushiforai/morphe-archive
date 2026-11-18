import java.io.ByteArrayInputStream;
import java.util.*;
import java.util.zip.ZipFile;
import com.android.tools.smali.dexlib2.*;
import com.android.tools.smali.dexlib2.dexbacked.DexBackedDexFile;
import com.android.tools.smali.dexlib2.iface.*;
import com.android.tools.smali.dexlib2.iface.instruction.*;
import com.android.tools.smali.dexlib2.iface.reference.*;

/** Inspect the actual patched APK. Supply a dexlib2-containing jar on the classpath. */
public class VerifyCalendarWidgetDex {
    static final String HOOK="Lpl/dudek/extension/calendar/ScheduleWidgetRows;";
    static void require(boolean ok,String why){if(!ok)throw new AssertionError(why);}
    static MethodReference call(Instruction i){
        return i instanceof ReferenceInstruction r && r.getReference() instanceof MethodReference m?m:null;
    }
    public static void main(String[]args)throws Exception {
        int factories=0,wraps=0,inits=0; boolean helper=false,accountGate=false,chooser=false,visibility=false;
        try(ZipFile zip=new ZipFile(args[0])) {
            var entries=zip.entries();
            while(entries.hasMoreElements()) {
                var entry=entries.nextElement(); if(!entry.getName().endsWith(".dex"))continue;
                var dex=DexBackedDexFile.fromInputStream(Opcodes.getDefault(),new ByteArrayInputStream(zip.getInputStream(entry).readAllBytes()));
                for(ClassDef c:dex.getClasses()) {
                    if(c.getType().equals(HOOK)){helper=true;continue;}
                    if(c.getType().equals("Lpl/dudek/extension/calendar/CalendarAccountAccessActivity;")) {
                        require(c.getSuperclass().equals("Landroid/app/Activity;"),"Wrong account entry superclass");
                        accountGate=true;
                        for(Method m:c.getMethods()) {
                            if(m.getImplementation()==null)continue;
                            for(Instruction i:m.getImplementation().getInstructions()) {
                                MethodReference ref=call(i);
                                if(ref==null||!ref.getDefiningClass().equals("Landroid/accounts/AccountManager;"))continue;
                                if(ref.getName().equals("newChooseAccountIntent"))chooser=true;
                                if(ref.getName().equals("getAccountsByType"))visibility=true;
                                require(!ref.getName().equals("addAccount")&&!ref.getName().equals("getAuthToken"),"Unexpected credential operation");
                            }
                        }
                    }
                    for(Method m:c.getMethods()) {
                        if(m.getImplementation()==null)continue;
                        List<Instruction> code=new ArrayList<>();m.getImplementation().getInstructions().forEach(code::add);
                        if(code.stream().noneMatch(i->call(i)!=null&&call(i).getDefiningClass().equals(HOOK)))continue;
                        require(m.getName().equals("getViewAt"),"Hook outside agenda row factory");
                        require(c.getInterfaces().contains("Landroid/widget/RemoteViewsService$RemoteViewsFactory;"),"Wrong factory");
                        factories++;
                        Map<Integer,Integer> indices=new HashMap<>();int offset=0;
                        for(int k=0;k<code.size();k++){indices.put(offset,k);offset+=code.get(k).getCodeUnits();}
                        require(call(code.get(3))!=null&&call(code.get(3)).getName().equals("initialize"),"Missing entry initialization");
                        require(code.get(2).getOpcode()==Opcode.IGET_OBJECT,"Missing context load");
                        require(((ReferenceInstruction)code.get(2)).getReference() instanceof FieldReference f&&
                            f.getType().equals("Landroid/content/Context;"),"Initialization needs actual Context");
                        require(((TwoRegisterInstruction)code.get(2)).getRegisterA()==
                            ((RegisterRangeInstruction)code.get(3)).getStartRegister(),"Wrong Context register");
                        Set<Integer> forbiddenTargets=new HashSet<>(); int returns=0;
                        for(int k=0;k<code.size();k++) {
                            var ref=call(code.get(k));
                            if(ref!=null&&ref.getDefiningClass().equals(HOOK)) {
                                if(ref.getName().equals("wrap"))wraps++;
                                else if(ref.getName().equals("initialize"))inits++;
                                else throw new AssertionError("Unknown hook");
                            }
                            if(code.get(k).getOpcode()!=Opcode.RETURN_OBJECT)continue;
                            returns++;
                            require(k>=2&&call(code.get(k-2))!=null&&call(code.get(k-2)).getDefiningClass().equals(HOOK)&&
                                call(code.get(k-2)).getName().equals("wrap"),"Unwrapped return");
                            require(code.get(k-1).getOpcode()==Opcode.MOVE_RESULT_OBJECT,"Missing wrapper result");
                            int r=((OneRegisterInstruction)code.get(k)).getRegisterA();
                            require(((RegisterRangeInstruction)code.get(k-2)).getStartRegister()==r&&
                                ((OneRegisterInstruction)code.get(k-1)).getRegisterA()==r,"Return register clobbered");
                            forbiddenTargets.add(k-1);forbiddenTargets.add(k);
                        }
                        require(returns==7,"Wrong return coverage");
                        offset=0;
                        for(var i:code) {
                            if(i instanceof OffsetInstruction jump) {
                                require(i.getOpcode()!=Opcode.PACKED_SWITCH&&i.getOpcode()!=Opcode.SPARSE_SWITCH,"Review new switch flow");
                                Integer target=indices.get(offset+jump.getCodeOffset());
                                require(target!=null&&!forbiddenTargets.contains(target),"Branch bypasses wrapper or enters move-result");
                            }
                            offset+=i.getCodeUnits();
                        }
                    }
                }
            }
            require(zip.getEntry("res/layout/dudeks_calendar_widget_row.xml")!=null,"Missing wrapper XML in output APK");
        }
        require(helper&&factories==1&&inits==1&&wraps==7,"Incomplete or overbroad patch");
        require(accountGate&&chooser&&visibility,"Missing framework account entry/chooser/visibility check");
        System.out.println("PASS: Calendar extension, wrapper resource, entry context, all 7 returns and branch/register safety in emitted APK");
    }
}
