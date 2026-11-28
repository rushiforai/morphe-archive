package app.template.extension.shatteredpixeldungeon;

public class ToolbarSettingsWindow extends EditorWindow {

	private static final String INFO = "Toolbar\n\n"
		+ "## Extra toolbar item slots\nMore quickslots, in a row across the screen below the toolbar, lined up with the quickslots above. Changes show straight away.\nJoined: the row shares one border with the quickslots above, like slots in a row, and the wait, search and backpack buttons sit a little higher. Off, each row has its own border.\nWith the game's Quickslot Swapper on there's no extra row; the swap button swaps to the extra slots instead.\n\n"
		+ "## Attack Tile button\nA button above the backpack button. Tap it, then a tile in reach of your weapon, shown in red, to attack it.\nA creature there is attacked even if hiding, so you can strike a mimic first, often as a surprise attack. An empty tile takes the time of an attack.\n\n"
		+ "## Enchantments affect the tile\nBlazing, Chilling, Blooming and Shocking weapons roll their normal chance and, if it triggers, set the tile alight, freeze it, grow grass or send lightning from it.\nFire and frost burn or freeze items on the tile and cook or freeze meat.\nLightning arcs to creatures within 2 tiles and keeps jumping, further through water, hurting all but your allies for half a hit.\n\n"
		+ "## Tag Style\nWhere the button sits (Auto keeps it beside the game's own tags), its size, color, icon (your weapon by default), icon color, rotation and opacity.";

	public ToolbarSettingsWindow() {
		super();
		addTitle("Toolbar", INFO);
		addCheckBox("Extra toolbar item slots", QuickslotRow.isOn(), () -> QuickslotRow.setOn(!QuickslotRow.isOn()));
		addCheckBox("Joined to the quickslots", QuickslotRow.isJoined(), () -> QuickslotRow.setJoined(!QuickslotRow.isJoined()), QuickslotRow.isOn());
		addCheckBox("Attack Tile button", ForceAttack.isOn(), () -> ForceAttack.setOn(!ForceAttack.isOn()));
		addRowButton("Attack Tile Tag Style", null, () -> replaceWith(new TagSettingsWindow(ForceAttack.TAG, "Attack Tile Tag", () -> show(new ToolbarSettingsWindow())))).enable(ForceAttack.isOn());
		addCheckBox("Enchantments affect the tile", QolSettings.forceAttackEnchants(), () -> QolSettings.forceAttackEnchants(!QolSettings.forceAttackEnchants()), ForceAttack.isOn());
		pos += GAP;
		finishWithBack(() -> CloverlordMenu.show());
	}

	@Override
	protected void reopen() {
		show(new ToolbarSettingsWindow());
	}
}
