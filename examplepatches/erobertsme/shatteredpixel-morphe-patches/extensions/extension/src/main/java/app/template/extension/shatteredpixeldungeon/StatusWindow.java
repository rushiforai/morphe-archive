package app.template.extension.shatteredpixeldungeon;

import com.shatteredpixel.shatteredpixeldungeon.Dungeon;
import com.shatteredpixel.shatteredpixeldungeon.actors.buffs.Buff;
import com.shatteredpixel.shatteredpixeldungeon.ui.BuffIcon;
import com.shatteredpixel.shatteredpixeldungeon.ui.Icons;

/**
 * Edits every setting of one status: its turns, its extra numbers such as healing left or combo, and whether it lasts forever for your
 * hero. Edits either a status a character has, which can also be removed here, or a status about to be added or kept on a quick tag.
 */
public class StatusWindow extends EditorWindow {

	private static final String INFO = "Edit status\n\n"
		+ "_Turns:_ how long the status lasts.\n_Everything else:_ every number and on/off setting the status keeps, like Healing's healing left and heal per turn, or Combo's count. Long-press - or + to change a number by 10 steps, or tap it to type one.\n\n"
		+ "{STAR}_Infinite:_ for your hero, the status never runs out and comes straight back if something removes it.";

	private static final int MIN_NUMBER = -9999;
	private static final int MAX_NUMBER = 99999;
	private static final int DECIMALS = 2;
	private static final int HUNDRED = 100;
	private static final int DECIMAL_STEP = 10;
	private static final int SHORT_LABEL = 12;

	interface Done {
		void done(StatusRecipe recipe);
	}

	private final Buff buff;
	private final StatusRecipe recipe;
	private final boolean forHero;
	private final String doneLabel;
	private final Done done;
	private final Runnable back;

	/**
	 * Edits [buff], a status a character has. Back returns to its info window, and Remove runs [back] once it is gone.
	 */
	public StatusWindow(Buff buff, Runnable back) {
		this(buff, null, buff.target == Dungeon.hero, null, null, back);
	}

	/**
	 * Edits [recipe] before it is used. [doneLabel] names the button that passes it to [done]; Back runs [back].
	 */
	StatusWindow(StatusRecipe recipe, boolean forHero, String doneLabel, Done done, Runnable back) {
		this(recipe.sample, recipe, forHero, doneLabel, done, back);
	}

	private StatusWindow(Buff buff, StatusRecipe recipe, boolean forHero, String doneLabel, Done done, Runnable back) {
		super();
		this.buff = buff;
		this.recipe = recipe;
		this.forHero = forHero;
		this.doneLabel = doneLabel;
		this.done = done;
		this.back = back;
		addTitle(recipe == null ? StatusEditor.nameOf(buff) : recipe.entry.name, INFO);
		boolean infinite = forHero && (recipe == null ? InfiniteStatuses.isInfinite(buff.getClass()) : recipe.infinite());
		if (StatusEditor.isTurnsEditable(buff) && !infinite) addTurns();
		for (StatusEditor.Setting setting : StatusEditor.settings(buff)) addSetting(setting);
		if (forHero) addCheckBox("Infinite", infinite, () -> setInfinite(!infinite));
		pos += GAP;
		if (recipe != null) {
			addRowButton(doneLabel, null, () -> {
				hide();
				done.done(recipe);
			});
			finishWithBack(back);
			return;
		}
		addRowButton("Remove", Icons.get(Icons.CLOSE), () -> {
			hide();
			BuffInfoActions.remove(buff);
			back.run();
		});
		finishWithBack(this::backToStatus);
	}

	private void addTurns() {
		stepperIcon(new BuffIcon(buff, true));
		if (recipe != null) {
			addStepper("Turns", recipe.turns() + " turns", recipe.turns(), 5, 1, 9999, recipe::turns);
			return;
		}
		int turns = StatusEditor.turnsValue(buff);
		addStepper("Turns left", String.valueOf(turns), turns, 1, 1, 9999, value -> StatusEditor.setTurns(buff, value));
	}

	private void setInfinite(boolean infinite) {
		if (recipe != null) {
			recipe.infinite(infinite);
			return;
		}
		InfiniteStatuses.setInfinite(buff, infinite);
	}

	/**
	 * A check box for an on/off setting, or a stepper for a number. Decimals step by a tenth and can be typed to two places.
	 */
	private void addSetting(StatusEditor.Setting setting) {
		if (setting.isSwitch()) {
			boolean on = StatusEditor.isOn(buff, setting.field);
			addCheckBox(setting.label, on, () -> StatusEditor.setOn(buff, setting.field, !on));
			return;
		}
		float value = StatusEditor.number(buff, setting.field);
		if (setting.label.length() > SHORT_LABEL) stepperLabelAbove();
		if (!setting.isDecimal()) {
			int whole = Math.round(value);
			addStepper(setting.label, String.valueOf(whole), whole, 1, MIN_NUMBER, MAX_NUMBER, number -> StatusEditor.setNumber(buff, setting.field, number));
			return;
		}
		int hundredths = Math.round(value * HUNDRED);
		stepperDecimals(DECIMALS);
		addStepper(setting.label, NumberPrompt.format(hundredths, DECIMALS), hundredths, DECIMAL_STEP, MIN_NUMBER * HUNDRED, MAX_NUMBER * HUNDRED,
			number -> StatusEditor.setNumber(buff, setting.field, number / (float) HUNDRED));
	}

	/**
	 * Goes back to the status's info window while the status is still there.
	 */
	private void backToStatus() {
		if (buff.target != null) {
			CharacterWindow.showBuffInfo(buff, back);
			return;
		}
		back.run();
	}

	@Override
	protected void reopen() {
		show(new StatusWindow(buff, recipe, forHero, doneLabel, done, back));
	}
}
