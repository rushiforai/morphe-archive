package dev.twitchpatches.extension.ui;

import org.junit.Test;
import static org.junit.Assert.*;

public class UiInsetTypesTest {
    @Test public void fullscreenStatusOverrideRemovesTheCutoutButRetainsNavigationAndKeyboard() {
        assertEquals(526, UiInsetTypes.filter(655, true, false));
        assertEquals(2 | 4 | 8 | 512, UiInsetTypes.filter(655, true, false));
    }

    @Test public void navigationOverrideRetainsTheCutoutUntilTheStatusOverrideIsAlsoEnabled() {
        assertEquals(653, UiInsetTypes.filter(655, false, true));
        assertEquals(524, UiInsetTypes.filter(655, true, true));
    }

    @Test public void returningToTheHostLayoutRestoresAllInsetTypesAndPreservesUnknownTypes() {
        int types = 655 | 4096;
        assertEquals(526 | 4096, UiInsetTypes.filter(types, true, false));
        assertEquals(types, UiInsetTypes.filter(types, false, false));
    }
}
