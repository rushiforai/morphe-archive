package app.template.extension.shatteredpixeldungeon;

import com.shatteredpixel.shatteredpixeldungeon.actors.hero.abilities.ArmorAbility;
import com.shatteredpixel.shatteredpixeldungeon.actors.hero.HeroSubClass;
import com.shatteredpixel.shatteredpixeldungeon.Dungeon;
import com.shatteredpixel.shatteredpixeldungeon.actors.buffs.Buff;
import com.shatteredpixel.shatteredpixeldungeon.actors.hero.Hero;
import com.shatteredpixel.shatteredpixeldungeon.actors.hero.Talent;
import com.shatteredpixel.shatteredpixeldungeon.items.KindOfWeapon;
import com.shatteredpixel.shatteredpixeldungeon.items.armor.Armor;
import com.shatteredpixel.shatteredpixeldungeon.scenes.PixelScene;
import com.shatteredpixel.shatteredpixeldungeon.ui.BuffIcon;
import com.shatteredpixel.shatteredpixeldungeon.ui.IconButton;
import com.shatteredpixel.shatteredpixeldungeon.ui.Icons;
import com.shatteredpixel.shatteredpixeldungeon.ui.RedButton;
import com.shatteredpixel.shatteredpixeldungeon.ui.RenderedTextBlock;
import com.shatteredpixel.shatteredpixeldungeon.ui.StyledButton;
import com.shatteredpixel.shatteredpixeldungeon.Chrome;
import com.shatteredpixel.shatteredpixeldungeon.ui.TalentIcon;
import com.shatteredpixel.shatteredpixeldungeon.windows.WndInfoBuff;
import com.shatteredpixel.shatteredpixeldungeon.windows.WndInfoTalent;
import com.watabou.noosa.Game;
import com.watabou.noosa.Image;
import com.watabou.noosa.PointerArea;
import com.watabou.input.PointerEvent;

import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

public class CharacterWindow extends EditorWindow {

	private static final int TALENT_ROW_HEIGHT = 18;

	public static final int TAB_STATS = 0;
	public static final int TAB_TALENTS = 2;
	public static final int TAB_MODIFIERS = 1;
	public static final int TAB_STATUS = 3;
	private static final String[] TAB_NAMES = { "Stats", "Mods", "Talents", "Status" };
	private static final String[] TAB_INFO = {
		"Stats\n\n"
			+ "Changes apply straight away.\n\n"
			+ "## Editing\n_Tap a number_ to type a value, with Min and Max buttons.\n_Long-press - or +_ to change by 10.\n\n"
			+ "## Notes\n_Max health_ is saved as a bonus, so it survives level-ups.\n_Shield_ adds a Barrier, or drains your shields.\n_Current totals_ at the bottom are read-only. Highlighted values include your modifiers.",
		"Mods\n\n"
			+ "Modifiers are added on top of everything else and saved with this run. The buttons at the top switch pages.\n\n"
			+ "## Changing values\n_Numbers_ change by 1, _percentages_ by 5%.\n_Long-press - or +_ to change by 10 steps, or tap a value to type it.\n_Percentages_ change from normal: +50% is half as much again, -50% is half as much.\n\n"
			+ "## Combat\n_Accuracy, Evasion, Damage, Armor:_ flat amounts added.\n_Attack speed, Move speed:_ percentages.\n_Damage dealt:_ all damage your attacks do.\n_Surprise hits:_ extra damage on enemies that didn't see you coming, like sleeping or distracted ones.\n_Enchant power:_ extra Ring of Arcana levels, so enchantments and glyphs are stronger and trigger more.\n\n"
			+ "## Survival\n_HP regen:_ natural regeneration speed. No effect while a boss floor is locked.\n_Healing:_ all healing you receive. Added at the start of your next turn.\n_Shielding:_ shields and barriers you gain.\n_Damage taken:_ all damage you take.\n_Trap & fall:_ damage from traps and falling, on top of Damage taken.\n_Debuff time / Buff time:_ how long timed negative / positive effects last on you.\n\n"
			+ "## Senses\n_Vision:_ extra tiles you can see.\n_Search range:_ extra tiles searched around you.\n_Search chance:_ how likely you spot hidden doors and traps while walking. Searching on purpose always finds what's in range.\n_Stealth:_ each point counts as one more tile of distance when enemies try to notice you.\n\n"
			+ "## Rewards\n_Luck:_ extra Ring of Wealth levels, for more and better drops.\n_XP gain:_ experience earned.\n_Gold found:_ gold picked up.\n_Shop deals:_ buying costs less, selling pays more.\n_Energize:_ energy from energizing items.\n_Thrown life:_ how long thrown weapons last.\n_Identify speed:_ how fast weapons, armor, rings and wands become identified as you use them or gain experience.\n\n"
			+ "## Rings\nEach counts as that many extra levels of the ring, on top of any you wear.\n\n"
			+ "## Resistances\n_Fire, cold, lightning, poison, corrosion, ooze, paralysis, magic:_ how much less each affects you. 100% makes you immune.",
		"Talents\n\n"
			+ "Pick a tier at the top.\n\n"
			+ "## Points\n_- and +_ remove or add a point. Adding needs an unspent point in that tier.\n_Bonus points_ add extra points to the tier.\n\n"
			+ "## Changing talents\n_Swap button:_ replaces a talent, like a Scroll of Metamorphosis. Tier 4 talents depend on your armor ability and can't be swapped.\n_Subclass_ (bottom of tier 3) and _Armor Ability_ (bottom of tier 4): change them. The old one's talents, and the points in them, are replaced by the new one's.\n\n"
			+ "{INFO}Tap or long-press a talent to read it.",
		"Status\n\n"
			+ "## Statuses\n_Tap the number_ to change how many turns are left.\n_X_ removes a status.\n_Add Status_ adds a new one. _Remove Negative_ clears every negative status.\n\n"
			+ "{STAR}_Star:_ makes a status infinite. It never runs out and comes straight back if something removes it. Bright means on.\n\n"
			+ "{INFO}Tap i or long-press a status to read it.\n\n"
			+ "## Hunger\nThe hunger buttons set how hungry you are. _Well Fed_ also gives the Well Fed effect, as if you had just eaten a meat pie.",
	};

