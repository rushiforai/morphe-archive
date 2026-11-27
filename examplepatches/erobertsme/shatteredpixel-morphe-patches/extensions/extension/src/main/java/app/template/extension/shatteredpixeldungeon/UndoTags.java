package app.template.extension.shatteredpixeldungeon;

import android.util.Log;

import com.shatteredpixel.shatteredpixeldungeon.Chrome;
import com.shatteredpixel.shatteredpixeldungeon.Dungeon;
import com.shatteredpixel.shatteredpixeldungeon.scenes.GameScene;
import com.shatteredpixel.shatteredpixeldungeon.scenes.PixelScene;
import com.shatteredpixel.shatteredpixeldungeon.ui.Icons;
import com.shatteredpixel.shatteredpixeldungeon.ui.RenderedTextBlock;
import com.watabou.noosa.Camera;
import com.watabou.noosa.Game;
import com.watabou.noosa.Gizmo;
import com.watabou.input.PointerEvent;
import com.watabou.noosa.NinePatch;
import com.watabou.noosa.PointerArea;
import com.watabou.noosa.Scene;
import com.watabou.noosa.ui.Component;
import com.watabou.utils.PointF;

import java.util.ArrayList;
import java.util.List;

/**
 * The Undo / Redo toolbar tag. Tapping it opens undo mode: Undo on the left, Done in the middle and Redo on the
 * right, above the toolbar. Undo mode stays open across the reload, so you can step back several times.
 */
@SuppressWarnings("unused")
public final class UndoTags {

	static final TagPlacement PLACEMENT = new TagPlacement("qol_undo_tags", TagPlacement.Side.LEFT, 0.35f, 1, "CHANGES", 0).defaultOffset(0).defaultOpacity(70);

	/**
	 * The Undo / Redo tag. It hides while undo mode is open.
	 */
	static final ScreenTag TAG = new ScreenTag("Undo / Redo", PLACEMENT, () -> !UndoTags.modeOpen, tag -> openMode(Game.scene()))
		.enabledWhen(UndoHistory::isOn)
		.removable("Remove the Undo / Redo tag? This switches Undo / Redo off. Switch it back on in Extras.", () -> UndoHistory.setOn(false));

	private static final int BUTTON_WIDTH = 50;
	private static final int BUTTON_HEIGHT = 20;
	private static final int MARGIN = 4;
	private static final int TEXT_GAP = 6;
	private static final int DEATH_BUTTON_WIDTH = 80;
	private static final float DEATH_FADE = 2f;
	private static final String KEY_MAP_VIEW = "qol_undo_map_view";
	private static final int PREVIEW_MAX = 150;
	private static final int STATS_WIDTH = 46;
	private static final int BACKPACK_WIDTH = 60;
	private static final int BACKPACK_HEIGHT = 16;
	private static final int PANEL_PADDING = 6;
	private static final int STATUS_HEIGHT = 8;
	private static final int CAPTION_COLOR = 0x999999;
	private static final int PENDING_COLOR = 0xFFFF44;
	private static final int CURRENT_COLOR = 0x44FF44;
	private static final int PREVIEW_MIN = 48;

	private static boolean modeOpen;
	private static float[] backpackPanel;
	private static float[] backButton;
	private static final List<Gizmo> backpackLayer = new ArrayList<>();
	private static final List<Gizmo> modeButtons = new ArrayList<>();
	private static final List<Gizmo> overlay = new ArrayList<>();

	private UndoTags() {
	}

	/**
	 * Called at the end of GameScene.create.
	 */
	public static void onSceneCreated(Object scene) {
		if (!(scene instanceof Scene)) return;
		overlay.clear();
		if (!UndoHistory.isAvailable()) return;
		try {
			Scene target = (Scene) scene;
			ScreenTags.onSceneCreated(target);
			UndoHistory.onChange(null);
			UndoScene.listen();
			if (modeOpen && UndoHistory.isOn()) buildMode(target);
		} catch (Throwable e) {
			Log.e("UndoTags", "Could not add the Undo / Redo tag", e);
		}
	}

	private static Runnable panelRefresher;

	private static void refreshPanel() {
		Runnable refresher = panelRefresher;
		if (modeOpen && refresher != null) refresher.run();
	}

	private static void openMode(Scene scene) {
		if (modeOpen) return;
		modeOpen = true;
		TAG.refresh();
		buildMode(scene);
		UndoHistory.resetSelection();
	}

	private static void closeMode() {
		modeOpen = false;
		panelRefresher = null;
		UndoHistory.onChange(null);
		backpackLayer.clear();
		modeButtons.clear();
		for (Gizmo gizmo : overlay) {
			gizmo.killAndErase();
			gizmo.destroy();
		}
		overlay.clear();
		TAG.refresh();
	}

