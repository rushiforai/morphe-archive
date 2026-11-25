package org.ungoogled.waze;

import static org.junit.Assert.*;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import org.junit.Test;

public class NativeObserverAssetsTest {
    @Test public void dependenciesStayTogetherAndChangedBytesGetANewDirectory() throws Exception {
        File root=Files.createTempDirectory("waze-assets").toFile();
        try {
            NativeObserverAssets.Source first=name->new ByteArrayInputStream(name.getBytes(java.nio.charset.StandardCharsets.US_ASCII));
            File adapter=NativeObserverAssets.prepare(root,first);
            assertTrue(adapter.isFile());
            assertTrue(new File(adapter.getParentFile(),"libshadowhook.so").isFile());
            assertTrue(new File(adapter.getParentFile(),"libshadowhook_nothing.so").isFile());
            assertEquals(adapter,NativeObserverAssets.prepare(root,first));
            File changed=NativeObserverAssets.prepare(root,name->new ByteArrayInputStream((name+"changed").getBytes(java.nio.charset.StandardCharsets.US_ASCII)));
            assertNotEquals(adapter.getParentFile(),changed.getParentFile());
            assertTrue(adapter.isFile());
            assertTrue(adapter.setWritable(true));
            Files.write(adapter.toPath(),new byte[]{42});
            assertThrows(IOException.class,()->NativeObserverAssets.prepare(root,first));
        } finally { remove(root); }
    }
    @Test public void missingDependencyDoesNotLeavePartiallyPublishedLibraries() throws Exception {
        File root=Files.createTempDirectory("waze-missing-assets").toFile();
        try {
            assertThrows(IOException.class,()->NativeObserverAssets.prepare(root,name->{
                if(name.equals("libshadowhook_nothing.so"))throw new IOException("Missing dependency");
                return new ByteArrayInputStream(new byte[]{1});
            }));
            assertEquals(0,root.list().length);
        } finally { remove(root); }
    }
    private static void remove(File file) {
        if(file.isDirectory())for(File child:file.listFiles())remove(child);
        file.setWritable(true);file.delete();
    }
}
