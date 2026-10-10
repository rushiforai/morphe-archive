package dev.twitchpatches.patches.twitch.shared.hermes

internal data class MetroExport(val module: Int, val name: String)

internal class MetroExports(private val bundle: HermesBundle) {
    fun resolveAsync(name: String, properties: Set<String>, strings: Set<String>): MetroExport {
        val target = resolve(name, setOf("apply"))
        val function = bundle.functions.single { bundle.strings[it.name] == name && it.params == 2 }
        require(descendants(function).containsAll(properties + strings)) { "Modern Twitch: $name async contract changed." }
        return target
    }

    fun requireNestedContract(name: String, properties: Set<String>) {
        val function = bundle.functions.single { bundle.strings[it.name] == name && it.params == 2 }
        require(descendants(function).containsAll(properties)) { "Modern Twitch: $name completion contract changed." }
    }

    fun requireFunctionContract(name: String, params: Int, properties: Set<String>) {
        val function = bundle.functions.single { bundle.strings[it.name] == name && it.params == params }
        require(descendants(function).containsAll(properties)) { "Modern Twitch: $name parser contract changed." }
    }

    private fun descendants(root: HermesBundle.Function): Set<String> {
        val visited = mutableSetOf<Int>()
        val symbols = mutableSetOf<String>()
        var pending = listOf(root)
        repeat(8) {
            val next = mutableListOf<HermesBundle.Function>()
            pending.forEach { function ->
                if (visited.add(function.id)) bundle.instructions(function).forEach { ins ->
                    if (ins.name.startsWith("GetById") || ins.name == "TryGetById" || ins.name.startsWith("LoadConstString"))
                        symbols.add(bundle.strings[ins.args.last()])
                    if (ins.name in setOf("NewObjectWithBuffer", "NewObjectWithBufferLong")) {
                        val literal = bundle.objectLiteral(ins.args[1], ins.args[2])
                        symbols.addAll(literal.values.filterIsInstance<String>())
                        if (literal["success"] == false && literal["error"] == "No ad available (204 no-fill)")
                            symbols.add("native-feed-no-fill-object")
                    }
                    if (ins.name in setOf("CreateClosure", "CreateGenerator")) next.add(bundle.functions[ins.args[2]])
                    if (ins.name == "LoadFromEnvironment" && function == root) {
                        val parent = bundle.functions.filter { it.params == 8 }.single { factory ->
                            bundle.instructions(factory).any { it.name == "CreateClosure" && it.args[2] == root.id }
                        }
                        val code = bundle.instructions(parent)
                        code.zipWithNext().filter { (create, store) -> create.name == "CreateClosure" &&
                            store.name == "StoreToEnvironment" && store.args[1] == ins.args[2] &&
                            store.args[2] == create.args[0] }.forEach { (create, _) -> next.add(bundle.functions[create.args[2]]) }
                    }
                }
            }
            pending = next
        }
        return symbols
    }

