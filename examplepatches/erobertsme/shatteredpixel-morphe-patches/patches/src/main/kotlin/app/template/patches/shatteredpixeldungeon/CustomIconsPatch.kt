package app.template.patches.shatteredpixeldungeon

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.resourcePatch

private const val ICONS_FOLDER = "cloverlord/icons"

/**
 * Adds the patches' own icons, the PNG files listed in resources/cloverlord/icons/index.txt, to the game's assets, where the game loads
 * them like its own pictures.
 */
internal val customIconsPatch = resourcePatch(
	description = "Adds the patches' own icons to the game.",
) {
	execute {
		val loader = object {}.javaClass
		val index = loader.getResourceAsStream("/$ICONS_FOLDER/index.txt")?.use { it.readBytes() }
			?: throw PatchException("The custom icons' index is missing")
		val names = String(index).lines().map { it.trim() }.filter { it.isNotEmpty() }
		get("assets/$ICONS_FOLDER/index.txt", false).apply {
			parentFile.mkdirs()
			writeBytes(index)
		}
		names.forEach { name ->
			val bytes = loader.getResourceAsStream("/$ICONS_FOLDER/$name.png")?.use { it.readBytes() }
				?: throw PatchException("The custom icon $name.png is missing")
			get("assets/$ICONS_FOLDER/$name.png", false).writeBytes(bytes)
		}
	}
}
