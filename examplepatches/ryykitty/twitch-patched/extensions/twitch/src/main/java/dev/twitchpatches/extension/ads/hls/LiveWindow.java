package dev.twitchpatches.extension.ads.hls;

import java.time.Instant;
import java.util.ArrayDeque;
import java.util.Deque;
import java.util.Map;
import java.util.Objects;
import java.util.TreeMap;
import java.util.LinkedHashMap;

public final class LiveWindow {
    private final TreeMap<Long, Candidate> live = new TreeMap<>();
    private final Deque<Item> window = new ArrayDeque<>();
    private final Map<Long, Hint> hints = new LinkedHashMap<>();
    private final Map<Long, Hint> emittedHints = new LinkedHashMap<>();
    private Long lastLive;
    private long nextDate = -1;
    private long discontinuities;
    private double seconds;
    private int version = 3;

    public void absorb(HlsPlaylist playlist, String source) {
        version = Math.max(version, playlist.version);
        for (HlsPlaylist.Segment segment : playlist.segments) {
            Long number = segment.liveSequence;
            if (number == null || (lastLive != null && number <= lastLive)) continue;
            Candidate old = live.get(number);
            if (old == null || "main".equals(source)) live.put(number, new Candidate(segment, source));
        }
        while (live.size() > 256) live.pollFirstEntry();
        for (HlsPlaylist.Hint hint : playlist.hints) {
            if (hint.liveSequence == null || (lastLive != null && hint.liveSequence <= lastLive)) continue;
            Hint old = hints.get(hint.liveSequence);
            if (old == null || "main".equals(source)) hints.put(hint.liveSequence, new Hint(hint, source));
        }
        while (hints.size() > 256) hints.remove(hints.keySet().iterator().next());
    }

    public boolean hasNewLive() { return !live.isEmpty() && (lastLive == null || live.lastKey() > lastLive); }
    public boolean hasOutput() { return !window.isEmpty(); }

    public boolean acceptCleanBackup(HlsPlaylist playlist, String source) {
        if (!playlist.supported || playlist.ads || playlist.segments.isEmpty() ||
                playlist.segments.stream().anyMatch(segment -> segment.liveSequence == null)) return false;
        absorb(playlist, source);
        advance(true);
        return hasOutput();
    }

    public boolean advance(boolean requireContinuous) {
        boolean added = false;
        while (!live.isEmpty()) {
            Map.Entry<Long, Candidate> next = live.firstEntry();
            if (lastLive != null && next.getKey() <= lastLive) { live.pollFirstEntry(); continue; }
            boolean gap = lastLive != null && next.getKey() != lastLive + 1;
            if (gap && requireContinuous) {
                while (!window.isEmpty()) {
                    Item removed = window.removeFirst();
                    if (removed.discontinuity) discontinuities++;
                }
                seconds = 0;
                Candidate first = next.getValue();
                if (first.segment.date >= 0) nextDate = Math.max(nextDate, first.segment.date);
            }
            Candidate candidate = live.pollFirstEntry().getValue();
            append(candidate.segment, candidate.source, gap);
            lastLive = next.getKey();
            added = true;
        }
        return added;
    }

    public String finish(HlsPlaylist primary, boolean cleanBackupAccepted) {
        boolean unknownMedia = primary.segments.stream().anyMatch(segment -> segment.liveSequence == null);
        if (!cleanBackupAccepted && (primary.ads || unknownMedia)) return null;
        return render(primary.targetDuration, primary.ended && !primary.ads);
    }

