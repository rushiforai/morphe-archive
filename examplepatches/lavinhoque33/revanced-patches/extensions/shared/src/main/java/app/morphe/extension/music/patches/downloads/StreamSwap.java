/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Modified by lavinhoque33, 2026-11-12
 * Written by lavinhoque33, 2026-11-07.
 */
package app.morphe.extension.music.patches.downloads;

import android.net.Uri;
import android.os.Looper;
import android.os.SystemClock;

import androidx.annotation.Nullable;

import java.util.Collections;
import java.util.List;
import java.util.Map;
import java.util.WeakHashMap;

import app.morphe.extension.music.patches.CrossfadeTrace;
import app.morphe.extension.shared.innertube.PlayerResponseOuterClass.Format;
import app.morphe.extension.shared.innertube.PlayerResponseOuterClass.PlayerResponse;
import app.morphe.extension.shared.utils.Logger;

/**
 * Replaces the stream only: the audio of a downloaded song, or the video of a music video that has a video copy. The
 * online response still owns radio, queue, lyrics, tracking and related content.
 */
@SuppressWarnings("unused")
public final class StreamSwap {
    /** Implemented on the stock response wrapper by the Downloads patch. */
    public interface Response {
        String rvxVideoId();
        byte[] rvxBytes();
        Object rvxWithBytes(byte[] bytes, boolean localStream);
    }

    /** The response that answered, the online one it replaced and the sources whose files it plays. */
    private record Replacement(Object online, List<StreamSwapSources.Source> sources) {
        Replacement(Object online, StreamSwapSources.Source... sources) {
            this(online, List.of(sources));
        }

        boolean available() {
            for (StreamSwapSources.Source source : sources) {
                if (!source.available) return false;
            }
            return true;
        }
    }
    private static final Map<Object, Replacement> replacements = Collections.synchronizedMap(new WeakHashMap<>());

    /** The player request that was answered online last: its video id and when. */
    record OnlineDecision(String videoId, long at) {}

    private static volatile OnlineDecision lastOnline;

    private StreamSwap() {}

    /** The last online answer, null when none is held or the last request was answered from a copy. */
    @Nullable
    static OnlineDecision lastOnline() {
        return lastOnline;
    }

    static boolean playsLocal(String videoId) {
        return supported() && StreamSwapSources.playsLocal(videoId);
    }

    /** Enabled by the patch only after every required hook resolves. */
    public static boolean supported() {
        return false;
    }

    public static Object swap(Object original) {
        return swap(original, false);
    }

    /**
     * Swaps the audio of a response the offline replay read from the store, not one the server answered. The same
     * decision as {@link #swap}, except that the stored response is no online answer: it is not handed back to the
     * store and a declined swap does not count as an online request. The original itself is returned on a decline.
     */
    static Object swapStored(Object stored) {
        return swap(stored, true);
    }

