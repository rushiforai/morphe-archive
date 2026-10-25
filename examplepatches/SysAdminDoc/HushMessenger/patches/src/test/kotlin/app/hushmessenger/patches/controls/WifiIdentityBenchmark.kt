package app.hushmessenger.patches.controls

import app.hushmessenger.patches.CompatMirror
import com.android.tools.smali.dexlib2.DexFileFactory
import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import java.io.File
import java.lang.management.ManagementFactory
import java.lang.management.MemoryType

/** Opt-in comparison against the previous finder on the same exact stock classes. */
object WifiIdentityBenchmark {
    private val reads = setOf("Landroid/net/wifi/WifiInfo;->getSSID()Ljava/lang/String;",
        "Landroid/net/wifi/WifiInfo;->getBSSID()Ljava/lang/String;")

    private fun legacy(classes: List<ClassDef>): List<Method> {
        fun Method.sites(): List<Int> {
            val code = implementation?.instructions?.toList() ?: return emptyList()
            return code.indices.filter { (code[it] as? ReferenceInstruction)?.reference?.toString() in reads }
        }
        val readers = classes.filterNot { it.type.startsWith("Lorg/webrtc/") }
            .flatMap { cls -> cls.methods.filter { it.sites().isNotEmpty() } }
        return if (readers.all { method ->
            val code = method.implementation!!.instructions.toList()
            method.sites().all { code.getOrNull(it + 1)?.opcode == com.android.tools.smali.dexlib2.Opcode.MOVE_RESULT_OBJECT }
        }) readers else emptyList()
    }

    @JvmStatic fun main(args: Array<String>) {
        val dex = DexFileFactory.loadDexContainer(File(args.single()), Opcodes.forApi(35))
        val classes = dex.dexEntryNames.flatMap { dex.getEntry(it)!!.dexFile.classes }
        val allocation = ManagementFactory.getThreadMXBean() as com.sun.management.ThreadMXBean
        allocation.isThreadAllocatedMemoryEnabled = true
        val thread = Thread.currentThread().threadId()
        val pools = ManagementFactory.getMemoryPoolMXBeans().filter { it.type == MemoryType.HEAP }
        val sample = classes.take(200)
        legacy(sample)
        findWifiIdentityReads(sample)
        CompatMirror.wifiIdentityReads(sample)
        var expected: List<String>? = null
        for ((name, find) in listOf<Pair<String, (List<ClassDef>) -> List<Method>>>(
            "legacy" to ::legacy, "typed" to ::findWifiIdentityReads, "mirror" to CompatMirror::wifiIdentityReads)) {
            System.gc()
            pools.forEach { it.resetPeakUsage() }
            val allocated = allocation.getThreadAllocatedBytes(thread)
            val started = System.nanoTime()
            val ids = find(classes).map { it.hookId() }.sorted()
            val elapsed = (System.nanoTime() - started) / 1_000_000
            val bytes = allocation.getThreadAllocatedBytes(thread) - allocated
            val peak = pools.sumOf { it.peakUsage.used }
            if (expected == null) expected = ids else check(expected == ids) { "$name changed discovered hooks" }
            check(ids.toSet() == BASE_PROFILE.hooks.getValue(WIFI_IDENTITY)) { "$name differs from the stock profile" }
            println("{\"finder\":\"$name\",\"elapsedMs\":$elapsed,\"allocatedBytes\":$bytes,\"heapPoolPeakBytes\":$peak,\"hooks\":${ids.size}}")
        }
    }
}
