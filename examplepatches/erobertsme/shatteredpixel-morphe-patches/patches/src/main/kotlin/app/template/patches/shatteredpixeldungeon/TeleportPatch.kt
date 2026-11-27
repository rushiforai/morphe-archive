package app.template.patches.shatteredpixeldungeon

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.COMPATIBILITY_SHATTERED_PIXEL_DUNGEON

private const val TELEPORT_CLASS = "$EXTENSION_PACKAGE/Teleport;"

@Suppress("unused")
val teleportPatch = bytecodePatch(
	name = "Teleport",
	description = "Teleport to any floor, and teleport your hero or other creatures to any tile.",
	default = true,
) {
	compatibleWith(COMPATIBILITY_SHATTERED_PIXEL_DUNGEON)

	dependsOn(cloverlordMenuPatch)

	execute {
		TeleportAvailableFingerprint.returnTrue()
		DungeonSwitchLevelFingerprint.method.addInstructions(
			0,
			"""
				invoke-static { p0, p1 }, $TELEPORT_CLASS->arrivalCell(Ljava/lang/Object;I)I
				move-result p1
			""",
		)

		NotesTabUpdateListFingerprint.callWithThisBeforeReturns("$TELEPORT_CLASS->afterNotesLayout(Ljava/lang/Object;)V")
		NotesTabLayoutFingerprint.callWithThisBeforeReturns("$TELEPORT_CLASS->afterNotesLayout(Ljava/lang/Object;)V")

		hookInfoWindows()

		ScrollingGridPaneClickFingerprint.skipWhen("invoke-static { p0, p1, p2 }, $TELEPORT_CLASS->onGridClick(Ljava/lang/Object;FF)Z")
	}
}
