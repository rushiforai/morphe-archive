/*
 * Original HushPinterest implementation, 2026.
 * Copyright 2026 HushPinterest contributors
 * https://github.com/SysAdminDoc/HushPinterest
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.hushpinterest.extension.pinterest.ui;

import android.content.Context;
import android.graphics.Typeface;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import app.hushpinterest.extension.shared.Utils;

/** Stand-ins for Android's font loading, for CustomFont's tests and the paused-hooks probe. */
public final class CustomFontForTests {
    /** What a file starts with to count as a font here. */
    public static final String FONT = "FONT";

    private CustomFontForTests() { }

    /**
     * Loads a file that starts with {@link #FONT} as a fresh typeface and anything else as nothing,
     * noting each weight asked for.
     */
    public static final class Loader implements CustomFont.Loader {
        public final List<String> asked = new ArrayList<>();
        private final List<Typeface> made = new ArrayList<>();

        @Override
        public Typeface load(File file, int weight, boolean italic) {
            asked.add(weight + (italic ? " italic" : ""));
            byte[] head = new byte[FONT.length()];
            try (InputStream in = new FileInputStream(file)) {
                if (in.read(head) != head.length) return null;
            } catch (IOException unreadable) {
                return null;
            }
            if (!FONT.equals(new String(head, StandardCharsets.US_ASCII))) return null;
            Typeface typeface = Typeface.create(Typeface.SERIF, Typeface.NORMAL);
            made.add(typeface);
            return typeface;
        }

        /** Whether [typeface] is one this loader made. */
        public boolean made(Typeface typeface) {
            for (Typeface one : made) if (one == typeface) return true;
            return false;
        }
    }

    public static Loader install() {
        Loader loader = new Loader();
        CustomFont.loader = loader;
        return loader;
    }

    /** Android's font table and defaults as a plain map and a list, out of reach when told to be. */
    static final class AndroidFonts implements CustomFont.AndroidFonts {
        final Map<String, Typeface> families = new LinkedHashMap<>();
        final List<Typeface> defaults = new ArrayList<>();
        ReflectiveOperationException unreachable;

        @Override
        public Map<String, Typeface> families() throws ReflectiveOperationException {
            if (unreachable != null) throw unreachable;
            return families;
        }

        @Override
        public void defaults(Typeface regular, Typeface bold, Typeface italic, Typeface boldItalic) {
            defaults.addAll(Arrays.asList(regular, bold, italic, boldItalic));
        }
    }

    static AndroidFonts installAndroidFonts() {
        AndroidFonts fonts = new AndroidFonts();
        CustomFont.androidFonts = fonts;
        return fonts;
    }

    /** Writes [text] where the picked font is kept, as if one had been picked. */
    public static File keep(Context context, String text) throws IOException {
        File kept = new File(context.getFilesDir(), CustomFont.KEPT);
        try (OutputStream out = new FileOutputStream(kept)) {
            out.write(text.getBytes(StandardCharsets.US_ASCII));
        }
        return kept;
    }

    /** No font kept, Android's loader and font table back, and nothing made. */
    public static void reset() {
        Context context = Utils.getContext();
        if (context != null) {
            for (String name : new String[] {CustomFont.KEPT, CustomFont.KEPT_NAME, CustomFont.PART}) {
                //noinspection ResultOfMethodCallIgnored
                new File(context.getFilesDir(), name).delete();
            }
        }
        CustomFont.maxBytes = CustomFont.MAX_BYTES;
        CustomFont.forget();
    }

    /** Whether the hook swaps Pin Sans, Pinterest's own text font, for a kept one. */
    public static boolean swaps() {
        try {
            install();
            // Before the context is set there's nowhere to keep a font, and the hook has to pass on anyway.
            Context context = Utils.getContext();
            if (context != null) keep(context, FONT + " for the probe");
            Typeface pinterest = Typeface.create(Typeface.MONOSPACE, Typeface.NORMAL);
            return CustomFont.swap(pinterest, "pin_sans_regular") != pinterest;
        } catch (IOException failure) {
            throw new AssertionError(failure);
        } finally {
            reset();
        }
    }
}
