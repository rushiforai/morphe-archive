package slick.android

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode

val cacheCleaner =
    bytecodePatch {
        execute {
            for ((type, parameters, hook) in listOf(
                Triple(
                    "Lcoil/disk/RealDiskCache;",
                    listOf("J", "Lkotlinx/coroutines/CoroutineDispatcher;", "Lokio/FileSystem;", "Lokio/Path;"),
                    "images",
                ),
                Triple(
                    "Landroidx/media3/datasource/cache/SimpleCache;",
                    listOf(
                        "Ljava/io/File;",
                        "Lslack/services/multimedia/player/cache/ConfigurableLeastRecentlyUsedCacheEvictor;",
                        "Landroidx/media3/database/StandaloneDatabaseProvider;",
                    ),
                    "video",
                ),
            )) {
                method(type, "<init>") { it.parameterTypes.map { p -> p.toString() }.sorted() == parameters.sorted() && it.returnType == "V" }.run {
                    val exits = indexed(Opcode.RETURN_VOID).map { it.index }
                    check(exits.isNotEmpty()) { "No successful constructor exit for $type" }
                    for (i in exits.reversed()) {
                        replaceInstruction(i, call("p0", "CacheCleaner;->$hook(Ljava/lang/Object;)V"))
                        addInstructions(i + 1, "return-void")
                    }
                }
            }
        }
    }
