/*
 * Copyright 2026 Hushfeed contributors
 * https://github.com/SysAdminDoc/hushfeed
 */
package app.morphe.extension.pinedrama.seekbar;

import android.os.Looper;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewParent;
import android.widget.FrameLayout;

import androidx.annotation.Nullable;

import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.Map;
import java.util.WeakHashMap;

import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.Utils;
import app.morphe.extension.shared.diagnostics.HookStatus;
import app.morphe.extension.pinedrama.settings.Settings;

/**
 * Seek bar on sound previews (#185): a line along the bottom of a sound page's cover while the
 * sound's preview plays, with the time played and the preview's length, that a tap or a drag moves
 * through.
 *
 * <p>One hook feeds it: the cover's onViewCreated hands over the view the cover built
 * ({@link #onCoverView}), and the line goes into it, hidden. While it's on screen the line asks the
 * page's preview player a few times a second whether it plays, where it is and how long it is, so
 * it needs nothing from PineDrama's own progress. The player is reached through bridges the patch
 * writes from PineDrama's own uses of it: the cover's view model, that model's player, the player's
 * position, length and seek, and the sound the model last started. Unpatched, as in the tests,
 * they go to {@link #previewForTests}.
 *
 * <p>A seek moves the player and PineDrama's own count of the preview's play time together, so the
 * preview still stops where PineDrama means it to and a pause picks up from the new spot. It only goes
 * ahead while the preview plays, through the cover's own view model, and still plays the sound the
 * line showed when the touch began.
 *
 * <p>The line stays hidden, leaving PineDrama's own controls as they are, while nothing plays, while
 * the player doesn't know the length, and for a sound whose stream didn't move when it was asked
 * to. Off, or with HushPine paused (every switch then answers off), its next tick takes it out.
 */
@SuppressWarnings("unused")
public final class SoundSeekbar {
    static final String FAMILY = "sound seek bar";
    /** Seeking to the very end ends the preview, so a seek stops this far short of it. */
    static final long END_GUARD_MS = 1_000L;

    private static final Map<Object, Cover> COVERS = new WeakHashMap<>();

    private SoundSeekbar() {
    }

    /** What one cover holds: its view, its view model once asked for, and the line. */
    static final class Cover {
        private final WeakReference<Object> assem;
        WeakReference<View> root = new WeakReference<>(null);
        /**
         * Held weakly, like the rest: the line is in the cover's views, and PineDrama's views lead
         * back to the cover that keys {@link #COVERS}.
         */
        WeakReference<SoundSeekbarView> line = new WeakReference<>(null);
        private WeakReference<Object> viewModel = new WeakReference<>(null);

        Cover(Object assem) {
            this.assem = new WeakReference<>(assem);
        }

        /** The cover's preview view model, asked for once and kept while it lives. */
        @Nullable
        Object viewModel() {
            Object model = viewModel.get();
            if (model != null) return model;
            Object owner = assem.get();
            if (owner == null) return null;
            model = coverViewModel(owner);
            if (model != null) viewModel = new WeakReference<>(model);
            return model;
        }
    }

    public static boolean isEnabled() {
        return Settings.SOUND_SEEKBAR.get();
    }

    /** The entry of the sound cover's onViewCreated, with the view the cover built. */
    public static void onCoverView(@Nullable Object assem, @Nullable View root) {
        if (assem == null || root == null) return;
        if (Looper.myLooper() != Looper.getMainLooper()) {
            Utils.runOnMainThread(() -> onCoverView(assem, root));
            return;
        }
        try {
            Cover cover = COVERS.get(assem);
            if (cover != null) {
                if (cover.root.get() == root) return;
                // The cover built its view again: the old view's line goes with it.
                detach(cover);
            }
            if (!isEnabled()) {
                COVERS.remove(assem);
                return;
            }
            if (!(root instanceof FrameLayout)) {
                COVERS.remove(assem);
                HookStatus.missingMember(FAMILY, "view", root.getClass().getName(), "a FrameLayout");
                return;
            }
            if (cover == null) {
                cover = new Cover(assem);
                COVERS.put(assem, cover);
            }
            cover.root = new WeakReference<>(root);
            attach(cover, (FrameLayout) root);
            HookStatus.bound(FAMILY, "sound cover");
        } catch (RuntimeException failure) {
            HookStatus.threw(FAMILY, "sound cover view", failure);
        }
    }

