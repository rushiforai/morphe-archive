package app.morphed.extension.twitch.hls;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.TreeSet;

/**
 * Serves one continuous media playlist to the player while the segments come from different
 * sources (the real playlist or a backup player type) and ad segments are removed.
 * <p>
 * Every segment URI keeps the sequence number it was first served with, new segments get the
 * next number, and a discontinuity is marked where the source changes or ads were cut out.
 * Segments of a new source that are not newer than what was already served are skipped, so a
 * switch does not replay content. Until the first ad, the real playlist is passed through untouched.
 */
public final class PlaylistStitcher {
    public static final String NATIVE = "native";

    private static final int MAX_REMEMBERED_SEGMENTS = 600;
    /**
     * Polls in a row where a source had live segments but all were held back as already played.
     * After this many the time check is dropped: a source whose clock lags must not stall playback forever.
     */
    private static final int MAX_EMPTY_POLLS = 3;

    private final Map<String, Long> sequenceByUri = new HashMap<>();
    private final TreeSet<Long> discontinuities = new TreeSet<>();
    private final Set<String> seenAdUris = new HashSet<>();

    private boolean rewriting;
    private long nextSequence = Long.MIN_VALUE;
    private long lastProgramDateTime = MediaPlaylist.UNKNOWN_TIME;
    private String lastSource;
    private boolean pendingDiscontinuity;
    private long discontinuityBase;
    private long discontinuityBaseSequence;
    private String lastOutput;
    private int emptyPolls;

    public synchronized boolean isRewriting() {
        return rewriting;
    }

    /** Whether {@code playlist} has a segment this stitcher already served, which means the same stream. */
    public synchronized boolean recognises(MediaPlaylist playlist) {
        for (MediaPlaylist.Segment segment : playlist.segments) {
            if (sequenceByUri.containsKey(segment.uri)) return true;
        }
        return false;
    }

    public synchronized String process(MediaPlaylist playlist, String text, String source) {
        if (nextSequence == Long.MIN_VALUE) {
            nextSequence = playlist.mediaSequence;
            discontinuityBase = playlist.discontinuitySequence;
            discontinuityBaseSequence = playlist.mediaSequence;
        }

        if (!rewriting && NATIVE.equals(source) && !playlist.hasAds()) {
            remember(playlist);
            lastOutput = text;
            return text;
        }

        rewriting = true;
        boolean sourceChanged = lastSource != null && !lastSource.equals(source);
        List<MediaPlaylist.Segment> window = new ArrayList<>();
        List<Long> windowSequences = new ArrayList<>();
        boolean reachedLastSegment = false;

        for (int i = 0; i < playlist.segments.size(); i++) {
            MediaPlaylist.Segment segment = playlist.segments.get(i);
            reachedLastSegment = false;

            if (segment.isAd()) {
                if (seenAdUris.add(segment.uri)) pendingDiscontinuity = true;
                continue;
            }

            Long sequence = sequenceByUri.get(segment.uri);
            if (sequence == null) {
                if (emptyPolls < MAX_EMPTY_POLLS
                        && segment.programDateTime != MediaPlaylist.UNKNOWN_TIME
                        && lastProgramDateTime != MediaPlaylist.UNKNOWN_TIME
                        && segment.programDateTime <= lastProgramDateTime) {
                    // Same moment of the stream was already served from another source.
                    continue;
                }
                sequence = nextSequence++;
                sequenceByUri.put(segment.uri, sequence);
                if (segment.discontinuity || pendingDiscontinuity || sourceChanged) {
                    discontinuities.add(sequence);
                }
                pendingDiscontinuity = false;
                sourceChanged = false;
                lastSource = source;
                if (segment.programDateTime != MediaPlaylist.UNKNOWN_TIME) {
                    lastProgramDateTime = Math.max(lastProgramDateTime, segment.programDateTime);
                }
            }
            window.add(segment);
            windowSequences.add(sequence);
            reachedLastSegment = i == playlist.segments.size() - 1;
        }

        // Keep only the newest run of consecutive sequence numbers.
        int start = windowSequences.size() - 1;
        while (start > 0 && windowSequences.get(start - 1) == windowSequences.get(start) - 1) start--;
        if (start > 0) {
            window = window.subList(start, window.size());
            windowSequences = windowSequences.subList(start, windowSequences.size());
        }

        forgetOldSegments();

        if (window.isEmpty()) {
            // Nothing new to play yet: repeat the last playlist so the player keeps waiting.
            // Only count polls where live content was held back by the time check, not pure ad polls.
            if (!playlist.segments.isEmpty() && hasLiveSegment(playlist)) emptyPolls++;
            if (lastOutput != null) return lastOutput;
            return render(playlist, window, windowSequences, false);
        }
        emptyPolls = 0;

        // Prefetch hints can point at upcoming ad segments, so they go while an ad is stitched in;
        // markers that come without ads (trigger, maf-ad) do not cost the low latency mode.
        boolean keepPrefetch = !playlist.hasAdSegments() && !playlist.hasStitchedAdTags && reachedLastSegment;
        lastOutput = render(playlist, window, windowSequences, keepPrefetch);
        return lastOutput;
    }

