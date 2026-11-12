/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-07.
 * Modified by lavinhoque33, 2026-11-09.
 */
package app.morphe.extension.music.patches.downloads;

import androidx.annotation.Nullable;

import java.util.List;
import java.util.Map;
import java.util.function.Predicate;
import java.util.function.Supplier;

/**
 * Pure rules of the audio-first start, so they can be tested without Android. The modes are the names of the
 * five-value audio/video mode of the app.
 */
final class AudioFirstLogic {
    static final String ATV_PREFERRED = "ATV_PREFERRED";
    static final String OMV_PREFERRED = "OMV_PREFERRED";
    static final String OMV_PREFERRED_USER_TRIGGERED = "OMV_PREFERRED_USER_TRIGGERED";

    /** How long a tap may wait for the app to set its mode. */
    static final long ARM_TTL_MILLIS = 10_000;

    private AudioFirstLogic() {}

    /** The rule that armed the start, and the song it is armed for. */
    record Arm(String rule, String videoId) {}

    static final String RULE_ID = "id";
    static final String RULE_PLAYLIST_INDEX = "playlist-index";
    static final String RULE_PLAYLIST_SOURCE = "playlist-source";

    /**
     * Ties a tap to a stream copy. The row of an album can carry the id of its music video while the copy is under the
     * id of the song, so the rules are layered, from the most to the least specific:
     * <ol>
     *   <li>{@link #RULE_ID}: any video id of the command has a stream copy;</li>
     *   <li>{@link #RULE_PLAYLIST_INDEX}: the command names a downloaded playlist or album and the track at the tapped
     *   position has a copy (an endpoint with params, such as a play or shuffle button, names no position);</li>
     *   <li>{@link #RULE_PLAYLIST_SOURCE}: the command names a playlist or album every available track of which has
     *   a copy. The start only sets the mode, never the song, so a row that is not downloaded simply plays online in
     *   song mode.</li>
     * </ol>
     *
     * @param enabled      The setting is on and the stream copies are in effect; otherwise nothing is ever armed.
     * @param commandIds   The video ids found in the command.
     * @param sourceTracks The ordered tracks of the downloaded playlist the command names, or null; an unavailable
     *                     track keeps its place as {@link PlaylistPage#UNAVAILABLE}.
     * @param index        The position the command names, or -1.
     * @param hasParams    The command carries params, so it is not a row tap.
     * @return The rule and the song to arm for, or null when no copy is tied to the tap.
     */
    @Nullable
    static Arm chooseArm(boolean enabled, List<String> commandIds, @Nullable List<String> sourceTracks, int index,
                         boolean hasParams, Predicate<String> hasCopy) {
        return chooseArmLazily(enabled, commandIds, () -> sourceTracks, index, hasParams, hasCopy);
    }

    /**
     * As {@link #chooseArm(boolean, List, List, int, boolean, Predicate)}, with the downloaded playlist the command
     * names looked up only when no video id of the command has a copy: finding it scans the whole command for every
     * remembered playlist.
     */
    @Nullable
    static Arm chooseArmLazily(boolean enabled, List<String> commandIds, Supplier<List<String>> sourceTracksOf,
                               int index, boolean hasParams, Predicate<String> hasCopy) {
        if (!enabled) return null;

        for (String id : commandIds) {
            if (hasCopy.test(id)) return new Arm(RULE_ID, id);
        }
        List<String> sourceTracks = sourceTracksOf.get();
        if (sourceTracks == null || sourceTracks.isEmpty()) return null;

        int position = index >= 0 ? index : (hasParams ? -1 : 0);
        if (position >= 0 && position < sourceTracks.size() && PlaylistPage.isAvailable(sourceTracks.get(position))
                && hasCopy.test(sourceTracks.get(position))) {
            return new Arm(RULE_PLAYLIST_INDEX, sourceTracks.get(position));
        }
        List<String> available = PlaylistPage.available(sourceTracks);
        if (available.isEmpty()) return null;

        for (String track : available) {
            if (!hasCopy.test(track)) return null;
        }
        return new Arm(RULE_PLAYLIST_SOURCE, commandIds.isEmpty() ? available.get(0) : commandIds.get(0));
    }

    /**
     * Whether an arm names exactly the song of the tapped row, so the command may be retargeted at it: the rule
     * identified one video id (the header rule cannot), it differs from the id the command carries, and that id has no
     * copy of its own.
     */
    static boolean namesTheRow(String rule, String armedId, @Nullable String commandVideoId,
                               Predicate<String> hasCopy) {
        if (!RULE_ID.equals(rule) && !RULE_PLAYLIST_INDEX.equals(rule)) return false;
        return commandVideoId != null && !commandVideoId.equals(armedId) && !hasCopy.test(commandVideoId);
    }

