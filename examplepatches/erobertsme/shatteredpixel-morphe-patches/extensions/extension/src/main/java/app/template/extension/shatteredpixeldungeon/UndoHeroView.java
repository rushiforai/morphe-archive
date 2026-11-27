package app.template.extension.shatteredpixeldungeon;

import android.util.Log;

import com.shatteredpixel.shatteredpixeldungeon.Assets;
import com.shatteredpixel.shatteredpixeldungeon.actors.hero.HeroClass;
import com.shatteredpixel.shatteredpixeldungeon.scenes.PixelScene;
import com.shatteredpixel.shatteredpixeldungeon.sprites.HeroSprite;
import com.shatteredpixel.shatteredpixeldungeon.sprites.ItemSprite;
import com.shatteredpixel.shatteredpixeldungeon.sprites.ItemSpriteSheet;
import com.shatteredpixel.shatteredpixeldungeon.ui.BuffIcon;
import com.shatteredpixel.shatteredpixeldungeon.ui.ItemSlot;
import com.shatteredpixel.shatteredpixeldungeon.ui.RenderedTextBlock;
import com.shatteredpixel.shatteredpixeldungeon.ui.TalentIcon;
import com.shatteredpixel.shatteredpixeldungeon.windows.WndTitledMessage;
import com.watabou.input.PointerEvent;
import com.watabou.noosa.BitmapText;
import com.watabou.noosa.ColorBlock;
import com.watabou.noosa.Game;
import com.watabou.noosa.Gizmo;
import com.watabou.noosa.Image;
import com.watabou.noosa.PointerArea;

import java.util.List;

/**
 * The hero's portrait, health, experience, level and status icons in a save or undo step, laid out like the game's status pane, and the
 * hero's belongings and talents there. Everything is drawn from the save's [HeroCard]; the hero itself is never rebuilt.
 */
final class UndoHeroView {

	static final float HEIGHT = 30;
	private static final float PORTRAIT_WIDTH = 24;
	private static final float PORTRAIT_HEIGHT = 26;
	private static final float BAR_GAP = 3;
	private static final float HP_HEIGHT = 7;
	private static final float XP_HEIGHT = 3;
	private static final int FRAME_COLOR = 0xFF2A2622;
	private static final int HP_BACK = 0xFF3B0D0D;
	private static final int HP_FILL = 0xFFC83232;
	private static final int SHIELD_FILL = 0xFFB4B4B4;
	private static final int XP_BACK = 0xFF2E2A10;
	private static final int XP_FILL = 0xFFFFFF44;
	private static final int LEVEL_COLOR = 0xFFFF44;
	private static final int SLOT_GAP = 1;
	private static final int MAX_SLOT = 20;
	private static final int MIN_SLOT = 12;
	private static final int SLOT_NORMAL = 0x9953564D;
	private static final int SLOT_EQUIPPED = 0x9991938C;
	private static final int STATUS_SIZE = 7;
	private static final int STATUS_GAP = 1;
	private static final int STATUS_LEFT = 1;
	private static final int STATUS_TOP = 2;
	private static final int STATUS_FADE = 0xCC666666;

	private UndoHeroView() {
	}

