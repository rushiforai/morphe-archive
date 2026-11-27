package app.template.extension.shatteredpixeldungeon;

import android.util.Log;

import com.shatteredpixel.shatteredpixeldungeon.Dungeon;
import com.shatteredpixel.shatteredpixeldungeon.actors.hero.Hero;
import com.shatteredpixel.shatteredpixeldungeon.actors.hero.HeroClass;
import com.shatteredpixel.shatteredpixeldungeon.actors.mobs.Mob;
import com.shatteredpixel.shatteredpixeldungeon.sprites.CharSprite;
import com.shatteredpixel.shatteredpixeldungeon.sprites.HeroSprite;
import com.watabou.noosa.Image;
import com.watabou.noosa.MovieClip.Animation;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

/**
 * Lets the hero look like another hero, an enemy or an NPC. The hero keeps the game's own hero sprite, so everything that expects one still
 * works; only its picture and animations are swapped, and they are swapped again whenever the game rebuilds them, such as after changing
 * armor.
 */
public final class HeroSkin {

	private static final String TAG = "HeroSkin";
	private static final String KEY = "fun_hero_sprite";
	private static final String HERO_PREFIX = "hero:";

	private static List<Skin> skins;

	/**
	 * One look the hero can have: the hero's own, another hero class, or the sprite of a creature.
	 */
	static final class Skin {
		final String id;
		final String name;
		final HeroClass heroClass;
		final Class<? extends CharSprite> sprite;

		Skin(String id, String name, HeroClass heroClass, Class<? extends CharSprite> sprite) {
			this.id = id;
			this.name = name;
			this.heroClass = heroClass;
			this.sprite = sprite;
		}

		boolean isDefault() {
			return id.isEmpty();
		}
	}

	private HeroSkin() {
	}

	/**
	 * Every look to choose from: the hero's own first, then each hero class, then every creature sprite, each sprite once.
	 */
	static synchronized List<Skin> skins() {
		if (skins != null) return skins;
		List<Skin> list = new ArrayList<>();
		list.add(new Skin("", "Your hero", null, null));
		for (HeroClass heroClass : HeroClass.values()) {
			list.add(new Skin(HERO_PREFIX + heroClass.name(), InventoryEditor.capitalize(heroClass.title()), heroClass, null));
		}
		Set<Class<?>> seen = new HashSet<>();
		seen.add(HeroSprite.class);
		for (CreatureCatalog.Entry entry : CreatureCatalog.catalog()) {
			Class<? extends CharSprite> sprite = spriteOf(entry.type);
			if (sprite == null || !seen.add(sprite) || preview(sprite) == null) continue;
			list.add(new Skin(sprite.getName(), entry.name, null, sprite));
		}
		skins = Collections.unmodifiableList(list);
		return skins;
	}

	private static Class<? extends CharSprite> spriteOf(Class<? extends Mob> type) {
		try {
			return type.getConstructor().newInstance().spriteClass;
		} catch (Throwable e) {
			return null;
		}
	}

	static Skin current() {
		String id = CloverlordSettings.getString(KEY);
		for (Skin skin : skins()) {
			if (skin.id.equals(id == null ? "" : id)) return skin;
		}
		return skins().get(0);
	}

	/**
	 * Picks [skin] and, in a game, puts it on the hero straight away.
	 */
	static void choose(Skin skin) {
		CloverlordSettings.setString(KEY, skin.id);
		Hero hero = Dungeon.hero;
		if (hero == null || !(hero.sprite instanceof HeroSprite)) return;
		try {
			HeroSprite sprite = (HeroSprite) hero.sprite;
			sprite.texture(hero.heroClass.spritesheet());
			sprite.updateArmor();
			sprite.place(hero.pos);
		} catch (Throwable e) {
			Log.e(TAG, "Could not change the hero's sprite", e);
		}
	}

