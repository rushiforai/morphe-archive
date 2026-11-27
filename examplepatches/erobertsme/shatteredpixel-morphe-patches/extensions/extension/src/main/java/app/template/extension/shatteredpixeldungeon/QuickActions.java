package app.template.extension.shatteredpixeldungeon;

import com.shatteredpixel.shatteredpixeldungeon.Dungeon;
import com.shatteredpixel.shatteredpixeldungeon.actors.Char;
import com.shatteredpixel.shatteredpixeldungeon.actors.hero.Hero;
import com.shatteredpixel.shatteredpixeldungeon.utils.GLog;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/**
 * Everything a quick tag can do: open an editor window, on a chosen tab where it has tabs, or run an action straight away.
 */
final class QuickActions {

	/**
	 * One thing a quick tag can do.
	 */
	static final class Action {
		final String id;
		final String name;
		final String icon;
		final boolean opensWindow;
		private final Check included;
		private final Check available;
		private final Runnable run;

		Action(String id, String name, String icon, boolean opensWindow, Check included, Runnable run) {
			this.id = id;
			this.name = name;
			this.icon = icon;
			this.opensWindow = opensWindow;
			this.included = included;
			this.available = () -> inGame() && included.isTrue();
			this.run = run;
		}

		/**
		 * Whether the patch and editor this needs are included and switched on.
		 */
		boolean isIncluded() {
			return check(included);
		}

		/**
		 * Whether this can run now: included, and in a game with the hero alive.
		 */
		boolean isAvailable() {
			return check(available);
		}

		private static boolean check(Check check) {
			try {
				return check.isTrue();
			} catch (Throwable e) {
				return false;
			}
		}

		void run() {
			if (!isAvailable()) {
				GLog.w(name + " isn't available right now.");
				return;
			}
			run.run();
		}
	}

	interface Check {
		boolean isTrue();
	}

	private static List<Action> actions;

	private QuickActions() {
	}

	static synchronized List<Action> all() {
		if (actions != null) return actions;
		List<Action> list = new ArrayList<>();
		list.add(window("extras", "Extras menu", "PREFS", () -> true, CloverlordMenu::show));
		list.add(window("hero_stats", "Hero stats", "STATS", QolSettings::isAvailable, () -> EditorWindow.show(new com.shatteredpixel.shatteredpixeldungeon.windows.WndHero())));
		list.add(window("char_stats", "Character: Stats", "ITEM:" + StatIcons.POTION_STRENGTH, EditorSwitches::character, () -> CharacterWindow.openFrom(null, CharacterWindow.TAB_STATS, 1)));
		list.add(window("char_mods", "Character: Mods", "ITEM:" + StatIcons.RING_ACCURACY, EditorSwitches::character, () -> CharacterWindow.openFrom(null, CharacterWindow.TAB_MODIFIERS, 1)));
		list.add(window("char_talents", "Character: Talents", "TALENT", EditorSwitches::character, () -> CharacterWindow.openFrom(null, CharacterWindow.TAB_TALENTS, 1)));
		list.add(window("char_status", "Character: Status", "BUFF:" + StatIcons.BUFF_HEALING, EditorSwitches::character, () -> CharacterWindow.openFrom(null, CharacterWindow.TAB_STATUS, 1)));
		list.add(window("apply_status", "Apply a status", "BUFF:" + StatIcons.BUFF_BARKSKIN, EditorSwitches::character, () -> StatusPickerWindow.openFor(Dungeon.hero, null)));
		list.add(window("inventory", "Inventory editor", "BACKPACK_LRG", EditorSwitches::inventory, InventoryWindow::open));
		list.add(window("add_item", "Add an item", "ITEM:" + StatIcons.SCROLL_UPGRADE, EditorSwitches::inventory, ItemPickerWindow::openFromInventory));
		list.add(window("floor_general", "Floor: General", "STAIRS_LARGE", EditorSwitches::floor, () -> FloorWindow.open(null, FloorWindow.TAB_GENERAL)));
		list.add(window("floor_effects", "Floor: Effects", "BUFF:" + StatIcons.BUFF_FIRE, EditorSwitches::floor, () -> FloorWindow.open(null, FloorWindow.TAB_EFFECTS)));
		list.add(window("floor_traps", "Floor: Traps", "BUFF:" + StatIcons.BUFF_TARGETED, EditorSwitches::floor, () -> FloorWindow.open(null, FloorWindow.TAB_TRAPS)));
		list.add(window("hunger", "Hunger", gameIcon("SPRITE:", "RATION"), EditorSwitches::hunger, () -> HungerWindow.open(null)));
		list.add(window("teleport", "Teleport", "ITEM:" + StatIcons.SCROLL_PASSAGE, EditorSwitches::teleport, () -> DepthPickerWindow.open(null)));
		list.add(window("game_saves", "Game Saves", "SCROLL_COLOR", SaveBackupActivity::isAvailable, () -> EditorWindow.show(new GameSavesWindow(0))));
		list.add(window("undo_history", "Undo history", "CHANGES", UndoHistory::isAvailable, () -> EditorWindow.show(new UndoListWindow())));

		list.add(action("teleport_tile", "Teleport to a tile", gameIcon("ITEM:", "SCROLL_TELEPORT"), EditorSwitches::teleport, Teleport::pickTile, null));
		list.add(action("reveal_map", "Reveal map", gameIcon("ITEM:", "SCROLL_MAGICMAP"), EditorSwitches::floor, FloorEditor::revealMap, "The map is revealed."));
		list.add(action("explore_map", "Mark explored", "BUFF:" + StatIcons.BUFF_MIND_VISION, EditorSwitches::floor, FloorEditor::exploreMap, "Every tile is marked as explored."));
		list.add(action("forget_map", "Forget map", "BUFF:" + StatIcons.BUFF_DROWSY, EditorSwitches::floor, FloorEditor::forgetMap, "The map is forgotten."));
		list.add(action("reveal_traps", "Reveal all traps", "BUFF:" + StatIcons.BUFF_FORESIGHT, EditorSwitches::floor, FloorEditor::revealAll, "Every trap is revealed."));
		list.add(action("disarm_traps", "Disarm all traps", "BUFF:" + StatIcons.BUFF_ARMOR, EditorSwitches::floor, FloorEditor::disarmAll, "Every trap is disarmed."));
		list.add(action("clear_effects", "Clear area effects", "BUFF:" + StatIcons.BUFF_OOZE, EditorSwitches::floor, FloorEditor::clearAllEffects, "Every gas and area effect is gone."));
		list.add(action("defeat_enemies", "Defeat all enemies", "BUFF:" + StatIcons.BUFF_BERSERK, EditorSwitches::floor, () -> FloorEditor.defeatCreatures(Char.Alignment.ENEMY), "Every enemy on this floor is defeated."));
		list.add(action("heal", "Heal fully", "ITEM:" + StatIcons.POTION_HEALING, EditorSwitches::character, QuickActions::healFully, "You are fully healed."));
		list.add(action("cure", "Remove negative statuses", "BUFF:" + StatIcons.BUFF_IMMUNITY, EditorSwitches::character, () -> StatusEditor.removeNegative(Dungeon.hero), "Every negative status is removed."));
		actions = Collections.unmodifiableList(list);
		return actions;
	}

