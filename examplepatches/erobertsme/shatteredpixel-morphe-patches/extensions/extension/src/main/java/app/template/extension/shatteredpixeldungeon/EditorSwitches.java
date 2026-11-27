package app.template.extension.shatteredpixeldungeon;

/**
 * The on/off switches for each editor in the Extras window. Every editor starts switched on.
 */
final class EditorSwitches {

	static final String CHARACTER = "editor_off_character";
	static final String INVENTORY = "editor_off_inventory";
	static final String ENEMY = "editor_off_enemy";
	static final String HUNGER = "editor_off_hunger";
	static final String FLOOR = "editor_off_floor";
	static final String TELEPORT = "editor_off_teleport";

	private EditorSwitches() {
	}

	static boolean isOn(String key) {
		return !CloverlordSettings.get(key);
	}

	static void setOn(String key, boolean on) {
		CloverlordSettings.set(key, !on);
	}

	static boolean teleport() {
		return Teleport.isAvailable() && isOn(TELEPORT);
	}

	static boolean character() {
		return CharacterWindow.isAvailable() && isOn(CHARACTER);
	}

	static boolean inventory() {
		return InventoryWindow.isAvailable() && isOn(INVENTORY);
	}

	static boolean enemy() {
		return EnemyWindow.isAvailable() && isOn(ENEMY);
	}

	static boolean hunger() {
		return HungerEditor.isAvailable() && isOn(HUNGER);
	}

	static boolean floor() {
		return FloorWindow.isAvailable() && isOn(FLOOR);
	}

	static boolean anyAvailable() {
		return CharacterWindow.isAvailable() || InventoryWindow.isAvailable() || EnemyWindow.isAvailable() || HungerEditor.isAvailable() || FloorWindow.isAvailable() || Teleport.isAvailable();
	}
}
