package app.voidhack.extension.twitter.spaces.mute;

import org.junit.Test;

import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

public class SpaceLocalMuteLogicTest {

    private static Map<String, SpaceLocalMuteLogic.SpeakerIdentity> sampleDirectory() {
        Map<String, SpaceLocalMuteLogic.SpeakerIdentity> dir = new HashMap<>();
        SpaceLocalMuteLogic.SpeakerIdentity alice = new SpaceLocalMuteLogic.SpeakerIdentity(
                "1001", "1001", "ps_alice", "AliceDev", "Alice", "speaker");
        SpaceLocalMuteLogic.SpeakerIdentity bob = new SpaceLocalMuteLogic.SpeakerIdentity(
                "2002", "2002", "ps_bob", "BobTalks", "Bob", "admin");
        dir.put("1001", alice);
        dir.put("ps_alice", alice);
        dir.put("alicedev", alice);
        dir.put("2002", bob);
        dir.put("ps_bob", bob);
        dir.put("bobtalks", bob);
        return dir;
    }

    private static Set<String> setOf(String... keys) {
        return new HashSet<>(Arrays.asList(keys));
    }

    @Test
    public void matchesAcrossTwitterPeriscopeAndCaseInsensitiveUsername() {
        SpaceLocalMuteLogic logic = new SpaceLocalMuteLogic();
        logic.mute(new SpaceLocalMuteLogic.MutedUser("1001", "ps_alice", "@AliceDev", "Alice", 10L));

        assertTrue(logic.isMuted("1001", "", ""));
        assertTrue(logic.isMuted("", "ps_alice", ""));
        assertTrue(logic.isMuted("", "", "alicedev"));
        assertTrue(logic.isMuted("", "", "@ALICEDEV"));
        assertFalse(logic.isMuted("2002", "ps_bob", "bobtalks"));

        Map<String, SpaceLocalMuteLogic.SpeakerIdentity> dir = sampleDirectory();
        assertTrue(logic.isMutedByAnyId("ps_alice", dir));
        assertTrue(logic.isMutedByAnyId("1001", dir));
        assertFalse(logic.isMutedByAnyId("ps_bob", dir));
    }

    @Test
    public void enrichesMissingPeriscopeIdFromLiveSpeakerDirectory() {
        SpaceLocalMuteLogic logic = new SpaceLocalMuteLogic();
        logic.mute(new SpaceLocalMuteLogic.MutedUser("", "", "AliceDev", "Alice", 10L));
        assertFalse(logic.isMuted("", "ps_alice", ""));

        assertTrue(logic.enrichFromDirectory(sampleDirectory()));
        assertTrue(logic.isMuted("1001", "", ""));
        assertTrue(logic.isMuted("", "ps_alice", ""));
    }

    @Test
    public void smartModeMutesSoloMutedSpeakerHoldsHangoverAndLetsUnmutedCutThrough() {
        SpaceLocalMuteLogic logic = new SpaceLocalMuteLogic();
        Map<String, SpaceLocalMuteLogic.SpeakerIdentity> dir = sampleDirectory();
        logic.mute(new SpaceLocalMuteLogic.MutedUser("1001", "ps_alice", "alicedev", "Alice", 1L));

        SpaceLocalMuteLogic.GateDecision d1 = logic.evaluateHlsGate(setOf("1001"), dir, 1000L, false, 400L);
        assertTrue(d1.shouldMute);
        assertTrue(d1.mutedTalkingNow);

        SpaceLocalMuteLogic.GateDecision d2 = logic.evaluateHlsGate(Collections.<String>emptySet(), dir, 1200L, false, 400L);
        assertTrue(d2.shouldMute);
        assertFalse(d2.mutedTalkingNow);

        SpaceLocalMuteLogic.GateDecision d3 = logic.evaluateHlsGate(Collections.<String>emptySet(), dir, 1450L, false, 400L);
        assertFalse(d3.shouldMute);

        logic.evaluateHlsGate(setOf("1001"), dir, 2000L, false, 400L);
        SpaceLocalMuteLogic.GateDecision overlap = logic.evaluateHlsGate(setOf("1001", "2002"), dir, 2050L, false, 400L);
        assertFalse(overlap.shouldMute);
        assertEquals(1, overlap.mutedTalkingCount);
        assertEquals(1, overlap.unmutedTalkingCount);

        SpaceLocalMuteLogic.GateDecision bobOnly = logic.evaluateHlsGate(setOf("2002"), dir, 2100L, false, 400L);
        assertFalse(bobOnly.shouldMute);
        SpaceLocalMuteLogic.GateDecision afterBob = logic.evaluateHlsGate(Collections.<String>emptySet(), dir, 2150L, false, 400L);
        assertFalse(afterBob.shouldMute);
    }

    @Test
    public void strictModeSilencesEvenDuringOverlap() {
        SpaceLocalMuteLogic logic = new SpaceLocalMuteLogic();
        Map<String, SpaceLocalMuteLogic.SpeakerIdentity> dir = sampleDirectory();
        logic.mute(new SpaceLocalMuteLogic.MutedUser("1001", "ps_alice", "alicedev", "Alice", 1L));

        SpaceLocalMuteLogic.GateDecision overlap = logic.evaluateHlsGate(setOf("1001", "2002"), dir, 1000L, true, 400L);
        assertTrue(overlap.shouldMute);

        SpaceLocalMuteLogic.GateDecision hold = logic.evaluateHlsGate(setOf("2002"), dir, 1250L, true, 400L);
        assertTrue(hold.shouldMute);

        SpaceLocalMuteLogic.GateDecision released = logic.evaluateHlsGate(setOf("2002"), dir, 1450L, true, 400L);
        assertFalse(released.shouldMute);
    }

    @Test
    public void toggleMuteAndClearAllBehaveConsistently() {
        SpaceLocalMuteLogic logic = new SpaceLocalMuteLogic();
        SpaceLocalMuteLogic.MutedUser alice = new SpaceLocalMuteLogic.MutedUser("1001", "ps_alice", "alicedev", "Alice", 1L);

        assertTrue(logic.toggleMute(alice));
        assertEquals(1, logic.getMutedCount());
        assertFalse(logic.toggleMute(alice));
        assertEquals(0, logic.getMutedCount());

        logic.mute(alice);
        logic.clearAll();
        assertFalse(logic.hasMutedUsers());
        List<SpaceLocalMuteLogic.MutedUser> remaining = logic.getMutedUsers();
        assertTrue(remaining.isEmpty());
    }

    @Test
    public void smoothVolumeRampAttacksFastAndReleasesSmoothly() {
        float g = 1.0f;
        g = SpaceLocalMuteLogic.stepVolume(g, true, 12L);
        assertTrue(g > 0.0f && g < 0.6f);
        g = SpaceLocalMuteLogic.stepVolume(g, true, 20L);
        assertEquals(0.0f, g, 0.0001f);

        g = SpaceLocalMuteLogic.stepVolume(g, false, 25L);
        assertEquals(0.5f, g, 0.01f);
        g = SpaceLocalMuteLogic.stepVolume(g, false, 30L);
        assertEquals(1.0f, g, 0.0001f);
    }
}
