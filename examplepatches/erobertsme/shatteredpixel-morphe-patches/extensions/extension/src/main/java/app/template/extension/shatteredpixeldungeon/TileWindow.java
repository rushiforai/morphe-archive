package app.template.extension.shatteredpixeldungeon;

import com.shatteredpixel.shatteredpixeldungeon.Dungeon;
import com.shatteredpixel.shatteredpixeldungeon.actors.blobs.Blob;
import com.shatteredpixel.shatteredpixeldungeon.levels.traps.Trap;
import com.shatteredpixel.shatteredpixeldungeon.plants.Plant;
import com.shatteredpixel.shatteredpixeldungeon.scenes.PixelScene;
import com.shatteredpixel.shatteredpixeldungeon.tiles.TerrainFeaturesTilemap;
import com.shatteredpixel.shatteredpixeldungeon.ui.Icons;
import com.shatteredpixel.shatteredpixeldungeon.ui.RedButton;
import com.shatteredpixel.shatteredpixeldungeon.ui.RenderedTextBlock;
import com.shatteredpixel.shatteredpixeldungeon.windows.WndMessage;
import com.watabou.noosa.Image;

public class TileWindow extends EditorWindow {

	private static final String[] TABS = { "Effects", "Objects", "Tile" };
	private static final String[] INFO = {
		"Effects\n\n"
			+ "Every gas or area effect on this tile.\n\n"
			+ "_Here:_ clears it from this tile only.\n_All:_ removes it from the whole floor.\n_Add effect:_ places a new one on this tile.",
		"Objects\n\n"
			+ "## Door\n_Open / Close:_ open or shut it.\n_Lock:_ makes it a locked door that needs a key. _Unlock:_ turns any locked or crystal door into a normal door.\n_Hide:_ turns a plain door into a hidden door. Locked and crystal doors can't be hidden.\nA door can't be closed, locked or hidden while someone stands in it.\n\n"
			+ "## Trap\n_Active:_ goes off when stepped on.\n_Visible:_ you can see it (only for traps that can be hidden).\n_Trigger:_ sets it off now. _Change:_ swaps the trap type. _Remove:_ takes it away.\n\n"
			+ "## Plant\nPlant a seed here, or remove the plant that's here.",
		"Tile\n\n"
			+ "## Terrain\nChanges what this tile is. _Door_ places a normal door; lock or hide it on the Objects tab.\nWalls, chasms and barricades can't be placed where a creature stands.\nChanging the terrain removes any trap or plant here.\n\n"
			+ "## Add to the tile\n_Teleport here_ (Teleport patch): moves your hero to this tile.\n_Spawn creature:_ places any enemy, NPC or ally here.\n_Place item:_ puts any item here. On an active trap you choose whether it stays active; placed items never set it off.\n\n"
			+ "## Delete tile\nRemoves everything here, including effects, traps, plants and items, and leaves an empty pit. Can't be used while a creature stands here.",
	};

	private static final BackAction backAction = new BackAction();
	private static int tab;
	private final int cell;

	static void open(int cell, Runnable back) {
		backAction.set(back);
		tab = 0;
		show(new TileWindow(cell));
	}

	static void open(int cell) {
		show(new TileWindow(cell));
	}

	public TileWindow(int cell) {
		super();
		this.cell = cell;
		int width = Dungeon.level.width();
		String terrain = FloorEditor.terrainName(cell);
		addTitle("TILE " + (cell % width) + ", " + (cell / width) + (terrain == null ? "" : " - " + terrain), INFO[tab]);
		addTabs(TABS, tab, index -> {
			tab = index;
			refresh();
		}, this::buildTab);

		pos += GAP;
		float half = (WIDTH - GAP) / 2f;
		addButton("Floor", 0, half, () -> {
			hide();
			FloorWindow.open(() -> open(cell));
		});
		backTo(backAction::run);
		addBackButton(half + GAP, half);
		pos += ROW_HEIGHT;
		finish();
	}

	private void buildTab(int index) {
		if (index == 0) buildEffects();
		if (index == 1) buildObjects();
		if (index == 2) buildTile();
	}

