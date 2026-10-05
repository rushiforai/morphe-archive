package dev.twitchpatches.patches.twitch.shared.hermes

internal class MetroRegistrations(private val bundle: HermesBundle) {
    fun requireRenderer(component: String, registration: String) {
        val function = bundle.functions.single { bundle.strings[it.name] == component && it.params == 2 }
        val factory = bundle.functions.filter { it.params == 8 }.single { parent ->
            bundle.instructions(parent).any { it.name == "CreateClosure" && it.args[2] == function.id }
        }
        requireRendererRegistration(bundle.instructions(factory), bundle.strings, function.id, registration, bundle::objectLiteral)
    }
}

internal fun requireRendererRegistration(code: List<HermesInstruction>, strings: List<String>, component: Int,
    registration: String, literalAt: (Int, Int) -> Map<String, Any?>) {
        require(code.none { it.name.startsWith("J") }) { "Modern Twitch: $registration factory flow is conditional." }
        val exportAt = code.indices.lastOrNull { index ->
            val instruction = code[index]
            instruction.name == "PutByIdLoose" && strings[instruction.args.last()] == registration
        } ?: error("Modern Twitch: $registration export is missing.")
        val export = code[exportAt]
        val exports = lastWrite(code, exportAt, export.args[0])
        require(exports.name == "LoadParam" && exports.args[1] == 6) { "Modern Twitch: $registration owner changed." }
        val objectRegister = export.args[1]
        val literal = lastWrite(code, exportAt, objectRegister)
        require(literal.name in setOf("NewObjectWithBuffer", "NewObjectWithBufferLong")) {
            "Modern Twitch: $registration is not a proven object literal."
        }
        val keys = literalAt(literal.args[1], literal.args[2]).keys.toList()
        val rendererSlot = keys.indexOf("renderer")
        require(rendererSlot >= 0 && "type" in keys && "label" in keys) { "Modern Twitch: $registration fields changed." }
        val literalAt = code.indexOf(literal)
        val setAt = (literalAt + 1 until exportAt).lastOrNull { index ->
            val instruction = code[index]
            instruction.name == "PutOwnBySlotIdx" && instruction.args[0] == objectRegister && instruction.args[2] == rendererSlot
        } ?: error("Modern Twitch: $registration renderer assignment is missing.")
        val closure = lastWrite(code, setAt, code[setAt].args[1])
        require(closure.name == "CreateClosure" && closure.args[2] == component) {
            "Modern Twitch: $registration no longer captures the exported renderer."
        }
}

private fun lastWrite(code: List<HermesInstruction>, before: Int, register: Int): HermesInstruction =
        code.take(before).lastOrNull { instruction ->
            instruction.args.firstOrNull() == register && instruction.name != "Ret" &&
                !instruction.name.startsWith("Put") && !instruction.name.startsWith("Store") &&
                !instruction.name.startsWith("Define")
        } ?: error("Modern Twitch: highlight register has no proven definition.")
