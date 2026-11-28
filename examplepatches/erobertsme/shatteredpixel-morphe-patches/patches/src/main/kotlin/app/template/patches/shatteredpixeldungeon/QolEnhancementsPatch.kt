package app.template.patches.shatteredpixeldungeon

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.smali.ExternalLabel
import app.template.patches.shared.Constants.COMPATIBILITY_SHATTERED_PIXEL_DUNGEON

private const val PREVIEW_CLASS = "$EXTENSION_PACKAGE/PathPreview;"
private const val SHOPKEEPER_CLASS = "$EXTENSION_PACKAGE/ShopkeeperRules;"
private const val CHEST_CLASS = "$EXTENSION_PACKAGE/QuantumChest;"
private const val QUICKSLOT_CLASS = "$EXTENSION_PACKAGE/QuickslotRow;"
private const val RESUME_PATH_CLASS = "$EXTENSION_PACKAGE/ResumePath;"
private const val FORCE_ATTACK_CLASS = "$EXTENSION_PACKAGE/ForceAttack;"
private const val BESTIARY_CLASS = "$EXTENSION_PACKAGE/EnhancedBestiary;"
private const val REWARDS_CLASS = "$EXTENSION_PACKAGE/KillRewards;"
private const val TILE_CONTENTS_CLASS = "$EXTENSION_PACKAGE/TileContents;"
private const val ABSORBED_CLASS = "$EXTENSION_PACKAGE/AbsorbedItems;"
private const val ITEM_TYPE = "Ljava/lang/Object;"
private const val GARDEN_CLASS = "$EXTENSION_PACKAGE/Garden;"
private const val TORCHES_CLASS = "$EXTENSION_PACKAGE/Torches;"
private const val CHAR_DESCRIPTOR = "Lcom/shatteredpixel/shatteredpixeldungeon/actors/Char;"
private const val FLAVOUR_BUFF_DESCRIPTOR = "Lcom/shatteredpixel/shatteredpixeldungeon/actors/buffs/FlavourBuff;"

