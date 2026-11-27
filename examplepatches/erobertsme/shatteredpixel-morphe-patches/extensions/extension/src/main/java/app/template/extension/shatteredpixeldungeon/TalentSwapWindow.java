package app.template.extension.shatteredpixeldungeon;

import com.shatteredpixel.shatteredpixeldungeon.Dungeon;
import com.shatteredpixel.shatteredpixeldungeon.actors.hero.Hero;
import com.shatteredpixel.shatteredpixeldungeon.actors.hero.HeroClass;
import com.shatteredpixel.shatteredpixeldungeon.actors.hero.Talent;
import com.shatteredpixel.shatteredpixeldungeon.ui.TalentIcon;
import com.shatteredpixel.shatteredpixeldungeon.windows.WndInfoTalent;

import java.util.List;

public class TalentSwapWindow extends EditorWindow {

	private final Talent replacing;
	private final int tier;
	private final HeroClass selectedClass;

	public TalentSwapWindow(Talent replacing, int tier, HeroClass selectedClass) {
		super();
		this.replacing = replacing;
		this.tier = tier;
		this.selectedClass = selectedClass;

		Hero hero = Dungeon.hero;
		HeroClass shown = selectedClass != null ? selectedClass : hero.heroClass;

		addTitle("Replace " + replacing.title(), "Pick a class, then tap a talent to swap it in, like a Scroll of Metamorphosis. Spent points carry over.\n\n_Grayed out_ talents are ones you already have.\n\n{INFO}Tap i or long-press to read one.");

		HeroClass[] classes = HeroClass.values();
		int perRow = 3;
		for (int start = 0; start < classes.length; start += perRow) {
			String[] labels = new String[perRow];
			for (int i = 0; i < perRow; i++) labels[i] = start + i < classes.length ? classes[start + i].title() : "";
			int offset = start;
			addButtonRow(labels, shown.ordinal() - start, index -> {
				if (offset + index >= classes.length || classes[offset + index] == shown) return;
				replaceWith(new TalentSwapWindow(replacing, tier, classes[offset + index]));
			});
		}
		pos += GAP;

		List<Talent> options = TalentEditor.swapOptions(hero, tier, shown);
		if (options.isEmpty()) addHint("This class has no tier " + tier + " talents.");
		for (Talent option : options) {
			boolean owned = TalentEditor.isOwned(hero, tier, option);
			addListRow(option.title(), new TalentIcon(option), false, !owned, () -> {
				TalentEditor.swap(hero, tier, replacing, option);
				back();
			}, () -> show(new WndInfoTalent(option, 0, null)));
		}

		addButton("Cancel", 0, WIDTH, this::back);
		pos += ROW_HEIGHT;
		finish();
	}

	private void back() {
		hide();
		CharacterWindow.open(CharacterWindow.TAB_TALENTS, tier);
	}

	@Override
	protected void reopen() {
		show(new TalentSwapWindow(replacing, tier, selectedClass));
	}
}
