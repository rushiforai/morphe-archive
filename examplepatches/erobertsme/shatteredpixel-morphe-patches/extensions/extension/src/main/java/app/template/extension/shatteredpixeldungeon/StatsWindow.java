package app.template.extension.shatteredpixeldungeon;

import com.shatteredpixel.shatteredpixeldungeon.Dungeon;
import com.shatteredpixel.shatteredpixeldungeon.actors.Char;
import com.shatteredpixel.shatteredpixeldungeon.actors.mobs.Mob;
import com.shatteredpixel.shatteredpixeldungeon.messages.Messages;
import com.watabou.noosa.Game;
import com.watabou.noosa.Image;

import java.util.Locale;

/**
 * Every stat of a creature, from the Enhanced Bestiary's Stats button.
 */
public class StatsWindow extends EditorWindow {


	private final Mob mob;

	static void open(Mob mob) {
		Game.scene().addToFront(new StatsWindow(mob));
	}

	public StatsWindow(Mob mob) {
		super();
		this.mob = mob;
		boolean live = EnhancedBestiary.isLive(mob);
		addTitle(name(mob));

		addSection("Combat");
		addIconRow(StatIcons.item(StatIcons.POTION_HEALING), "Health", live ? mob.HP + " / " + mob.HT : String.valueOf(mob.HT));
		addIconRow(StatIcons.item(StatIcons.RING_ACCURACY), "Accuracy", safe(() -> String.valueOf(mob.attackSkill(Dungeon.hero))));
		addIconRow(StatIcons.item(StatIcons.RING_EVASION), "Evasion", String.valueOf(mob.defenseSkill));
		addIconRow(StatIcons.item(StatIcons.RING_FORCE), "Damage", range(EnhancedBestiary.range(mob::damageRoll)));
		addIconRow(StatIcons.buff(StatIcons.BUFF_ARMOR), "Armor", range(EnhancedBestiary.range(mob::drRoll)));
		addIconRow(StatIcons.item(StatIcons.RING_FUROR), "Attack speed", safe(() -> speed(1f / mob.attackDelay())));
		addIconRow(StatIcons.item(StatIcons.RING_HASTE), "Move speed", safe(() -> speed(mob.speed())));

		addSection("Senses");
		addIconRow(StatIcons.buff(StatIcons.BUFF_LIGHT), "Vision", safe(() -> ExtraStats.vision(mob) + " tiles"));
		addIconRow(StatIcons.buff(StatIcons.BUFF_INVISIBLE), "Stealth", safe(() -> number(ExtraStats.stealth(mob))));

		ExtraStats.addResistances(this, mob);

		addSection("Other");
		addIconRow(StatIcons.item(StatIcons.POTION_EXP), "Experience", mob.EXP + " (until level " + mob.maxLvl + ")");
		addIconRow(StatIcons.item(StatIcons.RING_WEALTH), "Drops", EnhancedBestiary.lootText(mob));
		if (live) {
			addIconRow(alignmentIcon(mob.alignment), "Alignment", mob.alignment == null ? "Unknown" : titleCase(mob.alignment.name()));
			addIconRow(stateIcon(mob), "State", EnhancedBestiary.stateText(mob));
		} else {
			addIconRow(alignmentIcon(mob.alignment), "Normally", mob.alignment == Char.Alignment.ALLY ? "Ally" : mob.alignment == Char.Alignment.NEUTRAL ? "Neutral" : "Enemy");
		}

		pos += GAP;
		backTo(null);
		addBackButton(0, WIDTH);
		pos += ROW_HEIGHT;
		finish();
	}

	private static Image alignmentIcon(Char.Alignment alignment) {
		if (alignment == Char.Alignment.ALLY) return StatIcons.buff(StatIcons.BUFF_HEART);
		if (alignment == Char.Alignment.ENEMY) return StatIcons.buff(StatIcons.BUFF_TARGETED);
		return StatIcons.buff(StatIcons.BUFF_TIME);
	}

	private static Image stateIcon(Mob mob) {
		String state = EnhancedBestiary.stateText(mob);
		if (state.equals("Sleeping")) return StatIcons.buff(StatIcons.BUFF_DROWSY);
		if (state.equals("Hunting")) return StatIcons.buff(StatIcons.BUFF_TARGETED);
		if (state.equals("Fleeing")) return StatIcons.buff(StatIcons.BUFF_TERROR);
		if (state.equals("Passive")) return StatIcons.buff(StatIcons.BUFF_HEART);
		return StatIcons.item(StatIcons.POTION_MINDVIS);
	}

	private static String name(Mob mob) {
		try {
			return Messages.titleCase(mob.name());
		} catch (Throwable e) {
			return "Creature";
		}
	}

	private static String range(int[] values) {
		if (values == null) return "Unknown";
		return values[0] == values[1] ? String.valueOf(values[0]) : values[0] + " - " + values[1];
	}

	private static String speed(float value) {
		if (Math.abs(value - Math.round(value)) < 0.01f) return Math.round(value) + "x";
		return String.format(Locale.ROOT, "%.2fx", value);
	}

	/**
	 * [value] with up to two decimals and no trailing zeros.
	 */
	static String number(float value) {
		if (Math.abs(value - Math.round(value)) < 0.01f) return String.valueOf(Math.round(value));
		return String.format(Locale.ROOT, "%.2f", value);
	}

	private static String titleCase(String text) {
		String lower = text.toLowerCase(Locale.ROOT);
		return Character.toUpperCase(lower.charAt(0)) + lower.substring(1);
	}

	interface Text {
		String get();
	}

	private static String safe(Text text) {
		try {
			return text.get();
		} catch (Throwable e) {
			return "Unknown";
		}
	}

	@Override
	protected void reopen() {
		show(new StatsWindow(mob));
	}
}
