import local.lunaredge.cast.LocalPlayback;

public final class LocalPlaybackTest {
    // Semántica contrastada con los métodos originales L, O y R de ExoUserPlayer en la APK 4.0.2.
    public static final class Player {
        boolean playing = true;
        boolean released;
        public void L() { playing = false; }
        public void O() { released = true; }
    }
    public static void main(String[] args) throws Exception {
        Player player = new Player();
        LocalPlayback.pauseForCast(player);
        if (player.released) throw new AssertionError("El traspaso a Cast libera el reproductor local");
        if (player.playing) throw new AssertionError("El reproductor local sigue reproduciendo");
        System.out.println("OK: traspaso pausa sin liberar el reproductor local.");
    }
}
