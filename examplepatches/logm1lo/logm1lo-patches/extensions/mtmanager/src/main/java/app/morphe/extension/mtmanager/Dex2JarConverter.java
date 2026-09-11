package app.morphe.extension.mtmanager;

import com.googlecode.d2j.dex.Dex2jar;
import com.googlecode.d2j.reader.MultiDexFileReader;
import com.googlecode.d2j.reader.BaseDexFileReader;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.nio.file.Files;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

/**
 * Pure-Java reimplementation of MT Manager's "Dex2Jar" tool.
 *
 * Uses dex2jar (femtopedia maintained fork) to translate a DEX file into a
 * directory of .class files, then packs that directory into a jar.
 *
 * NOTE: dex2jar's `Dex2jar#to(Path)` uses java.nio zipfs which is not
 * available on Android, so we translate to a temp directory via
 * `doTranslate(Path)` and zip it ourselves.
 */
final class Dex2JarConverter {

    private Dex2JarConverter() {
    }

    static boolean convert(String dexPath, String jarPath) throws Exception {
        File dexFile = new File(dexPath);
        if (!dexFile.isFile()) throw new IllegalArgumentException("Input is not a file: " + dexPath);

        File outJar = new File(jarPath);
        File parent = outJar.getParentFile();
        if (parent != null && !parent.exists() && !parent.mkdirs()) {
            throw new IllegalStateException("Cannot create output dir: " + parent);
        }

        File tmpOut = MtTools.tempDir("mt-d2j-");
        try {
            BaseDexFileReader reader;
            try (java.io.FileInputStream fis = new java.io.FileInputStream(dexFile)) {
                reader = MultiDexFileReader.open(fis);
            }
            Dex2jar d2j = Dex2jar.from(reader);
            d2j.reUseReg(false).topoLogicalSort(false).skipDebug(false);
            // Translate into a temp directory tree of .class files.
            d2j.doTranslate(tmpOut.toPath());

            zipDirectory(tmpOut, outJar);
            return outJar.isFile() && outJar.length() > 0;
        } finally {
            MtTools.deleteRecursive(tmpOut);
        }
    }

    private static void zipDirectory(File root, File outJar) throws Exception {
        try (ZipOutputStream zos = new ZipOutputStream(new FileOutputStream(outJar))) {
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
