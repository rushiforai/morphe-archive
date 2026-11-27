package app.template.extension.shatteredpixeldungeon;

/**
 * Which tap actions ask for confirmation before they happen.
 */
final class ConfirmSettings {

	enum Action {
		MOVE("Moving", "confirm_walk", true, 2, "steps"),
		ATTACK("Attacking", "confirm_attack", true, 2, "tiles away"),
		INTERACT("Talking to allies and NPCs", "confirm_interact", false, 0, null),
		STAIRS("Using stairs and exits", "confirm_stairs", true, 0, null),
		DANGER("Stepping into danger", "confirm_danger", true, 0, null);

		final String label;
		final String key;
		final boolean byDefault;
		final int defaultDistance;
		final String distanceUnit;

		Action(String label, String key, boolean byDefault, int defaultDistance, String distanceUnit) {
			this.label = label;
			this.key = key;
			this.byDefault = byDefault;
			this.defaultDistance = defaultDistance;
			this.distanceUnit = distanceUnit;
		}

		boolean hasDistance() {
			return distanceUnit != null;
		}
	}

	static final int MAX_DISTANCE = 20;

	private static final String KEY_OFF = "qol_confirm_movement_off";

	private ConfirmSettings() {
	}

	static boolean isOn() {
		return !CloverlordSettings.get(KEY_OFF);
	}

	static void setOn(boolean on) {
		CloverlordSettings.set(KEY_OFF, !on);
	}

	static boolean confirms(Action action) {
		boolean changed = CloverlordSettings.get(action.key + "_changed");
		return changed ? CloverlordSettings.get(action.key) : action.byDefault;
	}

	/**
	 * The shortest distance at which [action] asks first. Closer targets go ahead without asking.
	 */
	static int minDistance(Action action) {
		int value = CloverlordSettings.getInt(action.key + "_distance");
		return value <= 0 ? action.defaultDistance : value;
	}

	static void setMinDistance(Action action, int value) {
		CloverlordSettings.setInt(action.key + "_distance", Math.max(1, Math.min(MAX_DISTANCE, value)));
	}

	static boolean confirms(Action action, int distance) {
		return confirms(action) && distance >= minDistance(action);
	}

	static void setConfirms(Action action, boolean value) {
		CloverlordSettings.set(action.key, value);
		CloverlordSettings.set(action.key + "_changed", true);
	}
}
