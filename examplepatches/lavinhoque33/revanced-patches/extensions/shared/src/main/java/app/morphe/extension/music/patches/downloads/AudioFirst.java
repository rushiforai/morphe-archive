/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-07.
 * Modified by lavinhoque33, 2026-11-10
 */
package app.morphe.extension.music.patches.downloads;

import android.os.SystemClock;

import androidx.annotation.Nullable;

import com.google.protobuf.MessageLite;

import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.List;
import java.util.StringJoiner;

import app.morphe.extension.music.settings.Settings;
import app.morphe.extension.shared.utils.Logger;
import app.morphe.extension.shared.utils.Utils;

/**
 * Starts a song with a stream copy in audio mode, so the local copy plays. Stock opens a tapped album row in video
 * mode for an account without Premium, which requests the music video and never finds a copy.
 *
 * <p>A tap that resolves a watch command for a song with a stream copy arms a short flag. The app's mode setter then
 * turns the video fallback the app picks into the audio mode once. The two user-triggered modes are never changed, so
 * the Song/Video switch keeps working. The mode is read back for the swap, which leaves the video mode online.
 *
 * <p>A row of an album can carry the id of its music video, resolved from the current mode, while the copy is under
 * the id of the song. Setting the mode later cannot retarget that row, so such a command is rewritten before the
 * player request (see {@link CommandRewrite}); the mode force stays as the second layer.
 *
 * <p>Nothing here touches storage: the stream copies come from the in-memory set the checkmarks keep.
 */
@SuppressWarnings("unused")
public final class AudioFirst {
    private static final Object lock = new Object();

    /** The song of the last eligible tap, until its mode was forced, or it expired. */
    @Nullable
    private static String armedId;
    private static long armedAt;

    /** Counts the mode changes, so a tap can tell whether the mode it found is still the one held. */
    private static long modeEpoch;
    private static long tapsLeftAloneUntil;
    private static final long PILL_NAVIGATION_MILLIS = 3_000;
    private static long armedEpoch;

    /** When the last Android Auto play request came, elapsed realtime, or 0. */
    private static volatile long androidAutoAt;

    /** The display the user or an audio-first start chose is the Song one, see {@link AudioFirstLogic#decide}. */
    private static boolean songPreferred;

    private static final long COMMAND_LOG_INTERVAL_MILLIS = 300;
    private static long lastCommandLogAt;

    /** The last mode the app set, null until it first does. The app starts in the audio mode. */
    @Nullable
    private static volatile String lastMode;

    /** The app's mode holder, by the two methods the patch adds to it. */
    public interface ModeHolder {
        /** The mode the holder has now. */
        Object rvxMode();

        /** The app's own setter, so the subject, the queue and the pill all follow. */
        void rvxSetMode(Object mode);
    }

    /** Every mode holder built, not kept alive by this list. */
    private static final List<WeakReference<ModeHolder>> holders = new ArrayList<>();

    private AudioFirst() {}

    /**
     * Injection point: the app's mode setter (every instance that sets a mode is a mode holder) and, where the holder
     * class has a single constructor, that constructor.
     */
    public static void captureHolder(@Nullable Object holder) {
        try {
            if (!(holder instanceof ModeHolder modeHolder)) return;

            synchronized (lock) {
                for (WeakReference<ModeHolder> reference : holders) {
                    if (reference.get() == modeHolder) return;
                }
                holders.removeIf(reference -> reference.get() == null);
                holders.add(new WeakReference<>(modeHolder));
            }
            Logger.printDebug(() -> "AudioFirst: mode holder captured");
        } catch (Exception ex) {
            Logger.printException(() -> "AudioFirst: mode holder capture failure", ex);
        }
    }

    /** The holder's mode, or null when it is not a mode holder or holds none. */
    @Nullable
    private static Enum<?> modeOf(ModeHolder holder) {
        try {
            return holder.rvxMode() instanceof Enum<?> mode ? mode : null;
        } catch (RuntimeException notAModeHolder) {
            return null;
        }
    }

    private static List<ModeHolder> liveHolders() {
        List<ModeHolder> live = new ArrayList<>();
        synchronized (lock) {
            for (WeakReference<ModeHolder> reference : holders) {
                ModeHolder holder = reference.get();
                if (holder != null) live.add(holder);
            }
        }
        return live;
    }

