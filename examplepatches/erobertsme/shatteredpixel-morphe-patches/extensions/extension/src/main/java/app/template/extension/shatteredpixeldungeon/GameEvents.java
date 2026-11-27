package app.template.extension.shatteredpixeldungeon;

import android.util.Log;

import com.watabou.noosa.Game;

/**
 * Game moments that several features react to, so each feature updates only when something it shows has changed. Each feature reacts on
 * its own, so one going wrong never stops the others or the game.
 */
@SuppressWarnings("unused")
public final class GameEvents {

	private GameEvents() {
	}

	/**
	 * Called at the end of GameScene.create.
	 */
	public static void onSceneCreated(Object scene) {
		safely(() -> QuantumChest.onSceneCreated(scene));
		safely(() -> CustomItemTags.onSceneCreated(scene));
		safely(() -> ScreenTags.onSceneCreated(scene));
		safely(() -> GameCapture.onSceneCreated(scene));
		safely(ShopkeeperRules::applySoldItems);
	}

	/**
	 * Called at the end of GameScene.layoutTags, whenever the game lays out its tags.
	 */
	public static void afterLayoutTags() {
		safely(QuickslotRow::verifyRow);
		safely(ForceAttack::afterLayoutTags);
		safely(GameTags::afterLayoutTags);
	}

	/**
	 * Called at the end of QuickSlotButton.refresh, which the game runs whenever the hero's items change.
	 */
	public static void onItemsChanged() {
		safely(CustomItemTags.LIST::refresh);
		safely(QuickslotRow::verifyRow);
	}

	/**
	 * Called at the end of Hero.ready, when the hero waits for your next move.
	 */
	public static void onHeroReady() {
		Game.runOnRenderThread(() -> {
			safely(ResumePath::refresh);
			safely(WaitCancel::onHeroReady);
		});
	}

	/**
	 * Called at the start of Hero.busy, when the hero starts an action.
	 */
	public static void onHeroBusy() {
		if (ResumePath.isShown()) Game.runOnRenderThread(() -> safely(ResumePath::clear));
		if (PathPreview.isShown()) Game.runOnRenderThread(() -> safely(PathPreview::clear));
	}

	/**
	 * Called at the end of GameScene.gameOver.
	 */
	public static void onGameOver() {
		safely(ScreenTags::refresh);
		safely(PathPreview::clear);
	}

	private static void safely(Runnable reaction) {
		try {
			reaction.run();
		} catch (Throwable e) {
			Log.e("GameEvents", "A feature failed to react", e);
		}
	}
}
