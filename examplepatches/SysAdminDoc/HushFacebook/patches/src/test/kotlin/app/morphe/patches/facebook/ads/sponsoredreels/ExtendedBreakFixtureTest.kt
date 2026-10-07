/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.ads.sponsoredreels

import app.morphe.Fixtures
import app.morphe.patches.facebook.feed.FixtureDex
import app.morphe.patches.facebook.feed.holdsString
import app.morphe.patches.shared.compat.AppCompatibilities
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import org.junit.Assert.assertEquals
import org.junit.Test

/**
 * The extended break's query on each declared build: one method builds it and hands it to the
 * shared GraphQL executor, by a static call answering a SettableFuture with its result moved
 * straight after, which is what lets the patch put its failed future in that call's place.
 *
 * Read from 581 (2026-10-06): the method is `LX/Ra7;->A07`, the executor `LX/6i6;->A0d`. None of
 * those names is used here.
 */
class ExtendedBreakFixtureTest {
    private val versions = AppCompatibilities.facebook().single().targets.mapNotNull { it.version }.toSet()

    @Test
    fun `the extended break's executor call can take the failed future, on each declared build`() {
        val checked = mutableSetOf<String>()
        for (version in versions) {
            for (bundle in Fixtures.files { it.extension == "apkm" && it.name.contains("-$version-") }) {
                val name = bundle.name
                val methods = FixtureDex.classesHolding(bundle, EXTENDED_BREAK_QUERY).flatMap { it.methods }
                    .filter { holdsString(it, EXTENDED_BREAK_QUERY) && holdsString(it, EXTENDED_BREAK_FETCH_LOG) }
                assertEquals("$name: one method fetches the extended break", 1, methods.size)
                val method = methods.single()
                assertEquals("$name: and returns nothing", "V", method.returnType)
                val body = method.implementation!!.instructions.toList()

                val call = idleExecutorCallIndex(body, name, EXTENDED_BREAK_QUERY)
                val executor = (body[call] as ReferenceInstruction).reference as MethodReference
                assertEquals("$name: the executor answers a SettableFuture",
                    "Lcom/google/common/util/concurrent/SettableFuture;", executor.returnType)
                assertEquals("$name: and is static", Opcode.INVOKE_STATIC, body[call].opcode)
                assertEquals("$name: before the log of the fetch", true,
                    body.drop(call).any { ((it as? ReferenceInstruction)?.reference as? StringReference)?.string == EXTENDED_BREAK_FETCH_LOG })
                checked += version
            }
        }
        assertEquals("a declared build has no fixture", versions, checked)
    }
}
