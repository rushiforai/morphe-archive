package e.e.a;

/** A background session must not override the playback mode selected for another video. */
public final class PlaybackRouting {
    private PlaybackRouting() { }

    public static boolean shouldRoutePopup(boolean running, boolean background) {
        return running && !background;
    }

    public static boolean isPopupActive() {
        try {
            Class<?> service = Class.forName("com.sauzask.nicoid.NicoidPopupViewService");
            return shouldRoutePopup(service.getField("o0").getBoolean(null),
                                    service.getField("p0").getBoolean(null));
        } catch (ReflectiveOperationException ignored) {
            return false;
        }
    }

    /** Service identity alone is insufficient: its VideoView changes between videos. */
    public static boolean sameMediaBinding(Object owner, boolean popup, Object player, String video) {
        if (owner == null || player == null || video == null) return false;
        try {
            Object currentPlayer = owner.getClass().getField(popup ? "e" : "a0").get(owner);
            Object currentVideo = owner.getClass().getField(popup ? "f" : "b0").get(owner);
            return player == currentPlayer && video.equals(currentVideo);
        } catch (ReflectiveOperationException ignored) {
            return false;
        }
    }
}
