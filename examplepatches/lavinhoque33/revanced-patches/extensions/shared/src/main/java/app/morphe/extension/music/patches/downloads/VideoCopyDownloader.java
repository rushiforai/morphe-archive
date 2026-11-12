/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-09.
 * Modified by lavinhoque33, 2026-11-10
 */
package app.morphe.extension.music.patches.downloads;

import static app.morphe.extension.shared.utils.StringRef.str;

import org.json.JSONObject;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import app.morphe.extension.music.patches.misc.requests.MusicBrowseRequest;
import app.morphe.extension.music.patches.spoof.SpoofVideoStreamsPatch;
import app.morphe.extension.music.settings.Settings;
import app.morphe.extension.shared.innertube.PlayerResponseOuterClass.Format;
import app.morphe.extension.shared.innertube.PlayerResponseOuterClass.PlayerResponse;
import app.morphe.extension.shared.spoof.ClientType;
import app.morphe.extension.shared.spoof.requests.StreamOrDetailsDataRequest;
import app.morphe.extension.shared.utils.Logger;
import app.morphe.extension.shared.utils.Utils;

/**
 * Saves the video copies of a downloaded playlist or album: for every song that has a music video, the adaptive pair
 * of that video, its 360p video-only stream and its own selected-quality audio, which the app's own player flips
 * between. Runs after the audio copies of the list. The music video of each song is found from the queue
 * the server lists for the list ({@link VideoPairingLogic}); each video is then downloaded on its own, one at a time,
 * with the downloader's own ranged, retried download. A video that cannot be saved is only counted: it never fails
 * the song or the list. Videos are saved only here, never later in the background.
 */
final class VideoCopyDownloader {
    /** What a list ended with: videos already saved, saved now, and tried but failed. */
    record Outcome(int present, int saved, int failed) {
        static final Outcome NONE = new Outcome(0, 0, 0);

        /** The videos the list has now. */
        int videos() {
            return present + saved;
        }
    }

    /** More pages than any list needs; a queue that never ends is a radio, not the list. */
    private static final int MAX_QUEUE_PAGES = 12;

    private VideoCopyDownloader() {}

    /** The device has no room for the copy; no other client could change that. */
    private static final class NoRoomException extends IOException {
        NoRoomException(String message) {
            super(message);
        }
    }

    /**
     * Brings the videos of a list to the state its audio copies ask for. Never throws.
     *
     * @param songIds The downloaded (available) tracks of the list, in order.
     */
    static Outcome ensure(String sourceId, String title, List<String> songIds, DownloadQuality quality) {
        try {
            Utils.verifyOffMainThread();
            if (!StreamSwap.supported() || songIds.isEmpty()) return Outcome.NONE;

            VideoPairingLogic.Result pairing = VideoPairingLogic.pair(songsOf(songIds),
                    queueOf(sourceId, songIds.get(0), songIds.size()));
            if (pairing.skipReason() != null) {
                Logger.printWarn(() -> "VideoCopy: video pairing skipped: " + pairing.skipReason() + " list="
                        + sourceId);
                return Outcome.NONE;
            }
            if (!pairing.hasOtherIds()) {
                Logger.printInfo(() -> "VideoCopy: video pairing: list " + sourceId + " no counterparts in /next");
                return Outcome.NONE;
            }
            logDecisions(sourceId, pairing);
            return download(sourceId, title, pairing.pairs(), quality);
        } catch (Exception ex) {
            Logger.printException(() -> "VideoCopy: video pairing failed, list=" + sourceId, ex);
            return Outcome.NONE;
        }
    }

    private static List<VideoPairingLogic.Song> songsOf(List<String> songIds) {
        List<VideoPairingLogic.Song> songs = new ArrayList<>(songIds.size());
        for (String id : songIds) {
            OfflineCopyMetadata metadata = OfflineCopyStore.metadataOf(id);
            songs.add(metadata == null ? new VideoPairingLogic.Song(id, 0, "", "")
                    : new VideoPairingLogic.Song(id, metadata.durationMs() / 1000, metadata.title(),
                    metadata.artist()));
        }
        return songs;
    }

