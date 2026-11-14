import java.util.*;
import com.android.tools.smali.dexlib2.iface.*;
import com.android.tools.smali.dexlib2.iface.instruction.*;
public final class VerifyPostingAuthHooks {
 public static void main(String[] args)throws Exception{
  String owner=args[0].equals("191")?"Lo/p9ExternalSyntheticLambda6;":"Ljp/syoboi/a2chMate/feature/resedit/ResEditFragment;";
  var before=VerifySearchHistoryHooks.classes(args[1]).get(owner);var after=VerifySearchHistoryHooks.classes(args[2]).get(owner);int hooks=0;
  for(Method target:after.getMethods())if(target.getImplementation()!=null){
   var code=VerifySearchHistoryHooks.code(target);if(code.isEmpty())continue;
   if(!(code.get(0) instanceof ReferenceInstruction ref)||!ref.getReference().toString().equals("Lapp/morphe/extension/chmate/ExternalBoardAuth;->postingError(Ljava/lang/Object;Ljava/lang/CharSequence;)V"))continue;
   hooks++;Method original=null;for(Method m:before.getMethods())if(m.getName().equals(target.getName())&&m.getParameterTypes().equals(target.getParameterTypes())&&m.getReturnType().equals(target.getReturnType()))original=m;
   if(original==null||original.getImplementation().getRegisterCount()!=target.getImplementation().getRegisterCount())throw new AssertionError("native registers");
   RegisterRangeInstruction invoke=(RegisterRangeInstruction)code.get(0);if(invoke.getRegisterCount()!=2||invoke.getStartRegister()!=target.getImplementation().getRegisterCount()-3)throw new AssertionError("owner/message registers");
   var expected=VerifySearchHistoryHooks.code(original);var actual=new ArrayList<Instruction>();for(int n=1;n<code.size();n++){Instruction i=code.get(n);if(i instanceof ReferenceInstruction r){String wrapper=r.getReference().toString();
    if(wrapper.equals("Lapp/morphe/extension/chmate/ExternalBoardAuth;->observe(Ljava/lang/CharSequence;)V")||wrapper.equals("Lapp/morphe/extension/chmate/XPostPreview;->onBound(Ljava/lang/Object;)V"))continue;
    if(wrapper.equals("Lapp/morphe/extension/chmate/Haiagaru;->replace5chDomain(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;")||wrapper.equals("Lapp/morphe/extension/chmate/Haiagaru;->processEmojiTextForView(Ljava/lang/Object;Ljava/lang/CharSequence;)Ljava/lang/CharSequence;")){
     if(n+1>=code.size()||!code.get(n+1).getOpcode().name().equals("MOVE_RESULT_OBJECT")||((OneRegisterInstruction)code.get(n+1)).getRegisterA()!=target.getImplementation().getRegisterCount()-2)throw new AssertionError("pre-existing text wrapper result register");n++;continue;
    }
   }actual.add(i);}
   if(expected.size()!=actual.size())throw new AssertionError("native instruction count "+expected.size()+" / "+actual.size());for(int n=0;n<expected.size();n++)if(!VerifySearchHistoryHooks.key(expected.get(n)).equals(VerifySearchHistoryHooks.key(actual.get(n))))throw new AssertionError("native instruction "+n);
  }
  if(hooks!=1)throw new AssertionError("one exact posting error hook: "+hooks);System.out.println("PASS "+args[0]+" inline auth hook: native registers and original instructions retained");
 }
}

