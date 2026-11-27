package app.template.extension.shatteredpixeldungeon;

import com.shatteredpixel.shatteredpixeldungeon.ui.Icons;
import com.shatteredpixel.shatteredpixeldungeon.ui.Button;
import com.shatteredpixel.shatteredpixeldungeon.ui.ScrollPane;
import com.watabou.noosa.ui.Component;
import com.watabou.noosa.ColorBlock;
import com.watabou.noosa.Image;
import com.watabou.noosa.Game;
import com.watabou.noosa.PointerArea;
import com.watabou.input.PointerEvent;
import com.watabou.utils.PointF;
import com.shatteredpixel.shatteredpixeldungeon.scenes.PixelScene;

import java.util.Collections;
import java.util.List;

/**
 * Position, color and icon settings for a toolbar tag. Any tag that uses a [TagPlacement] can open this page.
 */
public class TagSettingsWindow extends EditorWindow {

	private static final String INFO = "Tag style\n\n"
		+ "## Position\n_Edge:_ pick the screen edge, then how many pixels along it the tag sits: from the top on the left and right edges, from the left on the top edge. Tap the number to type it, or drag the tag itself.\n_Outlines:_ in a game, faded outlines show where the game's own Attack, Pick Up, Action and Resume tags appear, so you can keep clear of them. On the main menu a stand-in game screen shows behind.\nOn the top edge the tag faces the top of the screen, and on the left edge it's mirrored, so it always looks attached.\n\n"
		+ "## Look\n_Color:_ tap a swatch, or set Hue, Saturation and Lightness. Reset goes back to the tag's own color.\n_Icon:_ every icon in the game. The buttons above filter by kind: interface, item sprites, item icons, status or talents. Turn it in 15 degree steps.\n_Emoji:_ use any emoji, picked from your keyboard's emoji panel.\n_Icon Color:_ tint the icon, or Original for its own colors.\n\n"
		+ "## Size and opacity\n_Size:_ the tag's width and height in pixels (the game's are 24 by 24) and the icon's size as a percentage. Reset goes back to 24 by 24.\n_Opacity:_ from 0% (invisible) to 100% (solid). With Link tag and icon checked, changing one changes both.";
	private static final String[] TABS_TOP = { "Position", "Size", "Color" };
	private static final String[] TABS_BOTTOM = { "Icon", "Icon Color", "Opacity" };
	private static final String[] TABS_GAME = { "Position", "Color" };
	private static final int COLOR_TAB = 2;
	private static final int[] SWATCHES = {
		TagPlacement.DEFAULT_COLOR, 0xC0392B, 0xE67E22, 0xD4B92A, 0x3E9B4F, 0x2A9D8F,
		0x3A6EC8, 0x8E44AD, 0xD9579A, 0x8B5A2B, 0xE0E0E0, 0x303030,
	};
	private static final int PER_ROW = 6;
	private static final int SWATCH_HEIGHT = 14;
	private static final int ICON_CELL = 18;
	private static final int SELECTED_COLOR = 0xFFFFFF44;

	private static int tab;
	private static int category;
	private static float iconScroll;
	private static final int ICON_ROWS_SHOWN = 5;

	private ScrollPane iconPane;
	private float iconContentHeight;
	private float viewHeight;

	private final TagPlacement placement;
	private final String title;
	private final Runnable back;
	private final ScreenTag.Removal removal;
	private final List<ScreenTag.Change> changes;

	public TagSettingsWindow(TagPlacement placement, String title, Runnable back) {
		this(placement, title, back, null, Collections.emptyList());
	}

	/**
	 * The settings of one of the patches' tags, with a Remove Tag button when it can be removed.
	 */
	public TagSettingsWindow(ScreenTag tag, String title, Runnable back) {
		this(tag.placement, title, back, tag.removal(), tag.changes());
	}