	private void buildEffects() {
		boolean any = false;
		for (Blob blob : FloorEditor.activeEffects()) {
			int here = FloorEditor.strengthAt(blob, cell);
			if (here <= 0) continue;
			any = true;
			addEffectRow(blob, here);
		}
		if (!any) addHint("No effects on this tile.");
		addRowButton("Add effect", null, () -> replaceWith(new EffectPickerWindow(cell, 0, 0)));
	}

	private void buildObjects() {
		if (FloorEditor.isDoor(cell)) addDoor();

		addSection("Trap");
		Trap trap = FloorEditor.trapAt(cell);
		if (trap == null) {
			addRowButton("Add trap", null, () -> replaceWith(new TrapPickerWindow(cell, 0, 0, null))).enable(FloorEditor.canPlaceTrap(cell));
		} else {
			addTrap(trap);
		}

		addSection("Plant");
		Plant plant = FloorEditor.plantAt(cell);
		if (plant == null) {
			addButton("Plant a seed", 0, WIDTH, () -> replaceWith(new SeedPickerWindow(cell, 0))).enable(FloorEditor.canPlant(cell));
		} else {
			float half = (WIDTH - GAP) / 2f;
			addButton(FloorEditor.plantName(plant), 0, half, () -> showPlantInfo(plant));
			addButton("Remove", half + GAP, half, () -> {
				FloorEditor.uproot(cell);
				refresh();
			}).icon(Icons.get(Icons.CLOSE));
		}
		pos += ROW_HEIGHT + GAP;
	}

	private void buildTile() {
		addSection("Terrain");
		int current = FloorEditor.tileAt(cell);
		boolean occupied = FloorEditor.hasCharacter(cell);
		int perRow = 3;
		float width = (WIDTH - (perRow - 1) * GAP) / (float) perRow;
		for (int i = 0; i < FloorEditor.TERRAINS.length; i++) {
			int terrain = FloorEditor.TERRAINS[i];
			float x = (i % perRow) * (width + GAP);
			if (i > 0 && i % perRow == 0) pos += ROW_HEIGHT + GAP;
			RedButton button = addButton(FloorEditor.TERRAIN_NAMES[i], x, width, () -> {
				FloorEditor.setTerrain(cell, terrain);
				refresh();
			});
			if (terrain == current) button.textColor(EditorWindow.TITLE_COLOR);
			button.enable(!(occupied && FloorEditor.isBlocking(terrain)));
		}
		pos += ROW_HEIGHT + GAP;

		addSection("Actions");
		boolean free = FloorEditor.canStandOn(cell);
		if (EditorSwitches.teleport()) {
			RedButton teleport = addButton("Teleport here", 0, WIDTH, () -> {
				hide();
				FloorEditor.teleportHero(cell);
			});
			teleport.icon(Teleport.icon());
			teleport.enable(free);
			pos += ROW_HEIGHT + GAP;
		}
		float half = (WIDTH - GAP) / 2f;
		addButton("Spawn creature", 0, half, () -> replaceWith(new CreaturePickerWindow(cell, 0, 0))).enable(free);
		addButton("Place item", half + GAP, half, () -> {
			hide();
			ItemPickerWindow.openForCell(cell);
		}).enable(FloorEditor.level().passable[cell]);
		pos += ROW_HEIGHT + GAP;
		addButton("Delete tile (empty pit)", 0, WIDTH, () -> {
			FloorEditor.deleteTile(cell);
			refresh();
		}).enable(!occupied);
		pos += ROW_HEIGHT + GAP;
	}

	private static void showPlantInfo(Plant plant) {
		try {
			show(new WndMessage(FloorEditor.plantName(plant) + "\n\n" + plant.desc()));
		} catch (Throwable ignored) {
		}
	}

