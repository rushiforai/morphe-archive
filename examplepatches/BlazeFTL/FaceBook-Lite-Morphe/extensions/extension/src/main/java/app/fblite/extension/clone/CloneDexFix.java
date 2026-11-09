package app.fblite.extension.clone;

import android.content.Context;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.content.pm.ProviderInfo;

import java.io.File;
import java.io.RandomAccessFile;
import java.nio.channels.FileChannel;
import java.nio.channels.FileLock;
import java.util.HashMap;
import java.util.Map;

import app.fblite.extension.settings.MorpheLog;

/**
 * Clone installs only. Runs at the very start of Application.attachBaseContext, before the app loads its code,
 * and rewrites the hardcoded original names in the dex the app extracted on an earlier start (see DexRewriter).
 * The first start after an install has nothing to rewrite yet; the second start is the first with the fix.
 */
final class CloneDexFix {
    private CloneDexFix() {
    }

    static void apply(Context base) {
        try {
            String self = base.getPackageName();
            if (CloneSupport.ORIGINAL.equals(self)) return;
            File dexDir = new File(base.getApplicationInfo().dataDir, "dex");
            File[] files = dexDir.listFiles();
            if (files == null) return;
                        if (self.length() != CloneSupport.ORIGINAL.length()) {
                MorpheLog.log("clone", "DEXFIX skipped: the clone package name must have " + CloneSupport.ORIGINAL.length()
                        + " characters, it has " + self.length());
                return;
            }
            Map<String, String> authorities = originalAuthorities(base, self);
            File lockFile = new File(dexDir, ".clone.lock");
            try (RandomAccessFile raf = new RandomAccessFile(lockFile, "rw");
                 FileChannel channel = raf.getChannel();
                 FileLock lock = channel.lock()) {
                for (File zip : files) {
                    String name = zip.getName();
                    if (zip.isFile() && name.startsWith("z-") && name.endsWith(".zip")) {
                        handle(dexDir, zip, self, authorities);
                    }
                }
            }
        } catch (Throwable t) {
            MorpheLog.log("clone", "DEXFIX failed", t);
        }
    }

    private static void handle(File dexDir, File zip, String self, Map<String, String> authorities) throws Exception {
        File marker = new File(dexDir, zip.getName() + ".clone");
        String state = self + "|" + zip.length() + "|" + zip.lastModified();
        if (marker.exists() && state.equals(read(marker))) return;

        File tmp = new File(dexDir, zip.getName() + ".tmp");
        long begin = System.currentTimeMillis();
        int[] result = DexRewriter.rewriteZip(zip, tmp, CloneSupport.ORIGINAL, self, authorities);
        int changed = result[0];
        if (changed == 0) {
            tmp.delete();
            write(marker, state);
            MorpheLog.log("clone", "DEXFIX " + zip.getName() + ": nothing changed, " + result[1] + " left as they were to keep the dex valid");
            return;
        }
        // The same check ART makes when the app loads it; never swap in a dex the system would refuse.
        try {
            new dalvik.system.DexFile(tmp).close();
        } catch (Throwable t) {
            tmp.delete();
            write(marker, state);
            MorpheLog.log("clone", "DEXFIX refused: the edited " + zip.getName() + " does not open, the original is kept", t);
            return;
        }
        removeCompiled(dexDir, zip);
        zip.setWritable(true);
        zip.delete();
        if (!tmp.renameTo(zip)) throw new java.io.IOException("could not replace " + zip);
        zip.setReadOnly();
        write(marker, self + "|" + zip.length() + "|" + zip.lastModified());
        MorpheLog.log("clone", "DEXFIX " + zip.getName() + ": " + changed + " strings now name the clone, " + result[1] + " left as they were to keep the dex valid ("
                + (System.currentTimeMillis() - begin) + " ms, " + authorities.size() + " authorities)");
    }

    /**
     * The authorities the app had before the rename, each with the clone's authority. The patch changes the last
     * character of every authority that starts with the original package name, so the names keep their place in
     * the dex's sorted string table; see shift().
     */
    private static Map<String, String> originalAuthorities(Context base, String self) {
        Map<String, String> out = new HashMap<>();
        try {
            PackageInfo info = base.getPackageManager().getPackageInfo(self, PackageManager.GET_PROVIDERS);
            if (info.providers == null) return out;
            for (ProviderInfo provider : info.providers) {
                if (provider.authority == null) continue;
                for (String authority : provider.authority.split(";")) {
                    if (!authority.startsWith(CloneSupport.ORIGINAL + ".")) continue;
                    char last = unshift(authority.charAt(authority.length() - 1));
                    if (last != 0) out.put(authority.substring(0, authority.length() - 1) + last, authority);
                }
            }
        } catch (Throwable t) {
            MorpheLog.log("clone", "DEXFIX could not read the authorities", t);
        }
        return out;
    }

    /** The inverse of the patch's shift of the last character: a to b, z to a, A to B, Z to A, 0 to 1, 9 to 0. */
    private static char unshift(char c) {
        if ((c >= 'b' && c <= 'z') || (c >= 'B' && c <= 'Z') || (c >= '1' && c <= '9')) return (char) (c - 1);
        if (c == 'a') return 'z';
        if (c == 'A') return 'Z';
        if (c == '0') return '9';
        return 0;
    }

    private static void removeCompiled(File dexDir, File zip) {
        String stem = zip.getName().substring(0, zip.getName().length() - ".zip".length());
        File[] abis = new File(dexDir, "oat").listFiles();
        if (abis == null) return;
        for (File abi : abis) {
            File[] compiled = abi.listFiles();
            if (compiled == null) continue;
            for (File f : compiled) {
                if (f.getName().startsWith(stem + ".")) f.delete();
            }
        }
    }

    private static String read(File f) {
        try (java.io.FileInputStream in = new java.io.FileInputStream(f)) {
            byte[] data = new byte[(int) f.length()];
            int n = in.read(data);
            return new String(data, 0, Math.max(n, 0), "UTF-8");
        } catch (Throwable t) {
            return "";
        }
    }

    private static void write(File f, String text) throws java.io.IOException {
        try (java.io.FileOutputStream out = new java.io.FileOutputStream(f)) {
            out.write(text.getBytes("UTF-8"));
        }
    }
}
