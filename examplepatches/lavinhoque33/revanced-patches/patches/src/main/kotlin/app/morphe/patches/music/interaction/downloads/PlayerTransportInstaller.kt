/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Modified by lavinhoque33, 2026-11-14.
 * Written by lavinhoque33, 2026-11-14.
 */
package app.morphe.patches.music.interaction.downloads

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.util.getReference
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import app.morphe.util.Utils.printInfo
import app.morphe.util.cloneMutable
import app.morphe.util.findMutableMethodOf
import app.morphe.util.numberOfParameterRegisters
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val PATH = "Lapp/morphe/extension/music/patches/downloads/"
private const val FALLBACK = "${PATH}PlayerFallback;"
private const val FAILURE = "${PATH}PlayerStreamFailure;"
private const val RACE = "${PATH}PlayerStreamRace;"
private const val PACKED = $$"$${PATH}PlayerFallback$Packed;"
private const val REPLAY = "${PATH}OfflineReplayHooks;"
private const val OBJECT = "Ljava/lang/Object;"
private const val STRING = "Ljava/lang/String;"
private const val FUTURE = "Lcom/google/common/util/concurrent/ListenableFuture;"
private const val PAIR = "Landroid/util/Pair;"

private data class TransportAbi(
    val observable: String, val resume: String, val function: String, val error: String,
    val holder: String, val map: String, val builder: String, val build: String, val mapCopy: String,
    val playerKey: String, val nextKey: String, val feature: String?, val mapRead: String, val mapWrite: String,
    val converter: String, val convert: String, val single: String, val packer: String, val pack: String,
    val nextOwner: String, val nextMethod: String, val nextParameters: List<String>,
)