	/**
	 * Adds the hero section to [out], [width] wide with its top left corner at [x], [y].
	 */
	static void build(List<Gizmo> out, HeroCard card, float x, float y, float width) {
		ColorBlock frame = new ColorBlock(PORTRAIT_WIDTH, PORTRAIT_HEIGHT, FRAME_COLOR);
		frame.x = x;
		frame.y = y;
		out.add(frame);
		try {
			Image avatar = HeroSprite.avatar(HeroClass.valueOf(card.heroClass), card.tier);
			avatar.x = x + (PORTRAIT_WIDTH - avatar.width()) / 2f;
			avatar.y = y + (PORTRAIT_HEIGHT - avatar.height()) / 2f - 2;
			PixelScene.align(avatar);
			out.add(avatar);
		} catch (Throwable e) {
			Log.e("UndoHeroView", "Could not draw the hero", e);
		}
		RenderedTextBlock level = PixelScene.renderTextBlock(String.valueOf(card.level), 6);
		level.hardlight(LEVEL_COLOR);
		level.setPos(x + PORTRAIT_WIDTH - level.width() - 1, y + PORTRAIT_HEIGHT - level.height() - 1);
		PixelScene.align(level);
		out.add(level);
		out.add(new PointerArea(x, y, PORTRAIT_WIDTH, PORTRAIT_HEIGHT) {
			@Override
			public void onClick(PointerEvent event) {
				showTalents(card);
			}
		});

		float barLeft = x + PORTRAIT_WIDTH + BAR_GAP;
		float barWidth = width - PORTRAIT_WIDTH - BAR_GAP;
		int max = Math.max(1, card.ht);
		out.add(block(barLeft, y, barWidth, HP_HEIGHT, HP_BACK));
		float health = barWidth * Math.min(1f, card.hp / (float) max);
		if (health > 0) out.add(block(barLeft, y, health, HP_HEIGHT, HP_FILL));
		if (card.shield > 0) {
			float shieldWidth = Math.min(barWidth - health, barWidth * card.shield / (float) max);
			if (shieldWidth > 0) out.add(block(barLeft + health, y, shieldWidth, HP_HEIGHT, SHIELD_FILL));
		}
		RenderedTextBlock hp = PixelScene.renderTextBlock(card.hp + "/" + card.ht + (card.shield > 0 ? "+" + card.shield : ""), 6);
		hp.setPos(barLeft + (barWidth - hp.width()) / 2f, y + (HP_HEIGHT - hp.height()) / 2f);
		PixelScene.align(hp);
		out.add(hp);

		float xpTop = y + HP_HEIGHT + 2;
		out.add(block(barLeft, xpTop, barWidth, XP_HEIGHT, XP_BACK));
		int needed = Math.max(1, card.maxExp);
		float earned = barWidth * Math.min(1f, card.exp / (float) needed);
		if (earned > 0) out.add(block(barLeft, xpTop, earned, XP_HEIGHT, XP_FILL));
		RenderedTextBlock xp = PixelScene.renderTextBlock("XP " + card.exp + "/" + needed, 6);
		xp.hardlight(EditorWindow.DIM_COLOR);
		xp.setPos(barLeft, xpTop + XP_HEIGHT + 1);
		PixelScene.align(xp);
		out.add(xp);
		statuses(out, card, barLeft, xp.bottom() + 1, barWidth);
	}

	/**
	 * The status icons in a row from [x], [y] in [width], laid out like the game's small status icons: greyed by time passed, and pushed
	 * together when they don't fit. Tapping one shows what it is.
	 */
	private static void statuses(List<Gizmo> out, HeroCard card, float x, float y, float width) {
		int count = card.statuses.size();
		float step = STATUS_SIZE + STATUS_GAP;
		float excess = count * step - 1 - width;
		if (excess > 0 && count > 1) step -= Math.min(excess / (count - 1), STATUS_SIZE * 0.5f);
		for (int i = 0; i < count; i++) {
			HeroCard.Status status = card.statuses.get(i);
			float left = x + i * step;
			if (left + step > x + width + STATUS_GAP + 1) break;
			try {
				BuffIcon icon = new BuffIcon(status.icon, false);
				if (status.tinted) icon.hardlight(status.red, status.green, status.blue);
				icon.x = left + STATUS_LEFT;
				icon.y = y + STATUS_TOP;
				PixelScene.align(icon);
				out.add(icon);
				if (status.fade > 0) out.add(block(icon.x, icon.y, icon.width(), Math.round(status.fade * icon.height()), STATUS_FADE));
			} catch (Throwable e) {
				Log.e("UndoHeroView", "Could not draw a status icon", e);
				continue;
			}
			out.add(new PointerArea(left, y, STATUS_SIZE + STATUS_GAP, STATUS_SIZE + 5) {
				@Override
				public void onClick(PointerEvent event) {
					BuffIcon icon = new BuffIcon(status.icon, true);
					if (status.tinted) icon.hardlight(status.red, status.green, status.blue);
					showDetails(icon, status.name, status.description);
				}
			});
		}
	}

