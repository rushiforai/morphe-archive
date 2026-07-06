package app.morphe.patches.piko.misc.version

import app.morphe.patcher.patch.resourcePatch
import java.util.logging.Logger
import kotlin.properties.Delegates

// Use notNull delegate so an exception is thrown if these fields are accessed before they are set.

var is_11_86_or_greater: Boolean by Delegates.notNull()
    private set
var is_11_88_or_greater: Boolean by Delegates.notNull()
    private set
var is_11_90_or_greater: Boolean by Delegates.notNull()
    private set
var is_11_97_or_greater: Boolean by Delegates.notNull()
    private set
var is_11_99_or_greater: Boolean by Delegates.notNull()
    private set
var is_12_05_or_greater: Boolean by Delegates.notNull()
    private set

val versionCheckPatch = resourcePatch {
    execute {
        val versionCode = packageMetadata.versionCode.toInt()
        fun isEqualsOrGreaterThan(version: Int): Boolean {
            return versionCode >= version
        }

        is_11_86_or_greater = isEqualsOrGreaterThan(311860000)
        is_11_88_or_greater = isEqualsOrGreaterThan(311880000)
        is_11_90_or_greater = isEqualsOrGreaterThan(311900000)
        is_11_97_or_greater = isEqualsOrGreaterThan(311970000)
        is_11_99_or_greater = isEqualsOrGreaterThan(311990000)
        is_12_05_or_greater = isEqualsOrGreaterThan(312050000)

        if (!is_11_86_or_greater) {
            throw RuntimeException(
                "\n\n#####################################\n\n" +
                        "${packageMetadata.versionName} is not a supported version" +
                        "\n\nPlease use 11.86.0-release.0+\n\n" +
                        "#####################################\n\n"
            )
        }
        if (is_12_05_or_greater) {
            Logger.getLogger(this::class.java.name).info(
                "\n\n#####################################\n\n" +
                        "X Shim may not be necessary for this version\n\n" +
                        "#####################################\n\n"
            )
        }
    }
}
