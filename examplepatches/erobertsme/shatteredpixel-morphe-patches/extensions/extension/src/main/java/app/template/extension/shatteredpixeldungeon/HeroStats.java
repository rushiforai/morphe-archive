package app.template.extension.shatteredpixeldungeon;

import android.util.Log;

import com.shatteredpixel.shatteredpixeldungeon.Dungeon;
import com.shatteredpixel.shatteredpixeldungeon.Statistics;
import com.shatteredpixel.shatteredpixeldungeon.actors.hero.Hero;
import com.shatteredpixel.shatteredpixeldungeon.scenes.PixelScene;
import com.shatteredpixel.shatteredpixeldungeon.ui.Button;
import com.shatteredpixel.shatteredpixeldungeon.ui.ScrollPane;
import com.shatteredpixel.shatteredpixeldungeon.ui.RedButton;
import com.shatteredpixel.shatteredpixeldungeon.ui.RenderedTextBlock;
import com.shatteredpixel.shatteredpixeldungeon.ui.Window;
import com.shatteredpixel.shatteredpixeldungeon.utils.DungeonSeed;
import com.shatteredpixel.shatteredpixeldungeon.windows.WndHero;
import com.watabou.noosa.Gizmo;
import com.watabou.noosa.Group;
import com.watabou.noosa.Image;
import com.shatteredpixel.shatteredpixeldungeon.ui.Icons;
import com.watabou.noosa.ui.Component;
import com.shatteredpixel.shatteredpixeldungeon.ui.IconButton;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Set;
import java.util.WeakHashMap;

/**
 * All of the hero's stats on the hero info window, in place of its strength, health and experience rows: tabs for the hero's stats,
 * senses, modifiers and resistances, and the run's gold, deepest floor and seed. Laid out like the game's own rows, at the same size.
 */
@SuppressWarnings("unused")
public final class HeroStats {

	private static final String TAG = "HeroStats";
	private static final String[] TABS = { "Stats", "Senses", "Mods", "Resist", "Run" };
	private static final int STATS = 0;
	private static final int SENSES = 1;
	private static final int MODS = 2;
	private static final int RESIST = 3;
	private static final int RUN = 4;
	private static final int WINDOW_HEIGHT = 170;
	private static final float MAX_SCREEN_SHARE = 0.7f;
	private static final int ICON_SPACE = 12;
	private static final float ICON_SIZE = 10;
	private static final Set<Window> sized = Collections.newSetFromMap(new WeakHashMap<>());
	private static final int TEXT_SIZE = 8;
	private static final int TAB_TEXT_SIZE = 6;
	private static final int TAB_HEIGHT = 14;
	private static final int GAP = 2;
	private static final int DEFAULT_ROW = 10;
	private static final HeroExtras.Mod[] OTHER_MODS = {
		HeroExtras.Mod.DAMAGE_DEALT, HeroExtras.Mod.SURPRISE_DAMAGE, HeroExtras.Mod.REGEN, HeroExtras.Mod.HEALING, HeroExtras.Mod.SHIELDING,
		HeroExtras.Mod.DAMAGE_TAKEN, HeroExtras.Mod.TRAP_FALL, HeroExtras.Mod.DEBUFF_TIME, HeroExtras.Mod.BUFF_TIME, HeroExtras.Mod.EXPERIENCE,
		HeroExtras.Mod.GOLD, HeroExtras.Mod.SHOP_DEALS, HeroExtras.Mod.ENERGY, HeroExtras.Mod.THROWN_DURABILITY, HeroExtras.Mod.IDENTIFY_SPEED,
	};

	private static int selected;

	private HeroStats() {
	}

	static boolean isOn() {
		return QolSettings.heroStatsButton();
	}

