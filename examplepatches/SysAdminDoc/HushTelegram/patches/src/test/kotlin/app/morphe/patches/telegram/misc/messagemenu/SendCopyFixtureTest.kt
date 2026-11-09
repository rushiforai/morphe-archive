/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.messagemenu

import app.morphe.ExtensionDex
import app.morphe.FixtureDex
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.util.names.origDefiningClass
import app.morphe.util.names.origName
import app.morphe.util.names.origParameterTypes
import app.morphe.util.names.origReturnType
import org.junit.Assert.assertEquals
import org.junit.Assert.assertNotNull
import org.junit.Assert.assertTrue
import org.junit.Test

/** The three sends Forward as copy calls, in every declared build, and the argument mapping the stubs generate. */
class SendCopyFixtureTest {
    private val fixed = setOf("Lorg/telegram/messenger/SendMessagesHelper;", "Lorg/telegram/messenger/AccountInstance;")

    @Test fun `each send is found once and its arguments are filled from the right stub registers`() {
        for (build in Fixtures.declaredBuilds()) {
            val context = PatchContexts.of(ExtensionDex.classes() + FixtureDex.classes(build, fixed).values)
            val sends = context.resolveCopySends()
            assertNotNull("${build.name}: the sends", sends)
            val (text, photo, document) = sends!!
            for ((send, name) in listOf(text to "prepareSendingText", photo to "prepareSendingPhoto", document to "prepareSendingDocument")) {
                assertEquals("${build.name}: $name", name, send.method.origName)
                val types = send.method.origParameterTypes
                // A dialog is a long, a flag a boolean, and a stub register only feeds a type it can hold.
                for ((index, register) in send.sources) {
                    val type = types[index]
                    when (register) {
                        "p1" -> assertEquals("${build.name}: $name arg $index", "J", type)
                        else -> assertTrue("${build.name}: $name arg $index is $type", type == "Ljava/lang/String;" || type == "Ljava/lang/CharSequence;")
                    }
                }
                for ((index, _) in send.literals) assertTrue("${build.name}: $name literal $index", types[index] == "Z")
            }
            assertEquals(mapOf(1 to "p3", 2 to "p1"), text.sources)
            // The caption: 13.2's photo send is the full one, where it comes after the media flags.
            val caption = photo.method.origParameterTypes.indexOf("Ljava/lang/CharSequence;")
            assertEquals("p4", photo.sources[caption])
            assertEquals("p5", document.sources[4])
            assertEquals("p4", document.sources[5])

            val (smali, registers) = copyCall(document, 6)
            val locals = document.method.parameterTypes.sumOf { if (it.toString() == "J") 2 else 1 }.toInt()
            assertEquals("${build.name}: registers", locals + 6, registers)
            val method = document.method
            val params = method.origParameterTypes
            assertTrue(
                "${build.name}: the call",
                smali.contains("invoke-static/range {v0 .. v${locals - 1}}, ${method.origDefiningClass}->prepareSendingDocument(${params.joinToString("")})${method.origReturnType}"),
            )
            assertTrue(smali.startsWith("invoke-static/range {p0 .. p0}, ${params[0]}->getInstance(I)${params[0]}"))
        }
    }
}
