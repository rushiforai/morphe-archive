package app.spicetify.patches.spotify.settings;

import com.android.tools.smali.dexlib2.Opcodes;
import com.android.tools.smali.dexlib2.iface.ClassDef;
import com.android.tools.smali.dexlib2.writer.io.MemoryDataStore;
import com.android.tools.smali.dexlib2.writer.pool.DexPool;
import java.security.MessageDigest;
import java.util.Arrays;
import java.util.List;

/** Snapshot of the native constructors, renderers, navigation, and DI traced for this build. */
public final class NativeSettingsAbi {
    public static final List<String> TYPES = Arrays.asList(
        "Lp/qb61;", "Lp/y3v;", "Lp/jto;", "Lp/bec0;",
        "Lp/wpo;", "Lp/xoo;", "Lp/cus;", "Lp/nz80;", "Lp/xqu0;", "Lp/ti0;",
        "Lp/oqk0;", "Lp/lzm;", "Lp/kzm;", "Lp/izm;", "Lp/jzm;", "Lp/nm80;",
        "Lkotlin/jvm/functions/Function1;", "Lp/qlj0;", "Lp/llv;", "Lp/j7d0;",
        "Lp/yye1;", "Lp/z521;", "Lp/zx90;", "Lp/n8;", "Lp/nui1;", "Lp/yb21;",
        "Lp/ib21;", "Lp/ov30;", "Lp/i7d0;", "Lp/aqb0;", "Lp/yti1;", "Lp/jri0;"
    );

    public static String digest(ClassDef definition) throws Exception {
        DexPool pool = new DexPool(Opcodes.forApi(35));
        pool.internClass(definition);
        MemoryDataStore output = new MemoryDataStore();
        try {
            pool.writeTo(output);
            StringBuilder hex = new StringBuilder();
            for (byte value : MessageDigest.getInstance("SHA-256").digest(output.getData())) {
                hex.append(Character.forDigit((value & 255) >>> 4, 16));
                hex.append(Character.forDigit(value & 15, 16));
            }
            return hex.toString();
        } finally {
            output.close();
        }
    }

}
