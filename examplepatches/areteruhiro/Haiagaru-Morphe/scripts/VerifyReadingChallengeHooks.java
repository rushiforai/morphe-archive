import com.android.tools.smali.dexlib2.*;
import com.android.tools.smali.dexlib2.iface.*;
import com.android.tools.smali.dexlib2.iface.instruction.*;
import com.android.tools.smali.dexlib2.iface.reference.*;
import java.util.*;

/** Compare final APK boundaries to the unpatched app, including native callback registers and branches. */
public final class VerifyReadingChallengeHooks {
    static final String AUTH="Lapp/morphe/extension/chmate/ReadingAuth;";
    static final String PARAM="Ljp/syoboi/a2chMate/client/cloudflare/ChallengeParam;";
    static void check(boolean ok,String label){if(!ok)throw new AssertionError(label);}
    static String signature(Instruction i){
        String s=i.getOpcode().toString();
        if(i instanceof OneRegisterInstruction x)s+=" A"+x.getRegisterA();
        if(i instanceof TwoRegisterInstruction x)s+=" B"+x.getRegisterB();
        if(i instanceof ThreeRegisterInstruction x)s+=" C"+x.getRegisterC();
        if(i instanceof FiveRegisterInstruction x)s+=" regs"+List.of(x.getRegisterC(),x.getRegisterD(),x.getRegisterE(),x.getRegisterF(),x.getRegisterG()).subList(0,x.getRegisterCount());
        if(i instanceof RegisterRangeInstruction x)s+=" range"+x.getStartRegister()+":"+x.getRegisterCount();
        if(i instanceof ReferenceInstruction x)s+=" ref"+x.getReference();
        if(i instanceof WideLiteralInstruction x)s+=" lit"+x.getWideLiteral();
        if(i instanceof OffsetInstruction x)s+=" offset"+x.getCodeOffset();
        return s;
    }
    public static void main(String[] args)throws Exception{
        var before=VerifyViewingUserAgentHooks.load(args[0]);var after=VerifyViewingUserAgentHooks.load(args[1]);
        var models=new HashSet<String>();for(var cls:before.values())for(var field:cls.getFields())if(field.getType().equals(PARAM))models.add(cls.getType());
        int loads=0,callbacks=0,clients=0;
        for(var cls:before.values())for(var old:cls.getMethods()){
            if(old.getImplementation()==null)continue;
            var nativeCode=VerifyViewingUserAgentHooks.code(old);
            boolean dialog=old.getName().equals("onViewCreated")&&nativeCode.stream().anyMatch(i->i instanceof ReferenceInstruction r&&r.getReference() instanceof FieldReference f&&f.getType().equals(PARAM));
            boolean client="Landroid/webkit/WebViewClient;".equals(cls.getSuperclass())&&old.getName().equals("onPageFinished");
            if(client){client=false;for(var field:cls.getFields())if(models.contains(field.getType()))client=true;}
            if(!dialog&&!client)continue;
            Method current=null;for(var m:after.get(cls.getType()).getMethods())if(m.getName().equals(old.getName())&&m.getParameterTypes().equals(old.getParameterTypes()))current=m;
            check(current!=null,"method retained");check(current.getImplementation().getRegisterCount()==old.getImplementation().getRegisterCount(),"register count");
            var patched=VerifyViewingUserAgentHooks.code(current);
            if(client){
                check(patched.size()==nativeCode.size()+1,"callback has exactly one added instruction");
                var entry=patched.get(0);check(entry instanceof RegisterRangeInstruction,"range callback entry");
                var range=(RegisterRangeInstruction)entry;
                check(range.getStartRegister()==old.getImplementation().getRegisterCount()-2&&range.getRegisterCount()==2,"WebView and URL arguments");
                check(((ReferenceInstruction)entry).getReference().toString().equals(AUTH+"->challengeFinished(Landroid/webkit/WebView;Ljava/lang/String;)V"),"callback target");
                for(int i=0;i<nativeCode.size();i++)check(signature(nativeCode.get(i)).equals(signature(patched.get(i+1))),"native callback instruction "+i);
                callbacks++;
            }
            if(dialog){
                for(var instruction:patched)if(instruction instanceof ReferenceInstruction r&&r.getReference().toString().equals(AUTH+"->setChallengeClient(Landroid/webkit/WebView;Landroid/webkit/WebViewClient;)V")){
                    var replacement=(FiveRegisterInstruction)instruction;
                    var original=nativeCode.stream().filter(i->i instanceof ReferenceInstruction ref&&ref.getReference().toString().equals("Landroid/webkit/WebView;->setWebViewClient(Landroid/webkit/WebViewClient;)V")).findFirst().orElseThrow();
                    var call=(FiveRegisterInstruction)original;
                    check(instruction.getOpcode()==Opcode.INVOKE_STATIC&&replacement.getRegisterCount()==2&&replacement.getRegisterC()==call.getRegisterC()&&replacement.getRegisterD()==call.getRegisterD(),"client receiver/argument registers");clients++;
                }
                for(var instruction:patched)if(instruction instanceof ReferenceInstruction r&&r.getReference().toString().equals(AUTH+"->loadChallenge(Landroid/webkit/WebView;Ljava/lang/String;)V")){
                    var replacement=(FiveRegisterInstruction)instruction;
                    var original=nativeCode.stream().filter(i->i instanceof ReferenceInstruction ref&&ref.getReference().toString().equals("Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;)V")).findFirst().orElseThrow();
                    var call=(FiveRegisterInstruction)original;
                    check(instruction.getOpcode()==Opcode.INVOKE_STATIC&&replacement.getRegisterCount()==2&&replacement.getRegisterC()==call.getRegisterC()&&replacement.getRegisterD()==call.getRegisterD(),"load receiver/URL registers");loads++;
                }
            }
        }
        check(loads==1&&callbacks==1&&clients==1,"one native dialog load, callback and client");
        check(!after.containsKey("Lapp/morphe/extension/chmate/RandomUserAgentRotation;"),"UA experiment class removed");
        System.out.println("PASS native reading challenge: exact callback preservation, load arguments, UA experiment removed");
    }
}
