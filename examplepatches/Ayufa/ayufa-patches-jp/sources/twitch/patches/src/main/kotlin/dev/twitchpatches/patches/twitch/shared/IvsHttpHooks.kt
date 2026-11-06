package dev.twitchpatches.patches.twitch.shared

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction

internal const val IVS_NET = "Lcom/amazonaws/ivs/net/"

internal fun BytecodePatchContext.resolveIvsHttp(): Method {
    val contracts = mapOf(
        "HttpClient" to listOf("description()Ljava/lang/String;", "execute(${IVS_NET}Request;${IVS_NET}ResponseCallback;)V", "release()V"),
        "ResponseCallback" to listOf("onError(Ljava/lang/Exception;)V", "onResponse(${IVS_NET}Response;)V"),
        "ReadCallback" to listOf("getTimeout()I", "onData(Ljava/nio/ByteBuffer;Z)V", "onData([BIZ)V", "onError(Ljava/lang/Exception;)V"),
        "StreamConsumer" to listOf("consume(${IVS_NET}ReadCallback;)V"),
        "Request" to listOf("<init>(Ljava/lang/String;Ljava/lang/String;)V", "getUrl()Ljava/lang/String;",
            "getMethod()${IVS_NET}Method;", "getHeaders()Ljava/util/Map;", "isCancelled()Z", "lock()Ljava/lang/Object;",
            "setHeader(Ljava/lang/String;Ljava/lang/String;)V", "setTimeout(I)V", "cancel()V"),
        "Response" to listOf("<init>(ILjava/lang/String;)V", "getStatus()I", "getUrl()Ljava/lang/String;",
            "getHeader(Ljava/lang/String;)Ljava/lang/String;", "readContent(${IVS_NET}ReadCallback;)V",
            "setConsumer(Ljava/util/concurrent/ExecutorService;${IVS_NET}StreamConsumer;)V", "setHeader(Ljava/lang/String;Ljava/lang/String;)V"),
    )
    contracts.forEach { (owner, signatures) ->
        val type = classDefBy("$IVS_NET$owner;")
        signatures.forEach { signature ->
            val method = type.methods.filter { it.reference == "${type.type}->$signature" }
                .uniqueHook("IVS $owner.$signature")
            if (!AccessFlags.PUBLIC.isSet(method.accessFlags) || AccessFlags.STATIC.isSet(method.accessFlags))
                throw PatchException("IVS HTTP contract is not a public instance method: $signature")
        }
    }
    val factory = classDefBy("${IVS_NET}HttpClientFactory;").methods.filter {
        it.name == "create" && it.parameterTypes.isEmpty() && it.returnType == "${IVS_NET}HttpClient;" &&
            AccessFlags.PUBLIC.isSet(it.accessFlags) && AccessFlags.STATIC.isSet(it.accessFlags) &&
            it.code().count { insn -> insn.opcode == Opcode.RETURN_OBJECT } == 1
    }.uniqueHook("IVS HTTP factory")
    return factory
}

internal fun BytecodePatchContext.applyIvsHttp(factory: Method, wrapper: String) {
    listOf("ReadCallback", "StreamConsumer").forEach {
        val type = mutableClassDefBy("$IVS_NET$it;")
        if (!AccessFlags.INTERFACE.isSet(type.accessFlags)) throw PatchException("IVS callback is not an interface: $it")
        type.accessFlags = type.accessFlags or AccessFlags.PUBLIC.value
    }
    val method = mutableClassDefBy(factory.definingClass).methods.filter { it.reference == factory.reference }
        .uniqueHook("resolved IVS HTTP factory")
    method.code().withIndex().filter { it.value.opcode == Opcode.RETURN_OBJECT }.forEach { (index, instruction) ->
        val register = (instruction as? OneRegisterInstruction)?.registerA
            ?: throw PatchException("IVS HTTP factory return register not found")
        method.insertAtReturn(index, """
            invoke-static/range {v$register .. v$register}, $wrapper
            move-result-object v$register
        """)
    }
}
