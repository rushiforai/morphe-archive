package dev.twitchpatches.patches.twitch.shared.hermes

internal fun themePaletteModule(bundle: HermesBundle): Int {
    val provider = bundle.functions.single { function ->
        bundle.strings[function.name] == "ThemeProvider" && function.params == 2 &&
            bundle.instructions(function).filter { it.name.startsWith("GetById") }
                .map { bundle.strings[it.args.last()] }.toSet().containsAll(setOf("theme", "children", "darkTheme", "Provider"))
    }
    val factory = bundle.metroIndex.factoriesCreating(provider.id).single()
    val index = themePaletteDependency(bundle.instructions(factory), bundle.strings)
    val global = bundle.metroIndex.globalCode
    val closure = global.withIndex().single { it.value.name == "CreateClosure" && it.value.args[2] == factory.id }
    val call = global[closure.index + 1]
    require(call.name == "Call4" && call.args[3] == closure.value.args[0]) { "Feed palette: module definition changed." }
    val array = global.take(closure.index).last { it.name.startsWith("NewArrayWithBuffer") && it.args[0] == call.args[5] }
    return bundle.integerArray(array.args[3], array.args[2])[index]
}

internal fun themePaletteDependency(code: List<HermesInstruction>, strings: List<String>): Int {
    val read = code.withIndex().single { it.value.name.startsWith("GetById") && strings[it.value.args.last()] == "darkTheme" }
    val call = code.getOrNull(read.index - 1)
    val dependency = code.getOrNull(read.index - 2)
    require(call?.name == "Call2" && dependency?.name == "GetByIndex" &&
        read.value.args[1] == call.args[0] && call.args[3] == dependency.args[0]) {
        "Feed palette: theme dependency flow changed."
    }
    return dependency.args[2]
}