internal fun BytecodePatchContext.preparePlayerTransport(selector: ClassDef, request: String): () -> Unit {
    val abi = when (packageMetadata.versionName) {
        "9.45.51" -> TransportAbi("Lavtg;", "Q", "Lavvc;", "A", "Labtn;", "Lagqz;", "Lahnk;", "f", "h",
            "Labri;", "Labsx;", null, "b", "h", "Ltyj;", "c", "Lavts;", "Lacst;", "i",
            "Lahzu;", "m", listOf(request, "Lxjg;"))
        "9.40.51" -> TransportAbi("Lavgk;", "P", "Lavig;", "A", "Labnk;", "Lagfi;", "Lahbu;", "f", "h",
            "Labli;", "Labmv;", null, "b", "h", "Ltwf;", "c", "Lavgv;", "Lacmb;", "g",
            "Lawzr;", "q", listOf(request, "Lxdy;"))
        "9.15.51" -> TransportAbi("Lcjld;", "U", "Lcjnc;", "D", "Lazvg;", "Lbihv;", "Lazvd;", "a", "i",
            "Lazpj;", "Lazud;", null, "a", "c", "Lakeh;", "b", "Lcjlo;", "Lazqv;", "e",
            "Lazua;", "b", listOf(request))
        "8.30.54" -> TransportAbi("Lcblt;", "V", "Lcbnp;", "D", "Lawrf;", "Lbeen;", "Lawrb;", "a", "i",
            "a", "b", "Lawre;", "a", "a", "Laifc;", "b", "Lcbme;", "Lawlq;", "h",
            "Lawpe;", "b", listOf(request))
        "8.28.54" -> TransportAbi("Lcarj;", "V", "Lcatf;", "D", "Lawis;", "Lbdrc;", "Lawio;", "a", "i",
            "a", "b", "Lawir;", "a", "a", "Laicc;", "b", "Lcaru;", "Lawdd;", "h",
            "Lawgr;", "b", listOf(request))
        "8.12.54" -> TransportAbi("Lbxyn;", "V", "Lbyaj;", "D", "Laugf;", "Lbbhr;", "Laugb;", "a", "i",
            "a", "b", "Lauge;", "a", "a", "Lagpp;", "b", "Lbxyy;", "Lauar;", "g",
            "Lauef;", "b", listOf(request))
        else -> error("player transport fallback has no ABI for this version")
    }
    fun method(owner: String, name: String, parameters: List<String>, result: String) =
        classDefBy(owner).methods.single {
            it.name == name && it.parameterTypes.map(CharSequence::toString) == parameters && it.returnType == result
        }
    val paired = selector.methods.single {
        it.returnType == PAIR && it.parameterTypes.size == 4 && it.parameterTypes[0] == request
    }
    val onlinePair = paired.implementation!!.instructions.mapNotNull { it.getReference<MethodReference>() }.single {
        it.definingClass != selector.type && it.parameterTypes == paired.parameterTypes && it.returnType == PAIR
    }
    val delegate = classDefBy(onlinePair.definingClass)
    val packed = delegate.methods.single {
        it.parameterTypes == paired.parameterTypes && it.returnType == abi.holder
    }
    val normal = delegate.methods.single {
        it.returnType == FUTURE && it.parameterTypes.size == 5 && it.parameterTypes[0] == request &&
            it.parameterTypes[1] == STRING && it.parameterTypes[2] == "I"
    }
    val producer = normal.implementation!!.instructions.mapNotNull { it.getReference<MethodReference>() }.single {
        it.returnType == FUTURE && it.parameterTypes.size == 7 && it.parameterTypes[0] == request
    }
    val installOnesieGuards = prepareOnesieGuards(producer, paired.parameterTypes[2].toString())
    val installOnesieTransport = prepareOnesieTransport()
    val installStreamRace = preparePlayerStreamRace(abi.observable)
    val alternate = delegate.methods.filter {
        it.returnType == FUTURE && it.parameterTypes.size == 4 && it.parameterTypes[0] == request
    }.flatMap { caller ->
        caller.implementation!!.instructions.mapNotNull { it.getReference<MethodReference>() }
    }.filter {
        it.definingClass == producer.definingClass && it.returnType == FUTURE &&
            it.parameterTypes.size == 5 && it.parameterTypes[0] == request
    }.distinctBy(MethodReference::toString).single()
    val producers = if (packageMetadata.versionName.startsWith("9.")) {
        // These versions' URL dispatcher also has an independent early failed-future exit.
        classDefBy(producer.definingClass).methods.filter {
            it.returnType == FUTURE && it.parameterTypes.firstOrNull() == request &&
                it.parameterTypes.size in setOf(5, 7)
        }.also { check(it.size == 3) { "player fallback: scalar/URL coverage" } }
    } else listOf(producer, alternate).map { call ->
        method(call.definingClass, call.name, call.parameterTypes.map(CharSequence::toString), FUTURE)
    }
    val next = method(abi.nextOwner, abi.nextMethod, abi.nextParameters, FUTURE)
    val nextOnlyName = when (packageMetadata.versionName) {
        "9.45.51" -> "j"
        "9.40.51" -> "n"
        else -> "c"
    }
    val nextOnly = method(abi.nextOwner, nextOnlyName,
        listOf(request, paired.parameterTypes[2].toString()), FUTURE)
    val resume = method(abi.observable, abi.resume, listOf(abi.function), abi.observable)
    val error = method(abi.observable, abi.error, listOf("Ljava/lang/Throwable;"), abi.observable)
    val convert = method(abi.converter, abi.convert, listOf(FUTURE), abi.single)
    val observableMethod = when {
        packageMetadata.versionName == "9.45.51" -> "l"
        packageMetadata.versionName.startsWith("9.") -> "k"
        else -> "j"
    }
    val asObservable = method(abi.single, observableMethod, emptyList(), abi.observable)
    val pack = method(abi.packer, abi.pack, listOf(FUTURE, FUTURE), abi.holder)
    val build = method(abi.builder, abi.build, emptyList(), abi.holder)
    val copy = method(abi.map, abi.mapCopy, listOf("Ljava/util/Map;"), abi.map)
    method(abi.builder, "<init>", listOf(abi.holder), "V")
    method(abi.function, "a", listOf(OBJECT), OBJECT)
    val holder = classDefBy(abi.holder)
    val mapRead = if (abi.holder in setOf("Labtn;", "Labnk;")) {
        val field = holder.fields.single { it.name == abi.mapRead && it.type == abi.map }
        "iget-object v2, p0, $field"
    } else {
        val read = method(abi.holder, abi.mapRead, emptyList(), abi.map)
        "invoke-virtual {p0}, $read\nmove-result-object v2"
    }
    val mapWrite = if (abi.feature != null) {
        val field = classDefBy(abi.builder).fields.single { it.name == abi.mapWrite && it.type == abi.map }
        "iput-object v0, v1, $field"
    } else {
        val write = method(abi.builder, abi.mapWrite, listOf(abi.map), "V")
        "invoke-virtual {v1, v0}, $write"
    }
    if (abi.feature != null) {
        listOf(abi.playerKey, abi.nextKey).forEach { key ->
            check(classDefBy(abi.feature).fields.any { it.name == key && it.type == abi.feature })
        }
    } else {
        classDefBy(abi.playerKey)
        classDefBy(abi.nextKey)
    }

    return {
        installOnesieGuards()
        installOnesieTransport?.invoke()
        installStreamRace()
        producers.forEach { installFutureWrapper(it, false) }
        installFutureWrapper(next, true)
        installFutureWrapper(nextOnly, true)
        val delegateOwner = mutableClassDefBy(delegate.type)
        val pairMethod = delegateOwner.methods.single {
            it.name == onlinePair.name && it.parameterTypes == onlinePair.parameterTypes && it.returnType == PAIR
        }
        installResultWrapper(delegateOwner, pairMethod, """
            invoke-static {p1}, $FALLBACK->localPair($OBJECT)$PAIR
            move-result-object v0
            if-eqz v0, :network
            return-object v0
        """, """
            invoke-static {p1, v0}, $FALLBACK->wrapPair($OBJECT$PAIR)$PAIR
            move-result-object v0
        """)
        installResultWrapper(delegateOwner, packed, """
            invoke-static {p1}, $FALLBACK->routeOffline($OBJECT)Z
            move-result v0
            if-eqz v0, :network
            invoke-static {p1}, $FALLBACK->localPlayer($OBJECT)$FUTURE
            move-result-object v0
            invoke-static {p1}, $REPLAY->localNext($OBJECT)$FUTURE
            move-result-object v1
            invoke-static {v0, v1}, $pack
            move-result-object v0
            return-object v0
        """, """
            invoke-static {p1, v0}, $FALLBACK->wrapPacked($OBJECT$OBJECT)$OBJECT
            move-result-object v0
            check-cast v0, ${abi.holder}
        """)
        val failure = mutableClassDefBy(FAILURE)
        failure.interfaces.add(abi.function)
        failure.addDownloadsBridge("a", listOf(OBJECT), OBJECT, 7, """
            iget-object v0, p0, $FAILURE->request:$OBJECT
            check-cast p1, Ljava/lang/Throwable;
            invoke-static {v0, p1}, $FALLBACK->replayFailure(${OBJECT}Ljava/lang/Throwable;)Z
            move-result v1
            if-nez v1, :local
            invoke-static {p1}, $error
            move-result-object v0
            return-object v0
            :local
            iget-boolean v1, p0, $FAILURE->next:Z
            invoke-static {v0, v1, p1}, $FALLBACK->recoverFuture(${OBJECT}ZLjava/lang/Throwable;)$FUTURE
            move-result-object v0
            invoke-static {v0}, $convert
            move-result-object v0
            invoke-virtual {v0}, $asObservable
            move-result-object v0
            return-object v0
        """)
        val packedOwner = mutableClassDefBy(abi.holder)
        packedOwner.interfaces.add(PACKED)
        fun lane(key: String, nextLane: Boolean): String {
            val loadKey = if (abi.feature == null) "const-class v1, $key"
                else "sget-object v1, ${abi.feature}->$key:${abi.feature}"
            val label = if (nextLane) "next" else "player"
            return """
                $loadKey
                invoke-interface {v0, v1}, Ljava/util/Map;->get($OBJECT)$OBJECT
                move-result-object v2
                if-eqz v2, :${label}_absent
                check-cast v2, ${abi.observable}
                new-instance v3, $RACE
                const/4 v4, ${if (nextLane) "0x1" else "0x0"}
                invoke-direct {v3, p1, v4, v2}, $RACE-><init>(${OBJECT}Z$OBJECT)V
                move-object v2, v3
                new-instance v3, $FAILURE
                const/4 v4, ${if (nextLane) "0x1" else "0x0"}
                invoke-direct {v3, p1, v4}, $FAILURE-><init>(${OBJECT}Z)V
                invoke-virtual {v2, v3}, $resume
                move-result-object v2
                invoke-interface {v0, v1, v2}, Ljava/util/Map;->put($OBJECT$OBJECT)$OBJECT
                :${label}_absent
                nop
            """
        }
        packedOwner.addDownloadsBridge("rvxRecover", listOf(OBJECT), OBJECT, 8, """
            $mapRead
            new-instance v0, Ljava/util/HashMap;
            invoke-direct {v0, v2}, Ljava/util/HashMap;-><init>(Ljava/util/Map;)V
            ${lane(abi.playerKey, false)}
            ${lane(abi.nextKey, true)}
            invoke-static {v0}, $copy
            move-result-object v0
            new-instance v1, ${abi.builder}
            invoke-direct {v1, p0}, ${abi.builder}-><init>(${abi.holder})V
            $mapWrite
            invoke-virtual {v1}, $build
            move-result-object v0
            return-object v0
        """)
        printInfo("PlayerFallback: paired $onlinePair; packed $packed; native on-error $resume")
    }
}

