package dev.jason.gboardpatches.extension.longpressquickactions;

import org.junit.Assert;
import org.junit.Test;

public final class GboardGlobeDragPhysicalSlotPolicyTest {
    private static final int ALPHABET_CARRIER = -10043;

    @Test
    public void mapsCyrillicLettersByReferencePosition() {
        assertSlot(GboardGlobeDragPhysicalSlotPolicy.ShortcutSlot.SELECT_ALL,
                "ф", GboardEditingShortcutPolicy.Shortcut.SELECT_ALL);
        assertSlot(GboardGlobeDragPhysicalSlotPolicy.ShortcutSlot.UNDO,
                "я", GboardEditingShortcutPolicy.Shortcut.UNDO);
        assertSlot(GboardGlobeDragPhysicalSlotPolicy.ShortcutSlot.CUT,
                "ч", GboardEditingShortcutPolicy.Shortcut.CUT);
        assertSlot(GboardGlobeDragPhysicalSlotPolicy.ShortcutSlot.COPY,
                "с", GboardEditingShortcutPolicy.Shortcut.COPY);
        assertSlot(GboardGlobeDragPhysicalSlotPolicy.ShortcutSlot.PASTE,
                "м", GboardEditingShortcutPolicy.Shortcut.PASTE);
        assertSlot(GboardGlobeDragPhysicalSlotPolicy.ShortcutSlot.REDO,
                "н", GboardEditingShortcutPolicy.Shortcut.REDO);
    }

    @Test
    public void qwertzKeepsUndoAndRedoAtPhysicalSlots() {
        Assert.assertSame(GboardEditingShortcutPolicy.Shortcut.UNDO,
                GboardGlobeDragPhysicalSlotPolicy.resolve(
                        GboardGlobeDragPhysicalSlotPolicy.ShortcutSlot.UNDO,
                        "y", ALPHABET_CARRIER, ALPHABET_CARRIER));
        Assert.assertSame(GboardEditingShortcutPolicy.Shortcut.REDO,
                GboardGlobeDragPhysicalSlotPolicy.resolve(
                        GboardGlobeDragPhysicalSlotPolicy.ShortcutSlot.REDO,
                        "z", ALPHABET_CARRIER, ALPHABET_CARRIER));
        Assert.assertSame(GboardEditingShortcutPolicy.Shortcut.UNDO,
                GboardGlobeDragPhysicalSlotPolicy.resolve(
                        GboardGlobeDragPhysicalSlotPolicy.ShortcutSlot.UNDO,
                        "Y", ALPHABET_CARRIER, ALPHABET_CARRIER));
    }

    @Test
    public void positiveCarriersAreNotAnAlphabetCapabilitySignal() {
        Assert.assertNull(GboardGlobeDragPhysicalSlotPolicy.resolve(
                GboardGlobeDragPhysicalSlotPolicy.ShortcutSlot.UNDO,
                "y", 53, ALPHABET_CARRIER));
        Assert.assertNull(GboardGlobeDragPhysicalSlotPolicy.resolve(
                GboardGlobeDragPhysicalSlotPolicy.ShortcutSlot.UNDO,
                "y", 54, ALPHABET_CARRIER));
        Assert.assertNull(GboardGlobeDragPhysicalSlotPolicy.resolve(
                GboardGlobeDragPhysicalSlotPolicy.ShortcutSlot.UNDO,
                "я", 53, ALPHABET_CARRIER));
    }

    @Test
    public void standardThreeRowAlphabetLayoutsShareTheSameSlots() {
        assertSlot(GboardGlobeDragPhysicalSlotPolicy.ShortcutSlot.SELECT_ALL,
                "a", GboardEditingShortcutPolicy.Shortcut.SELECT_ALL);
        assertSlot(GboardGlobeDragPhysicalSlotPolicy.ShortcutSlot.UNDO,
                "z", GboardEditingShortcutPolicy.Shortcut.UNDO);
        assertSlot(GboardGlobeDragPhysicalSlotPolicy.ShortcutSlot.CUT,
                "x", GboardEditingShortcutPolicy.Shortcut.CUT);
        assertSlot(GboardGlobeDragPhysicalSlotPolicy.ShortcutSlot.COPY,
                "c", GboardEditingShortcutPolicy.Shortcut.COPY);
        assertSlot(GboardGlobeDragPhysicalSlotPolicy.ShortcutSlot.PASTE,
                "v", GboardEditingShortcutPolicy.Shortcut.PASTE);
        assertSlot(GboardGlobeDragPhysicalSlotPolicy.ShortcutSlot.REDO,
                "y", GboardEditingShortcutPolicy.Shortcut.REDO);
    }

    @Test
    public void rejectsUnsupportedSlotsNonLettersAndUnknownCarriers() {
        Assert.assertNull(GboardGlobeDragPhysicalSlotPolicy.resolve(
                null, "м", ALPHABET_CARRIER, ALPHABET_CARRIER));
        Assert.assertNull(GboardGlobeDragPhysicalSlotPolicy.resolve(
                GboardGlobeDragPhysicalSlotPolicy.ShortcutSlot.PASTE,
                "@", ALPHABET_CARRIER, ALPHABET_CARRIER));
        Assert.assertNull(GboardGlobeDragPhysicalSlotPolicy.resolve(
                GboardGlobeDragPhysicalSlotPolicy.ShortcutSlot.PASTE,
                "м", 0, ALPHABET_CARRIER));
        Assert.assertNull(GboardGlobeDragPhysicalSlotPolicy.resolve(
                GboardGlobeDragPhysicalSlotPolicy.ShortcutSlot.PASTE,
                "m\u0301", ALPHABET_CARRIER, ALPHABET_CARRIER));
    }

    private static void assertSlot(GboardGlobeDragPhysicalSlotPolicy.ShortcutSlot slot,
            String letter,
            GboardEditingShortcutPolicy.Shortcut expected) {
        Assert.assertSame(expected,
                GboardGlobeDragPhysicalSlotPolicy.resolve(
                        slot, letter, ALPHABET_CARRIER, ALPHABET_CARRIER));
    }
}