	/**
	 * With [removal], the page also has a Remove Tag button that asks first.
	 */
	private TagSettingsWindow(TagPlacement placement, String title, Runnable back, ScreenTag.Removal removal, List<ScreenTag.Change> changes) {
		super();
		this.placement = placement;
		this.title = title;
		this.back = back;
		this.removal = removal;
		this.changes = changes;
		addTitle(title, INFO);
		if (placement.styled()) addPreview();
		if (placement.styled()) {
			addButtonRow(TABS_TOP, tab, index -> {
				tab = index;
				refresh();
			});
			addButtonRow(TABS_BOTTOM, tab - TABS_TOP.length, index -> {
				tab = TABS_TOP.length + index;
				refresh();
			});
		} else {
			if (tab != COLOR_TAB) tab = 0;
			addButtonRow(TABS_GAME, tab == COLOR_TAB ? 1 : 0, index -> {
				tab = index == 0 ? 0 : COLOR_TAB;
				refresh();
			});
		}
		pos += GAP;
		if (tab == 0) addPlacementSettings(placement);
		if (tab == 1) addSizes();
		if (tab == 2) addColorChooser(placement.color(), TagPlacement.TAG_COLOR, placement::color, placement::resetColor, false);
		if (tab == 3) addIconChooser();
		if (tab == 4) addColorChooser(placement.iconColor(), TagPlacement.ICON_COLOR, placement::iconColor, placement::resetIconColor, true);
		if (tab == 5) addOpacity();

		pos += GAP;
		for (ScreenTag.Change change : changes) {
			if (!change.shows.isTrue()) continue;
			addRowButton(change.label, null, () -> {
				hide();
				change.change.run();
			});
		}
		if (removal != null) {
			addRowButton("Remove Tag", Icons.get(Icons.CLOSE), () -> ConfirmPrompt.ask("Remove Tag", removal.question, "Remove", () -> {
				hide();
				removal.remove.run();
				back.run();
			}));
		}
		finishWithBack(() -> back.run());
		relayoutIcons();
		MenuPreview.show();
		GameTagGhosts.show();
		if (tab == 0 && !placement.isAuto()) Game.runOnRenderThread(this::addDragArea);
	}

	private PointerArea dragArea;

	/**
	 * Lets the tag being positioned be dragged along its edge. The area sits over the tag, above this page, so a
	 * drag that starts on the tag moves it and changes the distance setting.
	 */
	private void addDragArea() {
		if (parent == null) return;
		float[] first = placement.rect(0);
		float[] last = placement.rect(placement.tagCount() - 1);
		float x = Math.min(first[0], last[0]);
		float y = Math.min(first[1], last[1]);
		float w = Math.max(first[0] + first[2], last[0] + last[2]) - x;
		float h = Math.max(first[1] + first[3], last[1] + last[3]) - y;
		boolean top = placement.side() == TagPlacement.Side.TOP;
		dragArea = new PointerArea(x, y, w, h) {
			private float grab;
			private boolean moved;

			@Override
			public void onPointerDown(PointerEvent event) {
				PointF point = ScreenLayout.toUi(event);
				grab = placement.offsetAt(point.x, point.y) - placement.offset();
				moved = false;
			}

			@Override
			public void onDrag(PointerEvent event) {
				PointF point = ScreenLayout.toUi(event);
				int offset = Math.round(placement.offsetAt(point.x, point.y) - grab);
				placement.offset(offset);
				float[] rect = placement.rect(0);
				if (top) this.x = rect[0];
				else this.y = rect[1];
				moved = true;
				MenuPreview.show();
			}

			@Override
			public void onPointerUp(PointerEvent event) {
				if (moved) refresh();
			}

			@Override
			public void onClick(PointerEvent event) {
			}
		};
		dragArea.camera = PixelScene.uiCamera;
		parent.add(dragArea);
	}

	@Override
	public void destroy() {
		GameTagGhosts.hide();
		MenuPreview.hide();
		if (dragArea != null) {
			dragArea.killAndErase();
			dragArea.destroy();
			dragArea = null;
		}
		super.destroy();
	}

	private void addPreview() {
		IconTag preview = new IconTag(() -> { });
		int width = placement.tagWidth();
		int height = placement.tagHeight();
		preview.setRect((WIDTH - width) / 2f, pos, width, height);
		boolean auto = placement.isAuto();
		preview.flip(!auto && placement.side() == TagPlacement.Side.LEFT);
		preview.onTop(!auto && placement.side() == TagPlacement.Side.TOP);
		preview.style(placement);
		add(preview);
		pos += height + 2 * GAP;
	}