    /**
     * @param enabled     The setting and the stream copies are on.
     * @param armed       A tap just armed the start for a song with a copy.
     * @param currentMode The mode the app holds now, or null when unknown.
     * @return The mode to set now, or null for none. A tap is a fresh selection (stock resets the mode itself on
     * every tap), so both video modes become the audio mode, the user's Video included; the audio modes and the
     * data-saving override stay. A later toggle by the user is a setter call of its own and is never changed.
     */
    @Nullable
    static String modeToSet(boolean enabled, boolean armed, @Nullable String currentMode) {
        return enabled && armed && isVideoMode(currentMode) ? ATV_PREFERRED : null;
    }

    /** The command asks for the audio mode unless the data-saving override is held, which is audio already. */
    static boolean hintsIn(@Nullable String currentMode) {
        return !"DONT_PLAY_VIDEO_OVERRIDE".equals(currentMode);
    }

    static boolean isLive(@Nullable String armedId, long armedAt, long now, long ttl) {
        return armedId != null && now >= armedAt && now - armedAt <= ttl;
    }

    /**
     * @param songPreferred The display the user or an audio-first start chose is the Song one, see
     *                      {@link #songPreferredAfterMode} and {@link #songPreferredAfterTap}.
     * @return The mode the app should be set to: the audio mode in place of the video fallback the app chose for an
     * armed tap, or, while the Song display holds, for the next item of the queue (the app resets its mode on every
     * item that is a music video, and a song with a video copy is one). Every other mode as it is. The user-triggered
     * modes are never changed.
     */
    static String decide(String stateName, @Nullable String armedId, long armedAt, long now, long ttl,
                         boolean songPreferred) {
        if (!OMV_PREFERRED.equals(stateName)) return stateName;
        return songPreferred || isLive(armedId, armedAt, now, ttl) ? ATV_PREFERRED : stateName;
    }

    /**
     * Whether the Song display holds after the app set a mode: the user's Song press makes it hold, the user's Video
     * press ends it, every other mode (the app's own resets, the data-saving override) leaves it as it was.
     */
    static boolean songPreferredAfterMode(boolean current, @Nullable String modeSet) {
        if ("ATV_PREFERRED_USER_TRIGGERED".equals(modeSet)) return true;
        if (OMV_PREFERRED_USER_TRIGGERED.equals(modeSet)) return false;
        return current;
    }

    /**
     * Whether the Song display holds after a watch command: a tap tied to a stream copy starts the Song display; a
     * command for the video copy of a song (the queue moving on to its next item) leaves it as it was; any other
     * (a song or video the user chose that has no copy) is a fresh selection that ends it, as stock's own reset.
     */
    static boolean songPreferredAfterTap(boolean current, boolean armed, boolean namesVideoCopy) {
        if (armed) return true;
        return namesVideoCopy && current;
    }

    /** How long after an Android Auto play request a phone command is left to the app: the car keeps its ids. */
    static final long ANDROID_AUTO_WINDOW_MILLIS = 3_000;

    /**
     * The music video a tapped song starts as, or null: the id the command carries is the song of a committed video
     * copy, which plays the same song as the video the app lists in the queue, from the file, in either display. A
     * music video id, or a song without a video copy, starts as it is.
     *
     * @param videoToSong The committed video copies, music video id to song id.
     */
    @Nullable
    static String startItemFor(@Nullable String commandVideoId, Map<String, String> videoToSong) {
        return commandVideoId == null ? null : OfflineReplayLogic.videoOf(commandVideoId, videoToSong);
    }

    /** Whether a tap came while an Android Auto play request was being resolved: the car stays on the song ids. */
    static boolean duringAndroidAutoStart(long now, long androidAutoAt) {
        return androidAutoAt > 0 && now >= androidAutoAt && now - androidAutoAt <= ANDROID_AUTO_WINDOW_MILLIS;
    }

    /**
     * Whether the item of a tapped row stays the music video the server listed: the id of the row is itself a video
     * copy, which the video stream answers in every mode, so nothing is retargeted at the song.
     */
    static boolean keepsVideoItem(@Nullable String commandVideoId, Predicate<String> hasVideoCopy) {
        return commandVideoId != null && hasVideoCopy.test(commandVideoId);
    }

    static boolean isVideoMode(@Nullable String stateName) {
        return OMV_PREFERRED.equals(stateName) || OMV_PREFERRED_USER_TRIGGERED.equals(stateName);
    }

