package app.morphe.extension.mapsautomotive.patches;

import android.content.Context;

/**
 * A battery source polled by BydBatteryPatch's worker: the BYD SDK on DiLink 3
 * ({@link BydEnergyReader}) or the TS car adapter on DiLink 5 ({@link TsEnergyReader}).
 */
interface BydBatterySource {
    /** Returns a short status for the log. Never throws. */
    String init(Context context);

    boolean ready();

    /** One validated reading, or null if SOC, energy or odometer is unavailable. */
    BydEnergyReader.Sample read() throws Exception;
}