	private final int tab;
	private final int tier;
	private final int page;

	public CharacterWindow() {
		this(TAB_STATS, 1);
	}

	public CharacterWindow(int tab, int tier) {
		this(tab, tier, 0);
	}

	public CharacterWindow(int tab, int tier, int page) {
		super();
		this.tab = tab;
		this.tier = tier;
		this.page = page;

		Hero hero = Dungeon.hero;
		addTabBar();
		if (hero != null) {
			if (tab == TAB_STATS) buildStats(hero);
			if (tab == TAB_TALENTS) buildTalents(hero);
			if (tab == TAB_MODIFIERS) buildModifiers(hero);
			if (tab == TAB_STATUS) buildStatus(hero);
		}
		pos += GAP;
		finishWithBack(() -> backAction.run(CloverlordMenu::showGameMenu));
	}

	private static final BackAction backAction = new BackAction();

	/**
	 * Opens the editor and remembers where its Back button returns to.
	 */
	public static void openFrom(Runnable back, int tab, int tier) {
		backAction.set(back);
		open(tab, tier);
	}

	/**
	 * Replaced by the Character editor patch to return true.
	 */
	public static boolean isAvailable() {
		return false;
	}

	public static void open(int tab, int tier) {
		Game.scene().addToFront(new CharacterWindow(tab, tier));
	}

	public static void open(int tab, int tier, int page) {
		Game.scene().addToFront(new CharacterWindow(tab, tier, page));
	}

	private void reopen(int newTab, int newTier) {
		hide();
		open(newTab, newTier);
	}

	private void reopenPage(int newPage) {
		hide();
		open(tab, tier, newPage);
	}

	@Override
	protected void reopen() {
		open(tab, tier, page);
	}

	private void addTabBar() {
		float tabsWidth = WIDTH - InfoButton.SIZE - GAP;
		float width = (tabsWidth - (TAB_NAMES.length - 1) * GAP) / (float) TAB_NAMES.length;
		InfoButton.add(this, WIDTH, 0, TAB_INFO[tab]);
		for (int i = 0; i < TAB_NAMES.length; i++) {
			final int index = i;
			RedButton button = new RedButton(TAB_NAMES[i], 6) {
				@Override
				public void onClick() {
					if (index != tab) reopen(index, tier);
				}
			};
			if (i == tab) button.textColor(TITLE_COLOR);
			button.setRect(i * (width + GAP), 0, width, ROW_HEIGHT);
			add(button);
		}
		pos = ROW_HEIGHT + 2 * GAP;
	}

