/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import java.util.Collections;
import java.util.Set;
import java.util.WeakHashMap;

import app.hushtelegram.extension.shared.Utils;
import app.hushtelegram.extension.shared.diagnostics.HookStatus;
import app.hushtelegram.extension.telegram.settings.FamilyNames;
import app.hushtelegram.extension.telegram.settings.Settings;

/**
 * Bigger stickers in the sticker panel, the one you pick stickers from below the message box, and
 * in its search results (#110). Telegram fits as many 72 dp columns as the panel is wide, makes each
 * sticker cell 82 dp tall and draws the sticker at most 66 dp across. With a bigger size picked, the
 * columns are that size instead and the cell's height and the sticker's size grow by the same
 * share, so a row holds fewer, bigger stickers. Search lays its results out with the panel's own
 * column count and cells, so it follows too.
 *
 * <p>The panel's cells are of a class Telegram also uses elsewhere (the masks sheet), so the panel
 * hands over each cell it makes and only those grow. The size is read each time Telegram asks, and
 * a chat's panel works out its columns when it's built, so a chat picks a new size up the next time
 * it's opened.
 */
public final class StickerPanel {
    private StickerPanel() {}

    /** Telegram's column width in dp, the size that leaves the panel as it ships. */
    public static final int TELEGRAM = 72;
    /** The column widths a person can pick, in dp: Telegram's, Large and Larger. */
    public static final int[] CHOICES = {TELEGRAM, 96, 120};

    static final String COLUMNS = "sticker panel columns resized";
    static final String CELL = "sticker panel cell resized";

    /** The panel's sticker cells, held weakly. Main thread only, like the panel. */
    private static final Set<Object> CELLS = Collections.newSetFromMap(new WeakHashMap<>());

    /**
     * Replaces the width the panel divides itself by to count its columns.
     *
     * @param width Telegram's column width, 72 dp in pixels
     * @return that width, or the picked one
     */
    public static int column(int width) {
        HookStatus.invoked(FamilyNames.CHANGE_STICKER_SIZE);
        int size = size();
        if (size == TELEGRAM) return width;
        HookStatus.counted(FamilyNames.CHANGE_STICKER_SIZE, COLUMNS);
        return scaled(width, size);
    }

    /** Called with each sticker cell the panel or its search makes. */
    public static void cell(Object cell) {
        if (cell != null) CELLS.add(cell);
    }

    /**
     * Replaces a sticker cell's height while it measures itself.
     *
     * @param cell the cell
     * @param height Telegram's height, 82 dp in pixels
     */
    public static int height(Object cell, int height) {
        return grown(cell, height);
    }

    /**
     * Replaces the largest a sticker cell draws its sticker.
     *
     * @param cell the cell
     * @param cap Telegram's largest, 66 dp in pixels
     */
    public static int cap(Object cell, int cap) {
        return grown(cell, cap);
    }

    /** [pixels] grown by the picked size's share for one of the panel's cells, as they are otherwise. */
    private static int grown(Object cell, int pixels) {
        if (cell == null || !CELLS.contains(cell)) return pixels;
        HookStatus.invoked(FamilyNames.CHANGE_STICKER_SIZE);
        int size = size();
        if (size == TELEGRAM) return pixels;
        HookStatus.counted(FamilyNames.CHANGE_STICKER_SIZE, CELL);
        return scaled(pixels, size);
    }

    /** [pixels] measured against Telegram's 72 dp columns, for columns [size] dp wide. */
    static int scaled(int pixels, int size) {
        return Math.round(pixels * (float) size / TELEGRAM);
    }

    /** A saved size that isn't one of {@link #CHOICES}, from an old or hand-edited store, reads as Telegram's. */
    public static int choice(int saved) {
        for (int choice : CHOICES) if (choice == saved) return saved;
        return TELEGRAM;
    }

    /** The picked column width, or Telegram's while paused, before settings load or when they can't be read. */
    static int size() {
        try {
            return Utils.settingsReady() ? choice(Settings.STICKER_PANEL_SIZE.get()) : TELEGRAM;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.CHANGE_STICKER_SIZE, "sticker panel size", failure);
            return TELEGRAM;
        }
    }
}
