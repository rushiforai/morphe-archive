package app.template.patches.shatteredpixeldungeon

import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.COMPATIBILITY_SHATTERED_PIXEL_DUNGEON

private const val UNLOCK_CLASS = "$EXTENSION_PACKAGE/UnlockAll;"

private val documentFingerprints = listOf(
	DocumentIsPageFoundFingerprint,
	DocumentIsPageReadFingerprint,
	DocumentAnyPagesFoundFingerprint,
	DocumentAllPagesFoundFingerprint,
)

@Suppress("unused")
val unlockAllPatch = bytecodePatch(
	name = "Unlock all",
	description = "Show all heroes, guides, lore, catalog items and bestiary entries as unlocked without changing your save.",
	default = true,
) {
	compatibleWith(COMPATIBILITY_SHATTERED_PIXEL_DUNGEON)

	dependsOn(cloverlordMenuPatch)

	execute {
		UnlockAllAvailableFingerprint.returnTrue()

		HeroClassIsUnlockedFingerprint.returnTrueWhen("$UNLOCK_CLASS->unlockHeroes()Z")
		CatalogIsSeenFingerprint.returnTrueWhen("$UNLOCK_CLASS->unlockItems()Z")
		BestiaryIsSeenFingerprint.returnTrueWhen("$UNLOCK_CLASS->unlockBestiary()Z")
		documentFingerprints.forEach {
			it.returnTrueWhen("$UNLOCK_CLASS->isDocumentUnlocked(Ljava/lang/Object;)Z", "p0")
		}
	}
}