	/**
	 * The action with [id], or null when there is none.
	 */
	static Action find(String id) {
		if (id == null) return null;
		if (StatusRecipe.isId(id)) return statusAction(id);
		for (Action action : all()) {
			if (action.id.equals(id)) return action;
		}
		return null;
	}

	private static Action window(String id, String name, String icon, Check included, Runnable open) {
		return new Action(id, name, icon, true, included, open);
	}

	/**
	 * An action that runs straight away, then tells the player [done], when given.
	 */
	private static Action action(String id, String name, String icon, Check included, Runnable run, String done) {
		return new Action(id, name, icon, false, included, () -> {
			run.run();
			if (done != null) GLog.i(done);
		});
	}

	/**
	 * The action that applies the status written in [id] to the hero, or null when the id is broken.
	 */
	private static Action statusAction(String id) {
		StatusRecipe recipe = StatusRecipe.parse(id);
		if (recipe == null) return null;
		return new Action(id, recipe.describe(), "BUFF:" + StatusEditor.iconOf(recipe.entry.sample), false, EditorSwitches::character, () -> {
			recipe.apply(Dungeon.hero);
			GLog.i(recipe.entry.name + " applied.");
		});
	}

	/**
	 * An icon token for the item sprite or item icon the game names [field], read when the game is running so it always matches.
	 */
	private static String gameIcon(String prefix, String field) {
		try {
			Class<?> type = Reflect.require("com.shatteredpixel.shatteredpixeldungeon.sprites.ItemSpriteSheet" + (prefix.equals("ITEM:") ? "$Icons" : ""));
			return prefix + type.getField(field).getInt(null);
		} catch (Throwable e) {
			return "ARROW";
		}
	}

	private static boolean inGame() {
		Hero hero = Dungeon.hero;
		return hero != null && hero.isAlive() && GameSettings.inGame();
	}

	private static void healFully() {
		Hero hero = Dungeon.hero;
		hero.HP = hero.HT;
	}
}
