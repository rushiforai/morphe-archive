/*
 * Forked from https://github.com/SysAdminDoc/HushGram at 539b646 (GPL-3.0),
 * modified for HushThreads (Threads), 2026.
 *
 * Copyright 2026 HushGram contributors
 * https://github.com/SysAdminDoc/HushGram
 */
package app.morphe.extension.hushthreads.download;

import android.media.MediaMuxer;

import org.robolectric.annotation.Implementation;
import org.robolectric.annotation.Implements;
import org.robolectric.shadows.ShadowMediaMuxer;
import org.robolectric.util.ReflectionHelpers;

import java.io.FileDescriptor;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.UncheckedIOException;
import java.util.Map;

/**
 * Robolectric's muxer, with a release that closes the output file. Robolectric's opens the file when
 * the muxer is made and closes it only on stop, so a join that fails before the stop left it open,
 * and Windows can't delete an open file: the save's cleanup failed there and passed on Linux. A
 * real muxer lets go of the file on release.
 */
@Implements(MediaMuxer.class)
public class ReleasingMuxer extends ShadowMediaMuxer {
    @Implementation
    protected static void nativeRelease(long nativeObject) {
        closeUnstopped(nativeObject);
    }

    /** Closes the file a muxer that was never stopped still holds; a stopped one's is already closed. */
    static void closeUnstopped(long nativeObject) {
        Map<Long, FileOutputStream> streams = ReflectionHelpers.getStaticField(ShadowMediaMuxer.class, "outputStreams");
        Map<FileDescriptor, FileOutputStream> byDescriptor =
                ReflectionHelpers.getStaticField(ShadowMediaMuxer.class, "fdToStream");
        FileOutputStream stream = streams.remove(nativeObject);
        if (stream == null) return;
        try {
            byDescriptor.remove(stream.getFD());
            stream.close();
        } catch (IOException e) {
            throw new UncheckedIOException(e);
        }
    }
}
