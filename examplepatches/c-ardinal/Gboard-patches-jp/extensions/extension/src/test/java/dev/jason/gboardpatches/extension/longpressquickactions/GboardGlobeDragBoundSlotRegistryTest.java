package dev.jason.gboardpatches.extension.longpressquickactions;

import org.junit.Assert;
import org.junit.Test;

public final class GboardGlobeDragBoundSlotRegistryTest {
    private static final int ALPHABET_CARRIER = -10043;

    @Test
    public void boundCyrillicSlotResolvesWhenTerminalArrivesWithoutPointerOwner() {
        GboardGlobeDragBoundSlotRegistry registry = new GboardGlobeDragBoundSlotRegistry();
        Object metadata = new Object();
        registry.observe(metadata,
                GboardGlobeDragPhysicalSlotPolicy.ShortcutSlot.SELECT_ALL,
                100, "ф", ALPHABET_CARRIER, ALPHABET_CARRIER);

        Assert.assertSame(GboardEditingShortcutPolicy.Shortcut.SELECT_ALL,
                registry.resolve(
                        metadata, 100, "ф", ALPHABET_CARRIER, ALPHABET_CARRIER));
    }

    @Test
    public void latestPhysicalBindWinsForAReusedKeyIdentity() {
        GboardGlobeDragBoundSlotRegistry registry = new GboardGlobeDragBoundSlotRegistry();
        Object metadata = new Object();
        registry.observe(metadata,
                GboardGlobeDragPhysicalSlotPolicy.ShortcutSlot.UNDO,
                101, "y", ALPHABET_CARRIER, ALPHABET_CARRIER);
        Assert.assertSame(GboardEditingShortcutPolicy.Shortcut.UNDO,
                registry.resolve(
                        metadata, 101, "y", ALPHABET_CARRIER, ALPHABET_CARRIER));

        registry.observe(metadata,
                GboardGlobeDragPhysicalSlotPolicy.ShortcutSlot.REDO,
                101, "y", ALPHABET_CARRIER, ALPHABET_CARRIER);

        Assert.assertSame(GboardEditingShortcutPolicy.Shortcut.REDO,
                registry.resolve(
                        metadata, 101, "y", ALPHABET_CARRIER, ALPHABET_CARRIER));
    }

    @Test
    public void latestUnsupportedBindInvalidatesAStalePhysicalSlot() {
        GboardGlobeDragBoundSlotRegistry registry = new GboardGlobeDragBoundSlotRegistry();
        Object metadata = new Object();
        registry.observe(metadata,
                GboardGlobeDragPhysicalSlotPolicy.ShortcutSlot.SELECT_ALL,
                102, "ф", ALPHABET_CARRIER, ALPHABET_CARRIER);
        Assert.assertSame(GboardEditingShortcutPolicy.Shortcut.SELECT_ALL,
                registry.resolve(
                        metadata, 102, "ф", ALPHABET_CARRIER, ALPHABET_CARRIER));

        registry.observe(metadata, null,
                102, "ф", ALPHABET_CARRIER, ALPHABET_CARRIER);

        Assert.assertNull(registry.resolve(
                metadata, 102, "ф", ALPHABET_CARRIER, ALPHABET_CARRIER));
    }

    @Test
    public void identicalKeyTextAcrossLayoutsKeepsMetadataSpecificSlots() {
        GboardGlobeDragBoundSlotRegistry registry = new GboardGlobeDragBoundSlotRegistry();
        Object englishY = new Object();
        Object germanY = new Object();
        registry.observe(englishY,
                GboardGlobeDragPhysicalSlotPolicy.ShortcutSlot.REDO,
                103, "y", ALPHABET_CARRIER, ALPHABET_CARRIER);
        registry.observe(germanY,
                GboardGlobeDragPhysicalSlotPolicy.ShortcutSlot.UNDO,
                103, "y", ALPHABET_CARRIER, ALPHABET_CARRIER);

        Assert.assertSame(GboardEditingShortcutPolicy.Shortcut.REDO,
                registry.resolve(
                        englishY, 103, "y", ALPHABET_CARRIER, ALPHABET_CARRIER));
        Assert.assertSame(GboardEditingShortcutPolicy.Shortcut.UNDO,
                registry.resolve(
                        germanY, 103, "y", ALPHABET_CARRIER, ALPHABET_CARRIER));
    }

