package app.template.extension.shatteredpixeldungeon;

import com.shatteredpixel.shatteredpixeldungeon.Dungeon;
import com.shatteredpixel.shatteredpixeldungeon.actors.Char;
import com.shatteredpixel.shatteredpixeldungeon.actors.buffs.Buff;
import com.shatteredpixel.shatteredpixeldungeon.actors.mobs.Mob;
import com.shatteredpixel.shatteredpixeldungeon.scenes.PixelScene;
import com.shatteredpixel.shatteredpixeldungeon.ui.BuffIcon;
import com.shatteredpixel.shatteredpixeldungeon.ui.IconButton;
import com.shatteredpixel.shatteredpixeldungeon.ui.Icons;
import com.shatteredpixel.shatteredpixeldungeon.ui.RedButton;
import com.shatteredpixel.shatteredpixeldungeon.ui.RenderedTextBlock;
import com.shatteredpixel.shatteredpixeldungeon.windows.WndInfoMob;
import com.watabou.noosa.Game;

import java.util.List;
import java.util.Locale;

public class EnemyWindow extends EditorWindow {

	static final int TAB_STATS = 0;
	static final int TAB_STATUS = 1;
	private static final String[] TABS = { "Stats", "Status" };
	private static final String[] ALIGNMENTS = { "Enemy", "Neutral", "Ally" };
	private static final String[] STATES = { "Sleep", "Wander", "Hunt", "Flee", "Passive" };
	private static final String[] TAB_INFO = {
		"Stats\n\n"
			+ "## Health\nEdit this creature's health and max health. Tap a number to type it, with Min and Max buttons.\n\n"
			+ "## Side and behavior\n_Side:_ who it fights. Enemies attack you, allies fight for you, neutral creatures leave you alone.\n_Behavior:_ what it's doing now. Hunting creatures chase their target, wandering ones roam, sleeping ones wake when disturbed.\n\n"
			+ "## Moving it\n_Move to Tile:_ tap a tile and the creature walks there. It may change its mind on arrival or when it spots a target, like a directed ally.\n_Teleport_ (Teleport patch): moves it to the tile you tap straight away. The tile must be free to stand on.\n\n"
			+ "## Defeat\n_Defeat:_ kills it straight away.",
		"Status\n\n"
			+ "_Tap the number_ to change how many turns are left.\n_X_ removes a status.\n{INFO}Tap i or long-press a status to read it.\n\n"
			+ "_Add Status_ uses the same picker as your hero. Infinite statuses are only for your hero.",
	};

	private final Mob mob;
	private final int tab;
	private final int page;

	/**
	 * Replaced by the Enemy editor patch to return true.
	 */
	public static boolean isAvailable() {
		return false;
	}

	static void open(Mob mob, int tab, int page) {
		Game.scene().addToFront(new EnemyWindow(mob, tab, page));
	}

	public EnemyWindow(Mob mob, int tab, int page) {
		super();
		this.mob = mob;
		this.tab = tab;
		this.page = page;

		float tabsWidth = WIDTH - InfoButton.SIZE - GAP;
		float width = (tabsWidth - GAP) / 2f;
		for (int i = 0; i < TABS.length; i++) {
			int index = i;
			RedButton button = addButton(TABS[i], i * (width + GAP), width, () -> {
				if (index != tab) replaceWith(new EnemyWindow(mob, index, 0));
			});
			if (i == tab) button.textColor(EditorWindow.TITLE_COLOR);
		}
		InfoButton.add(this, WIDTH, pos, TAB_INFO[tab]);
		pos += ROW_HEIGHT + 2 * GAP;

		RenderedTextBlock name = PixelScene.renderTextBlock(InventoryEditor.capitalize(mob.name()).toUpperCase(Locale.ENGLISH), 9);
		name.hardlight(EditorWindow.TITLE_COLOR);
		name.maxWidth(WIDTH);
		name.setPos(0, pos);
		add(name);
		pos = name.bottom() + 2 * GAP;

		if (!mob.isAlive()) {
			addHint("This creature is gone.");
		} else if (tab == TAB_STATS) {
			buildStats();
		} else {
			buildStatus();
		}

		pos += GAP;
		finishWithBack(() -> {
			if (mob.isAlive()) show(new WndInfoMob(mob));
		});
	}

	private void buildStats() {
		addStepper("Health", String.valueOf(mob.HP), mob.HP, 1, 1, Math.max(1, mob.HT), value -> mob.HP = Math.max(1, Math.min(mob.HT, value)));
		addStepper("Max health", String.valueOf(mob.HT), mob.HT, 1, 1, 99999, value -> {
			mob.HT = Math.max(1, value);
			mob.HP = Math.min(mob.HP, mob.HT);
		});

		addSection("Side");
		addButtonRow(ALIGNMENTS, alignmentIndex(), index -> {
			EnemyEditor.setAlignment(mob, Char.Alignment.values()[index]);
			refresh();
		});

		addSection("Behavior");
		Mob.AiState[] states = { mob.SLEEPING, mob.WANDERING, mob.HUNTING, mob.FLEEING, mob.PASSIVE };
		int selected = -1;
		for (int i = 0; i < states.length; i++) if (mob.state == states[i]) selected = i;
		addButtonRow(new String[] { STATES[0], STATES[1], STATES[2] }, selected, index -> {
			EnemyEditor.setState(mob, states[index]);
			refresh();
		});
		addButtonRow(new String[] { STATES[3], STATES[4] }, selected - 3, index -> {
			EnemyEditor.setState(mob, states[index + 3]);
			refresh();
		});

		addSection("Totals");
		addStat("Accuracy", safe(() -> String.valueOf(mob.attackSkill(Dungeon.hero))));
		addStat("Evasion", safe(() -> String.valueOf(mob.defenseSkill(Dungeon.hero))));
		addStat("Move speed", safe(() -> String.format(Locale.ENGLISH, "%.2fx", mob.speed())));
		addStat("Experience", String.valueOf(mob.EXP));

		pos += GAP;
		boolean teleport = EditorSwitches.teleport();
		float half = teleport ? (WIDTH - GAP) / 2f : WIDTH;
		addButton("Move to tile", 0, half, () -> {
			hide();
			EnemyEditor.chooseDestination(mob);
		});
		if (teleport) {
			addButton("Teleport", half + GAP, half, () -> {
				hide();
				EnemyEditor.chooseTeleport(mob);
			}).icon(Teleport.icon());
		}
		pos += ROW_HEIGHT + GAP;
		addButton("Defeat", 0, WIDTH, () -> {
			EnemyEditor.defeat(mob);
			hide();
		}).icon(Icons.get(Icons.CLOSE));
		pos += ROW_HEIGHT + GAP;
	}

