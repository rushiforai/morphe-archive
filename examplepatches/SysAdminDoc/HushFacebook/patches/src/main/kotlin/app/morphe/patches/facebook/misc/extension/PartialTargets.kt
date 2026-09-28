/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.misc.extension

import app.morphe.patcher.patch.PatchException
import java.util.logging.Logger

/**
 * Where a patch writes at patch time. Morphe's desktop CLI prints every logger named under
 * `app.morphe`, a warning as a `WARNING:` line, and Morphe Manager shows them in its patch log.
 */
internal val patchLog: Logger = Logger.getLogger("app.morphe.patches.facebook")

/**
 * What a patch that works down a list of separate targets does when a build lacks some of them.
 *
 * [handle] is asked about each target once, in order, and does the patch's work on it. It answers
 * null when the target was there and has been dealt with, or why it wasn't, naming the target. A
 * build with some of the list gets the protection that's left, and the patch log names each target
 * the patch went without, one warning apiece, so a partly renamed build no longer passes quietly.
 * A build with none of them stops the patch, naming every one: applying then would claim a
 * protection the app doesn't get.
 *
 * @param what the targets' kind in the plural, as the messages say it ("ad prefetch schedulers")
 * @return how many targets were dealt with
 */
internal fun <T> handleTargets(patch: String, what: String, targets: List<T>, handle: (T) -> String?): Int {
    require(targets.isNotEmpty()) { "$patch has no $what to look for" }
    val missing = targets.mapNotNull(handle)
    if (missing.size == targets.size) {
        throw PatchException(
            "$patch: this Facebook build has none of the ${targets.size} $what the patch works on. " +
                missing.joinToString("; ", postfix = "."),
        )
    }
    val handled = targets.size - missing.size
    missing.forEach { reason ->
        patchLog.warning("$patch: $reason. The patch goes on with the $handled of ${targets.size} $what it found.")
    }
    return handled
}

/** A class descriptor as Java writes the name: `Lcom/facebook/Foo;` is `com.facebook.Foo`. */
internal fun javaName(descriptor: String): String =
    descriptor.removePrefix("L").removeSuffix(";").replace('/', '.')