	/**
	 * A window with [icon], [name] and [text], the way the game shows what something is.
	 */
	static void showDetails(Image icon, String name, String text) {
		Game.scene().addToFront(new WndTitledMessage(icon, name, text));
	}


	private static ColorBlock block(float x, float y, float width, float height, int color) {
		ColorBlock block = new ColorBlock(width, height, color);
		block.x = x;
		block.y = y;
		return block;
	}

	static void showTalents(HeroCard card) {
		Game.scene().addToFront(new TalentsWindow(card));
	}

	/**
	 * Adds a slot for each item to [out], filling a [width] by [height] area from [x], [y]. Tapping a slot shows the item's details.
	 */
	static void slots(List<Gizmo> out, List<HeroCard.Thing> things, float x, float y, float width, float height) {
		if (things.isEmpty()) {
			RenderedTextBlock none = PixelScene.renderTextBlock("Nothing carried", 6);
			none.hardlight(EditorWindow.DIM_COLOR);
			none.setPos(x, y);
			out.add(none);
			return;
		}
		int size = MAX_SLOT;
		while (size > MIN_SLOT) {
			int columns = Math.max(1, (int) ((width + SLOT_GAP) / (size + SLOT_GAP)));
			int rows = (things.size() + columns - 1) / columns;
			if (rows * (size + SLOT_GAP) <= height) break;
			size--;
		}
		int columns = Math.max(1, (int) ((width + SLOT_GAP) / (size + SLOT_GAP)));
		for (int i = 0; i < things.size(); i++) {
			HeroCard.Thing thing = things.get(i);
			if (thing.slot != HeroCard.SLOT_NONE) out.add(background(thing, x + (i % columns) * (size + SLOT_GAP), y + (i / columns) * (size + SLOT_GAP), size));
			ItemSlot slot = new ItemSlot() {
				@Override
				public void onClick() {
					showDetails(new ItemSprite(thing.image, glowing(thing)), thing.name, thing.info);
				}
			};
			try {
				show(slot, thing);
			} catch (Throwable e) {
				Log.e("UndoHeroView", "Could not draw an item", e);
			}
			slot.setRect(x + (i % columns) * (size + SLOT_GAP), y + (i / columns) * (size + SLOT_GAP), size, size);
			out.add(slot);
		}
	}

	/**
	 * The slot's background, colored like the game's inventory: lighter when worn, red when known to be cursed, blue when known not to be
	 * and purple when not identified.
	 */
	private static ColorBlock background(HeroCard.Thing thing, float x, float y, float size) {
		ColorBlock block = block(x, y, size, size, thing.equipped ? SLOT_EQUIPPED : SLOT_NORMAL);
		if (thing.slot == HeroCard.SLOT_CURSED) {
			block.ra = 0.3f;
			block.ga = -0.15f;
			block.ba = -0.15f;
		} else if (thing.slot == HeroCard.SLOT_UNCURSED) {
			block.ba = 0.3f;
			block.ra = -0.1f;
		} else if (thing.slot == HeroCard.SLOT_UNKNOWN) {
			block.ra = 0.35f;
			block.ba = 0.35f;
		}
		return block;
	}

	private static ItemSprite.Glowing glowing(HeroCard.Thing thing) {
		return thing.glow == HeroCard.NO_COLOR ? null : new ItemSprite.Glowing(thing.glow, thing.glowPeriod);
	}

	/**
	 * Fills the game's item [slot] with [thing]: its sprite and the texts and icon in its corners, as the game would for the item.
	 */
	private static void show(ItemSlot slot, HeroCard.Thing thing) throws ReflectiveOperationException {
		slot.enable(true);
		ItemSprite sprite = (ItemSprite) Reflect.get(ItemSlot.class, slot, "sprite");
		sprite.view(thing.image, glowing(thing));
		sprite.visible(true);
		corner(slot, "status", thing.status, thing.statusColor);
		corner(slot, "extra", thing.extra, thing.extraColor);
		corner(slot, "level", thing.level, thing.levelColor);
		if (thing.icon < 0) return;
		Image icon = new Image(Assets.Sprites.ITEM_ICONS);
		icon.frame(ItemSpriteSheet.Icons.film.get(thing.icon));
		slot.add(icon);
		Reflect.set(ItemSlot.class, slot, "itemIcon", icon);
	}

