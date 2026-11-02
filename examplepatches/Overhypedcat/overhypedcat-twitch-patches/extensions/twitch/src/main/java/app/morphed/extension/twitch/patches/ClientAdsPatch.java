package app.morphed.extension.twitch.patches;

import java.util.Set;

import app.morphed.extension.twitch.adblock.Problem;

/**
 * Runs at the end of the app's check for reasons not to play a client-side ad. Adding a reason makes
 * the viewer ineligible, so the app never starts an ad it plays itself.
 */
@SuppressWarnings("unused")
public final class ClientAdsPatch {
    static final String TURBO = "VAST_AD_INELIGIBLE_TURBO";

    /** Set once the full check reports back; until then the message falls back to the partial reasons. */
    private static volatile boolean fullCheckSeen;

    private ClientAdsPatch() {
    }

    /** Adds the Turbo reason to {@code reasons}; {@code reasonType} is the app's obfuscated reasons enum. */
    @SuppressWarnings({"unchecked", "rawtypes"})
    public static void markIneligible(Set reasons, Class reasonType) {
        try {
            Object reason = turboReason(reasonType);
            if (reason == null) {
                StreamAdsPatch.PROBLEMS.report(Problem.CLIENT_ADS_NOT_BLOCKED, "no reasons in " + reasonType);
                return;
            }
            boolean noOtherReason = reasons.isEmpty();
            reasons.add(reason);
            StreamAdsPatch.LOGGER.log("Client-side ad check: answered ineligible (" + reason + ")");
            // Without the full check's result, only these few reasons are known.
            if (!fullCheckSeen && noOtherReason) StreamAdsPatch.adBlocked();
        } catch (Throwable t) {
            StreamAdsPatch.PROBLEMS.report(Problem.CLIENT_ADS_NOT_BLOCKED, t.toString());
        }
    }

    /**
     * The result of the app's full eligibility check (channel, spacing, subscription, ... and the
     * reasons above). Only our Turbo reason in it means an ad was really due and is now blocked.
     */
    public static void onEligibilityDecided(Object result) {
        try {
            if (!(result instanceof Set)) return;
            Set<?> reasons = (Set<?>) result;
            if (!containsTurboReason(reasons)) return;
            fullCheckSeen = true;
            boolean adWasDue = reasons.size() == 1;
            StreamAdsPatch.LOGGER.log("Client-side ad check result: " + reasons + (adWasDue ? ", an ad was due" : ""));
            if (adWasDue) StreamAdsPatch.adBlocked();
        } catch (Throwable t) {
            StreamAdsPatch.LOGGER.log("Client-side ad check result unreadable: " + t);
        }
    }

    static boolean containsTurboReason(Set<?> reasons) {
        for (Object reason : reasons) {
            if (reason instanceof Enum && TURBO.equals(((Enum<?>) reason).name())) return true;
        }
        return false;
    }

    /** The Turbo reason, or else any reason of the enum: any reason at all means no ad. */
    @SuppressWarnings({"unchecked", "rawtypes"})
    static Object turboReason(Class reasonType) {
        if (reasonType == null || !reasonType.isEnum()) return null;
        try {
            return Enum.valueOf(reasonType, TURBO);
        } catch (IllegalArgumentException renamed) {
            Object[] all = reasonType.getEnumConstants();
            return all == null || all.length == 0 ? null : all[0];
        }
    }
}
