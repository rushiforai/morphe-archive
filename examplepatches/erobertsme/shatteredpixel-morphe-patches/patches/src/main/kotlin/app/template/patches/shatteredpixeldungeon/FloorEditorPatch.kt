package app.template.patches.shatteredpixeldungeon

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.COMPATIBILITY_SHATTERED_PIXEL_DUNGEON

@Suppress("unused")
val floorEditorPatch = bytecodePatch(
	name = "Floor editor",
	description = "Edit the tiles, traps, plants, area effects, items and creatures on the current floor, and draw the floor by dragging.",
	default = true,
) {
	compatibleWith(COMPATIBILITY_SHATTERED_PIXEL_DUNGEON)

	dependsOn(cloverlordMenuPatch)

	execute {
		FloorEditorAvailableFingerprint.returnTrue()

		hookInfoWindows()

		val blacksmith = "$EXTENSION_PACKAGE/BlacksmithEditor;"
		val quest = "Lcom/shatteredpixel/shatteredpixeldungeon/actors/mobs/npcs/Blacksmith\$Quest;"
		WndBlacksmithConstructorFingerprint.method.addInstruction(0, "invoke-static/range { p1 .. p1 }, $blacksmith->beforeWindow(Ljava/lang/Object;)V")
		WndBlacksmithConstructorFingerprint.callWithThisBeforeReturns("$blacksmith->afterWindow(Ljava/lang/Object;)V")
		BlacksmithInteractFingerprint.adjustCallResults("$quest->rewardsAvailable()Z", "$blacksmith->servicesShown(Z)Z")
		CavesLevelActivateTransitionFingerprint.adjustCallResults("$quest->given()Z", "$blacksmith->questGiven(Z)Z")
		CavesLevelActivateTransitionFingerprint.adjustCallResults("$quest->started()Z", "$blacksmith->questStarted(Z)Z")
		CavesLevelActivateTransitionFingerprint.adjustCallResults("$quest->completed()Z", "$blacksmith->questCompleted(Z)Z")
	}
}
