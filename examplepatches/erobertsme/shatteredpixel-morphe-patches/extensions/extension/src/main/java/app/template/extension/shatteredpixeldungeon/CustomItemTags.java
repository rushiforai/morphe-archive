package app.template.extension.shatteredpixeldungeon;

import android.util.Log;

import com.shatteredpixel.shatteredpixeldungeon.Dungeon;
import com.shatteredpixel.shatteredpixeldungeon.actors.Char;
import com.shatteredpixel.shatteredpixeldungeon.actors.hero.Hero;
import com.shatteredpixel.shatteredpixeldungeon.items.Item;
import com.shatteredpixel.shatteredpixeldungeon.levels.Level;
import com.shatteredpixel.shatteredpixeldungeon.scenes.GameScene;
import com.shatteredpixel.shatteredpixeldungeon.scenes.PixelScene;
import com.shatteredpixel.shatteredpixeldungeon.ui.Icons;
import com.shatteredpixel.shatteredpixeldungeon.ui.QuickSlotButton;
import com.watabou.noosa.Image;
import com.watabou.noosa.Gizmo;

/**
 * Item tags: toolbar tags you add for items. Each one uses its item, like a quickslot, and has its own tag style.
 * A tag belongs to a kind of item and uses the first one of that kind you carry. It hides while you carry none.
 */
@SuppressWarnings("unused")
public final class CustomItemTags {

	private static final String TAG = "CustomItemTags";
	private static final String KEY_IDS = "itemtag_list";
	private static final String KEY_NEXT = "itemtag_next";
	static final String HELD_PREFIX = "HELD:";

	/**
	 * The item tags. Each one's target is the class of its kind of item, and it shows while you carry one.
	 */
	static final TagList LIST = new TagList("itemtag", "_item", TagPlacement.Side.RIGHT, new TagList.Kind() {
		@Override
		public String name(String target) {
			Item item = held(target);
			if (item == null) item = sample(target);
			try {
				return item == null ? "Unknown item" : InventoryEditor.capitalize(item.name());
			} catch (Throwable e) {
				return "Unknown item";
			}
		}

		@Override
		public String icon(String target) {
			return HELD_PREFIX + target;
		}

		@Override
		public boolean shows(String target) {
			return held(target) != null;
		}

		@Override
		public void use(String target, IconTag tag) {
			CustomItemTags.use(target, tag);
		}
	});
	private static Gizmo markFollower;

	private CustomItemTags() {
	}

	static int add(Item item) {
		return LIST.add(item.getClass().getName());
	}

	/**
	 * The first item of [className] you carry, or null.
	 */
	static Item held(String className) {
		Hero hero = Dungeon.hero;
		if (hero == null || className == null || className.isEmpty()) return null;
		try {
			for (Item item : hero.belongings) {
				if (item != null && item.getClass().getName().equals(className)) return item;
			}
		} catch (Throwable e) {
			Log.e(TAG, "Could not search your items", e);
		}
		return null;
	}

	/**
	 * An item of [className] to show when you carry none.
	 */
	static Item sample(String className) {
		try {
			return (Item) Reflect.require(className).getDeclaredConstructor().newInstance();
		} catch (Throwable e) {
			return null;
		}
	}

	private static IconTag targetingTag;
	private static Object targetingListener;
	private static Image targetMark;
	private static Image tagMark;

	/**
	 * Uses the tag's item, like tapping a quickslot. An item that needs a target aims at your last target, marked
	 * with a crosshair, and tapping the tag again throws or zaps at it.
	 */
	private static void use(String className, IconTag tag) {
		Hero hero = Dungeon.hero;
		Item item = held(className);
		if (hero == null || item == null || !hero.isAlive() || !hero.ready) return;
		try {
			Char target = QuickSlotButton.lastTarget;
			if (targetingTag == tag && isTargeting() && target != null) {
				int cell = QuickSlotButton.autoAim(target, item);
				clearTargeting();
				GameScene.handleCell(cell != -1 ? cell : target.pos);
				return;
			}
			clearTargeting();
			if (GameScene.cancel()) return;
			item.execute(hero);
			Item.updateQuickslot();
			if (item.usesTargeting) startTargeting(tag);
		} catch (Throwable e) {
			Log.e(TAG, "Could not use " + item.getClass().getName(), e);
		}
	}

	private static void startTargeting(IconTag tag) {
		Char target = QuickSlotButton.lastTarget;
		Level level = Dungeon.level;
		if (target == null || !target.isAlive() || target.alignment == Char.Alignment.ALLY || target.sprite == null) return;
		if (level == null || target.pos < 0 || target.pos >= level.length() || !level.heroFOV[target.pos]) return;
		Object listener = currentListener();
		if (listener == null) return;
		targetingTag = tag;
		targetingListener = listener;
		targetMark = Icons.get(Icons.TARGET);
		if (target.sprite.parent != null) target.sprite.parent.addToFront(targetMark);
		tagMark = Icons.get(Icons.TARGET);
		tagMark.camera = PixelScene.uiCamera;
		if (tag.parent != null) tag.parent.addToFront(tagMark);
		updateMarks(tag);
		followMarks(tag);
	}

	private static boolean isTargeting() {
		return targetingTag != null && targetingListener != null && currentListener() == targetingListener;
	}

	private static Object currentListener() {
		return Reflect.cellListener();
	}

	private static void updateMarks(IconTag tag) {
		Char target = QuickSlotButton.lastTarget;
		if (targetMark != null && target != null && target.sprite != null) {
			targetMark.x = target.sprite.x + (target.sprite.width() - targetMark.width()) / 2f;
			targetMark.y = target.sprite.y + (target.sprite.height() - targetMark.height()) / 2f;
		}
		if (tagMark != null && tag != null) {
			tagMark.x = tag.left() + (tag.width() - tagMark.width()) / 2f;
			tagMark.y = tag.top() + (tag.height() - tagMark.height()) / 2f;
		}
	}

	/**
	 * Keeps the crosshairs on the target while aiming, and removes them once aiming ends. Only runs while aiming.
	 */
	private static void followMarks(IconTag tag) {
		if (tag.parent == null || markFollower != null) return;
		markFollower = new Gizmo() {
			@Override
			public void update() {
				super.update();
				if (isTargeting() && tag.visible && tag.parent != null) {
					updateMarks(tag);
				} else {
					clearTargeting();
				}
			}
		};
		tag.parent.add(markFollower);
	}

	private static void clearTargeting() {
		targetingTag = null;
		targetingListener = null;
		if (markFollower != null) {
			markFollower.killAndErase();
			markFollower = null;
		}
		for (Image mark : new Image[] { targetMark, tagMark }) {
			if (mark == null) continue;
			mark.killAndErase();
			mark.destroy();
		}
		targetMark = null;
		tagMark = null;
	}

	/**
	 * Called at the end of GameScene.create. Aiming from an earlier scene ends with it.
	 */
	public static void onSceneCreated(Object scene) {
		markFollower = null;
		clearTargeting();
	}
}
