package app.tikkamasalla.stremio.oneahead.demux;

/**
 * What the detector consumes. Sample k of a block plays at ptsUs + k * 1e6 / sampleRate; blocks
 * may leave holes, so a consumer places each block by its timestamp and never by counting.
 */
public interface PcmSink {
    /** The array is reused after the call returns. */
    void onPcm(short[] mono, int count, int sampleRate, long ptsUs) throws DemuxException;
}
