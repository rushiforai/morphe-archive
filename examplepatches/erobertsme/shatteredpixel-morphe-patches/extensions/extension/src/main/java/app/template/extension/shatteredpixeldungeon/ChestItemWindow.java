package app.template.extension.shatteredpixeldungeon;

import com.shatteredpixel.shatteredpixeldungeon.items.Item;

/**
 * An item's details from the Quantum Chest, with a button to take it out or store it.
 */
public class ChestItemWindow extends EditorWindow {


	private final Item item;
	private final String actionLabel;
	private final Runnable action;
	private final Runnable back;

	public ChestItemWindow(Item item, String actionLabel, Runnable action, Runnable back) {
		super();
		this.item = item;
		this.actionLabel = actionLabel;
		this.action = action;
		this.back = back;

		addItemDetails(item);

		float half = (WIDTH - GAP) / 2f;
		backTo(back);
		addBackButton(0, half);
		addButton(actionLabel, half + GAP, half, () -> {
			hide();
			action.run();
			back.run();
		});
		pos += ROW_HEIGHT;
		finish();
	}

	@Override
	protected void reopen() {
		show(new ChestItemWindow(item, actionLabel, action, back));
	}
}