	private static void corner(ItemSlot slot, String name, String text, int color) throws ReflectiveOperationException {
		BitmapText corner = (BitmapText) Reflect.get(ItemSlot.class, slot, name);
		corner.text(text);
		corner.measure();
		if (color == HeroCard.NO_COLOR) corner.resetColor();
		else corner.hardlight(color);
		corner.visible = true;
	}

	/**
	 * The hero's talents at an undo step or in a save. Tapping a talent shows what it does. The talents are placed once the window has its
	 * size and place, since their scrolling area follows the window. Outside a game, where the game draws some talents for the hero class
	 * being picked, that class is the saved hero's while the window is open.
	 */
	static final class TalentsWindow extends EditorWindow {

		private static final int BUTTON_WIDTH = 20;
		private static final int BUTTON_HEIGHT = 26;
		private static final int FILL_COLOR = 0xFFFFFF44;
		private static final int SEPARATOR_COLOR = 0xFF000000;

		private final HeroCard card;

		TalentsWindow(HeroCard card) {
			super();
			this.card = card;
			addTitle("Talents");
			boolean any = false;
			for (int tier = 0; tier < card.talents.size(); tier++) {
				List<HeroCard.TalentEntry> entries = card.talents.get(tier);
				if (entries.isEmpty()) continue;
				addTier(tier + 1, entries);
				any = true;
			}
			if (!any) addHint("No talents.");
			finish();
		}

		/**
		 * A tier of talents laid out like the game's talent pane: its title, then its talents spread evenly, then a separator.
		 */
		private void addTier(int tier, List<HeroCard.TalentEntry> entries) {
			pos += 2;
			RenderedTextBlock title = PixelScene.renderTextBlock("Tier " + tier, 9);
			title.hardlight(TITLE_COLOR);
			title.setPos((WIDTH - title.width()) / 2f, pos);
			PixelScene.align(title);
			add(title);
			float gap = (WIDTH - entries.size() * BUTTON_WIDTH) / (float) (entries.size() + 1);
			float left = gap;
			float top = title.bottom() + 4;
			for (HeroCard.TalentEntry entry : entries) {
				addTalent(entry, (int) left, (int) top);
				left += BUTTON_WIDTH + gap;
			}
			pos = top + BUTTON_HEIGHT;
			ColorBlock separator = new ColorBlock(WIDTH, 1, SEPARATOR_COLOR);
			separator.y = pos + 2;
			add(separator);
			pos += 3;
		}

		/**
		 * A talent drawn like the game's talent button: its frame for the talent's most points, its icon, and a bar filled by its points.
		 * Tapping it shows what the talent does.
		 */
		private void addTalent(HeroCard.TalentEntry entry, float x, float y) {
			int max = Math.max(1, entry.maxPoints);
			ColorBlock fill = new ColorBlock(Math.min(1f, entry.points / (float) max) * (BUTTON_WIDTH - 4), 5, FILL_COLOR);
			fill.x = x + 2;
			fill.y = y + BUTTON_WIDTH - 1;
			add(fill);
			Image frame = new Image(Assets.Interfaces.TALENT_BUTTON);
			frame.frame(BUTTON_WIDTH * (max - 1), 0, BUTTON_WIDTH, BUTTON_HEIGHT);
			frame.x = x;
			frame.y = y;
			add(frame);
			TalentIcon icon = new TalentIcon(entry.icon);
			icon.x = x + 2;
			icon.y = y + 2;
			PixelScene.align(icon);
			add(icon);
			add(new PointerArea(x, y, BUTTON_WIDTH, BUTTON_HEIGHT) {
				@Override
				public void onClick(PointerEvent event) {
					showDetails(new TalentIcon(entry.icon), entry.name, entry.description);
				}
			});
		}

		@Override
		protected void reopen() {
			show(new TalentsWindow(card));
		}
	}
}
