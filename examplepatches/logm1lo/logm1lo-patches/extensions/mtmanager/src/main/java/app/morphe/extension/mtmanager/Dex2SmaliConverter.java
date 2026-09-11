package app.morphe.extension.mtmanager;

import com.android.tools.smali.baksmali.Baksmali;
import com.android.tools.smali.baksmali.BaksmaliOptions;
import com.android.tools.smali.dexlib2.DexFileFactory;
import com.android.tools.smali.dexlib2.Opcodes;
import com.android.tools.smali.dexlib2.iface.DexFile;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

/**
 * Pure-Java reimplementation of MT Manager's "Dex2Smali" tool.
 *
 * Uses baksmali (from the MorpheApp smali fork, same artifact the patches
 * module compiles against) to disassemble a DEX file into a directory of
 * .smali files, then packs that directory into a zip.
 *
 * Output layout matches baksmali's default: <zip>/smali/.../<Class>.smali
 */
final class Dex2SmaliConverter {

    private Dex2SmaliConverter() {
    }

    static boolean convert(String dexPath, String zipPath) throws Exception {
        File dexFile = new File(dexPath);
        if (!dexFile.isFile()) throw new IllegalArgumentException("Input is not a file: " + dexPath);

        File outZip = new File(zipPath);
        File parent = outZip.getParentFile();
        if (parent != null && !parent.exists() && !parent.mkdirs()) {
            throw new IllegalStateException("Cannot create output dir: " + parent);
        }

        // Load the dex with a permissive API level so newer opcodes don't fail.
        Opcodes opcodes = Opcodes.forApi(35);
        DexFile dex = DexFileFactory.loadDexFile(dexFile, opcodes);

        // Disassemble into a temp dir.
        File tmpOut = MtTools.tempDir("mt-smali-");
        try {
            BaksmaliOptions options = new BaksmaliOptions();
            options.apiLevel = opcodes.api;
            options.debugInfo = true;
            options.parameterRegisters = false;
            options.localsDirective = true;
            options.sequentialLabels = true;
            options.registerInfo = 0;

            boolean ok = Baksmali.disassembleDexFile(dex, tmpOut, 1, options);
            if (!ok) throw new IllegalStateException("baksmali returned false for " + dexPath);

            // Pack the smali tree into a zip.
            zipDirectory(tmpOut, outZip);
            return outZip.isFile() && outZip.length() > 0;
        } finally {
            MtTools.deleteRecursive(tmpOut);
        }
    }

    private static void zipDirectory(File root, File outZip) throws Exception {
        try (ZipOutputStream zos = new ZipOutputStream(new FileOutputStream(outZip))) {
            File[] children = root.listFiles();
            if (children != null) {
                for (File child : children) {
                    addToZip(root, child, zos);
                }
            }
        }
    }

    private static void addToZip(File root, File file, ZipOutputStream zos) throws Exception {
        String rel = root.toURI().relativize(file.toURI()).getPath();
        if (file.isDirectory()) {
            String dirName = rel.endsWith("/") ? rel : rel + "/";
            zos.putNextEntry(new ZipEntry(dirName));
            zos.closeEntry();
            File[] children = file.listFiles();
            if (children != null) {
                for (File child : children) {
                    addToZip(root, child, zos);
                }
            }
        } else {
            zos.putNextEntry(new ZipEntry(rel));
            try (FileInputStream in = new FileInputStream(file)) {
                byte[] buf = new byte[8192];
                int n;
                while ((n = in.read(buf)) > 0) {
                    zos.write(buf, 0, n);
                }
            }
            zos.closeEntry();
        }
    }
}