    @Test
    public void clonedMetadataUsesOnlyAnUnambiguousPhysicalSlot() {
        GboardGlobeDragBoundSlotRegistry registry = new GboardGlobeDragBoundSlotRegistry();
        Object boundMetadata = new Object();
        Object terminalClone = new Object();
        registry.observe(boundMetadata,
                GboardGlobeDragPhysicalSlotPolicy.ShortcutSlot.SELECT_ALL,
                100, "a", ALPHABET_CARRIER, ALPHABET_CARRIER);

        Assert.assertSame(GboardGlobeDragPhysicalSlotPolicy.ShortcutSlot.SELECT_ALL,
                registry.resolveSlot(
                        terminalClone,
                        100,
                        "a",
                        ALPHABET_CARRIER,
                        ALPHABET_CARRIER));

        Object conflictingMetadata = new Object();
        registry.observe(conflictingMetadata,
                GboardGlobeDragPhysicalSlotPolicy.ShortcutSlot.COPY,
                100, "a", ALPHABET_CARRIER, ALPHABET_CARRIER);
        Assert.assertNull(registry.resolveSlot(
                terminalClone,
                100,
                "a",
                ALPHABET_CARRIER,
                ALPHABET_CARRIER));
    }

    @Test
    public void unsupportedDuplicateSlotBlocksMatchingFallback() {
        GboardGlobeDragBoundSlotRegistry registry = new GboardGlobeDragBoundSlotRegistry();
        Object canonicalMetadata = new Object();
        Object duplicateMetadata = new Object();
        Object terminalClone = new Object();
        registry.observe(canonicalMetadata,
                GboardGlobeDragPhysicalSlotPolicy.ShortcutSlot.PASTE,
                104, "м", ALPHABET_CARRIER, ALPHABET_CARRIER);
        registry.observe(duplicateMetadata, null,
                104, "м", ALPHABET_CARRIER, ALPHABET_CARRIER);

        Assert.assertNull(registry.resolveSlot(
                duplicateMetadata,
                104,
                "м",
                ALPHABET_CARRIER,
                ALPHABET_CARRIER));
        Assert.assertNull(registry.resolveSlot(
                terminalClone,
                104,
                "м",
                ALPHABET_CARRIER,
                ALPHABET_CARRIER));
    }

    @Test
    public void mismatchedIdentityAndUnsupportedBindFailClosed() {
        GboardGlobeDragBoundSlotRegistry registry = new GboardGlobeDragBoundSlotRegistry();
        Object unsupported = new Object();
        registry.observe(unsupported, null,
                104, "м", ALPHABET_CARRIER, ALPHABET_CARRIER);
        Assert.assertNull(registry.resolve(
                unsupported, 104, "м", ALPHABET_CARRIER, ALPHABET_CARRIER));

        Object bound = new Object();
        registry.observe(bound,
                GboardGlobeDragPhysicalSlotPolicy.ShortcutSlot.PASTE,
                105, "м", ALPHABET_CARRIER, ALPHABET_CARRIER);
        Assert.assertNull(registry.resolveSlot(
                bound, 105, "м", 53, ALPHABET_CARRIER));
        Assert.assertNull(registry.resolve(
                new Object(), 106, "м", ALPHABET_CARRIER, ALPHABET_CARRIER));
        Assert.assertNull(registry.resolve(
                bound, 105, "в", ALPHABET_CARRIER, ALPHABET_CARRIER));
    }

    @Test
    public void sharedIndexSurvivesAdapterScopedReferences() {
        GboardGlobeDragBoundSlotRegistry first =
                GboardGlobeDragBoundSlotRegistry.shared();
        Object metadata = new Object();
        first.observe(metadata,
                GboardGlobeDragPhysicalSlotPolicy.ShortcutSlot.SELECT_ALL,
                107, "ф", ALPHABET_CARRIER, ALPHABET_CARRIER);

        GboardGlobeDragBoundSlotRegistry recreatedAdapterIndex =
                GboardGlobeDragBoundSlotRegistry.shared();

        Assert.assertSame(first, recreatedAdapterIndex);
        Assert.assertSame(GboardEditingShortcutPolicy.Shortcut.SELECT_ALL,
                recreatedAdapterIndex.resolve(
                        metadata, 107, "ф", ALPHABET_CARRIER, ALPHABET_CARRIER));
    }
}
