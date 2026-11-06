package ricardonemlopot.nemlopot.patches;

import com.badlogic.gdx.math.Vector3;
import com.badlogic.gdx.physics.box2d.Fixture;
import com.badlogic.gdx.utils.Array;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import ricardonemlopot.nemlopot.rube.RubeLoaderTest;
import ricardonemlopot.nemlopot.rube.RubeScene;
import static org.junit.Assert.*;

public class TuningBalanceButtonTest {
    private final HitFixture fixture = new HitFixture();

    @Before public void enterTuning() {
        RubeLoaderTest.loaded = true;
        RubeLoaderTest.exitErrorEllen = false; // Original game's fresh-launch value.
        RubeLoaderTest.menuX = 0;
        RubeLoaderTest.menuY = -29.3f;
        RubeLoaderTest.t = new Vector3();
        RubeLoaderTest.t.x = -19;
        RubeLoaderTest.t.y = -32;
        TuningBalanceButton.bind(scene(fixture));
    }

    @After public void disposeWorld() {
        TuningBalanceButton.clear();
        RubeLoaderTest.loaded = false;
        RubeLoaderTest.t = null;
    }

    @Test public void usesTheGamesWorldCoordinatesForHitTesting() {
        assertTrue(TuningBalanceButton.hit(0));
        assertEquals(-19f, fixture.lastX, 0f);
        assertEquals(-32f, fixture.lastY, 0f);
        RubeLoaderTest.t.x = 10;
        assertFalse(TuningBalanceButton.hit(0));
    }

    @Test public void ignoresCarTrackAndChallengeScreens() {
        RubeLoaderTest.menuY = 0;
        assertFalse(TuningBalanceButton.hit(0));
        RubeLoaderTest.menuY = -65;
        assertFalse(TuningBalanceButton.hit(0));
        RubeLoaderTest.menuY = -29.3f;
        RubeLoaderTest.menuX = -60;
        assertFalse(TuningBalanceButton.hit(0));
        assertEquals(0, fixture.calls);
    }

    @Test public void worksBeforeAndAfterTheGamesExitFlagChanges() {
        assertTrue(TuningBalanceButton.hit(0));
        RubeLoaderTest.exitErrorEllen = true;
        assertTrue(TuningBalanceButton.hit(0));
        RubeLoaderTest.exitErrorEllen = false;
        assertTrue(TuningBalanceButton.hit(0));
    }

    @Test public void ignoresMultitouchLoadingAndMissingCoordinates() {
        assertFalse(TuningBalanceButton.hit(1));
        RubeLoaderTest.loaded = false;
        assertFalse(TuningBalanceButton.hit(0));
        RubeLoaderTest.loaded = true;
        RubeLoaderTest.t = null;
        assertFalse(TuningBalanceButton.hit(0));
        assertEquals(0, fixture.calls);
    }

    @Test public void dropsTheFixtureBeforeDisposalAndWhenChangingScenes() {
        TuningBalanceButton.clear();
        assertFalse(TuningBalanceButton.hit(0));
        TuningBalanceButton.bind(scene(fixture));
        assertTrue(TuningBalanceButton.hit(0));
        TuningBalanceButton.bind(scene(null));
        assertFalse(TuningBalanceButton.hit(0));
        TuningBalanceButton.bind(null);
        assertFalse(TuningBalanceButton.hit(0));
        assertEquals(1, fixture.calls);
    }

    private static RubeScene scene(Fixture fixture) {
        return new RubeScene() {
            @Override @SuppressWarnings("unchecked")
            public <T> Array<T> getNamed(Class<T> type, String name) {
                assertEquals(Fixture.class, type);
                assertEquals("morphe_balance_editor", name);
                if (fixture == null) return null;
                Array<Fixture> fixtures = new Array<Fixture>() {
                    @Override public Fixture get(int index) {
                        assertEquals(0, index);
                        return fixture;
                    }
                };
                fixtures.size = 1;
                return (Array<T>) fixtures;
            }
        };
    }

    private static class HitFixture extends Fixture {
        int calls;
        float lastX, lastY;
        @Override public boolean testPoint(float x, float y) {
            calls++;
            lastX = x;
            lastY = y;
            return Math.abs(x + 19) <= 1.75f && Math.abs(y + 32) <= 1.75f;
        }
    }
}
