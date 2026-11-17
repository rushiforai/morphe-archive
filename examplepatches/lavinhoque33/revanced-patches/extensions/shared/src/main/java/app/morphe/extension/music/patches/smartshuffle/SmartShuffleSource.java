/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Modified by lavinhoque33, 2026-11-15.
 * Written by lavinhoque33, 2026-11-15.
 */
package app.morphe.extension.music.patches.smartshuffle;

import android.content.Context;

import org.json.JSONObject;

import java.io.IOException;
import java.util.ArrayDeque;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;
import java.util.concurrent.CancellationException;
import java.util.function.BooleanSupplier;
import java.util.function.Consumer;

import app.morphe.extension.music.patches.misc.requests.MusicBrowseRequest;

/** Side requests only: this source never consumes the playing queue's autoplay cursor. */
public final class SmartShuffleSource {
    public record Candidate(String videoId, JSONObject command) {}

    public static final class Result {
        private final Set<String> originals;
        private final List<Candidate> candidates;
        private final boolean editable;
        private final Cursor cursor;

        public Result(Set<String> originals, List<Candidate> candidates, boolean editable) {
            this(originals, candidates, editable, null);
        }

        private Result(Set<String> originals, List<Candidate> candidates, boolean editable, Cursor cursor) {
            this.originals = originals;
            this.candidates = List.copyOf(candidates);
            this.editable = editable;
            this.cursor = cursor;
        }

        public Set<String> originals() { return originals; }
        public List<Candidate> candidates() { return candidates; }
        public boolean editable() { return editable; }
        public boolean exhausted() { return cursor == null; }
    }

    interface Requests {
        JSONObject browse(String browseId, String continuation) throws Exception;
        JSONObject next(JSONObject fields) throws Exception;
    }

    private static final int LOOKAHEAD = 12;
    private static final int RADIO_PAGE_LIMIT = 3;

    /** Handoff between serial manager requests; the session dedupe set is shared, never copied per page. */
    private record Cursor(String playlistId, String reload, JSONObject radio, String radioNext,
                          boolean radioStarted, Set<String> seen) {}

    private SmartShuffleSource() {}

    public static Result load(Context context, String playlistId, BooleanSupplier cancelled) throws Exception {
        return load(requests(context), playlistId, cancelled);
    }

    public static Result loadMore(Context context, Result previous, BooleanSupplier cancelled) throws Exception {
        return loadMore(requests(context), previous, cancelled);
    }

    private static Requests requests(Context context) {
        return new Requests() {
            @Override
            public JSONObject browse(String browseId, String continuation) throws Exception {
                return MusicBrowseRequest.browse(context, browseId, continuation, null);
            }

            @Override
            public JSONObject next(JSONObject fields) throws Exception {
                return MusicBrowseRequest.nextWith(context, fields);
            }
        };
    }

    static Result load(Requests requests, String playlistId, BooleanSupplier cancelled) throws Exception {
        checkCancelled(cancelled);
        SmartShuffleManager.debug(() -> "Smart Shuffle source lookup playlist="
                + SmartShuffleManager.logId(playlistId));
        JSONObject response = requests.browse("VL" + playlistId, null);
        checkCancelled(cancelled);

        SmartShuffleResponse.BrowsePage page = SmartShuffleResponse.browse(response, playlistId);
        if (!page.originalShelf) throw new IOException("Source playlist has no original-track shelf");
        boolean editable = SmartShuffleResponse.editable(response);
        JSONObject radio = SmartShuffleResponse.radioEndpoint(response, playlistId);

        Set<String> originals = new LinkedHashSet<>();
        List<Candidate> suggestions = new ArrayList<>();
        ArrayDeque<String> originalPages = new ArrayDeque<>();
        ArrayDeque<String> sections = new ArrayDeque<>();
        Set<String> visited = new HashSet<>();
        absorb(page, originals, suggestions, originalPages, sections);
        String reload = page.reload;

        // Exhaust track pages before suggestions, including originals beyond the first 100 tracks.
        while (!originalPages.isEmpty() || !sections.isEmpty()) {
            boolean trackPage = !originalPages.isEmpty();
            if (!trackPage && !reload.isEmpty()) break;

            String token = trackPage ? originalPages.removeFirst() : sections.removeFirst();
            if (!visited.add(token)) throw new IOException("Source playlist continuation repeated");
            checkCancelled(cancelled);
            response = requests.browse("VL" + playlistId, token);
            checkCancelled(cancelled);

            page = SmartShuffleResponse.browse(response, playlistId);
            if (trackPage && !page.originalShelf) {
                throw new IOException("Original-track continuation did not return playlist tracks");
            }
            absorb(page, originals, suggestions, originalPages, sections);
            if (!page.reload.isEmpty()) reload = page.reload;
        }

        return initialResult(requests, playlistId, originals, suggestions, reload, cancelled, editable, radio);
    }

