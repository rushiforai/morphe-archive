package app.template.patches.shatteredpixeldungeon

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.COMPATIBILITY_SHATTERED_PIXEL_DUNGEON

private const val BACKPACK_CLASS = "$EXTENSION_PACKAGE/BackpackEditor;"
private const val INFINITE_CHARGES_CLASS = "$EXTENSION_PACKAGE/InfiniteCharges;"
private const val POUCHES_CLASS = "$EXTENSION_PACKAGE/TabPouches;"

@Suppress("unused")
val inventoryEditorPatch = bytecodePatch(
	name = "Inventory editor",
	description = "Edit gold, energy and every item, add any item, and identify or uncurse everything. Adds unlimited inventory space and Equipment and Rings backpack tabs.",
	default = true,
) {
	compatibleWith(COMPATIBILITY_SHATTERED_PIXEL_DUNGEON)

	dependsOn(cloverlordMenuPatch, bagLayoutPatch)

	execute {
		InventoryEditorAvailableFingerprint.returnTrue()

		ItemActionsFingerprint.adjustObjectReturns("$BACKPACK_CLASS->addEditAction(Ljava/util/ArrayList;)Ljava/util/ArrayList;")

		ItemActionNameFingerprint.skipWhen("invoke-static { p1 }, $BACKPACK_CLASS->actionName(Ljava/lang/String;)Ljava/lang/String;", register = "p2")

		ItemExecuteFingerprint.skipWhen("invoke-static { p0, p2 }, $BACKPACK_CLASS->execute(Ljava/lang/Object;Ljava/lang/String;)Z")

		ShopRoomGenerateItemsFingerprint.adjustObjectReturns("$POUCHES_CLASS->addToShop(Ljava/util/ArrayList;)Ljava/util/ArrayList;")
		ShopkeeperSellPriceFingerprint.method.addInstruction(0, "invoke-static { p0 }, $POUCHES_CLASS->beforePrice(Ljava/lang/Object;)V")
		ShopkeeperSellPriceFingerprint.adjustReturns("$POUCHES_CLASS->adjustPrice(I)I")
		LevelStoreFingerprint.method.addInstruction(0, "invoke-static { p0, p1 }, $POUCHES_CLASS->beforeStore(Ljava/lang/Object;Ljava/lang/Object;)V")
		LevelStoreFingerprint.callBeforeEveryReturn("invoke-static { p0 }, $POUCHES_CLASS->afterStore(Ljava/lang/Object;)V")
		LevelRestoreFingerprint.method.addInstruction(0, "invoke-static { p1 }, $POUCHES_CLASS->beforeRestore(Ljava/lang/Object;)V")
		LevelRestoreFingerprint.callBeforeEveryReturn("invoke-static { p0 }, $POUCHES_CLASS->afterRestore(Ljava/lang/Object;)V")
		GameSceneCreateFingerprint.callWithThisBeforeReturns("$POUCHES_CLASS->onSceneCreated(Ljava/lang/Object;)V")
		ItemSpriteViewHeapFingerprint.method.addInstruction(0, "invoke-static/range { p1 .. p1 }, $POUCHES_CLASS->onHeapViewed(Ljava/lang/Object;)V")

		WndBagConstructorFingerprint.method.addInstruction(0, "invoke-static { }, $BACKPACK_CLASS->beforeBagCreated()V")
		WndBagTabClickFingerprint.method.addInstruction(0, "invoke-static { p0 }, $BACKPACK_CLASS->beforeTabSwitch(Lcom/shatteredpixel/shatteredpixeldungeon/ui/Window;)V")
		WndBagConstructorFingerprint.callBeforeReturn(
			"invoke-static/range { p0 .. p0 }, $BACKPACK_CLASS->afterBagCreated(Lcom/shatteredpixel/shatteredpixeldungeon/ui/Window;)V",
		)
		WndUseItemConstructorFingerprint.callBeforeEveryReturn(
			"invoke-static/range { p0 .. p2 }, $BACKPACK_CLASS->afterUseItemCreated(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V",
		)

		ItemStoreInBundleFingerprint.method.addInstruction(
			0,
			"invoke-static { p0, p1 }, $EXTENSION_PACKAGE/ItemData;->onStore(Ljava/lang/Object;Lcom/watabou/utils/Bundle;)V",
		)
		ItemRestoreFromBundleFingerprint.method.addInstruction(
			0,
			"invoke-static { p0, p1 }, $EXTENSION_PACKAGE/ItemData;->onRestore(Ljava/lang/Object;Lcom/watabou/utils/Bundle;)V",
		)
		hookEquipTime()
		HeroActFingerprint.method.addInstruction(
			0,
			"invoke-static/range { p0 .. p0 }, $INFINITE_CHARGES_CLASS->onHeroAct(Ljava/lang/Object;)V",
		)
	}
}
