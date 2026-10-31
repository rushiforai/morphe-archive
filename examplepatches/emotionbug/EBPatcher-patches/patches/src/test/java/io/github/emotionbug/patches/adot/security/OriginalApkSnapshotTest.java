package io.github.emotionbug.patches.adot.security;

import java.io.*;
import java.nio.file.*;
import java.util.*;
import java.util.zip.*;
import org.junit.*;
import org.junit.rules.TemporaryFolder;
import static org.junit.Assert.*;

public class OriginalApkSnapshotTest {
    @Rule public TemporaryFolder temp=new TemporaryFolder();
    private Path archive(String name,Map<String,byte[]> files) throws IOException {
        Path file=temp.getRoot().toPath().resolve(name);
        try(var zip=new ZipOutputStream(Files.newOutputStream(file))) {
            for(var entry:files.entrySet()) {zip.putNextEntry(new ZipEntry(entry.getKey()));zip.write(entry.getValue());zip.closeEntry();}
        }
        return file;
    }
    @Test public void snapshotIsIsolatedAndApkmHashesExactBaseNotContainer() throws Exception {
        Path base=archive("original.apk",Map.of("AndroidManifest.xml",new byte[]{1},"classes.dex",new byte[]{2}));
        byte[] original=Files.readAllBytes(base);
        Path apkm=archive("original.apkm",Map.of("base.apk",original,"split_config.apk",new byte[]{3}));
        Path work=temp.newFolder().toPath();
        Path first=OriginalApkSnapshot.create(apkm.toString(),work), second=OriginalApkSnapshot.create(base.toString(),work);
        assertNotEquals(first.getParent(),second.getParent());
        assertArrayEquals(original,Files.readAllBytes(first));
        assertEquals(new AppProtectPatch(base).originalSha256,new AppProtectPatch(first).originalSha256);
        assertNotEquals(new AppProtectPatch(apkm).originalSha256,new AppProtectPatch(first).originalSha256);
        Files.write(base,new byte[]{9});
        assertArrayEquals(original,Files.readAllBytes(second));
    }
    @Test public void uriWrongFilesMissingBaseAndTraversalFailClearly() throws Exception {
        Path work=temp.newFolder().toPath();
        var uri=assertThrows(IOException.class,()->OriginalApkSnapshot.create("content://downloads/1",work));
        assertTrue(uri.getMessage().contains("local filesystem path"));
        Path wrong=archive("wrong.apk",Map.of("unrelated",new byte[]{1}));
        assertThrows(IOException.class,()->OriginalApkSnapshot.create(wrong.toString(),work));
        Path split=archive("split.apkm",Map.of("split_config.apk",new byte[]{1}));
        assertThrows(IOException.class,()->OriginalApkSnapshot.create(split.toString(),work));
        Path unsafe=archive("unsafe.apkm",Map.of("../base.apk",new byte[]{1}));
        assertThrows(IOException.class,()->OriginalApkSnapshot.create(unsafe.toString(),work));
        assertFalse(Files.exists(work.resolve("base.apk")));
    }
}