    /** The count of a list and its per-item table: index, song, video, both lengths, and how it was accepted. */
    private static void logDecisions(String sourceId, VideoPairingLogic.Result pairing) {
        for (VideoPairingLogic.Decision decision : pairing.decisions()) {
            Logger.printInfo(() -> "VideoCopy: video pairing: item " + decision.index() + " song="
                    + decision.songId() + " video=" + decision.videoId() + " songSeconds=" + decision.songSeconds()
                    + " videoSeconds=" + decision.videoSeconds() + " by=" + decision.by());
            if (decision.differs() && !decision.paired()) {
                Logger.printWarn(() -> "VideoCopy: video pairing: item " + decision.index() + " "
                        + decision.videoId() + " not paired (" + decision.reason() + ")");
            }
        }
        Logger.printWarn(() -> "VideoCopy: video pairing: paired " + pairing.pairs().size() + " of "
                + pairing.decisions().size() + " tracks with a video list=" + sourceId);
    }

    /** The items of the list's queue, as many as {@code expected} when the server pages it. */
    private static List<WatchQueueLogic.NextItem> queueOf(String sourceId, String firstSongId, int expected)
            throws Exception {
        List<WatchQueueLogic.NextItem> items = new ArrayList<>();
        Set<String> continuations = new HashSet<>();
        JSONObject request = new JSONObject().put("videoId", firstSongId).put("playlistId", sourceId);
        for (int page = 0; page < MAX_QUEUE_PAGES; page++) {
            WatchQueueLogic.NextPage read = WatchQueueLogic.readNext(
                    MusicBrowseRequest.nextWith(Utils.getContext(), request), items.size());
            items.addAll(read.items());
            if (items.size() >= expected || read.continuation().isEmpty()
                    || !continuations.add(read.continuation())) break;

            request = new JSONObject().put("continuation", read.continuation());
        }
        return items;
    }

    private static Outcome download(String sourceId, String title, List<VideoPairingLogic.Pair> pairs,
                                    DownloadQuality quality) {
        Set<String> audioCopies = RawAudioStore.copyIds();
        int present = 0;
        int saved = 0;
        int failed = 0;
        for (int index = 0; index < pairs.size(); index++) {
            VideoPairingLogic.Pair pair = pairs.get(index);
            if (!audioCopies.contains(pair.songId())) continue;

            VideoCopyFiles.Entry existing = VideoCopyStore.find(pair.videoId());
            if (existing != null && existing.songId().equals(pair.songId())) {
                present++;
                continue;
            }

            if (LocalDownloadManager.canPostProgress()) {
                LocalDownloadManager.showDownloadNotification("playlist:" + sourceId, title,
                        index * 100 / pairs.size(), true,
                        str("morphe_music_playlist_video_progress", index + 1, pairs.size()));
            }
            if (saveOne(pair, sourceId, title, quality)) saved++;
            else failed++;
        }
        Outcome outcome = new Outcome(present, saved, failed);
        Logger.printWarn(() -> "VideoCopy: list=" + sourceId + " videos present=" + outcome.present() + " saved="
                + outcome.saved() + " failed=" + outcome.failed());
        return outcome;
    }

    private record Candidate(PlayerResponse response, VideoCopyLogic.Selection selection, ClientType client) {}

    private static boolean saveOne(VideoPairingLogic.Pair pair, String sourceId, String title, DownloadQuality quality) {
        DownloadCandidates<Candidate> candidates = videoCandidates(pair.videoId(), quality);
        while (true) {
            Candidate candidate = candidates.next();
            if (candidate == null) break;
            try {
                if (save(pair, sourceId, title, candidate)) return true;
            } catch (NoRoomException ex) {
                Logger.printWarn(() -> "VideoCopy: v=" + pair.videoId() + " not saved: " + ex.getMessage());
                return false;
            } catch (Exception ex) {
                Logger.printWarn(() -> "VideoCopy: v=" + pair.videoId() + " client=" + candidate.client()
                        + " failed: " + ex);
            }
        }
        Logger.printWarn(() -> "VideoCopy: v=" + pair.videoId() + " song=" + pair.songId() + " not saved");
        return false;
    }

    private static DownloadCandidates<Candidate> videoCandidates(String videoId, DownloadQuality quality) {
        Iterator<ClientType> clients = clients().iterator();
        return new DownloadCandidates<>(new Iterator<>() {
            @Override
            public boolean hasNext() {
                return clients.hasNext();
            }

            @Override
            public List<Candidate> next() {
                ClientType client = clients.next();
                try {
                    return resolve(videoId, client, quality);
                } catch (Exception ex) {
                    Logger.printWarn(() -> "VideoCopy: v=" + videoId + " client=" + client + " failed: " + ex);
                    return List.of();
                }
            }
        }, candidate -> candidate.selection().audio(), quality);
    }

