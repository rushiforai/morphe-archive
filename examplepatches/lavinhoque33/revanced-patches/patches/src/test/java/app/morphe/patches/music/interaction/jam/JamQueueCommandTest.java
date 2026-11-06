/*
 * Copyright (C) 2026 lavinhoque33
 *
 * This program is free software: you can redistribute it and/or modify it under the terms of the
 * GNU General Public License as published by the Free Software Foundation, either version 3 of the
 * License, or (at your option) any later version.
 *
 * Written by lavinhoque33, 2026-10-24: JUnit 4 port of Morphe's JamQueueCommandTest.
 */

package app.morphe.patches.music.interaction.jam;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import org.junit.Rule;
import org.junit.Test;
import org.junit.rules.TemporaryFolder;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.lang.reflect.Method;
import java.net.URLClassLoader;
import java.nio.charset.StandardCharsets;

import javax.tools.ToolProvider;

/** Runs the actual Android-free extension decoder against unsupported native wire forms. */
public class JamQueueCommandTest {
    private static final String SOURCE =
            "extensions/shared/src/main/java/app/morphe/extension/music/patches/jam/QueueCommand.java";
    private static final String VIDEO_ID = "abcdefghijk";
    private static final int ENQUEUE_ENDPOINT = 163162354;
    private static final int WATCH_ENDPOINT = 48687757;

    @Rule
    public TemporaryFolder output = new TemporaryFolder();

    private static byte[] varint(int value) {
        ByteArrayOutputStream out = new ByteArrayOutputStream();
        int remaining = value;
        while ((remaining & -128) != 0) {
            out.write((remaining & 127) | 128);
            remaining >>>= 7;
        }
        out.write(remaining);
        return out.toByteArray();
    }

    private static byte[] concat(byte[]... parts) {
        ByteArrayOutputStream out = new ByteArrayOutputStream();
        for (byte[] part : parts) out.write(part, 0, part.length);
        return out.toByteArray();
    }

    private static byte[] field(int number, byte[] bytes) {
        return concat(varint((number << 3) | 2), varint(bytes.length), bytes);
    }

    private static byte[] text(String value) {
        return value.getBytes(StandardCharsets.US_ASCII);
    }

    private static byte[] enqueue(byte[] target) {
        return field(ENQUEUE_ENDPOINT, concat(field(1, target), new byte[]{16, 2}));
    }

    private static File findSource() {
        for (File dir = new File("").getAbsoluteFile(); dir != null; dir = dir.getParentFile()) {
            File source = new File(dir, SOURCE);
            if (source.isFile()) return source;
        }
        throw new AssertionError("QueueCommand.java not found");
    }

    private Class<?> compileDecoder() throws Exception {
        File classes = output.getRoot();
        int result = ToolProvider.getSystemJavaCompiler().run(
                null, null, null, "--release", "11", "-d", classes.getPath(), findSource().getPath()
        );
        assertEquals(0, result);

        URLClassLoader loader = new URLClassLoader(new java.net.URL[]{classes.toURI().toURL()}, null);
        return loader.loadClass("app.morphe.extension.music.patches.jam.QueueCommand");
    }

    private static Object call(Class<?> decoder, String name, byte[] bytes) throws Exception {
        Method method = decoder.getMethod(name, byte[].class);
        return method.invoke(null, (Object) bytes);
    }

    @Test
    public void singleTracksDecodeButPlaylistDownloadedAndMalformedTargetsDoNot() throws Exception {
        Class<?> decoder = compileDecoder();
        byte[] video = field(1, text(VIDEO_ID));
        byte[] playlist = field(2, text("PLplaylist"));

        assertNotNull(call(decoder, "decode", enqueue(video)));
        assertNull(call(decoder, "decode", enqueue(playlist)));
        assertNull(call(decoder, "decode", enqueue(concat(video, playlist))));
        assertNull(call(decoder, "decode", enqueue(concat(video, new byte[]{24, 1}))));
        assertNull(call(decoder, "decode", enqueue(concat(video, video))));
        assertNull(call(decoder, "decode", new byte[]{-1}));

        byte[] playlistWatch = field(WATCH_ENDPOINT, concat(video, playlist));
        assertEquals(VIDEO_ID, call(decoder, "watchVideo", field(WATCH_ENDPOINT, video)));
        assertEquals(VIDEO_ID, call(decoder, "watchVideo", playlistWatch));
        assertNull(call(decoder, "watchVideo", field(WATCH_ENDPOINT, playlist)));
        assertNull(call(decoder, "watchVideo", field(WATCH_ENDPOINT, concat(video, video))));
        assertTrue((Boolean) call(decoder, "isPlayback", playlistWatch));
    }
}
