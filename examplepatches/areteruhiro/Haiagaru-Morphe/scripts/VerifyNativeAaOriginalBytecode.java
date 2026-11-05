import com.android.tools.smali.dexlib2.iface.*;
import com.android.tools.smali.dexlib2.iface.instruction.*;
import com.android.tools.smali.dexlib2.iface.reference.*;
import app.morphe.extension.chmate.NativeAaClassifier;
import java.util.*;

// Evaluate only the integer/String operations present in the original AA methods.
// Unsupported opcodes/references fail; no Android/network/database is involved.
public class VerifyNativeAaOriginalBytecode {
    static class Native {
        final Instruction[] code; final Map<Integer,Integer> at=new HashMap<>();
        final int[] positions; final int registers;
        Native(Method method){
            var list=new ArrayList<Instruction>(); method.getImplementation().getInstructions().forEach(list::add);
            code=list.toArray(Instruction[]::new);positions=new int[code.length];
            int offset=0;for(int n=0;n<code.length;n++){positions[n]=offset;at.put(offset,n);offset+=code[n].getCodeUnits();}
            registers=method.getImplementation().getRegisterCount();
        }
        boolean run(String text){
            int[] r=new int[registers];int result=0;
            for(int pc=0;pc<code.length;){
                var i=code[pc];int next=pc+1;
                int a=i instanceof OneRegisterInstruction x?x.getRegisterA():-1;
                int b=i instanceof TwoRegisterInstruction x?x.getRegisterB():-1;
                boolean branch=false;
                switch(i.getOpcode()){
                    case CONST_4,CONST_16 -> r[a]=(int)((WideLiteralInstruction)i).getWideLiteral();
                    case CONST_STRING -> {} // Only the Kotlin parameter name, consumed by its null check.
                    case MOVE -> r[a]=r[b];
                    case MOVE_RESULT -> r[a]=result;
                    case INVOKE_STATIC -> {
                        var ref=(MethodReference)((ReferenceInstruction)i).getReference();
                        if(!ref.getReturnType().equals("V")||!ref.getParameterTypes().equals(List.of("Ljava/lang/Object;","Ljava/lang/String;")))
                            throw new AssertionError("Unexpected static "+ref);
                        Objects.requireNonNull(text);
                    }
                    case INVOKE_VIRTUAL -> {
                        var ref=(MethodReference)((ReferenceInstruction)i).getReference();
                        if(!ref.getDefiningClass().equals("Ljava/lang/String;"))throw new AssertionError(ref);
                        var call=(FiveRegisterInstruction)i;
                        result=switch(ref.getName()){
                            case "length" -> text.length();
                            case "charAt" -> text.charAt(r[call.getRegisterD()]);
                            default -> throw new AssertionError(ref);
                        };
                    }
                    case IF_GE -> branch=r[a]>=r[b];
                    case IF_GT -> branch=r[a]>r[b];
                    case IF_LT -> branch=r[a]<r[b];
                    case IF_LE -> branch=r[a]<=r[b];
                    case IF_EQ -> branch=r[a]==r[b];
                    case IF_NE -> branch=r[a]!=r[b];
                    case GOTO -> branch=true;
                    case ADD_INT_LIT8 -> r[a]=r[b]+((NarrowLiteralInstruction)i).getNarrowLiteral();
                    case MUL_INT_LIT8 -> r[a]=r[b]*((NarrowLiteralInstruction)i).getNarrowLiteral();
                    case MUL_INT_2ADDR -> r[a]*=r[b];
                    case RETURN -> {return r[a]!=0;}
                    default -> throw new AssertionError("Unsupported "+i.getOpcode());
                }
                if(branch)next=at.get(positions[pc]+((OffsetInstruction)i).getCodeOffset());
                pc=next;
            }
            throw new AssertionError("No return");
        }
    }
    static long count;
    static void check(Native nativeCode,String text){
        if(nativeCode.run(text)!=NativeAaClassifier.classify(text))throw new AssertionError("Mismatch "+text.length());
        count++;
    }
    public static void main(String[] args)throws Exception{
        String[] types={"Lo/MediationServiceImplExternalSyntheticLambda1;","Lo/BouncyCastleSocketAdapterCompanionfactory1;","Lo/KeJ13;"};
        String[] names={"g","a","e"};
        for(int v=0;v<3;v++){
            var nativeCode=new Native(VerifyNativeAaClassifierHook.find(VerifyResponseShareOrderHooks.owner(args[v],types[v]),names[v]));
            long begin=count;
            for(int c=0;c<65536;c++)check(nativeCode,String.valueOf((char)c).repeat(4));
            for(int n=0;n<65;n++)for(int m=0;m<=n;m++){
                check(nativeCode," ".repeat(m)+"日".repeat(n-m));
                check(nativeCode,"日".repeat(n-m)+" ".repeat(m));
            }
            Random random=new Random(191);
            for(int n=0;n<500;n++){
                char[] chars=new char[random.nextInt(500)];
                for(int j=0;j<chars.length;j++)chars[j]=(char)random.nextInt(65536);
                check(nativeCode,new String(chars));
            }
            System.out.println("PASS "+new int[]{191,226,242}[v]+": "+(count-begin)+" original-bytecode equivalence cases");
        }
    }
}

