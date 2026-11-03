import com.android.tools.smali.dexlib2.Opcodes;
import com.android.tools.smali.dexlib2.iface.*;
import com.android.tools.smali.dexlib2.writer.pool.DexPool;
import com.android.tools.smali.dexlib2.writer.io.MemoryDataStore;
import java.util.*;

/** Compare complete class definitions in normalized single-class DEX files.
 * This covers instructions, register operands, branches, payloads, exception
 * handlers, fields, annotations and debug data independently of APK/Dex order.
 */
public final class CompareChmateBindingOutput {
    static byte[] normalized(ClassDef cls)throws Exception{
        var pool=new DexPool(Opcodes.forDexVersion(39));pool.internClass(cls);
        var store=new MemoryDataStore(4096);
        try{pool.writeTo(store);return store.getData();}finally{store.close();}
    }
    public static void main(String[] args)throws Exception{
        var before=VerifyViewingUserAgentHooks.load(args[0]);var after=VerifyViewingUserAgentHooks.load(args[1]);
        if(!before.keySet().equals(after.keySet())){
            var missing=new TreeSet<>(before.keySet());missing.removeAll(after.keySet());
            var extra=new TreeSet<>(after.keySet());extra.removeAll(before.keySet());
            throw new AssertionError("Class sets changed: missing="+missing+" extra="+extra);
        }
        int compared=0;var differences=new ArrayList<String>();
        for(String type:new TreeSet<>(before.keySet())){
            if(!Arrays.equals(normalized(before.get(type)),normalized(after.get(type))))differences.add(type);
            compared++;
        }
        if(!differences.isEmpty())throw new AssertionError("Changed class definitions ("+differences.size()+"): "+differences);
        System.out.println("PASS normalized class equality: "+compared+" complete classes");
    }
}
