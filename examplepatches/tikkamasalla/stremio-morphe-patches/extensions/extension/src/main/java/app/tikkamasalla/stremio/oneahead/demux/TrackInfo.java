package app.tikkamasalla.stremio.oneahead.demux;

/** One audio track of a container, in terms both demuxers share. */
public final class TrackInfo {
    public int number;
    /** Container's codec name: a Matroska CodecID or an MP4 sample entry type. */
    public String codecId = "";
    /** Android MIME type, or null when the codec has no known decoder path. */
    public String mime;
    public byte[] codecPrivate;
    public String language = "";
    public String name = "";
    public int channels = 2;
    public int sampleRate = 48000;
    public long defaultDurationNs;
    public boolean isDefault = true;
    public boolean commentary;
    public boolean visualImpaired;
    /** Matroska header stripping: these bytes go back in front of every frame. */
    public byte[] stripPrefix;
    /** Compression other than header stripping, or encryption. */
    public boolean unreadable;
    public long codecDelayNs;
    public long seekPreRollNs;

    /** Maps a Matroska CodecID to its Android MIME type. */
    static String mimeOfMatroska(String codecId) {
        if (codecId.startsWith("A_AAC")) return "audio/mp4a-latm";
        if (codecId.startsWith("A_OPUS")) return "audio/opus";
        if (codecId.startsWith("A_VORBIS")) return "audio/vorbis";
        if (codecId.startsWith("A_FLAC")) return "audio/flac";
        if (codecId.startsWith("A_AC3")) return "audio/ac3";
        if (codecId.startsWith("A_EAC3")) return "audio/eac3";
        if (codecId.startsWith("A_MPEG/L3")) return "audio/mpeg";
        if (codecId.startsWith("A_MPEG/L2")) return "audio/mpeg-L2";
        if (codecId.startsWith("A_DTS")) return "audio/vnd.dts";
        if (codecId.startsWith("A_TRUEHD")) return "audio/true-hd";
        return null;
    }

    /** Duration of one frame when the container gives none; 0 when it varies. Used only inside a lace. */
    long codecFrameNs() {
        if (mime == null || sampleRate <= 0) return 0;
        switch (mime) {
            case "audio/mp4a-latm":
                return 1024 * 1_000_000_000L / aacCoreRate();
            case "audio/ac3":
            case "audio/eac3":
                return 1536 * 1_000_000_000L / sampleRate;
            case "audio/mpeg":
                return 1152 * 1_000_000_000L / sampleRate;
            case "audio/true-hd": // One access unit is 40 samples at the base rate, whatever the multiple.
                return 40 * 1_000_000_000L / (sampleRate % 44100 == 0 ? 44100 : 48000);
            default:
                return 0;
        }
    }

    /** An AAC frame is 1024 samples at the core rate from the AudioSpecificConfig, SBR or not. */
    private int aacCoreRate() {
        if (codecPrivate != null && codecPrivate.length >= 2) {
            int index = ((codecPrivate[0] & 0x07) << 1) | ((codecPrivate[1] & 0x80) >> 7);
            int[] rates = {96000, 88200, 64000, 48000, 44100, 32000, 24000, 22050, 16000, 12000, 11025, 8000, 7350};
            if (index < rates.length) return rates[index];
        }
        return sampleRate;
    }

    @Override
    public String toString() {
        return "#" + number + " " + codecId + " " + language + " " + channels + "ch " + sampleRate + "Hz";
    }
}
