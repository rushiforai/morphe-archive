package dev.twitchpatches.patches.twitch.shared.hermes

import org.junit.Test

class MetroRegistrationsTest {
    private fun code(closure: Int = 93, clobber: Boolean = false, conditional: Boolean = false): List<HermesInstruction> {
        val code = mutableListOf(
            HermesInstruction("LoadParam", listOf(4, 6)),
            HermesInstruction("CreateClosure", listOf(7, 2, closure)),
            HermesInstruction("NewObjectWithBuffer", listOf(3, 0, 0)),
            HermesInstruction("PutOwnBySlotIdx", listOf(3, 7, 1)),
        )
        if (clobber) code.add(HermesInstruction("PutOwnBySlotIdx", listOf(3, 0, 1)))
        if (conditional) code.add(HermesInstruction("Jmp", listOf(4)))
        code.add(HermesInstruction("PutByIdLoose", listOf(4, 3, 0, 0)))
        return code
    }

    private fun check(code: List<HermesInstruction>) = requireRendererRegistration(code, listOf("fixtureRegistration"),
        93, "fixtureRegistration") { _, _ -> linkedMapOf("type" to null, "renderer" to null, "label" to null) }

    @Test fun registrationRetainsTheExportedRendererClosure() { check(code()) }

    @Test(expected = IllegalArgumentException::class) fun differentRendererCannotBeSilentlyAdapted() { check(code(closure = 94)) }

    @Test(expected = IllegalStateException::class) fun overwrittenRendererCannotReuseEarlierClosureProof() { check(code(clobber = true)) }

    @Test(expected = IllegalArgumentException::class) fun conditionalFactoryStopsPatching() { check(code(conditional = true)) }
}
