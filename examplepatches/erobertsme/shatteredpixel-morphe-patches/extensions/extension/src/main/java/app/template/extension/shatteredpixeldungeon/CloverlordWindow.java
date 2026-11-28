package app.template.extension.shatteredpixeldungeon;

import com.shatteredpixel.shatteredpixeldungeon.ui.ScrollPane;
import com.shatteredpixel.shatteredpixeldungeon.items.food.Food;
import com.shatteredpixel.shatteredpixeldungeon.scenes.PixelScene;
import com.shatteredpixel.shatteredpixeldungeon.sprites.ItemSprite;
import com.shatteredpixel.shatteredpixeldungeon.ui.BuffIcon;
import com.shatteredpixel.shatteredpixeldungeon.ui.Icons;
import com.shatteredpixel.shatteredpixeldungeon.ui.RenderedTextBlock;
import com.shatteredpixel.shatteredpixeldungeon.ui.Window;
import com.shatteredpixel.shatteredpixeldungeon.scenes.GameScene;
import com.watabou.noosa.Game;
import com.watabou.noosa.Image;

import java.util.ArrayList;
import java.util.List;

public class CloverlordWindow extends EditorWindow {

	private static final float MAX_HEIGHT_SHARE = 0.55f;
	private static final int UPGRADE_ICON = 50;
	private static final String INFO = "Extras\n\n"
		+ "Options added by Cloverlord Patches. Tabs and sections only appear when their patch is included. Settings changed during a game stay with that game; the main menu settings are the defaults for new games.\n\n"
		+ "## Tabs\n_General:_ hunger, saves, undo and Fun.\n_QoL:_ quality of life options.\n_Unlocks:_ unlocks and supporter options.\n_Editors:_ switch each editor on or off. A switched-off editor hides its buttons. Switching off the Hunger editor also puts hunger back to normal.\n\n"
		+ "## General\n{FOOD}_Hunger:_ change how hunger and starvation work.\n_Saves:_ on the main menu, export every save to one zip or import one, and set whether new games auto save on new floors. Importing replaces your saves, keeps a copy in the app's cache, and closes the game. In a game, _Game Saves_ keeps up to 10 saves to load later. When a game ends, the title screen asks whether to keep its saves; _Clean Up Saves_ deletes kept ones.\n_Undo / Redo:_ a tag that opens undo mode to step back and forward through recent actions, with a History list. Off until you switch it on.\n_Fun:_ Hero Sprite makes your hero look like another hero, an enemy or an NPC.\n\n"
		+ "## QoL: screen & tags\n_Display:_ shrink the game in from each screen edge. Applies to every game.\n_Tags editor:_ every tag on screen at once, the game's own included. Tap a tag for its settings, or press and hold briefly, then drag to move it.\n_Item Tags:_ screen-edge tags that use an item, like a quickslot.\n_Quick Tags:_ screen-edge tags that open an editor window or run an action.\n_Toolbar:_ extra item slots and the Attack Tile button.\n\n"
		+ "## QoL: inventory & shops\n_Backpack:_ bag sizes and the Equipment and Rings tabs.\n_Shopkeeper:_ keep enemies out, stop him running off, and set how many sold items can be bought back.\n_Quantum Chest:_ after each boss, a chest beside the exit. Every chest shares one storage of 25, 50 or 75 items.\n\n"
		+ "## QoL: rules\n_Confirm actions:_ choose which taps ask first, like attacking, long walks, stairs or stepping into danger.\n_Experience / Loot:_ change the level limit past which creatures stop giving experience or drops.\n\n"
		+ "## QoL: movement\n_Show interrupted path:_ draws the rest of an interrupted walk.\n_Tap unexplored areas:_ walk to the closest explored tile you can reach.\n_Walk through allies:_ swap past an ally when that's the shorter way, walking over wards without triggering them.\n\n"
		+ "## QoL: information\n_Enhanced Bestiary:_ a Stats button and an i button with abilities, traits, immunities and resistances when you examine a creature.\n_List everything on a tile:_ examining a tile with several things lists each one. Pick one item from a pile to take it. Items inside a grave or chest are listed too.\n_All stats on hero info:_ the hero info window shows all your hero's numbers in tabs, with the run's gold, deepest floor and seed.\n\n"
		+ "## QoL: alchemy & plants\n_Energize more items:_ energize items the game normally won't, like the Arcane Stylus for 5 energy.\n_Reroll Catalyst:_ a Reroll 5 button for trinket choices, for 5 energy.\n_Mageroyal cures everything:_ stepping on one removes every harmful status, for any creature.\n\n"
		+ "## Elsewhere\n_Inventory editor_ (Inventory in the in-game menu): unlimited inventory space and backpack tabs.\n_Floor editor_ (Floor in the in-game menu): Edit Floor mode, and an Edit button when you examine a tile, trap or item. Examining an item also lets you move it or its pile.\n_Supporter options:_ keep your supporter rewards and hide the Support button.";

