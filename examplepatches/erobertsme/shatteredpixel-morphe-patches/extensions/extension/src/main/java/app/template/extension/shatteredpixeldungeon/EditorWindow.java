package app.template.extension.shatteredpixeldungeon;

import com.shatteredpixel.shatteredpixeldungeon.scenes.PixelScene;
import com.shatteredpixel.shatteredpixeldungeon.ui.BuffIcon;
import com.shatteredpixel.shatteredpixeldungeon.ui.CheckBox;
import com.shatteredpixel.shatteredpixeldungeon.ui.IconButton;
import com.shatteredpixel.shatteredpixeldungeon.ui.Icons;
import com.shatteredpixel.shatteredpixeldungeon.ui.RedButton;
import com.shatteredpixel.shatteredpixeldungeon.ui.RenderedTextBlock;
import com.shatteredpixel.shatteredpixeldungeon.ui.Window;
import com.watabou.noosa.Game;
import com.watabou.noosa.Image;

/**
 * Shared layout helpers for the editor windows. Every edit rebuilds the window through [reopen].
 */
abstract class EditorWindow extends Window {

	static final int WIDTH = 128;
	static final int ROW_HEIGHT = 16;
	static final int GAP = 3;
	static final int INFO_SIZE = 16;
	static final int TITLE_COLOR = 0xFFFF44;
	static final int DIM_COLOR = 0x999999;
	static final int POSITIVE_COLOR = 0x7AD35C;
	static final int NEGATIVE_COLOR = 0xE06A5A;
	static final int STEP_WIDTH = 15;
	private static final int FAVORITE_SIZE = 14;
	private static final int RESET_SIZE = 14;
	private static final int ROW_PADDING = 3;
	private static final int HEART_ICON = 21;
	private static final int VALUE_WIDTH = 34;
	private static final int ITEM_ICON_SPACE = 20;

	protected float pos;

	protected abstract void reopen();

	protected void addTitle(String text) {
		addTitle(text, null);
	}

	/**
	 * The window title. When [info] is given, an [i] button in the top right corner shows it.
	 */
	protected void addTitle(String text, String info) {
		addTitle(text, info, info == null ? 0 : InfoButton.SIZE + GAP);
	}

	/**
	 * Like the other, keeping [reserved] pixels free at the right of the title for something else in the top right corner.
	 */
	protected void addTitle(String text, String info, float reserved) {
		RenderedTextBlock title = PixelScene.renderTextBlock(text, 9);
		title.hardlight(TITLE_COLOR);
		title.maxWidth((int) (WIDTH - reserved));
		title.setPos(0, pos + (InfoButton.SIZE - title.height()) / 2f);
		add(title);
		if (info != null) InfoButton.add(this, WIDTH, pos, info);
		pos = Math.max(title.bottom(), pos + (info == null ? 0 : InfoButton.SIZE)) + 2 * GAP;
	}

	protected void addSection(String text) {
		RenderedTextBlock block = PixelScene.renderTextBlock(text, 7);
		block.hardlight(TITLE_COLOR);
		block.setPos(0, pos + 2 * GAP);
		add(block);
		pos = block.bottom() + 2 * GAP;
	}

	/**
	 * Builds content with [build] only to measure its height, then removes it again.
	 */
	@SuppressWarnings("unchecked")
	protected float measure(Runnable build) {
		float start = pos;
		java.util.List<com.watabou.noosa.Gizmo> members;
		try {
			members = Reflect.members(this);
		} catch (ReflectiveOperationException e) {
			return 0;
		}
		int before = members.size();
		build.run();
		float height = pos - start;
		for (com.watabou.noosa.Gizmo gizmo : new java.util.ArrayList<>(members.subList(before, members.size()))) {
			remove(gizmo);
			gizmo.destroy();
		}
		pos = start;
		return height;
	}

	protected void addHint(String text) {
		RenderedTextBlock block = PixelScene.renderTextBlock(text, 6);
		block.maxWidth(WIDTH);
		block.hardlight(DIM_COLOR);
		block.setPos(0, pos);
		add(block);
		pos = block.bottom() + 2 * GAP;
	}

	private static final int ICON_SPACE = 10;

