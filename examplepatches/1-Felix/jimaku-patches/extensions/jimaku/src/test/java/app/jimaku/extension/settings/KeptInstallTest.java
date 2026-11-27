package app.jimaku.extension.settings;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNull;

import org.junit.Test;

import app.jimaku.extension.gateway.Install;

public class KeptInstallTest {
    @Test
    public void keepsTheInstallInThePreferencesAcrossRuns() {
        MemoryPrefs prefs = new MemoryPrefs();
        new KeptInstall(() -> prefs).save(new Install("i-1", "s-1"));
        Install again = new KeptInstall(() -> prefs).load();
        assertEquals("i-1", again.install);
        assertEquals("s-1", again.secret);

        new KeptInstall(() -> prefs).save(null);
        assertNull(new KeptInstall(() -> prefs).load());
        assertFalse(prefs.contains("install_secret"));
    }

    @Test
    public void anInstallMadeBeforeThereIsAContextIsWrittenOnceThereIsOne() {
        MemoryPrefs prefs = new MemoryPrefs();
        prefs.edit().putString("install", "old").putString("install_secret", "old").apply();
        MemoryPrefs[] context = {null};
        KeptInstall kept = new KeptInstall(() -> context[0]);
        assertNull(kept.load());
        kept.save(new Install("new", "s"));
        context[0] = prefs;
        // The one made in this run is the one the gateway knows, and it is written.
        assertEquals("new", kept.load().install);
        assertEquals("new", prefs.getString("install", null));
    }
}
