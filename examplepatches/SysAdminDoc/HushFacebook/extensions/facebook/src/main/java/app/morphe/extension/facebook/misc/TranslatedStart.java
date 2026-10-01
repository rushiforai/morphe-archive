/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.misc;

import android.os.Build;
import android.util.Log;

import androidx.annotation.Nullable;

import java.util.Arrays;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

/**
 * Keeps Facebook's start from crashing on an x86 device that runs its arm64 code through Android's
 * translator, such as an emulator or an x86 Chromebook.
 *
 * <p>One of Facebook's start-up tasks, MprotectCode, changes the protection of code pages from its
 * native code. Under the translator that change comes back without the execute bit on the device's
 * own compiled framework code, and the next call into it dies with SIGSEGV "trying to execute
 * non-executable memory", or hangs the start. Facebook has its own list of start-up tasks to skip,
 * which its cold start experiments fill in; its scheduler logs each one it skips and lets the tasks
 * after it run. The patch hands that list here as Facebook stores it, and on a translated device
 * this adds MprotectCode and its later half. Anywhere else the list goes back as it came.
 *
 * <p>This runs while the application is still being built, before Hushfacebook's settings can be
 * read, so it logs straight to logcat, and Pause and safe mode don't change it.
 */
public final class TranslatedStart {
    /** The start-up tasks skipped on a translated device, by the names Facebook schedules them under. */
    static final List<String> SKIPPED = Collections.unmodifiableList(
            Arrays.asList("MprotectCode", "MprotectCodeLaterInit"));

    private TranslatedStart() {
    }

    /**
     * Facebook's list of start-up tasks to skip, with {@link #SKIPPED} added when this process runs
     * Facebook's arm64 code translated. Never throws: anything unexpected hands the list back.
     */
    public static Set<String> skipAppInits(@Nullable Set<String> skipped) {
        try {
            if (!translated(Build.SUPPORTED_ABIS)) return skipped;
            Set<String> more = skipped == null ? new HashSet<>() : new HashSet<>(skipped);
            more.addAll(SKIPPED);
            Log.i("morphe", "TranslatedStart: arm code on an x86 device, skipping " + SKIPPED);
            return more;
        } catch (Throwable failure) {
            Log.e("morphe", "TranslatedStart: could not read the device's ABI", failure);
            return skipped;
        }
    }

    /**
     * Whether Facebook runs translated on a device whose ABIs are [abis], best first: an x86 device
     * that also lists an arm ABI, which only a translator gives it. The Facebook builds Hushfacebook
     * patches carry arm64 code alone, so on such a device that's the code that runs. An x86 device
     * with no translator can't install them, and any arm device answers false.
     */
    static boolean translated(@Nullable String[] abis) {
        if (abis == null || abis.length == 0 || abis[0] == null || !abis[0].startsWith("x86")) return false;
        for (String abi : abis) {
            if (abi != null && abi.startsWith("arm")) return true;
        }
        return false;
    }
}