    private void append(HlsPlaylist.Segment segment, String source, boolean forceDiscontinuity) {
        if (nextDate < 0 && segment.date >= 0) nextDate = segment.date;
        long sequence = segment.liveSequence;
        Hint frozen = emittedHints.get(segment.liveSequence);
        if (frozen != null && Objects.equals(frozen.hint.map, segment.map)) {
            segment = new HlsPlaylist.Segment(segment.liveSequence, frozen.hint.uri, segment.duration,
                    segment.map, segment.date, segment.discontinuity);
            source = frozen.source;
        }
        Item previous = window.peekLast();
        boolean boundary = previous != null && (forceDiscontinuity || segment.discontinuity ||
                !previous.source.equals(source) || !Objects.equals(previous.segment.map, segment.map));
        Item item = new Item(sequence, segment, source, nextDate, boundary);
        if (nextDate >= 0) nextDate += Math.round(segment.duration * 1000);
        window.addLast(item);
        seconds += segment.duration;
        while (window.size() > 1 && (window.size() > 60 || seconds - window.peekFirst().segment.duration >= 30)) {
            Item removed = window.removeFirst();
            seconds -= removed.segment.duration;
            if (removed.discontinuity) discontinuities++;
        }
    }

    public String render(int declaredTarget, boolean ended) {
        Item first = window.peekFirst();
        if (first == null) return null;
        int target = declaredTarget;
        for (Item item : window) target = Math.max(target, (int) Math.ceil(item.segment.duration));
        int outputVersion = version;
        for (Item item : window) if (item.segment.map != null) outputVersion = Math.max(outputVersion, 6);
        StringBuilder text = new StringBuilder("#EXTM3U\n#EXT-X-VERSION:").append(outputVersion)
                .append("\n#EXT-X-TARGETDURATION:")
                .append(target).append("\n#EXT-X-MEDIA-SEQUENCE:").append(first.sequence)
                .append("\n#EXT-X-DISCONTINUITY-SEQUENCE:").append(discontinuities).append('\n');
        String lastMap = null;
        for (Item item : window) {
            if (item.discontinuity) text.append("#EXT-X-DISCONTINUITY\n");
            if (item.segment.liveSequence != null && (item == first || item.discontinuity))
                text.append("#EXT-X-TWITCH-LIVE-SEQUENCE:").append(item.segment.liveSequence).append('\n');
            if (item.segment.map != null && (!item.segment.map.equals(lastMap) || item.discontinuity))
                text.append("#EXT-X-MAP:URI=\"").append(item.segment.map).append("\"\n");
            lastMap = item.segment.map;
            if (item.date >= 0) text.append("#EXT-X-PROGRAM-DATE-TIME:")
                    .append(Instant.ofEpochMilli(item.date)).append('\n');
            text.append("#EXTINF:").append(item.segment.duration).append(",\n").append(item.segment.uri).append('\n');
        }
        Item last = window.peekLast();
        if (!ended && last != null && last.segment.liveSequence != null) {
            for (long number = last.segment.liveSequence + 1; number <= last.segment.liveSequence + 2; number++) {
                Hint hint = emittedHints.get(number);
                if (hint == null) {
                    hint = hints.get(number);
                    if (hint == null || !Objects.equals(hint.hint.map, last.segment.map)) break;
                    emittedHints.put(number, hint);
                }
                text.append("#EXT-X-TWITCH-PREFETCH:").append(hint.hint.uri).append('\n');
            }
        }
        hints.entrySet().removeIf(entry -> lastLive != null && entry.getKey() < lastLive - 64);
        emittedHints.entrySet().removeIf(entry -> lastLive != null && entry.getKey() < lastLive - 64);
        if (ended) text.append("#EXT-X-ENDLIST\n");
        return text.toString();
    }

    private static final class Candidate {
        final HlsPlaylist.Segment segment;
        final String source;
        Candidate(HlsPlaylist.Segment segment, String source) { this.segment = segment; this.source = source; }
    }
    private static final class Hint {
        final HlsPlaylist.Hint hint;
        final String source;
        Hint(HlsPlaylist.Hint hint, String source) { this.hint = hint; this.source = source; }
    }
    private static final class Item {
        final long sequence;
        final HlsPlaylist.Segment segment;
        final String source;
        final long date;
        final boolean discontinuity;
        Item(long sequence, HlsPlaylist.Segment segment, String source, long date, boolean discontinuity) {
            this.sequence = sequence; this.segment = segment; this.source = source;
            this.date = date; this.discontinuity = discontinuity;
        }
    }
}