    fun reactModule(): Int {
        val hook = bundle.functions.single { bundle.strings[it.name] == "useClaimableBonus" }
        val body = bundle.instructions(hook)
        val index = body.indexOfFirst { it.name == "GetByIdShort" && bundle.strings[it.args.last()] == "useRef" }
        require(index >= 0)
        val register = body[index].args[1]
        val slot = body.take(index).last { it.name == "LoadFromEnvironment" && it.args[0] == register }.args[2]
        val factory = bundle.functions.single { fn -> fn.params == 8 && bundle.instructions(fn).any {
            it.name == "CreateClosure" && it.args[2] == hook.id
        } }
        val code = bundle.instructions(factory)
        val store = code.indexOfFirst { it.name == "StoreToEnvironment" && it.args[1] == slot }
        require(store >= 2)
        val call = code[store - 1]
        val read = code[store - 2]
        require(call.name == "Call2" && read.name == "GetByIndex" && call.args[0] == code[store].args[2] &&
            call.args[3] == read.args[0]) { "Modern Twitch: React dependency flow changed." }
        val arrays = mutableListOf<List<Int>>()
        val registers = mutableMapOf<Int, Int>()
        for (ins in bundle.instructions(bundle.functions[bundle.global])) {
            val a = ins.args
            if (ins.name.startsWith("NewArrayWithBuffer")) registers[a[0]] = a[3]
            if (ins.name == "CreateClosure" && a[2] == factory.id) {
                val globalCode = bundle.instructions(bundle.functions[bundle.global])
                val closureAt = globalCode.indexOf(ins)
                val define = globalCode.getOrNull(closureAt + 1)
                require(define?.name == "Call4" && define.args[3] == a[0])
                val offset = requireNotNull(registers[define.args[5]])
                val creation = globalCode.take(closureAt).last { it.name.startsWith("NewArrayWithBuffer") && it.args[0] == define.args[5] }
                arrays.add(bundle.integerArray(offset, creation.args[2]))
            }
        }
        return arrays.single()[read.args[2]]
    }
    fun resolve(name: String, requiredProperties: Set<String>, params: Int = 2): MetroExport {
        val named = bundle.functions.filter { bundle.strings[it.name] == name && it.params == params }
        check(named.isNotEmpty()) { "Modern Twitch: expected a $name function with arity $params." }
        val candidates = named.filter { candidate -> bundle.instructions(candidate).mapNotNull { ins ->
                if (ins.name.startsWith("GetById") || ins.name == "TryGetById")
                    bundle.strings.getOrNull(ins.args.last()) else null
            }.toSet().containsAll(requiredProperties) }
        require(candidates.isNotEmpty()) { "Modern Twitch: $name contract changed." }
        val function = candidates.singleOrNull() ?: error("Modern Twitch: expected one $name function matching its contract.")
        val parents = bundle.functions.filter { it.params == 8 }.filter { fn ->
            val instructions = bundle.instructions(fn)
            instructions.zipWithNext().any { (create, put) ->
                create.name == "CreateClosure" && create.args[2] == function.id &&
                    put.name == "PutByIdLoose" && put.args[1] == create.args[0] &&
                    bundle.strings[put.args[3]] == name && instructions.any {
                        it.name == "LoadParam" && it.args == listOf(put.args[0], 6)
                    }
            }
        }
        val factory = parents.singleOrNull() ?: error("Modern Twitch: expected one $name export factory.")
        return definition(factory, name)
    }

    fun resolveMemo(name: String, component: String, properties: Set<String>): MetroExport {
        val function = bundle.functions.filter { bundle.strings[it.name] == component && it.params == 2 }
            .singleOrNull() ?: error("Modern Twitch: expected one $component function.")
        require(descendants(function).containsAll(properties)) { "Modern Twitch: $component contract changed." }
        val factory = bundle.functions.filter { it.params == 8 }.single { parent ->
            val code = bundle.instructions(parent)
            code.indices.any { index ->
                val create = code[index]
                val call = code.getOrNull(index + 1)
                val put = code.getOrNull(index + 2)
                val memo = code.getOrNull(index - 1)
                create.name == "CreateClosure" && create.args[2] == function.id &&
                    call?.name == "Call2" && call.args[3] == create.args[0] &&
                    memo?.name == "GetById" && bundle.strings[memo.args.last()] == "memo" &&
                    call.args[1] == memo.args[0] && call.args[2] == memo.args[1] &&
                    put?.name == "PutByIdLoose" && put.args[1] == call.args[0] &&
                    bundle.strings[put.args.last()] == name && code.any {
                        it.name == "LoadParam" && it.args == listOf(put.args[0], 6)
                    }
            }
        }
        return definition(factory, name)
    }

