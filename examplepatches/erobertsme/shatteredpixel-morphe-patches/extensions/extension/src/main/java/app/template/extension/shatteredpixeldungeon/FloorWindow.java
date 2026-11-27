package app.template.extension.shatteredpixeldungeon;

import com.shatteredpixel.shatteredpixeldungeon.Dungeon;
import com.shatteredpixel.shatteredpixeldungeon.actors.Char;
import com.shatteredpixel.shatteredpixeldungeon.actors.blobs.Blob;
import com.shatteredpixel.shatteredpixeldungeon.actors.mobs.Mob;
import com.shatteredpixel.shatteredpixeldungeon.levels.traps.Trap;
import com.shatteredpixel.shatteredpixeldungeon.scenes.PixelScene;
import com.shatteredpixel.shatteredpixeldungeon.ui.IconButton;
import com.shatteredpixel.shatteredpixeldungeon.ui.Icons;
import com.shatteredpixel.shatteredpixeldungeon.ui.RedButton;
import com.shatteredpixel.shatteredpixeldungeon.ui.RenderedTextBlock;

import java.util.List;

public class FloorWindow extends EditorWindow {

	static final int TAB_GENERAL = 0;
	static final int TAB_EFFECTS = 1;
	static final int TAB_TRAPS = 2;
	private static final String[] TABS = { "General", "Effects", "Traps" };
	private static final String[] INFO = {
		"General\n\n"
			+ "## Map\n_Reveal Map:_ maps the whole floor and uncovers every secret door and hidden trap, like a Scroll of Magic Mapping.\n_Mark Explored:_ marks every tile as explored, as if you'd walked past it. Doesn't uncover secrets.\n_Forget Map:_ clears what you've explored.\n\n"
			+ "## Draw\nPick _Floor_, _Wall_ or _Eraser_, then drag across the map to paint tiles. Switch brushes with the buttons at the bottom.\n_Move View:_ drag the map to reach other areas, then pick a brush again.\n_Eraser:_ removes everything on a tile and leaves an empty pit.\nTiles with a creature on them are skipped for walls and the eraser.\n_Finish_ (green, bottom right) keeps your changes. _Cancel_ (red, bottom left) puts the floor back as it was.\n\n"
			+ "## Creatures\nDefeat every enemy, ally or neutral creature on this floor at once.\n\n"
			+ "## Edit Floor\nThe button above the tabs. The game is saved, then every tile you tap shows its info with an Edit button and a button for each creature, item, plant or trap on it. Drag to look around.\n_Save_ keeps your changes. _Cancel_ asks first, then puts the whole game back as it was.",
		"Effects\n\n"
			+ "Every gas and area effect on this floor, with its total strength.\n\n"
			+ "## Effects\n_Remove:_ clears one completely. _Remove All Effects:_ clears them all.\n_Lotus_ (Wand of Regrowth): shows its range and turns left. It covers every tile in range with falling leaves and helps plants drop seeds and dew there.\n\n"
			+ "## One tile\nExamine a tile with the magnifying glass and tap Edit Tile.\n\n"
			+ "## Edit Floor\nThe button above the tabs. The game is saved, then every tile you tap shows its info with an Edit button and a button for each creature, item, plant or trap on it. Drag to look around.\n_Save_ keeps your changes. _Cancel_ asks first, then puts the whole game back as it was.",
		"Traps\n\n"
			+ "## Traps on this floor\n_Reveal / Hide:_ whether you can see them.\n_Disarm All:_ stops them going off. _Re-arm All:_ switches them back on.\n_Remove All Traps:_ takes every trap off this floor.\n\n"
			+ "## Edit Floor\nThe button above the tabs. The game is saved, then every tile you tap shows its info with an Edit button and a button for each creature, item, plant or trap on it. Drag to look around.\n_Save_ keeps your changes. _Cancel_ asks first, then puts the whole game back as it was.",
	};

	private static final BackAction backAction = new BackAction();
	private static int tab;

	/**
	 * Replaced by the Floor editor patch to return true.
	 */
	public static boolean isAvailable() {
		return false;
	}

	static void open(Runnable back) {
		open(back, TAB_GENERAL);
	}

	/**
	 * Opens the floor editor on [startTab]. [back] runs when it is closed with Back.
	 */
	static void open(Runnable back, int startTab) {
		backAction.set(back);
		tab = Math.max(0, Math.min(TABS.length - 1, startTab));
		show(new FloorWindow());
	}

	public FloorWindow() {
		super();
		addTitle("FLOOR " + Dungeon.depth, INFO[tab]);
		addButton("Edit Floor", 0, WIDTH, () -> {
			hide();
			FloorEditSession.start();
		});
		pos += ROW_HEIGHT + GAP;
		addTabs(TABS, tab, index -> {
			tab = index;
			refresh();
		}, this::buildTab);

		pos += GAP;
		finishWithBack(backAction::run);
	}

	private void buildTab(int index) {
		if (index == TAB_GENERAL) buildGeneral();
		if (index == TAB_EFFECTS) buildEffects();
		if (index == TAB_TRAPS) buildTraps();
	}

