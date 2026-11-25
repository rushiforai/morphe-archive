package app.voidhack.extension.applemusic.lyrics;

/**
 * Bridge implemented by {@code PlayerLyricsViewFragment} via {@code LyricsScrollSyncPatch}
 * so scroll/sync recovery logic avoids runtime reflection on obfuscated Apple Music members.
 */
public interface LyricsScrollHost {
    boolean voidhackIsSyncedLyrics();

    boolean voidhackIsPlaying();

    long voidhackPlaybackPositionMs();

    boolean voidhackIsUiActive();

    int voidhackScrollState();

    int voidhackFirstVisiblePosition();

    int voidhackLastVisiblePosition();

    int voidhackActiveLineStart();

    int voidhackActiveLineEnd();

    boolean voidhackIsScrolledAway();

    boolean voidhackIsSharePending();

    boolean voidhackIsPossibleShare();

    void voidhackClearSharePending();

    void voidhackClearShareLock();

    void voidhackSetScrolledAway(boolean scrolledAway);

    void voidhackSetForceSync(boolean forceSync);

    void voidhackSnapToSyncedPosition(int adapterPosition, int activeLineEnd, boolean setForceSync);

    void voidhackEnsureLyricsTimerRunning();

    int voidhackLineToAdapterPosition(int lineIndex);

    int voidhackAdapterItemCount();

    int voidhackAdapterItemViewType(int position);

    int voidhackPlaybackLineIndex();

    boolean voidhackIsAlignedNearTop(int adapterPosition);
}
