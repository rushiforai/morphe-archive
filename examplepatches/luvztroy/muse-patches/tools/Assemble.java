import com.android.tools.smali.smali.Smali;
import com.android.tools.smali.smali.SmaliOptions;


public final class Assemble {
    public static void main(String[] args) throws Exception {
        SmaliOptions options = new SmaliOptions();
        options.apiLevel = 33;
        options.outputDexFile = args[1];
        if (!Smali.assemble(options, args[0])) throw new IllegalStateException("Smali assembly failed");
    }
}
