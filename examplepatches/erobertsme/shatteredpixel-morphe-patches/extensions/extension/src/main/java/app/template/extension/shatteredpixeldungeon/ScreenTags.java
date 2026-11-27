package app.template.extension.shatteredpixeldungeon;

import com.watabou.noosa.Game;
import com.watabou.noosa.Scene;

import java.util.ArrayList;
import java.util.List;

/**
 * Every tag the patches add to the game screen, for the game scene, the tags editor and the main menu's stand-in game screen.
 */
final class ScreenTags {

	private static Scene shownScene;

	private ScreenTags() {
	}

	/**
	 * Every tag whose patch is included, in the order the tags editor lists them.
	 */
	static List<ScreenTag> all() {
		List<ScreenTag> all = new ArrayList<>();
		if (UndoHistory.isAvailable()) all.add(UndoTags.TAG);
		if (!QolSettings.isAvailable()) return all;
		all.add(ForceAttack.TAG);
		all.addAll(CustomItemTags.LIST.tags());
		all.addAll(QuickTags.LIST.tags());
		return all;
	}

	/**
	 * The tags whose feature is switched on, for the tags editor and the main menu's stand-in game screen.
	 */
	static List<ScreenTag> enabled() {
		List<ScreenTag> enabled = new ArrayList<>();
		for (ScreenTag tag : all()) {
			if (tag.isEnabled()) enabled.add(tag);
		}
		return enabled;
	}

	/**
	 * Called at the end of GameScene.create, from each patch with tags. Puts every tag on [scene] once.
	 */
	static void onSceneCreated(Object scene) {
		if (!(scene instanceof Scene) || scene == shownScene) return;
		shownScene = (Scene) scene;
		rebuild();
	}

	/**
	 * Puts every tag on the game scene again. Runs when the scene is made and when a tag is added or deleted.
	 */
	static void rebuild() {
		Scene scene = shownScene;
		if (scene == null || Game.scene() != scene) return;
		for (ScreenTag tag : all()) tag.addTo(scene);
	}

	/**
	 * Shows or hides every tag. Runs when the game ends.
	 */
	static void refresh() {
		for (ScreenTag tag : all()) tag.refresh();
	}
}
