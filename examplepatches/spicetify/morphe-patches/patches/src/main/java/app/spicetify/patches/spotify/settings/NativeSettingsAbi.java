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
        "Lcom/spotify/music/SpotifyApplication;", "Lp/xlt;", "Lp/ion;", "Lp/yv80;",
        "Lp/tdn;", "Lp/tcn;", "Lp/afr;", "Lp/rp60;", "Lp/rfr0;", "Lp/xh0;",
        "Lp/tyh0;", "Lp/gtl;", "Lp/ftl;", "Lp/dtl;", "Lp/etl;", "Lp/qf60;",
        "Lkotlin/jvm/functions/Function1;", "Lp/gke;", "Lp/k2u;", "Lp/osa0;",
        "Lp/hka1;", "Lp/wgy0;", "Lp/dm70;", "Lp/s8;", "Lp/qte;", "Lp/pmy0;",
        "Lp/cmy0;", "Lp/rk50;", "Lp/nsa0;", "Lp/gv90;", "Lp/abe1;", "Lp/c3g0;"
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
