package app.template.extension.shatteredpixeldungeon;

import java.util.List;

public class EffectPickerWindow extends EditorWindow {

	private static final String[] KINDS = { "Favs", "Gases", "Other" };
	private static final String INFO = "Add effect\n\n"
		+ "Tap an effect to place it on this tile.\n\n"
		+ "_Strength:_ how much is placed. Gases spread out from that amount; fire and others use it as their size.\n\n"
		+ "{HEART}The heart adds an effect to Favorites.";

	private static int strength = 100;

	private final int cell;
	private final int kind;
	private final int page;

	public EffectPickerWindow(int cell, int kind, int page) {
		super();
		this.cell = cell;
		this.kind = kind;
		this.page = page;

		addTitle("Add effect", INFO);
		addButtonRow(KINDS, kind, index -> {
			if (index != kind) replaceWith(new EffectPickerWindow(cell, index, 0));
		});
		addStepper("Strength", String.valueOf(strength), strength, 10, 1, 9999, value -> strength = Math.max(1, Math.min(9999, value)));
		pos += GAP;

		List<FloorEditor.Effect> effects = FloorEditor.effects(kind);
		if (effects.isEmpty()) addHint("No favorites yet. Tap the heart next to an effect to add it here.");
		addPagedList(effects.size(), perPage(7, 3), page, index -> {
			FloorEditor.Effect effect = effects.get(index);
			addListRow(effect.name, null, false, true, () -> {
				FloorEditor.addEffect(effect, cell, strength);
				goBack();
			}, null, new Favorite() {
				@Override
				public boolean isFavorite() {
					return Favorites.isEffect(effect.className);
				}

				@Override
				public void toggle() {
					Favorites.toggleEffect(effect.className);
				}
			});
		}, newPage -> replaceWith(new EffectPickerWindow(cell, kind, newPage)));

		finishWithBack(this::back);
	}

	private void back() {
		TileWindow.open(cell);
	}

	@Override
	protected void reopen() {
		show(new EffectPickerWindow(cell, kind, page));
	}
}
