package local.wazemaps

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.*
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction

private object IconPackResources

private val selectableIconAssets = rawResourcePatch {
    dependsOn(reportIconAssets)
    execute {
        val paths = IconPackResources::class.java.getResourceAsStream("/iconpacks/paths.txt")
            ?.bufferedReader()?.use { it.readText() } ?: throw PatchException("Missing icon pack manifest")
        val selected = mutableListOf<String>()
        val warnings = mutableListOf<String>()
        val fallback = mutableListOf<String>()
        val expected = paths.lineSequence().filter(String::isNotEmpty).toList()
        if (expected.isEmpty() || expected.distinct().size != expected.size) throw PatchException("Invalid icon pack manifest")
        for (path in expected) {
            if (path.contains("..") || path.startsWith('/') || path.contains('\\') || !path.endsWith(".png"))
                throw PatchException("Invalid icon asset path: $path")
            val original = get("assets/res/skins/default/$path").takeIf { it.isFile }?.readBytes()
            val bytes = IconPackResources::class.java.getResourceAsStream("/iconpacks/google_maps/$path")
                ?.use { it.readBytes() }
            val mismatch = reportIconMismatch(original, bytes)
            if (mismatch != null) {
                warnings.add("$path: $mismatch")
                if (original != null) fallback.add(path)
                continue
            }
            val target = get("assets/morphe/iconpacks/google_maps/$path")
            target.parentFile.mkdirs()
            target.writeBytes(bytes!!)
            selected.add(path)
        }
        val originals = selected.filterNot { it.startsWith("morphe_") }
        validateReportIconCoverage(selected)
        val skin = get("assets/res/skins/default")
        val known = expected.toSet()
        skin.walkTopDown().filter { it.isFile && it.extension == "png" }.forEach { file ->
            val path = file.relativeTo(skin).invariantSeparatorsPath
            if (path !in known && (path.startsWith("alert_icons/") ||
                    Regex("(?:tiny|small|big)pin_(?:police|camera|accident|hazard|closure|traffic).*\\.png").matches(path)))
            {
                warnings.add("$path: no pack mapping; keeping Waze artwork")
                fallback.add(path)
            }
        }
        val report = get("assets/morphe/compatibility/icon-pack.txt")
        report.parentFile.mkdirs()
        report.writeText(warnings.joinToString("\n"))
        warnings.forEach { println("WARNING: Icon pack: $it") }
        val index = get("assets/morphe/iconpacks/paths.txt")
        index.parentFile.mkdirs()
        index.writeText(selected.joinToString("\n", postfix = "\n"))
        get("assets/morphe/iconpacks/fallback-paths.txt").writeText(fallback.joinToString("\n"))
        println("Waze icon pack: ${originals.size} original assets and ${selected.size - originals.size} sized aliases")
    }
}

@Suppress("unused")
val iconPackPatch = bytecodePatch(
    name = "Selectable report icon packs",
    description = "Add an Icon pack selector for original or Google Maps report icons. Defaults to Google Maps unless a choice is saved. Works independently of map themes and icon sizing.",
    default = true
) {
    compatibleWith(Compatibility(
        packageName = "com.waze", name = "Waze", apkFileType = ApkFileType.XAPK,
        signatures = setOf("03637f6c5d8f604e6fdb79a6ffbfa578de4e318f8da22fc6106665247f8807d7"),
        targets = TESTED_WAZE_VERSIONS.map { AppTarget(it) }
    ))
    dependsOn(selectableIconAssets)
    extendWith("extensions/icon-pack.dex")
    execute {
        bindExtension("Llocal/wazemaps/themes/IconPack;", context = true, rows = true)
        val assets = assetLoader()
        val filename = if (AccessFlags.STATIC.isSet(assets.accessFlags)) "p0" else "p1"
        val parameters = if (filename == "p0") 1 else 2
        if (assets.implementation!!.registerCount <= parameters)
            throw PatchException("Unexpected icon asset loader register layout")
        assets.addInstructions(0, """
            invoke-static/range {$filename .. $filename}, Llocal/wazemaps/themes/IconPack;->open(Ljava/lang/String;)Ljava/io/InputStream;
            move-result-object v0
            if-eqz v0, :original
            return-object v0
            :original
            nop
        """)
        for (method in resourceHooks()) {
            val returns = method.implementation!!.instructions.mapIndexedNotNull { i, instruction ->
                i.takeIf { instruction.opcode == Opcode.RETURN_VOID }
            }
            if (returns.isEmpty()) throw PatchException("Resource preparation exit missing")
            returns.reversed().forEach {
                method.addInstructions(it, "invoke-static {}, Llocal/wazemaps/themes/IconPack;->prepare()V")
            }
        }
        val render = settingsRenderer()
        val exits = render.implementation!!.instructions.mapIndexedNotNull { i, instruction ->
            if (instruction.opcode == Opcode.RETURN_OBJECT) i to (instruction as OneRegisterInstruction).registerA else null
        }
        if (exits.isEmpty()) throw PatchException("Settings renderer exit missing")
        exits.reversed().forEach { (i, register) ->
            render.addInstructions(i, """
                invoke-static/range {v$register .. v$register}, Llocal/wazemaps/themes/IconPack;->decorate(Landroid/view/View;)Landroid/view/View;
                move-result-object v$register
            """)
        }
    }
}
