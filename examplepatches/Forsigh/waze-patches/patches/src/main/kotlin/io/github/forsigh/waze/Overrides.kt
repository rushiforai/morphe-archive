package io.github.forsigh.waze

/**
 * What the bundle wants to force, collected by the individual patches and applied centrally.
 *
 * Patches do NOT inject their own smali any more. Each one records its intent here; the single
 * `configOverridesPatch` emits ONE block per typed getter from the collected contents.
 *
 * Why this exists - stacking injections into one method corrupts the bytecode. A block's branch
 * targets are resolved when it is added, but inserting a later block at the same index shifts the
 * earlier one without relocating it. The result is branches pointing at the wrong instruction, which
 * the runtime verifier rejects (VerifyError: invalid branch target) and the app dies on startup.
 * Observed exactly: block two in com.waze.config.c.a() had every target off by the 12 code units of
 * the block inserted after it.
 */
internal object Overrides {

    /** `CONFIG_VALUE_*` Boolean keys and the value to force. */
    val booleans = LinkedHashMap<String, Boolean>()

    /** `CONFIG_VALUE_*` Long keys and the value to force. */
    val longs = LinkedHashMap<String, Long>()

    /** `CONFIG_VALUE_*` String keys and the value to force. */
    val strings = LinkedHashMap<String, String>()

    /**
     * `CONFIG_VALUE_*` Boolean keys written into Waze's native config store instead of the Java
     * getter. Anything the native layer decides (camera sounds, alert policy) never calls the
     * getter, so a forced return value there is invisible to it.
     */
    val nativeBooleans = LinkedHashMap<String, Boolean>()
}
