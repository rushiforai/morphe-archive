package dev.utaa.linimal.extension.features.readers;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import org.junit.Test;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public final class ReadersResolverTest {
    private static final String CHAT = "c0123456789abcdef";

    @Test
    public void readersAreThoseWhoseRangeCoversTheMessageAndUnreadAreTheRest() {
        FakeSource source = new FakeSource()
                .reader("u_b").reader("u_a")
                .members("u_a", "u_b", "u_c", "u_d")
                .profile("u_a", "Aoi", "/0hA")
                .profile("u_b", "Ben", null)
                .profile("u_c", "Chika", "/0hC");

        ReadersSnapshot snapshot = ReadersResolver.resolve(source, CHAT, 100L, Collections.emptyList());

        assertEquals(Arrays.asList("u_a", "u_b"), mids(snapshot.getReaders()));
        assertEquals(Arrays.asList("u_c", "u_d"), mids(snapshot.getUnreadMembers()));
        assertTrue(snapshot.isMembersKnown());
        assertEquals("Aoi", snapshot.getReaders().get(0).getDisplayName());
        assertEquals("/0hA", snapshot.getReaders().get(0).getPicturePath());
        assertNull(snapshot.getReaders().get(1).getPicturePath());
        // contacts に無いメンバーは名前なしで最後に並びます。
        assertNull(snapshot.getUnreadMembers().get(1).getDisplayName());
        assertEquals(CHAT, source.lastReaderChat);
        assertEquals(100L, source.lastReaderMessage);
    }

    @Test
    public void senderAndSelfAreExcludedFromBothLists() {
        FakeSource source = new FakeSource()
                .reader("u_self").reader("u_a")
                .members("u_self", "u_sender", "u_a", "u_b");

        ReadersSnapshot snapshot = ReadersResolver.resolve(
                source, CHAT, 5L, Arrays.asList("u_sender", "u_self", null, ""));

        assertEquals(Collections.singletonList("u_a"), mids(snapshot.getReaders()));
        assertEquals(Collections.singletonList("u_b"), mids(snapshot.getUnreadMembers()));
    }

    @Test
    public void formerMembersWithReadRecordsStillCountAsReaders() {
        FakeSource source = new FakeSource()
                .reader("u_left").reader("u_a")
                .members("u_a", "u_b");

        ReadersSnapshot snapshot = ReadersResolver.resolve(source, CHAT, 5L, null);

        assertEquals(Arrays.asList("u_a", "u_left"), mids(snapshot.getReaders()));
        assertEquals(Collections.singletonList("u_b"), mids(snapshot.getUnreadMembers()));
    }

    @Test
    public void unknownMembershipHidesTheUnreadList() {
        FakeSource source = new FakeSource().reader("u_a");
        source.members = null;

        ReadersSnapshot snapshot = ReadersResolver.resolve(source, CHAT, 5L, null);

        assertFalse(snapshot.isMembersKnown());
        assertEquals(Collections.singletonList("u_a"), mids(snapshot.getReaders()));
        assertTrue(snapshot.getUnreadMembers().isEmpty());
    }

    @Test
    public void noProfilesAreQueriedWhenNobodyIsListed() {
        FakeSource source = new FakeSource().members("u_self");

        ReadersSnapshot snapshot = ReadersResolver.resolve(
                source, CHAT, 5L, Collections.singletonList("u_self"));

        assertTrue(snapshot.getReaders().isEmpty());
        assertTrue(snapshot.getUnreadMembers().isEmpty());
        assertFalse(source.profilesQueried);
    }

    @Test
    public void blankProfileValuesAreTreatedAsMissing() {
        FakeSource source = new FakeSource().reader("u_a").profile("u_a", "  ", "");

        ReadersSnapshot snapshot = ReadersResolver.resolve(source, CHAT, 5L, null);

        assertNull(snapshot.getReaders().get(0).getDisplayName());
        assertNull(snapshot.getReaders().get(0).getPicturePath());
    }

    private static List<String> mids(List<ReadersSnapshot.Member> members) {
        List<String> mids = new ArrayList<>();
        for (ReadersSnapshot.Member member : members) {
            mids.add(member.getMid());
        }
        return mids;
    }

    private static final class FakeSource implements ReadersDataSource {
        final List<String> readers = new ArrayList<>();
        List<String> members = new ArrayList<>();
        final Map<String, Profile> profiles = new HashMap<>();
        String lastReaderChat;
        long lastReaderMessage;
        boolean profilesQueried;

        FakeSource reader(String mid) {
            readers.add(mid);
            return this;
        }

        FakeSource members(String... mids) {
            members = new ArrayList<>(Arrays.asList(mids));
            return this;
        }

        FakeSource profile(String mid, String name, String picture) {
            profiles.put(mid, new Profile(name, picture));
            return this;
        }

        @Override
        public List<String> readerMids(String chatId, long messageId) {
            lastReaderChat = chatId;
            lastReaderMessage = messageId;
            return readers;
        }

        @Override
        public List<String> memberMids(String chatId) {
            return members;
        }

        @Override
        public Map<String, Profile> profiles(Collection<String> mids) {
            profilesQueried = true;
            Map<String, Profile> result = new HashMap<>();
            for (String mid : mids) {
                if (profiles.containsKey(mid)) {
                    result.put(mid, profiles.get(mid));
                }
            }
            return result;
        }
    }
}