	private void buildEffects() {
		List<Blob> effects = FloorEditor.activeEffects();
		List<Mob> lotuses = FloorEditor.lotuses();
		if (effects.isEmpty() && lotuses.isEmpty()) addHint("No effects on this floor.");
		for (Blob blob : effects) addEffectRow(blob);
		for (Mob lotus : lotuses) addLotusRow(lotus);
		addButton("Remove all effects", 0, WIDTH, () -> {
			FloorEditor.clearAllEffects();
			refresh();
		}).enable(!effects.isEmpty() || !lotuses.isEmpty());
		pos += ROW_HEIGHT + GAP;
	}

	private void buildTraps() {
		List<Trap> traps = FloorEditor.traps();
		int hidden = 0;
		int disarmed = 0;
		for (Trap trap : traps) {
			if (!trap.visible) hidden++;
			if (!trap.active) disarmed++;
		}
		addHint(traps.size() + " traps: " + hidden + " hidden, " + disarmed + " disarmed.");
		float half = (WIDTH - GAP) / 2f;
		addButton("Reveal all", 0, half, () -> run(FloorEditor::revealAll)).enable(hidden > 0);
		addButton("Hide all", half + GAP, half, () -> run(FloorEditor::hideAll)).enable(!traps.isEmpty());
		pos += ROW_HEIGHT + GAP;
		addButton("Disarm all", 0, half, () -> run(FloorEditor::disarmAll)).enable(disarmed < traps.size());
		addButton("Re-arm all", half + GAP, half, () -> run(FloorEditor::rearmAll)).enable(disarmed > 0);
		pos += ROW_HEIGHT + GAP;
		RedButton removeAll = addButton("Remove all traps", 0, WIDTH, () -> run(FloorEditor::removeAllTraps));
		removeAll.icon(Icons.get(Icons.CLOSE));
		removeAll.enable(!traps.isEmpty());
		pos += ROW_HEIGHT + GAP;
	}

	private void buildGeneral() {
		addSection("Map");
		float half = (WIDTH - GAP) / 2f;
		addButton("Reveal map", 0, half, () -> run(FloorEditor::revealMap));
		addButton("Mark explored", half + GAP, half, () -> run(FloorEditor::exploreMap));
		pos += ROW_HEIGHT + GAP;
		addRowButton("Forget map", null, () -> run(FloorEditor::forgetMap));

		addSection("Draw");
		float third = (WIDTH - 2 * GAP) / 3f;
		addButton("Floor", 0, third, () -> draw(DrawingSession.FLOOR));
		addButton("Wall", third + GAP, third, () -> draw(DrawingSession.WALL));
		addButton("Eraser", 2 * (third + GAP), third, () -> draw(DrawingSession.ERASER)).icon(Icons.get(Icons.CLOSE));
		pos += ROW_HEIGHT + GAP;

		addSection("Creatures");
		addGroupButton("Defeat all enemies", Char.Alignment.ENEMY);
		addGroupButton("Defeat all allies", Char.Alignment.ALLY);
		addGroupButton("Defeat all neutral", Char.Alignment.NEUTRAL);
	}

	private void draw(int brush) {
		hide();
		DrawingSession.start(brush);
	}

	private void addGroupButton(String label, Char.Alignment alignment) {
		int count = FloorEditor.countCreatures(alignment);
		RedButton button = addButton(label + " (" + count + ")", 0, WIDTH, () -> run(() -> FloorEditor.defeatCreatures(alignment)));
		button.icon(Icons.get(Icons.CLOSE));
		button.enable(count > 0);
		pos += ROW_HEIGHT + GAP;
	}

	private void addEffectRow(Blob blob) {
		float small = 16;
		float nameWidth = WIDTH - small - GAP;
		RedButton name = new RedButton("") {
			@Override
			public void onClick() {
				TileWindow.showEffectInfo(blob, -1);
			}
		};
		name.setRect(0, pos, nameWidth, ROW_HEIGHT);
		add(name);
		RenderedTextBlock label = PixelScene.renderTextBlock(FloorEditor.effectName(blob.getClass()) + " (" + blob.volume + " total)", 6);
		label.maxWidth((int) nameWidth - 6);
		label.setPos(3, pos + (ROW_HEIGHT - label.height()) / 2f);
		add(label);
		IconButton remove = new IconButton(Icons.get(Icons.CLOSE)) {
			@Override
			public void onClick() {
				FloorEditor.clearAll(blob);
				refresh();
			}
		};
		remove.setRect(nameWidth + GAP, pos, small, ROW_HEIGHT);
		add(remove);
		pos += ROW_HEIGHT + GAP;
	}

	private void addLotusRow(Mob lotus) {
		float small = 16;
		float nameWidth = WIDTH - small - GAP;
		RedButton name = new RedButton("");
		name.setRect(0, pos, nameWidth, ROW_HEIGHT);
		add(name);
		RenderedTextBlock label = PixelScene.renderTextBlock("Lotus (range " + FloorEditor.lotusRange(lotus) + ", " + lotus.HP + " turns)", 6);
		label.maxWidth((int) nameWidth - 6);
		label.setPos(3, pos + (ROW_HEIGHT - label.height()) / 2f);
		add(label);
		IconButton remove = new IconButton(Icons.get(Icons.CLOSE)) {
			@Override
			public void onClick() {
				EnemyEditor.defeat(lotus);
				refresh();
			}
		};
		remove.setRect(nameWidth + GAP, pos, small, ROW_HEIGHT);
		add(remove);
		pos += ROW_HEIGHT + GAP;
	}

	private void run(Runnable action) {
		action.run();
		refresh();
	}

	@Override
	protected void reopen() {
		show(new FloorWindow());
	}
}
