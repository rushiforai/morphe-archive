package io.github.bakwudo.uyu.extension.channelpoints;

import android.os.SystemClock;

import java.util.Objects;

import io.github.bakwudo.uyu.extension.Utils;
import io.github.bakwudo.uyu.extension.settings.Settings;

@SuppressWarnings("unused")
public final class AutoClaimChannelPointsPatch {
    /**
     * The same bonus is offered again on every points update until it is claimed. A claim that
     * did not go through is retried after this delay.
     */
    private static final long RETRY_DELAY_MS = 30_000;

    private static String lastClaimId;
    private static long lastClaimTime;

    private static int lastLoggedBalance = -1;
    private static String lastLoggedClaimId;

    private AutoClaimChannelPointsPatch() {
    }

    /**
     * Injection point: the channel points data provider, on every points update it receives.
     *
     * @param balance Points balance on the current channel.
     * @param claimId Id of the bonus that can be claimed, or null if there is none.
     * @return true if the app should claim the bonus now.
     */
    public static synchronized boolean onPointsUpdate(int balance, String claimId) {
        if (balance != lastLoggedBalance || !Objects.equals(claimId, lastLoggedClaimId)) {
            lastLoggedBalance = balance;
            lastLoggedClaimId = claimId;
            Utils.logInfo("Channel points update: balance " + balance
                    + ", bonus " + (claimId == null ? "none" : claimId));
        }

        if (claimId == null || !Settings.AUTO_CLAIM_CHANNEL_POINTS.get()) return false;

        long now = SystemClock.elapsedRealtime();
        if (claimId.equals(lastClaimId) && now - lastClaimTime < RETRY_DELAY_MS) return false;

        lastClaimId = claimId;
        lastClaimTime = now;
        Utils.logInfo("Claiming channel points bonus " + claimId);
        return true;
    }
}
