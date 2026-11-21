/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0 or later.
 * Written by lavinhoque33, 2026-11-20.
 */
package app.morphe.extension.shared.patches;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotEquals;

import android.system.StructStat;
import android.system.StructTimespec;

import org.junit.Rule;
import org.junit.Test;
import org.junit.rules.TemporaryFolder;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.StandardCopyOption;
import java.nio.file.attribute.FileTime;

@RunWith(RobolectricTestRunner.class)
@Config(manifest = Config.NONE, sdk = 34)
public class CustomBrandingSplashSourceTest {
    @Rule public TemporaryFolder temporary = new TemporaryFolder();

    @Test
    public void replacingSourceAtSamePathSizeAndModifiedTimeInvalidatesSplashIdentity() throws IOException {
        Path source = temporary.newFile("branding-fixture.apk").toPath();
        Path replacement = temporary.newFile("replacement.apk").toPath();
        Files.write(source, new byte[]{1});
        Files.write(replacement, new byte[]{2});
        Files.setLastModifiedTime(replacement, Files.getLastModifiedTime(source));
        var modified = Files.getLastModifiedTime(source);

        StructStat before = statWithFixedChangeTime(source);
        String identity = CustomBrandingPatch.splashSourceIdentity(source.toString(), before);
        assertEquals(identity, CustomBrandingPatch.splashSourceIdentity(source.toString(),
                statWithFixedChangeTime(source)));

        Files.move(replacement, source, StandardCopyOption.ATOMIC_MOVE, StandardCopyOption.REPLACE_EXISTING);
        assertEquals(1, Files.size(source));
        assertEquals(modified, Files.getLastModifiedTime(source));
        StructStat after = statWithFixedChangeTime(source);
        assertNotEquals(before.st_ino, after.st_ino);
        assertNotEquals(identity, CustomBrandingPatch.splashSourceIdentity(source.toString(), after));
    }

    private static StructStat statWithFixedChangeTime(Path path) throws IOException {
        var attributes = Files.readAttributes(path, "unix:dev,ino,size,lastModifiedTime");
        var modified = ((FileTime) attributes.get("lastModifiedTime")).toInstant();
        var modifiedTime = new StructTimespec(modified.getEpochSecond(), modified.getNano());
        // Hold change time constant so only the real inode change can invalidate the identity.
        var fixedTime = new StructTimespec(0, 0);
        return new StructStat((long) attributes.get("dev"), (long) attributes.get("ino"), 0, 0, 0, 0, 0,
                (long) attributes.get("size"), fixedTime, modifiedTime, fixedTime, 0, 0);
    }
}
