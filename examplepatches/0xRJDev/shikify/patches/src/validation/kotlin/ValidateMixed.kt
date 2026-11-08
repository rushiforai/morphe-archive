import app.morphe.patcher.Patcher
import app.morphe.patcher.PatcherConfig
import app.morphe.patcher.apk.ApkUtils.applyTo
import app.morphe.patcher.dex.BytecodeMode
import app.morphe.patcher.patch.loadPatchesFromJar
import com.android.tools.smali.dexlib2.DexFileFactory
import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.dexbacked.DexBackedDexFile
import com.android.tools.smali.dexlib2.immutable.ImmutableDexFile
import com.android.tools.smali.dexlib2.writer.pool.DexPool
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import kotlinx.coroutines.runBlocking
import java.io.File
import java.util.zip.ZipEntry
import java.util.zip.ZipFile
import java.util.zip.ZipOutputStream

/** Regression fixture: the user's actual installed APK, retaining all other patches. */
fun main(args: Array<String>) = runBlocking {
    val (bundle, input, output) = args.map(::File)
    val work = output.parentFile.resolve("mixed-fixture").apply { mkdirs() }
    val fixture = work.resolve("input.apk")
    // A normal Manager run starts from the original APK, so the old Shiki runtime is absent.
    // Strip only the nine Shiki runtime class families from this regression fixture to replace its runtime cleanly.
    // All other sources' code and every existing chrome hook remain intact.
    ZipFile(input).use { source -> ZipOutputStream(fixture.outputStream()).use { zip ->
        source.entries().asSequence().forEach { entry ->
            if (entry.name.startsWith("META-INF/")) return@forEach
            var bytes = source.getInputStream(entry).use { it.readBytes() }
            if (entry.name.matches(Regex("classes\\d*\\.dex"))) {
                val dex = DexBackedDexFile(Opcodes.getDefault(), java.nio.ByteBuffer.wrap(bytes))
                val keep = dex.classes.filterNot { it.type.startsWith("Lapp/morphe/extension/boost/CommentsChromeTweaks") ||
                    it.type.startsWith("Lapp/morphe/extension/boost/GalleryBottomActionsTweaks") ||
                    it.type.startsWith("Lapp/morphe/extension/boost/CommentSwipeActions") ||
                    it.type.startsWith("Lapp/morphe/extension/boost/PredictiveBackTweaks") ||
                    it.type.startsWith("Lapp/morphe/extension/boost/MediaPreviewTweaks") ||
                    it.type.startsWith("Lapp/morphe/extension/boost/CommentLayoutTweaks") ||
                    it.type.startsWith("Lapp/morphe/extension/boost/ViewerPolishTweaks") ||
                    it.type.startsWith("Lapp/morphe/extension/boost/MaterialYouTweaks") ||
                    it.type.startsWith("Lapp/morphe/extension/boost/CommentsScreenTweaks") || it.type.startsWith("Lapp/morphe/extension/boost/MaterialLoading") || it.type.startsWith("Lapp/morphe/extension/boost/HomeAvatarTweaks") || it.type.startsWith("Lapp/morphe/extension/boost/Surface") || it.type.startsWith("Lapp/morphe/extension/boost/FeedPillBlur") || it.type.startsWith("Lapp/morphe/extension/boost/GlassRefraction") || it.type.startsWith("Lapp/morphe/extension/boost/HeaderGlass") || it.type.startsWith("Lapp/morphe/extension/boost/HeaderGradient") || it.type.startsWith("Lapp/morphe/extension/boost/UnifiedChromeTweaks") }
                if (keep.isEmpty()) return@forEach
                val file = work.resolve(entry.name)
                DexPool.writeTo(file.absolutePath, ImmutableDexFile(dex.opcodes, keep))
                bytes = file.readBytes()
            }
            zip.putNextEntry(ZipEntry(entry.name))
            zip.write(bytes)
            zip.closeEntry()
        }
    } }
    Patcher(PatcherConfig(fixture, work.resolve("patcher"), useBytecodeMode = BytecodeMode.FULL, validate = true)).use { patcher ->
        patcher += loadPatchesFromJar(setOf(bundle))
        patcher().collect { result ->
            result.exception?.let { throw it }
            println("MIXED APPLIED: ${result.patch.name}")
        }
        fixture.copyTo(output, overwrite = true)
        patcher.get().applyTo(output)
    }
    val dex = DexFileFactory.loadDexContainer(output, Opcodes.getDefault())
    val types = dex.dexEntryNames.flatMap { dex.getEntry(it)!!.dexFile.classes }.associateBy { it.type }
    val sourceDex = DexFileFactory.loadDexContainer(input, Opcodes.getDefault())
    val before = sourceDex.dexEntryNames.flatMap { sourceDex.getEntry(it)!!.dexFile.classes }
        .associateBy { it.type }
    val ownRuntime = { name: String -> name.startsWith("Lapp/morphe/extension/boost/CommentsChromeTweaks") ||
        name.startsWith("Lapp/morphe/extension/boost/GalleryBottomActionsTweaks") ||
        name.startsWith("Lapp/morphe/extension/boost/CommentSwipeActions") ||
        name.startsWith("Lapp/morphe/extension/boost/PredictiveBackTweaks") ||
        name.startsWith("Lapp/morphe/extension/boost/MediaPreviewTweaks") ||
        name.startsWith("Lapp/morphe/extension/boost/CommentLayoutTweaks") ||
        name.startsWith("Lapp/morphe/extension/boost/ViewerPolishTweaks") ||
        name.startsWith("Lapp/morphe/extension/boost/MaterialYouTweaks") ||
        name.startsWith("Lapp/morphe/extension/boost/CommentsScreenTweaks") || name.startsWith("Lapp/morphe/extension/boost/MaterialLoading") || name.startsWith("Lapp/morphe/extension/boost/HomeAvatarTweaks") || name.startsWith("Lapp/morphe/extension/boost/Surface") || name.startsWith("Lapp/morphe/extension/boost/FeedPillBlur") || name.startsWith("Lapp/morphe/extension/boost/GlassRefraction") || name.startsWith("Lapp/morphe/extension/boost/HeaderGlass") || name.startsWith("Lapp/morphe/extension/boost/HeaderGradient") || name.startsWith("Lapp/morphe/extension/boost/UnifiedChromeTweaks") }
    for ((name, old) in before) {
        if (ownRuntime(name)) continue
        val preserved = types[name] ?: error("Other patch class removed: $name")
        check(old.methods.map { it.toString() }.toSet() == preserved.methods.map { it.toString() }.toSet()) {
            "Other patch method set changed: $name"
        }
        check(old.fields.map { it.toString() }.toSet() == preserved.fields.map { it.toString() }.toSet()) {
            "Other patch field set changed: $name"
        }
    }
    println("MIXED PRESERVED: all original app and other-source class/method/field sets")
    val holder = types["Lcom/rubenmayayo/reddit/ui/adapters/CommentViewHolder;"]!!
    val bind = holder.methods.single { it.name == "w" }
    val instructions = bind.implementation!!.instructions.toList()
    val addresses = mutableMapOf<Int, Int>()
    var address = 0
    for ((index, instruction) in instructions.withIndex()) {
        addresses[address] = index
        address += instruction.codeUnits
    }
    address = 0
    var safeReturns = 0
    for (instruction in instructions) {
        if (instruction is OffsetInstruction && (instruction.opcode == Opcode.IF_NEZ || instruction.opcode == Opcode.IF_EQZ)) {
            val target = instructions[addresses[address + instruction.codeOffset]!!]
            check((target as? ReferenceInstruction)?.reference?.let {
                (it as? MethodReference)?.name != "setVisibility"
            } != false) { "Bad emoji wrapper branch remains" }
            if (target.opcode == Opcode.RETURN_VOID) safeReturns++
        }
        address += instruction.codeUnits
    }
    check(safeReturns == 2) { "Expected two safe early returns in the repaired emoji wrapper" }
    check(instructions.count { ((it as? ReferenceInstruction)?.reference as? MethodReference)?.name == "onCommentBind" } == 1)
    println("MIXED PASS: both invalid branches now target return; single shared comment hook retained")
    println("MIXED APK: ${output.absolutePath}")
}
