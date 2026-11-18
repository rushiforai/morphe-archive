import java.io.File;
import java.util.ArrayList;
import java.util.List;
import com.android.tools.smali.dexlib2.DexFileFactory;
import com.android.tools.smali.dexlib2.Opcodes;
import com.android.tools.smali.dexlib2.iface.ClassDef;
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef;
import com.android.tools.smali.dexlib2.immutable.ImmutableDexFile;

/** Merge the stock Singular 12.6.1 network callback into Coffee's SDK restorations.
 * Args: existing sdk-receivers.dex, D8-converted Singular 12.6.1 classes.dex, output.
 * Only onReceive is copied; the game's constructor, state and worker stay original.
 */
class AddCoffeeNetworkReceiver {
    public static void main(String[] args) throws Exception {
        var opcodes = Opcodes.getDefault();
        var owner = "Lcom/singular/sdk/internal/BroadcastReceivers$NetworkChange;";
        var classes = new ArrayList<ClassDef>(
                DexFileFactory.loadDexFile(new File(args[0]), opcodes).getClasses());
        if (classes.stream().anyMatch(c -> c.getType().equals(owner)))
            throw new IllegalArgumentException("Receiver already included");
        var source = DexFileFactory.loadDexFile(new File(args[1]), opcodes).getClasses()
                .stream().filter(c -> c.getType().equals(owner)).findFirst().orElseThrow();
        var methods = new ArrayList<com.android.tools.smali.dexlib2.iface.Method>();
        source.getMethods().forEach(m -> { if (m.getName().equals("onReceive")) methods.add(m); });
        if (methods.size() != 1) throw new IllegalArgumentException("Unexpected SDK callback");
        classes.add(new ImmutableClassDef(owner, source.getAccessFlags(), source.getSuperclass(),
                source.getInterfaces(), source.getSourceFile(), source.getAnnotations(), List.of(), methods));
        DexFileFactory.writeDexFile(args[2], new ImmutableDexFile(opcodes, classes));
    }
}