@Suppress("unused")
val qolEnhancementsPatch = bytecodePatch(
	name = "QoL enhancements",
	description = "Confirm risky taps, a calmer shopkeeper, a Quantum Chest on boss floors, bigger bags, extra toolbar item slots, an Attack Tile button, an Enhanced Bestiary, a hero stats button, experience and loot rules, more items to energize, catalyst rerolls, walking through allies, item tags, display margins, a stronger Mageroyal, safe gardens, improved torches, a preview of each game in progress and new games from any game's seed.",
	default = true,
) {
	compatibleWith(COMPATIBILITY_SHATTERED_PIXEL_DUNGEON)

	dependsOn(cloverlordMenuPatch, bagLayoutPatch)

	execute {
		PathPreviewAvailableFingerprint.returnTrue()

		DefaultCellListenerFingerprint.skipWhen("invoke-static { p1 }, $PREVIEW_CLASS->interceptTap(Ljava/lang/Integer;)Z")

		ShopkeeperDamageFingerprint.skipWhen("invoke-static { p0, p2 }, $SHOPKEEPER_CLASS->onDamage(Ljava/lang/Object;Ljava/lang/Object;)Z", register = "p1")

		ShopkeeperAddFingerprint.skipWhen("invoke-static { p0, p1 }, $SHOPKEEPER_CLASS->onBuff(Ljava/lang/Object;Ljava/lang/Object;)Z", result = false)

		ShopkeeperActFingerprint.method.addInstruction(0, "invoke-static { p0 }, $SHOPKEEPER_CLASS->onAct(Ljava/lang/Object;)V")
		ShopkeeperStoreFingerprint.method.addInstruction(0, "invoke-static { p0, p1 }, $SHOPKEEPER_CLASS->onStore(Ljava/lang/Object;Lcom/watabou/utils/Bundle;)V")
		ShopkeeperRestoreFingerprint.method.addInstruction(0, "invoke-static { p0, p1 }, $SHOPKEEPER_CLASS->onRestore(Ljava/lang/Object;Lcom/watabou/utils/Bundle;)V")

		ShopkeeperSellSelectFingerprint.skipWhen("invoke-static { p1 }, $EXTENSION_PACKAGE/ShopItemWindow;->onSellSelected(Lcom/shatteredpixel/shatteredpixeldungeon/items/Item;)Z")
		ShopkeeperInteractFingerprint.skipWhen("invoke-static { p0, p1 }, $SHOPKEEPER_CLASS->onInteract(Ljava/lang/Object;Ljava/lang/Object;)Z", result = true)

		ShopkeeperFleeFingerprint.skipWhen("invoke-static { p0 }, $SHOPKEEPER_CLASS->onFlee(Ljava/lang/Object;)Z")

		MobYellFingerprint.skipWhen("invoke-static { p0, p1 }, $SHOPKEEPER_CLASS->onYell(Ljava/lang/Object;Ljava/lang/String;)Z")

		WndTradeHeapConstructorFingerprint.method.addInstruction(
			0,
			"invoke-static/range { p1 .. p1 }, $SHOPKEEPER_CLASS->onTradeWindow(Ljava/lang/Object;)V",
		)

		LauncherOnCreateFingerprint.method.addInstruction(0, "invoke-static { }, $QUICKSLOT_CLASS->onLaunch()V")
		ItemStoreInBundleFingerprint.method.addInstruction(
			0,
			"invoke-static { p0, p1 }, $QUICKSLOT_CLASS->beforeItemStore(${ITEM_TYPE}Lcom/watabou/utils/Bundle;)V",
		)
		ItemStoreInBundleFingerprint.callBeforeEveryReturn("invoke-static { p0 }, $QUICKSLOT_CLASS->afterItemStore($ITEM_TYPE)V")
		ItemRestoreFromBundleFingerprint.method.addInstruction(
			0,
			"invoke-static { p0, p1 }, $QUICKSLOT_CLASS->beforeItemRestore(${ITEM_TYPE}Lcom/watabou/utils/Bundle;)V",
		)
		ItemRestoreFromBundleFingerprint.callBeforeEveryReturn("invoke-static { p0 }, $QUICKSLOT_CLASS->afterItemRestore($ITEM_TYPE)V")
		QuickSlotStorePlaceholdersFingerprint.method.addInstruction(0, "invoke-static { }, $QUICKSLOT_CLASS->beforePlaceholders()V")
		QuickSlotStorePlaceholdersFingerprint.callBeforeEveryReturn("invoke-static { }, $QUICKSLOT_CLASS->afterPlaceholders()V")
		ToolbarConstructorFingerprint.callWithThisBeforeReturns("$QUICKSLOT_CLASS->afterToolbarCreated($ITEM_TYPE)V")
		GameScenePromptFingerprint.callWithThisBeforeReturns("$QUICKSLOT_CLASS->afterPrompt($ITEM_TYPE)V")
		WndQuickBagConstructorFingerprint.callWithThisBeforeReturns("$QUICKSLOT_CLASS->afterQuickBag($ITEM_TYPE)V")
		ToolbarLayoutFingerprint.callWithThisBeforeReturns("$QUICKSLOT_CLASS->afterToolbarLayout($ITEM_TYPE)V")

		HeroReadyFingerprint.callBeforeEveryReturn("invoke-static { }, $EXTENSION_PACKAGE/GameEvents;->onHeroReady()V")
		HeroBusyFingerprint.method.addInstruction(0, "invoke-static { }, $EXTENSION_PACKAGE/GameEvents;->onHeroBusy()V")
		HeroActFingerprint.method.addInstruction(0, "invoke-static/range { p0 .. p0 }, $EXTENSION_PACKAGE/WaitCancel;->onHeroAct(Ljava/lang/Object;)V")
		QuickSlotButtonRefreshFingerprint.callBeforeEveryReturn("invoke-static { }, $EXTENSION_PACKAGE/GameEvents;->onItemsChanged()V")
		GameSceneGameOverFingerprint.callBeforeEveryReturn("invoke-static { }, $EXTENSION_PACKAGE/GameEvents;->onGameOver()V")

		GameSceneCreateFingerprint.callWithThisBeforeReturns("$EXTENSION_PACKAGE/GameEvents;->onSceneCreated(Ljava/lang/Object;)V")
		CellSelectorClickFingerprint.skipWhen("invoke-static { p0, p1 }, $EXTENSION_PACKAGE/ToolbarTaps;->ignoreTap(Ljava/lang/Object;Ljava/lang/Object;)Z")
		hookInfoWindows()
		WndJournalItemConstructorFingerprint.method.addInstruction(0, "invoke-static/range { p2 .. p2 }, $BESTIARY_CLASS->beforeJournalItem(Ljava/lang/String;)V")
		WndJournalItemConstructorFingerprint.callWithThisBeforeReturns("$BESTIARY_CLASS->afterJournalItem($ITEM_TYPE)V")
		WndHeroStatsTabInitializeFingerprint.callWithThisBeforeReturns("$EXTENSION_PACKAGE/HeroStats;->afterStatsTab($ITEM_TYPE)V")
		WndHeroConstructorFingerprint.callWithThisBeforeReturns("$EXTENSION_PACKAGE/HeroStats;->layoutHeroWindow($ITEM_TYPE)V")
		MobDestroyFingerprint.method.addInstruction(0, "invoke-static { p0 }, $REWARDS_CLASS->beforeDestroy($ITEM_TYPE)V")
		MobDestroyFingerprint.callBeforeEveryReturn("invoke-static { }, $REWARDS_CLASS->afterDestroy()V")
		HeroEarnExpFingerprint.method.addInstructions(
			0,
			"""
				invoke-static { p1, p2 }, $REWARDS_CLASS->adjustExp(ILjava/lang/Class;)I
				move-result p1
			""",
		)
		MobRollToDropLootFingerprint.method.addInstruction(0, "invoke-static { p0 }, $REWARDS_CLASS->beforeLootRoll($ITEM_TYPE)V")
		MobRollToDropLootFingerprint.callBeforeEveryReturn("invoke-static { }, $REWARDS_CLASS->afterLootRoll()V")
		MobLootChanceFingerprint.adjustReturns("$REWARDS_CLASS->adjustLootChance(F$ITEM_TYPE)F", "p0")
		ExamineCellFingerprint.skipWhen("invoke-static { p0 }, $TILE_CONTENTS_CLASS->examine(Ljava/lang/Integer;)Z")
		TrinketWindowConstructorFingerprint.method.addInstruction(0, "invoke-static { p1 }, $EXTENSION_PACKAGE/RerollCatalyst;->beforeTrinketWindow($ITEM_TYPE)V")
		TrinketWindowConstructorFingerprint.callWithThisBeforeReturns("$EXTENSION_PACKAGE/RerollCatalyst;->afterTrinketWindow($ITEM_TYPE)V")
		WndInfoCellConstructorFingerprint.method.addInstruction(0, "invoke-static/range { p1 .. p1 }, $EXTENSION_PACKAGE/EffectTurns;->beforeCellInfo(I)V")
		WndInfoCellConstructorFingerprint.adjustCallResults(
			"Lcom/shatteredpixel/shatteredpixeldungeon/actors/blobs/Blob;->tileDesc()Ljava/lang/String;",
			"$EXTENSION_PACKAGE/EffectTurns;->describe(Ljava/lang/String;)Ljava/lang/String;",
		)
		AndroidSafeInsetsFingerprint.adjustObjectReturns("$EXTENSION_PACKAGE/DisplayMargins;->adjustInsets(Lcom/watabou/utils/RectF;)Lcom/watabou/utils/RectF;")
		PixelSceneDrawFingerprint.callWithThisBeforeReturns("$EXTENSION_PACKAGE/DisplayMargins;->afterDraw(Ljava/lang/Object;)V")
		PlantTriggerFingerprint.skipWhen("invoke-static/range { p0 .. p0 }, $GARDEN_CLASS->keepsPlant($ITEM_TYPE)Z")
		FireEvolveFingerprint.adjustFieldReads("Lcom/shatteredpixel/shatteredpixeldungeon/levels/Level;->flamable:[Z", "$GARDEN_CLASS->flammable([Z)[Z")
		FireBurnFingerprint.replaceCalls("Lcom/shatteredpixel/shatteredpixeldungeon/plants/Plant;->wither()V", "$GARDEN_CLASS->burnPlant(Lcom/shatteredpixel/shatteredpixeldungeon/plants/Plant;)V")
		MobGetCloserFingerprint.skipWhen("invoke-static/range { p0 .. p1 }, $GARDEN_CLASS->staysOut(${ITEM_TYPE}I)Z", result = false)
		RegularLevelRespawnCellFingerprint.adjustReturns("$GARDEN_CLASS->respawnCell(I)I")
		replaceCallsInClass(
			"Lcom/shatteredpixel/shatteredpixeldungeon/actors/mobs/Golem;",
			"Lcom/shatteredpixel/shatteredpixeldungeon/items/scrolls/ScrollOfTeleportation;->appear(Lcom/shatteredpixel/shatteredpixeldungeon/actors/Char;I)V",
			"$GARDEN_CLASS->golemAppears(Lcom/shatteredpixel/shatteredpixeldungeon/actors/Char;I)V",
		)
		CustomSeedChosenFingerprint.adjustCallResults(
			"Lcom/shatteredpixel/shatteredpixeldungeon/GamesInProgress;->checkAll()Ljava/util/ArrayList;",
			"$EXTENSION_PACKAGE/GameSlots;->seedCheckGames(Ljava/util/ArrayList;)Ljava/util/ArrayList;",
		)
		DungeonSaveAllFingerprint.callBeforeEveryReturn("invoke-static { }, $EXTENSION_PACKAGE/GameSlots;->afterSaveAll()V")
		DungeonDeleteGameFingerprint.method.addInstruction(0, "invoke-static { p0 }, $EXTENSION_PACKAGE/GameSlots;->onDeleteGame(I)V")
		ReforgeClickFingerprint.method.addInstruction(0, "invoke-static/range { p0 .. p0 }, $EXTENSION_PACKAGE/HeroArmorReforge;->beforeReforge($ITEM_TYPE)V")
		ReforgeItemSelectedFingerprint.replaceCalls("Ljava/lang/Object;->getClass()Ljava/lang/Class;", "$EXTENSION_PACKAGE/HeroArmorReforge;->kind(Ljava/lang/Object;)Ljava/lang/Class;")
		SaveSlotButtonClickFingerprint.skipWhen("invoke-static/range { p0 .. p0 }, $EXTENSION_PACKAGE/GameSlots;->open($ITEM_TYPE)Z")
		MageroyalActivateFingerprint.method.addInstruction(0, "invoke-static/range { p1 .. p1 }, $EXTENSION_PACKAGE/MageroyalCure;->beforeActivate(Ljava/lang/Object;)V")
		ItemEnergyValFingerprint.adjustReturns("$EXTENSION_PACKAGE/EnergizeMore;->energyVal(I$ITEM_TYPE)I", "p0")
		WndBagConstructorFingerprint.callBeforeReturn("invoke-static/range { p0 .. p0 }, $EXTENSION_PACKAGE/QuickslotEmpty;->afterBagCreated($ITEM_TYPE)V")
		if (RenameWindowConstructorFingerprint.methodOrNull != null) {
			RenameWindowConstructorFingerprint.callWithThisBeforeReturns("$EXTENSION_PACKAGE/RenameClose;->afterRenameWindow($ITEM_TYPE)V")
		}
		HeapDropFingerprint.method.addInstruction(0, "invoke-static { p0, p1 }, $ABSORBED_CLASS->onDrop($ITEM_TYPE$ITEM_TYPE)V")
		ItemStoreInBundleFingerprint.method.addInstruction(0, "invoke-static { p0, p1 }, $ABSORBED_CLASS->store($ITEM_TYPE$ITEM_TYPE)V")
		ItemRestoreFromBundleFingerprint.method.addInstruction(0, "invoke-static { p0, p1 }, $ABSORBED_CLASS->restore($ITEM_TYPE$ITEM_TYPE)V")
		GameSceneLayoutTagsFingerprint.callBeforeEveryReturn("invoke-static { }, $EXTENSION_PACKAGE/GameEvents;->afterLayoutTags()V")
		GameSceneBossSlainFingerprint.method.addInstruction(0, "invoke-static { }, $CHEST_CLASS->onBossSlain()V")
		replaceCallsInClass(
			"Lcom/shatteredpixel/shatteredpixeldungeon/items/Torch;",
			"Lcom/shatteredpixel/shatteredpixeldungeon/actors/buffs/Buff;->affect(${CHAR_DESCRIPTOR}Ljava/lang/Class;F)$FLAVOUR_BUFF_DESCRIPTOR",
			"$TORCHES_CLASS->light(${CHAR_DESCRIPTOR}Ljava/lang/Class;F)$FLAVOUR_BUFF_DESCRIPTOR",
		)
		LightIconFadePercentFingerprint.adjustReturns("$TORCHES_CLASS->fade(F$ITEM_TYPE)F", "p0")
		FlavourBuffDescFingerprint.adjustObjectReturns("$TORCHES_CLASS->describe(Ljava/lang/String;$ITEM_TYPE)Ljava/lang/String;", "p0")
		CharStealthFingerprint.adjustReturns("$TORCHES_CLASS->adjustStealth(F$ITEM_TYPE)F", "p0")
		HeroSearchFingerprint.adjustCallResults("Lcom/watabou/utils/Random;->Float()F", "$TORCHES_CLASS->adjustSearchRoll(F)F")
		HeroStoreInBundleFingerprint.method.addInstruction(
			0,
			"invoke-static/range { p0 .. p1 }, $CHEST_CLASS->onStore(Ljava/lang/Object;Lcom/watabou/utils/Bundle;)V",
		)
		HeroRestoreFromBundleFingerprint.method.addInstruction(
			0,
			"invoke-static/range { p0 .. p1 }, $CHEST_CLASS->onRestore(Ljava/lang/Object;Lcom/watabou/utils/Bundle;)V",
		)

		MobGetCloserFingerprint.skipWhen("invoke-static { p0, p1 }, $SHOPKEEPER_CLASS->blockStep(Ljava/lang/Object;I)Z", result = false)
		HeroGetCloserFingerprint.method.addInstructionsWithLabels(
			0,
			"""
				invoke-static { p0, p1 }, $EXTENSION_PACKAGE/AllyPathing;->beforeGetCloser(Ljava/lang/Object;I)I
				move-result v0
				if-ltz v0, :original
				return v0
			""",
			ExternalLabel("original", 0),
		)
	}
}
