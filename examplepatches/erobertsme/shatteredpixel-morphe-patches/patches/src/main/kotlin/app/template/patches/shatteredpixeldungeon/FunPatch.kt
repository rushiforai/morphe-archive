package app.template.patches.shatteredpixeldungeon

import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.COMPATIBILITY_SHATTERED_PIXEL_DUNGEON

@Suppress("unused")
val funPatch = bytecodePatch(
	name = "Fun",
	description = "Just for fun: change your hero's sprite to another hero, an enemy or an NPC.",
	default = true,
) {
	compatibleWith(COMPATIBILITY_SHATTERED_PIXEL_DUNGEON)

	dependsOn(cloverlordMenuPatch)

	execute {
		FunAvailableFingerprint.returnTrue()
		HeroSpriteUpdateArmorFingerprint.callWithThisBeforeReturns("$EXTENSION_PACKAGE/HeroSkin;->afterUpdateArmor(Ljava/lang/Object;)V")
	}
}