	/**
	 * A row with a small [icon], a label on the left and a value on the right.
	 */
	protected void addIconRow(Image icon, String label, String value) {
		if (icon != null) {
			icon.x = (ICON_SPACE - icon.width()) / 2f;
			icon.y = pos + (7 - icon.height()) / 2f;
			PixelScene.align(icon);
			add(icon);
		}
		RenderedTextBlock left = PixelScene.renderTextBlock(label, 6);
		left.setPos(ICON_SPACE, pos);
		add(left);
		RenderedTextBlock right = PixelScene.renderTextBlock(value, 6);
		right.maxWidth((int) (WIDTH - ICON_SPACE - left.width() - 2 * GAP));
		right.setPos(WIDTH - right.width(), pos);
		add(right);
		pos = Math.max(left.bottom(), right.bottom()) + GAP;
	}

	/**
	 * Controls for where a group of toolbar tags sits: the screen edge, and how far along it.
	 */
	protected void addPlacementSettings(TagPlacement placement) {
		TagPlacement.Side current = placement.side();
		TagPlacement.Side[] sides = placement.sides();
		boolean auto = placement.supportsAuto();
		int shift = auto ? 1 : 0;
		String[] labels = new String[sides.length + shift];
		if (auto) labels[0] = "Auto";
		for (int i = 0; i < sides.length; i++) labels[i + shift] = sides[i].label;
		int selected = placement.isAuto() ? 0 : Math.max(0, java.util.Arrays.asList(sides).indexOf(current)) + shift;
		addButtonRow(labels, selected, index -> {
			if (auto && index == 0) {
				placement.setAuto();
			} else {
				placement.side(sides[index - shift]);
			}
			refresh();
		});
		if (placement.isAuto()) {
			addHint(placement.styled() ? "Auto: next to the game's own tags, just above the toolbar." : "Auto: where the game puts it, stacked with its other tags above the toolbar.");
			return;
		}
		int offset = placement.offset();
		String from = current == TagPlacement.Side.TOP ? "past the health bar" : current == TagPlacement.Side.LEFT ? "below the turn timer" : "below the enemy counter";
		stepperLabelAbove();
		addStepper("Distance " + from + " (" + placement.minOffset() + " to " + placement.maxOffset() + ")", offset + " px", offset, 1, placement.minOffset(), placement.maxOffset(), placement::offset, true, placement::resetOffset);
	}

	private float nextRowHeight;

	/**
	 * Makes the next list row [height] tall instead of a normal row.
	 */
	protected void listRowHeight(float height) {
		nextRowHeight = height;
	}

	private Image nextStepperIcon;
	private int nextStepperHold;
	private int nextStepperDecimals;

	/**
	 * Makes the next stepper hold a number with [decimals] decimal places, scaled up to whole numbers in its values, so typing one in
	 * takes decimals.
	 */
	protected void stepperDecimals(int decimals) {
		nextStepperDecimals = decimals;
	}
	private boolean labelAbove;

	/**
	 * Shows the label of the next stepper as a heading above it instead of beside it.
	 */
	protected void stepperLabelAbove() {
		labelAbove = true;
	}

	/**
	 * Shows [icon] to the left of the label of the next stepper.
	 */
	protected void stepperIcon(Image icon) {
		nextStepperIcon = icon;
	}

	/**
	 * Makes holding - or + on the next stepper change it by [step], instead of ten steps.
	 */
	protected void stepperHold(int step) {
		nextStepperHold = step;
	}

	protected void addStepper(String label, String display, int current, int step, int min, int max, IntAction setter) {
		addStepper(label, display, current, step, min, max, setter, true);
	}

	protected void addStepper(String label, String display, int current, int step, int min, int max, IntAction setter, boolean enabled) {
		addStepper(label, display, current, step, min, max, setter, enabled, null);
	}