	/**
	 * Called at the end of WndHero.StatsTab.initialize. Moves the rename button beside the [i] button, then replaces the game's stat rows
	 * with tabs and the chosen tab's rows, at the game's column and text size. The rows sit in an area of fixed height that scrolls when
	 * a tab has more, so the window keeps its size whichever tab is shown.
	 */
	public static void afterStatsTab(Object tab) {
		if (!isOn() || !(tab instanceof Group) || Dungeon.hero == null) return;
		try {
			Group group = (Group) tab;
			List<RenderedTextBlock> gameRows = new ArrayList<>();
			List<Component> headerParts = new ArrayList<>();
			for (Gizmo member : Reflect.members(group)) {
				if (member instanceof RenderedTextBlock) gameRows.add((RenderedTextBlock) member);
				if (member instanceof Component && !(member instanceof RenderedTextBlock)) headerParts.add((Component) member);
			}
			if (gameRows.isEmpty()) return;
			float valueX = Float.MAX_VALUE;
			List<Float> labelTops = new ArrayList<>();
			for (RenderedTextBlock row : gameRows) {
				if (row.left() > 1) valueX = Math.min(valueX, row.left());
				if (row.left() <= 1) labelTops.add(row.top());
				group.remove(row);
				row.destroy();
			}
			int width = (Integer) Reflect.getStatic(WndHero.class, "WIDTH");
			if (valueX == Float.MAX_VALUE) valueX = width * 0.6f;
			float top = moveRenameButton(headerParts) + GAP;
			float contentTop = addTabs(group, width, top);
			Component content = new Component();
			float contentHeight = new Layout(content, width, valueX, rowHeight(labelTops)).build(selected, 0);
			float areaHeight = windowHeight() - contentTop;
			ScrollPane pane = ScrollArea.place(group, content, contentTop, width, contentHeight, areaHeight);
			if (pane != null) ScrollHints.add(group, pane);
			Reflect.set(group.getClass(), group, "pos", (float) windowHeight());
		} catch (Throwable e) {
			Log.e(TAG, "Could not show the hero's stats", e);
		}
	}

	/**
	 * Puts the rename button just left of the [i] button, narrows the title to make room, and returns the bottom of the header.
	 */
	private static float moveRenameButton(List<Component> parts) {
		Component title = null;
		List<Component> buttons = new ArrayList<>();
		for (Component part : parts) {
			if (part instanceof IconButton) {
				buttons.add(part);
			} else if (title == null) {
				title = part;
			}
		}
		buttons.sort((a, b) -> Float.compare(a.top(), b.top()));
		float bottom = title == null ? 0 : title.bottom();
		if (buttons.isEmpty()) return bottom;
		Component info = buttons.get(0);
		float left = info.left();
		for (int i = 1; i < buttons.size(); i++) {
			Component button = buttons.get(i);
			left -= button.width() + GAP;
			button.setPos(left, info.top());
		}
		if (EditorSwitches.character()) left -= WindowHeader.EDIT_WIDTH + GAP;
		if (title != null) title.setRect(title.left(), title.top(), left - GAP - title.left(), 0);
		bottom = info.bottom();
		return title == null ? bottom : Math.max(bottom, title.bottom());
	}

	private static float rowHeight(List<Float> tops) {
		tops.sort(Float::compare);
		float step = Float.MAX_VALUE;
		for (int i = 1; i < tops.size(); i++) {
			float difference = tops.get(i) - tops.get(i - 1);
			if (difference > 1) step = Math.min(step, difference);
		}
		return step == Float.MAX_VALUE ? DEFAULT_ROW : step;
	}

	private static float addTabs(Group tab, int width, float top) {
		float buttonWidth = (width - (TABS.length - 1) * GAP) / (float) TABS.length;
		for (int i = 0; i < TABS.length; i++) {
			int index = i;
			RedButton button = new RedButton(TABS[i], TAB_TEXT_SIZE) {
				@Override
				public void onClick() {
					if (index == selected) return;
					selected = index;
					reload(tab);
				}
			};
			if (i == selected) button.textColor(EditorWindow.TITLE_COLOR);
			button.setRect(i * (buttonWidth + GAP), top, buttonWidth, TAB_HEIGHT);
			tab.add(button);
		}
		return top + TAB_HEIGHT + GAP;
	}

	static final int HEADER_BUTTON = 16;

	/**
	 * How tall the hero window is with all the stats on it: taller than the game's, but kept to a share of the screen.
	 */
	static int windowHeight() {
		return (int) Math.min(WINDOW_HEIGHT, PixelScene.uiCamera.height * MAX_SCREEN_SHARE);
	}

	/**
	 * Called at the end of the WndHero constructor, and first thing by the Character editor's hook there. Makes the hero window taller, with
	 * the talents and statuses tabs filling it, once.
	 */
	public static void layoutHeroWindow(Object window) {
		if (!isOn() || !(window instanceof Window) || !sized.add((Window) window)) return;
		try {
			Window hero = (Window) window;
			int width = Reflect.width(hero);
			hero.resize(width, windowHeight());
			fitTabs(hero, windowHeight());
			hero.offset(0, 0);
		} catch (Throwable e) {
			Log.e(TAG, "Could not make the hero window taller", e);
		}
	}

