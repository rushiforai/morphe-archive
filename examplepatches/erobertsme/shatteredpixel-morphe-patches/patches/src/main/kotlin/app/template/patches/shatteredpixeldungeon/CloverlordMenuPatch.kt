package app.template.patches.shatteredpixeldungeon

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.PATCHES_VERSION
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction

private const val MENU_CLASS = "$EXTENSION_PACKAGE/CloverlordMenu;"
private const val GAME_SETTINGS_CLASS = "$EXTENSION_PACKAGE/GameSettings;"

internal val cloverlordMenuPatch = bytecodePatch(
	description = "Adds the Extras menu to the title screen and the in-game menu.",
) {
	extendWith("extensions/extension.mpe")
	dependsOn(customIconsPatch)

	execute {
		KeyboardConnectionFingerprint.method.let { connection ->
			val instructions = connection.implementation!!.instructions.toList()
			val inputType = instructions.indexOfFirst {
				it.opcode == Opcode.IPUT && (it as ReferenceInstruction).reference.toString().endsWith("EditorInfo;->inputType:I")
			}
			if (inputType < 0) throw PatchException("The game's view no longer sets the keyboard type")
			val info = (instructions[inputType] as TwoRegisterInstruction).registerB
			connection.addInstruction(inputType + 1, "invoke-static/range { v$info .. v$info }, $EXTENSION_PACKAGE/AndroidUi;->adjustKeyboard(Landroid/view/inputmethod/EditorInfo;)V")
		}
		PatchesVersionFingerprint.method.addInstructions(
			0,
			"""
				const-string v0, "$PATCHES_VERSION"
				return-object v0
			""",
		)

		TitleSceneCreateFingerprint.callBeforeReturn(
			"invoke-static/range { p0 .. p0 }, $MENU_CLASS->onTitleCreated(Lcom/watabou/noosa/Group;)V",
		)
		TitleSceneUpdateFadeFingerprint.callBeforeReturn(
			"invoke-static/range { p0 .. p0 }, $MENU_CLASS->onTitleFade(Lcom/watabou/noosa/Group;)V",
		)
		HeroStoreInBundleFingerprint.method.addInstruction(
			0,
			"invoke-static/range { p0 .. p1 }, $GAME_SETTINGS_CLASS->onStore(Ljava/lang/Object;Lcom/watabou/utils/Bundle;)V",
		)
		HeroRestoreFromBundleFingerprint.method.addInstruction(
			0,
			"invoke-static/range { p0 .. p1 }, $GAME_SETTINGS_CLASS->onRestore(Ljava/lang/Object;Lcom/watabou/utils/Bundle;)V",
		)

		WndGameConstructorFingerprint.callBeforeReturn(
			"invoke-static/range { p0 .. p0 }, $MENU_CLASS->onGameMenuCreated(Lcom/shatteredpixel/shatteredpixeldungeon/ui/Window;)V",
		)
	}
}
