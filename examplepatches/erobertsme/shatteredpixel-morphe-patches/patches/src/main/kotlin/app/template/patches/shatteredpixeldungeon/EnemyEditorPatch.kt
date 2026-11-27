package app.template.patches.shatteredpixeldungeon

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.COMPATIBILITY_SHATTERED_PIXEL_DUNGEON

private const val ENEMY_CLASS = "$EXTENSION_PACKAGE/EnemyEditor;"

@Suppress("unused")
val enemyEditorPatch = bytecodePatch(
	name = "Enemy editor",
	description = "Edit any creature's health, side, behavior and status effects.",
	default = true,
) {
	compatibleWith(COMPATIBILITY_SHATTERED_PIXEL_DUNGEON)

	dependsOn(cloverlordMenuPatch)

	execute {
		EnemyEditorAvailableFingerprint.returnTrue()
		hookInfoWindows()
		CharStoreInBundleFingerprint.callBeforeReturn(
			"invoke-static/range { p0 .. p1 }, $ENEMY_CLASS->store(Ljava/lang/Object;Lcom/watabou/utils/Bundle;)V",
		)
		CharRestoreFromBundleFingerprint.method.addInstruction(0, "invoke-static { p0, p1 }, $ENEMY_CLASS->beforeRestore(Ljava/lang/Object;Lcom/watabou/utils/Bundle;)V")
		CharRestoreFromBundleFingerprint.callBeforeReturn("invoke-static { }, $ENEMY_CLASS->afterRestore()V")
	}
}
