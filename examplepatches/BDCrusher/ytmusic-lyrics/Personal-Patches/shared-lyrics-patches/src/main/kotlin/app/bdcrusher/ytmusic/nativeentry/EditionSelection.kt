/* Copyright 2026 BDCrusher. GPL-3.0. */
package app.bdcrusher.ytmusic.nativeentry

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import java.util.WeakHashMap

/** Patch-run scoped: category selection must never mix the two runtime owners. */
private object EditionSelection {
    private val selections = WeakHashMap<BytecodePatchContext, String>()

    @Synchronized
    fun claim(context: BytecodePatchContext, edition: String) {
        val previous = selections[context]
        if (previous != null && previous != edition) {
            throw PatchException("Choose one personal edition. For Lyrics-only Add-on, deselect every patch in Full Collection and use official Morphe with official Third-party lyrics disabled. For Full Collection, deselect Lyrics-only Add-on and official Morphe.")
        }
        selections[context] = edition
    }
}

val fullEditionGuard = bytecodePatch {
    execute { EditionSelection.claim(this, "Full Collection") }
}

val addonEditionGuard = bytecodePatch {
    execute { EditionSelection.claim(this, "Lyrics-only Add-on") }
}
