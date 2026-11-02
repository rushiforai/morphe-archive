package app.morphe.extension.mapsautomotive.patches;

/**
 * Where a reading sits inside its whole percent of SOC. BYD reports whole percents and the BMS energy
 * in 100 Wh steps. The capacity sent to Maps is energy × 100 / (SOC + fraction), so Maps' percentage is
 * SOC + fraction, and Maps, which floors, shows the dashboard's whole percent for any fraction below 1.
 * With the midpoint for every reading, Maps' percentage stays put through a whole percent while the
 * energy falls, so its battery on arrival climbs about one point through each percent and drops back
 * at each dashboard step.
 * <p>
 * A step seen between two readings 10 s apart marks an edge of the new percent: entered from above (a
 * drop), its top; from below (charging or regeneration), its bottom. The energy moved since that edge,
 * against the energy of one percent, gives the fraction. Without such a step for the current percent,
 * or when the energy has moved too far from it to be the same percent, the fraction is the midpoint.
 * One instance per reader thread.
 */
final class BydSocFraction {
    static final double MIDPOINT = 0.5;
    /** Kept inside the percent, so that Maps' floored percentage stays the dashboard's. */
    static final double MIN = 0.05, MAX = 0.95;
    // A percent whose energy is outside these is a misreading of the energy per percent.
    private static final double MIN_WH_PER_PERCENT = 200, MAX_WH_PER_PERCENT = 1500;

    // The last step: the whole percent entered (-1: none), the energy of its first reading, the direction.
    private int soc = -1, entryWh;
    private boolean fromAbove;

    /** A step saved before; a negative SOC is none. */
    void restore(int soc, int entryWh, boolean fromAbove) {
        this.soc = soc < 0 ? -1 : soc;
        this.entryWh = entryWh;
        this.fromAbove = fromAbove;
    }

    /**
     * Records a step of one whole percent since the previous reading, which must be the one just before
     * (NaN otherwise). Returns whether there was one, for the caller to save it.
     */
    boolean observe(double previousSoc, double soc, int energyWh) {
        if (Double.isNaN(previousSoc) || !whole(previousSoc) || !whole(soc)) return false;
        double change = soc - previousSoc;
        if (change != 1 && change != -1) return false;
        this.soc = (int) soc;
        entryWh = energyWh;
        fromAbove = change < 0;
        return true;
    }

    /**
     * The fraction for a reading with this energy, given the energy of one percent; NaN without a
     * usable step, where the caller uses the midpoint.
     */
    double fraction(double soc, int energyWh, double whPerPercent) {
        if (this.soc < 0 || !whole(soc) || (int) soc != this.soc) return Double.NaN;
        if (!(whPerPercent >= MIN_WH_PER_PERCENT && whPerPercent <= MAX_WH_PER_PERCENT)) return Double.NaN;
        // Energy moved into the percent from the edge it was entered at.
        double moved = (fromAbove ? entryWh - energyWh : energyWh - entryWh) / whPerPercent;
        // Half a percent the wrong way or more than one and a half: no longer the percent that was entered.
        if (moved < -0.5 || moved > 1.5) return Double.NaN;
        double fraction = fromAbove ? 1 - moved : moved;
        return Math.max(MIN, Math.min(MAX, fraction));
    }

    int soc() { return soc; }
    int entryWh() { return entryWh; }
    boolean fromAbove() { return fromAbove; }

    private static boolean whole(double soc) {
        return soc == Math.rint(soc);
    }
}
