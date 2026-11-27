package app.template.extension.shatteredpixeldungeon;

import com.shatteredpixel.shatteredpixeldungeon.Dungeon;
import com.shatteredpixel.shatteredpixeldungeon.scenes.PixelScene;
import com.shatteredpixel.shatteredpixeldungeon.ui.RenderedTextBlock;
import com.watabou.noosa.ColorBlock;
import com.watabou.noosa.Game;
import com.watabou.noosa.Group;

public class HungerWindow extends EditorWindow {

	static final int NOT_HUNGRY_COLOR = 0xFF7AD35C;
	static final int HUNGRY_COLOR = 0xFFE8C547;
	static final int STARVING_COLOR = 0xFFE06A5A;
	private static final int BAR_HEIGHT = 12;
	private static final int MARKER_WIDTH = 2;
	private static final int MARKER_OVERHANG = 2;
	private static final int MARKER_COLOR = 0xFFFFFFFF;
	private static final int TURNS_COLOR = 0xFFFFFF;
	private static final String[] TABS = { "Stages", "Starving" };
	private static final String[] PRESET_LABELS = { "Default", "75%", "50%", "30%" };

	private static final String GENERAL_INFO = "## Defaults and resets\n_Main menu changes_ are the default for every game. _Changes in a game_ apply only to that game and are saved with it. _Use Main Menu Defaults_ goes back to the defaults.\n_Disable hunger:_ stops hunger rising. Turn it back on and hunger continues from where it was.\n{CHANGES}The small reset button on a row restores that setting. _Reset all_ restores everything.\nShadows, the Salt Cube and other hunger effects still apply on top.";
	private static final String STAGES_INFO = "Stages\n\n"
		+ "## Stage lengths\n_Not hungry:_ turns from eating until you get Hungry. Game default 300.\n_Hungry:_ turns from then until you start Starving. Game default 150.\n_75%, 50%, 30%:_ hunger rises at that share of the normal rate, so every stage lasts longer. _Default_ restores both.\nFood keeps its normal value, so longer stages also make meals last longer.\n\n"
		+ GENERAL_INFO;
	private static final String STARVING_INFO = "Starving\n\n"
		+ "## Damage timing\n_Formula:_ the turns between hits are the formula divided by your max health. The game uses 1000, so at 50 max health you're hit every 20 turns. Higher means more time between hits. Changes by 10.\n_Fixed:_ hit every set number of turns, whatever your max health. Its reset uses the game's default for your max health.\n_75%, 50%, 30%:_ set the formula so you're hit at that share of the normal rate. They switch Fixed back to Formula.\n\n"
		+ "## Damage\n_Damage:_ how much each hit takes.\n_Now:_ the result for your current max health.\n\n"
		+ GENERAL_INFO;

	private static final BackAction backAction = new BackAction();
	private static int tab;

	public static void open(Runnable back) {
		backAction.set(back);
		Game.scene().addToFront(new HungerWindow());
	}

	public HungerWindow() {
		super();
		boolean disabled = HungerEditor.isDisabled();

		addTitle("Hunger", tab == 0 ? STAGES_INFO : STARVING_INFO);
		addScope();
		addCheckBox("Disable hunger", disabled, () -> HungerEditor.setDisabled(!HungerEditor.isDisabled()));
		addTabs(TABS, tab, index -> {
			tab = index;
			refresh();
		}, index -> buildTab(index, disabled));

		float half = (WIDTH - GAP) / 2f;
		addButton("Reset all", 0, half, () -> {
			HungerEditor.resetDefaults();
			refresh();
		});
		backTo(backAction::run);
		addBackButton(half + GAP, half);
		pos += ROW_HEIGHT + GAP;
		finish();
	}

	private void addScope() {
		boolean inGame = HungerEditor.editsCurrentGame();
		String text;
		if (!inGame) {
			text = "Default for all games";
		} else if (HungerEditor.hasGameSettings()) {
			text = "This game only";
		} else {
			text = "This game (using main menu defaults)";
		}
		RenderedTextBlock scope = PixelScene.renderTextBlock(text, 6);
		scope.hardlight(EditorWindow.DIM_COLOR);
		scope.maxWidth(WIDTH);
		scope.setPos(0, pos - GAP);
		add(scope);
		pos = scope.bottom() + 2 * GAP;

		if (inGame && HungerEditor.hasGameSettings()) {
			addButton("Use main menu defaults", 0, WIDTH, () -> {
				HungerEditor.useMainMenuSettings();
				refresh();
			});
			pos += ROW_HEIGHT + GAP;
		}
	}

