package dev.twitchpatches.patches.twitch.shared.hermes

internal sealed interface MetroValue {
    data class Constant(val number: Int) : MetroValue
    data class Closure(val function: Int) : MetroValue
    data class ObjectKeys(val keys: Set<String>) : MetroValue
    data object Define : MetroValue
    data object Exports : MetroValue
}

internal class MetroIndex(private val bundle: HermesBundle) {
    val globalCode: List<HermesInstruction> by lazy { bundle.instructions(bundle.functions[bundle.global]) }
    val descendantSymbols = mutableMapOf<Int, Set<String>>()

    private class FactoryLinks(
        val byClosure: Map<Int, List<HermesBundle.Function>>,
        val byExport: Map<String, List<HermesBundle.Function>>,
    )

    private val factoryLinks by lazy {
        val byClosure = HashMap<Int, MutableList<HermesBundle.Function>>()
        val byExport = HashMap<String, MutableList<HermesBundle.Function>>()
        bundle.functions.filter { it.params == 8 }.forEach { factory ->
            val closures = HashSet<Int>()
            val exports = HashSet<String>()
            bundle.instructions(factory).forEach { instruction ->
                if (instruction.name == "CreateClosure") closures.add(instruction.args[2])
                if (instruction.name.startsWith("PutByIdLoose"))
                    bundle.strings.getOrNull(instruction.args.last())?.let(exports::add)
            }
            closures.forEach { byClosure.getOrPut(it) { mutableListOf() }.add(factory) }
            exports.forEach { byExport.getOrPut(it) { mutableListOf() }.add(factory) }
        }
        FactoryLinks(byClosure, byExport)
    }

    private val moduleIdsByFactory by lazy {
        val modules = HashMap<Int, MutableList<Int?>>()
        val registers = HashMap<Int, MetroValue>()
        for (instruction in globalCode) {
            val args = instruction.args
            val value: MetroValue? = when (instruction.name) {
                "LoadConstZero" -> MetroValue.Constant(0)
                "LoadConstUInt8", "LoadConstInt" -> MetroValue.Constant(args[1])
                "CreateClosure" -> MetroValue.Closure(args[2])
                "TryGetById" -> if (bundle.strings[args.last()] == "__d") MetroValue.Define else null
                "Mov", "MovLong" -> registers[args[1]]
                else -> null
            }
            if (instruction.name == "Call4" && registers[args[1]] == MetroValue.Define) {
                val factory = registers[args[3]] as? MetroValue.Closure
                val module = registers[args[4]] as? MetroValue.Constant
                if (factory != null) modules.getOrPut(factory.function) { mutableListOf() }.add(module?.number)
            }
            if (args.isNotEmpty() && !instruction.name.startsWith("Put") && !instruction.name.startsWith("Store") &&
                !instruction.name.startsWith("J") && instruction.name != "Ret") {
                if (value == null) registers.remove(args[0]) else registers[args[0]] = value
            }
        }
        modules
    }

    fun factoriesCreating(function: Int): List<HermesBundle.Function> = factoryLinks.byClosure[function].orEmpty()

    fun factoriesExporting(name: String): List<HermesBundle.Function> = factoryLinks.byExport[name].orEmpty()

    fun export(factory: HermesBundle.Function, name: String): MetroExport {
        val modules = moduleIdsByFactory[factory.id].orEmpty()
        modules.forEach { require(it != null && it >= 0) { "Modern Twitch: module ID is not a proven constant." } }
        return MetroExport(modules.singleOrNull() ?: error("Modern Twitch: $name Metro definition is ambiguous."), name)
    }
}