	private void buildStats(Hero hero) {
		RenderedTextBlock title = PixelScene.renderTextBlock(("Level " + hero.lvl + " " + hero.className()).toUpperCase(Locale.ENGLISH), 9);
		title.hardlight(TITLE_COLOR);
		title.setPos(0, pos);
		add(title);
		pos = title.bottom() + 2 * GAP;

		stepperIcon(StatIcons.item(StatIcons.POTION_HEALING));
		addStepper("Health", String.valueOf(hero.HP), hero.HP, 1, 1, hero.HT, value -> hero.HP = clamp(value, 1, hero.HT));
		stepperIcon(StatIcons.item(StatIcons.POTION_HEALING));
		addStepper("Max health", String.valueOf(hero.HT), hero.HT, 1, 1, 999, value -> {
			int target = Math.max(1, value);
			hero.HTBoost += target - hero.HT;
			hero.updateHT(false);
		});
		stepperIcon(StatIcons.item(StatIcons.SCROLL_UPGRADE));
		addStepper("Level", String.valueOf(hero.lvl), hero.lvl, 1, 1, 30, value -> {
			int previous = hero.lvl;
			hero.lvl = clamp(value, 1, 30);
			hero.exp = Math.min(hero.exp, hero.maxExp() - 1);
			hero.updateHT(hero.lvl > previous);
		});
		stepperIcon(StatIcons.item(StatIcons.POTION_EXP));
		addStepper("Experience", hero.exp + " / " + hero.maxExp(), hero.exp, 1, 0, hero.maxExp() - 1, value -> hero.exp = clamp(value, 0, hero.maxExp() - 1));
		stepperIcon(StatIcons.item(StatIcons.POTION_STRENGTH));
		addStepper("Strength", String.valueOf(hero.STR), hero.STR, 1, 1, 99, value -> hero.STR = clamp(value, 1, 99));
		int shield = hero.shielding();
		stepperIcon(StatIcons.item(StatIcons.POTION_SHIELDING));
		addStepper("Shield", String.valueOf(shield), shield, 1, 0, 999, value -> StatusEditor.setShield(hero, clamp(value, 0, 999)));

		addSection("Current totals");
		for (HeroStat stat : heroStats(hero)) {
			addIconRow(stat.icon, stat.label, stat.value);
		}
		addIconRow(StatIcons.icon(Icons.COIN_SML), "Gold / Energy", Dungeon.gold + " / " + Dungeon.energy);
	}

	private void buildTalents(Hero hero) {
		float width = (WIDTH - 3 * GAP) / 4f;
		for (int t = 1; t <= HeroExtras.TIERS; t++) {
			final int index = t;
			RedButton button = new RedButton("Tier " + t, 6) {
				@Override
				public void onClick() {
					if (index != tier) reopen(tab, index);
				}
			};
			if (t == tier) button.textColor(TITLE_COLOR);
			button.setRect((t - 1) * (width + GAP), pos, width, ROW_HEIGHT);
			add(button);
		}
		pos += ROW_HEIGHT + 2 * GAP;

		if (HeroExtras.isTierLocked(hero, tier)) {
			addHint(lockedReason(tier));
			addClassChoices(hero);
			return;
		}

		addIconRow(null, "Unspent points", String.valueOf(hero.talentPointsAvailable(tier)));
		int bonus = HeroExtras.bonusTalentPoints(tier);
		addStepper("Bonus points", "+" + bonus, bonus, 1, 0, 99, value -> HeroExtras.bonusTalentPoints(tier, value));
		pos += GAP;

		ArrayList<Talent> talents = new ArrayList<>(hero.talents.get(tier - 1).keySet());
		for (Talent talent : talents) addTalentRow(hero, talent);
		addClassChoices(hero);

	}

