package app.template.extension.shatteredpixeldungeon;

import android.util.Log;

import com.shatteredpixel.shatteredpixeldungeon.Dungeon;
import com.shatteredpixel.shatteredpixeldungeon.actors.blobs.Blob;
import com.shatteredpixel.shatteredpixeldungeon.items.Heap;
import com.shatteredpixel.shatteredpixeldungeon.levels.Level;
import com.shatteredpixel.shatteredpixeldungeon.levels.traps.Trap;
import com.shatteredpixel.shatteredpixeldungeon.plants.Plant;
import com.shatteredpixel.shatteredpixeldungeon.scenes.GameScene;
import com.shatteredpixel.shatteredpixeldungeon.scenes.PixelScene;
import com.shatteredpixel.shatteredpixeldungeon.ui.RedButton;
import com.shatteredpixel.shatteredpixeldungeon.ui.RenderedTextBlock;
import com.watabou.input.PointerEvent;
import com.watabou.noosa.Camera;
import com.watabou.noosa.Game;
import com.watabou.noosa.Gizmo;
import com.watabou.noosa.PointerArea;
import com.watabou.noosa.Scene;
import com.watabou.utils.PointF;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

/**
 * Drag-to-draw for the floor editor. Every tile is recorded the first time it is painted, so Cancel can put the
 * floor back exactly as it was. Finish keeps the changes.
 */
final class DrawingSession {

	private static final String TAG = "DrawingSession";
	private static final int TILE_SIZE = 16;
	private static final int BUTTON_HEIGHT = 20;
	private static final int MARGIN = 4;
	private static final String[] BRUSH_NAMES = { "Floor", "Wall", "Eraser", "Move View" };

	static final int FLOOR = 0;
	static final int WALL = 1;
	static final int ERASER = 2;
	static final int MOVE_VIEW = 3;

	private static final class Original {
		final int terrain;
		final Trap trap;
		final Plant plant;
		final Map<Blob, Integer> effects = new HashMap<>();
		boolean erased;

		Original(int terrain, Trap trap, Plant plant) {
			this.terrain = terrain;
			this.trap = trap;
			this.plant = plant;
		}
	}

	private static DrawingSession active;

	private final Scene scene;
	private final Map<Integer, Original> originals = new LinkedHashMap<>();
	private final List<Gizmo> overlay = new ArrayList<>();
	private int brush;
	private int lastCell = -1;
	private float lastX;
	private float lastY;
	private RenderedTextBlock label;
	private final List<RedButton> brushButtons = new ArrayList<>();

	private DrawingSession(int brush) {
		this.scene = Game.scene();
		this.brush = brush;
	}

	static void start(int brush) {
		if (active != null && active.scene == Game.scene()) {
			active.setBrush(brush);
			return;
		}
		active = new DrawingSession(brush);
		active.buildOverlay();
	}

	private void buildOverlay() {
		Camera ui = PixelScene.uiCamera;
		float width = ui.width;
		float height = ui.height;
		float actionsTop = Math.min(height - 30, ScreenLayout.aboveToolbar()) - BUTTON_HEIGHT;
		float brushesTop = actionsTop - BUTTON_HEIGHT - MARGIN;

		PointerArea area = new PointerArea(0, 0, width, brushesTop - MARGIN) {
			@Override
			public void onPointerDown(PointerEvent event) {
				lastCell = -1;
				lastX = event.current.x;
				lastY = event.current.y;
				if (brush != MOVE_VIEW) paintAt(event.current);
			}

			@Override
			public void onDrag(PointerEvent event) {
				if (brush == MOVE_VIEW) {
					Camera main = Camera.main;
					main.shift(new PointF((lastX - event.current.x) / main.zoom, (lastY - event.current.y) / main.zoom));
				} else {
					paintAt(event.current);
				}
				lastX = event.current.x;
				lastY = event.current.y;
			}

			@Override
			public void onPointerUp(PointerEvent event) {
				lastCell = -1;
				refreshView();
			}

			@Override
			public void onClick(PointerEvent event) {
			}
		};
		addToOverlay(area);

		label = PixelScene.renderTextBlock("", 9);
		label.hardlight(0xFFFF44);
		addToOverlay(label);
		updateLabel();

		float sideWidth = 50;

		TintedButton cancel = TintedButton.cancel("Cancel", this::cancel);
		cancel.setRect(MARGIN, actionsTop, sideWidth, BUTTON_HEIGHT);
		addToOverlay(cancel);

		TintedButton finish = TintedButton.finish("Finish", this::finish);
		finish.setRect(width - MARGIN - sideWidth, actionsTop, sideWidth, BUTTON_HEIGHT);
		addToOverlay(finish);

		float brushWidth = (width - 2 * MARGIN - 3 * 2) / 4f;
		for (int i = 0; i < BRUSH_NAMES.length; i++) {
			int index = i;
			RedButton button = new RedButton(BRUSH_NAMES[i], 7) {
				@Override
				public void onClick() {
					setBrush(index);
				}
			};
			button.setRect(MARGIN + i * (brushWidth + 2), brushesTop, brushWidth, BUTTON_HEIGHT);
			addToOverlay(button);
			brushButtons.add(button);
		}
		updateBrushButtons();
	}

