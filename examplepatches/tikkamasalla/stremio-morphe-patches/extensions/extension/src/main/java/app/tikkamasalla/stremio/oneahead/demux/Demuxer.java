package app.tikkamasalla.stremio.oneahead.demux;

import java.util.Arrays;
import java.util.List;

/** Container-independent reader of one audio track's frames over byte ranges. */
public interface Demuxer {
    /** Receives one access unit. The array is reused after the call returns. */
    interface FrameSink {
        void onFrame(byte[] data, int off, int len, long ptsUs) throws DemuxException;
    }

    /** Reads the file's index. Costs a few small requests, never media data. */
    void open() throws DemuxException;

    List<TrackInfo> tracks();

    void select(TrackInfo track);

    /** Container's stated duration in seconds, or -1 when it states none and none could be found. */
    double durationSec();

    /** Bytes a read of this window would span (exact from an index, proportional without one); -1 when unknown. */
    long estimateBytes(long fromUs, long toUs);

    /** Sends the chosen track's frames whose time falls in [fromUs, toUs]. */
    ReadStats read(long fromUs, long toUs, FrameSink sink) throws DemuxException;

    /** Video keyframe times seen so far. */
    KeyframeLog keyframes();

    /** What one read did. */
    final class ReadStats {
        public long frames;
        public long firstPtsUs = Long.MIN_VALUE, lastPtsUs = Long.MIN_VALUE;
        /** The stream really ends before the window does: no more data in the file for this track. */
        public boolean endOfStream;
        /** The file stops in the middle of an element, or before the place its index or header promised. */
        public boolean truncated;
        /** Times a damaged stretch had to be skipped. */
        public int resyncs;
        public long spanBytes, audioBytes, otherBytes;
        public long clusters, blocks, lacedBlocks, blockGroups;
        public final long[] laceKinds = new long[4];
        /** Largest gap between a cluster's start time and an audio block's time in it. */
        public long maxAudioSkewUs;
    }

    /**
     * Video keyframe times, from the index (Cues, stss) and from block flags actually read. The two
     * are kept apart: Matroska's Cues are normally keyframes, but only a block's own flag proves it.
     */
    final class KeyframeLog {
        private long[] indexed = new long[256], seen = new long[256];
        private int indexedCount, seenCount;

        synchronized void add(long ptsUs, boolean fromBlock) {
            if (fromBlock) {
                if (seenCount == seen.length) seen = Arrays.copyOf(seen, seenCount * 2);
                seen[seenCount++] = ptsUs;
            } else {
                if (indexedCount == indexed.length) indexed = Arrays.copyOf(indexed, indexedCount * 2);
                indexed[indexedCount++] = ptsUs;
            }
        }

        /** Times the index lists, sorted and distinct. */
        public synchronized long[] fromIndex() {
            return distinct(indexed, indexedCount);
        }

        /** Times whose own block said keyframe, sorted and distinct. */
        public synchronized long[] fromBlocks() {
            return distinct(seen, seenCount);
        }

        private static long[] distinct(long[] times, int count) {
            long[] all = Arrays.copyOf(times, count);
            Arrays.sort(all);
            int n = 0;
            for (int i = 0; i < all.length; i++) {
                if (n == 0 || all[i] != all[n - 1]) all[n++] = all[i];
            }
            return Arrays.copyOf(all, n);
        }
    }
}