	/**
	 * A picture of [skin] for the chooser.
	 */
	static Image icon(Skin skin) {
		try {
			if (skin.sprite != null) return preview(skin.sprite);
			Hero hero = Dungeon.hero;
			HeroClass heroClass = skin.heroClass != null ? skin.heroClass : hero != null ? hero.heroClass : HeroClass.values()[0];
			return HeroSprite.avatar(heroClass, hero != null ? hero.tier() : 0);
		} catch (Throwable e) {
			return null;
		}
	}

	private static CharSprite preview(Class<? extends CharSprite> type) {
		try {
			return type.getConstructor().newInstance();
		} catch (Throwable e) {
			return null;
		}
	}

	/**
	 * Called before HeroSprite.updateArmor returns, after the game has built the hero's animations. Swaps in the chosen look.
	 */
	public static void afterUpdateArmor(Object sprite) {
		if (!Fun.isAvailable() || !(sprite instanceof HeroSprite)) return;
		try {
			Skin skin = current();
			if (skin.isDefault()) return;
			HeroSprite hero = (HeroSprite) sprite;
			if (skin.heroClass != null) {
				hero.texture(skin.heroClass.spritesheet());
				return;
			}
			wear(hero, skin.sprite);
		} catch (Throwable e) {
			Log.e(TAG, "Could not dress the hero", e);
		}
	}

	/**
	 * Gives [hero] the picture and animations of [type]. A creature without an animation the hero needs uses the closest one it has. Every
	 * action gets its own copy that plays once and takes no longer than the hero's own, because the game waits for these to finish before
	 * the hero's turn goes on.
	 */
	private static void wear(HeroSprite hero, Class<? extends CharSprite> type) throws ReflectiveOperationException {
		CharSprite donor = type.getConstructor().newInstance();
		try {
			Animation idle = animation(CharSprite.class, donor, "idle");
			Animation run = animation(CharSprite.class, donor, "run");
			Animation attack = animation(CharSprite.class, donor, "attack");
			Animation zap = animation(CharSprite.class, donor, "zap");
			Animation operate = animation(CharSprite.class, donor, "operate");
			Animation die = animation(CharSprite.class, donor, "die");
			if (idle == null) return;
			Animation strike = attack != null ? attack : idle;

			Reflect.set(CharSprite.class, hero, "attack", action(strike, animation(CharSprite.class, hero, "attack")));
			Reflect.set(CharSprite.class, hero, "zap", action(zap != null ? zap : strike, animation(CharSprite.class, hero, "zap")));
			Reflect.set(CharSprite.class, hero, "operate", action(operate != null ? operate : strike, animation(CharSprite.class, hero, "operate")));
			Reflect.set(HeroSprite.class, hero, "read", action(operate != null ? operate : strike, animation(HeroSprite.class, hero, "read")));
			Reflect.set(CharSprite.class, hero, "die", action(die != null ? die : idle, animation(CharSprite.class, hero, "die")));
			Reflect.set(CharSprite.class, hero, "idle", idle);
			Reflect.set(CharSprite.class, hero, "run", run != null ? run : idle);
			Reflect.set(HeroSprite.class, hero, "fly", idle);
			Reflect.set(Image.class, hero, "texture", Reflect.get(Image.class, donor, "texture"));
			Hero owner = Dungeon.hero;
			if (owner == null || owner.isAlive()) hero.idle();
		} finally {
			donor.destroy();
		}
	}

	private static Animation animation(Class<?> type, Object sprite, String name) throws ReflectiveOperationException {
		return (Animation) Reflect.get(type, sprite, name);
	}

	/**
	 * A copy of [source] that plays once, sped up when needed so it is no slower than [timing], the hero's own animation for that action.
	 */
	private static Animation action(Animation source, Animation timing) {
		Animation copy = source.clone();
		copy.looped = false;
		if (timing == null || copy.frames == null || copy.frames.length == 0) return copy;
		float limit = timing.delay * timing.frames.length;
		copy.delay = Math.min(copy.delay, limit / copy.frames.length);
		return copy;
	}
}