	/**
	 * The subclass buttons at the bottom of tier 3, and the armor ability buttons at the bottom of tier 4.
	 */
	private void addClassChoices(Hero hero) {
		if (tier == 3) {
			HeroSubClass[] subclasses = hero.heroClass.subClasses();
			String[] labels = new String[subclasses.length + 1];
			int selected = 0;
			labels[0] = "None";
			for (int i = 0; i < subclasses.length; i++) {
				labels[i + 1] = InventoryEditor.capitalize(subclasses[i].title());
				if (hero.subClass == subclasses[i]) selected = i + 1;
			}
			addSection("Subclass");
			addChoiceRow(labels, selected, index -> TalentEditor.setSubclass(hero, index == 0 ? HeroSubClass.NONE : subclasses[index - 1]));
			return;
		}
		if (tier != 4) return;
		ArmorAbility[] abilities = hero.heroClass.armorAbilities();
		String[] labels = new String[abilities.length + 1];
		int selected = 0;
		labels[0] = "None";
		for (int i = 0; i < abilities.length; i++) {
			labels[i + 1] = InventoryEditor.capitalize(abilities[i].name());
			if (hero.armorAbility != null && hero.armorAbility.getClass() == abilities[i].getClass()) selected = i + 1;
		}
		addSection("Armor Ability");
		addChoiceRow(labels, selected, index -> TalentEditor.setArmorAbility(hero, index == 0 ? null : abilities[index - 1]));
	}

	private void addChoiceRow(String[] labels, int selected, IntAction setter) {
		addChoiceRow(labels, selected, labels.length <= 3 ? labels.length : 2, setter);
	}

	private void addChoiceRow(String[] labels, int selected, int perRow, IntAction setter) {
		addButtonRow(labels, selected, perRow, index -> {
			if (index == selected) return;
			setter.run(index);
			refresh();
		});
	}

	private void addTalentRow(Hero hero, Talent talent) {
		int points = hero.pointsInTalent(talent);
		int buttons = TalentEditor.canSwap(tier) ? 3 : 2;
		float countWidth = 14;
		float nameWidth = WIDTH - buttons * (STEP_WIDTH + GAP) - countWidth - GAP;
		float rowHeight = TALENT_ROW_HEIGHT;

		RedButton name = new RedButton("") {
			@Override
			public void onClick() {
				showInfo(talent, points);
			}

			@Override
			public boolean onLongClick() {
				showInfo(talent, points);
				return true;
			}
		};
		name.setRect(0, pos, nameWidth, rowHeight);
		add(name);

		TalentIcon icon = new TalentIcon(talent);
		icon.x = 3;
		icon.y = pos + (rowHeight - icon.height()) / 2f;
		add(icon);

		RenderedTextBlock label = PixelScene.renderTextBlock(talent.title(), 6);
		label.maxWidth((int) (nameWidth - icon.width() - 6));
		label.setPos(icon.width() + 5, pos + (rowHeight - label.height()) / 2f);
		add(label);

		RenderedTextBlock count = PixelScene.renderTextBlock(points + "/" + talent.maxPoints(), 6);
		if (points > 0) count.hardlight(TITLE_COLOR);
		count.setPos(name.right() + GAP + (countWidth - count.width()) / 2f, pos + (rowHeight - count.height()) / 2f);
		add(count);

		float x = name.right() + GAP + countWidth + GAP;
		x = addSmallButton("-", x, rowHeight, () -> TalentEditor.removePoint(hero, tier, talent));
		x = addSmallButton("+", x, rowHeight, () -> TalentEditor.addPoint(hero, tier, talent));
		if (TalentEditor.canSwap(tier)) {
			RedButton swap = new RedButton("") {
				@Override
				public void onClick() {
					hide();
					Game.scene().addToFront(new TalentSwapWindow(talent, tier, null));
				}
			};
			swap.icon(Icons.get(Icons.CHANGES));
			swap.setRect(x, pos, STEP_WIDTH, rowHeight);
			add(swap);
		}
		pos += rowHeight + GAP;
	}

	private float addSmallButton(String label, float x, float height, Runnable action) {
		RedButton button = new RedButton(label) {
			@Override
			public void onClick() {
				action.run();
				refresh();
			}
		};
		button.setRect(x, pos, STEP_WIDTH, height);
		add(button);
		return x + STEP_WIDTH + GAP;
	}