    private static List<ClientType> clients() {
        return StreamOrDetailsDataRequest.buildClientOrder(
                SpoofVideoStreamsPatch.getAvailableClients(), Settings.SPOOF_VIDEO_STREAMS_CLIENT_TYPE.get());
    }

    private static List<Candidate> resolve(String videoId, ClientType client, DownloadQuality quality) throws Exception {
        StreamOrDetailsDataRequest.StreamData stream = StreamOrDetailsDataRequest
                .fetchRequestForDownload(videoId, List.of(client), client).getStream();
        if (stream == null) {
            Logger.printDebug(() -> "VideoCopy: v=" + videoId + " client=" + client + " no stream: "
                    + StreamOrDetailsDataRequest.downloadOutcome(videoId, client));
            return List.of();
        }

        PlayerResponse response = PlayerResponse.parseFrom(stream.streamingData());
        VideoCopyLogic.Selection selection = VideoCopyLogic.select(response, quality);
        if (selection == null) {
            Logger.printDebug(() -> "VideoCopy: v=" + videoId + " client=" + client
                    + " has no 360p video-only stream with playable audio");
            return List.of();
        }
        if (!videoId.equals(response.getVideoDetails().getVideoId())) {
            Logger.printDebug(() -> "VideoCopy: v=" + videoId + " client=" + client + " details name another video");
            return List.of();
        }
        List<Candidate> candidates = new ArrayList<>();
        for (Format audio : DownloadFormats.audioFormats(response, true)) {
            candidates.add(new Candidate(response, new VideoCopyLogic.Selection(selection.video(), audio), client));
        }
        return candidates;
    }

    private static boolean save(VideoPairingLogic.Pair pair, String sourceId, String title, Candidate candidate)
            throws Exception {
        String videoId = pair.videoId();
        PlayerResponse response = candidate.response();
        VideoCopyLogic.Selection selection = candidate.selection();

        long length = selection.bytes();
        long free = Utils.getContext().getFilesDir().getUsableSpace();
        if (!VideoCopyLogic.hasRoomFor(free, length)) {
            throw new NoRoomException("only " + free + " bytes free, " + length + " + "
                    + VideoCopyLogic.MIN_FREE_BYTES_AFTER + " are needed");
        }

        File videoTemporary = File.createTempFile("rvx-video-", ".part", Utils.getContext().getCacheDir());
        File audioTemporary = File.createTempFile("rvx-videoaudio-", ".part", Utils.getContext().getCacheDir());
        try {
            long start = System.currentTimeMillis();
            // The notification key is the song's: its progress joins the song's own.
            download(pair.songId(), title, selection.video(), videoTemporary);
            download(pair.songId(), title, selection.audio(), audioTemporary);
            long durationMs = durationOf(selection.video(), response);
            byte[] stored = OfflineResponseTrim.fromVideoDownload(response, selection);
            boolean kept = VideoCopyStore.retain(videoId, pair.songId(), sourceId, videoTemporary, audioTemporary,
                    new VideoCopyLogic.Download(VideoCopyLogic.Stream.of(selection.video()),
                            VideoCopyLogic.Stream.of(selection.audio()), durationMs, stored));
            Logger.printWarn(() -> "VideoCopy: v=" + videoId + " song=" + pair.songId() + " client=" + candidate.client()
                    + " video=" + selection.video().getItag() + ":" + selection.video().getContentLength()
                    + " audio=" + selection.audio().getItag() + ":" + selection.audio().getContentLength()
                    + " served-type=" + (response.getVideoDetails().hasMusicVideoType()
                    ? response.getVideoDetails().getMusicVideoType() : "none")
                    + " stored=" + stored.length + "B " + OfflineResponseTrim.gateFacts(stored)
                    + " ms=" + (System.currentTimeMillis() - start)
                    + " kept=" + kept);
            return kept;
        } finally {
            videoTemporary.delete();
            audioTemporary.delete();
        }
    }

    private static void download(String songId, String title, Format format, File temporary) throws Exception {
        LocalDownloadManager.downloadWithResume(songId, title, format.getUrl(),
                new NativeAudioStore.Destination(null, temporary, format.getMimeType()), format.getContentLength());
    }

    private static long durationOf(Format format, PlayerResponse response) {
        return format.getApproxDurationMs() > 0
                ? format.getApproxDurationMs() : response.getVideoDetails().getLengthSeconds() * 1000L;
    }
}