	private void addColorChooser(int current, String which, IntAction setter, Runnable reset, boolean original) {
		float width = (WIDTH - (PER_ROW - 1) * GAP) / (float) PER_ROW;
		int count = SWATCHES.length + (original ? 1 : 0);
		for (int i = 0; i < count; i++) {
			boolean isOriginal = original && i == 0;
			int color = isOriginal ? -1 : SWATCHES[original ? i - 1 : i];
			if (!original && i == 0) color = placement.defaultColor();
			int swatch = color;
			int column = i % PER_ROW;
			if (i > 0 && column == 0) pos += SWATCH_HEIGHT + GAP;
			float x = column * (width + GAP);
			boolean selected = color == current;
			if (selected) {
				ColorBlock outline = new ColorBlock(width, SWATCH_HEIGHT, SELECTED_COLOR);
				outline.x = x;
				outline.y = pos;
				add(outline);
			}
			if (isOriginal) {
				Image icon = IconTag.iconImage(placement.icon());
				icon.x = x + (width - icon.width()) / 2f;
				icon.y = pos + (SWATCH_HEIGHT - icon.height()) / 2f;
				add(icon);
			} else {
				ColorBlock block = new ColorBlock(width - 2, SWATCH_HEIGHT - 2, 0xFF000000 | color);
				block.x = x + 1;
				block.y = pos + 1;
				add(block);
			}
			Button button = new Button() {
				@Override
				public void onClick() {
					if (swatch < 0 || (!original && swatch == placement.defaultColor())) {
						reset.run();
					} else {
						setter.run(swatch);
					}
					refresh();
				}
			};
			button.setRect(x, pos, width, SWATCH_HEIGHT);
			add(button);
		}
		pos += SWATCH_HEIGHT + 2 * GAP;

		int[] hsl = placement.hsl(which, current < 0 ? 0xFFFFFF : current);
		int hue = hsl[0];
		int saturation = hsl[1];
		int lightness = hsl[2];
		addStepper("Hue", String.valueOf(hue), hue, 10, 0, 359, value -> placement.hsl(which, value, saturation, lightness), true, reset);
		addStepper("Saturation", saturation + "%", saturation, 5, 0, 100, value -> placement.hsl(which, hue, value, lightness), true, reset);
		addStepper("Lightness", lightness + "%", lightness, 5, 0, 100, value -> placement.hsl(which, hue, saturation, value), true, reset);
	}

	/**
	 * Asks for an emoji in an Android dialog, so the keyboard's own emoji panel can be used, and makes it the icon.
	 */
	private void chooseEmoji() {
		String current = placement.icon();
		String initial = current.startsWith(EmojiIcon.PREFIX) ? current.substring(EmojiIcon.PREFIX.length()) : "";
		AndroidUi.askEmoji("Emoji icon", "Tap the emoji key on your keyboard and pick one. Only the first emoji is used.", initial, "Use", text -> {
			String emoji = EmojiIcon.first(text);
			if (emoji == null) return;
			placement.icon(EmojiIcon.PREFIX + emoji);
			refresh();
		});
	}

