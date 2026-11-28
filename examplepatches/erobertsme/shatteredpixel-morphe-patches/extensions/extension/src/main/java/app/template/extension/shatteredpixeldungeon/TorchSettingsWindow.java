package app.template.extension.shatteredpixeldungeon;

public class TorchSettingsWindow extends EditorWindow {

	private static final String INFO = "Torches\n\n"
		+ "## Burns for\nHow many turns a lit torch lasts, from the game's 250. Hold - or + to change it by 100.\n\n"
		+ "## While illuminated\n_Search chance:_ how much more likely searching is to find hidden doors and traps.\n_Stealth:_ how much stealth you lose, so enemies notice you more easily.\n\n"
		+ "The Illuminated status says how many more tiles you see and any of these that apply.";

	public TorchSettingsWindow() {
		super();
		addTitle("Torches", INFO);
		int turns = Torches.turns();
		stepperHold(Torches.TURNS_HOLD_STEP);
		addStepper("Burns for", turns + " turns", turns, Torches.TURNS_STEP, Torches.TURNS_STEP, Torches.MAX_TURNS, Torches::turns, true, turns == Torches.DEFAULT_TURNS ? null : () -> Torches.turns(Torches.DEFAULT_TURNS));
		addSection("While illuminated");
		int search = Torches.searchBonus();
		addStepper("Search chance", "+" + search + "%", search, 5, 0, Torches.MAX_SEARCH, Torches::searchBonus);
		int stealth = Torches.stealthPenalty();
		addStepper("Stealth", stealth == 0 ? "0" : "-" + stealth, stealth, 1, 0, Torches.MAX_STEALTH, Torches::stealthPenalty);
		pos += GAP;
		finishWithBack(() -> CloverlordMenu.show());
	}

	@Override
	protected void reopen() {
		show(new TorchSettingsWindow());
	}
}
