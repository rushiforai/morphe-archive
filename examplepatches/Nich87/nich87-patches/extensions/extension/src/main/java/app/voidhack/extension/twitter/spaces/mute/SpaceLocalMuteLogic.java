package app.voidhack.extension.twitter.spaces.mute;

import java.util.ArrayList;
import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;

/**
 * Pure-Java decision engine for listener-side per-user local muting in Twitter/X Spaces.
 *
 * Matches speakers reliably across Twitter user IDs, Periscope/Janus user IDs, and
 * normalized @usernames, and computes smooth real-time HLS active-speaker gating with
 * configurable overlap policy and inter-word hangover hold.
 */
public final class SpaceLocalMuteLogic {

    public static final long DEFAULT_HANGOVER_MS = 400L;
    public static final long RAMP_ATTACK_MS = 25L;
    public static final long RAMP_RELEASE_MS = 50L;

    public static final class MutedUser {
        public final String primaryKey;
        public final String twitterUserId;
        public final String periscopeUserId;
        public final String username;
        public final String displayName;
        public final long mutedAtMs;

        public MutedUser(String twitterUserId, String periscopeUserId,
                         String username, String displayName, long mutedAtMs) {
            this.twitterUserId = clean(twitterUserId);
            this.periscopeUserId = clean(periscopeUserId);
            this.username = normalizeUsername(username);
            String cleanName = clean(displayName);
            this.displayName = !cleanName.isEmpty() ? cleanName
                    : (!this.username.isEmpty() ? "@" + this.username
                    : (!this.twitterUserId.isEmpty() ? this.twitterUserId : this.periscopeUserId));
            this.primaryKey = computePrimaryKey(this.twitterUserId, this.periscopeUserId, this.username);
            this.mutedAtMs = mutedAtMs;
        }

        public boolean matches(String tId, String pId, String handle) {
            String ct = clean(tId);
            String cp = clean(pId);
            String cu = normalizeUsername(handle);
            if (!ct.isEmpty() && !twitterUserId.isEmpty() && ct.equals(twitterUserId)) return true;
            if (!cp.isEmpty() && !periscopeUserId.isEmpty() && cp.equals(periscopeUserId)) return true;
            if (!cu.isEmpty() && !username.isEmpty() && cu.equals(username)) return true;
            if (!ct.isEmpty() && ct.equals(primaryKey)) return true;
            if (!cp.isEmpty() && cp.equals(primaryKey)) return true;
            if (!cu.isEmpty() && cu.equals(primaryKey)) return true;
            return false;
        }

        public boolean matchesAnyId(String anyId) {
            String raw = clean(anyId);
            if (raw.isEmpty()) return false;
            if (raw.equals(primaryKey)) return true;
            if (!twitterUserId.isEmpty() && raw.equals(twitterUserId)) return true;
            if (!periscopeUserId.isEmpty() && raw.equals(periscopeUserId)) return true;
            String norm = normalizeUsername(raw);
            return !username.isEmpty() && !norm.isEmpty() && norm.equals(username);
        }

        MutedUser mergeWith(MutedUser newer) {
            String tId = !newer.twitterUserId.isEmpty() ? newer.twitterUserId : this.twitterUserId;
            String pId = !newer.periscopeUserId.isEmpty() ? newer.periscopeUserId : this.periscopeUserId;
            String u = !newer.username.isEmpty() ? newer.username : this.username;
            String dn = !newer.displayName.isEmpty() && !newer.displayName.equals(newer.primaryKey)
                    ? newer.displayName : this.displayName;
            return new MutedUser(tId, pId, u, dn, this.mutedAtMs);
        }
    }

    public static final class SpeakerIdentity {
        public final String key;
        public final String twitterUserId;
        public final String periscopeUserId;
        public final String username;
        public final String displayName;
        public final String role;

        public SpeakerIdentity(String key, String twitterUserId, String periscopeUserId,
                               String username, String displayName) {
            this(key, twitterUserId, periscopeUserId, username, displayName, "speaker");
        }

        public SpeakerIdentity(String key, String twitterUserId, String periscopeUserId,
                               String username, String displayName, String role) {
            this.key = clean(key);
            this.twitterUserId = clean(twitterUserId);
            this.periscopeUserId = clean(periscopeUserId);
            this.username = normalizeUsername(username);
            this.displayName = clean(displayName);
            this.role = role != null && !role.isEmpty() ? role : "speaker";
        }
    }

    public static final class GateDecision {
        public final boolean shouldMute;
        public final boolean mutedTalkingNow;
        public final int mutedTalkingCount;
        public final int unmutedTalkingCount;