	private void buildModifiers(Hero hero) {
		HeroExtras.Group[] groups = HeroExtras.Group.values();
		int shown = Math.max(0, Math.min(groups.length - 1, tier - 1));
		float buttonWidth = (WIDTH - (GROUPS_PER_ROW - 1) * GAP) / (float) GROUPS_PER_ROW;
		for (int g = 0; g < groups.length; g++) {
			int target = g + 1;
			RedButton button = new RedButton(groups[g].label, 6) {
				@Override
				public void onClick() {
					if (target != tier) reopen(TAB_MODIFIERS, target);
				}
			};
			if (g == shown) button.textColor(TITLE_COLOR);
			button.setRect((g % GROUPS_PER_ROW) * (buttonWidth + GAP), pos + (g / GROUPS_PER_ROW) * (ROW_HEIGHT + GAP), buttonWidth, ROW_HEIGHT);
			add(button);
		}
		pos += ((groups.length + GROUPS_PER_ROW - 1) / GROUPS_PER_ROW) * (ROW_HEIGHT + GAP) + GAP;

		List<HeroExtras.Mod> mods = HeroExtras.Mod.in(groups[shown]);
		int perPage = PixelScene.landscape() ? MODS_PER_PAGE_LANDSCAPE : mods.size();
		int pages = Math.max(1, (mods.size() + perPage - 1) / perPage);
		int current = Math.min(page, pages - 1);
		int end = Math.min(mods.size(), (current + 1) * perPage);
		for (int i = current * perPage; i < end; i++) {
			HeroExtras.Mod mod = mods.get(i);
			stepperIcon(modIcon(mod));
			int value = HeroExtras.mod(mod);
			String text = (value >= 0 ? "+" : "") + value + (mod.percent ? "%" : "");
			addStepper(mod.label, text, value, mod.step(), mod.min(), mod.max(), newValue -> HeroExtras.mod(mod, newValue));
		}
		if (pages > 1) {
			pos += (perPage - (end - current * perPage)) * (ROW_HEIGHT + GAP);
			addPager(current, pages, this::reopenPage);
		}

		float half = (WIDTH - GAP) / 2f;
		RedButton resistances = new RedButton("Resistances", 7) {
			@Override
			public void onClick() {
				hide();
				EditorWindow.show(new ResistanceWindow(() -> open(TAB_MODIFIERS, tier, page)));
			}
		};
		resistances.icon(StatIcons.item(StatIcons.RING_ELEMENTS));
		resistances.setRect(0, pos, half, ROW_HEIGHT);
		add(resistances);
		RedButton reset = new RedButton("Reset All", 7) {
			@Override
			public void onClick() {
				HeroExtras.resetMods();
				refresh();
			}
		};
		reset.setRect(half + GAP, pos, half, ROW_HEIGHT);
		add(reset);
		pos += ROW_HEIGHT + GAP;
	}

	private void buildStatus(Hero hero) {
		List<Buff> active = StatusEditor.active(hero);
		RedButton addStatus = new RedButton("Add Status", 6) {
			@Override
			public void onClick() {
				hide();
				StatusPickerWindow.openFor(Dungeon.hero, () -> open(TAB_STATUS, tier, page));
			}
		};
		addSectionWithButton("Active effects (" + active.size() + ")", addStatus, 50);
		if (active.isEmpty()) addHint("No active effects.");

		int perPage = PixelScene.landscape() ? 3 : 6;
		int pages = Math.max(1, (active.size() + perPage - 1) / perPage);
		int current = Math.min(page, pages - 1);
		int end = Math.min(active.size(), (current + 1) * perPage);
		for (int i = current * perPage; i < end; i++) addStatusRow(active.get(i));
		if (pages > 1) {
			pos += (perPage - (end - current * perPage)) * (ROW_HEIGHT + GAP);
			addPager(current, pages, this::reopenPage);
		}

		RedButton removeNegative = new RedButton("Remove Negative", 6) {
			@Override
			public void onClick() {
				StatusEditor.removeNegative(hero);
				refresh();
			}
		};
		removeNegative.setRect(0, pos, WIDTH, ROW_HEIGHT);
		add(removeNegative);
		pos += ROW_HEIGHT + GAP;

		pos += GAP;
		if (EditorSwitches.hunger()) {
			float top = pos;
			pos = HungerWindow.addSummary(this, 0, pos, WIDTH) + 2 * GAP;
			PointerArea area = new PointerArea(0, top, WIDTH, pos - top) {
				@Override
				public void onClick(PointerEvent event) {
					hide();
					HungerWindow.open(() -> open(TAB_STATUS, tier, page));
				}
			};
			add(area);
		} else {
			RenderedTextBlock title = PixelScene.renderTextBlock("Hunger", 7);
			title.hardlight(TITLE_COLOR);
			title.setPos(0, pos);
			add(title);
			pos = title.bottom() + 2 * GAP;
		}
		addChoiceRow(StatusEditor.HUNGER_STATES, StatusEditor.hungerState(hero), StatusEditor.HUNGER_STATES.length, index -> StatusEditor.setHungerState(hero, index));
	}