    private static void absorb(SmartShuffleResponse.BrowsePage page, Set<String> originals,
                               List<Candidate> suggestions, ArrayDeque<String> originalPages,
                               ArrayDeque<String> sections) {
        originals.addAll(page.originals);
        suggestions.addAll(page.suggestions);
        originalPages.addAll(page.originalTokens);
        sections.addAll(page.sectionTokens);
    }

    private static Result initialResult(Requests requests, String playlistId, Set<String> originals,
                                        List<Candidate> suggestions, String reload, BooleanSupplier cancelled,
                                        boolean editable, JSONObject radio) throws Exception {
        Set<String> allOriginals = Collections.unmodifiableSet(originals);
        Set<String> seen = new HashSet<>(originals);
        List<Candidate> candidates = new ArrayList<>();
        if (editable) collect(suggestions, seen, candidates, playlistId, "owned-suggestions");
        else reload = "";

        Cursor cursor = new Cursor(playlistId, reload, radio, "", false, seen);
        Result result = new Result(allOriginals, candidates, editable, cursor);
        if (candidates.size() < LOOKAHEAD) {
            Result additional = loadMore(requests, result, cancelled);
            candidates.addAll(additional.candidates());
            result = new Result(allOriginals, candidates, editable, additional.cursor);
        }
        return result;
    }

    static Result loadMore(Requests requests, Result previous, BooleanSupplier cancelled) throws Exception {
        checkCancelled(cancelled);
        Cursor cursor = previous.cursor;
        if (cursor == null) return new Result(previous.originals, List.of(), previous.editable);

        Set<String> seen = cursor.seen;
        List<Candidate> candidates = new ArrayList<>();
        String reload = cursor.reload;
        if (!reload.isEmpty()) {
            // At most two empty refreshes, then use the independent server-returned playlist radio.
            for (int attempt = 0; attempt < 2; attempt++) {
                checkCancelled(cancelled);
                SmartShuffleManager.debug(() -> "Smart Shuffle source request playlist="
                        + SmartShuffleManager.logId(cursor.playlistId) + " source=owned-suggestions");
                JSONObject response = requests.browse("VL" + cursor.playlistId, reload);
                checkCancelled(cancelled);
                SmartShuffleResponse.BrowsePage page = SmartShuffleResponse.browse(response, cursor.playlistId);
                reload = page.reload;
                collect(page.suggestions, seen, candidates, cursor.playlistId, "owned-suggestions");
                if (!candidates.isEmpty() || reload.isEmpty()) break;
            }
            if (!candidates.isEmpty()) {
                Cursor next = new Cursor(cursor.playlistId, reload, cursor.radio, cursor.radioNext,
                        cursor.radioStarted, seen);
                return result(previous, candidates, next);
            }
            reload = "";
        }

        if (cursor.radio == null || (cursor.radioStarted && cursor.radioNext.isEmpty())) {
            return result(previous, candidates, null);
        }

        String continuation = cursor.radioNext;
        boolean started = cursor.radioStarted;
        Set<String> visited = new HashSet<>();
        for (int pageIndex = 0; pageIndex < RADIO_PAGE_LIMIT; pageIndex++) {
            JSONObject fields = started ? new JSONObject().put("continuation", continuation) : cursor.radio;
            if (started && !visited.add(continuation)) throw new IOException("Playlist radio continuation repeated");
            checkCancelled(cancelled);
            SmartShuffleManager.debug(() -> "Smart Shuffle source request playlist="
                    + SmartShuffleManager.logId(cursor.playlistId) + " source=radio");
            JSONObject response = requests.next(fields);
            checkCancelled(cancelled);
            SmartShuffleResponse.RadioPage page = SmartShuffleResponse.radio(response);
            collect(page.candidates(), seen, candidates, cursor.playlistId, "radio");
            continuation = page.continuation();
            started = true;
            if (continuation.isEmpty() || candidates.size() >= LOOKAHEAD) break;
        }

        Cursor next = continuation.isEmpty() || candidates.isEmpty() ? null
                : new Cursor(cursor.playlistId, reload, cursor.radio, continuation, started, seen);
        return result(previous, candidates, next);
    }

