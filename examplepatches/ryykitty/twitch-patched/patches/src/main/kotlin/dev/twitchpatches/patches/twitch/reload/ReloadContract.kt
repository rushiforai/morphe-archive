package dev.twitchpatches.patches.twitch.reload

import dev.twitchpatches.patches.twitch.shared.hermes.HermesBundle

internal fun requireReloadCounter(bundle: HermesBundle) {
    val root = bundle.functions.single { bundle.strings[it.name] == "useTheatreData" && it.params == 3 }
    val code = bundle.instructions(root)
    val literal = code.withIndex().single { (_, instruction) ->
        instruction.name in setOf("NewObjectWithBuffer", "NewObjectWithBufferLong") &&
            bundle.objectLiteral(instruction.args[1], instruction.args[2]).keys.containsAll(
                setOf("channelID", "isLive", "refreshVideoToken", "playerAccessToken", "retryChannelLoad"))
    }
    val keys = bundle.objectLiteral(literal.value.args[1], literal.value.args[2]).keys.toList()
    val write = code.drop(literal.index + 1).single { it.name == "PutOwnBySlotIdx" &&
        it.args[0] == literal.value.args[0] && it.args[2] == keys.indexOf("refreshVideoToken") }
    val moveIndex = code.take(literal.index).indexOfLast { it.name == "Mov" && it.args[0] == write.args[1] }
    require(moveIndex >= 0) { "Reload stream: refresh action has no proven closure result." }
    val move = code[moveIndex]
    val producer = code.take(moveIndex).last { it.name == "CreateClosure" && it.args[0] == move.args[1] }
    val action = bundle.functions[producer.args[2]]
    val body = bundle.instructions(action)
    require(action.params == 1 && body.last().name == "Ret" && body.count { it.name == "Call2" } == 1) {
        "Reload stream: manual token refresh action changed."
    }
    val parentIndex = body.indexOfFirst { it.name == "GetParentEnvironment" && it.args[1] == 1 }
    require(parentIndex >= 0) { "Reload stream: nonce updater has no factory environment." }
    val parent = body[parentIndex]
    val updater = body.drop(parentIndex + 1).single { it.name == "LoadFromEnvironment" && it.args[1] == parent.args[0] }
    val factory = bundle.functions.single { function -> function.params == 8 && bundle.instructions(function).any {
        it.name == "CreateClosure" && it.args[2] == root.id
    } }
    val pair = bundle.instructions(factory).zipWithNext().single { (create, store) ->
        create.name == "CreateClosure" && store.name == "StoreToEnvironment" &&
            store.args[1] == updater.args[2] && store.args[2] == create.args[0]
    }
    val increment = bundle.functions[pair.first.args[2]]
    val instructions = bundle.instructions(increment)
    require(increment.params == 2 && instructions.map { it.name } == listOf("LoadConstUInt8", "LoadParam", "Add", "Ret") &&
        instructions[0].args[1] == 1 && instructions[1].args[1] == 1 &&
        instructions[2].args[1] == instructions[1].args[0] && instructions[2].args[2] == instructions[0].args[0] &&
        instructions[3].args[0] == instructions[2].args[0]) {
        "Reload stream: original token-refresh nonce no longer increments."
    }
}