	private void buildTab(int index, boolean disabled) {
		if (index == 0) {
			buildStages(disabled);
		} else {
			buildStarving(disabled);
		}
	}

	private void buildStages(boolean disabled) {
		addPresetRow(disabled, HungerEditor::resetStages, HungerEditor::applyStagePreset);

		int notHungry = HungerEditor.notHungryTurns();
		int hungry = HungerEditor.hungryTurns();
		addStepper("Not hungry", notHungry + " turns", notHungry, 10, HungerEditor.MIN_TURNS, HungerEditor.MAX_TURNS,
			HungerEditor::setNotHungryTurns, !disabled, () -> HungerEditor.setNotHungryTurns(HungerEditor.DEFAULT_NOT_HUNGRY));
		addStepper("Hungry", hungry + " turns", hungry, 10, HungerEditor.MIN_TURNS, HungerEditor.MAX_TURNS,
			HungerEditor::setHungryTurns, !disabled, () -> HungerEditor.setHungryTurns(HungerEditor.DEFAULT_HUNGRY));

		pos += GAP;
		pos = addCurrentBar(this, 0, pos, WIDTH) + GAP;
	}

	private void buildStarving(boolean disabled) {
		boolean damages = HungerEditor.starvingDamages();
		boolean enabled = !disabled && damages;
		addCheckBox("Starving causes damage", damages, () -> HungerEditor.setStarvingDamages(!HungerEditor.starvingDamages()), !disabled);

		boolean fixed = HungerEditor.usesFixedInterval();
		addButtonRow(new String[] { "Formula", "Fixed" }, fixed ? 1 : 0, index -> {
			HungerEditor.setUsesFixedInterval(index == 1);
			refresh();
		});

		if (fixed) {
			int interval = HungerEditor.fixedInterval();
			addStepper("Every", interval + " turns", interval, 1, 1, HungerEditor.MAX_INTERVAL,
				HungerEditor::setFixedInterval, enabled, () -> HungerEditor.setFixedInterval(Math.round(HungerEditor.defaultInterval(HungerEditor.maxHealth()))));
		} else {
			int formula = HungerEditor.formula();
			addStepper("Formula", String.valueOf(formula), formula, 10, HungerEditor.MIN_FORMULA, HungerEditor.MAX_FORMULA,
				HungerEditor::setFormula, enabled, () -> HungerEditor.setFormula(HungerEditor.DEFAULT_FORMULA));
		}
		int amount = HungerEditor.damageAmount();
		addStepper("Damage", String.valueOf(amount), amount, 1, 1, HungerEditor.MAX_AMOUNT,
			HungerEditor::setDamageAmount, enabled, () -> HungerEditor.setDamageAmount(HungerEditor.DEFAULT_AMOUNT));

		addPresetRow(!enabled, HungerEditor::resetStarving, HungerEditor::applyStarvingPreset);

		int maxHealth = HungerEditor.maxHealth();
		RenderedTextBlock result = PixelScene.renderTextBlock("Now: " + HungerEditor.describeStarving(maxHealth) + " (" + maxHealth + " max health)", 6);
		result.maxWidth(WIDTH);
		result.hardlight(EditorWindow.TITLE_COLOR);
		result.setPos(0, pos + GAP);
		add(result);
		pos = result.bottom() + 2 * GAP;

	}

	interface Preset {
		void apply(float rate);
	}

	private void addPresetRow(boolean disabled, Runnable reset, Preset preset) {
		float width = (WIDTH - (PRESET_LABELS.length - 1) * GAP) / (float) PRESET_LABELS.length;
		for (int i = 0; i < PRESET_LABELS.length; i++) {
			int index = i;
			addButton(PRESET_LABELS[i], i * (width + GAP), width, () -> {
				if (index == 0) {
					reset.run();
				} else {
					preset.apply(HungerEditor.PRESETS[index - 1]);
				}
				refresh();
			}).enable(!disabled);
		}
		pos += ROW_HEIGHT + GAP;
	}

