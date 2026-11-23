package nl.johninnl.eclipse.auto;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;

import java.util.HashSet;
import java.util.Set;
import nl.johninnl.eclipse.auto.ui.Destination;
import org.junit.Test;

public class DestinationTest {
    @Test public void rootDestinationsAreHomeDiscoverLibraryInThatOrder() {
        Destination[] all = Destination.values();
        assertEquals(3, all.length);
        assertEquals("Home", all[0].title);
        assertEquals("Discover", all[1].title);
        assertEquals("Library", all[2].title);
    }

    @Test public void keysAreUniqueAndRoundTrip() {
        Set<String> keys = new HashSet<>();
        for (Destination destination : Destination.values()) {
            assertTrue("duplicate key " + destination.key, keys.add(destination.key));
            assertEquals(destination, Destination.fromKey(destination.key));
        }
    }

    @Test public void unknownKeysFallBackToHome() {
        assertEquals(Destination.HOME, Destination.fromKey(null));
        assertEquals(Destination.HOME, Destination.fromKey("radio"));
    }
}
