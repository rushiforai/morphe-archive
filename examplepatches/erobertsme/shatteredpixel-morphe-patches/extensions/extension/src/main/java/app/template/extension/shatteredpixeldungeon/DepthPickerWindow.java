package app.template.extension.shatteredpixeldungeon;

import com.shatteredpixel.shatteredpixeldungeon.Dungeon;

import java.util.Locale;

public class DepthPickerWindow extends EditorWindow {

	private static final String INFO = "Teleport to...\n\n"
		+ "Pick any floor to go there straight away. The current floor is highlighted.\n\n"
		+ "_A tile on this floor:_ tap any tile on this floor to appear there, or on the closest tile you can stand on.\n"
		+ "_Arrive:_ at its entrance or its exit, your choice.\n_New floors:_ floors you haven't reached are created when you arrive, as if you took the stairs. Skipping floors also skips what's on them.\n"
		+ "_Quest floors:_ the Blacksmith's mine and the Ambitious Imp's vault, once you have been there. You arrive where you came in.";
	private static final int[][] QUEST_FLOORS = { { 11, 14 }, { 16, 19 } };
	private static final String[] QUEST_NAMES = { "Mine", "Vault" };
	private static final String[] REGIONS = { "Sewers", "Prison", "Caves", "Dwarven City", "Demon Halls", "Amulet" };
	private static final int PER_ROW = 5;

	private static final BackAction backAction = new BackAction();

	static void open(Runnable back) {
		backAction.set(back);
		show(new DepthPickerWindow());
	}

	public DepthPickerWindow() {
		super();
		addTitle("Teleport to...", INFO);
		addRowButton("A tile on this floor", StatIcons.item(StatIcons.SCROLL_PASSAGE), () -> {
			hide();
			Teleport.pickTile();
		});
		for (int region = 0; region < REGIONS.length; region++) {
			int first = region * PER_ROW + 1;
			if (first > Teleport.MAX_DEPTH) break;
			int last = Math.min(Teleport.MAX_DEPTH, first + PER_ROW - 1);
			addSection(REGIONS[region]);
			String[] labels = new String[PER_ROW];
			for (int i = 0; i < PER_ROW; i++) labels[i] = first + i <= last ? String.valueOf(first + i) : "";
			int current = Dungeon.branch == Teleport.MAIN_BRANCH ? Dungeon.depth - first : -1;
			addButtonRow(labels, current >= 0 && current < PER_ROW ? current : -1, index -> choose(first + index));
		}
		addQuestFloors();
		pos += GAP;
		finishWithBack(backAction::run);
	}

	/**
	 * A button for each quest floor the hero has been to: the Blacksmith's mine and the Ambitious Imp's vault. Ones not yet reached are
	 * left out, since going there would make the floor without its quest.
	 */
	private void addQuestFloors() {
		boolean any = false;
		for (int kind = 0; kind < QUEST_FLOORS.length; kind++) {
			for (int depth = QUEST_FLOORS[kind][0]; depth <= QUEST_FLOORS[kind][1]; depth++) {
				if (!Dungeon.levelHasBeenGenerated(depth, Teleport.QUEST_BRANCH)) continue;
				if (!any) addSection("Quest floors");
				any = true;
				String name = QUEST_NAMES[kind] + ", depth " + depth;
				int floor = depth;
				boolean here = Dungeon.branch == Teleport.QUEST_BRANCH && Dungeon.depth == depth;
				addButtonRow(new String[] { name }, here ? 0 : -1, index -> chooseQuestFloor(name, floor));
			}
		}
	}

	private void chooseQuestFloor(String name, int depth) {
		hide();
		ConfirmPrompt.ask(name, "Teleport to the " + name.toLowerCase(Locale.ENGLISH) + "?", "Teleport", () -> Teleport.toDepth(depth, Teleport.QUEST_BRANCH, Teleport.ENTRANCE));
	}

	private void choose(int depth) {
		hide();
		ConfirmPrompt.ask("Depth " + depth, "Teleport to depth " + depth + "?", new String[] { "Arrive at Entrance", "Arrive at Exit" }, new Runnable[] {
			() -> Teleport.toDepth(depth, Teleport.ENTRANCE),
			() -> Teleport.toDepth(depth, Teleport.EXIT),
		});
	}

	@Override
	protected void reopen() {
		show(new DepthPickerWindow());
	}
}