	private void addIconChooser() {
		String[] first = { IconCatalog.CATEGORIES[0], IconCatalog.CATEGORIES[1], IconCatalog.CATEGORIES[2] };
		String[] second = { IconCatalog.CATEGORIES[3], IconCatalog.CATEGORIES[4], IconCatalog.CATEGORIES[5] };
		float half = (WIDTH - GAP) / 2f;
		addButton("Default Icon", 0, half, () -> {
			placement.resetIcon();
			refresh();
		});
		addButton("Emoji", half + GAP, half, this::chooseEmoji);
		pos += ROW_HEIGHT + GAP;
		addButtonRow(first, category, index -> chooseCategory(index));
		addButtonRow(second, category - first.length, index -> chooseCategory(first.length + index));

		List<String> tokens = IconCatalog.tokens(category);
		String current = placement.icon();
		float cellWidth = (WIDTH - (PER_ROW - 1) * GAP) / (float) PER_ROW;
		Component content = new Component();
		for (int i = 0; i < tokens.size(); i++) {
			String token = tokens.get(i);
			float x = (i % PER_ROW) * (cellWidth + GAP);
			float y = (i / PER_ROW) * (ICON_CELL + GAP);
			if (token.equals(current)) {
				ColorBlock outline = new ColorBlock(cellWidth, ICON_CELL, SELECTED_COLOR);
				outline.x = x;
				outline.y = y;
				content.add(outline);
				ColorBlock inner = new ColorBlock(cellWidth - 2, ICON_CELL - 2, 0xFF3A3A3A);
				inner.x = x + 1;
				inner.y = y + 1;
				content.add(inner);
			}
			Image icon = IconTag.iconImage(token);
			float scale = Math.min(1f, Math.min((cellWidth - 2) / icon.width(), (ICON_CELL - 2) / icon.height()));
			icon.scale.set(scale, scale);
			icon.x = x + (cellWidth - icon.width()) / 2f;
			icon.y = y + (ICON_CELL - icon.height()) / 2f;
			content.add(icon);
		}
		int rows = (tokens.size() + PER_ROW - 1) / PER_ROW;
		float contentHeight = rows * (ICON_CELL + GAP);
		content.setSize(WIDTH, contentHeight);
		ScrollPane pane = new ScrollPane(content) {
			@Override
			public void onClick(float x, float y) {
				int column = (int) (x / (cellWidth + GAP));
				int row = (int) (y / (ICON_CELL + GAP));
				int index = row * PER_ROW + column;
				if (column < 0 || column >= PER_ROW || index < 0 || index >= tokens.size()) return;
				placement.icon(tokens.get(index));
				iconScroll = content.camera == null ? 0 : content.camera.scroll.y;
				refresh();
			}
		};
		add(pane);
		viewHeight = Math.min(contentHeight, ICON_ROWS_SHOWN * (ICON_CELL + GAP));
		pane.setRect(0, pos, WIDTH, viewHeight);
		iconPane = pane;
		iconContentHeight = contentHeight;
		pos += viewHeight + 2 * GAP;

		int rotation = placement.iconRotation();
		addStepper("Rotation", rotation + " deg", rotation, 15, 0, 345, value -> placement.iconRotation(value), true, placement::resetIconRotation);
	}

	private void chooseCategory(int index) {
		if (index != category) iconScroll = 0;
		category = index;
		refresh();
	}

	/**
	 * The scroll area takes its screen position when laid out, so it is laid out again once the window has its
	 * final size and place, then scrolled back to where it was.
	 */
	private void relayoutIcons() {
		if (iconPane == null) return;
		iconPane.setRect(iconPane.left(), iconPane.top(), iconPane.width(), iconPane.height());
		float maxScroll = Math.max(0, iconContentHeight - viewHeight);
		iconPane.scrollTo(0, Math.max(0, Math.min(maxScroll, iconScroll)));
	}

	private void addSizes() {
		int width = placement.tagWidth();
		int height = placement.tagHeight();
		int scale = placement.iconScale();
		addStepper("Tag width", width + " px", width, 1, TagPlacement.MIN_SIZE, TagPlacement.MAX_SIZE, placement::tagWidth, true, placement::resetSize);
		addStepper("Tag height", height + " px", height, 1, TagPlacement.MIN_SIZE, TagPlacement.MAX_SIZE, placement::tagHeight, true, placement::resetSize);
		addStepper("Icon scale", scale + "%", scale, 25, TagPlacement.MIN_ICON_SCALE, TagPlacement.MAX_ICON_SCALE, placement::iconScale, true, placement::resetIconScale);
	}

	private void addOpacity() {
		addCheckBox("Link tag and icon", placement.opacityLinked(), () -> placement.opacityLinked(!placement.opacityLinked()));
		int tagOpacity = placement.tagOpacity();
		int iconOpacity = placement.iconOpacity();
		addStepper("Tag", tagOpacity + "%", tagOpacity, 5, 0, 100, placement::tagOpacity, true, placement::resetOpacity);
		addStepper("Icon", iconOpacity + "%", iconOpacity, 5, 0, 100, placement::iconOpacity, true, placement::resetOpacity);
	}

	@Override
	protected void reopen() {
		show(new TagSettingsWindow(placement, title, back, removal, changes));
	}
}