        public GateDecision(boolean shouldMute, boolean mutedTalkingNow,
                            int mutedTalkingCount, int unmutedTalkingCount) {
            this.shouldMute = shouldMute;
            this.mutedTalkingNow = mutedTalkingNow;
            this.mutedTalkingCount = mutedTalkingCount;
            this.unmutedTalkingCount = unmutedTalkingCount;
        }
    }

    private final List<MutedUser> mutedUsers = new ArrayList<>();
    private long lastMutedTalkingMs = -1L;

    public synchronized void loadMutedUsers(List<MutedUser> users) {
        mutedUsers.clear();
        if (users != null) {
            for (MutedUser u : users) {
                if (u != null && !u.primaryKey.isEmpty()) {
                    addOrMergeLocked(u);
                }
            }
        }
        if (mutedUsers.isEmpty()) {
            lastMutedTalkingMs = -1L;
        }
    }

    public synchronized List<MutedUser> getMutedUsers() {
        return new ArrayList<>(mutedUsers);
    }

    public synchronized int getMutedCount() {
        return mutedUsers.size();
    }

    public synchronized boolean hasMutedUsers() {
        return !mutedUsers.isEmpty();
    }

    public synchronized boolean isMuted(String twitterUserId, String periscopeUserId, String username) {
        if (mutedUsers.isEmpty()) return false;
        for (MutedUser u : mutedUsers) {
            if (u.matches(twitterUserId, periscopeUserId, username)) {
                return true;
            }
        }
        return false;
    }

    public synchronized boolean isMutedByAnyId(String anyId, Map<String, SpeakerIdentity> directory) {
        if (mutedUsers.isEmpty() || anyId == null || anyId.isEmpty()) return false;
        SpeakerIdentity id = directory != null ? directory.get(anyId) : null;
        if (id != null) {
            for (MutedUser u : mutedUsers) {
                if (u.matches(id.twitterUserId, id.periscopeUserId, id.username)
                        || u.matchesAnyId(id.key)) {
                    return true;
                }
            }
        }
        for (MutedUser u : mutedUsers) {
            if (u.matchesAnyId(anyId)) {
                return true;
            }
        }
        return false;
    }

    /**
     * Enriches stored MutedUser entries that are missing a twitterUserId or periscopeUserId
     * when live speaker metadata arrives from RoomStateManager.
     */
    public synchronized boolean enrichFromDirectory(Map<String, SpeakerIdentity> directory) {
        if (mutedUsers.isEmpty() || directory == null || directory.isEmpty()) return false;
        boolean changed = false;
        for (int i = 0; i < mutedUsers.size(); i++) {
            MutedUser cur = mutedUsers.get(i);
            for (SpeakerIdentity sp : directory.values()) {
                if (sp == null) continue;
                if (cur.matches(sp.twitterUserId, sp.periscopeUserId, sp.username)) {
                    MutedUser candidate = new MutedUser(
                            sp.twitterUserId, sp.periscopeUserId, sp.username, sp.displayName, cur.mutedAtMs);
                    MutedUser merged = cur.mergeWith(candidate);
                    if (!merged.twitterUserId.equals(cur.twitterUserId)
                            || !merged.periscopeUserId.equals(cur.periscopeUserId)
                            || !merged.username.equals(cur.username)) {
                        mutedUsers.set(i, merged);
                        cur = merged;
                        changed = true;
                    }
                    break;
                }
            }
        }
        return changed;
    }

    /**
     * Toggles mute for the given user. Returns {@code true} if now muted, {@code false} if unmuted.
     */
    public synchronized boolean toggleMute(MutedUser user) {
        if (user == null || user.primaryKey.isEmpty()) return false;
        int idx = findIndexLocked(user.twitterUserId, user.periscopeUserId, user.username, user.primaryKey);
        if (idx >= 0) {
            mutedUsers.remove(idx);
            if (mutedUsers.isEmpty()) {
                lastMutedTalkingMs = -1L;
            }
            return false;
        }
        mutedUsers.add(0, user);
        return true;
    }

    public synchronized void mute(MutedUser user) {
        if (user == null || user.primaryKey.isEmpty()) return;
        addOrMergeLocked(user);
    }

    public synchronized boolean unmute(String twitterUserId, String periscopeUserId, String username) {
        int idx = findIndexLocked(twitterUserId, periscopeUserId, username, "");
        if (idx >= 0) {
            mutedUsers.remove(idx);
            if (mutedUsers.isEmpty()) {
                lastMutedTalkingMs = -1L;
            }
            return true;
        }
        return false;
    }

    public synchronized void clearAll() {
        mutedUsers.clear();
        lastMutedTalkingMs = -1L;
    }

    public synchronized void resetGateState() {
        lastMutedTalkingMs = -1L;
    }