    private static Result result(Result previous, List<Candidate> candidates, Cursor cursor) {
        if (cursor != null && cursor.reload.isEmpty()
                && (cursor.radio == null || (cursor.radioStarted && cursor.radioNext.isEmpty()))) {
            cursor = null;
        }
        return new Result(previous.originals, candidates, previous.editable, cursor);
    }

    private static void collect(List<Candidate> source, Set<String> seen, List<Candidate> candidates,
                                String playlistId, String origin) {
        int before = candidates.size();
        for (Candidate candidate : source) {
            if (seen.add(candidate.videoId())) candidates.add(candidate);
        }
        SmartShuffleManager.debug(() -> "Smart Shuffle source candidates playlist="
                + SmartShuffleManager.logId(playlistId) + " source=" + origin + " received=" + source.size()
                + " afterPlaylistSessionDedupe=" + (candidates.size() - before) + " sessionSeen=" + seen.size());
    }

    private static void checkCancelled(BooleanSupplier cancelled) {
        if (cancelled.getAsBoolean()) {
            SmartShuffleManager.debug(() -> "Smart Shuffle source cancelled-or-stale");
            throw new CancellationException("Smart Shuffle source cancelled");
        }
    }

    /** Called on the manager's background executor; dispatch itself never confirms Keep. */
    public static void keep(Context context, String sourcePlaylistId, boolean editable, Candidate candidate,
                            long occurrenceId, Consumer<Boolean> confirmed) {
        if (!editable) {
            SmartShuffleManager.debug(() -> "Smart Shuffle Keep dispatch source=picker occurrence=" + occurrenceId
                    + " video=" + SmartShuffleManager.logId(candidate.videoId()));
            SmartShuffleKeep.pick(candidate.videoId(), occurrenceId, confirmed);
            return;
        }

        boolean edited = false;
        SmartShuffleManager.debug(() -> "Smart Shuffle Keep dispatch source=owned-playlist occurrence=" + occurrenceId
                + " playlist=" + SmartShuffleManager.logId(sourcePlaylistId)
                + " video=" + SmartShuffleManager.logId(candidate.videoId()));
        try {
            JSONObject request = SmartShuffleResponse.editRequest(sourcePlaylistId, candidate);
            JSONObject response = MusicBrowseRequest.editPlaylist(context, request);
            edited = SmartShuffleResponse.confirmedEdit(response, candidate.videoId());
        } catch (Exception exception) {
            SmartShuffleManager.debug(() -> "Smart Shuffle Keep edit failed occurrence=" + occurrenceId
                    + " error=" + exception.getClass().getSimpleName());
        }
        boolean result = edited;
        SmartShuffleManager.debug(() -> "Smart Shuffle Keep edit result occurrence=" + occurrenceId
                + " video=" + SmartShuffleManager.logId(candidate.videoId()) + " confirmed=" + result);
        confirmed.accept(edited);
    }
}
