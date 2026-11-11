/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import static org.junit.Assert.assertEquals;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

import java.util.List;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class AccountsTest {
    /** UserConfig as 13.2.1 Play has it: MAX_ACCOUNT_COUNT folded away and a four-slot table. */
    public static final class FourSlots {
        static FourSlots[] Instance = new FourSlots[4];
        static int highestAsked = -1;

        final long id;
        final boolean activated;

        FourSlots(long id, boolean activated) {
            this.id = id;
            this.activated = activated;
        }

        public static FourSlots getInstance(int index) {
            highestAsked = Math.max(highestAsked, index);
            return Instance[index];
        }

        public boolean isClientActivated() { return activated; }

        public long getClientUserId() { return id; }

        public User getCurrentUser() { return new User("Account", Long.toString(id)); }
    }

    public static final class User {
        public final String first_name;
        public final String last_name;

        User(String first, String last) {
            first_name = first;
            last_name = last;
        }
    }

    @Before
    public void signIn() {
        FourSlots.Instance = new FourSlots[] {
            new FourSlots(1000, true), new FourSlots(0, false), new FourSlots(3000, true), new FourSlots(4000, true),
        };
        FourSlots.highestAsked = -1;
    }

    @Test
    public void listsEverySignedInSlotWithoutAskingPastTheTable() {
        List<Accounts.Entry> found = Accounts.signedIn(FourSlots.class);

        assertEquals(3, found.size());
        assertEquals(0, found.get(0).index);
        assertEquals(2, found.get(1).index);
        assertEquals(3, found.get(2).index);
        assertEquals("Account 4000", found.get(2).name);
        assertEquals(3, FourSlots.highestAsked);
    }

    @Test
    public void aUserOnNoSlotIsNoneWithoutAskingPastTheTable() {
        assertEquals(3, Accounts.ofUser(FourSlots.class, 4000));
        FourSlots.highestAsked = -1;

        assertEquals(-1, Accounts.ofUser(FourSlots.class, 5000));
        assertEquals(3, FourSlots.highestAsked);
    }
}