    private static Object swap(Object original, boolean stored) {
        if (!supported()) return original;
        Replacement cached = replacements.get(original);
        if (cached != null) {
            // A response cache may outlive the setting or downloaded file. This path never accesses storage.
            if (!cached.available()) {
                StreamSwapSources.selectOnline(cached.sources().get(0).videoId);
                return cached.online();
            }
            if (onMainThread()) {
                StreamSwapSources.select(cached.sources());
                return original;
            }
            original = cached.online();
        }
        if (!(original instanceof Response adapter)) return original;

        String videoId = "?";
        try {
            videoId = adapter.rvxVideoId();
            String gate = StreamSwapLogic.gate(onMainThread());
            if (gate != null) return unchanged(original, videoId, gate, stored);
            VideoCopyFiles.Entry video = VideoCopyStore.find(videoId);
            if (video != null) return swapVideo(original, adapter, video, stored);

            RawAudioFiles.Entry raw = RawAudioStore.find(videoId);
            if (raw == null) return unchanged(original, videoId, "no current raw download", stored);
            // A music video the user switched to must stay the online video; audio only would replace it.
            if (AudioFirst.declinesForVideo(videoId)) return unchanged(original, videoId, "video mode", stored);
            byte[] onlineBytes = adapter.rvxBytes();
            PlayerResponse online = PlayerResponse.parseFrom(onlineBytes);
            if (!online.hasStreamingData()) return unchanged(original, videoId, "no StreamingData", stored);
            Format live = VideoCopyLogic.adaptiveOf(online, raw.itag());
            Format selected = live;
            if (selected == null || StreamSwapLogic.mismatch(raw, selected, online) != null) {
                OfflineCopyFiles.Stored saved = OfflineCopyStore.find(videoId);
                PlayerResponse savedResponse = saved == null ? null : PlayerResponse.parseFrom(saved.response());
                selected = StreamSwapLogic.savedAudio(videoId, raw, online, savedResponse);
            }
            if (selected == null) return unchanged(original, videoId, "no matching stored audio descriptor", stored);
            if (!stored) rememberOnlineResponse(videoId,
                    StreamSwapLogic.replaceAudio(online, selected).toByteArray(), raw.itag());

            StreamSwapSources.Source source = StreamSwapSources.issue(
                    videoId, raw, VideoCopyLogic.fallbackUrl(selected, live));
            Format local = selected.toBuilder().setUrl(source.token).clearSignatureCipher().build();
            PlayerResponse replacement = StreamSwapLogic.replaceAudio(online, local);
            Object result = adapter.rvxWithBytes(replacement.toByteArray(), true);
            if (result == null || result == original) {
                return unchanged(original, videoId, "stock adapter declined", stored);
            }
            Replacement accepted = new Replacement(original, source);
            replacements.put(result, accepted);
            StreamSwapSources.select(accepted.sources());
            lastOnline = null;
            String id = videoId;
            Logger.printDebug(() -> "StreamSwap: decision=SWAP v=" + id + " itag=" + raw.itag());
            if (CrossfadeTrace.isTransitionObserved()) {
                CrossfadeTrace.event("SOURCE", null, () -> "videoId=" + id + " source=FILE itag=" + raw.itag()
                        + " kind=audio sabr=false");
            }
            return result;
        } catch (Exception ex) {
            return unchanged(original, videoId, "raw copy or response unavailable", stored);
        }
    }