	/**
	 * A stepper row. When [onReset] is given, a small reset button at the end of the row restores that one value.
	 */
	protected void addStepper(String label, String display, int current, int step, int min, int max, IntAction setter, boolean enabled, Runnable onReset) {
		int decimals = nextStepperDecimals;
		nextStepperDecimals = 0;
		int hold = nextStepperHold > 0 ? nextStepperHold : step * 10;
		nextStepperHold = 0;
		float textLeft = 0;
		Image icon = nextStepperIcon;
		nextStepperIcon = null;
		if (icon != null) {
			icon.x = Math.max(0, (ICON_SPACE - icon.width()) / 2f);
			icon.y = pos + (ROW_HEIGHT - icon.height()) / 2f;
			PixelScene.align(icon);
			add(icon);
			textLeft = Math.max(ICON_SPACE, icon.x + icon.width() + GAP);
		}
		if (labelAbove) {
			labelAbove = false;
			addSection(label);
		} else {
			RenderedTextBlock text = PixelScene.renderTextBlock(label, 7);
			text.setPos(textLeft, pos + (ROW_HEIGHT - text.height()) / 2f);
			if (!enabled) text.alpha(0.3f);
			add(text);
		}

		float right = WIDTH;
		if (onReset != null) {
			IconButton reset = new IconButton(Icons.get(Icons.CHANGES)) {
				@Override
				public void onClick() {
					onReset.run();
					refresh();
				}
			};
			reset.setRect(WIDTH - RESET_SIZE, pos, RESET_SIZE, ROW_HEIGHT);
			reset.enable(enabled);
			add(reset);
			right = WIDTH - RESET_SIZE - GAP;
		}

		float x = right - 2 * STEP_WIDTH - VALUE_WIDTH - 2 * GAP;
		addStepButton("-", x, current, -step, -hold, setter).enable(enabled);

		RedButton value = new RedButton(display, 6) {
			@Override
			public void onClick() {
				NumberPrompt.show(label, current, min, max, decimals, setter, () -> {
					EditorWindow.this.hide();
					reopen();
				});
			}
		};
		value.setRect(x + STEP_WIDTH + GAP, pos, VALUE_WIDTH, ROW_HEIGHT);
		value.enable(enabled);
		add(value);

		addStepButton("+", value.right() + GAP, current, step, hold, setter).enable(enabled);
		pos += ROW_HEIGHT + GAP;
	}

	private RedButton addStepButton(String label, float x, int current, int delta, int holdDelta, IntAction setter) {
		RedButton button = new RedButton(label) {
			@Override
			public void onClick() {
				setter.run(current + delta);
				refresh();
			}

			@Override
			public boolean onLongClick() {
				setter.run(current + holdDelta);
				refresh();
				return true;
			}
		};
		button.setRect(x, pos, STEP_WIDTH, ROW_HEIGHT);
		add(button);
		return button;
	}

	protected void addCheckBox(String label, boolean checked, Runnable onToggle) {
		addCheckBox(label, checked, onToggle, true);
	}

	protected void addCheckBox(String label, boolean checked, Runnable onToggle, boolean enabled) {
		addCheckBox(label, checked, onToggle, enabled, 0);
	}

	protected void addCheckBox(String label, boolean checked, Runnable onToggle, boolean enabled, int textSize) {
		addCheckBox(label, checked, onToggle, enabled, textSize, true);
	}

	interface Toggle {
		void set(boolean on);
	}

	/**
	 * A check box that applies [setter] straight away without building the window again, for a setting nothing else in the window
	 * depends on, so a scrolled window stays where it is.
	 */
	protected void addSwitch(String label, boolean on, Toggle setter) {
		boolean[] state = { on };
		addCheckBox(label, on, () -> {
			state[0] = !state[0];
			setter.set(state[0]);
		}, true, 0, false);
	}

	private void addCheckBox(String label, boolean checked, Runnable onToggle, boolean enabled, int textSize, boolean rebuild) {
		CheckBox box = new ToggleBox(label) {
			@Override
			public void onClick() {
				super.onClick();
				onToggle.run();
				if (rebuild) refresh();
			}

			@Override
			public void layout() {
				super.layout();
				if (textSize <= 0 || text == null) return;
				String value = text.text();
				remove(text);
				text = PixelScene.renderTextBlock(value, textSize);
				float margin = (height() - text.height()) / 2f;
				text.setPos(left() + margin, top() + margin);
				PixelScene.align(text);
				add(text);
			}
		};
		box.checked(checked);
		box.enable(enabled);
		float boxWidth = WIDTH;
		if (nextSideButton != null) {
			boxWidth = WIDTH - ROW_HEIGHT - GAP;
			nextSideButton.setRect(boxWidth + GAP, pos, ROW_HEIGHT, ROW_HEIGHT);
			add(nextSideButton);
			nextSideButton = null;
		}
		box.setRect(0, pos, boxWidth, ROW_HEIGHT);
		add(box);
		pos += ROW_HEIGHT + GAP;
	}

	private com.watabou.noosa.ui.Component nextSideButton;

	/**
	 * Puts [button], a square the height of a row, to the right of the next check box.
	 */
	protected void checkBoxSideButton(com.watabou.noosa.ui.Component button) {
		nextSideButton = button;
	}