	private void addEffectRow(Blob blob, int here) {
		float small = 26;
		float nameWidth = WIDTH - 2 * (small + GAP);
		RedButton name = new RedButton("") {
			@Override
			public void onClick() {
				showEffectInfo(blob, cell);
			}
		};
		name.setRect(0, pos, nameWidth, ROW_HEIGHT);
		add(name);
		RenderedTextBlock label = PixelScene.renderTextBlock(FloorEditor.effectName(blob.getClass()) + " (" + here + " here, " + blob.volume + " floor)", 6);
		label.maxWidth((int) nameWidth - 6);
		label.setPos(3, pos + (ROW_HEIGHT - label.height()) / 2f);
		add(label);

		addButton("Here", nameWidth + GAP, small, () -> {
			FloorEditor.clearHere(blob, cell);
			refresh();
		});
		addButton("All", nameWidth + small + 2 * GAP, small, () -> {
			FloorEditor.clearAll(blob);
			refresh();
		}).icon(Icons.get(Icons.CLOSE));
		pos += ROW_HEIGHT + GAP;
	}

	private void addDoor() {
		int tile = FloorEditor.tileAt(cell);
		addSection(FloorEditor.doorState(cell));
		boolean locked = tile == FloorEditor.LOCKED_DOOR || tile == FloorEditor.CRYSTAL_DOOR || tile == FloorEditor.HERO_LOCKED_DOOR;
		boolean hidden = tile == FloorEditor.SECRET_DOOR;
		boolean open = tile == FloorEditor.OPEN_DOOR;
		boolean hideable = tile == FloorEditor.DOOR || open || hidden;
		int columns = hideable ? 3 : 2;
		float third = (WIDTH - (columns - 1) * GAP) / columns;
		addButton(open ? "Close" : "Open", 0, third, () -> {
			FloorEditor.setDoor(cell, open ? FloorEditor.DOOR : FloorEditor.OPEN_DOOR);
			refresh();
		}).enable(!locked && !hidden && !(open && FloorEditor.hasCharacter(cell)));
		addButton(locked ? "Unlock" : "Lock", third + GAP, third, () -> {
			FloorEditor.setDoor(cell, locked ? FloorEditor.DOOR : FloorEditor.LOCKED_DOOR);
			refresh();
		}).enable(!FloorEditor.hasCharacter(cell) || locked);
		if (hideable) {
			addButton(hidden ? "Reveal" : "Hide", 2 * (third + GAP), third, () -> {
				FloorEditor.setDoor(cell, hidden ? FloorEditor.DOOR : FloorEditor.SECRET_DOOR);
				refresh();
			}).enable(!FloorEditor.hasCharacter(cell) || hidden);
		}
		pos += ROW_HEIGHT + GAP;
	}

	private void addTrap(Trap trap) {
		Image icon = null;
		try {
			icon = TerrainFeaturesTilemap.tile(cell, Dungeon.level.map[cell]);
		} catch (Throwable ignored) {
		}
		addListRow(FloorEditor.trapName(trap) + " (" + FloorEditor.trapState(trap) + ")", icon, false, true, () -> showTrapInfo(trap), null);
		addCheckBox("Active", trap.active, () -> FloorEditor.setActive(trap, !trap.active));
		if (trap.canBeHidden) addCheckBox("Visible", trap.visible, () -> FloorEditor.setVisible(trap, !trap.visible));

		float third = (WIDTH - 2 * GAP) / 3f;
		addButton("Trigger", 0, third, () -> {
			hide();
			FloorEditor.trigger(trap);
		});
		addButton("Change", third + GAP, third, () -> replaceWith(new TrapPickerWindow(cell, 0, 0, trap)));
		addButton("Remove", 2 * (third + GAP), third, () -> {
			FloorEditor.removeTrap(trap);
			refresh();
		}).icon(Icons.get(Icons.CLOSE));
		pos += ROW_HEIGHT + GAP;
	}

	static void showEffectInfo(Blob blob, int cell) {
		try {
			String desc = EffectTurns.withTurns(blob.tileDesc(), blob, cell);
			show(new WndMessage(FloorEditor.effectName(blob.getClass()) + (desc == null ? "" : "\n\n" + desc)));
		} catch (Throwable ignored) {
		}
	}

	private static void showTrapInfo(Trap trap) {
		try {
			show(new WndMessage(FloorEditor.trapName(trap) + "\n\n" + trap.desc()));
		} catch (Throwable ignored) {
		}
	}

	@Override
	protected void reopen() {
		show(new TileWindow(cell));
	}
}
