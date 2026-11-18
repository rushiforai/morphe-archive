package id.ikuradachi.kageroll.extension.crunchyroll;

import java.util.HashSet;
import java.util.Set;

/**
 * Coordinates player segment auto-skipping across SkipSegmentButtonViewModelImpl
 * and FloatingPlayerPlaybackController flow mappers.
 */
public final class AutoSkipHelper {

    public static final int MASK_INTRO = 1;
    public static final int MASK_RECAP = 1 << 1;
    public static final int MASK_CREDITS = 1 << 2;
    public static final int MASK_PREVIEW = 1 << 3;
    public static final int MASK_PROMO = 1 << 4;

    private static final long MIN_REMAINING_MS = 1000L;

    private static final Object LOCK = new Object();
    private static String lastSessionKey;
    private static final Set<String> skippedTypesForSession = new HashSet<>();
    private static final ThreadLocal<Object> pendingViewModel = new ThreadLocal<>();

    private AutoSkipHelper() {
    }

    /**
     * Returns the bitmask of enabled segment types. Patched at build time by AutoSkipPatch.
     */
    public static int getEnabledSegmentMask() {
        return 0;
    }

    /**
     * Checks whether the current segment should be auto-skipped for this playback session.
     * Records the ViewModel as pending for {@link #consumePendingAutoSkip(Object)} when returning true.
     */
    public static boolean tryPrepareAutoSkip(
            Object viewModel,
            String videoId,
            String typeName,
            long remainingMs
    ) {
        pendingViewModel.remove();
        if (viewModel == null || typeName == null) {
            return false;
        }

        int bit = segmentBit(typeName);
        if (bit == 0 || (getEnabledSegmentMask() & bit) == 0) {
            return false;
        }

        if (remainingMs < MIN_REMAINING_MS) {
            return false;
        }

        String sessionKey = System.identityHashCode(viewModel) + ":" + (videoId != null ? videoId : "");
        synchronized (LOCK) {
            if (!sessionKey.equals(lastSessionKey)) {
                lastSessionKey = sessionKey;
                skippedTypesForSession.clear();
            }
            if (!skippedTypesForSession.add(typeName)) {
                return false;
            }
        }

        pendingViewModel.set(viewModel);
        return true;
    }

    /**
     * Consumes the pending auto-skip flag for the given ViewModel on the current thread.
     */
    public static boolean consumePendingAutoSkip(Object viewModel) {
        Object pending = pendingViewModel.get();
        pendingViewModel.remove();
        return viewModel != null && pending == viewModel;
    }

    private static int segmentBit(String typeName) {
        switch (typeName) {
            case "INTRO":
                return MASK_INTRO;
            case "RECAP":
                return MASK_RECAP;
            case "CREDITS":
                return MASK_CREDITS;
            case "PREVIEW":
                return MASK_PREVIEW;
            case "PROMO":
                return MASK_PROMO;
            default:
                return 0;
        }
    }
}
