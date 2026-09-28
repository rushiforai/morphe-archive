/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.comments

import app.morphe.ExtensionDex
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.patches.facebook.feed.FixtureDex
import app.morphe.patches.facebook.misc.extension.SETTINGS_STATUS
import app.morphe.patches.shared.compat.AppCompatibilities
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Test

/**
 * Default comment order on every Facebook build the bundle declares: one builder of a comment
 * request reads the order, the feedback id and the focused comment id from FetchFeedbackParams;
 * one constructor of the params stores all three from its own parameters; one pick handler fetches
 * the order-change request from a copy of the sheet's FeedbackParams; the three tokens the
 * extension asks for are in the build; and the patch, run on those classes, asks the extension
 * first in the constructor and tells it first in the handler. Reads the fixture bundles from
 * HUSHFACEBOOK_FIXTURE_DIR and skips without it.
 */
class DefaultCommentOrderFixtureTest {
    private val feedbackParams = "Lcom/facebook/ufiservices/flyout/params/FeedbackParams;"

    /** Facebook's names for Most relevant, Newest and All comments, which DefaultCommentOrderTest pins too. */
    private val tokens = listOf(
        "RANKED_FILTERED_INTENT_V1",
        "RECENT_ACTIVITY_INTENT_V1",
        "RANKED_UNFILTERED_CHRONOLOGICAL_REPLIES_INTENT_V1",
    )

    private fun Instruction.callRegisters(): List<Int> = when (this) {
        is RegisterRangeInstruction -> (startRegister until startRegister + registerCount).toList()
        is FiveRegisterInstruction -> listOf(registerC, registerD, registerE, registerF, registerG).take(registerCount)
        else -> emptyList()
    }

    private fun Method.body(): List<Instruction> = implementation!!.instructions.toList()

    private fun Method.parameters() = parameterTypes.map { it.toString() }

    private fun makesFeedbackParams(method: Method): Boolean = method.body().any {
        val call = (it as? ReferenceInstruction)?.reference as? MethodReference
        it.opcode == Opcode.INVOKE_DIRECT && call?.definingClass == feedbackParams && call.name == "<init>"
    }

    @Test
    fun `each declared build builds its comment requests the way the patch reads them, and the patch goes in`() {
        val versions = AppCompatibilities.facebook().single().targets.mapNotNull { it.version }.toSet()
        assertTrue("the bundle declares no Facebook build", versions.isNotEmpty())
        val checked = mutableSetOf<String>()
        for (version in versions) {
            for (bundle in Fixtures.files { it.extension == "apkm" && it.name.contains("-$version-") }) {
                val name = bundle.name
                val builderOwners = FixtureDex.classesHolding(bundle, ORDER_VARIABLE)
                val builders = builderOwners.flatMap { owner ->
                    owner.methods.mapNotNull { method -> requestFields(method)?.let { method to it } }
                }
                assertEquals("$name: request builders reading the three variables", 1, builders.size)
                val (builder, fields) = builders.single()
                assertTrue("$name: the builder takes the session",
                    USER_SESSION in builder.parameters() && FETCH_FEEDBACK_PARAMS in builder.parameters())

                val params = FixtureDex.classes(bundle, setOf(FETCH_FEEDBACK_PARAMS))[FETCH_FEEDBACK_PARAMS]
                    ?: throw AssertionError("$name: no $FETCH_FEEDBACK_PARAMS")
                val constructors = params.methods.mapNotNull { method -> requestRegisters(method, fields)?.let { method to it } }
                assertEquals("$name: params constructors storing the three from parameters", 1, constructors.size)
                assertEquals("$name: params constructors", 1, params.methods.count { it.name == "<init>" })
                val (constructor, registers) = constructors.single()
                val read = listOf(registers.order, registers.feedbackId, registers.focusedComment)
                assertTrue("$name: a register past v15: $read", read.all { it <= 15 })

                val handlerOwners = FixtureDex.classesHolding(bundle, PICK_QUERY)
                val handlers = handlerOwners.flatMap { owner -> owner.methods.filter(::isPickHandler) }
                assertEquals("$name: comment sheet pick handlers", 1, handlers.size)
                val handler = handlers.single()
                assertTrue("$name: the pick handler makes no FeedbackParams copy", makesFeedbackParams(handler))

                for (token in tokens) {
                    assertTrue("$name: $token isn't in this build", FixtureDex.classesHolding(bundle, token).isNotEmpty())
                }

                val owners = mutableMapOf<String, ClassDef>()
                owners[params.type] = params
                (builderOwners + handlerOwners).forEach { owners[it.type] = it }
                val context = PatchContexts.of(owners.values + ExtensionDex.classDef(SETTINGS_STATUS))
                defaultCommentOrderPatch.execute(context)

                val patchedConstructor = context.mutableClassDefBy(FETCH_FEEDBACK_PARAMS).methods.single {
                    it.name == "<init>" && it.parameters() == constructor.parameters()
                }.body()
                val asks = patchedConstructor[0]
                assertEquals("$name: the constructor's call", REQUESTED_ORDER, (asks as ReferenceInstruction).reference.toString())
                assertEquals("$name: what the call reads", read, asks.callRegisters())
                assertEquals(Opcode.MOVE_RESULT_OBJECT, patchedConstructor[1].opcode)
                assertEquals("$name: where the answer goes", registers.order,
                    (patchedConstructor[1] as OneRegisterInstruction).registerA)
                assertEquals("$name: the constructor after the call", constructor.body().map { it.opcode },
                    patchedConstructor.drop(2).map { it.opcode })

                val patchedHandler = context.mutableClassDefBy(handler.definingClass).methods.single {
                    it.name == handler.name && it.parameters() == handler.parameters()
                }.body()
                val tells = patchedHandler[0]
                assertEquals(Opcode.INVOKE_STATIC_RANGE, tells.opcode)
                assertEquals("$name: the handler's call", PICKED, (tells as ReferenceInstruction).reference.toString())
                val token = handler.implementation!!.registerCount - 1
                assertEquals("$name: the handler hands on the picked token", listOf(token), tells.callRegisters())
                assertEquals("$name: the handler after the call", handler.body().map { it.opcode },
                    patchedHandler.drop(1).map { it.opcode })
                checked += version
            }
        }
        assertEquals("a declared build has no fixture", versions, checked)
    }
}