    /**
     * Moves the preview to this many ms in. Refused, and false, unless the switch is on, the model
     * is still the cover's own, the preview plays, and it plays {@code sound}.
     */
    static boolean seek(Cover cover, @Nullable Object model, @Nullable String sound, long ms) {
        if (model == null || sound == null || !isEnabled()) return false;
        if (cover.viewModel() != model) {
            Logger.printDebug(() -> "Sound seek bar: the cover has another view model now");
            return false;
        }
        if (!sound.equals(previewSound(model))) {
            Logger.printDebug(() -> "Sound seek bar: the preview plays another sound now");
            return false;
        }
        if (!previewPlaying(model)) {
            Logger.printDebug(() -> "Sound seek bar: the preview isn't playing");
            return false;
        }
        try {
            return seekPreview(model, (int) Math.max(0L, Math.min(Integer.MAX_VALUE, ms)));
        } catch (RuntimeException failure) {
            HookStatus.threw(FAMILY, "sound seek", failure);
            return false;
        }
    }

    /** Where a seek to {@code ms} lands: inside the preview and short of its end. */
    static long seekTarget(long ms, long totalMs) {
        long last = Math.max(0L, totalMs - END_GUARD_MS);
        return Math.max(0L, Math.min(last, ms));
    }

    /** Takes the line out of the cover, if it has one. */
    static void detach(Cover cover) {
        SoundSeekbarView line = cover.line.get();
        cover.line = new WeakReference<>(null);
        if (line == null) return;
        line.stop();
        ViewParent parent = line.getParent();
        if (parent instanceof ViewGroup) ((ViewGroup) parent).removeView(line);
    }

    /** Forgets every cover; tests start from nothing. */
    static void reset() {
        for (Cover cover : new ArrayList<>(COVERS.values())) detach(cover);
        COVERS.clear();
    }

    @Nullable
    static Cover coverFor(Object assem) {
        return COVERS.get(assem);
    }

    private static void attach(Cover cover, FrameLayout root) {
        SoundSeekbarView line = new SoundSeekbarView(root.getContext(), cover);
        root.addView(line, new FrameLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, line.stripHeight(), Gravity.BOTTOM));
        cover.line = new WeakReference<>(line);
    }

    /*
     * The bridges. The patch rewrites each body to call PineDrama's own members, read off the sound
     * page's code; these bodies are what runs unpatched, in the tests.
     */

    /** The preview player as the tests stand in for it. */
    interface Preview {
        Object viewModel(Object assem);

        boolean playing(Object model);

        int position(Object model);

        int duration(Object model);

        int limit(Object model);

        String sound(Object model);

        void seek(Object model, int ms);
    }

    static volatile Preview previewForTests;

    /** The cover's preview view model. */
    static Object coverViewModel(Object assem) {
        Preview preview = previewForTests;
        return preview == null ? null : preview.viewModel(assem);
    }

    /** Whether the model's player is playing. */
    static boolean previewPlaying(Object model) {
        Preview preview = previewForTests;
        return preview != null && preview.playing(model);
    }

    /** The player's position in ms. Only asked while it plays: asked before, it sets itself up. */
    static int previewPosition(Object model) {
        Preview preview = previewForTests;
        return preview == null ? 0 : preview.position(model);
    }

    /** The length of what the player has loaded in ms, 0 or less while unknown. Only asked while it plays. */
    static int previewDuration(Object model) {
        Preview preview = previewForTests;
        return preview == null ? 0 : preview.duration(model);
    }

    /** Where PineDrama ends the preview, in ms from the sound's start: the sound's audition length. */
    static int previewLimit(Object model) {
        Preview preview = previewForTests;
        return preview == null ? 0 : preview.limit(model);
    }

    /** The id of the sound the model last started, or null before it started one. */
    static String previewSound(Object model) {
        Preview preview = previewForTests;
        return preview == null ? null : preview.sound(model);
    }

    /** Seeks the player and sets PineDrama's play time count to the same spot. */
    static boolean seekPreview(Object model, int ms) {
        Preview preview = previewForTests;
        if (preview == null) return false;
        preview.seek(model, ms);
        return true;
    }
}
