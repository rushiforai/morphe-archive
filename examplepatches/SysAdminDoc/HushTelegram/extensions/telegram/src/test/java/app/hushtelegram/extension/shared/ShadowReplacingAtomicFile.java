/*
 * Forked from https://github.com/SysAdminDoc/HushThreads at b141524 (GPL-3.0),
 * modified for HushTelegram (Telegram), 2026.
 *
 * Copyright 2026 HushThreads contributors
 * https://github.com/SysAdminDoc/HushThreads
 */
package app.hushtelegram.extension.shared;

import android.util.AtomicFile;

import org.robolectric.annotation.Implementation;
import org.robolectric.annotation.Implements;
import org.robolectric.annotation.RealObject;
import org.robolectric.util.ReflectionHelpers;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.UncheckedIOException;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;

/**
 * {@link AtomicFile#finishWrite} with its rename done the way the phone does it.
 *
 * <p>Android 11 writes {@code <file>.new} and renames it over the file with
 * {@code File.renameTo}. On the phone that's Linux {@code rename(2)}, which replaces the file. On
 * a Windows JVM it fails whenever the file exists, and the framework only logs that, so under
 * Robolectric on Windows every write after the first was lost without a word: a newer crash
 * report read back as the older one. This moves the new file over the old one, as Linux does, and
 * fails the test if it can't. Applied to every test through {@code robolectric.properties}.
 */
@Implements(AtomicFile.class)
public class ShadowReplacingAtomicFile {
    @RealObject private AtomicFile realObject;

    @Implementation
    protected void finishWrite(FileOutputStream output) {
        if (output == null) return;
        try {
            output.getFD().sync();
            output.close();
            File written = ReflectionHelpers.getField(realObject, "mNewName");
            File base = ReflectionHelpers.getField(realObject, "mBaseName");
            Files.move(written.toPath(), base.toPath(),
                    StandardCopyOption.REPLACE_EXISTING, StandardCopyOption.ATOMIC_MOVE);
        } catch (IOException e) {
            throw new UncheckedIOException("AtomicFile could not replace its file", e);
        }
    }
}
