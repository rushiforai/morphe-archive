package app.template.patches.shatteredpixeldungeon

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.COMPATIBILITY_SHATTERED_PIXEL_DUNGEON
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction

private const val EXTRAS_CLASS = "$EXTENSION_PACKAGE/HeroExtras;"
private const val INFINITE_CLASS = "$EXTENSION_PACKAGE/InfiniteStatuses;"

@Suppress("unused")
val characterEditorPatch = bytecodePatch(
	name = "Character editor",
	description = "Edit your hero's stats, talents, subclass, armor ability, modifiers, resistances and status effects.",
	default = true,
) {
	compatibleWith(COMPATIBILITY_SHATTERED_PIXEL_DUNGEON)

	dependsOn(cloverlordMenuPatch)

	execute {
		CharacterEditorAvailableFingerprint.returnTrue()
		hookInfoWindows()
		WndTabbedSelectFingerprint.callWithThisBeforeReturns("$EXTENSION_PACKAGE/CloverlordMenu;->afterTabSelected(Ljava/lang/Object;)V")
		WndHeroConstructorFingerprint.callBeforeReturn(
			"invoke-static/range { p0 .. p0 }, $EXTENSION_PACKAGE/CloverlordMenu;->onHeroWindowCreated(Lcom/shatteredpixel/shatteredpixeldungeon/ui/Window;)V",
		)

		HeroConstructorFingerprint.method.addInstruction(0, "invoke-static { }, $EXTRAS_CLASS->reset()V")
		HeroStoreInBundleFingerprint.method.addInstruction(0, "invoke-static/range { p1 .. p1 }, $EXTRAS_CLASS->store(Lcom/watabou/utils/Bundle;)V")
		HeroRestoreFromBundleFingerprint.method.addInstruction(0, "invoke-static/range { p1 .. p1 }, $EXTRAS_CLASS->restore(Lcom/watabou/utils/Bundle;)V")

		HeroBonusTalentPointsFingerprint.method.addInstruction(0, "invoke-static { p0, p1 }, $EXTRAS_CLASS->beforeBonusTalentPoints(Ljava/lang/Object;I)V")
		HeroBonusTalentPointsFingerprint.adjustReturns("$EXTRAS_CLASS->adjustBonusTalentPoints(I)I")
		HeroAttackSkillFingerprint.adjustReturns("$EXTRAS_CLASS->adjustAccuracy(I)I")
		HeroDefenseSkillFingerprint.adjustReturns("$EXTRAS_CLASS->adjustEvasion(I)I")
		HeroDamageRollFingerprint.adjustReturns("$EXTRAS_CLASS->adjustDamage(I)I")
		HeroDrRollFingerprint.adjustReturns("$EXTRAS_CLASS->adjustArmor(I)I")
		HeroAttackDelayFingerprint.adjustReturns("$EXTRAS_CLASS->adjustAttackDelay(F)F")
		HeroSpeedFingerprint.adjustReturns("$EXTRAS_CLASS->adjustMoveSpeed(F)F")
		SaltCubeRegenFingerprint.adjustReturns("$EXTRAS_CLASS->adjustRegen(F)F")
		CharStealthFingerprint.adjustReturns("$EXTRAS_CLASS->adjustStealth(FLjava/lang/Object;)F", "p0")

		HeroDamageFingerprint.method.addInstructions(
			0,
			"""
				invoke-static/range { p1 .. p2 }, $EXTRAS_CLASS->adjustDamageTaken(ILjava/lang/Object;)I
				move-result p1
			""",
		)
		HeroAttackProcFingerprint.method.addInstruction(0, "invoke-static/range { p1 .. p1 }, $EXTRAS_CLASS->beforeAttackProc(Ljava/lang/Object;)V")
		HeroAttackProcFingerprint.adjustReturns("$EXTRAS_CLASS->adjustDamageDealt(I)I")
		HeroActFingerprint.method.addInstruction(0, "invoke-static/range { p0 .. p0 }, $EXTRAS_CLASS->onHeroAct(Ljava/lang/Object;)V")
		HeroEarnExpFingerprint.method.addInstructions(
			0,
			"""
				invoke-static/range { p1 .. p1 }, $EXTRAS_CLASS->adjustExperience(I)I
				move-result p1
			""",
		)
		mapOf("incShield" to "adjustShieldGain", "setShield" to "adjustShieldSet").forEach { (name, adjust) ->
			ShieldBuffAmountFingerprint(name).method.addInstructions(
				0,
				"""
					invoke-static/range { p0 .. p1 }, $EXTRAS_CLASS->$adjust(Ljava/lang/Object;I)I
					move-result p1
				""",
			)
		}
		listOf("affect", "prolong").forEach { name ->
			BuffDurationFingerprint(name).method.addInstructions(
				0,
				"""
					invoke-static/range { p0 .. p2 }, $EXTRAS_CLASS->adjustBuffDuration(Ljava/lang/Object;Ljava/lang/Class;F)F
					move-result p2
				""",
			)
		}
		GoldDoPickUpFingerprint.method.addInstruction(0, "invoke-static/range { p0 .. p1 }, $EXTRAS_CLASS->beforeGoldPickup(Ljava/lang/Object;Ljava/lang/Object;)V")
		ShopkeeperSellPriceFingerprint.adjustReturns("$EXTRAS_CLASS->adjustBuyPrice(I)I")
		listOf("sell", "sellOne").forEach { name ->
			WndTradeSellFingerprint(name).adjustCallResults("Lcom/shatteredpixel/shatteredpixeldungeon/items/Item;->value()I", "$EXTRAS_CLASS->sellValue(I)I")
		}
		MissileDurabilityFingerprint.adjustReturns("$EXTRAS_CLASS->adjustThrownWear(F)F")
		TalentItemIdSpeedFingerprint.adjustReturns("$EXTRAS_CLASS->adjustIdentifySpeed(F)F")
		WndEnergizeFingerprint.adjustCallResults("Lcom/shatteredpixel/shatteredpixeldungeon/items/Item;->energyVal()I", "$EXTRAS_CLASS->adjustEnergy(I)I")

		listOf("getBonus", "getBuffedBonus").forEach { name ->
			val ringBonus = RingBonusFingerprint(name)
			ringBonus.method.addInstruction(0, "invoke-static { p0, p1 }, $EXTRAS_CLASS->beforeRingBonus(Ljava/lang/Object;Ljava/lang/Class;)V")
			ringBonus.adjustReturns("$EXTRAS_CLASS->adjustRingBonus(ILjava/lang/Class;)I", "p1")
		}

		CharResistFingerprint.method.addInstruction(0, "invoke-static { p0, p1 }, $EXTRAS_CLASS->beforeResist(Ljava/lang/Object;Ljava/lang/Class;)V")
		CharResistFingerprint.adjustReturns("$EXTRAS_CLASS->adjustResist(F)F")
		CharIsImmuneFingerprint.skipWhen("invoke-static { p0, p1 }, $EXTRAS_CLASS->isImmune(Ljava/lang/Object;Ljava/lang/Class;)Z", result = true)

		HeroSearchFingerprint.adjustCallResults("Lcom/watabou/utils/Random;->Float()F", "$EXTRAS_CLASS->adjustSearchRoll(F)F")
		HeroSearchFingerprint.method.let { search ->
			val instructions = search.implementation!!.instructions.toList()
			val foresight = instructions.indexOfFirst {
				it.opcode == Opcode.CONST_CLASS && (it as ReferenceInstruction).reference.toString() == "Lcom/shatteredpixel/shatteredpixeldungeon/actors/buffs/Foresight;"
			}
			if (foresight < 0) throw PatchException("Hero.search no longer checks Foresight")
			val distance = (instructions.subList(0, foresight).last { it.opcode == Opcode.ADD_INT_LIT8 } as TwoRegisterInstruction).registerA
			val center = instructions.indexOfFirst {
				(it as? ReferenceInstruction)?.reference?.toString() == "Lcom/shatteredpixel/shatteredpixeldungeon/levels/Level;->cellToPoint(I)Lcom/watabou/utils/Point;"
			}
			val after = center + 1
			if (center < foresight || instructions[after].opcode != Opcode.MOVE_RESULT_OBJECT) throw PatchException("Hero.search changed after Foresight")
			search.addInstructions(
				after + 1,
				"""
					invoke-static/range { v$distance .. v$distance }, $EXTRAS_CLASS->adjustSearchDistance(I)I
					move-result v$distance
				""",
			)
		}

		LevelUpdateFieldOfViewFingerprint.method.let { fieldOfView ->
			val instructions = fieldOfView.implementation!!.instructions.toList()
			val viewDistance = instructions.indexOfFirst {
				it.opcode == Opcode.IGET && (it as ReferenceInstruction).reference.toString().endsWith("Char;->viewDistance:I")
			}
			if (viewDistance < 0) throw PatchException("Level.updateFieldOfView no longer reads viewDistance")
			val character = (instructions[viewDistance] as TwoRegisterInstruction).registerB
			val newt = instructions.indexOfFirst {
				(it as? ReferenceInstruction)?.reference?.toString()?.contains("EyeOfNewt;->visionRangeMultiplier") == true
			}
			val multiply = newt + 2
			if (newt < 0 || instructions[multiply].opcode != Opcode.MUL_FLOAT) throw PatchException("Level.updateFieldOfView changed around EyeOfNewt")
			val distance = (instructions[multiply] as OneRegisterInstruction).registerA
			fieldOfView.addInstructions(
				multiply + 1,
				"""
					invoke-static { v$character, v$distance }, $EXTRAS_CLASS->adjustViewDistance(Ljava/lang/Object;F)F
					move-result v$distance
				""",
			)
		}

		CharRemoveBuffFingerprint.method.addInstruction(0, "invoke-static { p0, p1 }, $INFINITE_CLASS->beforeRemove(Ljava/lang/Object;Ljava/lang/Object;)V")
		CharRemoveBuffFingerprint.adjustReturns("$INFINITE_CLASS->afterRemove(Z)Z")
		HeroActFingerprint.method.addInstruction(0, "invoke-static/range { p0 .. p0 }, $INFINITE_CLASS->onHeroAct(Ljava/lang/Object;)V")
	}
}
