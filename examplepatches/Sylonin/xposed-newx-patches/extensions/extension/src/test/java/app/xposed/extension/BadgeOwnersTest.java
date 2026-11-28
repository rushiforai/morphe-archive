package app.xposed.extension;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertSame;

import org.junit.Test;

import java.util.ArrayList;
import java.util.List;

public class BadgeOwnersTest {
    @Test
    public void aPostIsFoundByItsAuthorAndTime() {
        BadgeOwners.register("Alice", 1000, 42);
        BadgeOwners.register("alice", 1000, 42);
        assertEquals(42, BadgeOwners.postAt("ALICE", 1000));
        assertEquals(0, BadgeOwners.postAt("alice", 1001));
        assertEquals(0, BadgeOwners.postAt("bob", 1000));
    }

    @Test
    public void twoPostsByOneAuthorAtTheSameMomentGetNoPost() {
        BadgeOwners.register("carol", 2000, 1);
        BadgeOwners.register("carol", 2000, 2);
        assertEquals(0, BadgeOwners.postAt("carol", 2000));
        BadgeOwners.register("carol", 2000, 1);
        assertEquals(0, BadgeOwners.postAt("carol", 2000));
    }

    @Test
    public void postsWithoutATimeOrIdAreNotNoted() {
        BadgeOwners.register("dave", 0, 7);
        BadgeOwners.register("dave", 3000, 0);
        assertEquals(0, BadgeOwners.postAt("dave", 0));
        assertEquals(0, BadgeOwners.postAt("dave", 3000));
    }

    @Test
    public void equalListsAreToldApartByIdentity() {
        WeakIdentityMap<String> owners = new WeakIdentityMap<>();
        List<Object> first = new ArrayList<>();
        List<Object> second = new ArrayList<>();
        owners.put(first, "alice");
        owners.put(second, "bob");
        assertEquals("alice", owners.get(first));
        assertEquals("bob", owners.get(second));
        assertNull(owners.get(new ArrayList<>()));
        assertNull(owners.get(null));
        owners.put(first, "carol");
        assertSame("carol", owners.get(first));
        assertEquals(2, owners.size());
    }
}
