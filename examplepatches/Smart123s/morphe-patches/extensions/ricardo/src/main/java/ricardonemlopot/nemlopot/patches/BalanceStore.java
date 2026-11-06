package ricardonemlopot.nemlopot.patches;

import com.badlogic.gdx.Gdx;
import com.badlogic.gdx.Preferences;
import ricardonemlopot.nemlopot.rube.RubeLoaderTest;

/** Access only from the game's render thread, just like its own balance code. */
final class BalanceStore {
    static boolean isLoaded() {
        return RubeLoaderTest.loaded;
    }

    static int current() {
        return RubeLoaderTest.points;
    }

    static int parse(String text) {
        String value = text.trim();
        if (!value.matches("[0-9]+")) {
            throw new NumberFormatException("Expected a nonnegative integer");
        }
        return Integer.parseInt(value);
    }

    static void save(int value) {
        if (value < 0) {
            throw new IllegalArgumentException("Negative balance");
        }
        // Resolve the real wallet explicitly; the game's shared 'prefs' field
        // also temporarily points at the legacy migration preferences.
        Preferences wallet = Gdx.app.getPreferences("prefike");
        wallet.putInteger("pontok", value);
        wallet.flush();
        RubeLoaderTest.points = value;
    }

    private BalanceStore() {}
}
