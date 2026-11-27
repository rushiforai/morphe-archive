package app.template.extension.shatteredpixeldungeon;

/**
 * How much the hero resists each kind of elemental harm, from none to immune.
 */
public class ResistanceWindow extends EditorWindow {

	private static final String INFO = "Resistances\n\n"
		+ "How much less each element affects your hero, on top of anything else that protects you. Saved with this run.\n\n"
		+ "## How it works\nDamage and how long an effect lasts both shrink by this much.\n_100%:_ immune. The effect can't touch you at all.\n\n"
		+ "## Magic\nWands, magical attacks like warlock and DM-200 bolts, magic traps and bombs, and magical debuffs like charm, weakness and hex.";
	private static final int STEP = 10;

	private final Runnable onBack;

	public ResistanceWindow(Runnable onBack) {
		super();
		this.onBack = onBack;
		addTitle("Resistances", INFO);
		for (HeroExtras.Element element : HeroExtras.Element.values()) {
			int value = HeroExtras.resistance(element);
			String display = value >= HeroExtras.IMMUNE ? "Immune" : value + "%";
			stepperIcon(StatIcons.buff(element.icon));
			addStepper(element.label, display, value, STEP, 0, HeroExtras.IMMUNE, newValue -> HeroExtras.resistance(element, newValue));
		}
		pos += GAP;
		float half = (WIDTH - GAP) / 2f;
		addButton("Reset", 0, half, () -> {
			for (HeroExtras.Element element : HeroExtras.Element.values()) HeroExtras.resistance(element, 0);
			refresh();
		});
		backTo(this::back);
		addBackButton(half + GAP, half);
		pos += ROW_HEIGHT;
		finish();
	}

	private void back() {
		if (onBack != null) onBack.run();
	}

	@Override
	protected void reopen() {
		show(new ResistanceWindow(onBack));
	}
}
