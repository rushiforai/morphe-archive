/*
 * Copyright 2026 HushGram contributors
 * https://github.com/SysAdminDoc/HushGram
 */
package app.morphe.patches.instagram

import java.io.File
import java.lang.ref.SoftReference

/**
 * What a test class reads out of each fixture build, kept for its other tests. An area's tests share
 * one JVM, and with every 450 build checked a class's reads of seven builds outlive it in a companion
 * map, so the area ran out of heap once enough classes had run. The values are held softly: the JVM
 * drops them before it would run out, and the next test that asks reads the build again.
 */
internal class FixtureCache<T : Any> {
    private val read = HashMap<String, SoftReference<T>>()

    /** The value kept for [bundle], or what [compute] reads now when there is none or it was dropped. */
    @Synchronized
    fun get(bundle: File, compute: () -> T): T {
        read[bundle.absolutePath]?.get()?.let { return it }
        return compute().also { read[bundle.absolutePath] = SoftReference(it) }
    }
}
