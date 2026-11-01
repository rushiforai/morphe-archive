/*
 * Copyright 2026 HushThreads contributors
 * https://github.com/SysAdminDoc/HushThreads
 */
package app.morphe.extension.hushthreads.misc;

import static org.junit.Assert.assertEquals;

import android.content.Context;
import android.content.ContextWrapper;
import android.content.pm.ApplicationInfo;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class NativeLibrariesTest {
    /** What Threads passes on a normal start: the direct read and two flags of its own. */
    private static final int THREADS_FLAGS = 0x40A;

    private static Context app(boolean extract, String[] splits) {
        ApplicationInfo info = new ApplicationInfo();
        info.flags = extract ? ApplicationInfo.FLAG_EXTRACT_NATIVE_LIBS : 0;
        info.splitSourceDirs = splits;
        return new ContextWrapper(null) {
            @Override
            public ApplicationInfo getApplicationInfo() {
                return info;
            }
        };
    }

    @Test
    public void mergedBuildWithExtractedLibrariesLosesOnlyTheDirectRead() {
        assertEquals(0xA, NativeLibraries.soLoaderFlags(app(true, null), THREADS_FLAGS));
    }

    @Test
    public void mergedBuildThatStoresItsLibrariesKeepsTheDirectRead() {
        assertEquals(THREADS_FLAGS, NativeLibraries.soLoaderFlags(app(false, null), THREADS_FLAGS));
    }

    @Test
    public void splitInstallKeepsTheDirectRead() {
        String[] splits = {"/data/app/threads/split_config.armeabi_v7a.apk"};
        assertEquals(THREADS_FLAGS, NativeLibraries.soLoaderFlags(app(true, splits), THREADS_FLAGS));
        assertEquals(THREADS_FLAGS, NativeLibraries.soLoaderFlags(app(false, splits), THREADS_FLAGS));
    }

    @Test
    public void flagsWithoutTheDirectReadPassThrough() {
        assertEquals(0xA, NativeLibraries.soLoaderFlags(app(true, null), 0xA));
    }

    @Test
    public void aMissingContextChangesNothing() {
        assertEquals(THREADS_FLAGS, NativeLibraries.soLoaderFlags(null, THREADS_FLAGS));
    }
}
