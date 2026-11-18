package id.ikuradachi.kageroll.extension.crunchyroll;

import java.util.Collections;
import java.util.List;

/**
 * Selects the single best video track across all TrackGroups of a video renderer
 * during Media3 DownloadHelper preparation completion.
 */
public final class DownloadQualityHelper {

    private static final int FORMAT_HANDLED_MASK = 0x7;
    private static final int FORMAT_HANDLED = 0x4;

    private DownloadQualityHelper() {
    }

    public static final class VideoSelector {
        private final int targetHeight;
        private int currentGroupIndex = -1;
        private Object[] currentFormats;
        private int[] currentSupports;
        private int nextTrackIndex;

        private boolean hasBest;
        private int bestGroupIndex = -1;
        private int bestTrackIndex = -1;
        private boolean bestSupported;
        private int bestWidth;
        private int bestHeight;
        private int bestBitrate;

        VideoSelector(int targetHeight) {
            this.targetHeight = targetHeight;
        }
    }

    public static Object beginVideoSelection(int targetHeight) {
        return new VideoSelector(targetHeight);
    }

    public static void beginGroup(
            Object selectorObj,
            int groupIndex,
            Object[] formats,
            int[] supports
    ) {
        if (!(selectorObj instanceof VideoSelector)) {
            return;
        }
        VideoSelector selector = (VideoSelector) selectorObj;
        selector.currentGroupIndex = groupIndex;
        selector.currentFormats = formats;
        selector.currentSupports = supports;
        selector.nextTrackIndex = 0;
    }

    public static Object nextFormat(Object selectorObj) {
        if (!(selectorObj instanceof VideoSelector)) {
            return null;
        }
        VideoSelector selector = (VideoSelector) selectorObj;
        if (selector.currentFormats == null || selector.nextTrackIndex >= selector.currentFormats.length) {
            return null;
        }
        return selector.currentFormats[selector.nextTrackIndex++];
    }

    public static void recordCandidate(
            Object selectorObj,
            int width,
            int height,
            int bitrate
    ) {
        if (!(selectorObj instanceof VideoSelector)) {
            return;
        }
        VideoSelector selector = (VideoSelector) selectorObj;
        int trackIndex = selector.nextTrackIndex - 1;
        if (trackIndex < 0) {
            return;
        }
        int[] supports = selector.currentSupports;
        boolean supported = supports != null
                && trackIndex < supports.length
                && (supports[trackIndex] & FORMAT_HANDLED_MASK) == FORMAT_HANDLED;

        if (isBetter(selector, supported, width, height, bitrate)) {
            selector.hasBest = true;
            selector.bestGroupIndex = selector.currentGroupIndex;
            selector.bestTrackIndex = trackIndex;
            selector.bestSupported = supported;
            selector.bestWidth = width;
            selector.bestHeight = height;
            selector.bestBitrate = bitrate;
        }
    }

    public static List<Integer> finishVideoSelection(Object selectorObj, int currentGroupIndex) {
        if (!(selectorObj instanceof VideoSelector)) {
            return null;
        }
        VideoSelector selector = (VideoSelector) selectorObj;
        if (!selector.hasBest || selector.bestGroupIndex != currentGroupIndex || selector.bestTrackIndex < 0) {
            return null;
        }
        return Collections.singletonList(selector.bestTrackIndex);
    }

    public static void clearRendererSelections(
            Object trackSelections,
            int periodIndex,
            int rendererIndex
    ) {
        if (!(trackSelections instanceof List[][])) {
            return;
        }
        List<?>[][] matrix = (List<?>[][]) trackSelections;
        if (periodIndex < 0 || periodIndex >= matrix.length || matrix[periodIndex] == null) {
            return;
        }
        List<?>[] renderers = matrix[periodIndex];
        if (rendererIndex < 0 || rendererIndex >= renderers.length || renderers[rendererIndex] == null) {
            return;
        }
        renderers[rendererIndex].clear();
    }

    private static boolean isBetter(
            VideoSelector best,
            boolean supported,
            int width,
            int height,
            int bitrate
    ) {
        if (!best.hasBest) {
            return true;
        }
        if (supported != best.bestSupported) {
            return supported;
        }
        boolean candValidHeight = height > 0;
        boolean bestValidHeight = best.bestHeight > 0;
        if (candValidHeight != bestValidHeight) {
            return candValidHeight;
        }
        if (candValidHeight && best.targetHeight > 0) {
            int candTier = height == best.targetHeight ? 2 : (height < best.targetHeight ? 1 : 0);
            int bestTier = best.bestHeight == best.targetHeight ? 2 : (best.bestHeight < best.targetHeight ? 1 : 0);
            if (candTier != bestTier) {
                return candTier > bestTier;
            }
            if (height != best.bestHeight) {
                return candTier == 1 ? height > best.bestHeight : height < best.bestHeight;
            }
        } else if (candValidHeight && height != best.bestHeight) {
            return height > best.bestHeight;
        }
        if (bitrate != best.bestBitrate) {
            return bitrate > best.bestBitrate;
        }
        return width > best.bestWidth;
    }
}