	protected RedButton addButton(String label, float x, float width, Runnable action) {
		RedButton button = new RedButton(TitleCase.of(label), 6) {
			@Override
			public void onClick() {
				action.run();
			}
		};
		button.setRect(x, pos, width, ROW_HEIGHT);
		add(button);
		return button;
	}

	/**
	 * A button across the whole window, with [icon] when one is given.
	 */
	protected RedButton addRowButton(String label, Image icon, Runnable action) {
		RedButton button = addButton(label, 0, WIDTH, action);
		if (icon != null) button.icon(icon);
		pos += ROW_HEIGHT + GAP;
		return button;
	}

	protected void addButtonRow(String[] labels, int selected, IntAction onSelect) {
		addButtonRow(labels, selected, labels.length, onSelect);
	}

	/**
	 * A row of buttons, [perRow] to a line, with the [selected] one highlighted. Empty labels leave a gap.
	 */
	protected void addButtonRow(String[] labels, int selected, int perRow, IntAction onSelect) {
		float width = (WIDTH - (perRow - 1) * GAP) / (float) perRow;
		for (int i = 0; i < labels.length; i++) {
			int column = i % perRow;
			if (i > 0 && column == 0) pos += ROW_HEIGHT + GAP;
			if (labels[i].isEmpty()) continue;
			final int index = i;
			RedButton button = addButton(labels[i], column * (width + GAP), width, () -> onSelect.run(index));
			if (i == selected) button.textColor(TITLE_COLOR);
		}
		pos += ROW_HEIGHT + GAP;
	}

	/**
	 * Adds [item]'s icon and name as the window's title, then its description.
	 */
	protected void addItemDetails(com.shatteredpixel.shatteredpixeldungeon.items.Item item) {
		com.shatteredpixel.shatteredpixeldungeon.sprites.ItemSprite icon = new com.shatteredpixel.shatteredpixeldungeon.sprites.ItemSprite(item);
		icon.x = (ITEM_ICON_SPACE - icon.width()) / 2f;
		icon.y = pos;
		add(icon);
		RenderedTextBlock title = PixelScene.renderTextBlock(InventoryEditor.capitalize(item.title()), 9);
		title.hardlight(TITLE_COLOR);
		title.maxWidth(WIDTH - ITEM_ICON_SPACE);
		title.setPos(ITEM_ICON_SPACE, pos + (icon.height() - title.height()) / 2f);
		add(title);
		pos = Math.max(icon.y + icon.height(), title.bottom()) + 2 * GAP;
		String info;
		try {
			info = item.info();
		} catch (Throwable e) {
			info = "";
		}
		RenderedTextBlock text = PixelScene.renderTextBlock(info, 6);
		text.maxWidth(WIDTH);
		text.setPos(0, pos);
		add(text);
		pos = text.bottom() + 2 * GAP;
	}

	/**
	 * Adds a row of [tabs] with [tab] chosen, then that tab's contents from [content]. The contents take as much room as the tallest tab, so
	 * what comes after them stays put when another tab is chosen. Choosing a tab runs [onSelect].
	 */
	protected void addTabs(String[] tabs, int tab, IntAction onSelect, IntAction content) {
		addButtonRow(tabs, tab, onSelect);
		pos += GAP;
		float start = pos;
		float height = 0;
		for (int i = 0; i < tabs.length; i++) {
			if (i == tab || tabs[i].isEmpty()) continue;
			int index = i;
			height = Math.max(height, measure(() -> content.run(index)));
		}
		content.run(tab);
		pos = Math.max(pos, start + height);
	}

	interface Favorite {
		boolean isFavorite();

		void toggle();
	}

	protected void addListRow(String label, Image icon, boolean highlighted, boolean enabled, Runnable onClick, Runnable onInfo) {
		addListRow(label, icon, highlighted, enabled, onClick, onInfo, null);
	}