    /** The mode the app holds, read from its holder; the last mode seen by the setter when none was captured. */
    @Nullable
    static String liveMode() {
        for (ModeHolder holder : liveHolders()) {
            Enum<?> mode = modeOf(holder);
            if (mode != null) return mode.name();
        }
        return currentMode();
    }

    /**
     * Turns the mode the app holds into the audio mode, through the app's own setter, so the queue that the tap builds
     * is in the audio mode and the next rows keep their song ids. On the thread of the app's mode changes when it is
     * not this one, for every holder built (the app may have more than one). The arm stays live: the app may still
     * set its video fallback, which the setter hook turns back.
     *
     * @return What was done, for the log.
     */
    static String startAudioMode() {
        synchronized (lock) {
            songPreferred = true;
        }
        List<ModeHolder> live = liveHolders();
        if (live.isEmpty()) return "no mode holder known yet";

        StringJoiner status = new StringJoiner("; ");
        for (ModeHolder holder : live) {
            Enum<?> mode = modeOf(holder);
            if (mode == null) continue;

            String target = AudioFirstLogic.modeToSet(true, true, mode.name());
            if (target == null) {
                status.add("holder is " + mode.name() + ", left as it is");
                continue;
            }

            Enum<?> audio = constant(mode, target);
            String was = mode.name();
            Utils.runOnMainThreadNowOrLater(() -> {
                try {
                    holder.rvxSetMode(audio);
                    Enum<?> now = modeOf(holder);
                    Logger.printDebug(() -> "AudioFirst: mode ATV_PREFERRED set (direct, was " + was
                            + ", read back " + (now == null ? "?" : now.name()) + ")");
                } catch (Exception ex) {
                    Logger.printException(() -> "AudioFirst: could not set the mode", ex);
                }
            });
            status.add("holder was " + was + ", set requested");
        }
        return status.length() == 0 ? "no holder answered" : status.toString();
    }

    /**
     * The song/video pill's own press, for a queue item the extension tracks: turns the app's mode to the other kind
     * (a user-triggered value, as the pill's own) through its setter, which also makes the tracked items show the
     * renderer of that mode. The command the navigation that follows carries is left as it is, see
     * {@link #leaveTapsAlone}.
     *
     * @return The mode that was set, or null when the app's holder cannot be read or set.
     */
    @Nullable
    static String togglePillMode() {
        for (ModeHolder holder : liveHolders()) {
            Enum<?> mode = modeOf(holder);
            if (mode == null) continue;

            String target = AudioFirstLogic.pillTarget(mode.name());
            holder.rvxSetMode(constant(mode, target));
            Enum<?> now = modeOf(holder);
            return now == null ? target : now.name();
        }
        return null;
    }

    /** Commands the app navigates to for the pill are not taps on a row: they are not armed or rewritten. */
    static void leaveTapsAlone() {
        synchronized (lock) {
            tapsLeftAloneUntil = SystemClock.elapsedRealtime() + PILL_NAVIGATION_MILLIS;
            armedId = null;
        }
    }

    static boolean tapsLeftAlone() {
        synchronized (lock) {
            return SystemClock.elapsedRealtime() < tapsLeftAloneUntil;
        }
    }

    /** Whether a video mode still held now is the one found by the last tap: no mode was set since. */
    private static boolean modeUnchangedSinceTap() {
        synchronized (lock) {
            return modeEpoch == armedEpoch;
        }
    }

    /** Enabled by the patch only after the mode setter and the tap hook resolve. */
    public static boolean supported() {
        return false;
    }

    /** The mode is read only where the setter is hooked, the app starting in the audio mode. */
    static String currentMode() {
        if (!supported()) return null;
        String mode = lastMode;
        return mode != null ? mode : AudioFirstLogic.ATV_PREFERRED;
    }

    /** Injection point of the Android Auto play request: the car's commands are not retargeted at a video copy. */
    public static void onAndroidAutoStart() {
        androidAutoAt = SystemClock.elapsedRealtime();
    }

    /** Injection point where the app cannot rebuild a command: arms the start, never changes the command. */
    public static void onCommand(@Nullable Object command) {
        handle(command, false);
    }

