package io.github.sabopura.morphe.extension.twitch.ads;

import java.util.function.LongSupplier;

/**
 * Decides, for each refresh of a live media playlist, whether the player gets the original
 * session or the ad-free backup. Network access is supplied by the caller.
 */
final class StreamSwitch {
    /** Fetches the backup's matching media playlist, or returns null if none is clean. */
    interface Backup {
        String cleanPlaylist();
    }

    /** What happened, for counting and logging. An ad break is SWITCHED_TO_BACKUP at most once. */
    enum Outcome { ORIGINAL, SWITCHED_TO_BACKUP, ON_BACKUP, BACK_TO_ORIGINAL, AD_KEPT }

    /**
     * How old the last backup playlist may be to stand in for one that could not be loaded, about
     * one slow refresh. Handing the ad back instead would restart the player's numbering at the ad's.
     */
    static final long HOLD_MS = 8000;

    private final LongSupplier clock;
    private boolean onBackup;
    private boolean replacedThisBreak;
    private String held;
    private long heldAt;
    private Outcome last = Outcome.ORIGINAL;

    StreamSwitch() {
        this(System::currentTimeMillis);
    }

    StreamSwitch(LongSupplier clock) {
        this.clock = clock;
    }

    Outcome lastOutcome() {
        return last;
    }

    /** The playlist to give the player for this refresh of the original session. */
    String choose(String original, Backup backup) {
        boolean ad = Playlists.hasStitchedAd(original);
        if (!ad && (!onBackup || Playlists.isLive(original))) {
            // A clean original is used again only once it carries live sequence numbers, so the
            // player's numbering continues from the backup without a jump.
            return original(onBackup ? Outcome.BACK_TO_ORIGINAL : Outcome.ORIGINAL, original, false);
        }
        String clean = backup.cleanPlaylist();
        if (clean != null) {
            last = replacedThisBreak ? Outcome.ON_BACKUP : Outcome.SWITCHED_TO_BACKUP;
            onBackup = true;
            replacedThisBreak = true;
            held = Playlists.prepare(clean);
            heldAt = clock.getAsLong();
            return held;
        }
        if (ad && onBackup && clock.getAsLong() - heldAt <= HOLD_MS) {
            last = Outcome.ON_BACKUP;
            return held;
        }
        // No backup now: the original is still the best there is, ad or not.
        return original(ad ? Outcome.AD_KEPT : Outcome.BACK_TO_ORIGINAL, original, ad);
    }

    private String original(Outcome outcome, String original, boolean ad) {
        last = outcome;
        onBackup = false;
        held = null;
        if (!ad) replacedThisBreak = false;
        return Playlists.prepare(original);
    }
}
