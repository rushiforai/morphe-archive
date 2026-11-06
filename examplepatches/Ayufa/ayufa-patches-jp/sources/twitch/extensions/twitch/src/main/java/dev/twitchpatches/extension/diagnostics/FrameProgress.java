package dev.twitchpatches.extension.diagnostics;

final class FrameProgress {
    private boolean sampled;
    private long time;
    private int decoded;
    private int rendered;
    private int dropped;

    String sample(long now, int nextDecoded, int nextRendered, int nextDropped) {
        if (nextDecoded < 0 || nextRendered < 0 || nextDropped < 0) return null;
        if (!sampled || now < time || nextDecoded < decoded || nextRendered < rendered || nextDropped < dropped) {
            sampled = true; time = now; decoded = nextDecoded; rendered = nextRendered; dropped = nextDropped;
            return "frame counter baseline";
        }
        long elapsed = now - time;
        if (elapsed < 5000) return null;
        String result = "frames elapsedMs=" + elapsed + " decoded=" + (nextDecoded - decoded) +
                " rendered=" + (nextRendered - rendered) + " dropped=" + (nextDropped - dropped);
        time = now; decoded = nextDecoded; rendered = nextRendered; dropped = nextDropped;
        return result;
    }
}
