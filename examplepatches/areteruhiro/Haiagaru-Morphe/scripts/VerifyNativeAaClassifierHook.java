import com.android.tools.smali.dexlib2.iface.*;
import java.util.List;

/** Run with VerifyResponseShareOrderHooks and dexlib on the classpath. */
public final class VerifyNativeAaClassifierHook {
    static Method find(ClassDef owner,String name) {
        for(var method:owner.getMethods())if(method.getName().equals(name)
                &&method.getParameterTypes().equals(List.of("Ljava/lang/String;"))
                &&method.getReturnType().equals("Z"))return method;
        throw new AssertionError("Missing "+name);
    }
    public static void main(String[] args)throws Exception {
        String version=args[2];
        String type=switch(version) {
            case "191" -> "Lo/MediationServiceImplExternalSyntheticLambda1;";
            case "226" -> "Lo/BouncyCastleSocketAdapterCompanionfactory1;";
            case "242" -> "Lo/KeJ13;";
            default -> throw new AssertionError("Unsupported version");
        };
        String name=switch(version){case "191" -> "g";case "226" -> "a";default -> "e";};
        var before=find(VerifyResponseShareOrderHooks.owner(args[0],type),name);
        var after=VerifyResponseShareOrderHooks.owner(args[1],type);
        var retained=find(after,"haiagaruNativeAaClassifier");
        var hook=find(after,name);
        if(before.getAccessFlags()!=retained.getAccessFlags()
                ||before.getImplementation().getRegisterCount()!=retained.getImplementation().getRegisterCount()
                ||!VerifyResponseShareOrderHooks.code(before).equals(VerifyResponseShareOrderHooks.code(retained)))
            throw new AssertionError("Native implementation changed");
        var code=VerifyResponseShareOrderHooks.code(hook);
        if(hook.getAccessFlags()!=before.getAccessFlags()||hook.getImplementation().getRegisterCount()!=2
                ||!code.equals(List.of(
                    "IF_EQZ offset=7 reg=1",
                    "INVOKE_STATIC Lapp/morphe/extension/chmate/NativeAaClassifier;->classify(Ljava/lang/String;)Z regs=[1, 1, 0, 0, 0, 0]",
                    "MOVE_RESULT reg=0","RETURN reg=0",
                    "INVOKE_STATIC "+type+"->haiagaruNativeAaClassifier(Ljava/lang/String;)Z regs=[1, 1, 0, 0, 0, 0]",
                    "MOVE_RESULT reg=0","RETURN reg=0")))
            throw new AssertionError("Invalid wrapper: "+code);
        find(VerifyResponseShareOrderHooks.owner(args[1],"Lapp/morphe/extension/chmate/NativeAaClassifier;"),"classify");
        System.out.println("PASS "+version+": native instructions/registers retained; wrapper registers/branches/target and native null fallback verified");
    }
}