    /**
     * Injection point: every command a tap resolves. Arms the start and, for a row whose command carries the id of
     * the music video while its song has a stream copy, returns the command retargeted at the song, so the first
     * player request is already the one the copy answers. Any other command is returned as it is.
     */
    public static Object overrideCommand(@Nullable Object command) {
        Object rewritten = handle(command, true);
        return rewritten != null ? rewritten : command;
    }

    @Nullable
    private static Object handle(@Nullable Object command, boolean mayRewrite) {
        try {
            if (!supported() || !(command instanceof MessageLite message)) return null;
            if (!Settings.START_DOWNLOADED_IN_AUDIO.get() || !StreamSwap.supported()) return null;
            if (tapsLeftAlone()) return null;

            DownloadedMarkers.warmUp();
            DownloadedRegistry registry = DownloadedMarkers.loadedRegistry();
            // The first tap after a start can come before the copies are known: it is not armed.
            if (registry == null) return null;

            byte[] bytes = message.toByteArray();
            TapCommand tap = TapCommand.parse(bytes);
            // Only a watch command starts a playback. A like, an add to the queue or a menu item that merely names a
            // downloaded song is no tap on a row: it must not arm a start, nor change the mode the user chose.
            if (!tap.isWatch()) return null;

            String mode = liveMode();
            logCommand(tap, registry, bytes, mode);

            AudioFirstLogic.Arm chosen = AudioFirstLogic.chooseArmLazily(true, tap.ids,
                    () -> registry.sourceTracks(registry.findSource(bytes)), tap.index, tap.hasParams,
                    registry::isDownloaded);

            // A music video that was saved as its song names the song: the copy is stored under the song's id.
            AudioFirstLogic.Arm arm = chosen == null ? null
                    : new AudioFirstLogic.Arm(chosen.rule(), registry.canonicalId(chosen.videoId()));

            boolean namesVideoCopy = tap.videoId != null && VideoCopyStore.has(tap.videoId);
            synchronized (lock) {
                armedId = arm == null ? null : arm.videoId();
                armedAt = SystemClock.elapsedRealtime();
                armedEpoch = modeEpoch;
                songPreferred = AudioFirstLogic.songPreferredAfterTap(songPreferred, arm != null, namesVideoCopy);
            }
            if (arm == null) return null;
            Logger.printDebug(() -> "AudioFirst: armed by " + arm.rule() + " v=" + arm.videoId());

            // A tap is a fresh selection: stock resets the mode on every tap, so the user's earlier Video choice does
            // not hold for it. The toggle the user presses afterwards is a setter call of its own, left as it is.
            String direct = startAudioMode();
            Logger.printDebug(() -> "AudioFirst: mode set attempt: " + direct);

            if (!mayRewrite || !(command instanceof NativeDownloads.Command rebuildable)) return null;
            // A row whose music video has a video copy stays that video: the copy answers it in either mode, and the
            // app's own switch flips between Song and Video on the one stream.
            if (AudioFirstLogic.keepsVideoItem(tap.videoId, VideoCopyStore::has)) {
                Logger.printDebug(() -> "AudioFirst: command kept v=" + tap.videoId + " (it has a video copy)");
                return null;
            }
            // The song of a video copy starts as its music video, which the copy answers: the app's own switch then
            // flips Song and Video on the one stream. The car keeps the song ids.
            String video = AudioFirstLogic.startItemFor(tap.videoId, VideoCopyStore.pairsIfLoaded());
            if (video != null && !AudioFirstLogic.duringAndroidAutoStart(SystemClock.elapsedRealtime(),
                    androidAutoAt)) {
                return retargetAtVideoCopy(rebuildable, bytes, tap.videoId, video, AudioFirstLogic.hintsIn(mode));
            }
            if (!AudioFirstLogic.namesTheRow(arm.rule(), arm.videoId(), tap.videoId, registry::hasOwnCopy)) {
                return null;
            }

            boolean hint = AudioFirstLogic.hintsIn(mode);
            CommandRewrite.Result result = CommandRewrite.retarget(bytes, tap.videoId, arm.videoId(), hint);
            if (result == null) {
                Logger.printDebug(() -> "AudioFirst: command not rewritten v=" + tap.videoId + " (unreadable)");
                return null;
            }
            Object rewritten = rebuildable.rvxWithBytes(result.command());
            QueueItems.expectStart(arm.videoId(), tap.videoId);
            Logger.printDebug(() -> "AudioFirst: rewrote command v=" + tap.videoId + " -> " + arm.videoId()
                    + " type=" + result.type() + " hint=" + result.hint());
            return rewritten;
        } catch (Exception ex) {
            Logger.printException(() -> "AudioFirst: command failure", ex);
            return null;
        }
    }

