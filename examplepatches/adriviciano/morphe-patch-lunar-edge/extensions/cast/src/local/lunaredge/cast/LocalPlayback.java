package local.lunaredge.cast;

/** Traspaso a la TV sin destruir el reproductor local. */
public final class LocalPlayback {
    private LocalPlayback() { }
    public static void pauseForCast(Object player) throws ReflectiveOperationException {
        // En esta APK O() llama a R() y libera el reproductor; L() solo pausa.
        player.getClass().getMethod("L").invoke(player);
    }
}
