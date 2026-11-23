package nl.johninnl.eclipse.auto;

/**
 * Pure lifetime policy for the application-owned playback link, independent of screens: the link
 * is kept while a car screen is attached, while playback is ongoing, for a short time after a
 * play request and for five minutes after a pause. State numbers are PlaybackState's.
 */
final class PlaybackLease {
    static boolean ongoing(int state) {
        return state == 3 || state == 6 || state == 8 || state == 4 || state == 5 || state == 9 || state == 10 || state == 11;
    }

    static boolean retain(int state, boolean ui, long pausedRemaining, long requestRemaining) {
        return ui || ongoing(state) || state != 7 && requestRemaining > 0 || state == 2 && pausedRemaining > 0;
    }

    private PlaybackLease() { }
}