    /**
     * Whether the swap must leave the response online because the player shows the video.
     *
     * @param stateName The last mode the app set, or null if it is not known on this version.
     * @param pendingId The song a tap armed, which the app is about to switch to the audio mode.
     * @param modeUnchangedSinceTap No mode was set since that tap: the video mode still held is the one the tap found
     *                              (a user's explicit Video, reset by the tap as a fresh selection), not a new choice.
     * @return True for the video mode, or an unknown mode, unless the song is the one a tap just armed and the mode
     * still is the video one the tap found (the fallback, or the user's choice a tap resets).
     */
    static boolean declineForVideo(@Nullable String stateName, String videoId, @Nullable String pendingId,
                                   long pendingAt, long now, long ttl, boolean modeUnchangedSinceTap) {
        if (stateName == null) return true;
        if (!isVideoMode(stateName)) return false;

        boolean armed = videoId.equals(pendingId) && isLive(pendingId, pendingAt, now, ttl);
        if (armed && OMV_PREFERRED.equals(stateName)) return false;
        return !(armed && OMV_PREFERRED_USER_TRIGGERED.equals(stateName) && modeUnchangedSinceTap);
    }

    /** The modes stock treats as audio: the audio fallback, the user's Song and the data-saving override. */
    static boolean isAudioMode(@Nullable String stateName) {
        return ATV_PREFERRED.equals(stateName) || "ATV_PREFERRED_USER_TRIGGERED".equals(stateName)
                || "DONT_PLAY_VIDEO_OVERRIDE".equals(stateName);
    }

    /**
     * Whether a queue item shows its song (the local copy's id) rather than the music video the server listed.
     *
     * @param hasSong The item's album position names a song with a stream copy.
     */
    static boolean showsSong(boolean enabled, @Nullable String mode, boolean hasSong) {
        return enabled && hasSong && isAudioMode(mode);
    }

    /**
     * Whether the queue items are tracked and shown as their songs: the setting is on and the stream copies are in
     * effect. Otherwise no new item is tracked, a mode change swaps nothing and the items tracked until now are given
     * back as the app built them.
     */
    static boolean tracksItems(boolean audioStartSetting, boolean streamCopies) {
        return audioStartSetting && streamCopies;
    }

    static final long CORRECTIVE_ONLINE_MILLIS = 3_000;
    static final long CORRECTIVE_REPEAT_MILLIS = 10_000;
    static final String RADIO_PREFIX = "RDAMPL";
    static final String VIDEO_RADIO_PREFIX = "RDAMVM";

    /**
     * What a queue that was just built tells about the song it starts at and the player request made for it.
     *
     * @param trackedCurrent The queue's current item is tracked, so it has a song with a stream copy.
     * @param enabled        The setting and the stream copies are on.
     * @param mode           The mode the app holds, or null when unknown.
     * @param onlineVideoId  The id of the player request answered online last, or null.
     * @param onlineAgeMillis How long ago that was.
     * @param videoId        The music video id of the current item.
     * @param playlistId     The playlist the current item belongs to.
     * @param playlistIndex  The position of the item in that playlist, -1 when unknown.
     * @param position       The position of the item in the queue.
     * @param queueHandled   This very queue was looked at already.
     * @param tapStart       The queue is the one a tap on a row just asked for (its own path starts it).
     * @param leftAlone      The navigation of a user's pill press is still running.
     * @param sincePillMillis How long ago the user pressed the pill, or Long.MAX_VALUE.
     * @param sinceCorrectedMillis How long ago the last corrective start was made, or Long.MAX_VALUE.
     * @param correctedVideoId The video id of that start, or null.
     */
    record QueueStart(boolean trackedCurrent, boolean enabled, @Nullable String mode,
                      @Nullable String onlineVideoId, long onlineAgeMillis, @Nullable String videoId,
                      @Nullable String playlistId, int playlistIndex, int position, boolean queueHandled,
                      boolean tapStart, boolean leftAlone, long sincePillMillis, long sinceCorrectedMillis,
                      @Nullable String correctedVideoId) {}

    static final String DECLINE_NOT_TRACKED = "not-tracked";
    static final String DECLINE_DISABLED = "disabled";
    static final String DECLINE_TAP = "tap-start";
    static final String DECLINE_NO_ONLINE = "no-online";
    static final String DECLINE_PILL = "pill-press";

