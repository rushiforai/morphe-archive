/*
 * Copyright 2026 HushThreads contributors
 * https://github.com/SysAdminDoc/HushThreads
 */
package app.morphe.patches.threads.misc.extension

import app.morphe.FixtureDex
import app.morphe.Fixtures
import org.junit.Assert.assertEquals
import org.junit.Test
import java.util.concurrent.ConcurrentHashMap

class ComposeNotesFixtureTest {
    @Test
    fun `every key in the note table goes to a trace call on every declared build`() {
        val keys = composeNoteKeys("").toSet()
        for (build in Fixtures.declaredBuilds()) {
            val seen = ConcurrentHashMap.newKeySet<Int>()
            FixtureDex.methodsWhere(build, { true }) { method ->
                val body = method.implementation?.instructions?.toList().orEmpty()
                body.noteSites("").forEach { seen += body.traceCallAt(it)!!.key }
                false
            }
            assertEquals(build.name, emptySet<Int>(), keys - seen)
        }
    }
}
