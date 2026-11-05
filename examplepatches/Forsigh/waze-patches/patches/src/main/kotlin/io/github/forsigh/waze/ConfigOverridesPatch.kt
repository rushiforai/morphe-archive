package io.github.forsigh.waze

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import io.github.forsigh.waze.WazeConstants.COMPATIBILITY_WAZE

/**
 * Applies every config override the other patches registered, as exactly one block per typed getter.
 *
 * This patch injects nothing itself until [finalize], which runs after all patches have executed -
 * that is what lets it see the complete [Overrides] registry regardless of patch order, and why the
 * individual patches need no dependencies on each other.
 *
 * Every key is gated on what the target build actually declares in `ConfigValues`: the injected
 * `sget-object` resolves at app runtime, so a key the build no longer has is a NoSuchFieldError at
 * startup, not a patch-time error - that is exactly how the 5.25.90.900 beta crashed
 * (`AAP_USE_NORMAL_CAR_GPS_UPDATE_RATE` was dropped from that build). Keys absent on the target are
 * skipped with a log line instead of ever being referenced.
 */
private const val CONFIG_MANAGER = "Lcom/waze/ConfigManager;"
private const val NATIVE_HELPER = "uaNativeOverrides"

/** The two callbacks Waze's native layer fires once a server config has landed. */
private val SYNC_HOOKS = listOf(
    CONFIG_MANAGER to "onConfigSyncedFromServer",
    "Lcom/waze/config/PreferencesConfigNativeManagerBase;" to "onPreferencesConfigSyncedJNI",
)

@Suppress("unused")
val configOverridesPatch = bytecodePatch(
    name = null,
    description = "Applies the configuration changes requested by the other patches. Applied " +
        "automatically; there is nothing to configure.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_WAZE)

    finalize {
        val declared = classDefByOrNull("Lcom/waze/config/ConfigValues;")
            ?.fields?.mapTo(mutableSetOf()) { it.name to it.type }
        if (declared == null) {
            println("configOverridesPatch: WARNING - ConfigValues not found, keys are not gated")
        }

        val skipped = mutableSetOf<String>()
        fun <V> Map<String, V>.onlyDeclared(type: String): Map<String, V> {
            if (declared == null) return this
            return filterKeys { key ->
                val ok = (key to type) in declared
                if (!ok) skipped += key
                ok
            }
        }

        val booleans = Overrides.booleans.onlyDeclared("Lcom/waze/config/b;")
        val longs = Overrides.longs.onlyDeclared("Lcom/waze/config/c;")
        val strings = Overrides.strings.onlyDeclared("Lcom/waze/config/d;")

        if (booleans.isNotEmpty()) {
            BooleanConfigGetterFingerprint.method.addInstructions(
                0,
                forceBoolean("ovb", booleans),
            )
        }
        if (longs.isNotEmpty()) {
            LongConfigGetterFingerprint.method.addInstructions(
                0,
                forceLong("ovl", longs),
            )
        }
        if (strings.isNotEmpty()) {
            StringConfigGetterFingerprint.method.addInstructions(
                0,
                forceString("ovs", strings),
            )
        }
        val natives = Overrides.nativeBooleans.onlyDeclared("Lcom/waze/config/b;")
        if (natives.isNotEmpty()) {
            val manager = mutableClassDefBy(CONFIG_MANAGER)
            if (manager.methods.any { it.name == NATIVE_HELPER }) {
                throw PatchException("configOverridesPatch: $NATIVE_HELPER already exists")
            }
            val helper = MutableMethod(
                ImmutableMethod(
                    CONFIG_MANAGER, NATIVE_HELPER, emptyList(), "V",
                    AccessFlags.PUBLIC.value or AccessFlags.STATIC.value,
                    emptySet(), emptySet(),
                    ImmutableMethodImplementation(3, emptyList(), emptyList(), emptyList()),
                ),
            )
            helper.addInstructions(0, nativeSyncBlock(natives))
            manager.methods.add(helper)
            SYNC_HOOKS.forEach { (cls, method) ->
                val hook = runCatching { mutableClassDefBy(cls) }.getOrNull()
                    ?.methods?.firstOrNull { it.name == method }
                    ?: throw PatchException(
                        "configOverridesPatch: $cls.$method is missing, so the native config " +
                            "values could not be re-applied after a server sync"
                    )
                hook.addInstructions(0, "invoke-static {}, $CONFIG_MANAGER->$NATIVE_HELPER()V")
            }
            println("configOverridesPatch: ${natives.size} key(s) written to the native config store on every sync")
        }
        if (skipped.isNotEmpty()) {
            println("configOverridesPatch: skipped ${skipped.size} key(s) absent on this build: ${skipped.sorted()}")
        }
    }
}
