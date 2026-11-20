package app.kitan.extension.youtube;

import java.util.Set;

/**
 * Feed/search filter hook, injected at patch time into the base bundle's
 * runtime Litho filter ({@code LithoFilterPatch.isFiltered}).
 *
 * {@code isFiltered} receives the protobuf buffer of every mounted component.
 * This filter scans it for channel ids ("UC" + 22 chars) and reports whether
 * the component belongs to a blocked channel, in which case the base bundle's
 * empty-component machinery removes it.
 */
@SuppressWarnings("unused")
public final class ChannelBlockerFilter {

    private ChannelBlockerFilter() {
    }

    /**
     * @param buffer the protobuf buffer of the Litho component, or null.
     * @return true when the component contains a channel id that is blocked.
     */
    public static boolean isBlockedChannelBuffer(byte[] buffer) {
        Set<String> blocked = ChannelBlocker.blockedChannelsSnapshotForFilter();
        if (blocked == null || blocked.isEmpty() || buffer == null || buffer.length < 24) {
            return false;
        }

        for (int i = 0; i < buffer.length - 24; i++) {
            if (buffer[i] == 'U' && buffer[i + 1] == 'C') {
                if (isValidChannelId(buffer, i)) {
                    String channelId = new String(buffer, i, 24, java.nio.charset.StandardCharsets.US_ASCII);
                    if (blocked.contains(channelId)) {
                        Logger.printDebug(() -> "Blocking component of channel: " + channelId);
                        return true;
                    }
                    // Skip past this id to avoid re-checking overlapping matches.
                    i += 23;
                }
            }
        }
        return false;
    }

    private static boolean isValidChannelId(byte[] data, int start) {
        for (int j = 2; j < 24; j++) {
            byte c = data[start + j];
            boolean ok = (c >= 'A' && c <= 'Z') || (c >= 'a' && c <= 'z')
                    || (c >= '0' && c <= '9') || c == '-' || c == '_';
            if (!ok) {
                return false;
            }
        }
        return true;
    }
}
