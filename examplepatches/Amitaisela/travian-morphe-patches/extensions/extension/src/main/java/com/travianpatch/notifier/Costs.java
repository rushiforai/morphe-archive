package com.travianpatch.notifier;

/** Short texts for resource amounts, shared by the screens and the queue notes. Pure logic. */
final class Costs {

    static final String WOOD = "🪵";
    static final String CLAY = "🧱";
    static final String IRON = "⛏";
    static final String CROP = "🌾";

    private Costs() {
    }

    /** e.g. "🪵110 🧱280 ⛏140 🌾165". */
    static String shortLine(long lumber, long clay, long iron, long crop) {
        return WOOD + lumber + " " + CLAY + clay + " " + IRON + iron + " " + CROP + crop;
    }

    /** "needs 80 more clay" (cost plus the buffer percent), or "" when the stock covers it. */
    static String missing(long haveL, long haveC, long haveI, long haveCr, long costL, long costC, long costI,
                          long costCr, int bufferPercent) {
        StringBuilder sb = new StringBuilder();
        add(sb, need(costL, bufferPercent) - haveL, "wood");
        add(sb, need(costC, bufferPercent) - haveC, "clay");
        add(sb, need(costI, bufferPercent) - haveI, "iron");
        add(sb, need(costCr, bufferPercent) - haveCr, "crop");
        return sb.length() == 0 ? "" : "needs " + sb;
    }

    private static long need(long cost, int bufferPercent) {
        return cost + (cost * bufferPercent) / 100; // same rounding as BuildQueueAutomation.affordable
    }

    private static void add(StringBuilder sb, long lack, String name) {
        if (lack > 0) {
            if (sb.length() > 0) {
                sb.append(", ");
            }
            sb.append(lack).append(" more ").append(name);
        }
    }
}