	/**
	 * Shows what the hero carried at the chosen step, over the undo panel, with a Back button below it.
	 */
	private static void openBackpack(Scene scene) {
		HeroCard hero = UndoHistory.hero(UndoHistory.selected());
		if (hero == null || backpackPanel == null || !backpackLayer.isEmpty()) return;
		Camera ui = PixelScene.uiCamera;
		PointerArea blocker = new PointerArea(0, 0, ui.width, ui.height);
		blocker.blockLevel = PointerArea.ALWAYS_BLOCK;
		addBackpackPart(scene, blocker);
		NinePatch panel = Chrome.get(Chrome.Type.WINDOW);
		panel.x = backpackPanel[0];
		panel.y = backpackPanel[1];
		panel.size(backpackPanel[2], backpackPanel[3]);
		addBackpackPart(scene, panel);
		float left = backpackPanel[0] + PANEL_PADDING;
		float width = backpackPanel[2] - 2 * PANEL_PADDING;
		float top = backpackPanel[1] + PANEL_PADDING;
		RenderedTextBlock title = PixelScene.renderTextBlock("Backpack at step " + (UndoHistory.selected() + 1), 9);
		title.hardlight(EditorWindow.TITLE_COLOR);
		title.setPos(left, top);
		PixelScene.align(title);
		addBackpackPart(scene, title);
		float slotsTop = title.bottom() + 4;
		List<Gizmo> slots = new ArrayList<>();
		UndoHeroView.slots(slots, hero.belongings, left, slotsTop, width, backpackPanel[1] + backpackPanel[3] - PANEL_PADDING - slotsTop);
		for (Gizmo slot : slots) addBackpackPart(scene, slot);
		TintedButton back = new TintedButton("Back", null, 1f, 1f, 1f, UndoTags::closeBackpack);
		back.setRect(backButton[0], backButton[1], backButton[2], backButton[3]);
		addBackpackPart(scene, back);
		for (Gizmo button : modeButtons) {
			button.visible = false;
			button.active = false;
		}
	}

	private static void addBackpackPart(Scene scene, Gizmo gizmo) {
		addToOverlay(scene, gizmo);
		backpackLayer.add(gizmo);
	}

	private static void closeBackpack() {
		for (Gizmo gizmo : backpackLayer) {
			overlay.remove(gizmo);
			gizmo.killAndErase();
			gizmo.destroy();
		}
		backpackLayer.clear();
		for (Gizmo button : modeButtons) {
			button.visible = true;
			button.active = true;
		}
		refreshPanel();
	}

	private static void finishMode() {
		boolean load = UndoHistory.selectionPending();
		closeMode();
		if (load) UndoHistory.loadSelected();
	}

