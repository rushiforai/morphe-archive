package app.morphed.extension.twitch.hls;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashSet;
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
    private final Set<String> seenAdUris = new LinkedHashSet<>();

    private boolean rewriting;
    private long nextSequence = Long.MIN_VALUE;
    private long lastProgramDateTime = MediaPlaylist.UNKNOWN_TIME;
    private String lastSource;
    private boolean pendingDiscontinuity;
    private long discontinuityBase;
    private long discontinuityBaseSequence;
    private String lastOutput;
    private int emptyPolls;

    /**
     * Twitch's numbers to the player's, shared by every quality of a stream: a break cut on one quality moves
     * them for all, so a switch of quality (Auto, or by hand) lands on the same numbers for the same moment.
     */
    public static final class Numbering {
        long sequenceOffset, discontinuityOffset;
    }

    private final Numbering numbering;

    public PlaylistStitcher() {
        this(new Numbering());
    }

    public PlaylistStitcher(Numbering numbering) {
        this.numbering = numbering;
    }

    /** How many segments it remembers; for tests. */
    synchronized int rememberedSegments() {
        return sequenceByUri.size();
    }

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

    /**
     * Twitch's own playlist for the player, as Twitch sent it but for the ad markers (and the prefetch hints when a
     * break is announced ahead): no ad segments are in it, and no ad break is being blocked on this quality. Its
     * low latency hints and parts stay. After a stitched stretch (an ad break blocked) the player's numbering goes
     * on where it was: Twitch's numbers are shifted by what the stitching left them apart (never a jump, which the
     * player would answer by playing segments again, skipping them, or waiting). Its segments are remembered, so a
     * break that comes later carries on from them.
     */
    public synchronized String passThrough(MediaPlaylist playlist, String text) {
        if (!rewriting && (sequenceOffset != numbering.sequenceOffset
                || discontinuityOffset != numbering.discontinuityOffset)) {
            // Another quality's break moved the stream's numbers: this one follows them from here.
            sequenceOffset = numbering.sequenceOffset;
            discontinuityOffset = numbering.discontinuityOffset;
            sequenceByUri.clear();
            discontinuities.clear();
            nextSequence = Long.MIN_VALUE;
        }
        if (nextSequence == Long.MIN_VALUE) start(playlist);
        if (rewriting) {
            // Leaving a stitched stretch: the same segments keep the numbers the player knows them by (see
            // readyToHandBack: Twitch's first segment is one of them, and nothing stitched is left in the window).
            Long first = playlist.segments.isEmpty() ? null : sequenceByUri.get(playlist.segments.get(0).uri);
            sequenceOffset = first != null ? first - playlist.segments.get(0).sequence : nextSequence - playlist.mediaSequence;
            discontinuityOffset = discontinuitySequenceAt(playlist.mediaSequence + sequenceOffset)
                    - playlist.discontinuitySequence;
            rewriting = false;
            handBackWaits = 0;
            numbering.sequenceOffset = sequenceOffset;
            numbering.discontinuityOffset = discontinuityOffset;
        }
        remember(playlist);
        pendingDiscontinuity = false;
        emptyPolls = 0;
        if (sequenceByUri.size() > 2 * MAX_REMEMBERED_SEGMENTS) {
            forgetOldSegments();
            discontinuities.headSet(nextSequence - MAX_REMEMBERED_SEGMENTS).clear();
        }
        String out = AdMarkers.withoutAdTags(text, AdMarkers.breakAhead(text, newestTime(playlist)));
        if (sequenceOffset != 0 || discontinuityOffset != 0) out = shifted(out, sequenceOffset, discontinuityOffset);
        lastOutput = out;
        return out;
    }

    /**
     * Whether Twitch's own playlist can take over from the stitched one now without the player seeing a number go
     * back or skip: its first segment is one the player has (at a known number), its segments follow on from it,
     * and every discontinuity the player was given from there on is one Twitch's playlist has too. Until then the
     * stitched playlist goes on (a window holds about half a minute). After HAND_BACK_MAX_WAITS polls it takes
     * over all the same, carrying on after the last number given.
     */
    public synchronized boolean readyToHandBack(MediaPlaylist playlist) {
        if (!rewriting) return true;
        if (++handBackWaits > HAND_BACK_MAX_WAITS || playlist.segments.isEmpty()) return true;
        Long first = sequenceByUri.get(playlist.segments.get(0).uri);
        if (first == null) return false;
        java.util.Set<Long> twitchsOwn = new java.util.HashSet<>();
        for (int i = 0; i < playlist.segments.size(); i++) {
            MediaPlaylist.Segment segment = playlist.segments.get(i);
            Long number = sequenceByUri.get(segment.uri);
            if (number != null && number != first + i) return false; // (the player has them in another order)
            if (segment.discontinuity) twitchsOwn.add(first + i);
        }
        for (Long at : discontinuities.tailSet(first)) {
            if (!twitchsOwn.contains(at)) return false; // one of ours (an ad cut, a backup) still in the window
        }
        return true;
    }

    /** About a minute of polls; then Twitch's playlist takes over whatever is left in the window. */
    static final int HAND_BACK_MAX_WAITS = 30;
    private int handBackWaits;

    /** Twitch's numbers to the player's: what a stitched stretch left them apart (0 until a break). */
    private long sequenceOffset, discontinuityOffset;

    private static final java.util.regex.Pattern MEDIA_SEQUENCE = java.util.regex.Pattern.compile("(?m)^#EXT-X-MEDIA-SEQUENCE:(\\d+)");
    private static final java.util.regex.Pattern DISCONTINUITY_SEQUENCE =
            java.util.regex.Pattern.compile("(?m)^#EXT-X-DISCONTINUITY-SEQUENCE:(\\d+)");
    private static final java.util.regex.Pattern LAST_MSN = java.util.regex.Pattern.compile("LAST-MSN=(\\d+)");

    /** A playlist's numbers moved by these offsets (its media and discontinuity sequence, rendition reports). */
    static String shifted(String text, long sequence, long discontinuity) {
        String out = add(MEDIA_SEQUENCE, text, sequence, "#EXT-X-MEDIA-SEQUENCE:");
        out = add(LAST_MSN, out, sequence, "LAST-MSN=");
        if (DISCONTINUITY_SEQUENCE.matcher(out).find()) {
            out = add(DISCONTINUITY_SEQUENCE, out, discontinuity, "#EXT-X-DISCONTINUITY-SEQUENCE:");
        } else if (discontinuity > 0) { // (none given: it's 0, and the player's has gone past that)
            java.util.regex.Matcher media = MEDIA_SEQUENCE.matcher(out);
            if (media.find()) {
                int end = out.indexOf('\n', media.end());
                int at = end < 0 ? out.length() : end + 1;
                out = out.substring(0, at) + "#EXT-X-DISCONTINUITY-SEQUENCE:" + discontinuity + "\n" + out.substring(at);
            }
        }
        return out;
    }

    private static String add(java.util.regex.Pattern pattern, String text, long offset, String prefix) {
        if (offset == 0) return text;
        java.util.regex.Matcher m = pattern.matcher(text);
        StringBuffer out = new StringBuffer();
        while (m.find()) {
            m.appendReplacement(out, prefix + (Long.parseLong(m.group(1)) + offset));
        }
        m.appendTail(out);
        return out.toString();
    }

    /** When the newest segment starts (epoch ms), or UNKNOWN_TIME. */
    static long newestTime(MediaPlaylist playlist) {
        for (int i = playlist.segments.size() - 1; i >= 0; i--) {
            long at = playlist.segments.get(i).programDateTime;
            if (at != MediaPlaylist.UNKNOWN_TIME) return at;
        }
        return MediaPlaylist.UNKNOWN_TIME;
    }

    public synchronized String process(MediaPlaylist playlist, String text, String source) {
        if (nextSequence == Long.MIN_VALUE) start(playlist);

        if (!rewriting && NATIVE.equals(source) && !playlist.hasAdSegments()) return passThrough(playlist, text);
        if (playlist.hasAdSegments()) handBackWaits = 0; // (a new break: the wait to hand back starts again)

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
                // After MAX_EMPTY_POLLS a lagging source gets its newest segment through, not its whole window
                // (played already, at other numbers).
                if ((emptyPolls < MAX_EMPTY_POLLS || i < playlist.segments.size() - 1)
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

        // Prefetch hints can point at upcoming ad segments, so they go while ad segments are in it or a break is
        // announced to start after its newest segment; otherwise they stay (without them the player only learns
        // of new segments from the next playlist, and one slow playlist empties its buffer: a stall).
        boolean keepPrefetch = !playlist.hasAdSegments() && reachedLastSegment
                && !AdMarkers.breakAhead(text, newestTime(playlist));
        lastOutput = render(playlist, window, windowSequences, keepPrefetch);
        return lastOutput;
    }

    private static boolean hasLiveSegment(MediaPlaylist playlist) {
        for (MediaPlaylist.Segment segment : playlist.segments) {
            if (!segment.isAd()) return true;
        }
        return false;
    }

    /** A quality's first playlist: numbered as the stream's other qualities are now. */
    private void start(MediaPlaylist playlist) {
        if (!rewriting) {
            sequenceOffset = numbering.sequenceOffset;
            discontinuityOffset = numbering.discontinuityOffset;
        }
        nextSequence = playlist.mediaSequence + sequenceOffset;
        discontinuityBase = playlist.discontinuitySequence + discontinuityOffset;
        discontinuityBaseSequence = playlist.mediaSequence + sequenceOffset;
    }

    /** Twitch's segments as the player knows them (Twitch's numbers, shifted after a stitched stretch). */
    private void remember(MediaPlaylist playlist) {
        for (MediaPlaylist.Segment segment : playlist.segments) {
            long number = segment.sequence + sequenceOffset;
            if (!sequenceByUri.containsKey(segment.uri)) {
                sequenceByUri.put(segment.uri, number);
                if (segment.discontinuity) discontinuities.add(number);
            }
            nextSequence = Math.max(nextSequence, number + 1);
            if (segment.programDateTime != MediaPlaylist.UNKNOWN_TIME) {
                lastProgramDateTime = Math.max(lastProgramDateTime, segment.programDateTime);
            }
        }
        discontinuityBase = playlist.discontinuitySequence + discontinuityOffset;
        discontinuityBaseSequence = playlist.mediaSequence + sequenceOffset;
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
        // Oldest first. Clearing them all would make the ads still in the window look new, and
        // mark a discontinuity (a visible glitch) where there is none.
        Iterator<String> oldestAds = seenAdUris.iterator();
        while (seenAdUris.size() > MAX_REMEMBERED_SEGMENTS && oldestAds.hasNext()) {
            oldestAds.next();
            oldestAds.remove();
        }
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
