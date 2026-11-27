package app.template.patches.shatteredpixeldungeon

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.COMPATIBILITY_SHATTERED_PIXEL_DUNGEON

private const val HUNGER_CLASS = "$EXTENSION_PACKAGE/HungerEditor;"

@Suppress("unused")
val hungerEditorPatch = bytecodePatch(
	name = "Hunger editor",
	description = "Change how long each hunger stage lasts and how starving hurts, or switch hunger off.",
	default = true,
) {
	compatibleWith(COMPATIBILITY_SHATTERED_PIXEL_DUNGEON)

	dependsOn(cloverlordMenuPatch)

	execute {
		HungerEditorAvailableFingerprint.returnTrue()
		SaltCubeHungerGainFingerprint.adjustReturns("$HUNGER_CLASS->adjustHungerGain(F)F")

		HungerConstructorFingerprint.method.addInstruction(0, "invoke-static { }, $HUNGER_CLASS->onHungerCreated()V")
		HungerStoreInBundleFingerprint.callBeforeReturn("invoke-static/range { p1 .. p1 }, $HUNGER_CLASS->store(Lcom/watabou/utils/Bundle;)V")
		HungerRestoreFromBundleFingerprint.method.addInstruction(0, "invoke-static { p1 }, $HUNGER_CLASS->beforeRestore(Lcom/watabou/utils/Bundle;)V")
		HungerRestoreFromBundleFingerprint.callBeforeReturn("invoke-static { }, $HUNGER_CLASS->afterRestore()V")

		HungerActFingerprint.method.addInstruction(0, "invoke-static/range { p0 .. p0 }, $HUNGER_CLASS->onHungerAct(Ljava/lang/Object;)V")

		HeroDamageFingerprint.skipWhen("invoke-static { p2 }, $HUNGER_CLASS->blocksDamage(Ljava/lang/Object;)Z")
	}
}
