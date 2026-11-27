package app.ayham.extension.music.features;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;

import java.util.Arrays;

import org.junit.Test;

public class ArtMeshGlareTest {

    private static int[] fill(int argb, int n) {
        int[] px = new int[n];
        Arrays.fill(px, argb);
        return px;
    }

    @Test
    public void aDarkOrMidCoverGetsNoExtraBlack() {
        assertEquals(0, ArtMesh.glare(fill(0xFF101010, 400)));
        assertEquals(0, ArtMesh.glare(fill(0xFF808080, 400)));
        assertEquals(0, ArtMesh.glare(new int[0]));
    }

    @Test
    public void aNearWhiteCoverIsBroughtDownToTheCap() {
        int a = ArtMesh.glare(fill(0xFFF0F0F0, 400));
        // 240 * (1 - a/255) lands on the cap
        assertEquals(ArtMesh.GLARE_CAP, Math.round(240 * (1 - a / 255f)));
    }

    @Test
    public void theBrightTenthDecidesNotTheMean() {
        int[] px = fill(0xFF000000, 100);
        for (int i = 0; i < 15; i++) px[i] = 0xFFFFFFFF; // 15% white on black
        assertTrue(ArtMesh.glare(px) > 100);
        for (int i = 0; i < 15; i++) px[i] = i < 5 ? 0xFFFFFFFF : 0xFF000000; // 5%: a highlight
        assertEquals(0, ArtMesh.glare(px));
    }
}
