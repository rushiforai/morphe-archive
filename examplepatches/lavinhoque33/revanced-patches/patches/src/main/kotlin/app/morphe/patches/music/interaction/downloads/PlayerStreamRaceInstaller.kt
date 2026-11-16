/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Modified by lavinhoque33, 2026-11-14.
 * Written by lavinhoque33, 2026-11-14.
 */
package app.morphe.patches.music.interaction.downloads

import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.util.getReference
import app.morphe.util.Utils.printInfo
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val PATH = "Lapp/morphe/extension/music/patches/downloads/PlayerStreamRace"
private const val RACE = "$PATH;"
private const val CALLS = $$"$${PATH}$NativeCalls;"
private const val SUBSCRIPTION = $$"$${PATH}$Subscription;"
private const val OBJECT = "Ljava/lang/Object;"
private const val THROWABLE = "Ljava/lang/Throwable;"

private data class StreamAbi(
    val observer: String, val disposable: String, val subscribe: String, val next: String, val complete: String,
)

/** Preserve lazy subscription, online multi-value WATCHNEXT, and native disposal without blocking on a Future. */
internal fun BytecodePatchContext.preparePlayerStreamRace(observable: String): () -> Unit {
    val abi = when (packageMetadata.versionName) {
        "9.45.51" -> StreamAbi("Lavtm;", "Lavud;", "ak", "kp", "ks")
        "9.40.51" -> StreamAbi("Lavgp;", "Lavhg;", "ak", "jV", "jY")
        "9.15.51" -> StreamAbi("Lcjli;", "Lcjmb;", "at", "iU", "iX")
        "8.30.54" -> StreamAbi("Lcbly;", "Lcbmq;", "at", "iE", "iH")
        "8.28.54" -> StreamAbi("Lcaro;", "Lcasg;", "at", "iy", "iB")
        "8.12.54" -> StreamAbi("Lbxys;", "Lbxzk;", "at", "ho", "hr")
        else -> error("player stream race: unsupported version")
    }
    fun method(owner: String, name: String, parameters: List<String>, result: String) =
        classDefBy(owner).methods.single {
            it.name == name && it.parameterTypes == parameters && it.returnType == result
        }
    val nativeConstructor = method(observable, "<init>", emptyList(), "V")
    val actual = method(observable, "e", listOf(abi.observer), "V")
    val subscribe = method(observable, abi.subscribe, listOf(abi.observer), "V")
    val subscribed = method(abi.observer, "d", listOf(abi.disposable), "V")
    val next = method(abi.observer, abi.next, listOf(OBJECT), "V")
    val error = method(abi.observer, "b", listOf(THROWABLE), "V")
    val complete = method(abi.observer, abi.complete, emptyList(), "V")
    val dispose = method(abi.disposable, "dispose", emptyList(), "V")
    val disposed = method(abi.disposable, "f", emptyList(), "Z")
    val originalConstructor = classDefBy(RACE).methods.single { it.name == "<init>" }
    val superIndex = originalConstructor.implementation!!.instructions.indexOfFirst {
        it.getReference<MethodReference>()?.toString() == "Ljava/lang/Object;-><init>()V"
    }
    check(superIndex >= 0 && classDefBy(RACE).superclass == OBJECT)

    return {
        val race = mutableClassDefBy(RACE)
        race.setSuperClass(observable)
        race.interfaces.add(CALLS)
        race.methods.single { it.name == "<init>" }.replaceInstruction(superIndex,
            "invoke-direct {p0}, $nativeConstructor")
        race.addDownloadsBridge(actual.name, listOf(abi.observer), "V", 2, """
            invoke-virtual {p0, p1}, $RACE->subscribe($OBJECT)V
            return-void
        """)
        race.addDownloadsBridge("rvxSubscribe", listOf(OBJECT, OBJECT), "V", 3, """
            check-cast p1, $observable
            check-cast p2, ${abi.observer}
            invoke-virtual {p1, p2}, $subscribe
            return-void
        """)
        race.addDownloadsBridge("rvxSubscribed", listOf(OBJECT, OBJECT), "V", 3, """
            check-cast p1, ${abi.observer}
            check-cast p2, ${abi.disposable}
            invoke-interface {p1, p2}, $subscribed
            return-void
        """)
        race.addDownloadsBridge("rvxNext", listOf(OBJECT, OBJECT), "V", 3, """
            check-cast p1, ${abi.observer}
            invoke-interface {p1, p2}, $next
            return-void
        """)
        race.addDownloadsBridge("rvxError", listOf(OBJECT, THROWABLE), "V", 3, """
            check-cast p1, ${abi.observer}
            invoke-interface {p1, p2}, $error
            return-void
        """)
        race.addDownloadsBridge("rvxComplete", listOf(OBJECT), "V", 2, """
            check-cast p1, ${abi.observer}
            invoke-interface {p1}, $complete
            return-void
        """)
        race.addDownloadsBridge("rvxDispose", listOf(OBJECT), "V", 2, """
            check-cast p1, ${abi.disposable}
            invoke-interface {p1}, $dispose
            return-void
        """)
        race.addDownloadsBridge("rvxDisposed", listOf(OBJECT), "Z", 2, """
            check-cast p1, ${abi.disposable}
            invoke-interface {p1}, $disposed
            move-result p1
            return p1
        """)
        val subscription = mutableClassDefBy(SUBSCRIPTION)
        subscription.interfaces.add(abi.observer)
        subscription.interfaces.add(abi.disposable)
        subscription.addDownloadsBridge("d", listOf(abi.disposable), "V", 2, """
            invoke-virtual {p0, p1}, $SUBSCRIPTION->stockSubscribe($OBJECT)V
            return-void
        """)
        subscription.addDownloadsBridge(abi.next, listOf(OBJECT), "V", 2, """
            invoke-virtual {p0, p1}, $SUBSCRIPTION->stockNext($OBJECT)V
            return-void
        """)
        subscription.addDownloadsBridge("b", listOf(THROWABLE), "V", 2, """
            invoke-virtual {p0, p1}, $SUBSCRIPTION->stockError($THROWABLE)V
            return-void
        """)
        subscription.addDownloadsBridge(abi.complete, emptyList(), "V", 1, """
            invoke-virtual {p0}, $SUBSCRIPTION->stockComplete()V
            return-void
        """)
        subscription.addDownloadsBridge("f", emptyList(), "Z", 2, """
            invoke-virtual {p0}, $SUBSCRIPTION->isDisposed()Z
            move-result v0
            return v0
        """)
        printInfo("PlayerFallback: lazy connectivity race $actual; observer ${abi.observer}; disposable $dispose")
    }
}
