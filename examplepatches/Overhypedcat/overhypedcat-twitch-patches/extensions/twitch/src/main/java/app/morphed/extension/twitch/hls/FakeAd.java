package app.morphed.extension.twitch.hls;

/**
 * Turns the newest segments of a live media playlist into a stitched ad, the way Twitch marks one:
 * a stitched-ad DATERANGE and segments that are not titled "live". Only for testing the ad blocker
 * on a device when Twitch serves no ads (see StreamAdsPatch, debug.twitchmorphed.fake_ad).
 */
public final class FakeAd {
    static final String MARKER = "#EXT-X-DATERANGE:ID=\"stitched-ad-test\",CLASS=\"twitch-stitched-ad\","
            + "START-DATE=\"2026-01-01T00:00:00.000Z\",DURATION=30,X-TV-TWITCH-AD-POD-LENGTH=\"1\"";

    private FakeAd() {
    }

    /** {@code text} with its last {@code count} segments made ads; unchanged if it has no live segments. */
    public static String inject(String text, int count) {
        String[] lines = Lines.of(text);
        int live = 0;
        for (String line : lines) {
            if (line.startsWith("#EXTINF") && line.contains(",live")) live++;
        }
        if (live == 0 || count <= 0) return text;

        int toConvert = Math.min(count, live);
        int firstConverted = live - toConvert;
        StringBuilder out = new StringBuilder(text.length() + 256);
        boolean markerAdded = false;
        int seen = 0;
        for (String line : lines) {
            boolean segmentTag = line.startsWith("#EXTINF") || line.startsWith("#EXT-X-PROGRAM-DATE-TIME");
            if (!markerAdded && segmentTag) {
                out.append(MARKER).append('\n');
                markerAdded = true;
            }
            if (line.startsWith("#EXTINF") && line.contains(",live")) {
                if (seen++ >= firstConverted) line = line.replace(",live", ",Amazon|test-ad");
            }
            out.append(line).append('\n');
        }
        return out.toString();
    }
}
