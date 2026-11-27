package app.template.extension.shatteredpixeldungeon;

import com.shatteredpixel.shatteredpixeldungeon.scenes.GameScene;
import com.shatteredpixel.shatteredpixeldungeon.scenes.PixelScene;
import com.shatteredpixel.shatteredpixeldungeon.ui.RenderedTextBlock;
import com.shatteredpixel.shatteredpixeldungeon.utils.GLog;
import com.shatteredpixel.shatteredpixeldungeon.windows.WndInfoCell;
import com.watabou.input.PointerEvent;
import com.watabou.noosa.Camera;
import com.watabou.noosa.Game;
import com.watabou.noosa.Gizmo;
import com.watabou.noosa.PointerArea;
import com.watabou.noosa.Scene;
import com.watabou.utils.PointF;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

/**
 * Edit Floor mode for the floor editor. The game is saved when it starts. Tapping a tile shows its info with an
 * Edit button and buttons for everything on it, and dragging moves the view. Save keeps every change, Cancel
 * reloads the game as it was when edit mode started.
 */
final class FloorEditSession {

	private static final int TILE_SIZE = 16;
	private static final int BUTTON_HEIGHT = 20;
	private static final int BUTTON_WIDTH = 50;
	private static final int MARGIN = 4;
	private static final int TEXT_GAP = 6;
	private static final String SNAPSHOT_FOLDER = "floor-edit-snapshot";

	private static FloorEditSession active;

	private final Scene scene;
	private final List<Gizmo> overlay = new ArrayList<>();
	private final File snapshot;
	private final boolean canUndo;
	private float downX;
	private float downY;
	private float lastX;
	private float lastY;
	private boolean dragged;

	private FloorEditSession(File snapshot, boolean canUndo) {
		this.scene = Game.scene();
		this.snapshot = snapshot;
		this.canUndo = canUndo;
	}

	static boolean isActive() {
		return active != null && active.scene == Game.scene();
	}

	static void start() {
		if (isActive()) return;
		File folder = snapshotFolder();
		boolean saved = folder != null && GameSaves.snapshot(folder);
		active = new FloorEditSession(folder, saved);
		active.buildOverlay();
		if (!saved) GLog.w("The game could not be saved, so Cancel won't be able to undo changes.");
	}

	private static File snapshotFolder() {
		File cache = SaveLocation.cacheDir();
		return cache == null ? null : new File(cache, SNAPSHOT_FOLDER);
	}

	private void buildOverlay() {
		Camera ui = PixelScene.uiCamera;
		float width = ui.width;
		float buttonsTop = Math.min(ui.height - 30, ScreenLayout.aboveToolbar()) - BUTTON_HEIGHT;

		RenderedTextBlock label = PixelScene.renderTextBlock("Editing floor  -  tap a tile to edit it, drag to look around", 9);
		label.hardlight(0xFFFF44);
		label.maxWidth((int) (width - 2 * MARGIN));
		label.setPos((width - label.width()) / 2f, buttonsTop - TEXT_GAP - label.height());
		PixelScene.align(label);

		PointerArea area = new PointerArea(0, 0, width, label.top() - MARGIN) {
			@Override
			public void onPointerDown(PointerEvent event) {
				downX = lastX = event.current.x;
				downY = lastY = event.current.y;
				dragged = false;
			}

			@Override
			public void onDrag(PointerEvent event) {
				float dx = event.current.x - downX;
				float dy = event.current.y - downY;
				if (!dragged && dx * dx + dy * dy < dragThreshold() * dragThreshold()) return;
				dragged = true;
				Camera main = Camera.main;
				main.shift(new PointF((lastX - event.current.x) / main.zoom, (lastY - event.current.y) / main.zoom));
				lastX = event.current.x;
				lastY = event.current.y;
			}

			@Override
			public void onClick(PointerEvent event) {
				if (dragged) return;
				tap(event.current);
			}
		};
		addToOverlay(area);
		addToOverlay(label);

		TintedButton cancel = TintedButton.cancel("Cancel", this::askCancel);
		cancel.setRect(MARGIN, buttonsTop, BUTTON_WIDTH, BUTTON_HEIGHT);
		addToOverlay(cancel);

		TintedButton save = TintedButton.finish("Save", this::save);
		save.setRect(width - MARGIN - BUTTON_WIDTH, buttonsTop, BUTTON_WIDTH, BUTTON_HEIGHT);
		addToOverlay(save);
	}

	private static float dragThreshold() {
		return PixelScene.defaultZoom * 8;
	}

	private void addToOverlay(Gizmo gizmo) {
		gizmo.camera = PixelScene.uiCamera;
		scene.add(gizmo);
		overlay.add(gizmo);
	}

	private void tap(PointF screen) {
		int cell = Grid.cellAt(screen);
		if (cell >= 0) GameScene.show(new WndInfoCell(cell));
	}

	private void save() {
		if (snapshot != null) GameSaves.discardSnapshot(snapshot);
		end();
	}

	private void askCancel() {
		if (!canUndo) {
			ConfirmPrompt.ask("Cancel", "The game couldn't be saved when edit mode started, so changes can't be undone. Exit edit mode and keep them?", "Exit", this::end);
			return;
		}
		ConfirmPrompt.ask("Cancel", "Dismiss all changes and exit edit mode?", "Dismiss", () -> {
			end();
			if (!GameSaves.restoreSnapshot(snapshot)) GLog.w("The changes could not be undone.");
		});
	}

	private void end() {
		for (Gizmo gizmo : overlay) {
			gizmo.killAndErase();
			gizmo.destroy();
		}
		overlay.clear();
		if (active == this) active = null;
	}
}