	private static final int TAB_GENERAL = 0;
	private static final int TAB_QOL = 1;
	private static final int TAB_UNLOCKS = 2;
	private static final int TAB_EDITORS = 3;
	private static final String[] TAB_NAMES = { "General", "QoL", "Unlocks", "Editors" };

	private static int page;

	public CloverlordWindow() {
		super();

		RenderedTextBlock title = PixelScene.renderTextBlock("Extras", 9);
		title.hardlight(TITLE_COLOR);
		title.setPos((WIDTH - title.width()) / 2f, GAP);
		add(title);
		InfoButton.add(this, WIDTH, 0, INFO);
		pos = title.bottom() + GAP;

		RenderedTextBlock version = PixelScene.renderTextBlock("Cloverlord Patches " + CloverlordMenu.patchesVersion(), 6);
		version.hardlight(DIM_COLOR);
		version.setPos((WIDTH - version.width()) / 2f, pos);
		add(version);
		pos = version.bottom() + 2 * GAP;

		List<Integer> tabs = availableTabs();
		if (!tabs.contains(page)) page = TAB_GENERAL;
		if (tabs.size() > 1) addTabBar(tabs);

		float pageTop = pos;
		int firstPart = ScrollArea.partCount(this);
		if (page == TAB_EDITORS) buildEditors();
		if (page == TAB_QOL) buildQualityOfLife();
		if (page == TAB_UNLOCKS) buildUnlocks();
		if (page == TAB_GENERAL) buildGeneral();
		float viewHeight = PixelScene.uiCamera.height * MAX_HEIGHT_SHARE - pageTop - ROW_HEIGHT - 2 * GAP;
		ScrollPane pane = viewHeight < 3 * ROW_HEIGHT ? null : ScrollArea.wrapIfTall(this, firstPart, pageTop, WIDTH, pos - pageTop, viewHeight);
		if (pane != null) pos = pageTop + viewHeight;
		pos += GAP;
		finishWithBack(() -> {
			if (Game.scene() instanceof GameScene) CloverlordMenu.showGameMenu();
		});
		ScrollArea.finish(this, pane);
	}

	@Override
	protected void reopen() {
		CloverlordMenu.show();
	}

	private static List<Integer> availableTabs() {
		List<Integer> tabs = new ArrayList<>();
		tabs.add(TAB_GENERAL);
		if (QolSettings.isAvailable()) tabs.add(TAB_QOL);
		if (UnlockAll.isAvailable() || SupporterRewards.isAvailable()) tabs.add(TAB_UNLOCKS);
		if (EditorSwitches.anyAvailable()) tabs.add(TAB_EDITORS);
		return tabs;
	}

