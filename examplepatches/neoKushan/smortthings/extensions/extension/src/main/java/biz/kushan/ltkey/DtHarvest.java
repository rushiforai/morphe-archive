package biz.kushan.ltkey;

import android.content.Context;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.lang.reflect.Method;
import java.util.Base64;
import java.util.List;

/**
 * In-app OwnerPSK harvester. Runs entirely inside OneConnect (no root), reusing the app's own
 * {@code CryptoManager} to unwrap the IoTivity storage key, then decrypting + parsing every
 * {@code files/*.datenc} store. Confirmed chain (1.8.52.23):
 *
 * <pre>
 *   key  = Base64.decode( CryptoManager.a( prefs("iotivityKey").getString("iotivityKey") ) )  // 32 bytes
 *   for each files/&lt;uuid&gt;.datenc:  DtStoreCrypto.decrypt(key, bytes) -&gt; DtCredParser.parse
 * </pre>
 *
 * The patch supplies the loaded {@code CryptoManager} singleton (obtained via the app's DI graph
 * at patch-resolved call sites). Everything here is wrapped so a failure never reaches the host.
 */
public final class DtHarvest {

    private static final String PREF_FILE = "iotivityKey";
    private static final String PREF_KEY = "iotivityKey";

    /** Harvest all OwnerPSKs into our store. {@code cryptoManager} = the app's loaded CryptoManager. */
    public static void run(Context ctx, Object cryptoManager) {
        try {
            byte[] key = unwrapStorageKey(ctx, cryptoManager);
            if (key == null || key.length != 32) { DtLog.i("no storage key; skip"); return; }

            File dir = ctx.getFilesDir();
            if (dir == null) return;

            java.util.List<File> stores = new java.util.ArrayList<>();
            scan(dir, 0, stores);

            int stored = 0;
            for (File f : stores) {
                try {
                    byte[] blob = readAll(f);
                    byte[] plain = f.getName().endsWith(".datenc")
                        ? DtStoreCrypto.decrypt(key, blob)   // encrypted SVR DB (holds the OwnerPSK)
                        : blob;                              // plaintext SVR DB (certs only)
                    for (DtCred c : DtCredParser.parse(plain)) {
                        DtStore.putCred(ctx, c.di, c.identity, c.pskHex); stored++;
                    }
                } catch (Throwable perFile) {
                    // wrong key / not a cred store for this file — expected, keep going
                }
            }
            DtLog.i("harvest done; creds stored this pass = " + stored);
        } catch (Throwable t) {
            DtLog.w("harvest failed", t);   // never propagate to the host
        }
    }

    /** Collect the encrypted SVR DB (.datenc) and plaintext oic_svr_db_client.dat, bounded depth. */
    private static void scan(File dir, int depth, java.util.List<File> out) {
        if (depth > 3) return;
        File[] kids = dir.listFiles();
        if (kids == null) return;
        for (File f : kids) {
            if (f == null) continue;
            if (f.isDirectory()) { scan(f, depth + 1, out); continue; }
            String n = f.getName();
            if (n.endsWith(".datenc") || n.equals("oic_svr_db_client.dat")) out.add(f);
        }
    }

    /** key = Base64.decode( cryptoManager.a( prefs(iotivityKey) ) ). Returns null on any issue. */
    private static byte[] unwrapStorageKey(Context ctx, Object cryptoManager) {
        try {
            if (cryptoManager == null) { DtLog.i("no CryptoManager supplied"); return null; }
            String wrapped = ctx.getSharedPreferences(PREF_FILE, Context.MODE_PRIVATE)
                    .getString(PREF_KEY, null);
            if (wrapped == null || !wrapped.startsWith(":v1:")) { DtLog.i("iotivityKey pref absent/old"); return null; }

            // CryptoManager.a(String) = decryptString — stable method name on 1.8.52.23.
            Method decryptString = cryptoManager.getClass().getMethod("a", String.class);
            Object res = decryptString.invoke(cryptoManager, wrapped);
            if (!(res instanceof String)) return null;
            byte[] key = Base64.getDecoder().decode(((String) res).trim());
            return key.length == 32 ? key : null;
        } catch (Throwable t) {
            DtLog.w("unwrapStorageKey failed", t);
            return null;
        }
    }

    private static byte[] readAll(File f) throws Exception {
        long len = f.length();
        if (len <= 0 || len > 4 * 1024 * 1024) throw new IllegalArgumentException("bad file size");
        byte[] buf = new byte[(int) len];
        try (InputStream in = new FileInputStream(f)) {
            int off = 0, n;
            while (off < buf.length && (n = in.read(buf, off, buf.length - off)) > 0) off += n;
            if (off != buf.length) throw new IllegalStateException("short read");
        }
        return buf;
    }
}