private fun BytecodePatchContext.installFutureWrapper(original: Method, next: Boolean) {
    val owner = mutableClassDefBy(original.definingClass)
    val local = if (next) "$REPLAY->localNext" else "$FALLBACK->localPlayer"
    val wrap = if (next) "$REPLAY->wrapNext" else "$FALLBACK->wrapPlayer"
    installResultWrapper(owner, original, """
        invoke-static {p1}, $local($OBJECT)$FUTURE
        move-result-object v0
        if-eqz v0, :network
        return-object v0
    """, """
        invoke-static {p1, v0}, $wrap($OBJECT$FUTURE)$FUTURE
        move-result-object v0
    """)
    printInfo("PlayerFallback: ${if (next) "next" else "scalar"} $original")
}

/** Wrap outside native concrete-future/subtype handling, retaining parameter registers and cancellation. */
private fun installResultWrapper(owner: MutableClass, original: Method, local: String, finish: String) {
    check(!AccessFlags.STATIC.isSet(original.accessFlags) && !AccessFlags.PRIVATE.isSet(original.accessFlags))
    val method = owner.findMutableMethodOf(original)
    val stock = method.cloneMutable(name = "rvxNetwork_${original.name}")
    val wrapper = method.cloneMutable(registerCount = method.numberOfParameterRegisters + 2, clearImplementation = true)
    val last = method.numberOfParameterRegisters - 1
    wrapper.addInstructionsWithLabels(0, """
        $local
        :network
        invoke-virtual/range {p0 .. p$last}, $stock
        move-result-object v0
        $finish
        return-object v0
    """)
    owner.methods.remove(method)
    owner.methods.add(stock)
    owner.methods.add(wrapper)
}
