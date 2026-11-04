package app.tikkamasalla.stremio.oneahead.demux;

/** A software MediaCodec when the type has one, otherwise the app's own FFmpeg. Never a vendor decoder. */
public final class SoftwareDecoders implements AudioDecoder.Factory {
    private final AudioDecoder.Factory mediaCodec, ffmpeg;

    public SoftwareDecoders(AudioDecoder.Factory softwareMediaCodec, AudioDecoder.Factory ffmpeg) {
        this.mediaCodec = softwareMediaCodec;
        this.ffmpeg = ffmpeg;
    }

    @Override
    public boolean canDecode(String mime) {
        return mediaCodec.canDecode(mime) || ffmpeg.canDecode(mime);
    }

    @Override
    public boolean isSoftware(String mime) {
        return canDecode(mime);
    }

    @Override
    public AudioDecoder create(TrackInfo track, AudioDecoder.Output output) throws DemuxException {
        return (mediaCodec.canDecode(track.mime) ? mediaCodec : ffmpeg).create(track, output);
    }
}
