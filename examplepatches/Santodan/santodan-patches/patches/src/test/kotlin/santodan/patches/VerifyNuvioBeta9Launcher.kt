package santodan.patches

import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import com.android.tools.smali.dexlib2.dexbacked.DexBackedDexFile
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import java.io.File
import software.santodan.extension.nuviolauncher.LauncherModels
import software.santodan.extension.nuviolauncher.LauncherModels.Tile

/** Real original APK contracts, injected callbacks, and launcher identity/list rules. */
fun main(args: Array<String>) {
    val movie = Tile("tt1", "movie", "Movie")
    val series = Tile("tt1", "series", "Series")
    check(LauncherModels.tiles(listOf(movie, movie, series, Tile("__placeholder_row", "movie", "Placeholder"))) == listOf(movie, series))
    check(LauncherModels.tiles((1..200).map { movie.copy(id = "tt$it") }).size == 100)
    check(LauncherModels.key("catalog", "url1", "addon", "movie", "popular") !=
        LauncherModels.key("catalog", "url2", "addon", "movie", "popular"))
    check(LauncherModels.key("tracking", "TRAKT", "watchlist") != LauncherModels.key("tracking", "SIMKL", "watchlist"))
    check(LauncherModels.key("catalog", "a_b", "c") != LauncherModels.key("catalog", "a", "b_c"))
    check(LauncherModels.listItems(listOf(movie to setOf("a"), series to setOf("a", "b")), "a",
        mapOf("movie:tt1" to 2, "series:tt1" to 1)) == listOf(series, movie))
    check(LauncherModels.listItems(listOf(movie to setOf("a"), series to setOf("b")), "b", emptyMap()) == listOf(series))
    println("PASS: catalog/provider identities, type-aware deduplication, cap, membership and provider ordering")

    for ((version, directory) in listOf(NuvioLayout.LATEST to args[0])) {
        NuvioLayout.use(version)
        val classes = File(directory).listFiles()!!.filter { it.extension == "dex" }.flatMap { file ->
            file.inputStream().buffered().use { DexBackedDexFile.fromInputStream(null, it).classes.toList() }
        }.associateBy { it.type }
        fun owner(type: String): ClassDef = classes[type] ?: error("Missing $type")
        fun field(type: String, name: String, expected: String) {
            check(owner(type).fields.any { it.name == name && it.type == expected }) { "$version missing $type->$name:$expected" }
        }
        fun method(type: String, name: String, count: Int, returns: String? = null) {
            check(owner(type).methods.count { it.name == name && it.parameterTypes.size == count && (returns == null || it.returnType == returns) } == 1) {
                "$version missing/ambiguous $type->$name/$count"
            }
        }
        val homeType = "Lya/t3;"
        val libraryType = "Lba/j1;"
        val stateType = "Lya/s2;"
        field(homeType, "z", "Lkotlinx/coroutines/flow/MutableStateFlow;")
        field(homeType, "b", "Lfa/a;")
        field(homeType, "d", "Lba/x;")
        field(stateType, "c", "Ljava/util/List;")
        field("Lba/p;", "r", "Lkotlinx/coroutines/flow/StateFlow;")
        field(libraryType, "n", "Lkotlinx/coroutines/flow/Flow;")
        field(libraryType, "f", "Lq9/j;")
        field(libraryType, "g", "Lg9/f;")
        field("Lg9/f;", "f", "Lkotlinx/coroutines/flow/StateFlow;")
        field("Lq8/e;", "B", "Lbc/c;")
        method("Lq9/j;", "b", 0, "Ljava/util/List;")
        for (name in listOf("b", "n", "c")) method("Lq9/i;", name, 0, "Lkotlinx/coroutines/flow/Flow;")
        method("Lq9/i;", "a", 0, "Lq9/g0;")
        method("Lba/x;", "a", 11, "Lkotlinx/coroutines/flow/Flow;")
        for ((model, getters) in mapOf(
            "Addon" to listOf("getEnabled", "getCatalogs", "getBaseUrl", "getId", "getDisplayName"),
            "CatalogDescriptor" to listOf("getExtra", "getExtraRequired", "getId", "getName", "getApiType"),
            "CatalogExtra" to listOf("getDefaultValue", "getName", "isRequired"),
            "CatalogRow" to listOf("getItems"),
            "MetaPreview" to listOf("getApiType", "getId", "getName", "getPoster", "getBackground", "getDescription"),
            "LibraryEntry" to listOf("getType", "getId", "getName", "getPoster", "getBackground", "getDescription", "getListKeys", "getListRanks"),
            "LibraryListTab" to listOf("getKey", "getTitle")
        )) for (getter in getters) method("Lcom/nuvio/tv/domain/model/$model;", getter, 0)
        val next = "Lya/g9;"
        for (name in listOf("a", "b", "c", "d", "e", "o")) field(next, name, "Ljava/lang/String;")
        field("Lya/e0;", "a", next)
        val component = MutableClass(owner("Lq8/e;"))
        val home = MutableClass(owner(homeType))
        val library = MutableClass(owner(libraryType))
        NuvioLauncherChannelsPatch.hookReturn(NuvioRemainingEpisodesPatch.unique(component, "<init>", 1), "registerComponent")
        NuvioLauncherChannelsPatch.hookReturn(NuvioRemainingEpisodesPatch.unique(home, "<init>", 27), "observeHome")
        NuvioLauncherChannelsPatch.insert(NuvioRemainingEpisodesPatch.unique(home, "onCleared", 0), 0, "stopHome")
        NuvioLauncherChannelsPatch.hookReturn(NuvioRemainingEpisodesPatch.unique(library, "<init>", 8), "observeLibrary")
        val calls = listOf(component, home, library).flatMap { it.methods }.flatMap { method ->
            method.implementation?.instructions?.mapNotNull {
                ((it as? ReferenceInstruction)?.reference as? MethodReference)?.takeIf { ref -> ref.definingClass == NuvioLauncherChannelsPatch.EXTENSION }?.name
            }?.toList().orEmpty()
        }
        check(calls.sorted() == listOf("observeHome", "observeLibrary", "registerComponent", "stopHome").sorted())
        println("PASS: $version native source, profile, model and settings contracts; all four bytecode hooks")
    }
}