    /**
     * Answers a music video that has a video copy from its files: the response keeps everything of the online one,
     * but its adaptive formats are exactly the copy's video-only stream and its own audio, each announced by a local
     * token, so the app's own player plays and switches them. Every mode is answered: the Song display plays the
     * audio stream alone, and the app's own switch flips between the two on the same streams. A failure here is a
     * decline: the online response plays.
     */
    private static Object swapVideo(Object original, Response adapter, VideoCopyFiles.Entry copy, boolean stored)
            throws Exception {
        String videoId = copy.videoId();
        String mode = AudioFirst.liveMode();
        byte[] liveBytes = adapter.rvxBytes();
        PlayerResponse online = PlayerResponse.parseFrom(liveBytes);
        if (!online.hasStreamingData()) return unchanged(original, videoId, "no StreamingData", stored);
        if (!VideoCopyLogic.sameLength(online.getVideoDetails().getLengthSeconds(), copy.durationMs())) {
            return unchanged(original, videoId, "video length differs", stored);
        }

        byte[] storedBytes = VideoCopyStore.response(videoId);
        VideoCopyLogic.Stored formats = storedBytes == null ? null : VideoCopyLogic.stored(
                PlayerResponse.parseFrom(storedBytes), copy.video().itag(), copy.audio().itag());
        if (formats == null) return unchanged(original, videoId, "video copy has no stored formats", stored);

        StreamSwapSources.Source video = StreamSwapSources.issueVideo(videoId, copy, VideoCopyLogic.fallbackUrl(
                formats.video(), VideoCopyLogic.adaptiveOf(online, copy.video().itag())));
        StreamSwapSources.Source audio = StreamSwapSources.issueVideoAudio(videoId, copy, VideoCopyLogic.fallbackUrl(
                formats.audio(), VideoCopyLogic.adaptiveOf(online, copy.audio().itag())));
        Format localVideo = VideoCopyLogic.local(formats.video(), video.token, copy.video().length(),
                copy.durationMs());
        Format localAudio = VideoCopyLogic.local(formats.audio(), audio.token, copy.audio().length(),
                copy.durationMs());
        PlayerResponse replacement = StreamSwapLogic.replacePair(online, localVideo, localAudio);
        Object result = adapter.rvxWithBytes(replacement.toByteArray(), true);
        if (result == null || result == original) return unchanged(original, videoId, "stock adapter declined", stored);

        Replacement accepted = new Replacement(original, video, audio);
        replacements.put(result, accepted);
        StreamSwapSources.select(accepted.sources());
        if (CrossfadeTrace.isTransitionObserved()) {
            CrossfadeTrace.event("SOURCE", null, () -> "videoId=" + videoId + " source=FILE"
                    + " kind=video itag=" + copy.video().itag() + " audioItag=" + copy.audio().itag()
                    + " mode=" + mode + " sabr=false");
        }
        Logger.printDebug(() -> "StreamSwap: source=FILE v=" + videoId + " kind=video itag=" + copy.video().itag()
                + " length=" + copy.video().length() + " audioItag=" + copy.audio().itag()
                + " audioLength=" + copy.audio().length());
        // The files go to the app's own player; the display decides whether its video renderer is enabled.
        Logger.printDebug(() -> "StreamSwap: decision=SWAP v=" + videoId + " itag=" + copy.video().itag()
                + "+" + copy.audio().itag() + " kind=video song=" + copy.songId() + " mode=" + mode
                + " surface=" + surfaceOf(mode) + " formats=" + replacement.getStreamingData().getFormatsCount()
                + " onlineUrl=" + (video.online != null) + " stored=" + stored
                + " onlineAdaptive=" + online.getStreamingData().getAdaptiveFormatsCount()
                + " onlineSabr=" + online.getStreamingData().hasServerAbrStreamingUrl());
        if (!stored) {
            VideoCopyStore.keepLive(videoId, liveBytes);
            LiveTemplate.rememberFrom(videoId, liveBytes, online);
        }
        return result;
    }

    /** Whether the player shows the video of the file for the mode it holds: the Song display plays it unseen. */
    private static String surfaceOf(@Nullable String mode) {
        return AudioFirstLogic.isVideoMode(mode) ? "on" : "off";
    }

    /**
     * The copy has been verified against this response: keep the response for offline replay when the copy has none
     * yet. Never changes the swap; the store works in the background and a failure here is only logged.
     */
    private static void rememberOnlineResponse(String videoId, byte[] onlineBytes, int itag) {
        try {
            OfflineCopyStore.storeOnline(videoId, onlineBytes, itag);
        } catch (Exception ex) {
            Logger.printException(() -> "StreamSwap: could not hand the online response to the store v=" + videoId,
                    ex);
        }
    }

    static boolean onMainThread() {
        return Looper.myLooper() == Looper.getMainLooper();
    }

    private static Object unchanged(Object original, String videoId, String reason, boolean stored) {
        if (!"?".equals(videoId)) StreamSwapSources.selectOnline(videoId);
        // "?" is the answer of a thread that cannot know the id; a stored response is no online decision.
        if (!stored && !"?".equals(videoId)) lastOnline = new OnlineDecision(videoId, SystemClock.elapsedRealtime());
        if (CrossfadeTrace.isTransitionObserved()) {
            CrossfadeTrace.event("SOURCE", null, () -> "videoId=" + videoId + " source=ONLINE"
                    + " reason=" + reason + " stored=" + stored);
        }

        Logger.printDebug(() -> "StreamSwap: decision=ONLINE v=" + videoId + " reason=" + reason);
        return original;
    }

    /** Keep the stock guard's exact answer except for tokens issued by this process. No storage work. */
    public static boolean blocksLoopback(Uri uri) {
        if (!StreamSwapLogic.isGuardedHost(uri.getHost())) return false;
        try {
            return StreamSwapSources.find(uri) == null;
        } catch (Exception ex) {
            return true;
        }
    }
}