    /** The command retargeted at the music video of the song, or null when it cannot be: it plays as it is then. */
    @Nullable
    private static Object retargetAtVideoCopy(NativeDownloads.Command command, byte[] bytes, String songId,
                                              String videoId, boolean hint) {
        CommandRewrite.Result result = CommandRewrite.retarget(bytes, songId, videoId, hint, CommandRewrite.TYPE_OMV);
        if (result == null) {
            Logger.printDebug(() -> "AudioFirst: command not retargeted v=" + songId + " -> " + videoId
                    + " (unreadable)");
            return null;
        }
        Object rewritten = command.rvxWithBytes(result.command());
        Logger.printDebug(() -> "AudioFirst: start item v=" + songId + " -> " + videoId + " (video copy) type="
                + result.type() + " hint=" + result.hint());
        return rewritten;
    }

    /** What the tap carried, which decides how it ties to a copy; at most once every 300 ms. */
    private static void logCommand(TapCommand tap, DownloadedRegistry registry, byte[] bytes,
                                   @Nullable String mode) {
        long now = SystemClock.elapsedRealtime();
        synchronized (lock) {
            if (now - lastCommandLogAt < COMMAND_LOG_INTERVAL_MILLIS) return;
            lastCommandLogAt = now;
        }
        Logger.printDebug(() -> "AudioFirst: command ids=" + tap.ids + " video=" + tap.videoId
                + " playlist=" + (tap.playlistId.isEmpty() ? "-" : tap.playlistId)
                + " index=" + (tap.index < 0 ? "-" : tap.index) + " params=" + tap.hasParams
                + " source=" + registry.findSource(bytes) + " mode=" + mode + " fields=" + tap.fields());
    }

    /** Injection point: the argument of the app's mode setter. */
    public static Enum<?> overrideMode(Enum<?> mode) {
        try {
            if (mode == null) return null;

            String name = mode.name();
            synchronized (lock) {
                modeEpoch++;
            }
            boolean forced = false;
            String armedFor = null;
            Enum<?> result = mode;
            if (AudioFirstLogic.OMV_PREFERRED.equals(name) && Settings.START_DOWNLOADED_IN_AUDIO.get()) {
                long now = SystemClock.elapsedRealtime();
                synchronized (lock) {
                    String decided = AudioFirstLogic.decide(name, armedId, armedAt, now,
                            AudioFirstLogic.ARM_TTL_MILLIS, songPreferred);
                    forced = !name.equals(decided);
                    if (forced) {
                        armedFor = armedId;
                        armedId = null;
                        result = constant(mode, decided);
                    }
                }
                String id = armedFor;
                if (forced) {
                    Logger.printDebug(() -> "AudioFirst: forced ATV_PREFERRED " + (id != null ? "for v=" + id
                            : "(the Song display holds)"));
                } else {
                    Logger.printDebug(() -> "AudioFirst: expired/not armed");
                }
            }
            lastMode = result.name();
            synchronized (lock) {
                songPreferred = AudioFirstLogic.songPreferredAfterMode(songPreferred, lastMode);
            }
            QueueItems.onMode(lastMode);
            return result;
        } catch (Exception ex) {
            Logger.printException(() -> "AudioFirst: overrideMode failure", ex);
            return mode;
        }
    }

    /** @return True if the player shows the video, or its mode is unknown, so the swap must not answer audio. */
    static boolean declinesForVideo(String videoId) {
        String pending;
        long pendingAt;
        synchronized (lock) {
            pending = armedId;
            pendingAt = armedAt;
        }
        return AudioFirstLogic.declineForVideo(currentMode(), videoId, pending, pendingAt,
                SystemClock.elapsedRealtime(), AudioFirstLogic.ARM_TTL_MILLIS, modeUnchangedSinceTap());
    }

    private static Enum<?> constant(Enum<?> sample, String name) {
        for (Enum<?> candidate : sample.getDeclaringClass().getEnumConstants()) {
            if (candidate.name().equals(name)) return candidate;
        }
        return sample;
    }
}
