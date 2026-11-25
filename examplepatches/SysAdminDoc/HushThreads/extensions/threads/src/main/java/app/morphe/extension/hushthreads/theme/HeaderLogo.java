/*
 * Copyright 2026 HushThreads contributors
 * https://github.com/SysAdminDoc/HushThreads
 */
package app.morphe.extension.hushthreads.theme;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.drawable.Drawable;

import androidx.annotation.Nullable;

import app.morphe.extension.hushthreads.settings.FamilyNames;
import app.morphe.extension.hushthreads.settings.Settings;
import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.Utils;
import app.morphe.extension.shared.diagnostics.HookStatus;
import app.morphe.extension.shared.settings.Setting;

/**
 * The HushThreads logo in place of the Threads logo at the top of the feed (#26).
 *
 * <p>Threads draws that logo, which is also its refresh spinner, in a Compose canvas: a lambda
 * handed the canvas's draw scope each time it draws. The patch asks {@link #draw} first thing in
 * that lambda, and in the one that draws Threads' wordmark where a build shows it instead. While
 * the switch is on, this class draws HushThreads' logo, the one the settings screen shows,
 * centered in the canvas at the largest size that fits, and the lambda returns before Threads
 * draws its own. The logo doesn't spin while the feed refreshes.
 *
 * <p>Off, paused, before the settings are ready, without the bundled logo, or a failure in here,
 * and Threads draws its own logo. Threads draws the logo again only when it changes, so a change of
 * the switch shows after a restart.
 */
public final class HeaderLogo {
    /** Count label for a logo drawn. */
    static final String DRAWN = "drew the HushThreads logo";
    /** Prefix for a refusal's count label; one label per fixed reason from offBecause(). */
    static final String LEFT_TO_THREADS = "left the logo to Threads: ";
    /** The drawable the settings patch writes into res/drawable-nodpi, as the settings header names it. */
    static final String LOGO = "hushthreads_settings_logo";

    /**
     * Where {@link #draw} reads a draw scope's size and canvas: Threads' own, through the two
     * methods the patch writes, unless a test stands in for them.
     */
    interface Surface {
        long size(Object scope);

        Canvas canvas(Object scope);
    }

    /** The patch's two methods. */
    static final Surface PATCHED = new Surface() {
        @Override
        public long size(Object scope) {
            return sizeOf(scope);
        }

        @Override
        public Canvas canvas(Object scope) {
            return canvasOf(scope);
        }
    };

    static volatile Surface surface = PATCHED;
    @Nullable static volatile Drawable logo;
    private static volatile String lastLogged;

    private HeaderLogo() { }

    /**
     * First thing in the lambda that draws Threads' logo, handed its draw scope. True when this
     * drew HushThreads' logo instead, so the lambda returns. Never throws.
     */
    public static boolean draw(Object scope) {
        try {
            HookStatus.invoked(FamilyNames.HEADER_LOGO);
            String off = offBecause();
            Drawable own = off == null ? logo() : null;
            if (off == null && own == null) off = "no logo in this build";
            if (off == null) {
                long size = surface.size(scope);
                float width = Float.intBitsToFloat((int) (size >>> 32));
                float height = Float.intBitsToFloat((int) size);
                // A canvas that hasn't been measured yet has nothing to draw into.
                if (!(width > 0 && height > 0)) {
                    off = "nothing to draw into";
                } else {
                    Canvas canvas = surface.canvas(scope);
                    int side = (int) Math.min(width, height);
                    int left = Math.round((width - side) / 2f);
                    int top = Math.round((height - side) / 2f);
                    own.setBounds(left, top, left + side, top + side);
                    own.draw(canvas);
                }
            }
            HookStatus.counted(FamilyNames.HEADER_LOGO, off == null ? DRAWN : LEFT_TO_THREADS + off);
            log(off);
            return off == null;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.HEADER_LOGO, "header logo", failure);
            return false;
        }
    }

    /** Why the switch doesn't apply now, or null when it's on. Reads no setting before they're ready. */
    @Nullable
    private static String offBecause() {
        if (!Utils.settingsReady()) return "settings not ready";
        if (!Settings.HEADER_LOGO.get()) return Setting.isPaused() ? "HushThreads paused" : "switch off";
        return null;
    }

    /** The bundled logo, loaded once. Null when the build carries none. */
    @Nullable
    private static Drawable logo() {
        Drawable loaded = logo;
        if (loaded != null) return loaded;
        Context context = Utils.getContext();
        if (context == null) return null;
        int id = context.getResources().getIdentifier(LOGO, "drawable", context.getPackageName());
        if (id == 0) return null;
        loaded = context.getResources().getDrawable(id, context.getTheme());
        logo = loaded;
        return loaded;
    }

    private static void log(@Nullable String off) {
        String outcome = off == null ? "drawn" : "left to Threads, " + off;
        if (outcome.equals(lastLogged)) return;
        lastLogged = outcome;
        Logger.printDebug(() -> "Header logo: " + outcome);
    }

    /** Forgets the loaded logo and puts the patch's surface back. Tests only. */
    static void forgetLogo() {
        logo = null;
        lastLogged = null;
        surface = PATCHED;
    }

    /**
     * Written by the patch: the Android canvas under Compose's draw [scope], read the way Threads'
     * own logo lambda reaches it. Until the patch writes it, there is none, and nothing is drawn.
     */
    public static Canvas canvasOf(Object scope) {
        throw new IllegalStateException("the header logo patch didn't write canvasOf");
    }

    /**
     * Written by the patch: the draw [scope]'s size, width in the high 32 bits and height in the
     * low ones, each a float's bits, as Compose packs a Size. Until the patch writes it, zero.
     */
    public static long sizeOf(Object scope) {
        return 0L;
    }
}
