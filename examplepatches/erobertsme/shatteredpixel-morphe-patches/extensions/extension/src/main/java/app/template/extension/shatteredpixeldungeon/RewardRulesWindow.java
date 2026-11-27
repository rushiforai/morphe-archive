package app.template.extension.shatteredpixeldungeon;

import com.shatteredpixel.shatteredpixeldungeon.ui.RedButton;

/**
 * The Experience and Loot pages in Extras, QoL.
 */
public class RewardRulesWindow extends EditorWindow {

	private static final String EXPERIENCE_INFO = "Experience\n\n"
		+ "Each kind of creature stops giving experience once your level is above its limit. Rats stop after level 5, scorpios after level 27. Bosses and summoned creatures never give any.\n\n"
		+ "## Rules\n_Normal:_ the game's own rule.\n_No level limit:_ creatures always give full experience.\n_Raise the limit:_ each limit goes up by the levels you choose.\n_Reduced past the limit:_ past it, creatures still give the percentage you choose, at least 1.\n_Multiplier:_ all experience from creatures is multiplied; the game's limit still applies.\n\n"
		+ "Creatures that never give experience aren't changed.";
	private static final String LOOT_INFO = "Loot\n\n"
		+ "Each kind of creature stops dropping items once your level is more than 2 above its experience limit. Rats stop after level 7.\n\n"
		+ "## Rules\n_Normal:_ the game's own rule.\n_No level limit:_ creatures always roll for their drops.\n_Raise the limit:_ each limit goes up by the levels you choose.\n_Reduced past the limit:_ past it, creatures still roll at the percentage of their normal chance you choose.\n_Multiplier:_ every drop chance is multiplied; the game's limit still applies.\n\n"
		+ "Boss drops and creatures that never drop anything aren't changed.";

	private final KillRewards.Kind kind;

	public RewardRulesWindow(KillRewards.Kind kind) {
		super();
		this.kind = kind;
		addTitle(kind.title, kind == KillRewards.Kind.EXPERIENCE ? EXPERIENCE_INFO : LOOT_INFO);

		int mode = KillRewards.mode(kind);
		addSection("Rule");
		for (int i = 0; i < KillRewards.MODES.length; i++) {
			int choice = i;
			RedButton button = addButton(KillRewards.MODES[i], 0, WIDTH, () -> {
				KillRewards.mode(kind, choice);
				refresh();
			});
			if (i == mode) button.textColor(EditorWindow.TITLE_COLOR);
			pos += ROW_HEIGHT + GAP;
		}

		pos += GAP;
		stepperLabelAbove();
		if (mode == KillRewards.RAISE) {
			int value = KillRewards.raise(kind);
			addStepper("Extra levels", "+" + value, value, 1, 1, 30, v -> KillRewards.raise(kind, v), true, () -> KillRewards.raise(kind, KillRewards.DEFAULT_RAISE));
		} else if (mode == KillRewards.REDUCED) {
			int value = KillRewards.reduced(kind);
			addStepper(kind == KillRewards.Kind.EXPERIENCE ? "Experience" : "Drop chance", value + "%", value, 5, 5, 100, v -> KillRewards.reduced(kind, v), true, () -> KillRewards.reduced(kind, KillRewards.DEFAULT_REDUCED));
		} else if (mode == KillRewards.MULTIPLY) {
			int value = KillRewards.multiply(kind);
			addStepper("Multiplier", value + "%", value, 10, 10, 1000, v -> KillRewards.multiply(kind, v), true, () -> KillRewards.multiply(kind, KillRewards.DEFAULT_MULTIPLY));
		} else {
			addSection("Setting");
			addHint("Nothing to set for this rule.");
		}

		pos += GAP;
		finishWithBack(() -> CloverlordMenu.show());
	}

	@Override
	protected void reopen() {
		show(new RewardRulesWindow(kind));
	}
}
