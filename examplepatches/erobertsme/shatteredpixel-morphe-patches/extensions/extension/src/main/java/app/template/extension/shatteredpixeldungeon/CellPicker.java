package app.template.extension.shatteredpixeldungeon;

import com.shatteredpixel.shatteredpixeldungeon.scenes.CellSelector;
import com.shatteredpixel.shatteredpixeldungeon.scenes.GameScene;

/**
 * Asks the player to tap a tile, with [prompt] shown the way the game shows its own prompts.
 */
final class CellPicker {

	private CellPicker() {
	}

	static CellSelector.Listener pick(String prompt, IntAction onPicked) {
		return pick(prompt, onPicked, null);
	}

	/**
	 * Runs [onPicked] with the tapped tile, or [onCancel], when given, if the player cancels. Returns the listener, to tell whether it is
	 * still the one waiting for a tap.
	 */
	static CellSelector.Listener pick(String prompt, IntAction onPicked, Runnable onCancel) {
		CellSelector.Listener listener = new CellSelector.Listener() {
			@Override
			public void onSelect(Integer cell) {
				if (cell != null) {
					onPicked.run(cell);
					return;
				}
				if (onCancel != null) onCancel.run();
			}

			@Override
			public String prompt() {
				return prompt;
			}
		};
		GameScene.selectCell(listener);
		return listener;
	}
}