	private void addSectionWithButton(String text, RedButton button, float buttonWidth) {
		pos += GAP;
		RenderedTextBlock block = PixelScene.renderTextBlock(text, 7);
		block.hardlight(TITLE_COLOR);
		float rowTop = pos;
		block.setPos(0, rowTop + (ROW_HEIGHT - block.height()) / 2f);
		add(block);
		button.setRect(WIDTH - buttonWidth, rowTop, buttonWidth, ROW_HEIGHT);
		add(button);
		pos = rowTop + ROW_HEIGHT + GAP;
	}

	private void addStatusRow(Buff buff) {
		float smallWidth = 16;
		float turnsWidth = 22;
		boolean infinite = InfiniteStatuses.isInfinite(buff.getClass());
		boolean editable = StatusEditor.isTurnsEditable(buff);
		boolean showTurns = editable || infinite;
		float nameWidth = WIDTH - 3 * (smallWidth + GAP) - (showTurns ? turnsWidth + GAP : 0);

		RedButton name = new RedButton("") {
			@Override
			public void onClick() {
				showBuffInfo(buff, CharacterWindow.this::refresh);
			}

			@Override
			public boolean onLongClick() {
				showBuffInfo(buff, CharacterWindow.this::refresh);
				return true;
			}
		};
		name.setRect(0, pos, nameWidth, ROW_HEIGHT);
		add(name);

		BuffIcon icon = new BuffIcon(buff, true);
		icon.x = 3;
		icon.y = pos + (ROW_HEIGHT - icon.height()) / 2f;
		add(icon);

		String turns = StatusEditor.turnsOf(buff);
		String text = StatusEditor.nameOf(buff) + (showTurns || turns.isEmpty() ? "" : " (" + turns + ")");
		RenderedTextBlock label = PixelScene.renderTextBlock(text, 6);
		label.maxWidth((int) (nameWidth - icon.width() - 6));
		if (buff.type == Buff.buffType.POSITIVE) label.hardlight(POSITIVE_COLOR);
		if (buff.type == Buff.buffType.NEGATIVE) label.hardlight(NEGATIVE_COLOR);
		label.setPos(icon.width() + 5, pos + (ROW_HEIGHT - label.height()) / 2f);
		add(label);

		float x = name.right() + GAP;
		if (showTurns) {
			int current = StatusEditor.turnsValue(buff);
			RedButton turnsButton = new RedButton(infinite ? "-" : String.valueOf(current), 6) {
				@Override
				public void onClick() {
					if (infinite) return;
					promptValue("Turns left", current, 1, 9999, value -> StatusEditor.setTurns(buff, value));
				}
			};
			turnsButton.setRect(x, pos, turnsWidth, ROW_HEIGHT);
			turnsButton.enable(!infinite);
			add(turnsButton);
			x += turnsWidth + GAP;
		}

		StyledButton infiniteButton = new StyledButton(infinite ? Chrome.Type.RED_BUTTON : Chrome.Type.GREY_BUTTON, "") {
			@Override
			public void onClick() {
				InfiniteStatuses.setInfinite(buff, !infinite);
				refresh();
			}
		};
		Image star = Icons.get(Icons.TALENT);
		if (!infinite) star.alpha(0.3f);
		infiniteButton.icon(star);
		infiniteButton.setRect(x, pos, smallWidth, ROW_HEIGHT);
		add(infiniteButton);
		x += smallWidth + GAP;

		IconButton info = new IconButton(Icons.get(Icons.INFO)) {
			@Override
			public void onClick() {
				showBuffInfo(buff, CharacterWindow.this::refresh);
			}
		};
		info.setRect(x, pos, smallWidth, ROW_HEIGHT);
		add(info);
		x += smallWidth + GAP;

		IconButton remove = new IconButton(Icons.get(Icons.CLOSE)) {
			@Override
			public void onClick() {
				InfiniteStatuses.removeForever(buff);
				refresh();
			}
		};
		remove.setRect(x, pos, smallWidth, ROW_HEIGHT);
		add(remove);
		pos += ROW_HEIGHT + GAP;
	}