	private int alignmentIndex() {
		if (mob.alignment == Char.Alignment.NEUTRAL) return 1;
		if (mob.alignment == Char.Alignment.ALLY) return 2;
		return 0;
	}

	private void buildStatus() {
		List<Buff> active = StatusEditor.active(mob);
		addSection("Active effects (" + active.size() + ")");
		if (active.isEmpty()) addHint("No active effects.");

		int perPage = perPage(6, 3);
		if (active.size() > perPage) {
			addPagedList(active.size(), perPage, page, index -> addStatusRow(active.get(index)), newPage -> replaceWith(new EnemyWindow(mob, tab, newPage)));
		} else {
			for (Buff buff : active) addStatusRow(buff);
		}

		float half = (WIDTH - GAP) / 2f;
		addButton("Remove negative", 0, half, () -> {
			StatusEditor.removeNegative(mob);
			refresh();
		});
		addButton("Add status", half + GAP, half, () -> {
			hide();
			StatusPickerWindow.openFor(mob, () -> open(mob, TAB_STATUS, page));
		});
		pos += ROW_HEIGHT + GAP;
	}

	private void addStatusRow(Buff buff) {
		float small = 16;
		float turnsWidth = 22;
		boolean editable = StatusEditor.isTurnsEditable(buff);
		float nameWidth = WIDTH - 2 * (small + GAP) - (editable ? turnsWidth + GAP : 0);

		RedButton name = new RedButton("") {
			@Override
			public void onClick() {
				CharacterWindow.showBuffInfo(buff, EnemyWindow.this::refresh);
			}

			@Override
			public boolean onLongClick() {
				CharacterWindow.showBuffInfo(buff, EnemyWindow.this::refresh);
				return true;
			}
		};
		name.setRect(0, pos, nameWidth, ROW_HEIGHT);
		add(name);

		float textLeft = 3;
		BuffIcon icon = statusIcon(buff);
		if (icon != null) {
			icon.x = 3;
			icon.y = pos + (ROW_HEIGHT - icon.height()) / 2f;
			add(icon);
			textLeft = icon.x + icon.width() + 3;
		}
		RenderedTextBlock label = PixelScene.renderTextBlock(StatusEditor.nameOf(buff), 6);
		label.maxWidth((int) (nameWidth - textLeft - 3));
		if (buff.type == Buff.buffType.POSITIVE) label.hardlight(EditorWindow.POSITIVE_COLOR);
		if (buff.type == Buff.buffType.NEGATIVE) label.hardlight(EditorWindow.NEGATIVE_COLOR);
		label.setPos(textLeft, pos + (ROW_HEIGHT - label.height()) / 2f);
		add(label);

		float x = name.right() + GAP;
		if (editable) {
			int current = StatusEditor.turnsValue(buff);
			RedButton turns = new RedButton(String.valueOf(current), 6) {
				@Override
				public void onClick() {
					NumberPrompt.show("Turns left", current, 1, 9999, value -> StatusEditor.setTurns(buff, value), EnemyWindow.this::refresh);
				}
			};
			turns.setRect(x, pos, turnsWidth, ROW_HEIGHT);
			add(turns);
			x += turnsWidth + GAP;
		}

		IconButton info = new IconButton(Icons.get(Icons.INFO)) {
			@Override
			public void onClick() {
				CharacterWindow.showBuffInfo(buff, EnemyWindow.this::refresh);
			}
		};
		info.setRect(x, pos, small, ROW_HEIGHT);
		add(info);

		IconButton remove = new IconButton(Icons.get(Icons.CLOSE)) {
			@Override
			public void onClick() {
				StatusEditor.remove(buff);
				refresh();
			}
		};
		remove.setRect(WIDTH - small, pos, small, ROW_HEIGHT);
		add(remove);
		pos += ROW_HEIGHT + GAP;
	}

	private static BuffIcon statusIcon(Buff buff) {
		try {
			return new BuffIcon(buff, true);
		} catch (Throwable e) {
			return null;
		}
	}

	private void addStat(String label, String value) {
		RenderedTextBlock left = PixelScene.renderTextBlock(label, 6);
		left.setPos(0, pos);
		add(left);
		RenderedTextBlock right = PixelScene.renderTextBlock(value, 6);
		right.setPos(WIDTH - right.width(), pos);
		add(right);
		pos = Math.max(left.bottom(), right.bottom()) + GAP;
	}

	private interface Source {
		String get();
	}

	private static String safe(Source source) {
		try {
			return source.get();
		} catch (Throwable e) {
			return "?";
		}
	}

	@Override
	protected void reopen() {
		open(mob, tab, page);
	}
}
