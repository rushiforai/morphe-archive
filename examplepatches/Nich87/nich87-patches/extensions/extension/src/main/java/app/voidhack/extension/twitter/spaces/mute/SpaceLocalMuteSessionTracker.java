package app.voidhack.extension.twitter.spaces.mute;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;

/**
 * Lightweight Space session and speaker-activity tracker used by {@link SpaceLocalMuteController}.
 * Reads RoomStateManager ({@code b4}) updates without touching media capture or storage.
 */
public final class SpaceLocalMuteSessionTracker {

    public static final class Snapshot {
        public final String roomId;
        public final String title;
        public final String playbackMode;
        public final String speakingState;
        public final boolean connected;
        public final boolean hlsPlaybackActive;
        public final Set<String> activeTalkingKeys;
        public final List<SpaceLocalMuteLogic.SpeakerIdentity> allSpeakers;

        Snapshot(String roomId, String title, String playbackMode, String speakingState,
                 boolean connected, boolean hlsPlaybackActive,
                 Set<String> activeTalkingKeys,
                 List<SpaceLocalMuteLogic.SpeakerIdentity> allSpeakers) {
            this.roomId = roomId;
            this.title = title;
            this.playbackMode = playbackMode;
            this.speakingState = speakingState;
            this.connected = connected;
            this.hlsPlaybackActive = hlsPlaybackActive;
            this.activeTalkingKeys = activeTalkingKeys;
            this.allSpeakers = allSpeakers;
        }
    }

    private static final Object LOCK = new Object();

    private static volatile boolean b4Resolved;
    private static Field fB4RoomId, fB4ConnState, fB4AudioSpace, fB4Speakers, fB4Admins, fB4SpeakingState, fB4PlaybackMode;

    private static volatile boolean metaJResolved;
    private static Field fJTitle;

    private static volatile boolean userItemResolved;
    private static Method mUserTwitterId, mUserPeriscopeId, mUserName, mUserUsername, mUserIsTalking, mUserStatus;

    private static String roomId = "";
    private static String title = "";
    private static String playbackMode = "LIVE";
    private static String speakingState = "NO_REQUEST";
    private static boolean connected = false;
    private static boolean hlsPlaybackActive = false;
    private static final List<SpaceLocalMuteLogic.SpeakerIdentity> currentSpeakers = new ArrayList<>();
    private static final Set<String> activeTalkingKeys = new LinkedHashSet<>();

    private SpaceLocalMuteSessionTracker() {}

    static void onRoomState(Object b4Obj) {
        if (b4Obj == null) return;
        try {
            resolveB4(b4Obj.getClass());
            String newRoomId = safeString(fB4RoomId != null ? fB4RoomId.get(b4Obj) : null);
            String newConn = enumName(fB4ConnState != null ? fB4ConnState.get(b4Obj) : null, "NOT_CONNECTED");
            String newSpeaking = enumName(fB4SpeakingState != null ? fB4SpeakingState.get(b4Obj) : null, "NO_REQUEST");
            String newMode = enumName(fB4PlaybackMode != null ? fB4PlaybackMode.get(b4Obj) : null, "LIVE");

            String newTitle = "";
            Object jObj = fB4AudioSpace != null ? fB4AudioSpace.get(b4Obj) : null;
            if (jObj != null) {
                resolveMetaJ(jObj.getClass());
                newTitle = safeString(fJTitle != null ? fJTitle.get(jObj) : null);
            }

            List<SpaceLocalMuteLogic.SpeakerIdentity> parsedSpeakers = new ArrayList<>();
            Set<String> talking = new LinkedHashSet<>();
            collectUsers(fB4Admins != null ? fB4Admins.get(b4Obj) : null, "admin", parsedSpeakers, talking);
            collectUsers(fB4Speakers != null ? fB4Speakers.get(b4Obj) : null, "speaker", parsedSpeakers, talking);

            boolean wasConnected;
            boolean nowConnected = "CONNECTED".equals(newConn) && !newRoomId.isEmpty();

            synchronized (LOCK) {
                wasConnected = connected;
                if (nowConnected) {
                    roomId = newRoomId;
                    if (!newTitle.isEmpty()) title = newTitle;
                    playbackMode = newMode;
                    speakingState = newSpeaking;
                    connected = true;
                    currentSpeakers.clear();
                    currentSpeakers.addAll(parsedSpeakers);
                    activeTalkingKeys.clear();
                    activeTalkingKeys.addAll(talking);
                } else {
                    speakingState = newSpeaking;
                    playbackMode = newMode;
                    if ("DEFAULT".equals(newConn) || "FAILED".equals(newConn)
                            || "NOT_CONNECTED".equals(newConn) || newRoomId.isEmpty()) {
                        connected = false;
                        activeTalkingKeys.clear();
                    }
                }
            }

            SpaceLocalMuteController.get().onRoomStateUpdated(snapshot(), wasConnected && !nowConnected);
        } catch (Throwable ignored) {}
    }