	static void showBuffInfo(Buff buff) {
		showBuffInfo(buff, null);
	}

	static void showBuffInfo(Buff buff, Runnable onRemoved) {
		BuffInfoActions.setOnRemoved(onRemoved);
		try {
			Game.scene().addToFront(new WndInfoBuff(buff));
		} catch (Throwable ignored) {
		}
	}

	private static final int MODS_PER_PAGE_LANDSCAPE = 5;
	private static final int GROUPS_PER_ROW = 3;
	private Image nextIcon;

	private void promptValue(String label, int current, int min, int max, IntAction setter) {
		NumberPrompt.show(label, current, min, max, setter, this::refresh);
	}

	private static void showInfo(Talent talent, int points) {
		Game.scene().addToFront(new WndInfoTalent(talent, points, null));
	}

	private static String lockedReason(int tier) {
		if (tier == 3) return "Tier 3 unlocks at level " + (Talent.tierLevelThresholds[3] - 1) + " once you choose a subclass.";
		if (tier == 4) return "Tier 4 unlocks at level " + (Talent.tierLevelThresholds[4] - 1) + " once you choose an armor ability.";
		return "Tier " + tier + " unlocks at level " + (Talent.tierLevelThresholds[tier] - 1) + ".";
	}

	static final class HeroStat {
		final Image icon;
		final String label;
		final String value;

		HeroStat(Image icon, String label, String value) {
			this.icon = icon;
			this.label = label;
			this.value = value;
		}
	}

	/**
	 * Your hero's current totals, as shown on the Stats tab and in the hero stats popup.
	 */
	static List<HeroStat> heroStats(Hero hero) {
		List<HeroStat> stats = new ArrayList<>();
		int strBonus = hero.STR() - hero.STR;
		stats.add(new HeroStat(StatIcons.item(StatIcons.POTION_STRENGTH), "Strength", strBonus == 0 ? String.valueOf(hero.STR) : hero.STR + (strBonus > 0 ? " + " : " - ") + Math.abs(strBonus)));
		stats.add(new HeroStat(StatIcons.item(StatIcons.RING_ACCURACY), "Accuracy", safe(() -> String.valueOf(hero.attackSkill(null))) + modSuffix(HeroExtras.Mod.ACCURACY)));
		stats.add(new HeroStat(StatIcons.item(StatIcons.RING_EVASION), "Evasion", safe(() -> String.valueOf(hero.defenseSkill(null))) + modSuffix(HeroExtras.Mod.EVASION)));
		stats.add(new HeroStat(StatIcons.item(StatIcons.RING_FORCE), "Damage", safe(() -> damageRange(hero)) + modSuffix(HeroExtras.Mod.DAMAGE)));
		stats.add(new HeroStat(StatIcons.buff(StatIcons.BUFF_ARMOR), "Armor", safe(() -> armorRange(hero)) + modSuffix(HeroExtras.Mod.ARMOR)));
		stats.add(new HeroStat(StatIcons.item(StatIcons.RING_FUROR), "Attack speed", safe(() -> format(1f / hero.attackDelay()) + "x") + modSuffix(HeroExtras.Mod.ATTACK_SPEED)));
		stats.add(new HeroStat(StatIcons.item(StatIcons.RING_HASTE), "Move speed", safe(() -> format(hero.speed()) + "x") + modSuffix(HeroExtras.Mod.MOVE_SPEED)));
		stats.add(new HeroStat(StatIcons.item(StatIcons.POTION_SHIELDING), "Shield", safe(() -> String.valueOf(hero.shielding()))));
		return stats;
	}

