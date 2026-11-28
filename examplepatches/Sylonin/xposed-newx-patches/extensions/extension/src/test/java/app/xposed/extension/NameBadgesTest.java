package app.xposed.extension;

import static org.junit.Assert.assertEquals;

import org.junit.Test;

public class NameBadgesTest {
    private static final long SP = 0x100000000L;
    private static final long EM = 0x200000000L;

    private static long unit(long type, float value) {
        return type | (Float.floatToRawIntBits(value) & 0xFFFFFFFFL);
    }

    @Test
    public void inlineBadgeSizesScaleInTheirOwnUnit() {
        assertEquals(unit(SP, 40f), NameBadges.scaleTextUnit(unit(SP, 16f), 2.5f));
        assertEquals(unit(EM, 3f), NameBadges.scaleTextUnit(unit(EM, 1f), 3f));
    }

    @Test
    public void anUnspecifiedSizeStaysUnspecified() {
        long unspecified = unit(0, Float.NaN);
        assertEquals(unspecified, NameBadges.scaleTextUnit(unspecified, 2f));
    }
}
