package dev.jason.gboardpatches.extension.longpressquickactions;

import org.junit.Assert;
import org.junit.Test;

public final class GboardGlobeDrag1803AdapterTest {
    @Test
    public void syntheticMarkerEventsDoNotDependOnLazyChordSubtypeBinding() {
        Assert.assertFalse(GboardGlobeDrag1803Adapter.requiresEventSubtype(true, false));
        Assert.assertFalse(GboardGlobeDrag1803Adapter.requiresEventSubtype(false, true));
        Assert.assertTrue(GboardGlobeDrag1803Adapter.requiresEventSubtype(false, false));
    }

    @Test
    public void privateViewNamesNormalizeAtTheVersionAdapterSeam() {
        Assert.assertSame(GboardGlobeDragPhysicalSlotPolicy.ShortcutSlot.SELECT_ALL,
                GboardGlobeDrag1803Adapter.shortcutSlot("C01"));
        Assert.assertSame(GboardGlobeDragPhysicalSlotPolicy.ShortcutSlot.UNDO,
                GboardGlobeDrag1803Adapter.shortcutSlot("B01"));
        Assert.assertSame(GboardGlobeDragPhysicalSlotPolicy.ShortcutSlot.REDO,
                GboardGlobeDrag1803Adapter.shortcutSlot("D06"));
        Assert.assertNull(GboardGlobeDrag1803Adapter.shortcutSlot("C02"));
        Assert.assertNull(GboardGlobeDrag1803Adapter.shortcutSlot("B04_dup"));
    }

    @Test
    public void nonZhuyinTerminalDoesNotFallBackToSemanticLetterMapping() {
        Assert.assertNull(GboardGlobeDrag1803Adapter.resolveTerminalShortcut(
                false,
                GboardEditingShortcutPolicy.Shortcut.REDO,
                null));
        Assert.assertSame(GboardEditingShortcutPolicy.Shortcut.UNDO,
                GboardGlobeDrag1803Adapter.resolveTerminalShortcut(
                        false,
                        GboardEditingShortcutPolicy.Shortcut.REDO,
                        GboardEditingShortcutPolicy.Shortcut.UNDO));
        Assert.assertSame(GboardEditingShortcutPolicy.Shortcut.CUT,
                GboardGlobeDrag1803Adapter.resolveTerminalShortcut(
                        true,
                        GboardEditingShortcutPolicy.Shortcut.CUT,
                        GboardEditingShortcutPolicy.Shortcut.COPY));
    }
}
