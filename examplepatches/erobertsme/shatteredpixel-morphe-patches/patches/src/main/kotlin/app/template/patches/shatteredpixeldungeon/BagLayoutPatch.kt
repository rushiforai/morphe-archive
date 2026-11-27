package app.template.patches.shatteredpixeldungeon

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val INVENTORY_SPACE_CLASS = "$EXTENSION_PACKAGE/InventorySpace;"
private const val WND_BAG_CLASS = "Lcom/shatteredpixel/shatteredpixeldungeon/windows/WndBag;"

/**
 * The backpack window and bag capacity hooks shared by the Inventory editor and QoL enhancements patches:
 * unlimited inventory space, rows and pages, the Equipment and Rings tabs and one bag of each kind.
 */
internal val bagLayoutPatch = bytecodePatch(
	description = "Lays out the backpack and bags with extra rows, pages and tabs.",
) {
	extendWith("extensions/extension.mpe")

	execute {
		WndBagConstructorFingerprint.callBeforeReturn(
			"invoke-static/range { p0 .. p0 }, $INVENTORY_SPACE_CLASS->afterBagCreated(Lcom/shatteredpixel/shatteredpixeldungeon/ui/Window;)V",
		)

		WndBagLastBagFingerprint.skipWhen(
			"invoke-static/range { p0 .. p0 }, $INVENTORY_SPACE_CLASS->reopenTab(${WND_BAG_CLASS.dropLast(1)}\$ItemSelector;)$WND_BAG_CLASS",
		)

		BAG_CAPACITY_CLASSES.forEach { className ->
			BagCapacityFingerprint(className).adjustReturns(
				"$INVENTORY_SPACE_CLASS->capacity(I$BAG_CLASS)I",
				"p0",
			)
		}
		BackpackCapacityFingerprint.adjustReturns(
			"$INVENTORY_SPACE_CLASS->backpackCapacity(I$BAG_CLASS)I",
			"p0",
		)

		WndBagConstructorFingerprint.method.apply {
			val instructions = implementation!!.instructions.toList()
			val index = instructions.indexOfFirst {
				it.opcode == Opcode.IPUT && ((it as ReferenceInstruction).reference as FieldReference).name == "nRows"
			}
			if (index < 0) throw PatchException("WndBag does not set nRows")
			val rows = (instructions[index] as TwoRegisterInstruction).registerA
			if (rows > 15) throw PatchException("WndBag keeps nRows in v$rows, which is out of range")
			val scratch = if (rows == 0) 1 else 0
			addInstructions(
				index + 1,
				"""
					iget v$scratch, p0, $WND_BAG_CLASS->nCols:I
					invoke-static { p0, p1, v$scratch, v$rows }, $INVENTORY_SPACE_CLASS->rows(Ljava/lang/Object;${BAG_CLASS}II)I
					move-result v$rows
					iput v$rows, p0, $WND_BAG_CLASS->nRows:I
				""",
			)
		}

		WndBagConstructorFingerprint.method.apply {
			val instructions = implementation!!.instructions.toList()
			val index = instructions.indexOfFirst {
				it.opcode == Opcode.INVOKE_VIRTUAL && ((it as ReferenceInstruction).reference as MethodReference).name == "getBags"
			}
			if (index < 0 || instructions[index + 1].opcode != Opcode.MOVE_RESULT_OBJECT) throw PatchException("WndBag does not list the bags")
			val bags = (instructions[index + 1] as OneRegisterInstruction).registerA
			addInstructions(
				index + 2,
				"""
					invoke-static/range { v$bags .. v$bags }, $INVENTORY_SPACE_CLASS->bagTabs(Ljava/util/ArrayList;)Ljava/util/ArrayList;
					move-result-object v$bags
				""",
			)
		}

		WndBagPlaceItemFingerprint.skipWhen("invoke-static { p1 }, $INVENTORY_SPACE_CLASS->skipSlot(Lcom/shatteredpixel/shatteredpixeldungeon/items/Item;)Z")

		BagCanHoldFingerprint.skipWhen("invoke-static { p0, p1 }, $INVENTORY_SPACE_CLASS->tabHolds(${BAG_CLASS}Lcom/shatteredpixel/shatteredpixeldungeon/items/Item;)Z")

		BagCollectFingerprint.skipWhen("invoke-static { p0, p1 }, $INVENTORY_SPACE_CLASS->refuseBag(${BAG_CLASS}$BAG_CLASS)Z", result = false)

		WndBagIconFingerprint.skipWhen("invoke-static { p1 }, $INVENTORY_SPACE_CLASS->tabIcon($BAG_CLASS)Lcom/watabou/noosa/Image;")
	}
}
