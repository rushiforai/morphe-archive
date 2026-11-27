package app.template.extension.shatteredpixeldungeon;

public class ShopkeeperWindow extends EditorWindow {

	private static final String INFO = "Shopkeeper\n\n"
		+ "## Keeping the shop open\n_Banish Enemies:_ an enemy walking in is told \"Hey! Get out of here!\" and thrown out by the door. It won't come back for 20 turns. Out of sight, you only hear a distant boom.\n_Fearless:_ fights in the shop don't scare him off; he sighs \"C'mon... Really?\". He also stays when you carry the Amulet back up.\n_Immune:_ gas, fire and cold don't drive him away. While you're in the shop he remarks on the smell, heat or chill.\n\n"
		+ "## When you attack him\n_Passive:_ attacks earn \"Was that supposed to hurt?\". A thrown weapon gets \"Ooh. Free item!\" and goes up for sale. Caught stealing, he only says \"I saw that, you know. Rude.\"\n_Lenient:_ two warnings, then the third attack gets you thrown out. Thrown weapons go up for sale. Caught stealing, you pay or leave.\nPassive and Lenient can't both be on. With either on, attacks from outside the shop only get \"What the hell was that?\".\n\n"
		+ "## Getting back in\nApologize with gold (the shop's price of a potion of healing) or a potion of healing. The potion option shows once you've identified potions of healing.\n\n"
		+ "## Sold Items\n{COIN_SML}How many sold items you can buy back, up to 24. The game keeps 3. Every sold item stays in the save, so raising this later brings older ones back.";

	public ShopkeeperWindow() {
		super();
		addTitle("Shopkeeper", INFO);
		addCheckBox("Banish Enemies", ShopkeeperRules.banish(), () -> ShopkeeperRules.banish(!ShopkeeperRules.banish()));
		addCheckBox("Fearless", ShopkeeperRules.fearless(), () -> ShopkeeperRules.fearless(!ShopkeeperRules.fearless()));
		addCheckBox("Immune", ShopkeeperRules.immune(), () -> ShopkeeperRules.immune(!ShopkeeperRules.immune()));
		addCheckBox("Passive", ShopkeeperRules.passive(), () -> ShopkeeperRules.passive(!ShopkeeperRules.passive()));
		addCheckBox("Lenient", ShopkeeperRules.lenient(), () -> ShopkeeperRules.lenient(!ShopkeeperRules.lenient()));
		int sold = ShopkeeperRules.soldItems();
		addStepper("Sold Items", String.valueOf(sold), sold, 1, 0, ShopkeeperRules.MAX_SOLD_ITEMS, ShopkeeperRules::soldItems, true, () -> ShopkeeperRules.soldItems(ShopkeeperRules.DEFAULT_SOLD_ITEMS));
		pos += 2 * GAP;
		finishWithBack(() -> CloverlordMenu.show());
	}

	@Override
	protected void reopen() {
		show(new ShopkeeperWindow());
	}
}