	private void buildGeneral() {
		if (EditorSwitches.hunger() || QolSettings.isAvailable()) addSection("Gameplay");
		if (EditorSwitches.hunger()) {
			addButton("Hunger", new ItemSprite(new Food()), () -> {
				hide();
				HungerWindow.open(CloverlordMenu::show);
			});
		}

		if (SaveBackupActivity.isAvailable() && GameSettings.inGame()) {
			addSection("Saves");
			addButton("Game Saves", Icons.SCROLL_COLOR, () -> {
				hide();
				EditorWindow.show(new GameSavesWindow(0));
			});
			addButton("Undo / Redo", StatIcons.arrow(true), () -> {
				hide();
				EditorWindow.show(new UndoSettingsWindow());
			});
		} else if (SaveBackupActivity.isAvailable()) {
			addSection("Saves");
			addButton("Export saves", exportIcon(), () -> SaveBackupActivity.launch(SaveBackupActivity.ACTION_EXPORT));
			addButton("Import saves", Icons.CHANGES, () -> SaveBackupActivity.launch(SaveBackupActivity.ACTION_IMPORT));
			addSwitch("Auto save on new floors", GameSaves.autoSaves(), GameSaves::autoSaves);
			addButton("Undo / Redo", StatIcons.arrow(true), () -> {
				hide();
				EditorWindow.show(new UndoSettingsWindow());
			});
			int finished = GameSaves.finishedFolders().size();
			if (finished > 0) {
				addButton("Clean Up Saves (" + finished + ")", Icons.CLOSE, () -> ConfirmPrompt.ask("Clean Up Saves",
					"Delete the game saves of " + finished + (finished == 1 ? " game that has" : " games that have") + " ended? Saves of games in progress are kept.",
					"Delete", () -> {
						GameSaves.cleanUp();
						hide();
						CloverlordMenu.show();
					}));
			}
		}

		if (Fun.isAvailable()) {
			addSection("Fun");
			addButton("Fun", HeroSkin.icon(HeroSkin.current()), () -> {
				hide();
				EditorWindow.show(new FunWindow());
			});
		}

		if (!EditorSwitches.hunger() && !QolSettings.isAvailable() && !SaveBackupActivity.isAvailable() && !Fun.isAvailable()) addSection("Nothing here yet. Try the other tabs.");
	}

	private void buildQualityOfLife() {
		addSection("Screen & tags");
		addButton("Display", Icons.DISPLAY, () -> open(new DisplayWindow()));
		addButton("Tags editor", Icons.TARGET, () -> {
			hide();
			TagLayoutEditor.open(CloverlordMenu::show);
		});
		addButton("Item Tags", Icons.BACKPACK_LRG, () -> open(new CustomTagsWindow()));
		addButton("Quick Tags", Icons.TALENT, () -> open(new QuickTagsWindow()));
		addButton("Toolbar", Icons.PREFS, () -> open(new ToolbarSettingsWindow()));

		addSection("Inventory & shops");
		addButton("Backpack", Icons.POTION_BANDOLIER, () -> open(new BackpackSettingsWindow()));
		addButton("Shopkeeper", Icons.GOLD, () -> open(new ShopkeeperWindow()));
		addSwitch("Quantum Chest", QuantumChest.isOn(), QuantumChest::setOn);
		addChestPageButtons();
		addSwitch("Reforge hero armor", HeroArmorReforge.isOn(), HeroArmorReforge::setOn);

		addSection("Rules");
		addButton("Confirm actions", Icons.WARNING, () -> open(new ConfirmWindow()));
		addButton("Experience", StatIcons.item(StatIcons.POTION_EXP), () -> open(new RewardRulesWindow(KillRewards.Kind.EXPERIENCE)));
		addButton("Loot", StatIcons.item(StatIcons.RING_WEALTH), () -> open(new RewardRulesWindow(KillRewards.Kind.LOOT)));

		addSection("Movement");
		addSwitch("Show interrupted path", QolSettings.resumePath(), QolSettings::resumePath);
		addSwitch("Tap unexplored areas", UnexploredTaps.isOn(), UnexploredTaps::setOn);
		addSwitch("Walk through allies", AllyPathing.isOn(), AllyPathing::setOn);

		addSection("Information");
		addSwitch("Enhanced Bestiary", QolSettings.enhancedBestiary(), QolSettings::enhancedBestiary);
		addSwitch("List everything on a tile", TileContents.isOn(), TileContents::setOn);
		addSwitch("All stats on hero info", QolSettings.heroStatsButton(), QolSettings::heroStatsButton);

		addSection("Items");
		addButton("Torches", StatIcons.buff(StatIcons.BUFF_LIGHT), () -> open(new TorchSettingsWindow()));

		addSection("Alchemy & plants");
		addSwitch("Energize more items", EnergizeMore.isOn(), EnergizeMore::setOn);
		addSwitch("Reroll Catalyst", RerollCatalyst.isOn(), RerollCatalyst::setOn);
		addSwitch("Mageroyal cures everything", MageroyalCure.isOn(), MageroyalCure::setOn);

		addSection("Gardens");
		addSwitch("Enemies don't trample plants", Garden.noTrampling(), Garden::noTrampling);
		addSwitch("Plants don't catch fire", Garden.noFire(), Garden::noFire);
		addSwitch("No enemies in gardens", Garden.noEnemies(), Garden::noEnemies);

		addSection("Games in progress");
		addSwitch("Preview games on the main menu", GameSlots.previews(), GameSlots::previews);
		addSwitch("Reuse seeds of unfinished games", GameSlots.reuseSeeds(), GameSlots::reuseSeeds);
	}