    /**
     * A queue of downloaded songs starts on the music video of its first song when the app answered the player
     * request of its play command online (the header's play button gives the video's id). The same song's copy plays
     * when the queue is started again on the item's own watch endpoint, as the pill does.
     *
     * @return Null when the queue is to be restarted, else why not. The first four reasons are the common case of a
     * queue that is not of this kind (nothing to say), see {@link #isQuietDecline}.
     */
    @Nullable
    static String correctiveDecline(QueueStart queue) {
        if (!queue.trackedCurrent) return DECLINE_NOT_TRACKED;
        if (!queue.enabled) return DECLINE_DISABLED;
        if (queue.tapStart) return DECLINE_TAP;
        if (queue.onlineVideoId == null || !queue.onlineVideoId.equals(queue.videoId)) return DECLINE_NO_ONLINE;

        if (queue.onlineAgeMillis < 0 || queue.onlineAgeMillis > CORRECTIVE_ONLINE_MILLIS) return "online-too-old";
        if (queue.queueHandled) return "queue-handled";
        if (queue.mode == null) return "mode-unknown";
        if (OMV_PREFERRED_USER_TRIGGERED.equals(queue.mode)) return "user-video";
        if ("DONT_PLAY_VIDEO_OVERRIDE".equals(queue.mode)) return "data-saving";
        if (queue.leftAlone) return "navigation-running";
        if (queue.sincePillMillis < CORRECTIVE_REPEAT_MILLIS) return DECLINE_PILL;
        if (queue.playlistId != null && (queue.playlistId.startsWith(RADIO_PREFIX)
                || queue.playlistId.startsWith(VIDEO_RADIO_PREFIX))) {
            return "radio";
        }
        // A play command starts at the first track; a queue that starts elsewhere in its playlist is shuffled.
        if (queue.playlistIndex >= 0 && queue.playlistIndex != queue.position) return "shuffled";
        if (queue.videoId.equals(queue.correctedVideoId) && queue.sinceCorrectedMillis < CORRECTIVE_REPEAT_MILLIS) {
            return "repeated";
        }
        return null;
    }

    /** Whether the decline is the common case of a queue that is not of this kind, which is not logged. */
    static boolean isQuietDecline(@Nullable String reason) {
        return DECLINE_NOT_TRACKED.equals(reason) || DECLINE_DISABLED.equals(reason) || DECLINE_TAP.equals(reason)
                || DECLINE_NO_ONLINE.equals(reason);
    }

    /** The user-triggered mode the pill sets from {@code mode}: the video from an audio mode, else the audio. */
    static String pillTarget(@Nullable String mode) {
        return isAudioMode(mode) ? "OMV_PREFERRED_USER_TRIGGERED" : "ATV_PREFERRED_USER_TRIGGERED";
    }

    /**
     * Where a queue the app has just built starts. The app starts at the item its server response marks as selected,
     * and the response to a song's id marks none, so the queue would start at its first item whichever row was tapped.
     *
     * @param index The position the app chose, -1 or more.
     * @param itemIds For every item of the new queue, the ids it is known by (empty when it is not tracked).
     * @param wanted The ids of the row the user chose.
     * @return The position of the first item known by one of the wanted ids, else {@code index}.
     */
    static int queueStart(int index, List<List<String>> itemIds, List<String> wanted) {
        for (int position = 0; position < itemIds.size(); position++) {
            for (String id : itemIds.get(position)) {
                if (wanted.contains(id)) return position;
            }
        }
        return index;
    }

    /** Whether any item of the new queue is known by one of the wanted ids: the queue is the one the row asked for. */
    static boolean listsRow(List<List<String>> itemIds, List<String> wanted) {
        for (List<String> ids : itemIds) {
            for (String id : ids) {
                if (wanted.contains(id)) return true;
            }
        }
        return false;
    }

    static final String RENDERS_SONG = "song";
    static final String RENDERS_VIDEO = "video";
    static final String RENDERS_OTHER = "other";

    /**
     * What a renderer the app gives a tracked item names: its downloaded song, its music video or something else (a
     * row that is no longer the one the item was tracked for).
     */
    static String renderedAs(@Nullable String renderedId, String songId, String videoId) {
        if (songId.equals(renderedId)) return RENDERS_SONG;
        return videoId.equals(renderedId) ? RENDERS_VIDEO : RENDERS_OTHER;
    }

    static final String VIA_QUEUE_CURRENT = "queue-current";
    static final String VIA_PLAYED_ID = "played-id";
    static final String VIA_NONE = "none";

    /**
     * Where the pill found the item it takes over: the queue's current item first, the song being played when the
     * queue has no current item the extension tracks (the queue is being rebuilt).
     */
    static String lookupSource(boolean currentTracked, boolean playedTracked) {
        if (currentTracked) return VIA_QUEUE_CURRENT;
        return playedTracked ? VIA_PLAYED_ID : VIA_NONE;
    }
}