	protected void addListRow(String label, Image icon, boolean highlighted, boolean enabled, Runnable onClick, Runnable onInfo, Favorite favorite) {
		float x = 0;
		if (favorite != null) {
			boolean favorited = favorite.isFavorite();
			BuffIcon heart = new BuffIcon(HEART_ICON, true);
			if (!favorited) heart.alpha(0.3f);
			IconButton heartButton = new IconButton(heart) {
				@Override
				public void onClick() {
					favorite.toggle();
					refresh();
				}
			};
			heartButton.setRect(0, pos, FAVORITE_SIZE, ROW_HEIGHT);
			add(heartButton);
			x = FAVORITE_SIZE + GAP;
		}

		float rowHeight = nextRowHeight > 0 ? nextRowHeight : ROW_HEIGHT;
		nextRowHeight = 0;
		float width = (onInfo == null ? WIDTH : WIDTH - INFO_SIZE - GAP) - x;
		RedButton button = new RedButton("") {
			@Override
			public void onClick() {
				onClick.run();
			}

			@Override
			public boolean onLongClick() {
				if (onInfo == null) return false;
				onInfo.run();
				return true;
			}
		};
		button.setRect(x, pos, width, rowHeight);
		button.enable(enabled);
		add(button);

		float textLeft = x + ROW_PADDING;
		if (icon != null) {
			icon.x = x + ROW_PADDING;
			icon.y = pos + (rowHeight - icon.height()) / 2f;
			if (!enabled) icon.alpha(0.3f);
			add(icon);
			textLeft = icon.x + icon.width() + ROW_PADDING;
		}

		RenderedTextBlock text = PixelScene.renderTextBlock(label, 6);
		text.maxWidth((int) (x + width - textLeft - ROW_PADDING));
		if (highlighted) text.hardlight(TITLE_COLOR);
		if (!enabled) text.alpha(0.3f);
		text.setPos(textLeft, pos + (rowHeight - text.height()) / 2f);
		add(text);

		if (onInfo != null) {
			IconButton info = new IconButton(Icons.get(Icons.INFO)) {
				@Override
				public void onClick() {
					onInfo.run();
				}
			};
			info.setRect(WIDTH - INFO_SIZE, pos, INFO_SIZE, rowHeight);
			add(info);
		}
		pos += rowHeight + GAP;
	}

	/**
	 * Shows one page of a list. The page always takes the height of a full page plus the page buttons,
	 * so the window keeps its size when a page has fewer rows.
	 */
	protected void addPagedList(int count, int perPage, int page, IntAction renderer, IntAction opener) {
		int pages = pageCount(count, perPage);
		int current = Math.min(page, pages - 1);
		int start = current * perPage;
		int end = Math.min(count, start + perPage);
		for (int i = start; i < end; i++) renderer.run(i);
		pos += (perPage - (end - start)) * (ROW_HEIGHT + GAP);
		addPager(current, pages, opener);
	}

	protected void addPager(int current, int pages, IntAction opener) {
		if (pages <= 1) {
			pos += ROW_HEIGHT + GAP;
			return;
		}
		addButton("", 0, 24, () -> opener.run((current + pages - 1) % pages)).icon(StatIcons.arrow(true));
		RenderedTextBlock label = PixelScene.renderTextBlock("Page " + (current + 1) + " / " + pages, 6);
		label.setPos((WIDTH - label.width()) / 2f, pos + (ROW_HEIGHT - label.height()) / 2f);
		add(label);
		addButton("", WIDTH - 24, 24, () -> opener.run((current + 1) % pages)).icon(StatIcons.arrow(false));
		pos += ROW_HEIGHT + GAP;
	}

	protected static int pageCount(int size, int perPage) {
		return Math.max(1, (size + perPage - 1) / perPage);
	}

	protected static int perPage(int portrait, int landscape) {
		return PixelScene.landscape() ? landscape : portrait;
	}

	protected void finish() {
		resize(WIDTH, (int) pos);
	}

	private Runnable backAction;

	/**
	 * Adds a Back button across the window and sizes it. Back, and the device's back button, close the window and run [back].
	 */
	protected void finishWithBack(Runnable back) {
		backTo(back);
		addBackButton(0, WIDTH);
		pos += ROW_HEIGHT;
		finish();
	}

	/**
	 * Sets where Back, and the device's back button, lead once the window closes.
	 */
	protected void backTo(Runnable back) {
		backAction = back;
	}

	/**
	 * A Back button at [x], [width] wide, on the current row. It leads where [backTo] says.
	 */
	protected RedButton addBackButton(float x, float width) {
		return addButton("Back", x, width, this::goBack);
	}

	/**
	 * Closes the window and goes where its Back button leads.
	 */
	protected void goBack() {
		hide();
		if (backAction != null) backAction.run();
	}

	@Override
	public void onBackPressed() {
		if (backAction == null) {
			super.onBackPressed();
			return;
		}
		goBack();
	}

	protected void refresh() {
		hide();
		reopen();
	}

	protected void replaceWith(Window window) {
		hide();
		Game.scene().addToFront(window);
	}

	protected static void show(Window window) {
		Game.scene().addToFront(window);
	}
}
