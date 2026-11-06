package ricardonemlopot.nemlopot.patches;

import com.badlogic.gdx.physics.box2d.Fixture;
import com.badlogic.gdx.utils.Array;
import ricardonemlopot.nemlopot.rube.RubeLoaderTest;
import ricardonemlopot.nemlopot.rube.RubeScene;

/** Scene bindings and input are owned by the game's GL thread. */
public final class TuningBalanceButton {
    private static Fixture button;

    public static void bind(RubeScene scene) {
        clear();
        if (scene == null) return;
        Array<Fixture> fixtures = scene.getNamed(Fixture.class, "morphe_balance_editor");
        if (fixtures != null && fixtures.size > 0) button = fixtures.get(0);
    }

    public static void clear() {
        // Never retain a JNI fixture after the game's world is disposed.
        button = null;
    }

    static boolean hit(int pointer) {
        if (pointer != 0 || button == null || !BalanceStore.isLoaded()
                || RubeLoaderTest.t == null
                || RubeLoaderTest.menuX != 0f || RubeLoaderTest.menuY != -29.3f) {
            return false;
        }
        // exitErrorEllen starts false on a fresh launch and also becomes false
        // when navigating back. It does not indicate whether this menu is ready.
        // Use the same world-space coordinates and Box2D hit testing as the
        // adjacent tuning buttons, including during camera motion and rotation.
        return button.testPoint(RubeLoaderTest.t.x, RubeLoaderTest.t.y);
    }

    private TuningBalanceButton() {}
}
