package dev.twitchpatches.patches.twitch.shared.hermes

internal data class MetroExport(val module: Int, val name: String)

internal class MetroExports(private val bundle: HermesBundle) {
    private val metroIndex = bundle.metroIndex

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
        val symbols = descendants(function)
        if (symbols.containsAll(properties)) return
        val delegates = symbols.filter { it != name && it.endsWith(name) }
        require(name == "BottomSheet" && delegates.toSet() == setOf("NativeBottomSheet", "RNBottomSheet") &&
            delegates.all { delegate ->
                val implementation = bundle.functions.singleOrNull { bundle.strings[it.name] == delegate && it.params == params }
                implementation != null && descendants(implementation).containsAll(properties)
            }) {
            "Modern Twitch: $name parser contract changed."
        }
    }

    private fun descendants(root: HermesBundle.Function): Set<String> = metroIndex.descendantSymbols.getOrPut(root.id) {
        val visited = mutableSetOf<Int>()
        val symbols = mutableSetOf<String>()
        val parentCode by lazy {
            metroIndex.factoriesCreating(root.id).singleOrNull()?.let(bundle::instructions).orEmpty()
        }
        var pending = listOf(root)
        repeat(8) {
            val next = mutableListOf<HermesBundle.Function>()
            pending.forEach { function ->
                if (visited.add(function.id)) bundle.instructions(function).forEach { ins ->
                    if (ins.name.startsWith("GetById") || ins.name == "TryGetById" || ins.name.startsWith("LoadConstString"))
                        symbols.add(bundle.strings[ins.args.last()])
                    if (ins.name in setOf("NewObjectWithBuffer", "NewObjectWithBufferLong")) {
                        val literal = bundle.objectLiteral(ins.args[1], ins.args[2])
                        symbols.addAll(literal.keys)
                        symbols.addAll(literal.values.filterIsInstance<String>())
                        if (literal["success"] == false && literal["error"] == "No ad available (204 no-fill)")
                            symbols.add("native-feed-no-fill-object")
                    }
                    if (ins.name in setOf("CreateClosure", "CreateGenerator")) next.add(bundle.functions[ins.args[2]])
                    if (ins.name == "LoadFromEnvironment" && function == root) {
                        parentCode.zipWithNext().filter { (create, store) -> create.name == "CreateClosure" &&
                            store.name == "StoreToEnvironment" && store.args[1] == ins.args[2] &&
                            store.args[2] == create.args[0] }.forEach { (create, _) -> next.add(bundle.functions[create.args[2]]) }
                    }
                }
            }
            pending = next
        }
        symbols
    }

    fun reactModule(): Int {
        val hook = bundle.functions.single { bundle.strings[it.name] == "useClaimableBonus" }
        val body = bundle.instructions(hook)
        val index = body.indexOfFirst { it.name == "GetByIdShort" && bundle.strings[it.args.last()] == "useRef" }
        require(index >= 0)
        val register = body[index].args[1]
        val slot = body.take(index).last { it.name == "LoadFromEnvironment" && it.args[0] == register }.args[2]
        val factory = metroIndex.factoriesCreating(hook.id).single()
        val code = bundle.instructions(factory)
        val store = code.indexOfFirst { it.name == "StoreToEnvironment" && it.args[1] == slot }
        require(store >= 2)
        val call = code[store - 1]
        val read = code[store - 2]
        require(call.name == "Call2" && read.name == "GetByIndex" && call.args[0] == code[store].args[2] &&
            call.args[3] == read.args[0]) { "Modern Twitch: React dependency flow changed." }
        val arrays = mutableListOf<List<Int>>()
        val registers = mutableMapOf<Int, Int>()
        val globalCode = metroIndex.globalCode
        for (ins in globalCode) {
            val a = ins.args
            if (ins.name.startsWith("NewArrayWithBuffer")) registers[a[0]] = a[3]
            if (ins.name == "CreateClosure" && a[2] == factory.id) {
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
        val parents = metroIndex.factoriesCreating(function.id).filter { fn ->
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
        return metroIndex.export(factory, name)
    }

    fun resolveMemo(name: String, component: String, properties: Set<String>): MetroExport {
        val function = bundle.functions.filter { bundle.strings[it.name] == component && it.params == 2 }
            .singleOrNull() ?: error("Modern Twitch: expected one $component function.")
        require(descendants(function).containsAll(properties)) { "Modern Twitch: $component contract changed." }
        val factory = metroIndex.factoriesCreating(function.id).single { parent ->
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
        return metroIndex.export(factory, name)
    }

    fun resolveDeferred(name: String, properties: Set<String>, component: String = name): MetroExport {
        val function = bundle.functions.single { bundle.strings[it.name] == component && it.params == 2 }
        requireFunctionContract(component, 2, properties)
        val factory = metroIndex.factoriesCreating(function.id).singleOrNull { parent ->
            val values = mutableMapOf<Int, MetroValue>()
            var matched = false
            for (ins in bundle.instructions(parent)) {
                val a = ins.args
                if (ins.name.startsWith("J")) break
                if (ins.name == "PutByIdLoose" && bundle.strings[a.last()] == name && values[a[0]] == MetroValue.Exports)
                    matched = values[a[1]] == MetroValue.Closure(function.id)
                val value: MetroValue? = when (ins.name) {
                    "LoadParam" -> if (a[1] == 6) MetroValue.Exports else null
                    "CreateClosure" -> MetroValue.Closure(a[2])
                    "Mov", "MovLong" -> values[a[1]]
                    else -> null
                }
                if (a.isNotEmpty() && !ins.name.startsWith("Put") && !ins.name.startsWith("Store") && ins.name != "Ret") {
                    if (value == null) values.remove(a[0]) else values[a[0]] = value
                }
            }
            matched
        } ?: error("Modern Twitch: expected one proven $name deferred export.")
        return metroIndex.export(factory, name)
    }

    fun resolveObjectExport(name: String, keys: Set<String>, methods: Map<String, Int> = emptyMap()): MetroExport {
        require(keys.isNotEmpty())
        val factory = metroIndex.factoriesExporting(name).singleOrNull { parent ->
            val code = bundle.instructions(parent)
            val closures = code.filter { it.name == "CreateClosure" }.map { bundle.functions[it.args[2]] }
            if (!methods.all { (method, arity) ->
                closures.singleOrNull { bundle.strings[it.name] == method }?.params == arity
            }) return@singleOrNull false
            val values = mutableMapOf<Int, MetroValue>()
            var matched = false
            for (ins in code) {
                val a = ins.args
                if (ins.name.startsWith("J")) break
                if (ins.name.startsWith("PutByIdLoose") && bundle.strings[a.last()] == name &&
                    values[a[0]] == MetroValue.Exports) {
                    matched = (values[a[1]] as? MetroValue.ObjectKeys)?.keys?.containsAll(keys) == true
                }
                val value: MetroValue? = when (ins.name) {
                    "LoadParam" -> if (a[1] == 6) MetroValue.Exports else null
                    "NewObjectWithBuffer", "NewObjectWithBufferLong" ->
                        MetroValue.ObjectKeys(bundle.objectLiteral(a[1], a[2]).keys)
                    "Mov", "MovLong" -> values[a[1]]
                    else -> null
                }
                if (a.isNotEmpty() && !ins.name.startsWith("Put") && !ins.name.startsWith("Store") && ins.name != "Ret") {
                    if (value == null) values.remove(a[0]) else values[a[0]] = value
                }
            }
            matched
        } ?: error("Modern Twitch: expected one proven $name object export with ${keys.sorted()}.")
        return metroIndex.export(factory, name)
    }
}
