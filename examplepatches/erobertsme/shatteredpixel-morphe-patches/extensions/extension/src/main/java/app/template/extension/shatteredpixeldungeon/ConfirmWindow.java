package app.template.extension.shatteredpixeldungeon;

public class ConfirmWindow extends EditorWindow {

	private static final String INFO = "Confirm actions\n\n"
		+ "When an action is checked, tapping the map first shows what will happen: the path, the creature you'll attack, or the danger.\n_Go_, or the same tile again, does it. _Cancel_, or another tile, changes your mind.\n\n"
		+ "## Distances\n_Moving:_ only asks for walks at least this many steps long.\n_Attacking:_ only asks for targets at least this many tiles away.\nBy default single steps and attacks on adjacent enemies go ahead. Set either to 1 to confirm those too.\n\n"
		+ "## Stepping into danger\nKnown traps, fire and harmful gas on the tile or along the way, at any distance.\nTraps are ignored while you levitate, unless it runs out before you could step off. Gas and fire you're immune to are ignored.\nThe game already asks before you jump into a chasm.\n\n"
		+ "## Never confirmed\nButtons like attack and pick up, and keyboard or controller movement.";

	public ConfirmWindow() {
		super();
		addTitle("Confirm actions", INFO);
		addCheckBox("Confirm actions", ConfirmSettings.isOn(), () -> {
			ConfirmSettings.setOn(!ConfirmSettings.isOn());
			if (!ConfirmSettings.isOn()) PathPreview.clear();
		});
		pos += GAP;
		addSection("Ask before");
		for (ConfirmSettings.Action action : ConfirmSettings.Action.values()) {
			addCheckBox(action.label, ConfirmSettings.confirms(action), () -> ConfirmSettings.setConfirms(action, !ConfirmSettings.confirms(action)), ConfirmSettings.isOn());
			if (!action.hasDistance()) continue;
			int distance = ConfirmSettings.minDistance(action);
			addStepper("  From", distance + " " + action.distanceUnit, distance, 1, 1, ConfirmSettings.MAX_DISTANCE, value -> ConfirmSettings.setMinDistance(action, value), ConfirmSettings.isOn() && ConfirmSettings.confirms(action), () -> ConfirmSettings.setMinDistance(action, action.defaultDistance));
		}
		pos += GAP;
		finishWithBack(() -> CloverlordMenu.show());
	}

	@Override
	protected void reopen() {
		show(new ConfirmWindow());
	}
}
