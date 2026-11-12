import java.util.*;
import com.android.tools.smali.dexlib2.iface.*;
import com.android.tools.smali.dexlib2.iface.instruction.*;
import com.android.tools.smali.dexlib2.iface.reference.*;

/** Offline verification of fixed site-date hooks and lossless date formatter wrapping. */
public final class VerifySiteThreadMetadataHooks {
    static void ok(boolean value,String label){if(!value)throw new AssertionError(label);}
    public static void main(String[] args)throws Exception {
        String version=args[0],owner=version.equals("191")?"Lo/m8a;":version.equals("226")?"Lo/getWriteBytesTotal;":"Lo/zzavb;";
        var before=VerifySearchHistoryHooks.classes(args[1]);var after=VerifySearchHistoryHooks.classes(args[2]);
        int epochs=0,momentum=0,scopes=0;
        for(Method patched:after.get(owner).getMethods()){
            if(patched.getImplementation()==null)continue;
            var actual=VerifySearchHistoryHooks.code(patched);
            for(int n=0;n<actual.size();n++){
                Instruction ins=actual.get(n);MethodReference ref=ins instanceof ReferenceInstruction r&&r.getReference() instanceof MethodReference m?m:null;
                if(ref!=null&&ref.getDefiningClass().equals("Lapp/morphe/extension/chmate/SiteThreadMetadata;")){
                    if(ref.getName().equals("epoch")||ref.getName().equals("momentum")){
                        ok(n>0&&actual.get(n-1).getOpcode().name().equals("IGET_WIDE"),"hook uses the exact native long field read");
                        FieldReference field=(FieldReference)((ReferenceInstruction)actual.get(n-1)).getReference();
                        if(ref.getName().equals("epoch"))ok(field.getDefiningClass().equals(version.equals("191")?"Lo/MaxAdViewImplExternalSyntheticLambda1;":version.equals("226")?"Lo/CertificateChainCleaner;":"Lo/setSkipText;")&&field.getName().equals(version.equals("191")?"e":version.equals("226")?"b":"d")&&field.getType().equals("J"),"epoch hook reads the native thread ID");
                        else ok(field.getDefiningClass().equals("Lo/zzauw;")&&field.getName().equals("e")&&field.getType().equals("J"),"momentum hook reads the native count calculation");
                        int pair=((OneRegisterInstruction)actual.get(n-1)).getRegisterA();
                        ok(ins instanceof RegisterRangeInstruction range&&range.getStartRegister()==pair&&range.getRegisterCount()==2,"wide invoke register pair");
                        ok(n+1<actual.size()&&actual.get(n+1).getOpcode().name().equals("MOVE_RESULT_WIDE")&&((OneRegisterInstruction)actual.get(n+1)).getRegisterA()==pair,"wide result register pair");
                        ok(pair+1<patched.getImplementation().getRegisterCount(),"no register overflow");n++;
                        if(ref.getName().equals("epoch"))epochs++;else momentum++;
                    }else {ok(Set.of("begin","end").contains(ref.getName()),"only known scope hooks");scopes++;}
                }
            }
        }
        ok(epochs==(version.equals("242")?2:4),"expected fixed epoch anchors");
        ok(momentum==(version.equals("242")?3:0),"expected fixed momentum anchors");
        ok(version.equals("242")?scopes==0:scopes>=2,"legacy calculation scopes");
        String formatter=version.equals("191")?"Lo/ocd;->e(J)Ljava/lang/String;":version.equals("226")?"Lo/getMaxLine;->d(J)Ljava/lang/String;":"Lo/singleRefIterator;->b(J)Ljava/lang/String;";
        int split=formatter.indexOf("->");String formatterOwner=formatter.substring(0,split),formatterName=formatter.substring(split+2,formatter.indexOf('('));
        Method oldDate=null,newDate=null,nativeDate=null;
        for(Method candidate:before.get(formatterOwner).getMethods())if(candidate.getName().equals(formatterName)&&candidate.getParameterTypes().equals(List.of("J"))&&candidate.getReturnType().equals("Ljava/lang/String;"))oldDate=candidate;
        for(Method candidate:after.get(formatterOwner).getMethods()){
            if(candidate.getName().equals(formatterName)&&candidate.getParameterTypes().equals(List.of("J"))&&candidate.getReturnType().equals("Ljava/lang/String;"))newDate=candidate;
            if(candidate.getName().equals("haiagaruNativeSiteDate")&&candidate.getParameterTypes().equals(List.of("J"))&&candidate.getReturnType().equals("Ljava/lang/String;"))nativeDate=candidate;
        }
        ok(oldDate!=null&&newDate!=null&&nativeDate!=null,"native and wrapped date formatter methods exist");
        ok(oldDate.getImplementation().getRegisterCount()==nativeDate.getImplementation().getRegisterCount(),"native date formatter register count retained");
        var oldDateCode=VerifySearchHistoryHooks.code(oldDate);var nativeDateCode=VerifySearchHistoryHooks.code(nativeDate);
        ok(oldDateCode.size()==nativeDateCode.size(),"native date formatter instruction count retained");
        for(int i=0;i<oldDateCode.size();i++)ok(VerifySearchHistoryHooks.key(oldDateCode.get(i)).equals(VerifySearchHistoryHooks.key(nativeDateCode.get(i))),"native date formatter instruction retained at "+i);
        var wrapper=VerifySearchHistoryHooks.code(newDate);var calls=new ArrayList<String>();
        for(Instruction ins:wrapper)if(ins instanceof ReferenceInstruction r&&r.getReference() instanceof MethodReference m)calls.add(m.toString());
        ok(calls.equals(List.of("Lapp/morphe/extension/chmate/SiteThreadMetadata;->epoch(J)J",formatterOwner+"->haiagaruNativeSiteDate(J)Ljava/lang/String;")),"date wrapper resolves cached site epoch before native formatting");
        ok(wrapper.stream().anyMatch(i->i.getOpcode().name().equals("MOVE_RESULT_WIDE")),"date wrapper preserves wide timestamp result");
        ok(wrapper.stream().anyMatch(i->i.getOpcode().name().equals("MOVE_RESULT_OBJECT")),"date wrapper preserves native string result");
        System.out.println("PASS "+version+": metadata hook fields/registers and lossless date formatter wrapper");
    }
}
