/*
 * Copyright 2026 HushThreads contributors
 * https://github.com/SysAdminDoc/HushThreads
 */
package app.morphe.extension.hushthreads.misc;

import app.morphe.extension.hushthreads.settings.FamilyNames;
import app.morphe.extension.hushthreads.settings.Settings;
import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.Utils;
import app.morphe.extension.shared.diagnostics.HookStatus;
import app.morphe.extension.shared.settings.Setting;

/**
 * What the Spoof SIM region patch hands Threads in place of what the phone says about its SIM and
 * network.
 *
 * <p>The patch puts a call here right after each of Threads' reads of TelephonyManager's country,
 * network code (MCC and MNC together) and carrier name, for the SIM and the network alike, of the
 * same on each SubscriptionInfo, and of a cell's MCC, MNC and operator name. Threads' own value
 * comes in, and with the switch on the chosen region's goes back: its country, a network code of one
 * of its carriers and that carrier's name, so they agree the way a real SIM's do ({@link SimRegions}).
 *
 * <p>Off, paused, before the settings are ready, a stored region that isn't in the list, or a
 * failure in here, and Threads gets what the phone said.
 *
 * <p>This is only what the phone tells Threads about its SIM. Meta also goes by the connection's
 * address and the account itself, so where a profile shows it's based isn't decided here.
 */
public final class SimRegion {
    static final String SPOOFED = "answered the chosen region";
    /** Prefix for a refusal's count label; one label per fixed reason from offBecause(). */
    static final String LEFT_TO_THREADS = "left the SIM to Threads: ";
    /** TelephonyManager.UNKNOWN_CARRIER_ID. */
    static final int UNKNOWN_CARRIER_ID = -1;
    /** The outcome last logged, so a log line marks a change. */
    private static volatile String lastLogged;

    private SimRegion() { }

    /** After getSimCountryIso and getNetworkCountryIso: the region's country code, lower case. */
    public static String countryIso(String real) {
        SimRegions.Region region = chosen("country");
        return region == null ? real : region.iso;
    }

    /** After getSimOperator and getNetworkOperator: the region's MCC and MNC together. */
    public static String operator(String real) {
        SimRegions.Region region = chosen("network code");
        return region == null ? real : region.mccMnc;
    }

    /** After getSimOperatorName and getNetworkOperatorName: the region's carrier. */
    public static String operatorName(String real) {
        SimRegions.Region region = chosen("carrier");
        return region == null ? real : region.carrier;
    }

    /** After a SIM's or a cell's getMccString: the region's first three digits. */
    public static String mcc(String real) {
        SimRegions.Region region = chosen("MCC");
        return region == null ? real : region.mccMnc.substring(0, 3);
    }

    /** After a SIM's or a cell's getMncString: the region's digits after the first three. */
    public static String mnc(String real) {
        SimRegions.Region region = chosen("MNC");
        return region == null ? real : region.mccMnc.substring(3);
    }

    /** After a SIM's or a cell's getMcc: the region's first three digits as a number. */
    public static int mccNumber(int real) {
        SimRegions.Region region = chosen("MCC number");
        return region == null ? real : Integer.parseInt(region.mccMnc.substring(0, 3));
    }

    /** After a SIM's or a cell's getMnc: the region's digits after the first three as a number. */
    public static int mncNumber(int real) {
        SimRegions.Region region = chosen("MNC number");
        return region == null ? real : Integer.parseInt(region.mccMnc.substring(3));
    }

    /** After a SIM's carrier or display name, the carrier id's name, or a cell's operator name: the region's carrier. */
    public static CharSequence carrierLabel(CharSequence real) {
        SimRegions.Region region = chosen("carrier label");
        return region == null ? real : region.carrier;
    }

    /**
     * After getSimCarrierId: unknown, which is what a phone answers when Android's carrier list has
     * no entry for its SIM. The id is Android's own number for the real carrier, so it can't be
     * left to say who that is.
     */
    public static int carrierId(int real) {
        return chosen("carrier id") == null ? real : UNKNOWN_CARRIER_ID;
    }

    /** The region to answer with, or null to leave Threads' own value. Never throws. */
    private static SimRegions.Region chosen(String hook) {
        try {
            HookStatus.invoked(FamilyNames.SPOOF_SIM_REGION);
            String off = offBecause();
            SimRegions.Region region = off == null ? SimRegions.find(SimRegions.REGION.get()) : null;
            if (off == null && region == null) off = "unknown region";
            HookStatus.counted(FamilyNames.SPOOF_SIM_REGION, off == null ? SPOOFED : LEFT_TO_THREADS + off);
            String outcome = off == null
                    ? "Threads sees a SIM in " + region.iso + " (" + region.mccMnc + ", " + region.carrier + ")"
                    : "Threads sees the phone's own SIM, " + off;
            if (!outcome.equals(lastLogged)) {
                lastLogged = outcome;
                Logger.printDebug(() -> "SIM region: " + outcome);
            }
            return region;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.SPOOF_SIM_REGION, hook, failure);
            return null;
        }
    }

    /** Why the switch doesn't apply now, or null when it's on. Reads no setting before they're ready. */
    private static String offBecause() {
        if (!Utils.settingsReady()) return "settings not ready";
        if (!Settings.SPOOF_SIM_REGION.get()) return Setting.isPaused() ? "HushThreads paused" : "switch off";
        return null;
    }
}
