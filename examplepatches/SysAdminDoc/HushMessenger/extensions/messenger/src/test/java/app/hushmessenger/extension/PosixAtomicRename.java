package app.hushmessenger.extension;

import android.util.AtomicFile;
import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;
import org.robolectric.annotation.Implementation;
import org.robolectric.annotation.Implements;

/** Keep AtomicFile's algorithm while supplying Android's replacement semantics on Windows. */
@Implements(value = AtomicFile.class, minSdk = 30)
public class PosixAtomicRename {
    @Implementation protected static void rename(File source, File target) {
        try {
            Files.move(source.toPath(), target.toPath(), StandardCopyOption.ATOMIC_MOVE, StandardCopyOption.REPLACE_EXISTING);
        } catch (IOException failure) { android.util.Log.e("AtomicFile", "Failed to rename", failure); }
    }
}