	/**
	 * Makes the hero window's talents and statuses tabs end at [bottom], with the talents scrolled to the end the way the game opens them.
	 */
	static void fitTabs(Window window, float bottom) throws ReflectiveOperationException {
		int width = Reflect.width(window);
		for (String name : new String[] { "talents", "buffs" }) {
			Component tab = (Component) Reflect.get(window.getClass(), window, name);
			tab.setRect(tab.left(), tab.top(), width, bottom - tab.top());
		}
		Component talents = (Component) Reflect.get(window.getClass(), window, "talents");
		ScrollPane pane = (ScrollPane) Reflect.get(talents, "pane");
		pane.scrollTo(0, Math.max(0, pane.content().height() - pane.height()));
		Reflect.call(talents, "layout", new Class<?>[0]);
	}

	/**
	 * Where the buttons along the top of the hero window's stats tab [statsTab] start, or [width] when there are none.
	 */
	@SuppressWarnings("unchecked")
	static float headerButtonsLeft(Object statsTab, float width) throws ReflectiveOperationException {
		float left = width;
		for (Gizmo member : Reflect.members(statsTab)) {
			if (member instanceof IconButton && ((Component) member).top() < HEADER_BUTTON / 2f) left = Math.min(left, ((Component) member).left());
		}
		return left - GAP;
	}

	/**
	 * Narrows the hero's title on the stats tab [statsTab] to end at [right].
	 */
	@SuppressWarnings("unchecked")
	static void fitTitle(Object statsTab, float right) throws ReflectiveOperationException {
		for (Gizmo member : Reflect.members(statsTab)) {
			if (!(member instanceof Component) || member instanceof IconButton || member instanceof RenderedTextBlock) continue;
			Component title = (Component) member;
			if (title.top() > 1) continue;
			title.setRect(title.left(), title.top(), Math.max(10, right - title.left()), 0);
			return;
		}
	}

	/**
	 * Builds the stats tab again for the chosen tab. Every tab has the same height, so the window stays as it is.
	 */
	private static void reload(Group tab) {
		try {
			Reflect.call(tab, "initialize", new Class<?>[0]);
		} catch (Throwable e) {
			Log.e(TAG, "Could not switch tabs", e);
		}
	}

	/**
	 * Where and how big the rows go, the way the game lays out its own.
	 */
	private static final class Layout {
		final Group group;
		final int width;
		final float valueX;
		final float rowHeight;

		Layout(Group group, int width, float valueX, float rowHeight) {
			this.group = group;
			this.width = width;
			this.valueX = valueX;
			this.rowHeight = rowHeight;
		}

		/**
		 * Adds tab [tab] from [top] and returns where it ends.
		 */
		float build(int tab, float top) {
			float pos = top;
			for (CharacterWindow.HeroStat row : rows(Dungeon.hero, tab)) {
				addRow(group, row.icon, row.label, row.value, pos, valueX, width, rowHeight);
				pos += rowHeight;
			}
			if (tab == STATS) return HungerWindow.addCurrentBar(group, 0, pos + GAP, width);
			if (tab == RUN) return addHunger(pos + GAP);
			return pos;
		}

		/**
		 * The hunger section: tapping it opens the hunger settings when the Hunger editor is on, or just the bar without it.
		 */
		private float addHunger(float top) {
			if (!EditorSwitches.hunger()) return HungerWindow.addCurrentBar(group, 0, top, width);
			float bottom = HungerWindow.addSummary(group, 0, top, width);
			Button area = new Button() {
				@Override
				public void onClick() {
					for (Group parent = group.parent; parent != null; parent = parent.parent) {
						if (parent instanceof Window) ((Window) parent).hide();
					}
					HungerWindow.open(CloverlordMenu::showHeroWindow);
				}
			};
			area.setRect(0, top, width, bottom - top);
			group.add(area);
			return bottom;
		}
	}