    fun resolveDeferred(name: String, properties: Set<String>, component: String = name): MetroExport {
        val function = bundle.functions.single { bundle.strings[it.name] == component && it.params == 2 }
        requireFunctionContract(component, 2, properties)
        val factory = bundle.functions.filter { it.params == 8 }.singleOrNull { parent ->
            val values = mutableMapOf<Int, Value>()
            var matched = false
            for (ins in bundle.instructions(parent)) {
                val a = ins.args
                if (ins.name.startsWith("J")) break
                if (ins.name == "PutByIdLoose" && bundle.strings[a.last()] == name && values[a[0]] == Value.Exports)
                    matched = values[a[1]] == Value.Closure(function.id)
                val value: Value? = when (ins.name) {
                    "LoadParam" -> if (a[1] == 6) Value.Exports else null
                    "CreateClosure" -> Value.Closure(a[2])
                    "Mov", "MovLong" -> values[a[1]]
                    else -> null
                }
                if (a.isNotEmpty() && !ins.name.startsWith("Put") && !ins.name.startsWith("Store") && ins.name != "Ret") {
                    if (value == null) values.remove(a[0]) else values[a[0]] = value
                }
            }
            matched
        } ?: error("Modern Twitch: expected one proven $name deferred export.")
        return definition(factory, name)
    }

    fun resolveObjectExport(name: String, keys: Set<String>, methods: Map<String, Int> = emptyMap()): MetroExport {
        require(keys.isNotEmpty())
        val factory = bundle.functions.filter { it.params == 8 }.singleOrNull { parent ->
            val code = bundle.instructions(parent)
            val closures = code.filter { it.name == "CreateClosure" }.map { bundle.functions[it.args[2]] }
            if (!methods.all { (method, arity) ->
                closures.singleOrNull { bundle.strings[it.name] == method }?.params == arity
            }) return@singleOrNull false
            val values = mutableMapOf<Int, Value>()
            var matched = false
            for (ins in code) {
                val a = ins.args
                if (ins.name.startsWith("J")) break
                if (ins.name.startsWith("PutByIdLoose") && bundle.strings[a.last()] == name &&
                    values[a[0]] == Value.Exports) {
                    matched = (values[a[1]] as? Value.ObjectKeys)?.keys?.containsAll(keys) == true
                }
                val value: Value? = when (ins.name) {
                    "LoadParam" -> if (a[1] == 6) Value.Exports else null
                    "NewObjectWithBuffer", "NewObjectWithBufferLong" ->
                        Value.ObjectKeys(bundle.objectLiteral(a[1], a[2]).keys)
                    "Mov", "MovLong" -> values[a[1]]
                    else -> null
                }
                if (a.isNotEmpty() && !ins.name.startsWith("Put") && !ins.name.startsWith("Store") && ins.name != "Ret") {
                    if (value == null) values.remove(a[0]) else values[a[0]] = value
                }
            }
            matched
        } ?: error("Modern Twitch: expected one proven $name object export with ${keys.sorted()}.")
        return definition(factory, name)
    }

    private fun definition(factory: HermesBundle.Function, name: String): MetroExport {
        val modules = mutableListOf<Int>()
        val registers = mutableMapOf<Int, Value>()
        for (ins in bundle.instructions(bundle.functions[bundle.global])) {
            val a = ins.args
            val value: Value? = when (ins.name) {
                "LoadConstZero" -> Value.Constant(0)
                "LoadConstUInt8", "LoadConstInt" -> Value.Constant(a[1])
                "CreateClosure" -> Value.Closure(a[2])
                "TryGetById" -> if (bundle.strings[a.last()] == "__d") Value.Define else null
                "Mov", "MovLong" -> registers[a[1]]
                else -> null
            }
            if (ins.name == "Call4" && registers[a[1]] == Value.Define &&
                registers[a[3]] == Value.Closure(factory.id)) {
                val id = registers[a[4]] as? Value.Constant
                require(id != null && id.number >= 0) { "Modern Twitch: module ID is not a proven constant." }
                modules.add(id.number)
            }
            if (a.isNotEmpty() && !ins.name.startsWith("Put") && !ins.name.startsWith("Store") &&
                !ins.name.startsWith("J") && ins.name != "Ret") {
                if (value == null) registers.remove(a[0]) else registers[a[0]] = value
            }
        }
        return MetroExport(modules.singleOrNull() ?: error("Modern Twitch: $name Metro definition is ambiguous."), name)
    }

    private sealed interface Value {
        data class Constant(val number: Int) : Value
        data class Closure(val function: Int) : Value
        data class ObjectKeys(val keys: Set<String>) : Value
        data object Define : Value
        data object Exports : Value
    }
}