    /**
     * Evaluates whether the mixed HLS/Replay Space playback AudioTrack should be muted right now.
     */
    public synchronized GateDecision evaluateHlsGate(Set<String> activeTalkingKeys,
                                                     Map<String, SpeakerIdentity> speakerDirectory,
                                                     long nowMs,
                                                     boolean strictOverlapMute,
                                                     long hangoverMs) {
        if (mutedUsers.isEmpty()) {
            lastMutedTalkingMs = -1L;
            int total = activeTalkingKeys != null ? activeTalkingKeys.size() : 0;
            return new GateDecision(false, false, 0, total);
        }

        int mutedTalking = 0;
        int unmutedTalking = 0;
        if (activeTalkingKeys != null) {
            for (String key : activeTalkingKeys) {
                if (key == null || key.isEmpty()) continue;
                if (isMutedByAnyId(key, speakerDirectory)) {
                    mutedTalking++;
                } else {
                    unmutedTalking++;
                }
            }
        }

        if (mutedTalking > 0) {
            lastMutedTalkingMs = nowMs;
        }

        if (!strictOverlapMute && unmutedTalking > 0) {
            if (mutedTalking == 0) {
                lastMutedTalkingMs = -1L;
            }
            return new GateDecision(false, mutedTalking > 0, mutedTalking, unmutedTalking);
        }

        long safeHangover = Math.max(0L, hangoverMs);
        boolean inHangover = lastMutedTalkingMs >= 0L && nowMs >= lastMutedTalkingMs
                && (nowMs - lastMutedTalkingMs) <= safeHangover;
        boolean mutedActiveOrHangover = mutedTalking > 0 || inHangover;
        if (!mutedActiveOrHangover) {
            lastMutedTalkingMs = -1L;
        }

        boolean shouldMute = strictOverlapMute
                ? mutedActiveOrHangover
                : (mutedActiveOrHangover && unmutedTalking == 0);
        return new GateDecision(shouldMute, mutedTalking > 0, mutedTalking, unmutedTalking);
    }

    /**
     * Smoothly steps linear volume gain toward target (0.0f muted, 1.0f unmuted) to avoid clicks.
     */
    public static float stepVolume(float currentGain, boolean shouldMute, long dtMs) {
        float clamped = Math.max(0.0f, Math.min(1.0f, currentGain));
        float target = shouldMute ? 0.0f : 1.0f;
        if (Math.abs(clamped - target) < 0.001f) {
            return target;
        }
        if (dtMs <= 0L) {
            return clamped;
        }
        long rampMs = shouldMute ? RAMP_ATTACK_MS : RAMP_RELEASE_MS;
        float delta = (float) dtMs / (float) Math.max(1L, rampMs);
        if (shouldMute) {
            return Math.max(0.0f, clamped - delta);
        }
        return Math.min(1.0f, clamped + delta);
    }

    public static String normalizeUsername(String username) {
        if (username == null) return "";
        String trimmed = username.trim();
        while (trimmed.startsWith("@")) {
            trimmed = trimmed.substring(1).trim();
        }
        return trimmed.toLowerCase(Locale.US);
    }

    public static String computePrimaryKey(String twitterUserId, String periscopeUserId, String username) {
        String ct = clean(twitterUserId);
        if (!ct.isEmpty()) return ct;
        String cp = clean(periscopeUserId);
        if (!cp.isEmpty()) return cp;
        return normalizeUsername(username);
    }

    public static Map<String, SpeakerIdentity> buildDirectoryMap(List<SpeakerIdentity> speakers) {
        if (speakers == null || speakers.isEmpty()) return Collections.emptyMap();
        Map<String, SpeakerIdentity> map = new LinkedHashMap<>();
        for (SpeakerIdentity id : speakers) {
            if (id == null) continue;
            if (!id.key.isEmpty()) map.put(id.key, id);
            if (!id.twitterUserId.isEmpty()) map.put(id.twitterUserId, id);
            if (!id.periscopeUserId.isEmpty()) map.put(id.periscopeUserId, id);
            if (!id.username.isEmpty()) map.put(id.username, id);
        }
        return map;
    }

    private void addOrMergeLocked(MutedUser user) {
        int idx = findIndexLocked(user.twitterUserId, user.periscopeUserId, user.username, user.primaryKey);
        if (idx >= 0) {
            mutedUsers.set(idx, mutedUsers.get(idx).mergeWith(user));
        } else {
            mutedUsers.add(user);
        }
    }

    private int findIndexLocked(String twitterUserId, String periscopeUserId,
                                String username, String fallbackKey) {
        for (int i = 0; i < mutedUsers.size(); i++) {
            MutedUser u = mutedUsers.get(i);
            if (u.matches(twitterUserId, periscopeUserId, username)
                    || (!fallbackKey.isEmpty() && u.matchesAnyId(fallbackKey))) {
                return i;
            }
        }
        return -1;
    }

    private static String clean(String s) {
        return s == null ? "" : s.trim();
    }
}
