package com.travianpatch.notifier;

/**
 * Warns once when a village's net crop (the game's netCropProduction: production minus what buildings and
 * troops eat) goes below zero, and re-arms when it is back at zero or more. When the granary runs dry
 * with negative crop, the game starves troops. Pure logic (no Android APIs).
 */
final class CropWatch {

    enum Action { WARN, CLEAR, NONE }

    static final String TITLE = "Crop is running out";

    private CropWatch() {
    }

    static Action decide(boolean alreadyWarned, long netCropPerHour, long cropStock) {
        if (netCropPerHour < 0) {
            return alreadyWarned ? Action.NONE : Action.WARN;
        }
        return alreadyWarned ? Action.CLEAR : Action.NONE;
    }

    static String text(String village, long netCropPerHour, long cropStock) {
        String base = village + " uses more crop than it makes (" + netCropPerHour + " per hour).";
        if (cropStock <= 0) {
            return base + " The granary is empty: troops starve now.";
        }
        long hours = cropStock / Math.max(1, -netCropPerHour);
        return base + " The stock lasts about " + hours + " h, then troops starve.";
    }
}
