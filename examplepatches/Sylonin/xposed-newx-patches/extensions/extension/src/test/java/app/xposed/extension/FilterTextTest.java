package app.xposed.extension;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNull;

import org.junit.Test;

public class FilterTextTest {
    @Test
    public void foldingIgnoresCaseStyleAndEmojiSelectors() {
        assertEquals("bot", FilterText.fold("\uD835\uDC01\uD835\uDC0E\uD835\uDC13"));
        assertEquals("bot", FilterText.fold("\uFF22\uFF2F\uFF34"));
        assertEquals(FilterText.fold("\u2764"), FilterText.fold("\u2764\uFE0F"));
        assertEquals("\uD83D\uDEA8 news", FilterText.fold("\uD83D\uDEA8 NEWS"));
        assertEquals("", FilterText.term("   "));
    }

    @Test
    public void displayNameDigitsCountEveryScriptButNotOtherNumerals() {
        assertEquals(4, FilterText.decimalDigits("Alice 1990"));
        assertEquals(3, FilterText.decimalDigits("\uD835\uDFD9\uD835\uDFDA\uD835\uDFDB"));
        assertEquals(1, FilterText.decimalDigits("\u0663"));
        assertEquals(0, FilterText.decimalDigits("\u2460\u00b2"));
    }

    @Test
    public void handleDigitsNeedAValidHandle() {
        assertEquals(4, FilterText.handleDigits("alex1990"));
        assertEquals(5, FilterText.handleDigits("a1b2c3d4e5"));
        assertEquals(-1, FilterText.handleDigits("not-a-handle"));
        assertEquals(-1, FilterText.handleDigits("waytoolonghandle1"));
    }

    @Test
    public void handlesAreNormalized() {
        assertEquals("example", FilterText.handle(" @Example "));
        assertNull(FilterText.handle("Example Name"));
        assertNull(FilterText.handle("@"));
    }

    @Test
    public void languagesUsePrimaryCurrentCodes() {
        assertEquals("id", FilterText.language("in"));
        assertEquals("he", FilterText.language("iw"));
        assertEquals("zh", FilterText.language("zh-Hant"));
        assertEquals("pt", FilterText.language("PT_br"));
    }
}