    static void onHlsPlaybackStarted(Object audioSpaceMetaJ, Object playbackModeEnum) {
        try {
            String t = "";
            if (audioSpaceMetaJ != null) {
                resolveMetaJ(audioSpaceMetaJ.getClass());
                t = safeString(fJTitle != null ? fJTitle.get(audioSpaceMetaJ) : null);
            }
            String mode = enumName(playbackModeEnum, "LIVE");
            synchronized (LOCK) {
                hlsPlaybackActive = true;
                if (!t.isEmpty()) title = t;
                playbackMode = mode;
            }
        } catch (Throwable ignored) {}
    }

    static void onHlsPlaybackStopped() {
        synchronized (LOCK) {
            hlsPlaybackActive = false;
        }
        SpaceLocalMuteController.get().onHlsPlaybackStopped();
    }

    static boolean isHlsSpaceAudioExpected() {
        synchronized (LOCK) {
            if ("SPEAKING".equals(speakingState)) return false;
            return hlsPlaybackActive || connected;
        }
    }

    public static Snapshot snapshot() {
        synchronized (LOCK) {
            return new Snapshot(
                    roomId,
                    title,
                    playbackMode,
                    speakingState,
                    connected,
                    hlsPlaybackActive,
                    new LinkedHashSet<>(activeTalkingKeys),
                    new ArrayList<>(currentSpeakers)
            );
        }
    }

    private static void collectUsers(Object setObj, String fallbackRole,
                                     List<SpaceLocalMuteLogic.SpeakerIdentity> outList,
                                     Set<String> outTalking) {
        if (!(setObj instanceof Iterable)) return;
        for (Object item : (Iterable<?>) setObj) {
            if (item == null) continue;
            try {
                resolveUserItem(item.getClass());
                String twitterId = safeString(mUserTwitterId != null ? mUserTwitterId.invoke(item) : null);
                String periscopeId = safeString(mUserPeriscopeId != null ? mUserPeriscopeId.invoke(item) : null);
                String name = safeString(mUserName != null ? mUserName.invoke(item) : null);
                String username = safeString(mUserUsername != null ? mUserUsername.invoke(item) : null);
                boolean talking = mUserIsTalking != null && Boolean.TRUE.equals(mUserIsTalking.invoke(item));
                String role = enumName(mUserStatus != null ? mUserStatus.invoke(item) : null, fallbackRole);

                String primaryKey = !twitterId.isEmpty() ? twitterId
                        : (!periscopeId.isEmpty() ? periscopeId : (!username.isEmpty() ? username : name));
                if (primaryKey.isEmpty()) continue;

                outList.add(new SpaceLocalMuteLogic.SpeakerIdentity(
                        primaryKey, twitterId, periscopeId, username,
                        name.isEmpty() ? username : name, role));
                if (talking) {
                    outTalking.add(primaryKey);
                }
            } catch (Throwable ignored) {}
        }
    }

    private static void resolveB4(Class<?> cls) {
        if (b4Resolved) return;
        fB4RoomId = findField(cls, "b");
        fB4ConnState = findField(cls, "d");
        fB4AudioSpace = findField(cls, "f");
        fB4Speakers = findField(cls, "m");
        fB4Admins = findField(cls, "n");
        fB4SpeakingState = findField(cls, "w");
        fB4PlaybackMode = findField(cls, "K");
        b4Resolved = true;
    }

    private static void resolveMetaJ(Class<?> cls) {
        if (metaJResolved) return;
        fJTitle = findField(cls, "j");
        metaJResolved = true;
    }

    private static void resolveUserItem(Class<?> cls) {
        if (userItemResolved) return;
        mUserTwitterId = findMethod(cls, "getTwitterUserId");
        mUserPeriscopeId = findMethod(cls, "getPeriscopeUserId");
        mUserName = findMethod(cls, "getName");
        mUserUsername = findMethod(cls, "getUsername");
        mUserIsTalking = findMethod(cls, "isTalking");
        mUserStatus = findMethod(cls, "getUserStatus");
        userItemResolved = true;
    }

    private static Field findField(Class<?> cls, String name) {
        try {
            Field f = cls.getDeclaredField(name);
            f.setAccessible(true);
            return f;
        } catch (Throwable ignored) {
            return null;
        }
    }

    private static Method findMethod(Class<?> cls, String name) {
        try {
            Method m = cls.getMethod(name);
            m.setAccessible(true);
            return m;
        } catch (Throwable ignored) {
            return null;
        }
    }

    private static String safeString(Object o) {
        return o instanceof String ? (String) o : "";
    }

    private static String enumName(Object o, String fallback) {
        if (o instanceof Enum) {
            return ((Enum<?>) o).name();
        }
        return o != null ? o.toString() : fallback;
    }
}