	private void addToOverlay(Gizmo gizmo) {
		gizmo.camera = PixelScene.uiCamera;
		scene.add(gizmo);
		overlay.add(gizmo);
	}

	private void setBrush(int newBrush) {
		brush = newBrush;
		updateLabel();
		updateBrushButtons();
	}

	private void updateLabel() {
		label.text(brush == MOVE_VIEW ? "Moving the view  -  drag to look around" : "Drawing: " + BRUSH_NAMES[brush] + "  -  drag across tiles to paint");
		label.maxWidth(PixelScene.uiCamera.width - 2 * MARGIN);
		label.setPos(MARGIN, 30);
	}

	private void updateBrushButtons() {
		for (int i = 0; i < brushButtons.size(); i++) {
			brushButtons.get(i).textColor(i == brush ? 0xFFFF44 : 0xFFFFFF);
		}
	}

	private void paintAt(PointF screen) {
		int cell = Grid.cellAt(screen);
		if (cell < 0 || cell == lastCell) return;
		lastCell = cell;
		paint(cell);
	}

	private void paint(int cell) {
		Level level = Dungeon.level;
		boolean occupied = FloorEditor.hasCharacter(cell);
		if (brush != FLOOR && occupied) return;
		int target = brush == FLOOR ? FloorEditor.EMPTY_TILE : brush == WALL ? FloorEditor.WALL : FloorEditor.CHASM;
		if (level.map[cell] == target && brush != ERASER) return;

		try {
			Original original = record(cell);
			if (level.traps.get(cell, null) != null) level.traps.remove(cell);
			if (level.plants.get(cell, null) != null) level.plants.remove(cell);
			if (brush == ERASER) {
				for (Blob blob : FloorEditor.activeEffects()) {
					int amount = FloorEditor.strengthAt(blob, cell);
					if (amount <= 0) continue;
					original.effects.put(blob, original.effects.containsKey(blob) ? original.effects.get(blob) + amount : amount);
					blob.clear(cell);
				}
				original.erased = true;
			} else {
				original.erased = false;
			}
			Level.set(cell, target);
			GameScene.updateMap(cell);
		} catch (Throwable e) {
			Log.e(TAG, "Could not paint tile " + cell, e);
		}
	}

	private Original record(int cell) {
		Original original = originals.get(cell);
		if (original != null) return original;
		Level level = Dungeon.level;
		original = new Original(level.map[cell], level.traps.get(cell, null), level.plants.get(cell, null));
		originals.put(cell, original);
		return original;
	}

	private void finish() {
		Level level = Dungeon.level;
		for (Map.Entry<Integer, Original> entry : originals.entrySet()) {
			if (!entry.getValue().erased) continue;
			Heap heap = level.heaps.get(entry.getKey(), null);
			if (heap != null) heap.destroy();
		}
		end();
	}

	private void cancel() {
		Level level = Dungeon.level;
		for (Map.Entry<Integer, Original> entry : originals.entrySet()) {
			int cell = entry.getKey();
			Original original = entry.getValue();
			try {
				Level.set(cell, original.terrain);
				if (original.trap != null) level.traps.put(cell, original.trap);
				if (original.plant != null) level.plants.put(cell, original.plant);
				for (Map.Entry<Blob, Integer> effect : original.effects.entrySet()) {
					Blob blob = effect.getKey();
					if (blob.cur == null || cell >= blob.cur.length) continue;
					blob.cur[cell] += effect.getValue();
					blob.volume += effect.getValue();
				}
				GameScene.updateMap(cell);
			} catch (Throwable e) {
				Log.e(TAG, "Could not restore tile " + cell, e);
			}
		}
		end();
	}

	private void end() {
		for (Gizmo gizmo : overlay) {
			gizmo.killAndErase();
			gizmo.destroy();
		}
		overlay.clear();
		originals.clear();
		refreshView();
		if (active == this) active = null;
	}

	private static void refreshView() {
		try {
			Dungeon.observe();
			GameScene.updateFog();
		} catch (Throwable ignored) {
		}
	}
}