	/**
	 * Draws the hunger stage bar and its legend into [group]. Returns the bottom of the legend.
	 */
	static float addSummary(Group group, float x, float y, float width) {
		RenderedTextBlock title = PixelScene.renderTextBlock("Hunger", 7);
		title.hardlight(EditorWindow.TITLE_COLOR);
		title.setPos(x, y);
		group.add(title);

		RenderedTextBlock hint = PixelScene.renderTextBlock("Tap to Edit", 6);
		hint.hardlight(EditorWindow.DIM_COLOR);
		hint.setPos(x + width - hint.width(), y + (title.height() - hint.height()) / 2f);
		group.add(hint);
		y = title.bottom() + 2;

		y = addCurrentBar(group, x, y, width) + 2;

		RenderedTextBlock starving = PixelScene.renderTextBlock("Starving: " + HungerEditor.describeStarving(HungerEditor.maxHealth()), 6);
		starving.maxWidth((int) width);
		starving.setPos(x, y);
		group.add(starving);
		return starving.bottom();
	}

	/**
	 * The hunger bar for the current settings, with a line where the hero is now. Returns the bottom of the bar.
	 */
	static float addCurrentBar(Group group, float x, float y, float width) {
		float elapsed = Dungeon.hero == null ? -1 : HungerEditor.elapsedTurns(Dungeon.hero);
		return addHungerBar(group, x, y, width, HungerEditor.notHungryTurns(), HungerEditor.hungryTurns(), HungerEditor.isDisabled(), elapsed);
	}

	/**
	 * The hunger stages as a bar that runs down from right to left, like the hero's food: Not hungry on the right, then Hungry, then
	 * Starving on the left, each stage's turns written on it. A line marks [elapsed] turns used up, when it isn't below 0. Returns the
	 * bottom of the bar.
	 */
	static float addHungerBar(Group group, float x, float y, float width, int notHungry, int hungry, boolean disabled, float elapsed) {
		float starvingShare = (notHungry + hungry) * 0.15f;
		float total = notHungry + hungry + starvingShare;
		float scale = width / total;
		float right = x + width;
		float notHungryLeft = right - notHungry * scale;
		float hungryLeft = notHungryLeft - hungry * scale;
		addSegment(group, notHungryLeft, y, right - notHungryLeft, NOT_HUNGRY_COLOR, disabled, String.valueOf(notHungry));
		addSegment(group, hungryLeft, y, notHungryLeft - hungryLeft, HUNGRY_COLOR, disabled, String.valueOf(hungry));
		addSegment(group, x, y, hungryLeft - x, STARVING_COLOR, disabled, null);
		if (elapsed >= 0) {
			float at = Math.max(x + 1, right - Math.min(elapsed, notHungry + hungry + 1) * scale);
			ColorBlock marker = new ColorBlock(MARKER_WIDTH, BAR_HEIGHT + 2 * MARKER_OVERHANG, MARKER_COLOR);
			marker.x = at - MARKER_WIDTH / 2f;
			marker.y = y - MARKER_OVERHANG;
			group.add(marker);
		}
		return y + BAR_HEIGHT + MARKER_OVERHANG;
	}

	private static void addSegment(Group group, float x, float y, float width, int color, boolean disabled, String turns) {
		ColorBlock block = new ColorBlock(Math.max(1, width), BAR_HEIGHT, color);
		block.x = x;
		block.y = y;
		if (disabled) block.alpha(0.3f);
		group.add(block);
		if (turns == null) return;
		RenderedTextBlock label = PixelScene.renderTextBlock(turns, 6);
		if (label.width() > width - 2) return;
		label.hardlight(TURNS_COLOR);
		label.setPos(x + (width - label.width()) / 2f, y + (BAR_HEIGHT - label.height()) / 2f);
		PixelScene.align(label);
		group.add(label);
	}

	@Override
	protected void reopen() {
		show(new HungerWindow());
	}
}