	static Image modIcon(HeroExtras.Mod mod) {
		switch (mod) {
			case ACCURACY: return StatIcons.item(StatIcons.RING_ACCURACY);
			case EVASION: return StatIcons.item(StatIcons.RING_EVASION);
			case DAMAGE: return StatIcons.item(StatIcons.RING_FORCE);
			case ARMOR: return StatIcons.buff(StatIcons.BUFF_ARMOR);
			case ATTACK_SPEED: return StatIcons.item(StatIcons.RING_FUROR);
			case MOVE_SPEED: return StatIcons.item(StatIcons.RING_HASTE);
			case REGEN: return StatIcons.buff(StatIcons.BUFF_HEALING);
			case LUCK: return StatIcons.item(StatIcons.RING_WEALTH);
			case ENCHANT_POWER: return StatIcons.item(StatIcons.RING_ARCANA);
			case VISION: return StatIcons.buff(StatIcons.BUFF_LIGHT);
			case SEARCH_RANGE: return StatIcons.buff(StatIcons.BUFF_MIND_VISION);
			case SEARCH_CHANCE: return StatIcons.buff(StatIcons.BUFF_FORESIGHT);
			case STEALTH: return StatIcons.buff(StatIcons.BUFF_INVISIBLE);
			case DAMAGE_DEALT: return StatIcons.buff(StatIcons.BUFF_BERSERK);
			case SURPRISE_DAMAGE: return StatIcons.buff(StatIcons.BUFF_TARGETED);
			case HEALING: return StatIcons.item(StatIcons.POTION_HEALING);
			case SHIELDING: return StatIcons.item(StatIcons.POTION_SHIELDING);
			case DAMAGE_TAKEN: return StatIcons.buff(StatIcons.BUFF_BARKSKIN);
			case TRAP_FALL: return StatIcons.buff(StatIcons.BUFF_LEVITATION);
			case DEBUFF_TIME: return StatIcons.buff(StatIcons.BUFF_TERROR);
			case BUFF_TIME: return StatIcons.buff(StatIcons.BUFF_TIME);
			case EXPERIENCE: return StatIcons.item(StatIcons.POTION_EXP);
			case GOLD: return StatIcons.icon(Icons.COIN_SML);
			case SHOP_DEALS: return StatIcons.icon(Icons.COIN_SML);
			case ENERGY: return StatIcons.icon(Icons.ENERGY_SML);
			case THROWN_DURABILITY: return StatIcons.item(StatIcons.RING_SHARPSHOOTING);
			case IDENTIFY_SPEED: return StatIcons.item(StatIcons.SCROLL_IDENTIFY);
			case RING_ACCURACY: return StatIcons.item(StatIcons.RING_ACCURACY);
			case RING_ELEMENTS: return StatIcons.item(StatIcons.RING_ELEMENTS);
			case RING_ENERGY: return StatIcons.item(StatIcons.RING_ENERGY);
			case RING_EVASION: return StatIcons.item(StatIcons.RING_EVASION);
			case RING_FORCE: return StatIcons.item(StatIcons.RING_FORCE);
			case RING_FUROR: return StatIcons.item(StatIcons.RING_FUROR);
			case RING_HASTE: return StatIcons.item(StatIcons.RING_HASTE);
			case RING_MIGHT: return StatIcons.item(StatIcons.RING_MIGHT);
			case RING_SHARPSHOOTING: return StatIcons.item(StatIcons.RING_SHARPSHOOTING);
			case RING_TENACITY: return StatIcons.item(StatIcons.RING_TENACITY);
			default: return null;
		}
	}

	private static String modSuffix(HeroExtras.Mod mod) {
		int value = HeroExtras.mod(mod);
		if (value == 0) return "";
		return " _(" + (value > 0 ? "+" : "") + value + (mod.percent ? "%" : "") + ")_";
	}

	private static String damageRange(Hero hero) {
		KindOfWeapon weapon = hero.belongings.weapon();
		if (weapon == null) return "unarmed";
		int bonus = HeroExtras.mod(HeroExtras.Mod.DAMAGE);
		return Math.max(0, weapon.min() + bonus) + " - " + Math.max(0, weapon.max() + bonus);
	}

	private static String armorRange(Hero hero) {
		Armor armor = hero.belongings.armor();
		int bonus = HeroExtras.mod(HeroExtras.Mod.ARMOR);
		int min = armor == null ? 0 : armor.DRMin();
		int max = armor == null ? 0 : armor.DRMax();
		return Math.max(0, min + bonus) + " - " + Math.max(0, max + bonus);
	}

	private static String format(float value) {
		return String.format(Locale.ENGLISH, "%.2f", value);
	}

	private static int clamp(int value, int min, int max) {
		return Math.max(min, Math.min(max, value));
	}

	private interface StatSource {
		String get();
	}

	private static String safe(StatSource source) {
		try {
			return source.get();
		} catch (Exception e) {
			return "?";
		}
	}
}
