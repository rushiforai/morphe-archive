package dev.jason.gboardpatches.extension.featureflags;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import java.util.EnumMap;

import org.junit.Test;

public final class GboardMultipleSmartSuggestionsRuntimeTest {
    private enum Category {
        AUTO_FILL,
        CLIPBOARD,
        UNDO,
        OCR
    }

    @Test
    public void removesOnlyUndoCategory() {
        EnumMap<Category, String> categories = new EnumMap<>(Category.class);
        categories.put(Category.AUTO_FILL, "password");
        categories.put(Category.CLIPBOARD, "paste");
        categories.put(Category.UNDO, "undo-redo");
        categories.put(Category.OCR, "scan text");

        GboardMultipleSmartSuggestionsRuntime.removeUndoCategory(categories);

        assertEquals(3, categories.size());
        assertFalse(categories.containsKey(Category.UNDO));
        assertTrue(categories.containsKey(Category.AUTO_FILL));
        assertTrue(categories.containsKey(Category.CLIPBOARD));
        assertTrue(categories.containsKey(Category.OCR));
    }

    @Test
    public void ignoresNullAndNonMapInputs() {
        GboardMultipleSmartSuggestionsRuntime.removeUndoCategory(null);
        GboardMultipleSmartSuggestionsRuntime.removeUndoCategory("UNDO");
    }
}
