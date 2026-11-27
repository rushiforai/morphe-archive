package app.template.extension.shatteredpixeldungeon;

import android.util.Log;

import com.shatteredpixel.shatteredpixeldungeon.Dungeon;
import com.shatteredpixel.shatteredpixeldungeon.GamesInProgress;
import com.shatteredpixel.shatteredpixeldungeon.Statistics;
import com.shatteredpixel.shatteredpixeldungeon.actors.Actor;
import com.shatteredpixel.shatteredpixeldungeon.actors.mobs.Mob;
import com.shatteredpixel.shatteredpixeldungeon.scenes.GameScene;
import com.shatteredpixel.shatteredpixeldungeon.scenes.InterlevelScene;
import com.shatteredpixel.shatteredpixeldungeon.scenes.PixelScene;
import com.shatteredpixel.shatteredpixeldungeon.ui.GameLog;
import com.watabou.noosa.Game;
import com.watabou.noosa.Scene;

/**
 * Continues the game in progress from its save files without the game's loading screen. The screen dims quickly, the files are read the
 * same way the loading screen reads them while the game scene is made again, then the game brightens quickly. If reading fails, the game
 * scene sees no hero and makes nothing, and the game's own loading screen tries again and reports the problem.
 */
final class QuickContinue {

	private static final String TAG = "QuickContinue";
	private static final float FADE_SECONDS = 0.2f;
	private static final float DIM = 0.5f;

	private QuickContinue() {
	}

	static void start() {
		InterlevelScene.mode = InterlevelScene.Mode.CONTINUE;
		Scene current = Game.scene();
		if (current == null) {
			reload();
			return;
		}
		ScreenFade.out(current, FADE_SECONDS, DIM, QuickContinue::reload);
	}

	private static void reload() {
		boolean[] failed = { false };
		PixelScene.noFade = true;
		Game.switchScene(GameScene.class, new Game.SceneChangeCallback() {
			@Override
			public void beforeCreate() {
				try {
					read();
				} catch (Throwable e) {
					Log.e(TAG, "Could not continue the game, so the loading screen tries", e);
					failed[0] = true;
					Dungeon.hero = null;
				}
			}

			@Override
			public void afterCreate() {
				if (!failed[0]) {
					ScreenFade.in(Game.scene(), FADE_SECONDS, DIM);
					return;
				}
				PixelScene.noFade = false;
				Game.switchScene(InterlevelScene.class);
			}
		});
	}

	private static void read() throws java.io.IOException {
		Actor.fixTime();
		Mob.clearHeldAllies();
		GameLog.wipe();
		int slot = GamesInProgress.curSlot;
		Dungeon.loadGame(slot);
		if (Dungeon.depth == -1) {
			Dungeon.depth = Statistics.deepestFloor;
			Dungeon.switchLevel(Dungeon.loadLevel(slot), -1);
			return;
		}
		Dungeon.switchLevel(Dungeon.loadLevel(slot), Dungeon.hero.pos);
	}
}