	private static void buildMode(Scene scene) {
		Camera ui = PixelScene.uiCamera;
		float top = ScreenLayout.aboveToolbar() - BUTTON_HEIGHT;
		float listTop = top - BUTTON_HEIGHT - 2;

		PointerArea blocker = new PointerArea(0, 0, ui.width, ui.height) {
			@Override
			public void onClick(PointerEvent event) {
				if (tappedMenu(event)) openGameMenu();
			}
		};
		blocker.blockLevel = PointerArea.ALWAYS_BLOCK;
		addToOverlay(scene, blocker);

		float cancelTop = ScreenLayout.belowStatus();
		TintedButton cancel = new TintedButton("Cancel", null, 1f, 1f, 1f, UndoTags::closeMode);
		cancel.setRect((ui.width - BUTTON_WIDTH) / 2f, cancelTop, BUTTON_WIDTH, BUTTON_HEIGHT);
		addToOverlay(scene, cancel);

		float panelLeft = MARGIN;
		float panelWidth = ui.width - 2 * MARGIN;
		float panelTop = cancelTop + BUTTON_HEIGHT + 2;
		float panelBottom = listTop - 3;
		NinePatch panel = Chrome.get(Chrome.Type.WINDOW);
		panel.x = panelLeft;
		panel.y = panelTop;
		panel.size(panelWidth, panelBottom - panelTop);
		addToOverlay(scene, panel);

		float innerLeft = panelLeft + PANEL_PADDING;
		float innerWidth = panelWidth - 2 * PANEL_PADDING;
		float heroTop = panelTop + PANEL_PADDING;
		float heroWidth = innerWidth - STATS_WIDTH - 4;
		float backpackTop = heroTop + UndoHeroView.HEIGHT + 3;
		TintedButton backpack = new TintedButton("Backpack", null, 1f, 1f, 1f, () -> openBackpack(scene));
		backpack.icon(Icons.get(Icons.BACKPACK));
		backpack.setRect(innerLeft, backpackTop, BACKPACK_WIDTH, BACKPACK_HEIGHT);
		addToOverlay(scene, backpack);

		float statusTop = backpackTop + BACKPACK_HEIGHT + 3;
		float logTop = statusTop + STATUS_HEIGHT + 2;
		float logHeight = PreviewParts.logHeight();
		float pictureTop = logTop + logHeight + 4 + PreviewParts.BORDER;
		float pictureSize = Math.min(PREVIEW_MAX, Math.min(innerWidth - 2 * PreviewParts.BORDER, panelBottom - PANEL_PADDING - PreviewParts.BORDER - pictureTop));
		boolean hasPicture = pictureSize >= PREVIEW_MIN;
		float pictureLeft = (ui.width - pictureSize) / 2f;
		List<Gizmo> frameParts = new ArrayList<>();
		PreviewParts.logBackground(frameParts, innerLeft, logTop, innerWidth);
		if (hasPicture) PreviewParts.frame(frameParts, pictureLeft, pictureTop, pictureSize);
		for (Gizmo part : frameParts) addToOverlay(scene, part);
		backpackPanel = new float[] { panelLeft, panelTop, panelWidth, panelBottom - panelTop };
		backButton = new float[] { (ui.width - BUTTON_WIDTH) / 2f, cancelTop, BUTTON_WIDTH, BUTTON_HEIGHT };
		modeButtons.clear();
		modeButtons.add(cancel);
		modeButtons.add(backpack);

		TintedButton undo = new TintedButton("Undo", null, 1f, 1f, 1f, UndoHistory::selectPrevious);
		undo.icon(StatIcons.arrow(true));
		undo.setRect(MARGIN, top, BUTTON_WIDTH, BUTTON_HEIGHT);
		addToOverlay(scene, undo);

		TintedButton done = new TintedButton("Done", null, 1f, 1f, 1f, UndoTags::finishMode);
		done.setRect((ui.width - BUTTON_WIDTH) / 2f, top, BUTTON_WIDTH, BUTTON_HEIGHT);
		addToOverlay(scene, done);

		TintedButton list = new TintedButton("History", null, 1f, 1f, 1f, () -> Game.scene().addToFront(new UndoListWindow()));
		list.setRect((ui.width - BUTTON_WIDTH) / 2f, listTop, BUTTON_WIDTH, BUTTON_HEIGHT);
		addToOverlay(scene, list);

		TintedButton redo = new TintedButton("Redo", null, 1f, 1f, 1f, UndoHistory::selectNext);
		redo.icon(StatIcons.arrow(false));
		redo.setRect(ui.width - MARGIN - BUTTON_WIDTH, top, BUTTON_WIDTH, BUTTON_HEIGHT);
		addToOverlay(scene, redo);
		modeButtons.add(undo);
		modeButtons.add(done);
		modeButtons.add(list);
		modeButtons.add(redo);

		Runnable refresher = new Runnable() {
			private int shownFor = -2;
			private int shownCount = -1;
			private boolean shownPending;
			private UndoScene shownScene;
			private boolean shownMap;
			private final List<Gizmo> details = new ArrayList<>();

			@Override
			public void run() {
				if (!UndoHistory.isOn() || Dungeon.hero == null || !Dungeon.hero.isAlive()) {
					closeMode();
					return;
				}
				if (!backpackLayer.isEmpty()) return;
				undo.enable(UndoHistory.canSelectPrevious());
				redo.enable(UndoHistory.canSelectNext());
				list.enable(UndoHistory.count() > 1);
				int selected = UndoHistory.selected();
				int count = UndoHistory.count();
				boolean pending = UndoHistory.selectionPending();
				UndoScene step = UndoHistory.scene(selected);
				boolean showMap = showsMap();
				if (selected == shownFor && count == shownCount && pending == shownPending && step == shownScene && showMap == shownMap) return;
				shownFor = selected;
				shownCount = count;
				shownPending = pending;
				shownScene = step;
				shownMap = showMap;
				rebuild(scene, selected, count, pending, step, showMap);
			}

			private void rebuild(Scene scene, int selected, int count, boolean pending, UndoScene step, boolean showMap) {
				for (Gizmo old : details) {
					overlay.remove(old);
					old.killAndErase();
					old.destroy();
				}
				details.clear();
				List<Gizmo> parts = new ArrayList<>();
				int[] stats = UndoHistory.stats(selected);
				String[] values = stats == null
					? new String[] { "Step -", "Depth -", "Turn -" }
					: new String[] { "Step " + (selected + 1) + "/" + count, "Depth " + stats[0], "Turn " + stats[1] };
				PreviewParts.statLines(parts, values, innerLeft + innerWidth, heroTop, STATS_WIDTH);
				HeroCard hero = step == null ? null : step.hero;
				backpack.enable(hero != null);
				if (hero != null) {
					try {
						UndoHeroView.build(parts, hero, innerLeft, heroTop, heroWidth);
					} catch (Throwable e) {
						Log.e("UndoTags", "Could not show the hero", e);
					}
				}
				String status = stats == null ? "No steps kept yet" : pending ? "Not loaded - tap Done to load this step" : "You are here";
				int statusColor = stats == null ? PreviewParts.DIM_COLOR : pending ? PENDING_COLOR : CURRENT_COLOR;
				RenderedTextBlock statusText = PreviewParts.line(parts, status, statusColor, 0, statusTop, innerWidth);
				statusText.setPos((ui.width - statusText.width()) / 2f, statusTop);
				PixelScene.align(statusText);
				PreviewParts.logLines(parts, step == null ? new ArrayList<>() : step.lines, innerLeft, logTop, innerWidth, "No messages for this step");
				if (hasPicture && step != null) PreviewParts.picture(parts, step, UndoHistory.picture(selected), ui, pictureLeft, pictureTop, pictureSize, () -> { });
				for (Gizmo part : parts) addDetail(scene, part);
			}

			private void addDetail(Scene scene, Gizmo gizmo) {
				addToOverlay(scene, gizmo);
				details.add(gizmo);
			}
		};
		panelRefresher = refresher;
		UndoHistory.onChange(refresher);
		refresher.run();
	}