	/**
	 * An icon, a label and its value, sized down until each fits its column, like the game's own rows.
	 */
	private static void addRow(Group tab, Image icon, String label, String value, float top, float valueX, int width, float rowHeight) {
		if (icon != null) {
			float scale = Math.min(1, ICON_SIZE / Math.max(icon.width(), icon.height()));
			icon.scale.set(scale, scale);
			icon.x = (ICON_SPACE - icon.width()) / 2f;
			icon.y = top + (rowHeight - icon.height()) / 2f;
			PixelScene.align(icon);
			tab.add(icon);
		}
		RenderedTextBlock left = fitted(label, valueX - GAP - ICON_SPACE);
		left.setPos(ICON_SPACE, top + (rowHeight - left.height()) / 2f);
		PixelScene.align(left);
		tab.add(left);
		RenderedTextBlock right = fitted(value, width - valueX);
		right.setPos(valueX, top + (rowHeight - right.height()) / 2f);
		PixelScene.align(right);
		tab.add(right);
	}

	private static RenderedTextBlock fitted(String text, float width) {
		RenderedTextBlock block = PixelScene.renderTextBlock(text, TEXT_SIZE);
		for (int size = TEXT_SIZE - 1; block.width() > width && size >= 4; size--) block = PixelScene.renderTextBlock(text, size);
		return block;
	}

	/**
	 * The rows of tab [tab]: the hero's stats, senses, modifiers, resistances, or the run.
	 */
	static List<CharacterWindow.HeroStat> rows(Hero hero, int tab) {
		List<CharacterWindow.HeroStat> rows = new ArrayList<>();
		if (tab == STATS) {
			rows.add(row(StatIcons.item(StatIcons.POTION_HEALING), "Health", hero.HP + " / " + hero.HT));
			rows.add(row(StatIcons.item(StatIcons.POTION_EXP), "Experience", hero.exp + " / " + hero.maxExp()));
			rows.addAll(CharacterWindow.heroStats(hero));
			return rows;
		}
		if (tab == SENSES) {
			rows.add(row(StatIcons.buff(StatIcons.BUFF_LIGHT), "Vision", ExtraStats.vision(hero) + " tiles"));
			rows.add(row(StatIcons.buff(StatIcons.BUFF_MIND_VISION), "Search range", ExtraStats.searchRange(hero) + " tiles"));
			int searchChance = HeroExtras.mod(HeroExtras.Mod.SEARCH_CHANCE);
			rows.add(row(StatIcons.buff(StatIcons.BUFF_FORESIGHT), "Search chance", searchChance == 0 ? "Normal" : signed(searchChance) + "%"));
			rows.add(row(StatIcons.buff(StatIcons.BUFF_INVISIBLE), "Stealth", StatsWindow.number(ExtraStats.stealth(hero))));
			rows.add(row(StatIcons.item(StatIcons.RING_WEALTH), "Luck", signed(ExtraStats.ringLevel(hero, HeroExtras.Mod.LUCK))));
			rows.add(row(StatIcons.item(StatIcons.RING_ARCANA), "Enchant power", signed(ExtraStats.ringLevel(hero, HeroExtras.Mod.ENCHANT_POWER))));
			return rows;
		}
		if (tab == MODS) {
			for (HeroExtras.Mod mod : HeroExtras.Mod.in(HeroExtras.Group.RINGS)) {
				int level = ExtraStats.ringLevel(hero, mod);
				if (level != 0) rows.add(row(CharacterWindow.modIcon(mod), "Ring of " + mod.label, signed(level)));
			}
			for (HeroExtras.Mod mod : OTHER_MODS) {
				int value = HeroExtras.mod(mod);
				if (value != 0) rows.add(row(CharacterWindow.modIcon(mod), mod.label, signed(value) + "%"));
			}
			if (rows.isEmpty()) rows.add(row(null, "No modifiers", ""));
			return rows;
		}
		if (tab == RESIST) {
			rows.addAll(ExtraStats.resistances(hero));
			if (rows.isEmpty()) rows.add(row(null, "None", ""));
			return rows;
		}
		rows.add(row(StatIcons.icon(Icons.COIN_SML), "Gold collected", String.valueOf(Statistics.goldCollected)));
		rows.add(row(StatIcons.icon(Icons.DEPTH), "Maximum depth", String.valueOf(Statistics.deepestFloor)));
		rows.add(row(StatIcons.item(StatIcons.SCROLL_IDENTIFY), "Seed", DungeonSeed.convertToCode(Dungeon.seed)));
		return rows;
	}

	private static CharacterWindow.HeroStat row(Image icon, String label, String value) {
		return new CharacterWindow.HeroStat(icon, label, value);
	}

	private static String signed(int value) {
		return (value > 0 ? "+" : "") + value;
	}
}
