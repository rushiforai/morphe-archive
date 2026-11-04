package app.tikkamasalla.stremio.oneahead.demux;

import java.nio.ByteBuffer;

/** The only part that needs Android: frames in, PCM with the decoder's own timestamps out. */
public interface AudioDecoder {
    int PCM_16BIT = 2, PCM_FLOAT = 4, PCM_32BIT = 22; // Same values as android.media.AudioFormat.

    /** Receives what the decoder produced; the buffer is only valid during the call. */
    interface Output {
        void onDecoded(ByteBuffer pcm, int encoding, int channels, int sampleRate, long ptsUs) throws DemuxException;
    }

    interface Factory extends TrackChooser.Probe {
        /** Fails with DECODER_MISSING or DECODER_BUSY, leaving nothing allocated. */
        AudioDecoder create(TrackInfo track, Output output) throws DemuxException;
    }

    void queue(byte[] data, int off, int len, long ptsUs) throws DemuxException;

    /** Forgets all state; the next frame may be anywhere in the file. */
    void flush() throws DemuxException;

    /** Pushes out everything queued. {@link #flush()} must follow before more frames. */
    void drainToEnd() throws DemuxException;

    void release();
}