	private static boolean tappedMenu(PointerEvent event) {
		try {
			Component button = menuButton();
			if (button == null || event == null) return false;
			PointF point = ScreenLayout.toUi(event);
			return point.x >= button.left() && point.x <= button.right() && point.y >= button.top() && point.y <= button.bottom();
		} catch (Throwable e) {
			return false;
		}
	}

	private static Component menuButton() throws ReflectiveOperationException {
		Object menu = Reflect.gameScenePart("menu");
		return menu == null ? null : (Component) Reflect.get(menu, "btnMenu");
	}

	/**
	 * Closes undo mode and opens the game menu, as the menu button would.
	 */
	private static void openGameMenu() {
		closeMode();
		try {
			Component button = menuButton();
			if (button == null) return;
			Reflect.call(button, "onClick", new Class<?>[0]);
		} catch (Throwable e) {
			Log.e("UndoTags", "Could not open the game menu", e);
		}
	}

	/**
	 * Adds an Undo button below the game over screen's New Game and Menu buttons. It fades in with them.
	 */
	static void addDeathButton() {
		Scene scene = com.watabou.noosa.Game.scene();
		if (scene == null) return;
		Camera ui = PixelScene.uiCamera;
		com.shatteredpixel.shatteredpixeldungeon.ui.StyledButton undo = new com.shatteredpixel.shatteredpixeldungeon.ui.StyledButton(com.shatteredpixel.shatteredpixeldungeon.Chrome.Type.GREY_BUTTON_TR, "Undo") {
			private float shown;

			@Override
			public void onClick() {
				UndoHistory.undoDeath();
			}

			@Override
			public void update() {
				if (shown < DEATH_FADE) {
					shown = Math.min(DEATH_FADE, shown + com.watabou.noosa.Game.elapsed);
					alpha((float) Math.pow(shown / DEATH_FADE, 2));
				}
				super.update();
			}
		};
		undo.icon(StatIcons.arrow(true));
		undo.alpha(0);
		undo.camera = ui;
		undo.setRect((ui.width - DEATH_BUTTON_WIDTH) / 2f, (ui.height - BUTTON_HEIGHT) / 2f + 8 + 2 * (BUTTON_HEIGHT + 2), DEATH_BUTTON_WIDTH, BUTTON_HEIGHT);
		PixelScene.align(undo);
		scene.add(undo);
	}

	static boolean showsMap() {
		return CloverlordSettings.get(KEY_MAP_VIEW);
	}

	static void toggleMap() {
		CloverlordSettings.set(KEY_MAP_VIEW, !showsMap());
		refreshPanel();
	}

	private static void addToOverlay(Scene scene, Gizmo gizmo) {
		gizmo.camera = PixelScene.uiCamera;
		scene.add(gizmo);
		overlay.add(gizmo);
	}
}