	private void open(Window window) {
		hide();
		EditorWindow.show(window);
	}


	private void buildUnlocks() {
		if (UnlockAll.isAvailable()) {
			addSection("Unlocks");
			addToggle("All heroes", UnlockAll.HEROES);
			addToggle("Guide books", UnlockAll.GUIDES);
			addToggle("Intros and lore", UnlockAll.LORE);
			addToggle("Item catalog", UnlockAll.ITEMS);
			addToggle("Bestiary", UnlockAll.BESTIARY);
		}

		if (SupporterRewards.isAvailable()) {
			addSection("Supporter options");
			addToggle("Hide Support button", CloverlordMenu.HIDE_SUPPORT);
			addTierButtons();
		}
	}

	private void addTabBar(List<Integer> tabs) {
		String[] labels = new String[tabs.size()];
		for (int i = 0; i < labels.length; i++) labels[i] = TAB_NAMES[tabs.get(i)];
		addButtonRow(labels, tabs.indexOf(page), index -> {
			if (tabs.get(index) == page) return;
			page = tabs.get(index);
			refresh();
		});
		pos += GAP;
	}

	private void buildEditors() {
		addSection("Editors");
		if (CharacterWindow.isAvailable()) addEditorSwitch("Character editor", EditorSwitches.CHARACTER);
		if (InventoryWindow.isAvailable()) addEditorSwitch("Inventory editor", EditorSwitches.INVENTORY);
		if (EnemyWindow.isAvailable()) addEditorSwitch("Enemy and NPC editor", EditorSwitches.ENEMY);
		if (FloorWindow.isAvailable()) addEditorSwitch("Floor editor", EditorSwitches.FLOOR);
		if (HungerEditor.isAvailable()) addEditorSwitch("Hunger editor", EditorSwitches.HUNGER);
		if (Teleport.isAvailable()) addEditorSwitch("Teleport", EditorSwitches.TELEPORT);
	}


	private static Image exportIcon() {
		BuffIcon icon = new BuffIcon(UPGRADE_ICON, true);
		icon.hardlight(0f, 1f, 0f);
		return icon;
	}

	private void addTierButtons() {
		addButtonRow(SupporterRewards.TIER_NAMES, SupporterRewards.tier(), tier -> {
			SupporterRewards.tier(tier);
			refresh();
		});
	}

	private void addChestPageButtons() {
		String[] labels = new String[QuantumChest.MAX_PAGES];
		for (int i = 0; i < labels.length; i++) labels[i] = (i + 1) + (i == 0 ? " Page" : " Pages");
		addButtonRow(labels, QuantumChest.pages() - 1, index -> {
			QuantumChest.pages(index + 1);
			refresh();
		});
	}

	private void addEditorSwitch(String text, String key) {
		addSwitch(text, EditorSwitches.isOn(key), on -> EditorSwitches.setOn(key, on));
	}

	private void addToggle(String text, String key) {
		addSwitch(text, CloverlordSettings.get(key), on -> CloverlordSettings.set(key, on));
	}

	private void addButton(String text, Icons icon, Runnable action) {
		addRowButton(text, Icons.get(icon), action);
	}

	private void addButton(String text, Image icon, Runnable action) {
		addRowButton(text, icon, action);
	}
}