    private static boolean hasLiveSegment(MediaPlaylist playlist) {
        for (MediaPlaylist.Segment segment : playlist.segments) {
            if (!segment.isAd()) return true;
        }
        return false;
    }

    private void remember(MediaPlaylist playlist) {
        for (MediaPlaylist.Segment segment : playlist.segments) {
            if (!sequenceByUri.containsKey(segment.uri)) {
                sequenceByUri.put(segment.uri, segment.sequence);
                if (segment.discontinuity) discontinuities.add(segment.sequence);
            }
            nextSequence = Math.max(nextSequence, segment.sequence + 1);
            if (segment.programDateTime != MediaPlaylist.UNKNOWN_TIME) {
                lastProgramDateTime = Math.max(lastProgramDateTime, segment.programDateTime);
            }
        }
        discontinuityBase = playlist.discontinuitySequence;
        discontinuityBaseSequence = playlist.mediaSequence;
        lastSource = NATIVE;
    }

    private void forgetOldSegments() {
        long oldest = nextSequence - MAX_REMEMBERED_SEGMENTS;
        Iterator<Map.Entry<String, Long>> iterator = sequenceByUri.entrySet().iterator();
        while (iterator.hasNext()) {
            if (iterator.next().getValue() < oldest) iterator.remove();
        }
        if (oldest > discontinuityBaseSequence) {
            discontinuityBase = discontinuitySequenceAt(oldest);
            discontinuityBaseSequence = oldest;
            discontinuities.headSet(oldest).clear();
        }
        if (seenAdUris.size() > MAX_REMEMBERED_SEGMENTS) seenAdUris.clear();
    }

    private long discontinuitySequenceAt(long firstSequence) {
        if (firstSequence <= discontinuityBaseSequence) return discontinuityBase;
        return discontinuityBase + discontinuities.subSet(discontinuityBaseSequence, firstSequence).size();
    }

    private String render(MediaPlaylist playlist, List<MediaPlaylist.Segment> window,
                          List<Long> sequences, boolean keepPrefetch) {
        StringBuilder out = new StringBuilder();
        for (String line : playlist.header) {
            if (AdMarkers.isAdTagLine(line)) continue;
            out.append(line).append('\n');
        }

        long firstSequence = sequences.isEmpty() ? nextSequence : sequences.get(0);
        out.append("#EXT-X-MEDIA-SEQUENCE:").append(firstSequence).append('\n');
        long discontinuitySequence = discontinuitySequenceAt(firstSequence);
        if (discontinuitySequence > 0) {
            out.append("#EXT-X-DISCONTINUITY-SEQUENCE:").append(discontinuitySequence).append('\n');
        }

        String map = null;
        for (int i = 0; i < window.size(); i++) {
            MediaPlaylist.Segment segment = window.get(i);
            if (discontinuities.contains(sequences.get(i))) out.append("#EXT-X-DISCONTINUITY\n");
            // The init segment must come before the first segment that uses it, and again when a
            // switch to another source brings a different one.
            if (segment.map != null && !segment.map.equals(map)) {
                map = segment.map;
                out.append(map).append('\n');
            }
            for (String tag : segment.tags) {
                if (tag.startsWith("#EXT-X-DISCONTINUITY") || tag.startsWith("#EXT-X-PART:")) continue;
                if (AdMarkers.isAdTagLine(tag)) continue;
                out.append(tag).append('\n');
            }
            out.append(segment.uri).append('\n');
        }

        for (String line : playlist.trailer) {
            if (MediaPlaylist.isPrefetchTag(line) && !keepPrefetch) continue;
            if (!MediaPlaylist.isTrailerTag(line)) continue;
            out.append(line).append('\n');
        }
        return out.toString();
    }
}
