import java.util.*;
import com.android.tools.smali.dexlib2.iface.*;
import com.android.tools.smali.dexlib2.iface.instruction.*;

/** Compare the pinned submit body with its previous patched form, including branch/try offsets. */
public final class VerifyPostingIpHooks {
    private static Method find(ClassDef c,String name,int parameters){for(Method m:c.getMethods())if(m.getName().equals(name)&&m.getParameterTypes().size()==parameters&&m.getReturnType().equals("V"))return m;throw new AssertionError(name);}
    private static List<String> instructions(Method m){List<String> result=new ArrayList<>();for(Instruction i:m.getImplementation().getInstructions()){
        String key=VerifySearchHistoryHooks.key(i);if(i instanceof OffsetInstruction o)key+=" offset="+o.getCodeOffset();if(i instanceof RegisterRangeInstruction r)key+=" range="+r.getStartRegister()+":"+r.getRegisterCount();if(i instanceof WideLiteralInstruction w)key+=" wide="+w.getWideLiteral();result.add(key);
    }return result;}
    public static void main(String[] args)throws Exception{
        String version=args[0],owner=version.equals("191")?"Lo/p9ExternalSyntheticLambda6;":version.equals("226")?"Ljp/syoboi/a2chMate/feature/resedit/ResEditFragment;":"Ljp/syoboi/a2chMate/feature/resedit/ResEditFragmentViewModel;";
        int params=version.equals("226")?1:0;String name=version.equals("191")?"b":version.equals("226")?"n":"h";
        ClassDef before=VerifySearchHistoryHooks.classes(args[1]).get(owner),after=VerifySearchHistoryHooks.classes(args[2]).get(owner);
        Method original=find(before,name,params),delegate=find(after,"haiagaruIpOriginal",params),wrapper=find(after,name,params),bridge=find(after,"haiagaruIpConfirmed",0);
        if(original.getImplementation().getRegisterCount()!=delegate.getImplementation().getRegisterCount()||!instructions(original).equals(instructions(delegate)))throw new AssertionError("native instructions/registers differ");
        var oldTries=original.getImplementation().getTryBlocks();var newTries=delegate.getImplementation().getTryBlocks();if(oldTries.size()!=newTries.size())throw new AssertionError("try count");
        for(int i=0;i<oldTries.size();i++){var a=oldTries.get(i);var b=newTries.get(i);if(a.getStartCodeAddress()!=b.getStartCodeAddress()||a.getCodeUnitCount()!=b.getCodeUnitCount()||!a.getExceptionHandlers().equals(b.getExceptionHandlers()))throw new AssertionError("native try handlers differ");}
        List<String> guarded=instructions(wrapper);if(guarded.size()!=5||!guarded.get(0).contains("PostingIpWarning;->intercept(Ljava/lang/Object;)Z")||!guarded.get(3).contains("haiagaruIpOriginal")||!instructions(bridge).get(0).contains("haiagaruIpOriginal"))throw new AssertionError("guard/continuation shape");
        if(wrapper.getImplementation().getRegisterCount()!=2||bridge.getImplementation().getRegisterCount()!=1)throw new AssertionError("wrapper registers");
        System.out.println("PASS "+version+": native submit instructions/registers/try handlers retained, one scoped guard and explicit continuation");
    }
}
