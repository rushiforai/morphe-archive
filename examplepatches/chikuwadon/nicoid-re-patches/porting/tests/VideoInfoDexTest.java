import com.android.tools.smali.dexlib2.*;
import com.android.tools.smali.dexlib2.iface.*;
import com.android.tools.smali.dexlib2.iface.instruction.*;
import com.android.tools.smali.dexlib2.iface.reference.*;
import java.io.*;
public class VideoInfoDexTest {
    public static void main(String[] args) throws Exception {
        int panels=0, responses=0, rendering=0;
        MultiDexContainer<? extends DexFile> dex = DexFileFactory.loadDexContainer(new File(args[0]),Opcodes.getDefault());
        for(String entry:dex.getDexEntryNames()) for(ClassDef cls:dex.getEntry(entry).getDexFile().getClasses()) for(Method m:cls.getMethods()) {
            if(m.getImplementation()==null) continue;
            for(Instruction i:m.getImplementation().getInstructions()) {
                if(!(i instanceof ReferenceInstruction)) continue;
                Object ref=((ReferenceInstruction)i).getReference();
                if(!(ref instanceof MethodReference)) continue;
                MethodReference call=(MethodReference)ref;
                if(cls.getType().equals("Lcom/sauzask/nicoid/NicoidVideoInfoFragment;") && m.getName().equals("b") && call.getName().equals("bindStatistics")) panels++;
                if(cls.getType().equals("Le/e/a/d0;") && m.getName().equals("b") && call.getName().equals("captureStatistics")) responses++;
                if(cls.getType().equals("Le/e/a/VideoInfoUi;") && m.getName().equals("bindStatistics") && call.getDefiningClass().equals("Le/e/a/VideoCounts;") && call.getName().equals("render")) rendering++;
            }
        }
        if(panels!=1 || responses!=1 || rendering!=1) throw new AssertionError("Metadata hooks: "+panels+"/"+responses+"/"+rendering);
        System.out.println("Information panels use response counters and shared icons");
    }
}
