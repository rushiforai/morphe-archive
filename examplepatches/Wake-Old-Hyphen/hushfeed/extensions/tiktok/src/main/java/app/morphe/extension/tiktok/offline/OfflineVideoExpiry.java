/*
 * Copyright 2026 Hushfeed contributors
 * https://github.com/SysAdminDoc/hushfeed
 */
package app.morphe.extension.tiktok.offline;

import java.util.concurrent.TimeUnit;

import app.morphe.extension.shared.diagnostics.HookStatus;
import app.morphe.extension.tiktok.settings.Settings;

/**
 * How long TikTok keeps a video in its offline list (#123).
 *
 * <p>TikTok works out one lifetime for every offline video: a low-storage figure in hours when the
 * phone is short on room, else a server figure in hours, else 48 hours when the offline page was
 * opened in the last two days and 90 days when it wasn't. Every query over the offline table
 * leaves out a row once {@code insert_time + lifetime} has passed, and the next start deletes
 * those rows and their files together. A list saved in one go therefore disappears in one go,
 * watched or not. The patch asks {@link #keepOfflineVideos()} in front of that calculation and,
 * when it says yes, hands TikTok {@link #keptLifetimeMs()} instead.
 *
 * <p>TikTok caches the answer per account for the life of the process, so the switch applies on
 * the next start.
 */
@SuppressWarnings("unused")
public final class OfflineVideoExpiry {
    /**
     * Ten years, which outlasts any phone, but stays well short of the epoch. TikTok also calls its
     * list stale when {@code now - lastRefresh} exceeds the lifetime, and a list that was never
     * filled has a last refresh of 0, so a lifetime longer than the time since 1970 would make an
     * empty list look fresh and keep TikTok from filling it. It also leaves the SQL sum
     * {@code insert_time + lifetime} far from overflowing a long.
     */
    public static final long KEPT_LIFETIME_MS = TimeUnit.DAYS.toMillis(3650);

    private OfflineVideoExpiry() {
    }

    /** Whether TikTok's own lifetime is replaced. Asked once per account per process. */
    public static boolean keepOfflineVideos() {
        boolean keep = Settings.KEEP_OFFLINE_VIDEOS.get();
        HookStatus.bound("offline video expiry", keep ? "kept until cleared" : "TikTok's lifetime");
        return keep;
    }

    /** The lifetime TikTok gets instead of its own while the switch is on. */
    public static long keptLifetimeMs() {
        return KEPT_LIFETIME_MS;
    }
}
